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
        //Registrar Mascotas
        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarMascota()
        {
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();

            return View();
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarMascota(Mascota entidad)
        {

            var resp = iMascotaModel.RegistrarMascota(entidad);

            if (resp.Codigo == 1)
            {
                TempData["SuccessMessage"] = "El registro fue exitoso.";

                ViewBag.msj = resp.Mensaje;
                ConsultarTiposEspecies();
                ConsultarTiposUsuarios();

                return RedirectToAction("ConsultarMascotas", "Mascota");

               
            }else {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";

                ViewBag.msj = resp.Mensaje;
                ConsultarTiposEspecies();
                ConsultarTiposUsuarios();

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
            var resp = iMascotaModel.ActualizarMascota(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("ConsultarMascotas", "Mascota");

            ViewBag.msj = resp.Mensaje;
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();
            return RedirectToAction("ConsultarMascotas", "Mascota");
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarMascota(int id)
        {

            var resp = iMascotaModel.EliminarMascota(id);

            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarMascotas", "Mascota");
            }
            else {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarMascotas", "Mascota");
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
