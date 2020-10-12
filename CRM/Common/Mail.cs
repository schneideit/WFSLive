using System;
using System.Configuration;
using System.Net.Mail;

namespace CRM.Common
{
    public class Mail
    {
        public static void SendMails(string recepientEmail, string subject, string body, string CcTo, string alertMsg, string ToBcc)
        {
            try
            {

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"], alertMsg);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    if (CcTo != "")
                    {
                        mailMessage.CC.Add(new MailAddress(CcTo));
                    }
                    mailMessage.Bcc.Add(ToBcc);
                    mailMessage.To.Add(new MailAddress(recepientEmail));
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = ConfigurationManager.AppSettings["Host"];
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                    NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                    smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                    smtp.SendMailAsync(mailMessage);
                }
            }
            catch (Exception ex)
            {
                AppErrorLog objLog = new AppErrorLog();
                objLog.ErrorLog("Mail.cs", "SendMails", ex.Message.ToString(), "Admin", AppErrorLog.ErrorLogMethods.TextFile, "LMS");
                string filePath = System.IO.Path.Combine(
                                     Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                                      "ErrorLog.txt");
                System.IO.File.WriteAllText(filePath, ex.ToString());
            }

        }
    }
}