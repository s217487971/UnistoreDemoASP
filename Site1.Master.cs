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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nomarlUserRight.Visible = false;
            AdminRight.Visible = false;
            nomarlUserLoginRight.Visible = false;

            if (Session["admin"] != null)
            {

                if ((String)Session["admin"]=="1")
                {
                    AdminRight.Visible = true;
                    admin.Text = "(" + (String)Session["ad"] + ")";


                }
                else
                {
              
                    nomarlUserLoginRight.Visible = true;
                    user.Text ="("+ (String)Session["sn"]+")";

                }
            }
            else
            {
                nomarlUserRight.Visible = true;
      

            }


            

        }


        private void updateStudent()
        {
            if(Session["sn"]!=null)
            {
                
            }
        }
    }
}