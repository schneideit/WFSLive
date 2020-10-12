using System.Configuration;
using System.Net.Mail;

namespace CRM.Common
{
    public class SendMailSettings
    {
        public void SendHtmlFormattedAdmissionReport(string recepientEmail, string CC, string subject, string body, string objAttachment)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));

                Attachment Admissionattachment;
                Admissionattachment = new Attachment(objAttachment);
                Admissionattachment.ContentDisposition.FileName = "AddmissionOfferLetter.pdf";
                mailMessage.Attachments.Add(Admissionattachment);

                if (CC != "")
                {
                    string[] CCId = CC.Split(',');

                    foreach (string CCEmail in CCId)
                    {
                        mailMessage.Bcc.Add(new MailAddress(CCEmail));
                    }
                }
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;

                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }
        public void SendHtmlFormattedEmail(string recepientEmail, string CCEmails, string subject, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"], "Admissions Team");
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                //mailMessage.ReplyToList.Add("john.doe@example.com");
                if (CCEmails != "")
                {
                    string[] CCId = CCEmails.Split(',');
                    foreach (string CCEmail in CCId)
                    {
                        mailMessage.Bcc.Add(new MailAddress(CCEmail));
                    }
                }

                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;

                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }
        public void SendHtmlFormattedEmail(string recepientEmail, string subject, string body, string CC, string ReplyTo)
        {
            string CCEmails;
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;

                mailMessage.To.Add(new MailAddress(recepientEmail));
                mailMessage.CC.Add(new MailAddress(CC));

                CCEmails = ConfigurationManager.AppSettings["EvalCC"];
                if (CCEmails != "")
                {
                    string[] CCId = CCEmails.Split(',');
                    foreach (string CCEmail in CCId)
                    {
                        mailMessage.Bcc.Add(new MailAddress(CCEmail));
                    }
                }


                mailMessage.ReplyToList.Add(new MailAddress(ReplyTo));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }
        public void SendHtmlFormattedEmailIV(string recepientEmail, string subject, string body, string CC)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                mailMessage.CC.Add(new MailAddress(CC));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];

                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;

                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }

        public void SendMailWithLetterAttachment(string sTo, string sCC, string sBcc, string sSubject, string sBody,
       string LetterFilePathURL, string LetterFileName)
        {
            using (MailMessage message = new MailMessage())          //Here we will create object of MailMessage class.
            {
                message.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"].ToString(), "Admissions Team");
                message.To.Add(sTo);        //Initilize To in mail address.

                if (sCC != "")                              //Check whether sCC is not empty.
                {
                    string[] CCId = sCC.Split(',');

                    foreach (string CCEmail in CCId)
                    {
                        message.CC.Add(new MailAddress(CCEmail));       //Add CC in mail address.
                    }
                }

                if (sBcc != "")                              //Check whether sBcc is not empty.
                {
                    string[] BccId = sBcc.Split(',');

                    foreach (string BccEmail in BccId)
                    {
                        message.Bcc.Add(new MailAddress(BccEmail));       //Add Bcc in mail address.
                    }
                }

                message.Subject = sSubject;        //Add subject in mail message.
                message.Body = sBody;            //Add body in mail message.

                message.IsBodyHtml = true;
                message.Priority = MailPriority.Normal;   //Set priority of mail message.

                if (LetterFilePathURL != "")
                {
                    //message.Attachments.Add(new Attachment(LetterFilePathURL, LetterFileName));
                    Attachment Admissionattachment;
                    Admissionattachment = new Attachment(LetterFilePathURL);
                    Admissionattachment.ContentDisposition.FileName = LetterFileName;
                    message.Attachments.Add(Admissionattachment);
                }
                // For Mail Sending in Local System
                SmtpClient smtp = new SmtpClient();
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
        }

        // Suhail for Online Class
        public void SendHtmlFormattedEmailOnlineClass(string recepientEmail, string subject, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;

                mailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }

        public void SendHtmlFormattedPaymentEmail(string recepientEmail, string CCEmails, string subject, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress("Accounts" + " " + ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));

                string[] CCId = CCEmails.Split(',');

                foreach (string CCEmail in CCId)
                {
                    mailMessage.Bcc.Add(new MailAddress(CCEmail));
                }
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                //smtp.EnableSsl = false;
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }

    }
}