using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Common;
using System.IO;
using System.Drawing;

namespace CRM
{
    public partial class Student : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();
        AppErrorLog objLog = new AppErrorLog();
        public string mStudid, ImageFile, STUDID; string FilePath = "Uploads\\Students";
        int imgWidth = 500, imgHeight = 700, imgQuality = 60, iconWidth = 100, iconHeight = 150, iconQuality = 40;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["SesnStudId"] as string))
            {
                mStudid = Session["SesnStudId"].ToString();
            }
            if (!Page.IsPostBack)
            {
                Session.Remove("STDFILE");
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

                if (!string.IsNullOrEmpty(EE.Imagepath))
                {
                    imgStud.Src = Path.Combine(FilePath, EE.Imagepath);
                    imgStud.Visible = true;
                }
            }
        }



        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                string msg = ValidateImage(FileUpload1?.PostedFile);
                if (string.IsNullOrEmpty(msg))
                {
                    System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                    System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Src = $"data:image/{Path.GetExtension(FileUpload1.PostedFile.FileName).Replace(".", "")};base64, {base64String}";
                    imgStud.Visible = true;
                    Session["STDFILE"] = new PostedFile() { Base64Data = base64String, FileName = FileUpload1.PostedFile.FileName };
                }
                else
                {
                    Session.Remove("STDFILE");
                    CommonUI.ShowMessage(msg, this);
                }
                //string FileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                //int fileSize = FileUpload1.PostedFile.ContentLength;
                //if (FileExtention == ".png" || FileExtention == ".jpeg" || FileExtention == ".jpg")
                //{
                //    if (fileSize <= (3145728))  // 3MB -> 3 * 1024 * 1024
                //    {

                //        FilePath = FileUpload1.PostedFile.FileName;
                //        FileName = Path.GetFileName(FilePath);
                //        string url = Server.MapPath(FilePath).Replace('\\', '/');
                //        string pathToCreate = url + Convert.ToInt32(mStudid) + "_" + FileName;
                //        FileUpload1.SaveAs(pathToCreate);
                //        ImageUp(Convert.ToInt32(mStudid));
                //        //Response.Redirect("MyProfile.aspx", true);
                //        //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "RefreshParent();", true);

                //    }
                //    else
                //    {
                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "alert('File too large, please upload the file below 3MB');", true);
                //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Script", "NavTab1();", true);
                //        FileUpload1.Focus();
                //    }


                //}
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

                    if (Session["STDFILE"] != null)
                    {
                        objStdIns.Imagepath = SaveImage(objStdIns.StudId);
                        dbconn.SubmitChanges();
                    }

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
                    objStdup.Imagepath = SaveImage(objStdup.StudId);
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
                    //ImgStudent.ImageUrl = url;
                }

            }
            catch (Exception ex)
            {
                // objLog.ErrorLog("UserDetails", "ImageUp", ex.Message.ToString(), LMSENDE.Decrypt(Request.Cookies["LoginCookies"]["LOGINNAME"]).ToString(), AppErrorLog.ErrorLogMethods.TextFile, "OnlineLMS");
            }

        }

        private string SaveImage(int studId)
        {
            try
            {
                if (Session["STDFILE"] != null)
                {
                    PostedFile postedFile = (PostedFile)Session["STDFILE"];
                    string fName = studId.ToString() + Path.GetExtension(postedFile.FileName);

                    Bitmap postedImage = null;
                    byte[] byteBuffer = Convert.FromBase64String(postedFile.Base64Data);
                    MemoryStream memoryStream = new MemoryStream(byteBuffer);
                    memoryStream.Position = 0;
                    postedImage = (Bitmap)Bitmap.FromStream(memoryStream);


                    //Save orginal image
                    CommonUI.ImageOptimizeAndSave(postedImage, imgWidth, imgHeight,
                        Path.Combine(AppDomain.CurrentDomain.BaseDirectory, FilePath,
                            studId.ToString() + Path.GetExtension(postedFile.FileName)), imgQuality);
                    //Save icon image
                    Bitmap icon = (Bitmap)Bitmap.FromStream(memoryStream);
                    CommonUI.ImageOptimizeAndSave(icon, iconWidth, iconHeight,
                        Path.Combine(AppDomain.CurrentDomain.BaseDirectory, FilePath,
                            "icon_" + studId.ToString() + Path.GetExtension(postedFile.FileName)), iconQuality);
                    memoryStream.Close();
                    memoryStream = null;
                    byteBuffer = null;
                    return fName;
                }
                return "";
            }
            catch (Exception ex)
            {
                Logger.Error.LogError(ex);
                return "";
            }
        }
        private string ValidateImage(HttpPostedFile postedfile)
        {
            string msg = "";
            if (postedfile?.ContentLength == 0)
                msg = "Invalid upload";
            else
            {
                string FileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (FileExtention != ".png" && FileExtention != ".jpeg" && FileExtention != ".jpg")
                {
                    msg = "Invalid file format, only png, jpg & gif is allowed.";
                }

            }
            return msg;
        }
    }
}