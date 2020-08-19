using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class MenuItemIngredient
    {
        public Guid MenuItemId { get; set; }
        public Guid IngredientId { get; set; }
        public bool? IsExtra { get; set; }
        public double? ExtraPrice { get; set; }
        public bool? IsOptional { get; set; }
        public double? OptionDiscount { get; set; }

        public virtual Ingredient Ingredient { get; set; }
        public virtual MenuItem MenuItem { get; set; }
    }
}
