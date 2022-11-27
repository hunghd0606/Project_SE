using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class StatusA
    {
        public StatusA()
        {
            Accounts = new HashSet<Account>();
            Orders = new HashSet<Order>();
        }

        public int StatusId { get; set; }
        public int? RoleId { get; set; }
        public string StatusName { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
