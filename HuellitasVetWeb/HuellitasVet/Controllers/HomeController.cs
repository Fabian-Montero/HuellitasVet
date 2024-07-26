using HuellitasVetWeb.Controllers;
using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace HuellitasVet.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel, IComunModel iComunModel) : Controller
    {
        [HttpGet]
        public IActionResult InicioSesion()
        {
            return View();
        }

        [HttpPost]
        public IActionResult InicioSesion(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);
            var res = iUsuarioModel.InicioSesion(ent);
            if (res.Codigo == 1)
            {

                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)res.Contenido!);
                HttpContext.Session.SetString("TOKEN", datos!.Token!);
                HttpContext.Session.SetString("NOMBRE", datos!.NombreCompleto!);
                HttpContext.Session.SetString("ROL", datos!.RolId.ToString());
                HttpContext.Session.SetInt32("CONSECUTIVO", datos!.IdUsuario);

                return RedirectToAction("Inicio", "Home");

            }
            else
            {
                ViewBag.msj = res.Mensaje;
                return View();
            }
        }



        [HttpGet]
        public IActionResult Registro()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Registro(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);

            var res = iUsuarioModel.RegistrarUsuario(ent);

            if (res.Codigo == 1)
            {
                TempData["SuccessMessage"] = "Registro existoso.Inicie sesión";

                ViewBag.msj = res.Mensaje;
                return RedirectToAction("InicioSesion", "Home");


            }
            else
            {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";
                return RedirectToAction("Registro", "Home");

            }
        }
        [FiltroSesiones]
        [HttpGet]
        public IActionResult Salir()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Inicio", "Home");
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult Inicio()
        {
            return View();
        }

        
    }
}
