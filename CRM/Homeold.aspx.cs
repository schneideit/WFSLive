using CRM.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Home : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               GetEnquries();
            }

        }
        private void GetEnquries()
        {
            //rptEnq.DataSource = dbconn.PR_GetLeads();
            //rptEnq.DataBind();
        }


    }
}