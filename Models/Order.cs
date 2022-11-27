using System;
using System.Collections.Generic;

namespace Project_SE.Models
{
    public partial class Order
    {
        public int Id { get; set; }
        public int? ShipId { get; set; }
        public double? TotalPrice { get; set; }
        public string? Note { get; set; }
        public DateTime? CreatedSaleDate { get; set; }
        public DateTime? CreatedOrderDate { get; set; }
        public int? StatusOId { get; set; }
        public bool? IsDiscount { get; set; }
        public int? OrderDetailId { get; set; }

        public virtual OrderDetail? OrderDetail { get; set; }
        public virtual Account? Ship { get; set; }
        public virtual StatusA? StatusO { get; set; }
    }
}
