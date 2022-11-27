using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class Product
    {
        public Product()
        {
            Carts = new HashSet<Cart>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string? Code { get; set; }
        public string? Name { get; set; }
        public int? QuantitySale { get; set; }
        public int? Quantity { get; set; }
        public double? Price { get; set; }
        public string? Description { get; set; }
        public string? Img { get; set; }
        public DateTime? CreateDate { get; set; }
        public int? DiscountId { get; set; }
        public int? AccountId { get; set; }
        public bool? IsExit { get; set; }

        public virtual Account? Account { get; set; }
        public virtual Category Category { get; set; } = null!;
        public virtual DiscoutP? Discount { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
