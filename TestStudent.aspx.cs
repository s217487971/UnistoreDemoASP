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
    public partial class TestStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void studentData_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            OleDbCommand cm1 = new OleDbCommand("SELECT * from[Student] where[StudNum] = @sn", dbCon);

            cm1.Parameters.AddWithValue("@sn", (String)Session["snum"]);

            dbCon.Open();
            using (OleDbDataReader reader = cm1.ExecuteReader())
            {

                reader.Read();
                Session["sn"] = reader.GetString(1) + " " + reader.GetString(2) + ", " + reader.GetString(0);


            }

            dbCon.Close();
        }

        protected void booking_SelectedIndexChanged(object sender, EventArgs e)
        {
            String number = booking.Rows[booking.SelectedIndex].Cells[1].Text;
            String n = booking.Rows[booking.SelectedIndex].Cells[2].Text;
            Session["trr"] = number;
            Session["unitN"]=n;
            Response.Redirect("TestView.aspx");
        }
    }
}