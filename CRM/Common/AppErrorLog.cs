//**********************************************************************************************
//Name          : ErrorLog.cs
//Parameters    : 
//Description   : To write the errors to log file or database or eventlog

//Function1     : ErrorLog()                Description :To move the next control for given control id
//Function2     : WriteToTextFile()         Description :To prompt the confirmbox when the form close button clicked
//Function3     : WriteToDatabase()         Description :To prompt the confirmbox when the form close button clicked
//Function4     : WriteToEventLogger()      Description :To prompt the confirmbox when the form close button clicked
//Change History:-
//Modified Ref:            Modified By:            Modified Date: 
// M001
//**********************************************************************************************
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
namespace CRM.Common
{
    public class AppErrorLog
    {
        public SqlConnection con = null;

        //To Open the connection from WebConfig
        public SqlConnection OpenConnection()
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConStr"].ToString());
                con.Open();
                return con;
            }
            catch (Exception)
            {
                return con;
            }
        }

        SqlConnection conn = new SqlConnection();
        static DateTime CurrDate = DateTime.Now;
        public enum ErrorLogMethods
        {
            TextFile,
            Database,
            EventLogger
        }

        public void ErrorLog(string className, string methodName, string errMessage, string username, ErrorLogMethods methods, string applicationName)
        {
            WriteToTextFile(className, methodName, errMessage, username, applicationName);
        }

        //Write the errors to textfile
        private void WriteToTextFile(string className, string methodName, string errMessage, string user, string applicationName)
        {
            StreamReader sReader;
            StreamWriter sWriter;
            string AppPath = string.Empty;
            string filePath = string.Empty;
            string readText = string.Empty;

            AppPath = ConfigurationManager.AppSettings["ErrorLogPath"];
            filePath = System.Web.HttpContext.Current.Server.MapPath(AppPath) + "/Errorlog.txt";

            if (File.Exists(filePath))
            {
                sReader = File.OpenText(filePath);
                readText = sReader.ReadToEnd();
                sReader.Close();
            }
            else
            {
                sWriter = File.CreateText(filePath);
                sWriter.Close();
            }

            sWriter = new StreamWriter(filePath);
            sWriter.WriteLine(readText);

            sWriter.WriteLine("-------------------------------------------------------------------");
            sWriter.WriteLine("Error Occurred On : " + CurrDate);
            sWriter.WriteLine("Class Name : " + className + " && Method Name : " + methodName);
            sWriter.WriteLine("Error Message : " + errMessage);
            sWriter.WriteLine("Login User: " + user);
            sWriter.Close();
        }
    }
}