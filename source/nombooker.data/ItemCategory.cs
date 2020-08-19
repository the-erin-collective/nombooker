using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class ItemCategory
    {
        public ItemCategory()
        {
            MenuItem = new HashSet<MenuItem>();
        }

        public short Id { get; set; }
        public string Description { get; set; }

        public virtual ICollection<MenuItem> MenuItem { get; set; }
    }
}
