using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.Admin
{
    public partial class Create_acc : System.Web.UI.Page
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
            int dv = Int16.Parse(ASPxComboBox1.SelectedItem.Value.ToString());
            int ro = Int16.Parse(ASPxComboBox2.SelectedItem.Value.ToString());
            try
            {
                ad.insertAcc(dv, ASPxTextBox1.Text, ASPxTextBox2.Text, ASPxTextBox3.Text, ASPxTextBox4.Text, ro);
                ASPxGridView1.DataBind();
                Label2.Text = "Cập nhật thành công ";
            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }
    }
}