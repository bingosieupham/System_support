using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.EndUser
{
    
    public partial class Hotro : System.Web.UI.Page
    {
        End_user end = new End_user();
        Dataprovide provide = new Dataprovide();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Contents["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {    
                hdffile.Value = "";
                ASPxGridView2.DataBind();
                ASPxGridView4.DataBind();
               // ASPxGridView2.DetailRows.ExpandAllRows();
               // ASPxGridView4.DetailRows.ExpandAllRows();
            }
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            string UploadDirectory = "~/file/";
            string resultExtension = Path.GetExtension(e.UploadedFile.FileName);
            string resultName = Path.GetFileName(e.UploadedFile.FileName);
            string resultFileName = Path.ChangeExtension(Path.GetRandomFileName() + "_" + resultName, resultExtension);
            string resultFileUrl = UploadDirectory + resultFileName;
            string resultFilePath = MapPath(resultFileUrl);
            e.UploadedFile.SaveAs(resultFilePath);
            string abc = e.UploadedFile.FileName;
            if (e.IsValid)
                e.CallbackData = resultFileName;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id_dv = Int32.Parse(Session.Contents["donvi"].ToString());
            int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());
            string tenfile = hdffile.Value.ToString();
            try
            {
                if ((ASPxTextBox1.Text != null) || (ASPxMemo1.Text != null))
                {
                    end.insertIsssue(ASPxTextBox1.Text, ASPxMemo1.Text, id_dv, id_nv, tenfile);
                    Label2.Text = "Cập nhật thành công";
                    ASPxGridView1.DataBind();
                    ASPxTextBox1.Text = "";
                    ASPxMemo1.Text = "";
                    hdffile.Value = "";
                }
                else
                {
                    Label2.Text = "Cần điền đầy đủ các thông tin";
                }
            }
            catch (Exception ex)
            {
                Label2.Text = "Lỗi hệ thống " + ex.ToString();
            }
        }

        protected void ASPxGridView4_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource5.DataBind();
            ASPxGridView4.DataBind();
        }

        protected void ASPxGridView5_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxCallbackPanel2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            var args = e.Parameter.Split('|');
            int ID_deatil = Int32.Parse(hdfmaquanly1.Value.ToString());
            int id = Int16.Parse(Session.Contents["ID"].ToString());
            switch (args[0].ToString())
            {
                case "LOAD_EDIT":
                    string sql1 = "select * from ND_detail_Issues where  ID_detail =" + ID_deatil + " and Status=0";
                    string sql = "select * from ND_Issues where  ID =" + id + "";
                    DataSet ds = provide.getDataSet(sql);
                    DataTable dt = ds.Tables[0];
                    DataSet ds1 = provide.getDataSet(sql1);
                    DataTable dt1 = ds1.Tables[0];
                    ASPxLabel1.Text = dt.Rows[0]["Title_issue"].ToString();
                    ASPxLabel2.Text = dt.Rows[0]["Content_issue"].ToString();
                    ASPxLabel3.Text = dt1.Rows[0]["Info_process"].ToString();
                    ASPxMemo6.Text = dt1.Rows[0]["Reply_process"].ToString();

                    break;
                case "SAVE_EDIT":
                    try
                    {
                        int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());
                        end.updateProcess_detailIsseus(id, id_nv, ASPxMemo6.Text, ID_deatil);
                        ASPxCallbackPanel2.JSProperties["cpKhang"] = "1";
                    }
                    catch (Exception ex1)
                    {
                        ASPxCallbackPanel2.JSProperties["cpKhang"] = "0";
                    }
                    break;
            }
        }
        protected void ASPxGridView2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource3.DataBind();
            ASPxGridView2.DataBind();
        }

        protected void ASPxGridView12_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView12_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource3.DataBind();
            ASPxGridView2.DataBind();
        }

        protected void ASPxGridView13_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource13.DataBind();
            ASPxGridView13.DataBind();
        }
    }
}