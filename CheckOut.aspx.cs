
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnistoreWeb
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fsdsdvsv
            hide.Visible = false;
            info.Visible = false;
            noting.Visible = false;
            
        }

        protected void search_Click(object sender, EventArgs e)
        {
            noting.Visible = false;
            if (trNum.Text != "")
            {
                checkSuc.Visible = false;
                String tr = trNum.Text;

                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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


                }
                else {
                    noting.Visible = true;
                    noting.Text = "No bookings found, please enter a valid tracking number.";
                }

                String sqll = "SELECT ItemID, Dimension, Description," +
                    " CheckedOut FROM Item WHERE TrackingNum =@t";

                //" CheckedOut FROM Item WHERE TrackingNum =@t AND CheckedOut=@y AND CheckedIn=@a";
                OleDbCommand cm11 = new OleDbCommand(sqll, dbCon);


                CheckBox c = new CheckBox();
                CheckBox d = new CheckBox();
                d.Checked = true;
                c.Checked = false;
                cm11.Parameters.AddWithValue("@t", int.Parse(trNum.Text));
                //cm11.Parameters.AddWithValue("@y", c.Checked);
                //cm11.Parameters.AddWithValue("@a", d.Checked);

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
                noting.Text = "Please enter a tracking number.";
            }

        }
        protected void building_DataBound(object sender, EventArgs e)
        {
            if (!(trNum.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);


                String sql = "SELECT ItemID, Dimension, Description," +
                " CheckedOut FROM Item WHERE TrackingNum =@t";


                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

                CheckBox c = new CheckBox();
                c.Checked = false;
                cm1.Parameters.AddWithValue("@t", int.Parse(trNum.Text));
               

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
            hide.Visible=true;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            int MessageID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            CheckBox chkAccess = ((CheckBox)row.FindControl("CheckBox1"));

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            string updSql = @"UPDATE Item 
                      SET CheckedOut = @che 
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
            dbCon.Close();
            GridView1.EditIndex = -1;
            building_DataBound(null, null);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            building_DataBound(null, null);
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void checkIn_Click(object sender, EventArgs e)
        {
            noting.Visible = false;
            if (trNum.Text != null)
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                string updSql = @"UPDATE Booking 
                      SET CheckOutDate = @che 
                      WHERE TrackingNum = @tr";

                dbCon.Open();
                using (var cmd = new OleDbCommand(updSql, dbCon))
                {
                    cmd.Parameters.AddWithValue("@che", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@tr", trNum.Text);
                    cmd.ExecuteNonQuery();
                }

                dbCon.Close();
                hide.Visible = false;
                checkSuc.Visible = true;
                checkSuc.Text = "Checkout successful";
            }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Management.aspx");
        }
    }

}