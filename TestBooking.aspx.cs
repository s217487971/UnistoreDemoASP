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
    public partial class TestBooking : System.Web.UI.Page
    {


        

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["small"]==null&&Session["medium"]==null&&Session["large"]==null)
            {
                Session["small"] =200*200*350;
                Session["medium"] =350*350*500;
                Session["large"] =500*500*700;
                Session["isFull"] = false;
                Session["noUnit"] = true;
            }
               
        }

        protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (!(DropDownList2.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                String sql = "SELECT StorageUnit.UnitId, StorageUnit.UnitSize,  UnitSize.Dimension, UnitSize.Fee" +
                  " FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize)" +
                  " WHERE [Available] =@a  AND [BuilNum]=@b";

                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

                cm1.Parameters.AddWithValue("@a", true);
                cm1.Parameters.AddWithValue("@s", int.Parse(DropDownList2.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                units.DataSourceID = null;
                units.DataSource = userSet;
                units.DataBind();

                if (units.Rows.Count == 0)
                    noUnit.Text = "Sorry, no units are currently available";
                else noUnit.Text = "";

            }
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            if (!(DropDownList2.Text == ""))
            {
                string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbCon = new OleDbConnection(connection);

                String sql = "SELECT StorageUnit.UnitId, StorageUnit.UnitSize,  UnitSize.Dimension, UnitSize.Fee" +
                  " FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize)" +
                  " WHERE [Available] =@a  AND [BuilNum]=@b";

                OleDbCommand cm1 = new OleDbCommand(sql, dbCon);

                cm1.Parameters.AddWithValue("@a", true);
                cm1.Parameters.AddWithValue("@s", int.Parse(DropDownList2.Text));

                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cm1;

                DataSet userSet = new DataSet();
                info.Fill(userSet);

                units.DataSourceID = null;
                units.DataSource = userSet;
                units.DataBind();

                if (units.Rows.Count == 0)
                    noUnit.Text = "Sorry, no unit is currently available for this building :(";
                else noUnit.Text = "";


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

          
            // check if a unit is selected 
            if ((bool)(Session["noUnit"]))
            {
              
                    
             }
            else
            {
                // Current values: unit volume,unit size

                // check if the unit if full
                if (!(bool)Session["isFull"])
                {
                    // get the item dimension
                    String di = l.Text + "*" + w.Text + "*" + h.Text;

                    //create a new list if no any
                    if (Session["list"] == null)
                        (Session["list"]) = new ArrayList();

                    // check if the item fits the unit
                    if (isFull(di))
                    {
                        full.Text = "You cannot add more items, " +
                            "the unit is now full. You may have to choose another unit, " +
                            "or remove some of the items. ";
                        if (!(bool)Session["noUnit"])
                           Session["isFull"] = true;
                        return;
                    }
                    else
                    {
                        ((ArrayList)Session["list"]).Add(new Item(des.InnerText, di));
                        Session["isFull"] = false;

                        ArrayList li = ((ArrayList)Session["list"]);
                        noItems.Text = "Number of added items: " + li.Count;

                        for (int x = 0; x <= li.Count - 1; x++)
                        {
                            Item item = (Item)li[x];
                            HtmlTableRow tRow = new HtmlTableRow();
                            HtmlTableCell number = new HtmlTableCell();
                            number.InnerHtml = (x + 1).ToString();
                            HtmlTableCell ds = new HtmlTableCell();
                            ds.InnerHtml = item.descriptiron;
                            HtmlTableCell d = new HtmlTableCell();
                            d.InnerHtml = item.dimension;



                            tRow.Controls.Add(number);
                            tRow.Controls.Add(ds);
                            tRow.Controls.Add(d);

                            Table1.Rows.Add(tRow);

                            
                        }
                    }

                }
                else refreshTable();
               
                full.Text = "";
            }
        }

       
        public void refreshTable()
        {
            if (Session["list"] != null)
            {
                ArrayList li = ((ArrayList)Session["list"]);

                for (int x = 0; x <= li.Count - 1; x++)
                {
                    Item item = (Item)li[x];
                    HtmlTableRow tRow = new HtmlTableRow();
                    HtmlTableCell number = new HtmlTableCell();
                    number.InnerHtml = (x+1).ToString();
                    HtmlTableCell ds = new HtmlTableCell();
                    ds.InnerHtml = item.descriptiron;
                    HtmlTableCell d = new HtmlTableCell();
                    d.InnerHtml = item.dimension;

                    tRow.Controls.Add(number);
                    tRow.Controls.Add(ds);
                    tRow.Controls.Add(d);

                    Table1.Rows.Add(tRow);

                }
                noItems.Text = "Number of added items: " + li.Count;


            
            }
        }


        public bool isFull( String dimension)
        {

       
            //calculate the item volume
            int[] iV = arrayDimension(dimension);
            double v = iV[0] * iV[1] * iV[2];


            // get the unit size
            String unitSize = (string)Session["unitSize"];
            double unitV = 0;//
            if (unitSize == "Small")
            {
                // get the unit volume
                unitV = double.Parse( Session["small"].ToString());

                // Temp store the unit
                double temp = unitV;

                // sub the item volume from the unit volume
                temp -= v;
                if (temp <= 0)
                {
                    // if the item does not fit
                    Session["currentV"] = unitV;
                    refreshTable();
                    return true;
                 }
                else unitV -= v;
                Session["currentV"] = unitV;
            }

            else if (unitSize == "Medium")
            {
                unitV = double.Parse(Session["medium"].ToString());
                double temp = unitV;
                temp -= v;
                if (temp <= 0)
                {
                    refreshTable();
                    Session["currentV"] = unitV;
                    return true;
                }
                else unitV -= v;
                Session["currentV"] = unitV; ;
            }

            else
            {
                unitV = double.Parse(Session["large"].ToString());
                double temp = unitV;
                temp -= v;
                if (temp <= 0)
                {
                    Session["currentV"] = unitV;
                    refreshTable();
                    return true;
                }
                else unitV -= v;
                Session["currentV"] = unitV;
            }
            Session["currentV"] = unitV;
          

            if (unitV <= 0)
                return true;
            else return false;
        }

         
        private int[] arrayDimension(string arr)
        {
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
            //l,w,h
            return dims;
        }

       

        protected void units_SelectedIndexChanged(object sender, EventArgs e)
        {
            // selct a unit
           String unitNumber = units.Rows[units.SelectedIndex].Cells[1].Text;

            // store the unit number
            Session["un"] = unitNumber;
            noItems.Text = "";
            // the unit is not full
            Session["isFull"] = false;
            Session["noUnit"] = false;

            // create a connection
            String connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbCon = new OleDbConnection(connection);
            String uni = (String)Session["un"];

            // get the size of the unit
            String sql2 = " SELECT*  From StorageUnit Where UnitId=@un";
            OleDbCommand cm1 = new OleDbCommand(sql2, dbCon);
            cm1.Parameters.AddWithValue("@un", Convert.ToInt32(uni));

            String unitSize = "";
            dbCon.Open();

            using (OleDbDataReader reader = cm1.ExecuteReader())
            {
                reader.Read();
                try
                {
                    unitSize = reader.GetString(1);

                    Session["unitSize"] = unitSize;
                    Session["noUnit"] = false;

                }
                catch (Exception i)
                {
                    errorM.Text = "Please select a unit";
                    Session["noUnit"] = true;
                    return;
                }

            }
            dbCon.Close();
        

            // Find the volume of the selected unit

            double unitV = 0;
            if (unitSize == "Small")
            {
                unitV = double.Parse(Session["small"].ToString());
               
                Session["currentV"] = unitV;
                
               
            }

            else if (unitSize == "Medium")
            {
                unitV = double.Parse(Session["medium"].ToString());
                
                    Session["currentV"] = unitV;
              
               
            }

            else
            {
                unitV = double.Parse(Session["large"].ToString());
               
                    Session["currentV"] = unitV;
                   
            }


            // clear items
            if (Session["list"] != null)
            { ((ArrayList)Session["list"]).Clear();
                // refresh
                refreshTable();
            }
            full.Text = "";
           
        }

        

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfitmBooking.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ((ArrayList)Session["list"]).Clear();
            Response.Redirect("TestBooking.aspx");
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int number = int.Parse(itemNumber.Text);
           
            if (number > 0 && number <= ((ArrayList)Session["list"]).Count && ((ArrayList)Session["list"]).Count != 0)
            {

                Item item = (Item)((ArrayList)Session["list"])[number - 1];
                // update the volume
                int[] iV = arrayDimension(item.dimension);
                double v = iV[0] * iV[1] * iV[2];
               Session["currentV"]=(double)Session["currentV"]+ v;
                ((ArrayList)Session["list"]).RemoveAt(number - 1);
                refreshTable();
            }
        }
    }
}