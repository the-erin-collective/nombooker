using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class Order
    {
        public Order()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public Guid Id { get; set; }
        public Guid ReservationId { get; set; }
        public string Notes { get; set; }

        public virtual Reservation Reservation { get; set; }
        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
