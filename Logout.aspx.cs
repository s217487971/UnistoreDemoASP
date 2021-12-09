using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnistoreWeb
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
            Session["admin"] = null;
            Session["snum"] = null;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}