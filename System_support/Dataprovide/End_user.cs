using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace System_support
{
   
    public class End_user
    {
        Dataprovide data = new Dataprovide();
        public void insertIsssue(string Title_issue, string Content_issue, int ID_dv, int User_create, string TenFile)
        {
            
                data.change("INSERT INTO [dbo].[ND_Issues] ([Title_issue] ,[Content_issue] ,[ID_dv] ,[Created_date] ,[User_create] ,[TenFile],[ID_st]) VALUES (N'" + Title_issue+"',N'"+Content_issue+"',"+ID_dv+",getdate(),"+User_create+",N'"+TenFile+"',1)");
          
        }
        public void updateProcess_detailIsseus(int ID, int Executors, string Reply_process, int ID_detail)
        {
            data.change("UPDATE [dbo].[ND_Issues] SET [ID_st] = 9, [Executors] =" + Executors + " WHERE ID=" + ID + "");
            data.change("UPDATE [dbo].[ND_detail_Issues] SET [Reply_process] = N'" + Reply_process + "' ,[Status] = 1 ,[User_update] = " + Executors + " ,[update_date] = getdate() WHERE ID_detail =" + ID_detail + " ");
        }
    }
}