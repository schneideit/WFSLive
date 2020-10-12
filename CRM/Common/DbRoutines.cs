using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Reflection;
using System.Web;
using System.Web.UI.WebControls;

namespace CRM.Common
{
    public class DbRoutines
    {
        public SqlConnection sqlcon = null;
        AppErrorLog objLog = new AppErrorLog();
        LinqDBDataContext objLinq = new LinqDBDataContext();

        public SqlConnection OpenConnection()
        {
            try
            {
                sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ToString());
                sqlcon.Open();
                return sqlcon;
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "Admin", AppErrorLog.ErrorLogMethods.TextFile, "LMS");
                return sqlcon;
            }
        }
        // To Get Details of creation of records and modification of records
        public void GetRecordModificationDetails(string TableName, string condition, Label lblCreatedBy, Label lblCreatedOn, Label lblUpdatedBy, Label lblUpdatedOn)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("GetRecordUpdateDetails", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@tablename", TableName);
                    cmd.Parameters.AddWithValue("@condition", condition);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        lblCreatedBy.Text = dt.Rows[0]["CreatedBy"].ToString();
                        lblCreatedOn.Text = dt.Rows[0]["CreatedDate"].ToString();
                        lblUpdatedBy.Text = dt.Rows[0]["UpdatedBy"].ToString();
                        lblUpdatedOn.Text = dt.Rows[0]["UpdatedDate"].ToString();

                        string CreatedDate = dt.Rows[0]["CreatedDate"].ToString();
                        string UpdatedDate = dt.Rows[0]["UpdatedDate"].ToString();
                        if (CreatedDate != "NA")
                        {
                            lblCreatedOn.Text = Convert.ToDateTime(CreatedDate).ToString("dd MMMM yyyy hh:mm:ss tt");
                        }
                        if (UpdatedDate != "NA")
                        {
                            lblUpdatedOn.Text = Convert.ToDateTime(UpdatedDate).ToString("dd MMMM yyyy hh:mm:ss tt");
                        }
                    }
                }
            }

        }
        public void CloseConnection()
        {
            try
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "Admin", AppErrorLog.ErrorLogMethods.TextFile, "LMS");
            }
        }
        //To Bind DropdownList
        public DropDownList BindDropdownList(string qryInput, DropDownList dropdownId, string dataTextField, string dataValueField, string zerothIndexField)
        {
            try
            {
                sqlcon = OpenConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlcon;
                cmd.CommandText = qryInput;
                dropdownId.DataSource = cmd.ExecuteReader();
                dropdownId.DataTextField = dataTextField;
                dropdownId.DataValueField = dataValueField;
                dropdownId.DataBind();
                //dropdownId.Items.Insert(0, zerothIndexField);
                // dropdownId.Items.Insert(0, new ListItem(zerothIndexField, ""));
                CloseConnection();
                return dropdownId;
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "Admin", AppErrorLog.ErrorLogMethods.TextFile, "LMS");
                throw ex;
            }
        }
        //To Bind CheckboxList
        public CheckBoxList BindCheckboxList(string qryInput, CheckBoxList checkboxId, string dataTextField, string dataValueField)
        {
            try
            {
                sqlcon = OpenConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlcon;
                cmd.CommandText = qryInput;
                checkboxId.DataSource = cmd.ExecuteReader();
                checkboxId.DataTextField = dataTextField;
                checkboxId.DataValueField = dataValueField;
                checkboxId.DataBind();
                CloseConnection();
                return checkboxId;
            }
            catch (Exception ex)
            {
                objLog.ErrorLog(this.GetType().Name, MethodBase.GetCurrentMethod().Name, ex.Message.ToString(), "Admin", AppErrorLog.ErrorLogMethods.TextFile, "LMS");
                throw ex;
            }
        }

        public DataTable LINQResultToDataTable<T>(IEnumerable<T> Linqlist)
        {
            DataTable dt = new DataTable();


            PropertyInfo[] columns = null;

            if (Linqlist == null) return dt;

            foreach (T Record in Linqlist)
            {

                if (columns == null)
                {
                    columns = Record.GetType().GetProperties();
                    foreach (PropertyInfo GetProperty in columns)
                    {
                        Type colType = GetProperty.PropertyType;

                        if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition()
                        == typeof(Nullable<>)))
                        {
                            colType = colType.GetGenericArguments()[0];
                        }

                        dt.Columns.Add(new DataColumn(GetProperty.Name, colType));
                    }
                }

                DataRow dr = dt.NewRow();

                foreach (PropertyInfo pinfo in columns)
                {
                    dr[pinfo.Name] = pinfo.GetValue(Record, null) == null ? DBNull.Value : pinfo.GetValue
                    (Record, null);
                }

                dt.Rows.Add(dr);
            }
            return dt;
        }

        public void IsLoggedIn()
        {
            if (HttpContext.Current.Request.Cookies["UserName"].Value == null || HttpContext.Current.Request.Cookies["UserName"].Value == "")
            {
                HttpContext.Current.Response.Redirect("Login.aspx", true);
            }

        }

        public string ToSentenceCase(string Content)
        {
            string title = string.Empty;
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            title = textInfo.ToTitleCase(Content);
            return title;

        }
    }
}