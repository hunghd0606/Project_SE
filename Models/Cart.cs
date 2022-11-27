using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class Cart
    {
        public int CartId { get; set; }
        public int? Quantity { get; set; }
        public int? ProductId { get; set; }
        public int? AccountId { get; set; }

        public virtual Account? Account { get; set; }
        public virtual Product? Product { get; set; }
    }
}
