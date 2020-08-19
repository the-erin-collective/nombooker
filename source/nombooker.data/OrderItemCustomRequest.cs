using System;
using System.Collections.Generic;

namespace nombooker.data
{
    public partial class OrderItemCustomRequest
    {
        public Guid OrderItemId { get; set; }
        public Guid IngredientId { get; set; }
        public double QuantityAdjustment { get; set; }

        public virtual Ingredient Ingredient { get; set; }
        public virtual OrderItem OrderItem { get; set; }
    }
}
