using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;

namespace CRM
{
    public partial class UserSearch : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["EDIT_USERID"] = 0;
               GetUsers();
            }
        }
        private void GetUsers()
        {
            try
            {
                rptSearch.DataSource = dbconn.PR_UserSearch(0, null, 0, null, null, null).ToList();
                rptSearch.DataBind();
            }
            catch (Exception ex)
            {
                Logger.Error.LogError(ex);
            }
           
        }
        protected void rptSearch_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(e.CommandArgument)))
            {
                Session["EDIT_USERID"] = e.CommandArgument;
                Response.Redirect("UserAdd.aspx");
            }
        }
    }
}
