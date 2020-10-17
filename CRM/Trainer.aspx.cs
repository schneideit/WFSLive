using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;

namespace CRM
{
    public partial class Trainer : System.Web.UI.Page
    {
        private DbRoutines objCon = new DbRoutines();
        private AppErrorLog objLog = new AppErrorLog();
        //private LMS_Encript.AES_Encrypt_Decrypt LMSENDE = new LMS_Encript.AES_Encrypt_Decrypt();

        private LinqDBDataContext objLinq = new LinqDBDataContext();
        private string UserName;
        
        
        LinqDBDataContext dbconn = new LinqDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetTrCourse();
                GetTrnrDet();
            }
        }
        void GetTrCourse()
        {
            var cou = (from objco in dbconn.MstCourses
                           //join objco in dbconn.MstCourses on objc.CourseId equals objco.CourseId
                       orderby objco.CourseId

                       select new
                       {

                           Name = objco.CourseName,
                           objco.CourseId


                       }
                                  ).ToList();
            ddltrcourse.DataSource = cou;
            ddltrcourse.DataTextField = "Name";
            ddltrcourse.DataValueField = "CourseId";
            ddltrcourse.DataBind();
            //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        }

        // To Save Unit
        private void SaveRecord()
        {
            // Creating new record Object
            MstTrainer objtrainer = new MstTrainer();

            // Assigning Save Parameters
            objtrainer.FirstName = txtFname.Text;
            objtrainer.LastName = txtLname.Text;
            objtrainer.Address = txtaddress1.Text;
            objtrainer.ContactNo = txtContactno.Text;
            objtrainer.CourseId = Convert.ToInt32(ddltrcourse.SelectedValue);
            objtrainer.IsActive = Chkactive.Checked;
            
            objLinq.MstTrainers.InsertOnSubmit(objtrainer);
            objLinq.SubmitChanges();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Record Saved successfully');", true);
            GetTrnrDet();
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Trainer.aspx");
        }

        protected void Btnsave(object sender, EventArgs e)
        {
            try
            {
                this.SaveRecord();
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Could not save !!! : " + ex.Message.ToString() + "');", true);
                //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }

        private void GetTrnrDet()
        {
            rptrnr.DataSource = dbconn.PR_GetTrainer();
            rptrnr.DataBind();
        }
    }
}