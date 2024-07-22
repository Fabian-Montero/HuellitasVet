using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class EspeciesController(IMascotaModel iMascotaModel, IEspecieModel iEspecieModel, IUsuarioModel iUsuarioModel) : Controller
    {
        //Registrar Mascotas
        [HttpGet]
        public IActionResult RegistrarMascota()
        {
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();

            return View();
        }

        [HttpPost]
        public IActionResult RegistrarMascota(Mascota entidad)
        {

            var resp = iMascotaModel.RegistrarMascota(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("Inicio", "Home");

            ViewBag.msj = resp.Mensaje;
            ConsultarTiposEspecies();
            ConsultarTiposUsuarios();
            return View();
        }

        //Consultar Mascotas
        [HttpGet]
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

        //Comentario de prueba
    }
}
