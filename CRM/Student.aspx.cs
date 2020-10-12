using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;
using System.IO;


namespace CRM
{
    public partial class Student : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        public string mStudid, ImageFile,STUDID; string FilePath, FileName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                mStudid = Session["SesnStudId"].ToString();
            }
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
                {

                    GetRecord();
                }
            }

        }
        protected void GetRecord()
        {

            var StudEdit = from objstd in dbconn.MstStudents
                           where objstd.StudId == Convert.ToInt32(mStudid)
                           select objstd;
            foreach (MstStudent EE in StudEdit)
            {
                txtFname.Text = EE.FirstName;
                txtLname.Text = EE.LastName;
                ddlGender.SelectedItem.Text = EE.Gender.ToString();
                txtEmail.Text = EE.Email;
                txtParent.Text = EE.ParentName;
                txtContactno.Text = EE.ContactNo;
                txtaddress1.Text = EE.Address1;
                txtaddress2.Text = EE.Address2;
                txtEContactno.Text = EE.EmergencyContact;
                txtemid.Text = EE.UAEId;
                if (EE.Expdate.ToString() != string.Empty)
                {
                    txtedate.Text = Convert.ToDateTime(EE.Expdate).ToString("yyyy-MM-dd");
                }
                if (EE.DOB.ToString() != string.Empty)
                {
                    txtDob.Text = Convert.ToDateTime(EE.DOB).ToString("yyyy-MM-dd");
                }
                //Chksib.Checked = EE.Sibling.HasValue;
                //ddlsib.SelectedValue = EE.SibId.ToString();
               // MstStudent objGetImg = dbconn.MstStudents.Single(M => M.StudId == Convert.ToInt32(mStudid));
                string ImgPath = EE.Imagepath.Trim();
                if (ImgPath != "" || ImgPath != null)
                {
                    string url = (ImgPath).Replace('\\', '/');
                    ImgStudent.ImageUrl = url;
                }
            }
        }

   

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                string FileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (FileExtention == ".png" || FileExtention == ".jpeg" || FileExtention == ".jpg")
                {
                    if (fileSize <= (3145728))  // 3MB -> 3 * 1024 * 1024
                    {

                        FilePath = FileUpload1.PostedFile.FileName;
                        FileName = Path.GetFileName(FilePath);
                        string url = Server.MapPath(FilePath).Replace('\\', '/');
                        string pathToCreate = url + Convert.ToInt32(mStudid) + "_" + FileName;
                        FileUpload1.SaveAs(pathToCreate);
                        ImageUp(Convert.ToInt32(mStudid));
                        //Response.Redirect("MyProfile.aspx", true);
                        //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "RefreshParent();", true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('File too large, please upload the file below 3MB');", true);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "NavTab1();", true);
                        FileUpload1.Focus();
                    }


                }
            }
      catch (Exception ex)
                {
                    //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }

                protected void BtnStudSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                try
                {
                    MstStudent objStdIns = new MstStudent();
                    objStdIns.FirstName = txtFname.Text;
                    objStdIns.LastName = txtLname.Text;
                    objStdIns.Gender = ddlGender.SelectedValue;
                    objStdIns.ParentName = txtParent.Text;
                    objStdIns.Address1 = txtaddress1.Text;
                    objStdIns.Address2 = txtaddress2.Text;
                    objStdIns.ContactNo = txtContactno.Text;
                    objStdIns.EmergencyContact = txtEContactno.Text;
                    objStdIns.Email = txtEmail.Text;
                    objStdIns.DOB = Convert.ToDateTime(txtDob.Text);
                    objStdIns.UAEId = Convert.ToString(txtemid.Text);
                    objStdIns.Expdate = Convert.ToDateTime(txtedate.Text);
                    //objStdIns.Sibling = Chksib.Checked;
                    //objStdIns.SibId = Convert.ToInt32(ddlsib.SelectedValue);
                   
                    dbconn.MstStudents.InsertOnSubmit(objStdIns);
                    dbconn.SubmitChanges();
                    
                   

                }
                catch (Exception ex)
                {
                    //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to save record. Please contact Support Team','','error')</script>", false);
                }
            }
            else
            {
                try
                {

                    MstStudent objStdup = dbconn.MstStudents.Single(M => M.StudId == Convert.ToInt32(mStudid));
                    objStdup.FirstName = txtFname.Text;
                    objStdup.LastName = txtLname.Text;
                    objStdup.Gender = ddlGender.SelectedValue;
                    objStdup.ParentName = txtParent.Text;
                    objStdup.Address1 = txtaddress1.Text;
                    objStdup.Address2 = txtaddress2.Text;
                    objStdup.ContactNo = txtContactno.Text;
                    objStdup.EmergencyContact = txtEContactno.Text;
                    objStdup.Email = txtEmail.Text;
                    objStdup.DOB = Convert.ToDateTime(txtDob.Text);
                    objStdup.UAEId = Convert.ToString(txtemid.Text);
                    objStdup.Expdate = Convert.ToDateTime(txtedate.Text);
                    //objStdup.Sibling = Chksib.Checked;
                    //objStdup.SibId = Convert.ToInt32(ddlsib.SelectedValue);
                    dbconn.SubmitChanges();

                }
                catch (Exception ex)
                {
                    //objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "admin", AppErrorLog.ErrorLogMethods.TextFile, "CRM");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", "<script>showalert('Failed to update the record. Please contact Support Team','','error')</script>", false);
                }
            }
            Response.Redirect("ViewStudents.aspx");
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudents.aspx");
        }

        private void ImageUp(int LeadID)
        {
            try
            {
                MstStudent objGetImg = dbconn.MstStudents.Single(M => M.StudId == Convert.ToInt32(mStudid));
                string ImgPath = objGetImg.Imagepath.Trim();
                if (ImgPath != "" || ImgPath != null)
                {
                    string url = (ImgPath).Replace('\\', '/');
                    ImgStudent.ImageUrl = url;
                }


                //var ObjImg = from objImgs in 
                //dbconn.MstStudents(Convert.ToInt32(STUDID))
                //select new
                //             {
                //                 objImgs.ImagePath
                //             };

                //foreach (var binds in objGetImg)
                //{
                //    ImageFile = binds.FileName;
                //}
                //if (ImageFile != "" && ImageFile != null)
                //{
                //    string url = ("~/Uploads").Replace('\\', '/');
                //    ImgStudent.ImageUrl = (url + ImageFile);
                //}
                //else
                //{
                //    ImgStudent.ImageUrl = "Uploads/profile.jpg";
                //}
            }
            catch (Exception ex)
            {
               // objLog.ErrorLog("UserDetails", "ImageUp", ex.Message.ToString(), LMSENDE.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString(), AppErrorLog.ErrorLogMethods.TextFile, "OnlineLMS");
            }

        }
    }
}