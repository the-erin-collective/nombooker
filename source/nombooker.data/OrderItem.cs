using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class OrderItem
    {
        public OrderItem()
        {
            OrderItemCustomRequest = new HashSet<OrderItemCustomRequest>();
        }

        public Guid OrderItemId { get; set; }
        public Guid MenuItemId { get; set; }
        public Guid OrderId { get; set; }
        public string Notes { get; set; }

        public virtual Order Order { get; set; }
        public virtual MenuItem OrderItemNavigation { get; set; }
        public virtual ICollection<OrderItemCustomRequest> OrderItemCustomRequest { get; set; }
    }
}
