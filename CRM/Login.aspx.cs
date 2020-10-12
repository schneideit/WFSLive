using CRM.Common;
using System;
using System.Linq;
using System.Web.UI;

namespace CRM
{
    public partial class Login : System.Web.UI.Page
    {
        // private LMS_Encript.AES_Encrypt_Decrypt LMSENDE = new LMS_Encript.AES_Encrypt_Decrypt();
        private LinqDBDataContext dbcon = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["loggedIn"] = null;
            Session.RemoveAll();
            Response.Cookies["LoginCookies"].Expires = DateTime.Now.AddDays(-1);
            txtusername.Focus();
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtusername.Text = Request.Cookies["UserName"].Value;
                    txtpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                UserInfo userInfo = new UserInfo();
                if (!string.IsNullOrEmpty(txtusername.Text) && !string.IsNullOrEmpty(txtpassword.Text))
                {
                    int resp = Authentication(userInfo);
                    switch (resp)
                    {
                        case 1:
                            Session["USERINFO"] = userInfo;
                            Session["LOGINID"] = userInfo.LoginID;
                            CommonUI.SaveUserSession(Request);
                            Response.Redirect("Home.aspx");
                            break;
                        case 0:
                            CommonUI.ShowMessage("Invalid username or password.", Page);
                            break;
                        case 2:
                            CommonUI.ShowMessage("Your account has been blocked. Contact administrator.", Page);
                            break;
                    }

                }


            }
            catch (System.Threading.ThreadAbortException)
            {

            }
            catch (Exception ex)
            {
                Logger.Error.LogError(ex);
                CommonUI.ShowMessage(Constants.ErrorMsg, Page);
            }

        }
        public int Authentication(UserInfo userdetail)
        {
            int sts = 0;
            var userInfo = dbcon.PR_UserSearch(0, txtusername.Text, 0, "", "", true)?.ToList();
            if (userInfo?.Count() > 0)
            {
                var _userInfo = userInfo.First();
                if (_userInfo.Status == true)
                {
                    if (Security.Secure.EncryptWithSalt(txtpassword.Text,
                        Security.Secure.DecryptText(_userInfo.PasswordSalt, Constants.EncryptionKey)) == _userInfo.Password)
                    {
                        userdetail.Name = _userInfo.Name;
                        userdetail.LoginID = _userInfo.LoginID;
                        userdetail.UserID = _userInfo.UserID;
                        userdetail.RoleID = _userInfo.RoleID;
                        userdetail.LastLoginTime = _userInfo.LastLoginOn;
                        userdetail.Email = _userInfo.EmailID;
                        sts = 1;
                    }
                    else
                        sts = 0;
                    LoginAuditLog(userdetail, sts);
                }
                else
                    sts = 2;//Inactive User
            }
            else
                sts = 0;
            return sts;
        }

        public void LoginAuditLog(UserInfo userInfo, int status = 0)
        {
            long? auditID = 0;
            dbcon.PR_LoginAudit(userInfo.UserID, status.ToString(), "", ref auditID);

            //if (dt != null && dt.Rows.Count > 0)
            //int.TryParse(Convert.ToString(dt.Rows[0]["AuditID"]), out auditID);
            userInfo.LoginAuditID = Convert.ToInt32(auditID);
        }
    }
}