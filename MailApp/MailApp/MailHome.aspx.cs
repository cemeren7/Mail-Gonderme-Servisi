using System;
using System.Web.UI;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Web;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace MailApp
{
    public partial class MailHome : Page
    {
        protected  async void Send_Click(object sender, EventArgs e)
        {
            if (accountmail.Text.Trim() == "" || apppassword.Text.Trim() == "" || from.Text.Trim() == "" || to.Text.Trim() == "" || apppassword.Text.Trim().Length<16)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mail hesab adı,şifresi,kimden,kime alanları boş olmadıgından ve uygulama şifrenizin 16 haneli oldugundan emin olunuz.');", true);
            }
            else
            {
                SmtpClient clientmail = new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(accountmail.Text.Trim(), apppassword.Text.Trim()),
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                };
                MailMessage mailbody = new MailMessage()
                {
                    IsBodyHtml = true,
                    From = new MailAddress(from.Text.Trim()),
                    Subject = subject.Text.Trim(),
                    Body = @"<p><b style='font-family: Arial, sans-serif;'> Gönderen pc adı: </b>" + Environment.MachineName + "</p>" +
                          "</br>" +
                          "<p><b style='font-family: Arial, sans-serif;'> Gönderilen tarih ve saat: </b>" + DateTime.Now + "</p>" +
                          "</br>" +
                          mailmessage.Text.Trim(),     
                };
                mailbody.To.Add(to.Text.Trim());
                MailApp.MainSettings.Logs.Add(new MailLogs
                {
                    LogId = MainSettings.Logs.Any() ? MainSettings.Logs.Max(p => p.LogId) + 1 : 0,
                    AccountPassword = Encoding.UTF8.GetString(Convert.FromBase64String(apppassword.Text.Trim())),
                    AccountName = accountmail.Text.Trim(),
                    From = from.Text.Trim(),
                    To = to.Text.Trim(),
                    Subject = subject.Text.Trim(),
                    Message = mailmessage.Text.Trim(),
                    LogDate = DateTime.Now
                });
                MailApp.MainSettings.LogsSave(MainSettings.Logs);
                string filepath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(filepath))
                {
                    Directory.CreateDirectory(filepath);
                }
                    if (filemail.HasFile)
                    {
                        foreach (HttpPostedFile uploadedFile in filemail.PostedFiles) 
                        {
                            string Filepath = Path.Combine(filepath,Path.GetFileName(uploadedFile.FileName));
                            uploadedFile.SaveAs(Filepath);

                             byte[] files = File.ReadAllBytes(Filepath);
                             MemoryStream ramfile = new MemoryStream(files);
                           
                            Attachment file = new Attachment(ramfile,Path.GetFileName(Filepath));
                            mailbody.Attachments.Add(file);
                        }
                    }
                try
                {
                    await clientmail.SendMailAsync(mailbody);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mail başarılı şekilde iletildi.');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Mail iletimi sırasında hata oluştu Hata: {ex.Message}');", true);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            MailApp.MainSettings.LogsRead();
        }
    }
}