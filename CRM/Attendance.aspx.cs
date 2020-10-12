using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM
{
    public partial class Attendance : System.Web.UI.Page
    {
        private DbRoutines objCon = new DbRoutines();
        private AppErrorLog objLog = new AppErrorLog();
        //private LMS_Encript.AES_Encrypt_Decrypt LMSENDE = new LMS_Encript.AES_Encrypt_Decrypt();
        LinqDBDataContext dbconn = new LinqDBDataContext();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ConnectionString);
        private LinqDBDataContext objLinq = new LinqDBDataContext();
        public string mStudId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            //{
            //    mStudId = Session["SesnStudId"].ToString();
            //    var StudEdit = from objstd in dbconn.MstStudents
            //                   where objstd.StudId == Convert.ToInt32(mStudId)
            //                   select objstd;
            //    foreach (MstStudent EE in StudEdit)
            //    {
            //        txtStudent.Text = EE.FirstName.ToString() + " " + EE.LastName.ToString();
            //        txtstudId.Text = EE.StudId.ToString();
                   

            //    }
            //}
            if (!Page.IsPostBack)
            {
                
                GetCourse();
                GetAttendees();
                GetLocation();
            }
            
        }
        void GetCourse()
        {
            var cou = (from objcou in dbconn.MstCourses
                           //join objcou in dbconn.MstCourses on objcourse.CourseId equals objcou.CourseId
                       orderby objcou.CourseId

                       select new
                       {

                           Name = objcou.CourseName,
                           objcou.CourseId


                       }
                                  ).ToList();
            ddlcourse.DataSource = cou.Distinct();
            ddlcourse.DataTextField = "Name";
            ddlcourse.DataValueField = "CourseId";
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetLocation()
        {
            var Loc = (from objloc in dbconn.MstLocations
                       orderby objloc.LocId

                       select new
                       {

                           Name = objloc.LocName,
                           objloc.LocId


                       }
                                  );
            ddllocation.DataSource = Loc;
            ddllocation.DataTextField = "Name";
            ddllocation.DataValueField = "LocId";
            ddllocation.DataBind();
            ddllocation.Items.Insert(0, new ListItem("Select", "0"));
        }
        private void GetAttendees()
        {
            rptattnd.DataSource = dbconn.PR_GetAttendees();
            rptattnd.DataBind();
        }
        //protected void btnAttndEdt_Click(object sender, EventArgs e)
        //{

        //    LinkButton lnkedit = sender as LinkButton;
        //    Session["SesnStudId"] = lnkedit.CommandArgument;
        //    Session["SesnMode"] = "Edit";
        //    string recId = lnkedit.CommandArgument;
        //    Response.Redirect("Attendance.aspx");
        //}

        protected void BtnAttndSave_Click(object sender, EventArgs e)
        {
            try
            {
                MstAttendance objattnd = new MstAttendance();
                objattnd.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
                objattnd.LocId = Convert.ToInt32(ddllocation.SelectedValue);
                objattnd.AttendDate = Convert.ToDateTime(txtdate.Text);
                objattnd.InTime = Convert.ToDateTime(txtIN.Text);
                objattnd.OutTime = Convert.ToDateTime(txtOUT.Text);
                objattnd.StudId = Convert.ToInt32(txtstudId.Text);

                dbconn.MstAttendances.InsertOnSubmit(objattnd);
                dbconn.SubmitChanges();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
            }
            GetAttendees();
        }
    }
}