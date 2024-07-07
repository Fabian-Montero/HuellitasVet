using Microsoft.AspNetCore.Mvc;

namespace HuellitasVetWeb.Controllers
{
    public class FabianController : Controller
    {
        public IActionResult Index()
        {
            return View();
            // Esto es una prueba
        }

        public IActionResult Prueba()
        {
            return View();
        }
        public IActionResult Prueba2()
        {
            return View();
        }
    }
}
