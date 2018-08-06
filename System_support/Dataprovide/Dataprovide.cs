using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace System_support
{
    public class Dataprovide
    {
        private static String connectionString = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        private static SqlConnection con;
        private static SqlCommand cm;
        private static SqlDataReader dr;



        public  string ConnectionString
        {
            get { return Dataprovide.connectionString; }
            set { Dataprovide.connectionString = value; }
        }

        public Int32 getIntegerNumber(String query)
        {
            Int32 result = 0;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();

                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataReader dr = cm.ExecuteReader(CommandBehavior.SingleResult);
                while (dr.Read())
                {
                    try
                    {
                        result = Int32.Parse(dr[0].ToString());
                    }
                    catch (System.Exception ex)
                    {

                    }
                }
                conn.Close();
                conn.Dispose();
                cm.Dispose();
                return result;
            }

        }
        public string getString(String query)
        {
            string result = "";
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                SqlDataReader dr = cm.ExecuteReader(CommandBehavior.SingleResult);
                try
                {
                    while (dr.Read())
                    {
                        result = dr[0].ToString();
                    }
                    conn.Close();
                    conn.Dispose();
                    cm.Dispose();
                    return result;
                }
                catch
                {
                    conn.Close();
                    conn.Dispose();
                    cm.Dispose();
                    return result;
                }
            }
        }

        public  DataSet getDataSet(String query)
        {
            DataSet ds = new DataSet();
            con = new SqlConnection(ConnectionString);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(ds/*, query.Split(' ')[3]*/);
            con.Close();
            con.Dispose();
            return ds;
        }

        public  void change(String query)
        {
            con = new SqlConnection(ConnectionString);
            cm = new SqlCommand(query, con);
            con.Open();
            cm.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            cm.Dispose();


        }
    }
}