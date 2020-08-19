using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class ReservationStatus
    {
        public ReservationStatus()
        {
            Reservation = new HashSet<Reservation>();
        }

        public short Id { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Reservation> Reservation { get; set; }
    }
}
