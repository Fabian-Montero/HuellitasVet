using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    public class CitasController(IServicioModel iserviciomodel, ICitaModel Icitamodel,
        IMascotaModel imascotamodel) : Controller
    {


        [HttpGet]
        [FiltroSesiones]
        public IActionResult RegistrarCita()
        {
            ListaServicios();
            return View();
        }


        public ActionResult ListaServicios()
        {
            var serviciosList = iserviciomodel.ObtenerServicios();
            ViewBag.ServiciosList = serviciosList;


            return View();

        }


        [HttpGet]
        public IActionResult ConsultaDisponibilidad(int Id_Servicio, DateTime Fecha)
        {
            var resp = Icitamodel.ConsultaDisponibilidad(Id_Servicio, Fecha);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Cita>>((JsonElement)resp.Contenido!);
                return Json(datos);
            }

            return Json(new List<Cita>());
        }




        [HttpGet]
        [FiltroSesiones]
        public IActionResult DetalleCita(int IdServicio, DateTime? Fecha, int idhorario, string hora)
        {

            ListaMascotas();


            var modelo = new Servicio
            {
                IdServicio = IdServicio,
                //Fecha = Fecha!.Value,
                idhorario = idhorario,
                hora = hora
            };
            var resp = iserviciomodel.ConsultarServicio(IdServicio);

            if (resp.Codigo == 1)
            {

                var datos = JsonSerializer.Deserialize<Servicio>((JsonElement)resp.Contenido!);


                return View(datos);

            }


            return View(new Servicio());
        }


        public ActionResult ListaMascotas()
        {
        
            var mascotasList = imascotamodel.ConsultarMascotasUsuario(HttpContext.Session.GetInt32("IDUSUARIO")!.Value);
            ViewBag.MascotasList = mascotasList;


            return View();

        }


        [HttpPost]
        [FiltroSesiones]
        public IActionResult RegistrarCita(Cita entidad)
        {

            entidad.IdUsuario = HttpContext.Session.GetInt32("IDUSUARIO")!.Value;
            
            var resp = Icitamodel.RegistrarCita(entidad);

            if (resp.Codigo == 1)
            {
                TempData["SuccessMessage"] = "El registro fue exitoso.";

                ViewBag.msj = resp.Mensaje;

                return RedirectToAction("Citas", "RegistrarCita");

            }
            else
            {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";

                ViewBag.msj = resp.Mensaje;

                return View(entidad);

            }
        }

    }
}
