using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class RolController(IRolesModel iRolesModel) : Controller
    {
        //Registrar Rol
        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarRol()
        {
            return View();
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarRol(Rol entidad)
        {
            var resp = iRolesModel.RegistrarRol(entidad);

            if (resp.Codigo == 1)
            {
                TempData["SuccessMessage"] = "El registro fue exitoso.";

                ViewBag.msj = resp.Mensaje;

                return RedirectToAction("ConsultarRoles", "Rol");

            }
            else
            {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";

                ViewBag.msj = resp.Mensaje;

                return View(entidad);

            }
        }

        //Consultar Roles
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarRoles()
        {
            var resp = iRolesModel.ConsultarRoles();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Rol>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Rol>());
        }

        //Actualizar Rol
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarRol(int id)
        {

            var resp = iRolesModel.ConsultarRol(id);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Rol>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            return View(new Rol());
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult ActualizarRol(Rol entidad)
        {
            var resp = iRolesModel.ActualizarRol(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("ConsultarRoles", "Rol");

            ViewBag.msj = resp.Mensaje;
            return View(entidad);
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarRol(int id)
        {

            var resp = iRolesModel.EliminarRol(id);

            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarRoles", "Rol");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarRoles", "Rol");
            }

        }
    }
}
