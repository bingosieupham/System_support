using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support
{
    public partial class Login : System.Web.UI.Page
    {
        Dataprovide dtprovide = new Dataprovide();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string username = username1.Value.ToUpper();
                string mk = password1.Value;
                Session.Add("username", username);
                DataSet ds = dtprovide.getDataSet("select * from User_login where upper(User_name) = upper('" + username + "') and upper(pass) = upper('" + mk + "') ");
                if (ds.Tables[0].Rows.Count == 1)
                {
                    string madonvi = ds.Tables[0].Rows[0]["id_dv"].ToString();
                    string fullname = ds.Tables[0].Rows[0]["Full_name"].ToString();
                    int quyen = Int16.Parse(ds.Tables[0].Rows[0]["role"].ToString());
                    int id_nv = Int16.Parse(ds.Tables[0].Rows[0]["ID_nv"].ToString());
                    Session.Add("donvi", madonvi);
                    Session.Add("QuyenID", quyen);
                    Session.Add("fullname", fullname);
                    Session.Add("id_nv", id_nv);

                    if (quyen == 1)
                    {
                        Response.Redirect("~/Admin/Create_acc.aspx", false);
                    }
                    else
                    {
                        if (quyen == 2)
                        {
                            Response.Redirect("~/EndUser/Hotro.aspx", false);
                        }
                        else
                        {
                            if (quyen == 3)
                            {
                                Response.Redirect("~/Suporter/FixError.aspx", false);
                            }

                        }
                    }
                }
                else
                {
                    Label1.Text = "Sai mật khẩu hoặc tên đang nhập";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Lỗi hệ thống ";
            }
        }
    }
}