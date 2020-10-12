using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            if (Request.QueryString["id"] != null)
            {
                if (Request.QueryString["id"] == "1")
                    lblErrorMsg.Text = "Session has been expired. Please relogin";
                else if (Request.QueryString["id"] == "2")
                    lblErrorMsg.Text = "Internal server error";
                else if (Request.QueryString["id"] == "3")
                    lblErrorMsg.Text = "Same user logined from another location. Please relogin.";
                else if (Request.QueryString["id"] == "4")
                    lblErrorMsg.Text = "Unauthorized access. Please relogin.";
            }
        }

        protected void btnRedirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}