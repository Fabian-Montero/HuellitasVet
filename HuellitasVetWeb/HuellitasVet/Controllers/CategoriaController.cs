using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class CategoriaController(ICategoriaModel iCategoriaModel) : Controller
    {
        //Registrar Categoría
        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarCategoria()
        {
            return View();
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarCategoria(Categoria entidad)
        {
            var resp = iCategoriaModel.RegistrarCategoria(entidad);

            if (resp.Codigo == 1)
            {
                ViewBag.msj = resp.Mensaje;
                return RedirectToAction("ConsultarCategorias", "Categoria");
            }
            else
            {
                ViewBag.msj = resp.Mensaje;
                return View(entidad);
            }

        }

        //Consultar Categorías
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarCategorias()
        {
            var resp = iCategoriaModel.ConsultarCategorias();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Categoria>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Categoria>());
        }

        //Actualizar Categoría
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarCategoria(int id)
        {

            var resp = iCategoriaModel.ConsultarCategoria(id);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Categoria>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            return View(new Categoria());
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult ActualizarCategoria(Categoria entidad)
        {
            var resp = iCategoriaModel.ActualizarCategoria(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("ConsultarCategorias", "Categoria");

            ViewBag.msj = resp.Mensaje;
            return View(entidad);
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarCategoria(int id)
        {

            var resp = iCategoriaModel.EliminarCategoria(id);

            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarCategorias", "Categoria");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarCategorias", "Categoria");
            }

        }
    }
}
