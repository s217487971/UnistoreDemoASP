using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Security;
using System.Data;

namespace UnistoreWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["admin"] = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string splCommand1 = "SELECT * from [Student] where [Email]=@email AND [Password]=@password";
            string splCommand2 = "SELECT * from [StorageManager] where [Email]=@email AND [Password]=@password";

            OleDbCommand cm1 = new OleDbCommand(splCommand1, dbCon);
            OleDbCommand cm2 = new OleDbCommand(splCommand2, dbCon);

             


            cm1.Parameters.AddWithValue("@email", email.Text);
            cm1.Parameters.AddWithValue("@password", password.Text);
            
            cm2.Parameters.AddWithValue("@email", email.Text);
            cm2.Parameters.AddWithValue("@password", password.Text);

           


            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1; 
            OleDbDataAdapter info2 = new OleDbDataAdapter();
            info2.SelectCommand = cm2;

            DataSet userSet = new DataSet();
            info.Fill(userSet);



            DataSet userSet2 = new DataSet();
            info2.Fill(userSet2);

            if (userSet.Tables[0].Rows.Count > 0)
            {
               FormsAuthentication.RedirectFromLoginPage(email.Text, true);// true=cookies must keep the login details
                Session["admin"] = "2";

                dbCon.Open();

                using (OleDbDataReader reader = cm1.ExecuteReader())
                {
                    reader.Read();
                    Session["sn"] = reader.GetString(1)+" "+reader.GetString(2)+", "+reader.GetString(0);

                    Session["name"] = reader.GetString(1);

                    Session["snum"] = reader.GetString(0);

                }
                dbCon.Close();


                Response.Redirect("Home.aspx");
            }

            else if (userSet2.Tables[0].Rows.Count > 0)
            {
                Session["admin"] = "1";

                dbCon.Open();

                using (OleDbDataReader reader = cm2.ExecuteReader())
                {
                    reader.Read();
                    Session["ad"] = reader.GetString(1) + " " + reader.GetString(2) + ", " + reader.GetString(0);

                   

                }
                dbCon.Close();

                Response.Redirect("Home.aspx");
               
            }
            else
            {
                feedback.Text = "Invalid username and/ password";
            }
            
        }
    }
}