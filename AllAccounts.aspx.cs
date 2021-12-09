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
    public partial class AllAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String text = TrackingNum.Text;

            String sql = "SELECT [StudNum], [StudFname], [StudLname], " +
                "[Email], [CellPhone] FROM [Student] where [StudNum]=@s";

            if (!text.Equals(""))
            {


                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

                cm1.Parameters.AddWithValue("@s", text);

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);
                if (userSet.Tables[0].Rows.Count > 0)
                {
                    Accounts.DataSourceID = null;
                    Accounts.DataSource = userSet;
                    Accounts.DataBind();
                    feedback.Text = "";

                }
                else feedback.Text = "Student number " + text + " does not exist";

            }
            else feedback.Text = "Enter number";

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            String sql = "SELECT [StudNum], [StudFname], [StudLname], " +
                "[Email], [CellPhone] FROM [Student]";


            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

           

            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;

            DataSet userSet = new DataSet();
            info.Fill(userSet);
            if (userSet.Tables[0].Rows.Count > 0)
            {
                Accounts.DataSourceID = null;
                Accounts.DataSource = userSet;
                Accounts.DataBind();
                feedback.Text = "";
                TrackingNum.Text = "";

            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Management.aspx");

        }
    }
}