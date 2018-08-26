using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.Admin
{
    public partial class Create_donvi : System.Web.UI.Page
    {
        Admin_system ad = new Admin_system();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Contents["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            Label2.Text = "";
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string user = Session.Contents["id_nv"].ToString();
            try
            {
                ad.insertdonvi(ASPxTextBox3.Text, ASPxTextBox1.Text, ASPxTextBox3.Text, ASPxTextBox4.Text,user,ASPxMemo1.Text);
                ASPxGridView1.DataBind();
                Label2.Text = "Cập nhật thành công ";
                ASPxTextBox1.Text = "";
                ASPxTextBox3.Text = "";
                ASPxTextBox3.Text = "";
                ASPxTextBox4.Text = "";
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }
    }
}