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
    public partial class StudentAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            OleDbCommand cm1 = new OleDbCommand("SELECT * from[Student] where[StudNum] = @sn", dbCon);

            cm1.Parameters.AddWithValue("@sn", (String)Session["snum"]);

            dbCon.Open();
            using (OleDbDataReader reader = cm1.ExecuteReader())
            {

                reader.Read();
                studentNum.Text = reader.GetString(0);
                name.Text = reader.GetString(1);
                surname.Text = reader.GetString(2);
                email.Text = reader.GetString(3);
                cell.Text = reader.GetString(4);
                password.Text = reader.GetString(5);
                confirmpassword.Text = reader.GetString(5);

            }

            dbCon.Close();



        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }
    }
}