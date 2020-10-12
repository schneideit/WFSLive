using CRM.Common;
using System;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class ListEnquiry : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["SesnEnqid"] = null;
                Session["SesnMode"] = null;

                GetEnquries();
            }
        }
        private void GetEnquries()
        {
            rptEnq.DataSource = dbconn.PR_GetLeads();
            rptEnq.DataBind();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnEnqid"] = lnkedit.CommandArgument;
            Session["SesnMode"] = "Edit";
            string recId = lnkedit.CommandArgument;
            Response.Redirect("Leads.aspx");
        }
    }
}