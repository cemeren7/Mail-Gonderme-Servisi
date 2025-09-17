
using System.IO;
using System.Web;
using System.Collections.Generic;
using System;
using Newtonsoft.Json;
namespace MailApp
{
    public static class MainSettings
    {
        public static string jsonPathLog = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data"), "MailLogs.json");
        public static List<MailLogs> Logs = new List<MailLogs>();
        public static void LogsSave(this List<MailLogs> value)
        {
            string date = "2025-09-16T09:59:41.9558709+03:00";
            DateTimeOffset dt = DateTimeOffset.Parse(date);
            var setting = new JsonSerializerSettings()
            {
                DateFormatString = "yyyy-MM-dd HH:mm:ss"
            };
            string jsons = JsonConvert.SerializeObject(Logs, Formatting.Indented, setting);
            File.WriteAllText(jsonPathLog, jsons);
        }
        public static void LogsRead()
        {
            string jsonlog = File.ReadAllText(jsonPathLog);
            Logs = JsonConvert.DeserializeObject<List<MailLogs>>(jsonlog);
        }
    }
}