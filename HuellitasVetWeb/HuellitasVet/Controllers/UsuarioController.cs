using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class UsuarioController(IUsuarioModel iUsuarioModel, IComunModel iComunModel, IRolesModel iRolesModel) : Controller
    {
        public IActionResult Index()
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

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarUsuario(int id)
        {

            var resp = iUsuarioModel.ConsultarUsuario(id);
       
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)resp.Contenido!);
                ConsultarTiposEstados();
                ConsultarTiposRoles();
                
                return View(datos);
            }
            return View(new Usuario());
        }

        [HttpPost]
        [FiltroSesiones]
        public IActionResult ActualizarUsuario(Usuario entidad)
        {
            var resp = iUsuarioModel.ActualizarUsuario(entidad);

            if (resp.Codigo == 1)
                return RedirectToAction("ConsultarUsuarios", "Usuario");

            ViewBag.msj = resp.Mensaje;
            ConsultarTiposEstados();
            ConsultarTiposRoles();
            return RedirectToAction("ConsultarUsuarios", "Usuario");
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarUsuario(int id)
       {

            var resp = iUsuarioModel.EliminarUsuario(id);

            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarUsuarios", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarUsuarios", "Usuario");
            }

        }

        [HttpGet]
        [FiltroSesiones]
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

        private void ConsultarTiposRoles() 
        {
            var roles = iRolesModel.ConsultarTiposRoles();
            List<SelectListItem> listaRoles = new List<SelectListItem>();
            listaRoles = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)roles.Contenido!)!;
            listaRoles.Insert(0, new SelectListItem { Text = "Seleccione un rol ", Value = "" });

            ViewBag.Roles = listaRoles;
        }

        private void ConsultarTiposEstados()
        {
            List<SelectListItem> listaEstados = new List<SelectListItem>();
            listaEstados.Add(new SelectListItem { Text = "Seleccione un estado", Value = "" });
            listaEstados.Add(new SelectListItem { Text = "Activo", Value = true.ToString() });
            listaEstados.Add(new SelectListItem { Text = "Inactivo", Value = false.ToString() });

            ViewBag.Estados = listaEstados;
        }
    }
}
