using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System_support.Suporter
{
    public partial class Baocao : System.Web.UI.Page
    {
        Support sp = new Support();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = sp.Baocao_tong( ASPxDateEdit1.Text, ASPxDateEdit2.Text);
            ASPxGridView1.DataSource = ds;
            ASPxGridView1.DataBind();
        }
    }
}