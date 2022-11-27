using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class Role
    {
        public Role()
        {
            Accounts = new HashSet<Account>();
            StatusAs = new HashSet<StatusA>();
        }

        public int RoleId { get; set; }
        public string? RoleName { get; set; }

        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ICollection<StatusA> StatusAs { get; set; }
    }
}
