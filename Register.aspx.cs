using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Security;
using System.Data;

namespace UnistoreWeb
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);
                string sqlCom = "INSERT into [Student] ([StudNum], [StudFname], [StudLname], [Email], [CellPhone],[Password]) VALUES (@s,@fn,@ln,@e,@c,@p)";
                OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
                dbCom.Parameters.AddWithValue("@s", studNum.Text);
                dbCom.Parameters.AddWithValue("@fn", name.Text);
                dbCom.Parameters.AddWithValue("@ln", surname.Text);
                dbCom.Parameters.AddWithValue("@e",email.Text);
                dbCom.Parameters.AddWithValue("@c", cell.Text);
                dbCom.Parameters.AddWithValue("@p", password.Text);

                string splCommand1 = "SELECT * from [Student] where [StudNum]=@s";
              
                OleDbCommand cm = new OleDbCommand(splCommand1, dbCon);
                cm.Parameters.AddWithValue("@s", studNum.Text);

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                if (userSet.Tables[0].Rows.Count > 0)
                {
                    fd.Text = " Student number already exists";
                }
                else {
                    OleDbDataAdapter adapter = new OleDbDataAdapter();
                    dbCon.Open();
                    int number = dbCom.ExecuteNonQuery();
                    dbCon.Close();

                    if (number == 1)
                    {
                       
                        Session["sn"] = name.Text + " " + surname.Text + ", " + studNum.Text ;
                        Session["admin"] = "2";
                        Session["snum"] = studNum.Text;
                        Response.Redirect("Home.aspx");
                        
                    }

                }




            }
        }

        protected void studNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}