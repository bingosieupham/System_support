using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.Suporter
{
    
    public partial class Hotro1 : System.Web.UI.Page
    {
        Support sp = new Support();
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
           // int id_dv = Int32.Parse(Session.Contents["donvi"].ToString());
            int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());

            int id_project = Int32.Parse(ASPxComboBox1.SelectedItem.Value.ToString());
            int id_module = Int32.Parse(ASPxComboBox2.SelectedItem.Value.ToString());
            int id_class = Int32.Parse(ASPxComboBox3.SelectedItem.Value.ToString());
            int id_level = Int32.Parse(ASPxComboBox4.SelectedItem.Value.ToString());
            int id_stt = Int32.Parse(ASPxComboBox5.SelectedItem.Value.ToString());
            int id_donvi = Int32.Parse(ASPxComboBox6.SelectedItem.Value.ToString());
            string tenfile = hdffile.Value.ToString();
            string tieude = ASPxTextBox1.Text;
            string noidung = ASPxMemo1.Text;
            try
            {
                if ((ASPxTextBox1.Text != null) || (ASPxMemo1.Text != null))
                {
                    sp.insertIsssue_suport(tieude,noidung,id_donvi,id_nv,tenfile,id_project,id_module,id_class,id_level,id_stt);
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
    }
}