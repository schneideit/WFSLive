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
    public partial class RoleAdd : System.Web.UI.Page
    {
        LinqDBDataContext dbconn = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CommonUI.BindStatusCombo(drpStatus);
                LoadPrivilege();
                if (Convert.ToInt32(Session["EDIT_ROLEID"]) > 0)
                {
                    hdnRoleID.Value = Session["EDIT_ROLEID"].ToString();
                    GetRecord();
                }

            }

        }
        protected void GetRecord()
        {
            var roles = dbconn.PR_RoleSearch(null, Convert.ToInt16(hdnRoleID.Value)).ToList();
            var role = roles.First();
            var priv = dbconn.PR_RoleGetDetail(Convert.ToInt16(hdnRoleID.Value)).ToList();

            txtRoleName.Text = role.Description;
            drpStatus.SelectedValue = role.IsActive == true ? "1" : "0";
            hdnRoleID.Value = Convert.ToString(role.RoleID);
            Session["RolePrivilege"] = priv;
            grvPriv.DataSource = priv;
            grvPriv.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SyncGridViewAndDataTable();

                List<Privilege> priv = new List<Privilege>();
                var _privilege = (List<PR_RoleGetDetailResult>)Session["RolePrivilege"];
                foreach (PR_RoleGetDetailResult p in _privilege)
                {
                    priv.Add(new Privilege()
                    {
                        PageID = p.PageID,
                        ActionValue = Convert.ToInt16(p.ActionValue),
                    });
                }

                var resp = dbconn.PR_RoleSave(txtRoleName.Text, drpStatus.SelectedValue == "1",
                   Convert.ToInt16(((UserInfo)(Session["USERINFO"])).UserID), CommonUI.GetClientIpString(Request),
                   Convert.ToInt16(hdnRoleID.Value), CommonUI.ConvertToXML(priv)).ToList();

                if (resp?.First()?.ResponseCode == "1")
                {
                    CommonUI.CallJScript(this, $"alert('Record saved successfully'); window.location='RoleSearch.aspx';");
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
            Response.Redirect("RoleSearch.aspx");
        }

        void LoadPrivilege()
        {
            var priv = dbconn.PR_RoleGetDetail(0).ToList();
            Session["RolePrivilege"] = priv;
            grvPriv.DataSource = priv;
            grvPriv.DataBind();
        }
        public void SyncGridViewAndDataTable()
        {
            var priv = (List<PR_RoleGetDetailResult>)Session["RolePrivilege"];

            if (grvPriv.Rows.Count > 0)
            {
                for (int intCount = 0; intCount < grvPriv.Rows.Count; intCount++)
                {
                    priv[intCount].CanModify = ((CheckBox)grvPriv.Rows[intCount].FindControl("chkModify")).Checked;
                    priv[intCount].CanView = ((CheckBox)grvPriv.Rows[intCount].FindControl("chkView")).Checked;

                    priv[intCount].ActionValue =
                        Convert.ToByte(Convert.ToInt64(((priv[intCount].CanModify == true ? "1" : "0")
                                        + (priv[intCount].CanView == true ? "1" : "0")), 2));
                }
            }
            Session["RolePrivilege"] = priv;
        }

    }
}