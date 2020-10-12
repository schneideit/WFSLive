using CRM.Common;
using System;
using System.Collections.Generic;

namespace CRM
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERINFO"] == null)
                Response.Redirect("Error.aspx?id=1");
            else if (!CommonUI.ValidateUserSession(Request))
                Response.Redirect("Error.aspx?id=3");

            UserInfo user = (UserInfo)Session["USERINFO"];

                lblName.InnerText = user.Name;

            CommonUI.Authorization(Request,Page);
            if (!IsPostBack)
            {
                if (Session["MENU"] == null)
                {
                    List<Privilege> _privilege = null;
                    Session["MENU"] = CommonUI.CreateMenu(ref _privilege,Request);
                    Session["PRIVILEGE"] = _privilege;
                }
                ltrMenu.Text = Convert.ToString(Session["MENU"]);
            }
        }
    }
}