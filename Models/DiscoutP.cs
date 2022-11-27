using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class DiscoutP
    {
        public DiscoutP()
        {
            Products = new HashSet<Product>();
        }

        public int DiscountId { get; set; }
        public byte? PercentP { get; set; }
        public byte? Quantity { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
