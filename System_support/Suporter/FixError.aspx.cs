using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress;

namespace System_support.Suporter
{
    public partial class FixError : System.Web.UI.Page
    {
        Dataprovide provide = new Dataprovide();
        Support sp = new Support();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Contents["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
          //  GridViewFeaturesHelper.SetupGlobalGridViewBehavior(ASPxGridView1);
            if (!IsPostBack)
            {
                hdfmaquanly.Value = "0";
                hdfmaquanly1.Value = "0";
                ASPxGridView1.DataBind();
               // ASPxGridView1.DetailRows.ExpandRow(0);
                ASPxGridView3.DataBind();
              //  ASPxGridView3.DetailRows.ExpandAllRows();
                ASPxGridView5.DataBind();
             //   ASPxGridView5.DetailRows.ExpandAllRows();
            }
        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            var args = e.Parameter.Split('|');
            int ID = Int32.Parse(hdfmaquanly.Value.ToString());
            int check = sp.count_Issue(ID);
            int check1 = sp.count_Issue1(ID);
            switch (args[0].ToString())
            {

                case "LOAD_EDIT":
                    string sql = "select * from ND_Issues where  ID =" + ID + "";
                    DataSet ds = provide.getDataSet(sql);
                    DataTable dt = ds.Tables[0];
                    ASPxTextBox1.Text = dt.Rows[0]["Title_issue"].ToString();
                    ASPxMemo3.Text = dt.Rows[0]["Content_issue"].ToString();
                    ASPxComboBox1.Value = dt.Rows[0]["ID_Project"].ToString();
                    ASPxComboBox2.Value = dt.Rows[0]["id_module"].ToString();
                    ASPxComboBox4.Value = dt.Rows[0]["id_level"].ToString();
                    ASPxComboBox5.Value = dt.Rows[0]["ID_st"].ToString();
                    ASPxComboBox6.Value = dt.Rows[0]["id_class"].ToString();

                    if (check != 0)
                    {
                        ASPxTextBox1.Enabled = false;
                        ASPxMemo3.Enabled = false;
                        ASPxComboBox1.Enabled = false;
                        ASPxComboBox2.Enabled = false;
                        ASPxComboBox4.Enabled = false;
                        ASPxComboBox6.Enabled = false;
                    }
                    else
                    {
                        ASPxTextBox1.Enabled = true;
                        ASPxMemo3.Enabled = true;
                        ASPxComboBox1.Enabled = true;
                        ASPxComboBox2.Enabled = true;
                        ASPxComboBox4.Enabled = true;
                        ASPxComboBox5.Enabled = true;

                    }
                    break;
                case "SAVE_EDIT":
                    try
                    {
                        int id_project = Int32.Parse(ASPxComboBox1.SelectedItem.Value.ToString());
                        int id_module = Int32.Parse(ASPxComboBox2.SelectedItem.Value.ToString());
                        int id_class = Int32.Parse(ASPxComboBox6.SelectedItem.Value.ToString());
                        int id_level = Int32.Parse(ASPxComboBox4.SelectedItem.Value.ToString());
                        int ID_status = Int32.Parse(ASPxComboBox5.SelectedItem.Value.ToString());
                        int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());

                        if (check == 0)
                        {
                            if ((ID_status == 4) || (ID_status == 8))
                            {
                                sp.insertProcess_end(ID, ASPxTextBox1.Text, ASPxMemo3.Text, id_project, id_module, id_class, ID_status, id_level, id_nv, ASPxMemo1.Text, ASPxMemo2.Text);
                                ASPxCallbackPanel1.JSProperties["cpKhang"] = "1";
                            }
                            else
                            {
                                sp.insertProcess(ID, ASPxTextBox1.Text, ASPxMemo3.Text, id_project, id_module, id_class, ID_status, id_level, id_nv, ASPxMemo1.Text, ASPxMemo2.Text);
                                ASPxCallbackPanel1.JSProperties["cpKhang"] = "1";
                            }
                        }
                        else
                        {
                            if (check1 == 0)
                            {
                                if ((ID_status == 4) || (ID_status == 8))
                                {
                                    sp.insertProcess_detailIsseus_end(ID, id_nv, ASPxMemo1.Text, ASPxMemo2.Text, ID_status);
                                    ASPxCallbackPanel1.JSProperties["cpKhang"] = "1";
                                }
                                else
                                {
                                    sp.insertProcess_detailIsseus(ID, id_nv, ASPxMemo1.Text, ASPxMemo2.Text, ID_status);
                                    ASPxCallbackPanel1.JSProperties["cpKhang"] = "1";
                                }
                            }
                            else
                            {
                                ASPxCallbackPanel1.JSProperties["cpKhang"] = "2";
                            }
                        }

                    }
                    catch (Exception ex1)
                    {
                        ASPxCallbackPanel1.JSProperties["cpKhang"] = "0";
                    }
                    break;
            }
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource1.DataBind();
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ID_is"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            string a = Session.Contents["ID_is"].ToString();

        }

