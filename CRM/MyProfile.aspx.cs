using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;

namespace CRM
{
    public partial class MyProfile : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        CommonClass cclass = new CommonClass();
        string ImageFile, FileName, FilePath, mStudId;
        string LeadPath = "D:/Beta/CRM/CRM/Uploads/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                mStudId = Session["SesnStudId"].ToString();
            }
            else
            {
                if (!IsPostBack)
                {
                    ImageUp(Convert.ToInt32(mStudId));

                }
            }
        }

        private void ImageUp(int mStudId)
        {
            try
            {
                var ObjImg = from objImgs in dbconn.MstStudents
                             where objImgs.StudId == Convert.ToInt32(mStudId)
                             select new
                             {
                                 objImgs.Imagepath
                             };

                foreach (var binds in ObjImg)
                {
                    ImageFile = binds.Imagepath;
                }
                if (ImageFile != "" && ImageFile != null)
                {
                    string url = (LeadPath).Replace('\\', '/');
                    ImgStudent.ImageUrl = (url + ImageFile);
                }
                else
                {
                    ImgStudent.ImageUrl = "Images/profile.jpg";
                }
            }
            catch (Exception ex)
            {
                objLog.ErrorLog("UserDetails", "ImageUp", ex.Message.ToString(), CRM.EncryptDecrypt.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString(), AppErrorLog.ErrorLogMethods.TextFile, "OnlineLMS");
            }

        }
        // Show Personal , Educational , Work , Uploaded Documents Details 
        private void BindPersonalDet()
        {
            try
            {
                string imge = "";
                var ObjImg = from objImgs in dbconn.MstStudents
                             where objImgs.StudId == (Convert.ToInt32(mStudId))
                             select new
                             {
                                 objImgs.Imagepath
                             };

                foreach (var binds in ObjImg)
                {
                    ImageFile = binds.Imagepath;
                }
                if (ImageFile != "" && ImageFile != null)
                {
                    string url = (LeadPath).Replace('\\', '/');
                    imge = (url + ImageFile);
                }
                else
                {
                    imge = "Images/profile.jpg";
                }
                var binddet = (from objstd in dbconn.MstStudents
                               where objstd.StudId == Convert.ToInt32(mStudId)
                               //  from obj in dbconn.MstEnrolledCoursesEnrolDetGet(Convert.ToInt32(mStudId))
                               select new
                               {
                                   objstd.FirstName,
                                   objstd.LastName,
                                   objstd.ParentName,
                                   objstd.ContactNo,
                                   objstd.Address1,
                                   objstd.Email,
                                   objstd.StudentId,
                                   objstd.UAEId,
                                   objstd.Expdate,
                                   objstd.Gender,
                                   objstd.DOB,
                                   Image = imge
                               }).ToList();

                rptprofiledet.DataSource = binddet;
                rptprofiledet.DataBind();

                var objEnroldt = dbconn.PR_GetStudentsbyId(Convert.ToInt32(mStudId)).SingleOrDefault();
                txtFname.Text = objEnroldt.FirstName.ToString();
                txtLname.Text = objEnroldt.LastName.ToString();
               // txtEmail.Text = objEnroldt.Email.ToString();


                if (objEnroldt.Gender != null)
                {
                    ddlGender.SelectedValue = objEnroldt.Gender.ToString();

                }
                txtEContactno.Text = objEnroldt.ContactNo.ToString();
                txtParent.Text = objEnroldt.ParentName;

                if (objEnroldt.DOB.ToString() != null && objEnroldt.DOB.ToString() != "")
                {
                    txtDOB.Text = Convert.ToDateTime(objEnroldt.DOB).ToString("yyyy-MM-dd");
                }

                txtaddress1.Text = objEnroldt.Address1;
                divProfile.Style.Add("display", "none");
                dvprof.Style.Add("display", "block");
            }
            catch (Exception ex)
            {
                //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), 'Admin', AppErrorLog.ErrorLogMethods.TextFile, "Athena");
            }
        }

        // Show Pop up for View and Edit Personal Details 
        protected void lnkeditpersonal_Click(object sender, EventArgs e)
        {
            dvprof.Style.Add("display", "none");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "OpenPersonaldetails();", true);

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            //try
            //{
            //    string FileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
            //    int fileSize = FileUpload1.PostedFile.ContentLength;
            //    if (FileExtention == ".png" || FileExtention == ".jpeg" || FileExtention == ".jpg")
            //    {
            //        if (fileSize <= (3145728))  // 3MB -> 3 * 1024 * 1024
            //        {

            //            FilePath = FileUpload1.PostedFile.FileName;
            //            FileName = Path.GetFileName(FilePath);
            //            string url = Server.MapPath(LeadPath).Replace('\\', '/');
            //            string pathToCreate = url + Convert.ToInt32(mStudId) + "_" + FileName;
            //            //    var objfiles = (from objfile in dbconn.MstUserDocsProfilePhotoGet(Convert.ToInt32(mStudId)) select objfile.FileName).SingleOrDefault();
            //            //    var UploadCount = (from objphoto in dbconn.MstUserDocsProfilePhotoCheck(Convert.ToInt32(mStudId)) select objphoto).Count();
            //            if (UploadCount > 0)
            //            {
            //                dbconn.MstUserDocsProfilePhotoUpdate(Convert.ToInt32(mStudId), Convert.ToInt32(mStudId) + "_" + FileName, UserName);
            //                if (objfiles != null)
            //                {
            //                    File.Delete(Path.Combine(url, objfiles));
            //                }
            //            }
            //            else
            //            {
            //                dbconn.MstUserDocsPhotoInsert(Convert.ToInt32(mStudId), Convert.ToInt32(1), Convert.ToInt32(mStudId) + "_" + FileName, UserName);
            //            }
            //            FileUpload1.SaveAs(pathToCreate);

            //            ImageUp(Convert.ToInt32(mStudId));
            //            //Response.Redirect("MyProfile.aspx", true);
            //            dvprof.Style.Add("display", "none");
            //            divProfile.Style.Add("display", "block");

            //            //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "RefreshParent();", true);

            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('File too large, please upload the file below 3MB');", true);
            //            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "NavTab1();", true);
            //            FileUpload1.Focus();
            //        }

            //    }
            //    else
            //    {

            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('Please choose valid file format');", true);
            //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "NavTab1();", true);

            //    }
            //}
            //catch (Exception ex)
            //{
            //    objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "Athena");
            //}
        }


        // Update Persoanl Details
        protected void btnPersonal_Click(object sender, EventArgs e)
        {
            //try
            //    {
            //        var UpdatePersonaldet = dbconn.MstStudentUpdatePersonalDetails(Convert.ToInt32(mStudId), txtFName.Text.Trim(), txtmiddlename.Text.Trim(), txtLastName.Text.Trim(), ddlGender.SelectedValue, ddlMStatus.SelectedValue, Convert.ToDateTime(txtDOB.Text),
            //        txtEmail.Text.Trim(), txtmobile.Text.Trim(), txtalternativemail.Text.Trim(), txtaddress.Text.Trim(), txtcity.Text.Trim(), txtstate.Text.Trim(), Convert.ToInt32(ddlCountry.SelectedValue), txtPostalcode.Text.Trim(), txtalternatePhone.Text.Trim(), TxtalterPhnCode.Text.Trim(), Convert.ToInt32(ddlNationality.SelectedValue));

            //        //this.PostProfileAPI();    // API post for profile details 
            //        string output = this.PassComplexData();

            //     //   int ids = dbconn.MstDocumentsGet(Convert.ToInt32(mStudId)).Where(w => w.DocName == "Passport/Photo ID card copy with Date of Birth").Select(s => s.DocTypeId).SingleOrDefault();
            //        if (fupphotoid.HasFile)
            //        {
            //            string FilePath = fupphotoid.PostedFile.FileName;
            //            string FileName = Path.GetFileName(FilePath);
            //            string url = Server.MapPath(LeadPath).Replace('\\', '/');
            //            string pathToCreate = url + Convert.ToInt32(mStudId) + "_" + FileName;
            //         //   dbconn.MstUserDocsInsert(Convert.ToInt32(mStudId), ids, Convert.ToInt32(mStudId) + "_" + FileName, UserName);

            //            ImageUp(Convert.ToInt32(mStudId));

            //            ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", "<script>showpop5('Details Saved Successfully')</script>", false);

            //            dvprof.Style.Add("display", "block");
            //            divProfile.Style.Add("display", "none");
            //        }

            //        BindPersonalDet();

            //        dvprof.Style.Add("display", "block");
            //        divProfile.Style.Add("display", "none");
            //        Response.Redirect("MyProfile.aspx", true);
            //        ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", "<script>showpop5('Details Updated Successfully')</script>", false);
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "chngdiv", "Closeprofile()", true);

            //    }
            //    catch (Exception ex)
            //    {
            //        objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), UserName, AppErrorLog.ErrorLogMethods.TextFile, "Athena");
            //    }
            //}
        }

        public class UserProfile
        {
            public string external_uid { get; set; }
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string dob { get; set; }
            public string contact_number { get; set; }
            public string gender { get; set; }
            public string mail { get; set; }
            public string residential_address { get; set; }
            public string city { get; set; }
            public string alternate_mail { get; set; }
            public string office_tel_number { get; set; }
            public string postcode { get; set; }
            public string approval_status { get; set; }
            public string application_type { get; set; }
            public int country_id { get; set; }
        }

    }
}
