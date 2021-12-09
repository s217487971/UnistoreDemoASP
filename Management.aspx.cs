using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnistoreWeb
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Storage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllBookings.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllAccounts.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckIn.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");
        }
    }
}