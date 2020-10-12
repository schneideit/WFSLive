using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;

namespace CRM
{
    public partial class RoleSearch : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["EDIT_ROLEID"] = 0;
               GetRoles();
            }
        }
        private void GetRoles()
        {
            try
            {
                rptSearch.DataSource = dbconn.PR_RoleSearch(null,0).ToList();
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
                Session["EDIT_ROLEID"] = e.CommandArgument;
                Response.Redirect("RoleAdd.aspx");
            }
        }
    }
}
