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
    public partial class CheckIn : System.Web.UI.Page
    {
        int curTracking = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            hide.Visible = false;
            info.Visible = false;
        }
        protected void search_Click(object sender, EventArgs e)
        {
            noting.Visible = false;
            if (trNum.Text != "")
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon1 = new OleDbConnection(connection);

                string sqlCom1 = "SELECT Dimension FROM UnitSize, StorageUnit, Booking WHERE Unitsize.UnitSize = StorageUnit.UnitSize AND StorageUnit.UnitId = Booking.UnitNum and Booking.TrackingNum = @num";
                OleDbCommand dbCom1 = new OleDbCommand(sqlCom1, dbCon1);
                dbCom1.Parameters.AddWithValue("@num", trNum.Text);
                dbCon1.Open();
                string dim = (string)dbCom1.ExecuteScalar();
                dbCon1.Close();
                checkSuc.Visible = false;
                String tr = trNum.Text;
                dimen.Text = dim;
                curTracking = int.Parse(tr);
                OleDbConnection dbCon = new OleDbConnection(connection);

                String sql1 = "SELECT Booking.TrackingNum, Booking.UnitNum, Booking.StudNum, Student.StudFname, " +
                    "Student.StudLname FROM " +
                    "(Booking INNER JOIN Student ON Booking.StudNum = Student.StudNum) WHERE TrackingNum=@tr";

                OleDbCommand cm2 = new OleDbCommand(sql1, dbCon);

                cm2.Parameters.AddWithValue("@s", tr);

                OleDbDataAdapter info2 = new OleDbDataAdapter();
                info2.SelectCommand = cm2;

                DataSet userSet2 = new DataSet();
                info2.Fill(userSet2);

                if (userSet2.Tables[0].Rows.Count > 0)
                {
                    info.Visible = true;
                    hide.Visible = true;
                    dbCon.Open();
                    using (OleDbDataReader reader = cm2.ExecuteReader())
                    {
                        reader.Read();
                        trackingNum.Text = reader.GetInt32(0).ToString();
                        name.Text = reader.GetString(3) + " " + reader.GetString(4);
                        studNum.Text = reader.GetString(2);

                    }
                    dbCon.Close();


                    /////


                    String sqll = "SELECT ItemID, Dimension, Description," +
                        " Checkedin FROM Item WHERE TrackingNum =@t";


                    OleDbCommand cm11 = new OleDbCommand(sqll, dbCon);


                    cm11.Parameters.AddWithValue("@s", int.Parse(trNum.Text));

                    OleDbDataAdapter infoo = new OleDbDataAdapter();
                    infoo.SelectCommand = cm11;

                    DataSet userSett = new DataSet();
                    infoo.Fill(userSett);

                    GridView1.DataSourceID = null;
                    GridView1.DataSource = userSett;
                    GridView1.DataBind();

                }
                else
                {
                    noting.Visible = true;
                    noting.Text = "No bookings found, please enter a valid tracking number.";
                }
            }
            else
            {
                noting.Visible = true;
                noting.Text = "Please enter a tracking number.";
            }
        }
        protected void checkIn_Click(object sender, EventArgs e) {
            noting.Visible = false;
            if (trNum.Text != null)
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                string updSql = @"UPDATE Booking 
                      SET CheckInDate = @che 
                      WHERE TrackingNum = @tr";

                dbCon.Open();
                using (var cmd = new OleDbCommand(updSql, dbCon))
                {
                    cmd.Parameters.AddWithValue("@che", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@tr", trNum.Text);
                    cmd.ExecuteNonQuery();
                }

                dbCon.Close();
                checkSuc.Visible = true;
                checkSuc.Text = "Check-in successful";
                hide.Visible = false;
                ///

                string sql = @"UPDATE Booking 
                      SET Paid = @p 
                      WHERE TrackingNum = @tr";
                dbCon.Open();
                OleDbCommand cm = new OleDbCommand(sql,dbCon);
                cm.Parameters.AddWithValue("@p", paid.Checked);
                cm.Parameters.AddWithValue("@tr", trNum.Text);
                cm.ExecuteNonQuery();
                dbCon.Close();

            }
        }
        private int[] arrayDimension(string arr) {
            int[] dims = new int[3];
            int index = 0;
            string build = "";
            for (int x = 0; x < arr.Length; x++)
            {
                string cur = arr[x] + "";
                if (!(int.TryParse(cur, out int output)))
                {
                    dims[index] = int.Parse(build);
                    build = "";
                    index++;
                }
                else build += cur;
            }
            dims[2] = int.Parse(build);

            return dims;
        }
        private bool doVolume(string[] inside,string max) {

            int[] forMAxVolume = arrayDimension(max);
            int maxVolume = forMAxVolume[0] * forMAxVolume[1] * forMAxVolume[2];


            //remaining volume

            int volumeUsed = 0;
            for (int x = 0; x < inside.Length-1; x++) {
                int[] cur = arrayDimension(inside[x]);
                int vol = cur[0] * cur[1] * cur[2];
                volumeUsed += vol;
            }
            int length = int.Parse(uLength.Text);
            int width = int.Parse(uWidth.Text);
            int height = int.Parse(uHeight.Text);
            int volume = length * width * height;
            if (length > forMAxVolume[0] || width > forMAxVolume[1] || height > forMAxVolume[2]) {
                enterDimen.Visible = true;
                enterDimen.Text = "Please check your dimensions, the item won't fit in the unit.";
                return false;
            }         
            else if (maxVolume < (volumeUsed + volume))
            {
                enterDimen.Visible = true;
                enterDimen.Text = "Not enough remaining space for the item in unit.";
                return false;
            }
            return true; ;
        }
        protected void add_Click(object sender, EventArgs e)
        {

            hide.Visible = true;
            if (uLength.Text != "" && uHeight.Text != "" && uWidth.Text != "" && desc.Value != "")
            {

                enterDimen.Visible = false;
                if (IsPostBack)
                {
                    string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    OleDbConnection dbCon1 = new OleDbConnection(connection);

                    string sqlCom1 = "SELECT Dimension FROM UnitSize, StorageUnit, Booking WHERE Unitsize.UnitSize = StorageUnit.UnitSize AND StorageUnit.UnitId = Booking.UnitNum and Booking.TrackingNum = @num";
                    OleDbCommand dbCom1 = new OleDbCommand(sqlCom1, dbCon1);
                    dbCom1.Parameters.AddWithValue("@num", trNum.Text);
                    dbCon1.Open();
                    string dim = (string)dbCom1.ExecuteScalar();
                    dbCon1.Close();
                    string r = "";
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        string value = row.Cells[3].Text;
                        r += value + ",";
                    }
                    if (doVolume(r.Split(','), dim))
                    {
                        OleDbConnection dbCon = new OleDbConnection(connection);

                        string sqlCom = "INSERT into [Item] ([TrackingNum], [Dimension], [Description],[Checkedin],[CheckedOut]) VALUES (@s,@fn,@ln,@e,@p)";
                        OleDbCommand dbCom = new OleDbCommand(sqlCom, dbCon);

                        String val = uLength.Text + "*" + uWidth.Text + "*" + uHeight.Text;
                        dbCom.Parameters.AddWithValue("@s", trNum.Text);
                        dbCom.Parameters.AddWithValue("@fn", val);
                        dbCom.Parameters.AddWithValue("@ln", desc.Value);
                        dbCom.Parameters.AddWithValue("@e", false);
                        dbCom.Parameters.AddWithValue("@p", false);
                        //@e,@c,@p
                        OleDbDataAdapter adapter = new OleDbDataAdapter();
                        dbCon.Open();
                        int number = dbCom.ExecuteNonQuery();
                        dbCon.Close();

                        if (number == 1)
                        {
                            // do something 
                        }

                        building_DataBound(null, null);
                        enterDimen.Visible = true;
                        enterDimen.Text = "Item added successfully";
                    }
                }
            }
            else
            {
                enterDimen.Visible = true;
                enterDimen.Text = "Enter all the necessary information";
            }
        }
        protected void building_DataBound(object sender, EventArgs e)
        {
            if (!(trNum.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);


                String sql = "SELECT ItemID, Dimension, Description," +
                " Checkedin FROM Item WHERE TrackingNum =@t";


                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);


                cm1.Parameters.AddWithValue("@s", int.Parse(trNum.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                GridView1.DataSourceID = null;
                GridView1.DataSource = userSet;
                GridView1.DataBind();

            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            hide.Visible = true;
            GridView1.EditIndex = e.NewEditIndex;
            building_DataBound(null, null);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            hide.Visible = true;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            int MessageID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            CheckBox chkAccess = ((CheckBox)row.FindControl("CheckBox1"));

            TextBox descr = (TextBox)row.FindControl("Label1T");

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            string updSql = @"UPDATE Item 
                      SET Checkedin = @che 
                      WHERE ItemID = @theId";

            string sql2= @"UPDATE Item 
                      SET Description = @che 
                      WHERE ItemID = @theId";
            //dbon = new SqlConnection(cs);
            dbCon.Open();
            //updating the record  
            using (var cmd = new OleDbCommand(updSql, dbCon))
            {
                cmd.Parameters.AddWithValue("@che", chkAccess.Checked);
                cmd.Parameters.AddWithValue("@theId", MessageID);
                cmd.ExecuteNonQuery();
            }
            using (var cmd = new OleDbCommand(sql2, dbCon))
            {
                cmd.Parameters.AddWithValue("@che", descr.Text);
                cmd.Parameters.AddWithValue("@theId", MessageID);
                cmd.ExecuteNonQuery();
            }
            dbCon.Close();
            GridView1.EditIndex = -1;
            building_DataBound(null, null);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            hide.Visible = true;
            GridView1.EditIndex = -1;
            building_DataBound(null, null);
            
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            hide.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            Response.Redirect("Management.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            hide.Visible = true;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            int MessageID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            string updSql = @"DELETE FROM Item 
                      WHERE ItemID = @theId";


            dbCon.Open();
            //updating the record  
            using (var cmd = new OleDbCommand(updSql, dbCon))
            {
                cmd.Parameters.AddWithValue("@theId", MessageID);
                cmd.ExecuteNonQuery();
            }
            dbCon.Close();
            building_DataBound(null, null);
        }
    }
}