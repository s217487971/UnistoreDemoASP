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
    public partial class ConfitmBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            String sql = "SELECT StorageUnit.UnitId AS Expr1, StorageUnit.UnitSize, UnitSize.Fee, Building.BuildName, Campus.cumpusName," +
                " Campus.Address FROM (((StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) INNER JOIN Building " +
                "ON StorageUnit.BuilNum = Building.BuildingNum) INNER JOIN Campus " +
                "ON Building.CampusID = Campus.cumpusId) WHERE (StorageUnit.UnitId =@un)";

            OleDbCommand cm1 = new OleDbCommand(sql, dbCon);
            String uni = (String)Session["un"];
            cm1.Parameters.AddWithValue("@un", Convert.ToInt32(uni));
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


            if (Session["list"] != null)
            {
                ArrayList li = ((ArrayList)Session["list"]);

                for (int x = 0; x <= li.Count - 1; x++)
                {
                    Item item = (Item)li[x];
                    HtmlTableRow tRow = new HtmlTableRow();
                    HtmlTableCell number = new HtmlTableCell();
                    number.InnerHtml = x.ToString();
                    HtmlTableCell ds = new HtmlTableCell();
                    ds.InnerHtml = item.descriptiron;
                    HtmlTableCell d = new HtmlTableCell();
                    d.InnerHtml = item.dimension;

                    tRow.Controls.Add(number);
                    tRow.Controls.Add(ds);
                    tRow.Controls.Add(d);

                    Table2.Rows.Add(tRow);

                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            // create a connection
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);


            // have the unit number

            String uni = (String)Session["un"];

            // get the tracking number

            String trackNum = getLastTrackingNumber(uni);

            // Insert booking dates
            DateTime date = DateTime.Now;
            String studentNumber = (String)Session["snum"];
            String sql2 = "Update [Booking] Set [DateBooked]=@d, [StudNum]=@sn Where [TrackingNum]=@t";
            OleDbCommand cm2 = new OleDbCommand(sql2, dbCon);
            cm2.Parameters.AddWithValue("@d", date.ToString());
            cm2.Parameters.AddWithValue("@sn", studentNumber);
          //  cm2.Parameters.AddWithValue("@sn", (String)Session["snum"]);
            cm2.Parameters.AddWithValue("@t", Convert.ToInt32(trackNum));

            dbCon.Open();
            int n = cm2.ExecuteNonQuery();
            dbCon.Close();

            // Update the unit to be unavailable

            String sql1 = "Update [StorageUnit] Set [Available]=@f Where [UnitId]=@un";
            
            OleDbCommand cm1 = new OleDbCommand(sql1, dbCon);
            cm1.Parameters.AddWithValue("@f", false);
            cm1.Parameters.AddWithValue("@un", Convert.ToInt32(uni));
            

            dbCon.Open();
            int number1 = cm1.ExecuteNonQuery();
            dbCon.Close();

            // insert the items to the database

            if (Session["list"] != null)
            {
                ArrayList li = ((ArrayList)Session["list"]);

                for (int x = 0; x <= li.Count - 1; x++)
                {
                    Item item = (Item)li[x];

                    String sql = "Insert INTO [Item] ([TrackingNum], [Dimension], [Description]) Values(@t,@di,des)";

                    OleDbCommand cm = new OleDbCommand(sql, dbCon);
                    cm.Parameters.AddWithValue("@t", trackNum);
                    cm.Parameters.AddWithValue("@di", item.dimension);
                    cm.Parameters.AddWithValue("@des", item.descriptiron);

                    dbCon.Open();
                    int number = cm.ExecuteNonQuery();
                    dbCon.Close();

                }
            }

            Response.Redirect("Confirm.aspx");


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
                OleDbCommand cm1 = new OleDbCommand(sql2, dbCon);

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