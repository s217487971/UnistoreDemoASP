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
    public partial class AvailableStorage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!(building.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                String sql = "SELECT StorageUnit.UnitId, StorageUnit.UnitSize,  UnitSize.Dimension, UnitSize.Fee" +
                  " FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize)" +
                  " WHERE [Available] =@a  AND [BuilNum]=@b";


                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

               

                cm1.Parameters.AddWithValue("@a", true);
                cm1.Parameters.AddWithValue("@s", int.Parse(building.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                GridView1.DataSourceID = null;
                GridView1.DataSource = userSet;
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                    noUnit.Text = "Sorry, no unit is currently available for this building :(";
                else noUnit.Text = "";

            }
        }

        protected void building_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void building_Load(object sender, EventArgs e)
        {
         
            
        }

        protected void building_DataBound(object sender, EventArgs e)
        {
             if (!(building.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);


                String sql = "SELECT  StorageUnit.UnitId, StorageUnit.UnitSize, UnitSize.Dimension, UnitSize.Fee" +
                   " FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize)" +
                   " WHERE StorageUnit.Available =@a  AND [BuilNum]=@b";


                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);


                cm1.Parameters.AddWithValue("@a", true);
                cm1.Parameters.AddWithValue("@s", int.Parse(building.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                GridView1.DataSourceID = null;
                GridView1.DataSource = userSet;
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                    noUnit.Text = "Sorry, no unit is currently available for this building :(";
                else noUnit.Text = "";

            }
        }

        protected void Book_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestBooking.aspx");
        }
    }
}