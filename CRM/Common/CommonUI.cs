using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

namespace CRM.Common
{
    public static class CommonUI
    {
        public enum PrivilegeType
        {
            View = 0,
            Save = 1
        }

        public static void BindStatusCombo(DropDownList drp)
        {
            drp.Items.Clear();
            drp.Items.Add(new ListItem() { Text = "", Value = "" });
            drp.Items.Add(new ListItem() { Text = "Active", Value = "1" });
            drp.Items.Add(new ListItem() { Text = "Inactive", Value = "0" });

        }
        public static void BindCombo(DropDownList drp, object data, string value, string text)
        {
            drp.Items.Clear();
            if (data != null)
            {
                drp.DataSource = data;
                drp.DataValueField = value;
                drp.DataTextField = text;
                drp.DataBind();
            }
            drp.Items.Insert(0, new ListItem() { Text = "", Value = "" });

        }
        public static void ShowMessage(string msg, Page page, string key = "")
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), key, $"alert('{msg}');", true);
        }

        public static void SaveUserSession(HttpRequest Req)
        {
            Dictionary<string, string> UserData;
            if (HttpContext.Current.Application["LOGINUSERDATA"] != null)
                UserData = HttpContext.Current.Application["LOGINUSERDATA"] as Dictionary<string, string>;
            else
                UserData = new Dictionary<string, string>();
            UserData.Remove(Convert.ToString(Req.RequestContext.HttpContext.Session["LOGINID"]));
            UserData.Add(Convert.ToString(Req.RequestContext.HttpContext.Session["LOGINID"]), Req.RequestContext.HttpContext.Session.SessionID);
            HttpContext.Current.Application["LOGINUSERDATA"] = UserData;
        }

        public static bool ValidateUserSession(HttpRequest Req)
        {
            Dictionary<string, string> UserData;
            if (HttpContext.Current.Application["LOGINUSERDATA"] != null)
                UserData = HttpContext.Current.Application["LOGINUSERDATA"] as Dictionary<string, string>;
            else
                UserData = new Dictionary<string, string>();

            string LoggedSessID;
            return UserData.TryGetValue(Convert.ToString(Req.RequestContext.HttpContext.Session["LOGINID"]), out LoggedSessID) &&
                   LoggedSessID == Req.RequestContext.HttpContext.Session.SessionID;
        }

        public static void Authorization(HttpRequest Req, Page page)
        {
            string[] excludeList = new string[] { "Home.aspx", "Profile.aspx", "ChangePassword.aspx" };

            if (!excludeList.Contains(page.ResolveClientUrl(page.AppRelativeVirtualPath)))
            {
                if (Req.RequestContext.HttpContext.Session["PRIVILEGE"] != null)
                {
                    List<Privilege> priv = (List<Privilege>)Req.RequestContext.HttpContext.Session["PRIVILEGE"];
                    var hasAccess = priv.Any(f => f.ActionUrl == page.ResolveClientUrl(page.AppRelativeVirtualPath) && f.CanView);
                    if (!hasAccess)
                        HttpContext.Current.Response.Redirect("~/Error.aspx?id=4");
                }
                else//session expired
                {
                    HttpContext.Current.Response.Redirect("~/Error.aspx?id=1");

                }
            }
        }
        public static bool Authorization(HttpRequest Req, string pageID, PrivilegeType privilegeType)
        {
            if (Req.RequestContext.HttpContext.Session["PRIVILEGE"] != null)
            {
                List<Privilege> priv = (List<Privilege>)Req.RequestContext.HttpContext.Session["PRIVILEGE"];

                if (privilegeType == PrivilegeType.Save)
                    return priv.Any(c => c.PageID == pageID && c.CanModify);
                else
                    return priv.Any(c => c.PageID == pageID && c.CanView);
            }
            else
                return false;
        }

        public static string CreateMenu(ref List<Privilege> _privilege, HttpRequest Req)
        {
            StringBuilder mnu = new StringBuilder();
            LinqDBDataContext dbcon = new LinqDBDataContext();
            UserInfo userInfo = (UserInfo)Req.RequestContext.HttpContext.Session["USERINFO"];
            var priv = dbcon.PR_UserPrivilegeGet(userInfo.UserID)?.ToList();
            _privilege = new List<Privilege>();
            if (priv?.Count > 0)
            {
                bool _parentOpen = false;
                foreach (var p in priv)
                {
                    _privilege.Add(new Privilege()
                    {
                        ActionUrl = p.ActionUrl,
                        ActionValue = p.ActionValue,
                        CanModify = Convert.ToBoolean(p.CanModify),
                        CanView = Convert.ToBoolean(p.CanView),
                        Description = p.Description,
                        DisplayOrder = Convert.ToInt16(p.DisplayOrder),
                        PageID = p.PageID,
                        ParentPageID = p.ParentPageID,
                        RoleID = p.RoleID,
                        ShowInMenu = Convert.ToBoolean(p.ShowInMenu),
                        ShowInPrivilege = Convert.ToBoolean(p.ShowInPrivilege),
                        UIData = p.UIData
                    });
                    if (p.ShowInMenu == true && p.CanView == true)
                    {
                        if (string.IsNullOrEmpty(p.ParentPageID) && !string.IsNullOrEmpty(p.ActionUrl))
                        {
                            if (_parentOpen)
                                mnu.Append(@"</ul></li>");

                            mnu.Append($@"<li>
                                        <a href='{p.ActionUrl}'><i class='{p.UIData}' aria-hidden='true'></i><span>{p.Description}</span></a>
                                    </li>");
                            _parentOpen = false;
                        }
                        else if (string.IsNullOrEmpty(p.ParentPageID) && string.IsNullOrEmpty(p.ActionUrl))
                        {
                            if (_parentOpen)
                                mnu.Append(@"</ul></li>");

                            mnu.Append($@"<li class='submenu'>
                                        <a href='{p.ActionUrl}'><i class='{p.UIData}' aria-hidden='true'></i><span>{p.Description}</span> <span class='menu-arrow'></span></a>
                                        <ul class='sub-menus'>");

                            _parentOpen = true;
                        }
                        else
                        {
                            mnu.Append($"<li><a href='{p.ActionUrl}'>{p.Description}</a></li>");
                        }
                    }
                }
                // mnu.Append("</ul>");
            }
            return mnu.ToString();
        }
        public static string GetClientIpString(HttpRequest request)
        {
            string IPstr = request.ServerVariables["REMOTE_ADDR"];
            if (IPstr != null)
            {
                return IPstr;
            }
            return "0.0.0.0";
        }
        public static void CallJScript(Page page, string script, string key = null)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), string.IsNullOrEmpty(key) ? DateTime.Now.ToString("ddMMyyyhmmtt") : key, script, true);
        }

        public static string ConvertToXML(Object pObject)
        {
            if (pObject == null)
                return null;
            XmlDocument _xmlDoc = new XmlDocument();
            XmlSerializer _xmlSerializer = new XmlSerializer(pObject.GetType());

            using (MemoryStream _xmlStream = new MemoryStream())
            {
                _xmlSerializer.Serialize(_xmlStream, pObject);
                _xmlStream.Position = 0;
                _xmlDoc.Load(_xmlStream);
                String str = _xmlDoc.InnerXml;
                return str;
            }
        }
    }
    public static class Constants
    {
        public static string ErrorMsg = "Internal error. Pleae try again later.";
        public static string EncryptionKey = "S&m3$3)Jh4";

    }


}