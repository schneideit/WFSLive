using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;


namespace CRM
{
    public partial class Leads : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        public string mEnqid;  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["SesnEnqid"] as string))
            {
                mEnqid = Session["SesnEnqid"].ToString();
            }
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["SesnEnqid"] as string))
                {
                    GetRecord();
                    GetFollowups();
                }
                else
                {
                    txtdt.Text = DateTime.Now.ToString("yyyy/mm/dd");
                    GetCourse();
                    Getlocation();
                    GetAssgnTo();
                    GetEnqSource();
                   
                }
            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEnqType.SelectedValue == "Facility Booking")
            {
                txtSchool.Visible = false;
                divfenq.Visible = true;
            }
            if (ddlEnqType.SelectedValue == "Schools")
            {
                txtSchool.Visible = true;
                divfenq.Visible = false;
            }
            if (ddlEnqType.SelectedValue == "Individual")
            {
                txtSchool.Visible = false;
                divfenq.Visible = false;
            }
        }

        #region Followup Details
        private void GetFollowups()
        {
            rptFolwup.DataSource = dbconn.PR_GetFollowupDet();
            rptFolwup.DataBind();
        }
        protected void btnFlwEdit_Click(object sender, EventArgs e)
        {

            LinkButton lnkedit = sender as LinkButton;
            Session["SesnFollowupid"] = lnkedit.CommandArgument;
            Session["SesnMode"] = "Edit";
            string mFlwId = lnkedit.CommandArgument;
            DisplayFollowups();
        }
        void DisplayFollowups()
        {
            var FlwEdit = from objFlwEdt in dbconn.MstFollowUps
                          where objFlwEdt.EnqId == Convert.ToInt32(Session["SesnFollowupid"])
                          select objFlwEdt;
            foreach (MstFollowUp FU in FlwEdit)
            {
                txtfolwdt.Text = Convert.ToDateTime(FU.FollowupDate).ToString("yyyy-MM-dd");
                txtremarks.Text = FU.Remarks.Trim();
                ddlFolStatus.SelectedValue = FU.FollowupStatus;
                txtoutcome.Text = FU.Outcome.Trim();
                if (FU.NextFollowup.ToString() != string.Empty)
                {
                    //objFollowUp.NextFollowUp = DateTime.ParseExact(dteNextFollowupdate.Text, "dd/MM/yyyy", null);
                    txtNxtFldt.Text = Convert.ToDateTime(FU.NextFollowup).ToString("yyyy-MM-dd");
                }

            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtfolwdt.Text = "";
            txtremarks.Text = "";
            txtoutcome.Text = "";
            txtNxtFldt.Text = "";
            Session["SesnMode"] = "Add";
        }
            protected void btnFlwSave_Click(object sender, EventArgs e)
            {
            if (string.IsNullOrEmpty(Session["SesnFollowupid"] as string) || Session["SesnMode"].ToString() == "Add")
            {
                try
                {
                    MstFollowUp objFlwIns = new MstFollowUp();
                    objFlwIns.FollowupDate = Convert.ToDateTime((txtfolwdt.Text));
                    objFlwIns.Remarks = txtremarks.Text.Trim();
                    objFlwIns.Outcome = txtoutcome.Text.Trim();
                    objFlwIns.NextFollowup = Convert.ToDateTime(txtNxtFldt.Text);
                    objFlwIns.EnqId = Convert.ToInt32(mEnqid);
                    objFlwIns.FollowupStatus = ddlEnqStatus.SelectedValue;
                    dbconn.MstFollowUps.InsertOnSubmit(objFlwIns);
                    dbconn.SubmitChanges();
                    DisplayFollowups();
                }

                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }
            else
            {
                try
                {
                    MstFollowUp objFlwUpd = dbconn.MstFollowUps.Single(F => F.FollowId == Convert.ToInt32(Session["SesnFollowupid"].ToString()));
                    objFlwUpd.EnqId = Convert.ToInt32(Session["SesnEnqid"].ToString());
                    objFlwUpd.FollowupDate = Convert.ToDateTime(txtfolwdt.Text);
                    objFlwUpd.Remarks = txtremarks.Text.Trim();
                    objFlwUpd.Outcome = txtoutcome.Text.Trim();
                    objFlwUpd.NextFollowup = Convert.ToDateTime(txtNxtFldt.Text);
                    objFlwUpd.EnqId = Convert.ToInt32(mEnqid); ;
                    objFlwUpd.FollowupStatus = ddlEnqStatus.SelectedValue;
                    dbconn.SubmitChanges();
                    DisplayFollowups();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }
            
        }
        #endregion Followup Details
        void GetCourse()
        {
            var cour = (from objcour in dbconn.MstCourses
                            //join objcou in dbconn.MstCourses on objcourse.CourseId equals objcou.CourseId
                        orderby objcour.CourseName

                        select new
                        {
                            Name = objcour.CourseName,
                            objcour.CourseId
                        }
                                  ).ToList();
            DDLCourse.DataSource = cour.Distinct();
            DDLCourse.DataTextField = "Name";
            DDLCourse.DataValueField = "CourseId";
            DDLCourse.DataBind();
            DDLCourse.Items.Insert(0, new ListItem("----Select---", "0"));
        }
        void Getlocation()
        {
            var loca = (from objlocat in dbconn.MstLocations
                        orderby objlocat.LocName
                        select new
                        {
                            Name = objlocat.LocName,
                            objlocat.LocId
                        }
                                  ).ToList();
            DDLloc.DataSource = loca;
            DDLloc.DataTextField = "Name";
            DDLloc.DataValueField = "LocId";
            DDLloc.DataBind();
            DDLloc.Items.Insert(0, new ListItem("----Select---", "0"));
        }

        void GetAssgnTo()
        {
            var assgn = (from objassgn in dbconn.MstUsers
                         orderby objassgn.FirstName
                         select new
                         {
                             Name = objassgn.FirstName,
                             objassgn.UserId
                         }
                                 ).ToList();
            ddlAssigned.DataSource = assgn;
            ddlAssigned.DataTextField = "Name";
            ddlAssigned.DataValueField = "UserId";
            ddlAssigned.DataBind();
        }
        void GetEnqSource()
        {
            var enqsource = (from objsrc in dbconn.MstEnqSources
                             orderby objsrc.SourceName

                             select new
                             {
                                 Name = objsrc.SourceName,
                                 objsrc.EnqSrcId
                             }
                                  ).ToList();
            ddlSource.DataSource = enqsource;  
            ddlSource.DataTextField = "Name";
            ddlSource.DataValueField = "EnqSrcId";
            ddlSource.DataBind();
            ddlSource.Items.Insert(0, new ListItem("----Select---", "0"));
        }
        protected void BtnEnqSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["SesnEnqid"] as string))
            {
                try
                {
                    MstEnquiry objEnqIns = new MstEnquiry();
                    objEnqIns.EnqType = ddlEnqType.SelectedValue;
                    objEnqIns.FirstName = txtFname.Text;
                    objEnqIns.LastName = txtLname.Text;
                    objEnqIns.Gender = ddlGender.SelectedValue;
                    objEnqIns.ParentName = txtParent.Text;
                    objEnqIns.Address = txtaddress1.Text;
                    objEnqIns.Contact = txtContactno.Text;
                    objEnqIns.Email = txtEmail.Text;
                    objEnqIns.CourseId = Convert.ToInt32(DDLCourse.SelectedValue);
                    objEnqIns.LocId = Convert.ToInt32(DDLloc.SelectedValue);
                    objEnqIns.AssignTo = Convert.ToInt32(ddlAssigned.SelectedValue);
                    objEnqIns.EnqSrcId = Convert.ToInt32(ddlSource.SelectedValue);
                    objEnqIns.EnqDate = DateTime.Now;
                    objEnqIns.EnqStatus = ddlEnqStatus.SelectedValue;
                    dbconn.MstEnquiries.InsertOnSubmit(objEnqIns);
                    dbconn.SubmitChanges();

                }
                catch (Exception ex)
                {
                  ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }
            else
            {
                try
                {

                    MstEnquiry objEnqUpd = dbconn.MstEnquiries.Single(M => M.EnqId == Convert.ToInt32(mEnqid));
                    objEnqUpd.EnqType = ddlEnqType.SelectedValue;
                    objEnqUpd.FirstName = txtFname.Text;
                    objEnqUpd.LastName = txtLname.Text;
                    objEnqUpd.Gender = ddlGender.SelectedValue;
                    objEnqUpd.ParentName = txtParent.Text;
                    objEnqUpd.Address = txtaddress1.Text;
                    objEnqUpd.Contact = txtContactno.Text;
                    objEnqUpd.Email = txtEmail.Text;
                    objEnqUpd.CourseId = Convert.ToInt32(DDLCourse.SelectedValue);
                    objEnqUpd.LocId = Convert.ToInt32(DDLloc.SelectedValue);
                    objEnqUpd.AssignTo = Convert.ToInt32(ddlAssigned.SelectedValue);
                    objEnqUpd.EnqSrcId = Convert.ToInt32(ddlSource.SelectedValue);
                    objEnqUpd.EnqStatus = ddlEnqStatus.ToString();
                    dbconn.SubmitChanges();
                     

                }
                catch (Exception ex)
                {
                    //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to update the record. Please contact Support Team','','error')</script>", false);
                }
            }
        
            Response.Redirect("ListEnquiry.aspx");
        }

        protected void GetRecord()
        {

            var EnqEdit = from objEnqEdt in dbconn.MstEnquiries
                          where objEnqEdt.EnqId == Convert.ToInt32(mEnqid)
                          select objEnqEdt;
            foreach (MstEnquiry EE in EnqEdit)
            {
                txtdt.Text = EE.EnqDate.ToString();
                ddlEnqType.SelectedValue = EE.EnqType;
                if (ddlEnqType.SelectedValue == "Facility Booking")
                    divfenq.Visible = true;
                txtFname.Text = EE.FirstName;
                lblfname.Text = EE.FirstName;
                txtLname.Text = EE.LastName;
                ddlGender.SelectedItem.Text = EE.Gender.ToString();
                txtEmail.Text = EE.Email;
                txtParent.Text = EE.ParentName;
                txtContactno.Text = EE.Contact;
                txtaddress1.Text = EE.Address;
                GetCourse();
                DDLCourse.SelectedValue = EE.CourseId.ToString();
                GetEnqSource();
                ddlSource.SelectedValue = EE.EnqSrcId.ToString();
                Getlocation();
                DDLloc.SelectedValue = EE.LocId.ToString();
                GetAssgnTo();
                ddlAssigned.SelectedValue = EE.AssignTo.ToString();
                ddlEnqStatus.SelectedValue = EE.EnqStatus.ToString();
            }

        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {
          Response.Redirect("ListEnquiry.aspx");
        }
    }
}