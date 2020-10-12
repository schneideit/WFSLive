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
    public partial class Assessment : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                mStudId = Session["SesnStudId"].ToString();
                var StudEdit = from objstd in dbconn.MstStudents
                               where objstd.StudId == Convert.ToInt32(mStudId)
                               select objstd;
                foreach (MstStudent EE in StudEdit)
                {
                    txtStudent.Text = EE.FirstName.ToString() + " " + EE.LastName.ToString();
                    txtstudid.Text = EE.StudId.ToString();
                    GetCourse();

                }
            }
            if (!Page.IsPostBack)
            {
                GetCourse();
                GetTrainer();
                GetAssessor();
            }
        }
        void GetCourse()
        {
            var cou = (from objcourse in dbconn.MstCourses

                       orderby objcourse.CourseName

                       select new
                       {

                           Name = objcourse.CourseName,
                           objcourse.CourseId


                       }
                                  );
            ddlcourse.DataSource = cou;
            ddlcourse.DataTextField = "Name";
            ddlcourse.DataValueField = "CourseId";
            ddlcourse.DataBind();
            //ddlcourse.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetTrainer()
        {
            var train = (from objtrain in dbconn.MstTrainers
                         orderby objtrain.TrainerId

                         select new
                         {

                             Name = objtrain.FirstName,
                             objtrain.TrainerId


                         }
                                  );
            ddltrainer.DataSource = train;
            ddltrainer.DataTextField = "Name";
            ddltrainer.DataValueField = "TrainerId";
            ddltrainer.DataBind();
            //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        }
        void GetAssessor()
        {
            var assgn = (from objassgn in dbconn.MstUsers
                         orderby objassgn.UserId

                         select new
                         {

                             Name = objassgn.FirstName,
                             objassgn.UserId


                         }
                                 ).ToList();
            ddlassign.DataSource = assgn;
            ddlassign.DataTextField = "Name";
            ddlassign.DataValueField = "UserId";
            ddlassign.DataBind();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Tbl_Assessment objass = new Tbl_Assessment();
            objass.StudId = Convert.ToInt32(txtstudid.Text);
            objass.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
            objass.TrainerId = Convert.ToInt32(ddltrainer.SelectedValue);
            objass.AssessDate = Convert.ToDateTime(txtadate.Text);
            objass.SLevel = Convert.ToString(ddllevel.SelectedValue);
            objass.Grade = txtgrade.Text;
            objass.AssessorId = Convert.ToInt32(ddlassign.SelectedValue);
            objass.Remarks = txtremark.Text;

            objLinq.Tbl_Assessments.InsertOnSubmit(objass);
            objLinq.SubmitChanges();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Record Saved successfully');", true);
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Tbl_Assessment objass = objLinq.Tbl_Assessments.Single(M => M.AssessId == Convert.ToInt32(lblUnitId.Text));
            objass.StudId = Convert.ToInt32(HdnStdId.Value);
            objass.StudId = Convert.ToInt32(txtstudid.Text);
            objass.CourseId = Convert.ToInt32(ddlcourse.SelectedValue);
            objass.TrainerId = Convert.ToInt32(ddltrainer.SelectedValue);
            objass.AssessDate = Convert.ToDateTime(txtadate.Text);
            objass.SLevel = Convert.ToString(ddllevel.SelectedValue);
            objass.Grade = txtgrade.Text;
            objass.AssessId = Convert.ToInt32(ddlassign.SelectedValue);
            objass.Remarks = txtremark.Text;

            
            objLinq.SubmitChanges();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Record Updated successfully');", true);
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Assessment.aspx");
        }
    }
}