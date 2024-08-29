using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Humanizer.DateTimeHumanizeStrategy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class MascotaController(IMascotaModel iMascotaModel, IEspecieModel iEspecieModel, IUsuarioModel iUsuarioModel) : Controller
    {
        //Usuario cliente
        [HttpGet]
        public ActionResult ConsultarMascotaUsuario()
        {
            var respuesta = iMascotaModel.ConsultarMascotaUsuario();

            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Mascota>>((JsonElement)respuesta.Contenido!);

                var especiesResp = iEspecieModel.ConsultarTiposEspecies();

                var listaEspecies = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)especiesResp.Contenido!)!;

                var especiesDict = listaEspecies.ToDictionary(e => int.Parse(e.Value), e => e.Text);

                ViewBag.Especies = especiesDict;

                return View(datos);
            }

            return View(new List<Mascota>());
        }

        //Registrar Mascotas
        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarMascota()
        {
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();
            var rolUsuario = HttpContext.Session.GetString("ROL");
            var usuarioId = HttpContext.Session.GetInt32("IDUSUARIO");

            if (rolUsuario == "2")
            {
                ViewBag.UsuarioLogueado = usuarioId;
            }

            return View();
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarMascota(Mascota entidad)
        {
            var rolUsuario = HttpContext.Session.GetString("ROL");

            if (rolUsuario == "2")
            {
                entidad.UsuarioId = HttpContext.Session.GetInt32("IDUSUARIO") ?? 0;
            }

            var resp = iMascotaModel.RegistrarMascota(entidad);

            if (resp.Codigo == 1)
            {
                ViewBag.msj = resp.Mensaje;
                ConsultarTiposEspecies();
                if (rolUsuario == "1")
                {
                    ConsultarTiposUsuarios();
                    return RedirectToAction("ConsultarMascotas", "Mascota");
                }
                else
                {
                    return RedirectToAction("ConsultarMascotaUsuario", "Mascota");
                }
               
            }else {

                ViewBag.msj = resp.Mensaje;
                ConsultarTiposEspecies();
                if (rolUsuario == "1")
                {
                    ConsultarTiposUsuarios();
                }

                return View();

            }
        }

        //Consultar Mascotas
        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarMascotas()
        {
            var resp = iMascotaModel.ConsultarMascotas();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Mascota>>((JsonElement)resp.Contenido!);

                var especiesResp = iEspecieModel.ConsultarTiposEspecies();
                var usuariosResp = iUsuarioModel.ConsultarTiposUsuarios();

                var listaEspecies = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)especiesResp.Contenido!)!;
                var listaUsuarios = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)usuariosResp.Contenido!)!;

                var especiesDict = listaEspecies.ToDictionary(e => int.Parse(e.Value), e => e.Text);
                var usuariosDict = listaUsuarios.ToDictionary(u => int.Parse(u.Value), u => u.Text);

                ViewBag.Especies = especiesDict;
                ViewBag.Usuarios = usuariosDict;

                return View(datos);
            }

            return View(new List<Mascota>());
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarMascota(int id)
        {

            var resp = iMascotaModel.ConsultarMascota(id);
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();

            if (resp.Codigo == 1) { 
                var datos = JsonSerializer.Deserialize<Mascota>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            return View(new Mascota());
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult ActualizarMascota(Mascota entidad)
        {
            var rolUsuario = HttpContext.Session.GetString("ROL");
            var resp = iMascotaModel.ActualizarMascota(entidad);

            if (resp.Codigo == 1)
                if (rolUsuario == "1")
                {
                    return RedirectToAction("ConsultarMascotas", "Mascota");
                }
                else
                {
                    return RedirectToAction("ConsultarMascotaUsuario", "Mascota");
                }
            ViewBag.msj = resp.Mensaje;
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();
            if (rolUsuario == "1")
            {
                return RedirectToAction("ConsultarMascotas", "Mascota");
            }
            else
            {
                return RedirectToAction("ConsultarMascotaUsuario", "Mascota");
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarMascota(int id)
        {
            var rolUsuario = HttpContext.Session.GetString("ROL");
            var resp = iMascotaModel.EliminarMascota(id);

            if (resp.Codigo == 1)
            {
                if (rolUsuario == "1")
                {
                    return RedirectToAction("ConsultarMascotas", "Mascota");
                }
                else
                {
                    return RedirectToAction("ConsultarMascotaUsuario", "Mascota");
                }
            }
            else {
                ViewBag.MsjPantalla = resp.Mensaje;
                if (rolUsuario == "1")
                {
                    return RedirectToAction("ConsultarMascotas", "Mascota");
                }
                else
                {
                    return RedirectToAction("ConsultarMascotaUsuario", "Mascota");
                }
            }

        }

        //---> Consultas para DropDown
        private void ConsultarTiposEspecies()
        {
            var especies = iEspecieModel.ConsultarTiposEspecies();
            List<SelectListItem> listaEspecies = new List<SelectListItem>();
            listaEspecies = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)especies.Contenido!)!;
            listaEspecies.Insert(0, new SelectListItem { Text = "Seleccione", Value = "" });

            ViewBag.Especies = listaEspecies;
        }
        private void ConsultarTiposUsuarios()
        {
            var usuarios = iUsuarioModel.ConsultarTiposUsuarios();
            List<SelectListItem> listaUsuarios = new List<SelectListItem>();
            listaUsuarios = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)usuarios.Contenido!)!;
            listaUsuarios.Insert(0, new SelectListItem { Text = "Seleccione", Value = "" });

            ViewBag.Usuarios = listaUsuarios;
        }

    }
}
