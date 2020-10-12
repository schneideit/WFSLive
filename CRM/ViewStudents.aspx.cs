using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;

namespace CRM
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetStudents();
            }
        }
        private void GetStudents()
        {
            rptEnq.DataSource = dbconn.PR_GetStudents();
            rptEnq.DataBind();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnStudId"] = lnkedit.CommandArgument;
            string recId = lnkedit.CommandArgument;
            Response.Redirect("Student.aspx");
        }
        protected void btnPymnt_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnStudId"] = lnkedit.CommandArgument;
           
            string recId = lnkedit.CommandArgument;
            Response.Redirect("Payment.aspx");
        }
        protected void btnAssmnt_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnStudId"] = lnkedit.CommandArgument;

            string recId = lnkedit.CommandArgument;
            Response.Redirect("Assessment.aspx");
        }
        protected void btnAttnd_Click(object sender, EventArgs e)
        {
            LinkButton lnkedit = sender as LinkButton;
            Session["SesnStudId"] = lnkedit.CommandArgument;

            string recId = lnkedit.CommandArgument;
            Response.Redirect("Attendance.aspx");
        }
    }
}
