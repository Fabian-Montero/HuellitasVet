
using HuellitasVetApi.Models;
using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Humanizer.DateTimeHumanizeStrategy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp;
using NuGet.ProjectModel;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class ServicioController(IServicioModel iServicioModel, IFirebaseModel iFirebaseModel) : Controller
    {
        public IActionResult ConsultarServicios()
        {
            var resp = iServicioModel.ConsultarServicios();

            if (resp.Codigo == 1) {
                var datos = JsonSerializer.Deserialize<List<Servicio>>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            else {
                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarServicio(int id)
        {
            var resp = iServicioModel.ConsultarServicio(id);
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Servicio>((JsonElement)resp.Contenido!);
                ViewBag.RutaImagen = datos.RutaImagen!;
                return View(datos);
            }
            else 
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarServicios", "Servicio");
            }
            
        }
        [HttpPost]
        [FiltroSesiones]
        public async Task<IActionResult> ActualizarServicio(Servicio ent, [FromForm] IFormFile ImagenServicio)
        {
            //Actualiza los datos de la imagen
            if (ImagenServicio != null) {
                List<string> extensiones = new List<string>() { ".png", ".jpg" };
                string extension = Path.GetExtension(ImagenServicio.FileName);
                if (!extensiones.Contains(extension))
                {
                    TempData["ErrorMessage"] = "El formato de la imagen no es válido, debe ser uno de los siguientes formatos: " + string.Join(", ", extensiones);
                    return View();
                }

                await iFirebaseModel.EliminarImagen("servicio", ent.IdServicio);
                ent.RutaImagen =  await iFirebaseModel.GuardarImagen("servicio", ent.IdServicio, ImagenServicio);
                iServicioModel.ActualizarRutaImagen(ent);
            }
            
            //Actualiza los demas datos
            var resp = iServicioModel.ActualizarServicio(ent);
            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarServicios", "Servicio");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarServicios", "Servicio");
            }

        }
        [HttpGet]
        [FiltroSesiones]
        public IActionResult AgregarServicio()
        {
            return View();
        }
        [HttpPost]
        [FiltroSesiones]
        public async Task<IActionResult> AgregarServicio(Servicio ent,[FromForm] IFormFile ImagenServicio)
        {
            //Validar que la imagen sea png o jpg

            List<string> extensiones = new List<string>(){ ".png", ".jpg" }; 
            string extension = Path.GetExtension(ImagenServicio.FileName);
            if (!extensiones.Contains(extension)) 
            {
                TempData["ErrorMessage"] = "El formato de la imagen no es válido, debe ser uno de los siguientes formatos: " + string.Join(", ", extensiones);
                return View();
            }

            //Guarda el registro del servicio, guarda la imagen y actualiza la ruta
            var resp = iServicioModel.RegistrarServicio(ent);
             
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Servicio>((JsonElement)resp.Contenido!);
                int IdServicio = datos!.IdServicio;
                string nombre = ent.Descripcion!;


                Servicio servicio = new Servicio();
                servicio.RutaImagen = await iFirebaseModel.GuardarImagen("servicio", IdServicio, ImagenServicio);
                servicio.IdServicio = IdServicio;
                
                iServicioModel.ActualizarRutaImagen(servicio);

                TempData["SuccessMessage"] = "El registro fue exitoso.";
                return RedirectToAction("ConsultarServicios", "Servicio");
            }
            else
            {
                TempData["ErrorMessage"] = "Hubo un error en el registro.";
                return View();
            }
            
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarServicio(int id, string nombre)
        {
            var resp = iServicioModel.EliminarServicio(id);

            if (resp.Codigo == 1)
            {
                
                iFirebaseModel.EliminarImagen("servicio", id);
                return RedirectToAction("ConsultarServicios", "Servicio");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje; 
                return RedirectToAction("ConsultarServicios", "Servicio");
            }
        }


    }
}
