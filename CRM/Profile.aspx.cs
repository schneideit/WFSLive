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
    public partial class Profile : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserInfo ui = (UserInfo)(Session["USERINFO"]);
                txtUsername.Text = ui.LoginID;
                txtName.Text = ui.Name;
                txtEmail.Text = ui.Email;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                UserInfo ui = (UserInfo)(Session["USERINFO"]);
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtName.Text))
                {
                    CommonUI.ShowMessage("Invalid input", this);
                    return;
                }


                var resp = dbconn.PR_UserSave(Convert.ToInt16(ui.UserID), ui.LoginID,
                  Convert.ToInt16(ui.RoleID), txtName.Text, txtEmail.Text, Convert.ToBoolean(ui.IsActive),
                  Convert.ToInt16(ui.UserID), CommonUI.GetClientIpString(Request), "", "", null).ToList();

                if (resp?.First()?.ResponseCode == "1")
                {
                    ui.Email = txtEmail.Text;
                    ui.Name = txtName.Text;
                    Session["USERINFO"] = ui;
                    CommonUI.CallJScript(this, $"alert('Record saved successfully'); window.location='Home.aspx';");
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


    }
}