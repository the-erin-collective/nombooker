using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class MenuItem
    {
        public MenuItem()
        {
            MenuItemIngredient = new HashSet<MenuItemIngredient>();
        }

        public Guid Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public Guid RestaurantId { get; set; }
        public short? Category { get; set; }
        public bool? VeganFriendly { get; set; }
        public bool? VegetarianFriendly { get; set; }
        public string PossibleAllergens { get; set; }
        public bool? Spicy { get; set; }

        public virtual ItemCategory CategoryNavigation { get; set; }
        public virtual Restaurant Restaurant { get; set; }
        public virtual OrderItem OrderItem { get; set; }
        public virtual ICollection<MenuItemIngredient> MenuItemIngredient { get; set; }
    }
}
