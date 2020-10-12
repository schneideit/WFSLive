using System;
using System.Collections.Generic;
using System.Globalization;

namespace CRM.Common
{
    public class CommonClass
    {
        LinqDBDataContext lmscon = new LinqDBDataContext();

        public string ToSentenceCase(string Content)
        {
            string title = string.Empty;
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            title = textInfo.ToTitleCase(Content);
            return title;

        }
    }
    public class UserInfo
    {
        public string RequestLoginID { get; set; }
        public int RequestUserID { get; set; }
        public int RequestEmpID { get; set; }
        public bool? IsActive { get; set; }
        public string RequestNode { get; set; }

        public int UserID { get; set; }
        public string LoginID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public int RoleID { get; set; }
        public string Password { get; set; }
        public DateTime? LastLoginTime { get; set; }
        public int LoginAuditID { get; set; }
        public int EmpID { get; set; }

    }

    public partial class Privilege
    {
        public short RoleID { get; set; }
        public string PageID { get; set; }
        public int ActionValue { get; set; }
        public string ActionUrl { get; set; }
        public string Description { get; set; }
        public string ParentPageID { get; set; }
        public string UIData { get; set; }
        public bool CanModify { get; set; }
        public bool CanView { get; set; }
        public bool ShowInPrivilege { get; set; }
        public bool ShowInMenu { get; set; }
        public short DisplayOrder { get; set; }
    }
    public class Role 
    {
        public int RoleID { get; set; }
        public string Description { get; set; }
        public List<RolePrivilege> Privileges { get; set; }
    }
    public class RolePrivilege
    {
        public string PageID { get; set; }
        public int ActionValue { get; set; }

    }
}