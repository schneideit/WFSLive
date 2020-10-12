using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;
namespace CRM
{
    public partial class ViewSchedules : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetSchedules();
            }

        }
        private void GetSchedules()
        {
            rptSch.DataSource = dbconn.PR_GetSchedules();
            rptSch.DataBind();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnStudId"] = lnkedit.CommandArgument;
            string recId = lnkedit.CommandArgument;
            Response.Redirect("Schedule.aspx");
        }
        
    }
}