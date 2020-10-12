using CRM.Common;
using System;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Default : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetCourse();
                Getlocation();
                GetAssgnTo();
                GetEnqSource();
                GetEnquries();
            }

        }
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
            ddlSource.DataSource = enqsource; //sk
            ddlSource.DataTextField = "Name";
            ddlSource.DataValueField = "EnqSrcId";
            ddlSource.DataBind();
            ddlSource.Items.Insert(0, new ListItem("----Select---", "0"));
        }
        private void GetEnquries()
        {
            rptEnqs.DataSource = dbconn.PR_GetLeads();
            rptEnqs.DataBind();
        }
        protected void BtnEnqSave_Click(object sender, EventArgs e)
        {
            if (hdnEdit.Value != "Edit")
            {
                EnableControls();
                try
                {
                    MstEnquiry objEnqIns = new MstEnquiry();
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
                    // objStudent.CreatedBy = UserName;
                    dbconn.MstEnquiries.InsertOnSubmit(objEnqIns);
                    dbconn.SubmitChanges();

                }
                catch (Exception ex)
                {
                    objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }
            else
            {
                try
                {

                    MstEnquiry objEnqUpd = dbconn.MstEnquiries.Single(M => M.EnqId == Convert.ToInt32(hdnId.Value));
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
                    //objEnqIns.EnqDate = DateTime.Now;
                    // objStudent.CreatedBy = UserName;
                    dbconn.SubmitChanges();
                    hdnEdit.Value = "Add";
                }
                catch (Exception ex)
                {
                    objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to update the record. Please contact Support Team','','error')</script>", false);
                }
            }
            GetEnquries();
        }

        protected void btnEdt_Click(object sender, EventArgs e)
        {
            // hdnEdit.Value = "Add";
            EnableControls();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "Openpopup();", true);
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string id = hdnId.Value;
            hdnEdit.Value = "Edit";
            lblEnqId.Text = hdnId.Value.ToString();
            var EnqEdit = from objEnqEdt in dbconn.MstEnquiries
                          where objEnqEdt.EnqId == Convert.ToInt32(hdnId.Value)
                          select objEnqEdt;
            foreach (MstEnquiry EE in EnqEdit)
            {
                txtFname.Text = EE.FirstName;
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
            }
            DisableControls(this.Controls);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "Openpopup();", true);

        }
        protected void EnableControls()
        {
            txtFname.Enabled = true;
            txtFname.CssClass = "form-control";
            txtLname.Enabled = true;
            txtLname.CssClass = "form-control";
            txtContactno.Enabled = true;
            txtContactno.CssClass = "form-control";
            txtEmail.Enabled = true;
            txtEmail.CssClass = "form-control";
            txtParent.Enabled = true;
            txtParent.CssClass = "form-control";
            txtaddress1.Enabled = true;
            txtaddress1.CssClass = "form-control";
            ddlGender.Enabled = true;
            ddlGender.CssClass = "form-control";
            DDLCourse.Enabled = true;
            DDLCourse.CssClass = "form-control";
            DDLloc.Enabled = true;
            DDLloc.CssClass = "form-control";
            ddlAssigned.Enabled = true;
            ddlAssigned.CssClass = "form-control";
            ddlSource.Enabled = true;
            ddlSource.CssClass = "form-control";
        }
        public void DisableControls(ControlCollection ctrls)
        {
            txtFname.Enabled = false;
            txtFname.CssClass = "form-control";
            txtLname.Enabled = false;
            txtLname.CssClass = "form-control";
            txtContactno.Enabled = false;
            txtContactno.CssClass = "form-control";
            txtEmail.Enabled = false;
            txtEmail.CssClass = "form-control";
            txtParent.Enabled = false;
            txtParent.CssClass = "form-control";
            txtaddress1.Enabled = false;
            txtaddress1.CssClass = "form-control";
            ddlGender.Enabled = false;
            ddlGender.CssClass = "form-control";
            DDLCourse.Enabled = false;
            DDLCourse.CssClass = "form-control";
            DDLloc.Enabled = false;
            DDLloc.CssClass = "form-control";
            ddlAssigned.Enabled = false;
            ddlAssigned.CssClass = "form-control";
            ddlSource.Enabled = false;
            ddlSource.CssClass = "form-control";
        }
        protected void btnstureg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx?stdid=" + hdnId.Value);
        }
    }
}