using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class Account
    {
        public Account()
        {
            Carts = new HashSet<Cart>();
            OrderDetails = new HashSet<OrderDetail>();
            Orders = new HashSet<Order>();
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? DisplayName { get; set; }
        public string? Address { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? StatusId { get; set; }
        public int? RoleId { get; set; }

        public virtual Role? Role { get; set; }
        private  StatusA myVar;

        public virtual StatusA Status
        {
            get { return myVar; }
            set { myVar  = value==null?new StatusA(): value; }
        }

         
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
