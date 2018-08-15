using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace System_support
{
    public class Support
    {
        private static String connectionString = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        private static SqlConnection con; 

        Dataprovide data = new Dataprovide();
        public void insertProcess(int ID ,string Title_issue,string Content_issue, int ID_Project, int ID_module, int ID_class, int ID_st, int ID_level, int Executors,string Info_process,string Reply_process )
        {

            data.change("UPDATE [dbo].[ND_Issues] SET [Title_issue] = N'"+Title_issue+"' ,[Content_issue] = N'"+Content_issue+"' ,[ID_Project] = "+ID_Project+" ,[ID_module] = "+ID_module+" ,[ID_class] = "+ID_class+" ,[ID_st] = "+ID_st+" ,[ID_level] = "+ID_level+" ,[Executors] ="+Executors+" WHERE ID="+ID+"");
            data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status) VALUES (" + ID+" ,N'"+Info_process+"' ,N'"+Reply_process+"',"+Executors+" ,getdate(),"+ID_st+",0) ");
        }

        public void insertProcess_end(int ID, string Title_issue, string Content_issue, int ID_Project, int ID_module, int ID_class, int ID_st, int ID_level, int Executors, string Info_process, string Reply_process)
        {

            data.change("UPDATE [dbo].[ND_Issues] SET [Title_issue] = N'" + Title_issue + "' ,[Content_issue] = N'" + Content_issue + "' ,[ID_Project] = " + ID_Project + " ,[ID_module] = " + ID_module + " ,[ID_class] = " + ID_class + " ,[ID_st] = " + ID_st + " ,[ID_level] = " + ID_level + " ,[Executors] =" + Executors + " WHERE ID=" + ID + "");
            data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status,User_update,[update_date]) VALUES (" + ID + " ,N'" + Info_process + "' ,N'" + Reply_process + "'," + Executors + " ,getdate()," + ID_st + ",1," + Executors + ",getdate()) ");
        }

        public void insertProcess_detailIsseus(int ID,  int Executors, string Info_process, string Reply_process, int ID_st)
        {
            data.change("UPDATE [dbo].[ND_Issues] SET [ID_st] = " + ID_st + " ,[Executors] =" + Executors + " WHERE ID=" + ID + "");
            data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status) VALUES (" + ID + " ,N'" + Info_process + "' ,N'" + Reply_process + "'," + Executors + " ,getdate()," + ID_st + ",0) ");
        }

        public void insertProcess_detailIsseus_end(int ID, int Executors, string Info_process, string Reply_process, int ID_st)
        {
            data.change("UPDATE [dbo].[ND_Issues] SET [ID_st] = " + ID_st + " ,[Executors] =" + Executors + ", Resolution_date=getdate() WHERE ID=" + ID + "");
            data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status,User_update,[update_date]) VALUES (" + ID + " ,N'" + Info_process + "' ,N'" + Reply_process + "'," + Executors + " ,getdate()," + ID_st + ",1,"+Executors+",getdate()) ");
        }
        public int  count_Issue(int id)
        {
            int a = 0;
           return a = data.getIntegerNumber("select count(*) from ND_detail_Issues where ID=" + id + "");
        }

        public int count_Issue1(int id)
        {
            int a = 0;
            return a = data.getIntegerNumber("select count(*) from ND_detail_Issues where ID=" + id + " and Status =0");
        }
        public void updateProcess_detailIsseus(int ID, int Executors, string Reply_process, int ID_detail, string Info_process1, string Reply_process1, int ID_st1)
        {
            if ((ID_st1 == 4) || (ID_st1 == 8))
                {
                data.change("UPDATE [dbo].[ND_Issues] SET [ID_st] = " + ID_st1 + " ,[Executors] =" + Executors + ", Resolution_date=getdate() WHERE ID=" + ID + "");
                data.change("UPDATE [dbo].[ND_detail_Issues] SET [Reply_process] = N'" + Reply_process + "' ,[Status] = 1 ,[User_update] = " + Executors + " ,[update_date] = getdate() WHERE ID_detail =" + ID_detail + " ");
                data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status,User_update,[update_date]) VALUES (" + ID + " ,N'" + Info_process1 + "' ,N'" + Reply_process1 + "'," + Executors + " ,getdate()," + ID_st1 + ",1," + Executors + ",getdate()) ");

            }
            else
            {
                if (ID_st1 == 0)
                {
                    data.change("UPDATE [dbo].[ND_Issues] SET [Executors] =" + Executors + " WHERE ID=" + ID + "");
                    data.change("UPDATE [dbo].[ND_detail_Issues] SET [Reply_process] = N'" + Reply_process + "' ,[Status] = 1 ,[User_update] = " + Executors + " ,[update_date] = getdate() WHERE ID_detail =" + ID_detail + " ");
                }
                else
                {
                    data.change("UPDATE [dbo].[ND_Issues] SET [ID_st] = " + ID_st1 + " ,[Executors] =" + Executors + " WHERE ID=" + ID + "");
                    data.change("UPDATE [dbo].[ND_detail_Issues] SET [Reply_process] = N'" + Reply_process + "' ,[Status] = 1 ,[User_update] = " + Executors + " ,[update_date] = getdate() WHERE ID_detail =" + ID_detail + " ");
                    data.change("INSERT INTO [dbo].[ND_detail_Issues] ([ID] ,[Info_process] ,[Reply_process] ,[User_reciever] ,[Create_date] ,ID_st,status) VALUES (" + ID + " ,N'" + Info_process1 + "' ,N'" + Reply_process1 + "'," + Executors + " ,getdate()," + ID_st1 + ",0) ");
                }
            }
        }

        public int  getID_detail(int ID)
        {
            int a = data.getIntegerNumber("select max(ID_detail) from ND_detail_Issues where id = "+ID+"");
            return a;
          
        }

        public void insertIsssue_suport(string Title_issue, string Content_issue, int ID_dv, int User_create, string TenFile, int id_project, int id_module, int id_class,int id_level,int ID_st)
        {

            string sql = "INSERT INTO [dbo].[ND_Issues] ([Title_issue] ,[Content_issue] ,[ID_dv] ,[Created_date] ,[User_create] ,[TenFile],[ID_st],[ID_Project],[ID_module]";
            sql += ",[ID_class],[ID_level],[Executors]) VALUES (N'" + Title_issue + "',N'" + Content_issue + "'," + ID_dv + ",getdate()," + User_create + ",N'" + TenFile + "',"+ID_st+","+id_project+","+id_module+","+id_class+","+id_level+ ","+ User_create + ")";
            data.change(sql);

        }
        public DataSet Baocao_tong( string tungay, string denngay)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd12 = new SqlCommand();
                cmd12.Connection = conn;
                cmd12.CommandType = CommandType.StoredProcedure;
                cmd12.CommandTimeout = 50;
                cmd12.CommandText = "[Bao_cao_tonghop]";
                cmd12.Parameters.Clear();
                cmd12.Parameters.Add("@tungay", tungay);
                cmd12.Parameters.Add("@denngay", denngay);
                SqlDataAdapter damp2 = new SqlDataAdapter(cmd12);
                DataSet ds1 = new DataSet();
                damp2.Fill(ds1);
                conn.Close();
                conn.Dispose();
                return ds1;
            }
        }
    }
}