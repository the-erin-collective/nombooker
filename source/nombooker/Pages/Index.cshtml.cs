using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using nombooker.data;

namespace nombooker.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly nombookerdbContext _context;
        public List<Restaurant> restaurants;

        public IndexModel(ILogger<IndexModel> logger, nombookerdbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public void OnGet()
        {
            restaurants = _context.Restaurant.ToList();
            _logger.LogDebug(restaurants.Count.ToString());
        }
    }
}
