//**********************************************************************************************
//Name          : Students
//Parameters    :
//Description   : Add/Edit Students
//Author        : Kadarsha
//CreatedOn     : 207-08-20
//**********************************************************************************************
//SLNo      UpdatedOn      UpdatedBy       Description
//M001
//**********************************************************************************************

using CRM.Common;
using System;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;


namespace CRM
{
    public partial class Students : System.Web.UI.Page
    {
        #region Global Declaration

        private DbRoutines objCon = new DbRoutines();
        private AppErrorLog objLog = new AppErrorLog();
        private LMS_Encript.AES_Encrypt_Decrypt LMSENDE = new LMS_Encript.AES_Encrypt_Decrypt();

        private LinqDBDataContext objLinq = new LinqDBDataContext();

        #endregion Global Declaration
        public int stdid;
        #region Master Variables

        private string UserName;

        #endregion Master Variables
        LinqDBDataContext dbconn = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Request.QueryString["enqid"] != null)
                {
                    GetEnqDet();
                }
                //GetCourse();
                BindGrid();
            }
            
            try
            {
                objCon.IsLoggedIn();
                UserName = LMSENDE.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString();
                if (!IsPostBack)
                {
                    this.ClearFields();
                    if (Request.QueryString["ViewId"] != null && Request.QueryString["ViewId"] != "" && Request.QueryString["Action"] == "Edit")
                    {
                        EditRecord(Convert.ToInt32(Request.QueryString["ViewId"]));
                    }
                    if (Request.QueryString["ViewId"] != null && Request.QueryString["ViewId"] != "" && Request.QueryString["Action"] == "View")
                    {
                        ViewRecord(Convert.ToInt32(Request.QueryString["ViewId"]));
                    }
                }
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }
        void GetEnqDet()
        {
            var Stdreg = from objStd in dbconn.MstEnquiries
                         where objStd.EnqId == Convert.ToInt32(Request.QueryString["enqid"])
                         select objStd;
            foreach (MstEnquiry student in Stdreg)
            {
                txtFname.Text = student.FirstName.ToString();
                txtLname.Text = student.LastName.ToString();
                ddlGender.SelectedItem.Text = student.Gender.ToString();
               
                txtParent.Text = student.ParentName.ToString();
                txtaddress1.Text = student.Address.ToString();
                txtEmail.Text = student.Email.ToString();
                txtContactno.Text = student.Contact.ToString();
                //ddlloc.SelectedItem.Text = student.Location.ToString();
                //ddlcou.SelectedItem.Text = student.Course.ToString();
                
            }
        }
        //void GetCourse()
        //{
        //    var cou = (from objcou in dbconn.MstCourses
        //               //join objcou in dbconn.MstCourses on objcourse.CourseId equals objcou.CourseId
        //               orderby objcou.CourseId

        //               select new
        //               {

        //                   Name = objcou.CourseName,
        //                   objcou.CourseId


        //               }
        //                          ).ToList();
        //    ddlcou.DataSource = cou.Distinct();
        //    ddlcou.DataTextField = "Name";
        //    ddlcou.DataValueField = "CourseId";
        //    ddlcou.DataBind();
        //    //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        //}
        //void Getlocate()
        //{
        //    var loc = (from objlocate in dbconn.MstLocations
        //               join objloc in dbconn.Tbl_TrnSchedules on objlocate.LocId equals objloc.LocationId
        //               where objloc.CourseId == Convert.ToUInt32(ddlcou.SelectedValue)

        //               select new
        //               {

        //                   Name = objlocate.LocName,
        //                   objloc.LocationId


        //               }
        //                          ).ToList();
        //    ddlloc.DataSource = loc;
        //    ddlloc.DataTextField = "Name";
        //    ddlloc.DataValueField = "LocationId";
        //    ddlloc.DataBind();
        //    //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        //}
        //void Getschedule()
        //{
        //    var sch = (from objsch in dbconn.Tbl_TrnSchedules
        //               where objsch.CourseId == Convert.ToUInt32(ddlcou.SelectedValue)
        //               && objsch.LocationId == Convert.ToUInt32(ddlloc.SelectedValue)
        //               select new
        //               {

        //                   Name = objsch.ScheduleName,
        //                   objsch.TSchdlId


        //               }
        //                          ).ToList();
        //    ddlsch.DataSource = sch;
        //    ddlsch.DataTextField = "Name";
        //    ddlsch.DataValueField = "TSchdlId";
        //    ddlsch.DataBind();
        //    //ddlteamid.Items.Insert(0, new ListItem("Select", "0"));
        //}


        protected void UploadFile(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Uploads/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUploadpic.SaveAs(folderPath + Path.GetFileName(FileUploadpic.FileName));

            //Display the success message.
            lblMessage.Text = Path.GetFileName(FileUploadpic.FileName) + " has been uploaded.";
        }
        private void BindGrid()
        {


            //GrdStudent.DataSource = dbconn.PR_Student();
            //GrdStudent.DataBind();

        }

        #region Edit

        // To Edit Records
        private void EditRecord(int StuId)
        {
            var objGetRecords = (from objGetRecord in objLinq.PR_GetStudById(StuId)
                                 select objGetRecord);

            foreach (PR_GetStudByIdResult objstudents in objGetRecords)
            {
                lblUnitId.Text = objstudents.ViewId.ToString();
                txtFname.Text = objstudents.FirstName;
                txtLname.Text = objstudents.LastName;
                txtContactno.Text = objstudents.ContactNo;
                ddlGender.SelectedValue = objstudents.Gender;
                txtDob.Text = Convert.ToDateTime(objstudents.DOB).ToString("dd/MM/yyyy");
                txtParent.Text = objstudents.ParentName;
                txtaddress1.Text = objstudents.Address1;
                txtaddress2.Text = objstudents.Address2;
                txtContactno.Text = objstudents.ContactNo;
                txtEmail.Text = objstudents.Email;
                txtEContactno.Text = objstudents.EmergencyContact;
                //     objStudent.BloodGroup = ddlBloodGrp.SelectedValue ;
                //     objStudent.StudentStatus = ddlStudStatus.SelectedValue;

                // Show Update Button and Hide Save Button
                BtnSave.Visible = false;
                BtnUpdate.Visible = true;
            }
        }

        #endregion Edit

        #region View

        // To Edit
        private void ViewRecord(int StudId)
        {
            var objGetDatas = (from objGetData in objLinq.PR_GetStudById(StudId)
                               select objGetData);

            foreach (PR_GetStudByIdResult objStudent in objGetDatas)
            {
                lblUnitId.Text = objStudent.ViewId.ToString();
                txtFname.Text = objStudent.FirstName;
                txtLname.Text = objStudent.LastName;
                txtContactno.Text = objStudent.ContactNo;
                txtParent.Text = objStudent.ParentName;
                txtDob.Text = Convert.ToDateTime(objStudent.DOB).ToString("dd/MM/yyyy");
                txtaddress1.Text = objStudent.Address1;
                txtaddress2.Text = objStudent.Address2;
                txtEmail.Text = objStudent.EmergencyContact;
                txtEmail.Text = objStudent.Email;

                // Show Update Button and Hide Save Button
                BtnSave.Visible = false;
                BtnUpdate.Visible = true;

                BtnSave.Visible = false;
                BtnUpdate.Visible = false;
                BtnClear.Visible = false;
            }
        }

        #endregion View

        #region Add

        // Button Click Event to Add record
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                this.ClearFields();
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }

        #endregion Add

        #region Save

        // Button Click Event to Save record
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.SaveRecord();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", "<script>showpop5('Record Saved Successfully')</script>", false);
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }

        // To Save Unit
        private void SaveRecord()
        {
            try
            {
                MstStudent objStudent = new MstStudent();
                objStudent.FirstName = txtFname.Text;
                objStudent.LastName = txtLname.Text;
                objStudent.Gender = ddlGender.SelectedValue;
                objStudent.DOB = Convert.ToDateTime(txtDob.Text);
                objStudent.ParentName = txtParent.Text;
                objStudent.Address1 = txtaddress1.Text;
                objStudent.Address2 = txtaddress2.Text;
                objStudent.ContactNo = txtContactno.Text;
                objStudent.EmergencyContact = txtEContactno.Text;
                objStudent.CreatedBy = UserName;
                objStudent.Email = txtEmail.Text;
                objStudent.UAEId = txtemid.Text;
                objStudent.Expdate = Convert.ToDateTime(txtedate.Text);
               
                objLinq.MstStudents.InsertOnSubmit(objStudent);
                objLinq.SubmitChanges();

                var enq = (from objstd in dbconn.MstStudents
                           orderby objstd.StudId descending
                           select objstd.StudId).FirstOrDefault();

                stdid = Convert.ToInt32(enq);
                HdnStdId.Value = stdid.ToString();
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }

            //try
            //{
            //    Tbl_Enquiry objenq = new Tbl_Enquiry();
            //    objenq.CourseId = Convert.ToInt32(ddlcou.SelectedValue);
            //    objenq.TSchdlId = Convert.ToInt32(ddlsch.SelectedValue);
            //    objLinq.Tbl_Enquiries.InsertOnSubmit(objenq);
            //    objLinq.SubmitChanges();
            //}
            //catch (Exception ex)
            //{
            //    objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            //}

            //try
            //{
            //    Tbl_TrnSchedule objtr = new Tbl_TrnSchedule();
            //    objtr.LocationId = Convert.ToInt32(ddlloc.SelectedValue);
            //    objLinq.Tbl_TrnSchedules.InsertOnSubmit(objtr);
            //    objLinq.SubmitChanges();
            //}
            //catch (Exception ex)
            //{
            //    objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            //}
            
            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
            string folderPath = Server.MapPath("~/Uploads/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUploadpic.SaveAs(folderPath + Path.GetFileName(FileUploadpic.FileName));

            //Display the success message.
            lblMessage.Text = Path.GetFileName(FileUploadpic.FileName) + " has been uploaded.";
        }

        #endregion Save

        #region Clear

        // Button Click Event to Clear Unit
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            try
            {
                this.ClearFields();
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }

        // To Clear Unit Fields
        private void ClearFields()
        {
            foreach (Control ctrl in this.Controls)
            {
                if (ctrl is TextBox)
                {
                    ((TextBox)ctrl).Text = string.Empty;
                }
                else if (ctrl is DropDownList)
                {
                    ((DropDownList)ctrl).SelectedIndex = 0;
                }
                else if (ctrl is CheckBoxList)
                {
                    ((CheckBoxList)ctrl).SelectedIndex = 0;
                }
                else if (ctrl is ListBox)
                {
                    ((ListBox)ctrl).SelectedIndex = 0;
                }
                else if (ctrl is RadioButtonList)
                {
                    ((RadioButtonList)ctrl).SelectedIndex = 0;
                }
            }
            lblUnitId.Text = "0";
            // Show Save Button and Hide Update Button
            BtnSave.Visible = true;
            BtnUpdate.Visible = false;
        }

        #endregion Clear

        #region Update

        // Button Click Event to Update Unit
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                this.UpdateRecs();
                string text6 = "Record Updated Successfully";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", "<script>showpop5('" + text6 + "')</script>", false);
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "CRM");
            }
        }

        // To Update Unit
        private void UpdateRecs()
        {
            // Selecting Records to the Object
            MstStudent objStudent = objLinq.MstStudents.Single(M => M.StudId == Convert.ToInt32(lblUnitId.Text));

            // Assigning Update Parameters
            objStudent.FirstName = txtFname.Text;
            objStudent.LastName = txtLname.Text;
            objStudent.Gender = ddlGender.SelectedValue;
            objStudent.DOB = Convert.ToDateTime(txtDob.Text);
            objStudent.Address1 = txtaddress1.Text;
            objStudent.Address2 = txtaddress2.Text;
            objStudent.ContactNo = txtContactno.Text;
            objStudent.EmergencyContact = txtEmail.Text;
            //     objStudent.BloodGroup = ddlBloodGrp.SelectedValue ;
            //     objStudent.StudentStatus = ddlStudStatus.SelectedValue;
            objStudent.UpdatedBy = UserName;
            objStudent.UpdatedOn = DateTime.Now;
            objLinq.SubmitChanges();
        }

        #endregion Update

        //protected void ddlcou_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Getlocate();
        //}

        //protected void ddlloc_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Getschedule();
        //}

        //protected void ddlsch_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ConnectionString);

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("Select ft.FeeType, fd.FeeAmount From Tbl_FeeDetail fd Inner Join MstCourseFee cf on cf.CFeeId = fd.CFeeId inner join MstFeeType ft on fd.FeeTypeId = ft.FeeTypeId inner join Tbl_TrnSchedule ts on cf.TSchdlId = ts.TSchdlId where ts.TSchdlId = ddlschdl.selectedvalue", con);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);

        //    //var priv =  from objfee in dbconn.Tbl_FeeDetails
        //    //            join objcou in dbconn.MstCourseFees on objfee.CFeeId equals objcou.CFeeId
        //    //            orderby objcou.TSchdlId descending
        //    //            select objfee.FeeAmount;
            
        //    Label1.Text = cmd.ToString();
            
        //}

        //protected void GrdStudent_rowcommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //{
        //    if (e.CommandArgs.CommandName == "Edit")
        //    {
        //        try
        //        {
        //            var Studedit = from objStd in dbconn.MstStudents
        //                           where objStd.StudId == Convert.ToInt32(e.CommandArgs.CommandArgument.ToString())
        //                           select objStd;

        //            HdnEdit.Value = e.CommandArgs.CommandArgument.ToString();
        //            HdnStdId.Value = e.CommandArgs.CommandArgument.ToString();

        //            foreach (MstStudent stud in Studedit)
        //            {
        //                HdnEdit.Value = stud.StudId.ToString();
        //                txtFname.Text = stud.FirstName.ToString();
        //                txtParent.Text = stud.ParentName.ToString();
        //                txtaddress1.Text = stud.Address1.ToString();
        //                txtaddress2.Text = stud.Address2.ToString();
        //                txtEmail.Text = stud.Email.ToString();
        //                txtDob.Text=  stud.DOB.ToString();
        //                txtemid.Text = stud.UAEId.ToString();
        //                txtedate.Text = stud.Expdate.ToString();
        //                txtEContactno.Text = stud.EmergencyContact.ToString();
        //                txtContactno.Text = stud.ContactNo.ToString();
        //                BtnSave.Text = "Update";
        //            }
        //        }

        //        catch (Exception ex)
        //        {
        //            objLog.ErrorLog("Student", "GrdStudent_rowcommand", ex.Message.ToString(), LMSENDE.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString(), AppErrorLog.ErrorLogMethods.TextFile, "EBS_ERP");
        //        }

        //    }
        //}

        protected void Btnpay_Click(object sender, EventArgs e)
        {
            Response.Redirect("FeePayment.aspx?stdid=" + HdnStdId.Value);
        }
    }
}
    
