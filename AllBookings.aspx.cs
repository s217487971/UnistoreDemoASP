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
    public partial class AllBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String text = TrackingNum.Text;
            String value = searchby.SelectedValue;
            String sql = "";
            String sb = "";


            if (!text.Equals(""))
            {


                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                DateTime date = DateTime.Now;
                String dat = date.ToString();


                if (value == "1")
                {
                    // student  nummber 
                    sql = "SELECT Booking.TrackingNum, Booking.UnitNum, Booking.StudNum, Booking.DateBooked, " +
                   "UnitSize.Fee, Booking.Paid, Booking.CheckInDate," +
                   " Booking.CheckOutDate, Booking.CancelledDate " +
                   "FROM((UnitSize INNER JOIN  StorageUnit ON UnitSize.UnitSize = StorageUnit.UnitSize) " +
                   "INNER JOIN  Booking ON StorageUnit.UnitId = Booking.UnitNum)" +
                   " where [StudNum]=@s";

                    sb= "Student number";

                }
                else
                {
                    // tracking number
                    sql = "SELECT Booking.TrackingNum, Booking.UnitNum, Booking.StudNum, Booking.DateBooked, " +
                   "UnitSize.Fee, Booking.Paid, Booking.CheckInDate," +
                   " Booking.CheckOutDate, Booking.CancelledDate " +
                   "FROM((UnitSize INNER JOIN  StorageUnit ON UnitSize.UnitSize = StorageUnit.UnitSize) " +
                   "INNER JOIN  Booking ON StorageUnit.UnitId = Booking.UnitNum)" +
                   " where [TrackingNum]=@t";

                    sb = "Tracking number";

                }

                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

                cm1.Parameters.AddWithValue("@s", text);

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);
                if (userSet.Tables[0].Rows.Count > 0)
                {
                    Bookings.DataSourceID = null;
                    Bookings.DataSource = userSet;
                    Bookings.DataBind();
                    feedback.Text = "";

                }
                else feedback.Text = sb+" "+ text + " does not exist";

            }
            else feedback.Text= "Enter number";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Management.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            String sql = "SELECT Booking.TrackingNum, Booking.UnitNum, Booking.StudNum, Booking.DateBooked, " +
                     "UnitSize.Fee, Booking.Paid, Booking.CheckInDate," +
                     " Booking.CheckOutDate, Booking.CancelledDate " +
                     "FROM((UnitSize INNER JOIN  StorageUnit ON UnitSize.UnitSize = StorageUnit.UnitSize) " +
                     "INNER JOIN  Booking ON StorageUnit.UnitId = Booking.UnitNum)";
                 

            OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;

            DataSet userSet = new DataSet();
            info.Fill(userSet);
            if (userSet.Tables[0].Rows.Count > 0)
            {
                Bookings.DataSourceID = null;
                Bookings.DataSource = userSet;
                Bookings.DataBind();

                TrackingNum.Text = "";
               
            }




        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cancellations.aspx");
        }
    }
}