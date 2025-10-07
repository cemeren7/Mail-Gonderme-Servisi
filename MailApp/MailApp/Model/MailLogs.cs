using System;
using System.Collections.Generic;

namespace MailApp
{
    public class MailLogs
    {
        public int LogId { get; set; }
        public string AccountName { get; set; }
        public string AccountPassword { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public DateTime LogDate { get; set; }
        public List<string> files  { get; set; }
    }
}