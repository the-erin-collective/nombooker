using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class Reservation
    {
        public Reservation()
        {
            Order = new HashSet<Order>();
        }

        public Guid Id { get; set; }
        public DateTimeOffset StartDateTime { get; set; }
        public string Description { get; set; }
        public short ReservationStatusId { get; set; }
        public short NumberOfGuests { get; set; }
        public string PreferredTable { get; set; }
        public DateTimeOffset? EndDateTime { get; set; }

        public virtual ReservationStatus ReservationStatus { get; set; }
        public virtual ICollection<Order> Order { get; set; }
    }
}
