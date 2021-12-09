using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnistoreWeb
{
    public partial class ViewBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["trackingnumber"] = null;
            Button1.Visible = false;
            if (Session["snum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void viewBooking(object sender, EventArgs e)
        {
            Session["trackingnumber"] = Label2.Text;
            Response.Redirect("ViewSingleBooking.aspx");
        }
        protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "Tracking Number:";
            Label2.Text = GridView1.SelectedRow.Cells[1].Text;
            Label4.Text = "Unit Number:";
            Label3.Text = GridView1.SelectedRow.Cells[2].Text;
            Label5.Text = "Date Booked:";
            Label6.Text = GridView1.SelectedRow.Cells[3].Text;
            Label7.Text = "Booking Information";
            Button1.Visible = true;
        }
        protected void Create_NewBooing(object sender , EventArgs e)
        {
            Response.Redirect("ExperimentalBooking.aspx");
        }
    }
}