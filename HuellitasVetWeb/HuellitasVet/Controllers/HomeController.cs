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

        //Consultar Usuarios
        [FiltroSesiones]
        [HttpGet]
        public IActionResult ConsultarUsuarios()
        {
            var resp = iUsuarioModel.ConsultarUsuarios();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Usuario>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Usuario>());
        }

        public IActionResult MiCuenta()
        {
            var idUsuarioSession = HttpContext.Session.GetInt32("CONSECUTIVO");
            int idusuario = idUsuarioSession ?? 0;

            var respuesta = iUsuarioModel.ConsultarDatosUsuario(idusuario);

            if (respuesta!.Codigo == 1)
            {
                try
                {
                    var jsonElement = (JsonElement)respuesta.Contenido!;
                    var jsonString = jsonElement.GetRawText();

                    
                    var usuarios = JsonSerializer.Deserialize<List<Usuario>>(jsonString);

                    if (usuarios != null && usuarios.Count > 0)
                    {
                        var usuario = usuarios[0]; 
                        return View(usuario);
                    }
                    else
                    {
                        return RedirectToAction("IniciarSesion", "Inicio");
                    }
                }
                catch (JsonException ex)
                {
                    
                    return RedirectToAction("Error", "Inicio");
                }
            }
            else
            {
                return RedirectToAction("IniciarSesion", "Inicio");
            }
        }

    }
}
