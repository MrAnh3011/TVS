using System;
using System.Collections.Generic;
using System.Text;

namespace Piranha.Manager.Models
{
    public class UserLoginListModel
    {
        public class ListItem
        {
            public Guid? Id { get; set; }

            public Guid SiteId { get; set; }

            public string UserName { get; set; }

            public string UserPassWord { get; set; }

            public string UserPhone { get; set; }

            public string UserMail { get; set; }

            public string UserFacebook { get; set; }

            public string UserCare { get; set; }

            public bool IsPermanent { get; set; }
        }

        public class SiteItem
        {
            public Guid Id { get; set; }
            public string Title { get; set; }
        }

        public Guid SiteId { get; set; }

        public string SiteTitle { get; set; }

        public IList<SiteItem> Sites { get; set; } = new List<SiteItem>();

        public IList<ListItem> Items { get; set; } = new List<ListItem>();

        public StatusMessage Status { get; set; }
    }
}
