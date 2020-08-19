using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class Ingredient
    {
        public Ingredient()
        {
            MenuItemIngredient = new HashSet<MenuItemIngredient>();
            OrderItemCustomRequest = new HashSet<OrderItemCustomRequest>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual ICollection<MenuItemIngredient> MenuItemIngredient { get; set; }
        public virtual ICollection<OrderItemCustomRequest> OrderItemCustomRequest { get; set; }
    }
}
