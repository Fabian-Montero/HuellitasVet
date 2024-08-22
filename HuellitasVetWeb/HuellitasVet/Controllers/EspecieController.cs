using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class EspecieController(IEspecieModel iEspecieModel) : Controller
    {
        //Registrar Especie
        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarEspecie()
        {
            return View();
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarEspecie(Especie entidad)
        {
            var resp = iEspecieModel.RegistrarEspecie(entidad);

            if (resp.Codigo == 1)
            {
                TempData["SuccessMessage"] = "El registro fue exitoso.";

                ViewBag.msj = resp.Mensaje;

                return RedirectToAction("ConsultarEspecies", "Especie");

            }
            else
            {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";

                ViewBag.msj = resp.Mensaje;
               
                return View(entidad);

            }

        }

        //Consultar Especies
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarEspecies()
        {
            var resp = iEspecieModel.ConsultarEspecies();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Especie>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Especie>());
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarEspecie(int id)
        {

            var resp = iEspecieModel.ConsultarEspecie(id);
            
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Especie>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            return View(new Especie());
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult ActualizarEspecie(Especie entidad)
        {
            var resp = iEspecieModel.ActualizarEspecie(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("ConsultarEspecies", "Especie");

            ViewBag.msj = resp.Mensaje;
            return View(entidad);
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarEspecie(int id)
        {

            var resp = iEspecieModel.EliminarEspecie(id);

            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarEspecies", "Especie");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarEspecies", "Especie");
            }

        }

        
    }
}
