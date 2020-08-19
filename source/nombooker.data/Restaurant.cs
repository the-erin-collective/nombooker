using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class Restaurant
    {
        public Restaurant()
        {
            MenuItem = new HashSet<MenuItem>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public byte[] BannerImage { get; set; }
        public byte[] LogoImage { get; set; }
        public TimeSpan OpeningTime { get; set; }
        public TimeSpan ClosingTime { get; set; }

        public virtual ICollection<MenuItem> MenuItem { get; set; }
    }
}
