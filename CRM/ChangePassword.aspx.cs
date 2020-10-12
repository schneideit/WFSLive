using CRM.Common;
using System;
using System.Linq;
using System.Web.UI.WebControls;


namespace CRM
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                UserInfo ui = (UserInfo)(Session["USERINFO"]);
                if (string.IsNullOrEmpty(txtCurrentPassword.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtConfirmPswd.Text))
                {
                    CommonUI.ShowMessage("Invalid input", this);
                    return;
                }
                else if (txtPassword.Text != txtConfirmPswd.Text)
                {
                    CommonUI.ShowMessage("Password and confirm password should be same.", this);
                    return;
                }

                ui.Password = txtCurrentPassword.Text;
                string msg = Authentication(ui);
                if (!string.IsNullOrEmpty(msg))
                {
                    CommonUI.ShowMessage(msg, this);
                    return;
                }

                string pswd = null, pswdSalt = null;
                string[] _password = Security.Secure.EncryptWithOutSalt(txtPassword.Text);
                pswd = _password[0];
                pswdSalt = Security.Secure.EncryptText(_password[1], Constants.EncryptionKey);

                var resp = dbconn.PR_UserSave(Convert.ToInt16(ui.UserID), ui.LoginID,
                    Convert.ToInt16(ui.RoleID), ui.Name, ui.Email, Convert.ToBoolean(ui.IsActive),
                    Convert.ToInt16(ui.UserID), CommonUI.GetClientIpString(Request), pswd, pswdSalt, null).ToList();

                if (resp?.First()?.ResponseCode == "1")
                {
                    CommonUI.CallJScript(this, $"alert('Password changed successfully.Please relogin.'); window.location='Login.aspx';");
                }
                else
                    CommonUI.ShowMessage(resp?.First().Message, this);
            }
            catch (Exception ex)
            {
                Logger.Error.LogError(ex);
                CommonUI.ShowMessage(Constants.ErrorMsg, this);
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        public string Authentication(UserInfo userdetail)
        {
            string sts = "";

            var userInfo = dbconn.PR_UserSearch(Convert.ToInt16(userdetail.UserID), "", 0, "", "", true)?.ToList();
            if (userInfo?.Count() > 0)
            {
                var _userInfo = userInfo.First();
                if (_userInfo.Status == true)
                {
                    if (Security.Secure.EncryptWithSalt(userdetail.Password,
                        Security.Secure.DecryptText(_userInfo.PasswordSalt, Constants.EncryptionKey)) == _userInfo.Password)
                    {
                        sts = "";
                    }
                    else
                        sts = "Current password is incorrect.";
                }
                else
                    sts = "User is inactive.";
            }
            else
                sts = "invalid information.";
            return sts;
        }

    }
}