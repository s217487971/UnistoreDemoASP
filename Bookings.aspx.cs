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
    public partial class Bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["snum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Create_Booking(object sender, EventArgs e)
        {
            Response.Redirect("ExperimentalBooking.aspx");
        }
        protected void View_Bookings(object sender, EventArgs e)
        {
            Response.Redirect("ViewBookings.aspx");
        }
    }
}