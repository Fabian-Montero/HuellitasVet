using HuellitasVet.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace HuellitasVet.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult InicioSesion()
        {
            return View();
        }

        public IActionResult Registro()
        {
            return View();
        }

        public IActionResult Inicio()
        {
            return View();
        }


    

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
