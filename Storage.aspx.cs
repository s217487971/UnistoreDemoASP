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
using System.Web.DynamicData;
using System.Data.SqlClient;

namespace UnistoreWeb
{
    public partial class Storage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Management.aspx");
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUnit.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!(DropDownList2.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);


                String sql = "SELECT [UnitId], [UnitSize], [Available], [BuilNum] FROM [StorageUnit] WHERE [BuilNum]=@b";

                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);




                cm1.Parameters.AddWithValue("@s", int.Parse(DropDownList2.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                GridView3.DataSourceID = null;
                GridView3.DataSource = userSet;
                GridView3.DataBind();

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void building_DataBound(object sender, EventArgs e)
        {
            if (!(DropDownList2.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);


                String sql = "SELECT [UnitId], [UnitSize], [Available], [BuilNum] FROM [StorageUnit] WHERE [BuilNum]=@b";


                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);


                cm1.Parameters.AddWithValue("@s", int.Parse(DropDownList2.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                GridView3.DataSourceID = null;
                GridView3.DataSource = userSet;
                GridView3.DataBind();

            }
        }
        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            building_DataBound(null, null);
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView3.Rows[e.RowIndex];

            int MessageID = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value.ToString());

            CheckBox chkAccess = ((CheckBox)row.FindControl("CheckBox1"));

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);

            string updSql = @"UPDATE StorageUnit 
                      SET Available = @avail 
                      WHERE UnitId = @theId";
            //dbon = new SqlConnection(cs);
            dbCon.Open();
            //updating the record  
            using (var cmd = new OleDbCommand(updSql, dbCon))
            {
                cmd.Parameters.AddWithValue("@avail", chkAccess.Checked);
                cmd.Parameters.AddWithValue("@theId", MessageID);
                cmd.ExecuteNonQuery();
            }
            dbCon.Close();
            GridView3.EditIndex = -1;
            building_DataBound(null, null);
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            building_DataBound(null, null);

        }
    }
}