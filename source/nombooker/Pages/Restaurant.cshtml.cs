using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using nombooker.data;
using Microsoft.EntityFrameworkCore;

namespace nombooker.Pages
{
    public class RestaurantModel : PageModel
    {
        public Restaurant Restaurant;
        public List<MenuItem> MenuItems;
        public List<ItemCategory> ItemCategories = new List<ItemCategory>();

        private readonly nombookerdbContext _context;
        private readonly ILogger<RestaurantModel> _logger;

        public RestaurantModel(ILogger<RestaurantModel> logger, nombookerdbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public void OnGet()
        {
            var restaurantId = new Guid(HttpContext.Request.Query["id"]);
            Restaurant = _context.Restaurant.Find(restaurantId);
            MenuItems = _context.MenuItem.Where(menuItem => menuItem.RestaurantId == restaurantId).Include(menuItem => menuItem.CategoryNavigation).Include(menuItem => menuItem.MenuItemIngredient).ThenInclude(ingredient => ingredient.Ingredient).OrderBy(menuItem => menuItem.Category).ThenBy(menuItem => menuItem.Price).ThenBy(menuItem => menuItem.Name).ToList();
            foreach(var menuItem in MenuItems)
            {
                if (ItemCategories.Contains(menuItem.CategoryNavigation))
                    continue;
                ItemCategories.Add(menuItem.CategoryNavigation);
            }
        }

        public IActionResult OnPost()
        {
            var reservation = new Reservation { Id = Guid.NewGuid(), ReservationStatusId = 1, StartDateTime = DateTime.Parse(Request.Form["datebutton"]) };
            _context.Reservation.Add(reservation);
            _context.SaveChanges();
            return Redirect("/");
        }
    }
}
