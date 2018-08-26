using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace System_support
{
    public class Admin_system
    {
        Dataprovide data = new Dataprovide();
        public void insertAcc(int ID_dv, string User_name, string Pass, string Full_name, string Phone, int Role )
        {

            data.change("INSERT INTO [dbo].[User_login] ([ID_dv] ,[User_name] ,[Pass] ,[Full_name] ,[Phone] ,[Role] ,[Status],[Create_date]) VALUES (" + ID_dv+" ,N'"+User_name+"' , N'"+Pass+"',N'"+Full_name+"' ,'"+Phone+"' ,"+Role+" ,1,getdate())");
        }

        public void insertdonvi(string ma_dvi, string ten_dv, string phone, string email, string user, string diachi)
        {

            data.change("INSERT INTO [dbo].[DM_donvi] ([Ma_dv] ,[Ten_dv],[Diachi] ,[Dienthoai_dv] ,[Email] ,[Status] ,[Ngay_tao] ,User_tao) VALUES ('" + ma_dvi+"' ,N'"+ten_dv+"',N'"+diachi+"' ,'"+phone+"' ,'"+email+"' ,1 ,getdate() ,'"+user+"')");
        }

        public void insertproject(string Code_project, string Name_project, string User_create)
        {

            data.change("INSERT INTO [dbo].[DM_project] ([Code_project] ,[Name_project] ,[Status_project] ,[User_create] ,[Create_date]) VALUES (N'"+Code_project+"' ,N'"+Name_project+"' ,1 ,'"+User_create+"' ,getdate() )");
        }
    }
}