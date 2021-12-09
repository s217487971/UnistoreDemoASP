using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Collections;

namespace UnistoreWeb
{
    public partial class ExperimentalBooking : System.Web.UI.Page
    {
       
        public double totalprice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Advice.Text = "";
            if (Session["snum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void CheckUnit(object sender, EventArgs e)
        {
            string building = DropDownList2.SelectedValue;
            if (building == null)
            {
                Advice.Text = "Select Building";
                return;
            }
            String size = "";
            double volume = double.Parse(length.Text) * double.Parse(height.Text) * double.Parse(breath.Text);
            if (volume <= 64)
            {
                size = "Large";
                if (volume <= 8)
                {
                    size = "Medium";
                    if (volume <= 1)
                    {
                        size = "Small";
                    }
                }
            }
            if (size.Equals(""))
            {
                Advice.Text = "Item Exceeds largest Storage Unit";
            }
            if (!(size.Equals("")))
            {
               Advice.Text = "";
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string splCommand1 = " SELECT StorageUnit.UnitSize, StorageUnit.BuilNum, StorageUnit.UnitId, UnitSize.Dimension, UnitSize.Fee FROM(StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) Where StorageUnit.UnitSize = @s AND StorageUnit.Available = true AND StorageUnit.BuilNum = @d";
            OleDbCommand cm1 = new OleDbCommand(splCommand1, dbCon);
                cm1.Parameters.AddWithValue("@s", size);
                cm1.Parameters.AddWithValue("@d", building);
                OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;
            DataSet userSet = new DataSet();
            info.Fill(userSet);
                if (userSet.Tables[0].Rows.Count == 0)
                {
                    Advice.Text = "No available units on this building, Try another buliding";
                }
            if (userSet.Tables[0].Rows.Count > 0)
            {
                dbCon.Open();

                using (OleDbDataReader reader = cm1.ExecuteReader())
                {
                    reader.Read();
                        UnitIDLabel.Text = (reader.GetInt32(2)).ToString();
                        UnitSizeLabel.Text = reader.GetString(0);
                        UnitDimensionLabel.Text = reader.GetString(3);
                        UnitPriceLable.Text = (reader.GetDecimal(4)).ToString();
                }
                dbCon.Close();
                
            }
            
        }

        }
        public void clear(object sender, EventArgs e)
        {
            length.Text = "0";
            breath.Text = "0";
            height.Text = "0";
            UnitIDLabel.Text = "";
            UnitSizeLabel.Text = "";
            UnitDimensionLabel.Text = "";
            UnitPriceLable.Text = "0";
        }
        public void selectUnit(object sender, EventArgs e)
        {
            if (UnitIDLabel.Text == "" || UnitIDLabel.Text==null)
            {
                Advice.Text = "No unit Selected";
                return;
            }
            Advice.Text = "";
            if (BookedUnits.Text != "")
            {
                releaseUnit();
            }
            totalprice = Convert.ToDouble(totalCosts.Text) + Convert.ToDouble(UnitPriceLable.Text);
            totalCosts.Text = totalprice.ToString();
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE StorageUnit SET Available = false WHERE ([UnitId] = @cc)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@cc", UnitIDLabel.Text);
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            int number = dbCom.ExecuteNonQuery();
            if (number == 1)
            {
                if (BookedUnits.Text == "")
                {
                    bookedunitids.Text = "Unit ID";
                    BookedUnits.Text = UnitIDLabel.Text;
                    Unitid1.Text = "Unit Size";
                    unitdels1.Text = UnitSizeLabel.Text;
                    unitid2.Text = "Building";
                    unitdels2.Text = DropDownList2.Text;
                    unitid3.Text = "Booking Date";
                    unitdels3.Text = DateTime.Today.ToString();
                }
                
            }
            length.Text = "0";
            breath.Text = "0";
            height.Text = "0";
            UnitIDLabel.Text = "";
            UnitSizeLabel.Text = "";
            UnitDimensionLabel.Text = "";
            UnitPriceLable.Text = "0";
            dbCon.Close();
        }
        public void confirmBooking(Object sender, EventArgs e)
        {
            
            if (BookedUnits.Text != "")
            {
                int num = InsertBooking(BookedUnits.Text);
                if (num == 1)
                {
                    int trackingnum = getTrackingNumber(int.Parse(BookedUnits.Text), Session["snum"].ToString());
                    if (trackingnum != -1)
                    {
                        Session["bookdate"] = DateTime.Today;
                        bookedunitids.Text = "";
                        BookedUnits.Text = "";
                        unitdels1.Text = "";
                        Unitid1.Text = "";
                        Response.Redirect("BookingInformation.aspx");
                    }
                }
            }
        }

        public void cancelbooks(Object sender, EventArgs e)
        {
            releaseUnit();
            //BookedUnits.Text = "";
            //unitdels3.Text = "";
            //unitdels2.Text = "";
            //unitdels3.Text = "";
            totalCosts.Text = "0";
        }


        public int getTrackingNumber(int Unitnum, string studnum)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlcom = "SELECT [TrackingNum] FROM [Booking] WHERE (([StudNum] = @sn) AND ([UnitNum] = @un))";
            OleDbCommand cm1 = new OleDbCommand(sqlcom, dbCon);
            cm1.Parameters.AddWithValue("@sn", studnum);
            cm1.Parameters.AddWithValue("@un", Unitnum);
            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm1;
            DataSet userSet = new DataSet();
            info.Fill(userSet);
            if (userSet.Tables[0].Rows.Count > 0)
            {
                int trackingnum = -1;
                dbCon.Open();

                using (OleDbDataReader reader = cm1.ExecuteReader())
                {
                    reader.Read();
                    trackingnum = reader.GetInt32(0);
                }
                dbCon.Close();
                return trackingnum;
            }
            return -1;
        }
        public int insertItem(String descr, String dimen, int Tracking)
        {
            int number = 0;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "INSERT INTO Item(TrackingNum, Dimension, Description) VALUES (@un,@sn,@db)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@un", Tracking);
            dbCom.Parameters.AddWithValue("@sn", dimen);
            dbCom.Parameters.AddWithValue("@db", descr);
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }
        public void releaseUnit()
        {
           
            if (BookedUnits.Text != "")
            {
                int num = MakeAvailable(BookedUnits.Text);
                if (num == 1)
                {
                    bookedunitids.Text = "";
                    BookedUnits.Text = "";
                    unitdels1.Text = "";
                    Unitid1.Text = "";
                    unitdels2.Text = "";
                    unitdels3.Text = "";
                    unitid2.Text = "";
                    unitid3.Text = "";
                    totalCosts.Text = "0";
                }
            }
        }
        public int MakeAvailable(string unitid) {
            int number = 0;
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE StorageUnit SET Available = true WHERE ([UnitId] = @cc)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@cc", unitid);
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }
        public int MakeUnAvailable(string unitid) {
            int number = 0;
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "UPDATE StorageUnit SET Available = false WHERE ([UnitId] = @cc)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@cc", unitid);
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }
        public int InsertBooking(String unitd) {
            int number = 0;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            string sqlCom = "INSERT INTO Booking(UnitNum, StudNum, DateBooked, Paid) VALUES (@un,@sn,@db,@p)";
            OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);
            dbCom.Parameters.AddWithValue("@un", int.Parse(BookedUnits.Text));
            dbCom.Parameters.AddWithValue("@sn", Session["snum"]);
            dbCom.Parameters.AddWithValue("@db", DateTime.Today);
            dbCom.Parameters.AddWithValue("@p", false);
            dbCon.Open();
            number = dbCom.ExecuteNonQuery();
            dbCon.Close();
            return number;
        }
        public void deleteFailedBookings()
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBookings.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            String L,B,H;
            L = length.Text;
            B = breath.Text;
            H = height.Text;

            String di = L + "*" + B + "*" + H;
            String tr = getLastTrackingNumber("99");

            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            string sqlCom = "INSERT into [Item] ([TrackingNum], [Dimension], [Description]) VALUES (@t,@d,@dr)";
            
            OleDbCommand cm = new OleDbCommand(sqlCom, dbCon);
            cm.Parameters.AddWithValue("@t", tr);
            cm.Parameters.AddWithValue("@d", di);
            cm.Parameters.AddWithValue("@dr", ds.Text);

            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cm;

            DataSet userSet = new DataSet();
            info.Fill(userSet);

            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            int number = cm.ExecuteNonQuery();
            dbCon.Close();

            if (number == 1)
            {
               String sql1= "SELECT [ItemID], [TrackingNum], [Dimension], [Description] FROM [Item] Where TrackingNum=@t";

                OleDbCommand cm1 = new OleDbCommand(sql1, dbCon);

                cm1.Parameters.AddWithValue("@t", tr);

                OleDbDataAdapter info1 = new OleDbDataAdapter();
                info1.SelectCommand = cm1;

                DataSet userSet1 = new DataSet();
                info1.Fill(userSet1);
                if (userSet1.Tables[0].Rows.Count > 0)
                {
                    itemsGrid.DataSourceID = null;
                    itemsGrid.DataSource = userSet1;
                    itemsGrid.DataBind();
                }

            }


        }


        public String getLastTrackingNumber(String unitNumber)
        {

         
            // create a connection
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            // create a new booking
            String sql = "Insert INTO [Booking] ([UnitNum]) Values(@u)";

            OleDbCommand cm = new OleDbCommand(sql, dbCon);
            cm.Parameters.AddWithValue("@u", unitNumber);


            OleDbDataAdapter adapter = new OleDbDataAdapter();
            dbCon.Open();
            int number = cm.ExecuteNonQuery();
            dbCon.Close();

            if (number == 1)
            {

                // get the tracking number
                String sql2 = " SELECT Max(TrackingNum) From Booking";
                OleDbCommand cm1 = new OleDbCommand(sql2,dbCon);

                dbCon.Open();

                using (OleDbDataReader reader = cm1.ExecuteReader())
                {
                    reader.Read();

                    return reader.GetInt32(0).ToString();
                    
                }
                dbCon.Close();

            }

            return "";
        }
    }
}
    