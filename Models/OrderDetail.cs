using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public int? AccountOrderId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }

        public virtual Account? AccountOrder { get; set; }
        public virtual Product? Product { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