        protected void ASPxGridView2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource1.DataBind();
            ASPxGridView1.DataBind();
            SqlDataSource13.DataBind();
            ASPxGridView3.DataBind();
            SqlDataSource15.DataBind();
            ASPxGridView5.DataBind();
            SqlDataSource8.DataBind();
            ASPxGridView7.DataBind();
        }

        protected void ASPxCallbackPanel2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            var args = e.Parameter.Split('|');
            int ID_deatil = Int32.Parse(hdfmaquanly1.Value.ToString());
            int id = Int16.Parse(Session.Contents["ID_is"].ToString());
            
            //int ID_deatil = sp.getID_detail(id);
            switch (args[0].ToString())
            {
                case "LOAD_EDIT":
                    string sql1 = "select * from ND_detail_Issues where  ID_detail =" + ID_deatil + " and Status=0";
                    string sql = "select * from ND_Issues where  ID =" + id + "";
                    DataSet ds = provide.getDataSet(sql);
                    DataTable dt = ds.Tables[0];
                    DataSet ds1= provide.getDataSet(sql1);
                    DataTable dt1 = ds1.Tables[0];
                    ASPxLabel1.Text= dt.Rows[0]["Title_issue"].ToString();
                    ASPxLabel2.Text = dt.Rows[0]["Content_issue"].ToString();
                    ASPxLabel3.Text = dt1.Rows[0]["Info_process"].ToString();
                    ASPxMemo6.Text = dt1.Rows[0]["Reply_process"].ToString();
                    ASPxComboBox7.Value = dt1.Rows[0]["ID_st"].ToString();
                    break;
                case "SAVE_EDIT":
                    try
                    {
                        int id_stt1 = Int32.Parse(ASPxComboBox7.SelectedItem.Value.ToString());
                        int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());
                        sp.updateProcess_detailIsseus(id, id_nv, ASPxMemo6.Text, ID_deatil,ASPxMemo5.Text,ASPxMemo4.Text,id_stt1);
                        ASPxCallbackPanel2.JSProperties["cpKhang"] = "1";
                    }
                    catch (Exception ex1)
                    {
                        ASPxCallbackPanel2.JSProperties["cpKhang"] = "0";
                    }
                    break;
            }
        }

        protected void ASPxGridView3_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource13.DataBind();
            ASPxGridView3.DataBind();
        }

        protected void ASPxGridView5_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource15.DataBind();
            ASPxGridView5.DataBind();
        }

        protected void ASPxGridView7_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            SqlDataSource8.DataBind();
            ASPxGridView7.DataBind();
        }

      


        //protected void ASPxCallbackPanel4_Callback(object sender, CallbackEventArgsBase e)
        //{
        //    var args = e.Parameter.Split('|');
        //    switch (args[0].ToString())
        //    {
        //        case "SAVE_NEW":
        //            try
        //            {
        //                int id_nv = Int32.Parse(Session.Contents["id_nv"].ToString());
        //                string tieude = ASPxTextBox3.Text;
        //                string noidung = ASPxMemo5.Text;
        //                int id_project = Int32.Parse(ASPxComboBox14.SelectedItem.Value.ToString());
        //                int id_module = Int32.Parse(ASPxComboBox15.SelectedItem.Value.ToString());
        //                int id_class = Int32.Parse(ASPxComboBox16.SelectedItem.Value.ToString());
        //                int id_level = Int32.Parse(ASPxComboBox17.SelectedItem.Value.ToString());
        //                int id_donvi = Int32.Parse(ASPxComboBox13.SelectedItem.Value.ToString());
        //                int id_dv = Int32.Parse(Session.Contents["donvi"].ToString());
        //                int ID_status = 1;
        //                sp.insertIsssue_suport(tieude, noidung, id_donvi, id_nv, null, id_project, id_module, id_class, id_level, ID_status);
        //                ASPxCallbackPanel2.JSProperties["cpKhang"] = "1";
        //            }
        //            catch (Exception ex1)
        //            {
        //                ASPxCallbackPanel2.JSProperties["cpKhang"] = "0";
        //            }
        //            break;
        //    }
        //}

    }
}