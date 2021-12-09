using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

namespace UnistoreWeb
{
    public partial class ViewSingleBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["snum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["trackingnumber"] == null)
            {
                //Response.Redirect("ViewBookings.aspx");
            }
            if (Session["trackingnumber"] != null)
            {
                Label1.Visible = false;
                Label8.Visible = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Label19.Visible = false;
                Label18.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
                Label22.Visible = false;
                Label23.Visible = false;
                Label24.Visible = false;
                Label25.Visible = false;
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);
                string splCommand1 = "SELECT Booking.TrackingNum, Booking.DateBooked, Booking.UnitNum, StorageUnit.UnitSize, Campus.cumpusName, Building.BuildName, UnitSize.Dimension, UnitSize.Fee FROM ((((Booking INNER JOIN StorageUnit ON Booking.UnitNum = StorageUnit.UnitId) INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) INNER JOIN Building ON StorageUnit.BuilNum = Building.BuildingNum) INNER JOIN Campus ON Building.CampusID = Campus.cumpusId) WHERE Booking.TrackingNum = @sn";
                OleDbCommand cm1 = new OleDbCommand(splCommand1, dbCon);
                cm1.Parameters.AddWithValue("@sn", int.Parse(Session["trackingnumber"].ToString()));
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
                        Label1n.Text = reader.GetDateTime(1).ToString();   //DateBooked
                        Label6.Text = reader.GetInt32(2).ToString();   //UnitID
                        Label8.Text = reader.GetString(3);   //uNIT Size
                        Label10.Text = reader.GetString(5);  //Building 
                        Label15.Text = reader.GetString(6);  //Dimensions
                        Label12.Text = reader.GetDecimal(7).ToString();  //price
                        Label17.Text = reader.GetString(4);//Campus
                        Label8.Visible = true;
                        Getitem();
                    }
                    dbCon.Close();
                    Getitem();
                }
            }
        }
        protected void cancelBooking(object sender, EventArgs e)
        {
            if (Label1.Visible)
            {
                Label1.Text = "Are you Sure you want to Cancel Booking ?";
            }
            Button1.Visible = false;
            Label1.Visible = true;
            Label8.Visible = true;
            Button2.Visible = true;
            Button3.Visible = true;
        }
        protected void confirmCancellation(object sender, EventArgs e)
        {

        }
        protected void undo(string unitid)
        {
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE Booking SET CancelledDate = @td, Cancelled = false WHERE ([TrackingNum] = @cc)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@cc", int.Parse(unitid));
            dbCom.Parameters.AddWithValue("@td", null);
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            int number = dbCom.ExecuteNonQuery();
            dbCon.Close();
        }
        protected void cancel(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label8.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button1.Visible = true;
            Label1.Text = "Are you sure you want to cancel Booking ?";
        }
       
        protected void Getitem()
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string splCommand1 = " SELECT [ItemID], [Description], [Dimension] FROM [Item] WHERE ([TrackingNum] = @sn)";
            OleDbCommand cm1 = new OleDbCommand(splCommand1, dbCon);
            cm1.Parameters.AddWithValue("@sn", int.Parse(Session["trackingnumber"].ToString()));
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
                    Label19.Text = "Item Information";
                    Label20.Text = "Item Number";
                    Label21.Text = reader.GetInt32(0).ToString();   //DateBooked
                    Label22.Text = "Description";
                    Label23.Text = reader.GetString(1);   //uNIT Size
                    Label24.Text = "Dimentions";
                    Label25.Text = reader.GetString(2);  //Dimensions   
                    Label19.Visible = true;
                    Label20.Visible = true;
                    Label21.Visible = true;
                    Label22.Visible = true;
                    Label23.Visible = true;
                    Label24.Visible = true;
                    Label25.Visible = true;
                }
                dbCon.Close();
            }
        }

        protected void Buttoensas_Click(object sender, EventArgs e)
        {
            Session["trackingnumber"] = null;
            Response.Redirect("ViewBookings.aspx");
        }
        protected void CheckIfAlreadyCancelled()
        {

        }
    }
}