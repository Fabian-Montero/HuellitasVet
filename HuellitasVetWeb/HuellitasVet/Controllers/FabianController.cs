using Microsoft.AspNetCore.Mvc;

namespace HuellitasVetWeb.Controllers
{
    public class FabianController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Prueba()
        {
            return View();
        }
    }
}
