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
using System.Web.UI.HtmlControls;
using System.Collections;

namespace UnistoreWeb
{
    public partial class TestView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String sql = "SELECT Booking.TrackingNum AS [Tracking number], Booking.DateBooked AS [Date booked], Booking.Paid, UnitSize.Fee, UnitSize.UnitSize AS [Unit size], UnitSize.Dimension, Building.BuildName AS Building, Campus.cumpusName AS Campus, Campus.Address, Booking.CheckInDate AS [Check in date], Booking.CheckInDate AS [Check out date] FROM ((((Campus INNER JOIN Building ON Campus.cumpusId = Building.CampusID) INNER JOIN StorageUnit ON Building.BuildingNum = StorageUnit.BuilNum) INNER JOIN Booking ON StorageUnit.UnitId = Booking.UnitNum) INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) WHERE (Booking.TrackingNum =@tr)";

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            OleDbCommand cm1 = new OleDbCommand(sql, dbCon);
            String uni = (String)Session["trr"];
            cm1.Parameters.AddWithValue("@tr", Convert.ToInt32(uni));
            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;

            DataSet userSet = new DataSet();
            info.Fill(userSet);
            if (userSet.Tables[0].Rows.Count > 0)
            {
                DetailsView1.DataSourceID = null;
                DetailsView1.DataSource = userSet;
                DetailsView1.DataBind();

            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestStudent.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
                int confirm = MakeUnAvailable((String)Session["trr"]);
                if (confirm == 1)
                {
                    int confirmx = MakeUnitAvailable((String)Session["unitN"]);
                    if (confirmx == 1)
                    {
                        Response.Redirect("CancelBooking.aspx");
                    }
                    if (confirmx == 0)
                    {
                        ////Label1.Visible = true;
                        ////Label1.Text = "Cancel Failed, Could not Release Unit";
                        
                    }
                }
                if (confirm == 0)
                {
                    //Label1.Visible = true;
                    //Label1.Text = "Cancel Failed, Could Update Booking information";
                }

        }


        public int MakeUnAvailable(string unitid)
        {
            int number = 0;
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE Booking SET CancelledDate = @td, Cancelled = true WHERE ([TrackingNum] = " + int.Parse(unitid) + ")";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@td", DateTime.Today);
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }
        public int MakeUnitAvailable(string unitid)
        {
            int number = 0;
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE StorageUnit SET Available = true WHERE ([UnitId] = @cc)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@cc", int.Parse(unitid));
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }

    }
}