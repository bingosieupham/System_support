using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.Admin
{
    public partial class Create_project : System.Web.UI.Page
    {
        Admin_system ad = new Admin_system();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Contents["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string user1 = Session.Contents["id_nv"].ToString();
            try
            {
                ad.insertproject(ASPxTextBox1.Text, ASPxTextBox1.Text, user1);
                ASPxGridView1.DataBind();
                Label2.Text = "Cập nhật thành công ";
                ASPxTextBox1.Text = "";
                ASPxTextBox1.Text = "";
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }
    }
}