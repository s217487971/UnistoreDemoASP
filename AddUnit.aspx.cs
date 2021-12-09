using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace UnistoreWeb
{
    public partial class AddUnit : System.Web.UI.Page
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

                string sqlCom = "INSERT into [StorageUnit] ([UnitSize], [BuilNum], [Available]) VALUES (@us,@bn,@a)";
                OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
                dbCom.Parameters.AddWithValue("@us", size.Text);
                dbCom.Parameters.AddWithValue("@bn", int.Parse(build.Text));
                dbCom.Parameters.AddWithValue("@a",available.Checked );
               


                OleDbDataAdapter adapter = new OleDbDataAdapter();
                dbCon.Open();
                int number = dbCom.ExecuteNonQuery();
                dbCon.Close();

                if (number == 1)
                {
                    fb.Text= "Unit successfully saved";
                }
            }
            }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Storage.aspx");

        }
    }
}