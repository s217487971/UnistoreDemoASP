using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace UnistoreWeb
{
    public partial class BookingInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["bookdate"] == null || Session["snum"] == null)
            {
                Response.Redirect("ExperimentalBooking.aspx");
            }
            nameLabel.Text = Session["sn"].ToString();
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string splCommand1 = "SELECT Booking.TrackingNum, Booking.UnitNum, StorageUnit.UnitSize, Campus.cumpusName, Building.BuildName, UnitSize.Dimension, UnitSize.Fee FROM ((((Booking INNER JOIN StorageUnit ON Booking.UnitNum = StorageUnit.UnitId) INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) INNER JOIN Building ON StorageUnit.BuilNum = Building.BuildingNum) INNER JOIN Campus ON Building.CampusID = Campus.cumpusId) WHERE Booking.StudNum = @sn";
            OleDbCommand cm1 = new OleDbCommand(splCommand1, dbCon);
            cm1.Parameters.AddWithValue("@sn", Session["snum"]);
            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;
            DataSet userSet = new DataSet();
            info.Fill(userSet);
            if (userSet.Tables[0].Rows.Count > 0)
            {
                dbCon.Open();
                using (OleDbDataReader reader = cm1.ExecuteReader())
                {
                    reader.Read();
                    Label4.Text = (reader.GetInt32(0)).ToString();  //Tracking Number
                    Label1n.Text = Session["bookdate"].ToString();   //DateBooked
                    Label6.Text = reader.GetInt32(1).ToString();   //UnitID
                    Label8.Text = reader.GetString(2);   //uNIT Size
                    Label10.Text = reader.GetString(4);  //Building 
                    Label15.Text = reader.GetString(5);  //Dimensions
                    Label12.Text = reader.GetDecimal(6).ToString();  //price
                    Label17.Text = reader.GetString(3);//Campus
                }
                dbCon.Close();
            }
            Session["bookdate"] = null;
        }
    }
}