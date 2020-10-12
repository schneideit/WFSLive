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
    public partial class UserAdd : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CommonUI.BindStatusCombo(drpStatus);
                var role = dbconn.PR_RoleSearch(null,0).ToList();
                CommonUI.BindCombo(drpRole, role, "RoleID", "Description");
                if (Convert.ToInt32(Session["EDIT_USERID"]) > 0)
                {
                    hdnUserID.Value = Session["EDIT_USERID"].ToString();
                    GetRecord();
                }

            }

        }
        protected void GetRecord()
        {

            var users = dbconn.PR_UserSearch(Convert.ToInt16(hdnUserID.Value), null, 0, null, null, null).ToList();
            var user = users.First();
            txtLoginName.Text = user.LoginID;
            txtName.Text = user.Name;
            txtEmail.Text = user.EmailID;
            drpRole.SelectedValue = user.RoleID.ToString();
            drpStatus.SelectedValue = user.Status == true ? "1" : "0";
            txtLoginName.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text != txtConfirmPswd.Text)
                {
                    CommonUI.ShowMessage("Password and confirm password should be same.",this);
                    return;
                }

                string pswd = null, pswdSalt = null;
                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    string[] _password = Security.Secure.EncryptWithOutSalt(txtPassword.Text);
                    pswd = _password[0];
                    pswdSalt = Security.Secure.EncryptText(_password[1], Constants.EncryptionKey);
                }

                var resp = dbconn.PR_UserSave(Convert.ToInt16(hdnUserID.Value), txtLoginName.Text,
                    Convert.ToInt16(drpRole.SelectedValue), txtName.Text, txtEmail.Text, drpStatus.SelectedValue == "1",
                    Convert.ToInt16(((UserInfo)(Session["USERINFO"])).UserID), CommonUI.GetClientIpString(Request), pswd, pswdSalt, null).ToList() ;

                if (resp?.First()?.ResponseCode == "1")
                {
                    CommonUI.CallJScript(this, $"alert('Record saved successfully'); window.location='UserSearch.aspx';");
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
            Response.Redirect("UserSearch.aspx");
        }

        
    }
}