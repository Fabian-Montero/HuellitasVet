using HuellitasVetApi.Models;
using HuellitasVetWeb.Entidades;
using HuellitasVetWeb.Models;
using Humanizer.DateTimeHumanizeStrategy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using NuGet.Protocol;
using System.Text.Json;

namespace HuellitasVetWeb.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class ProductoController(IProductoModel iProductoModel, IFirebaseModel iFirebaseModel) : Controller
    {

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarProductos()
        {

            var resp = iProductoModel.ConsultarProductos();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ConsultarProductosCliente()
        {

            var resp = iProductoModel.ConsultarProductos();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult AgregarProducto()
        {
            ConsultarTiposCategorias();
            return View();
        }
        [HttpPost]
        [FiltroSesiones]
        public async Task<IActionResult> AgregarProducto(Producto ent, [FromForm] IFormFile ImagenProducto)
        {
            List<string> extensiones = new List<string>() { ".png", ".jpg" };
            string extension = Path.GetExtension(ImagenProducto.FileName);
            if (!extensiones.Contains(extension))
            {
                ViewBag.MsjPantalla = "El formato de la imagen no es válido, debe ser uno de los siguientes formatos: " + string.Join(", ", extensiones);
                return View();
            }

            var resp = iProductoModel.AgregarProducto(ent);
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Producto>((JsonElement)resp.Contenido!);
                int idProducto = datos!.IdProducto;

                Producto producto = new Producto();
                producto.RutaImagen = await iFirebaseModel.GuardarImagen("productos", idProducto, ImagenProducto);
                producto.IdProducto = idProducto;

                iProductoModel.ActualizarRutaImagen(producto);

                return RedirectToAction("ConsultarProductos", "Producto");

            }
            else
            {

                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult ActualizarProducto(int id)
        {

            var resp = iProductoModel.ConsultarProducto(id);
            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Producto>((JsonElement)resp.Contenido!);
                ViewBag.RutaImagen = datos!.RutaImagen;
                ConsultarTiposCategorias();
                return View(datos);
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarProductos", "Producto");
            }
        }

        [HttpPost]
        [FiltroSesiones]
        public async Task<IActionResult> ActualizarProducto(Producto ent, [FromForm] IFormFile ImagenProducto)
        {
            //Actualiza los datos de la imagen
            if (ImagenProducto != null)
            {
                List<string> extensiones = new List<string>() { ".png", ".jpg" };
                string extension = Path.GetExtension(ImagenProducto.FileName);
                if (!extensiones.Contains(extension))
                {
                    ViewBag.MsjPantalla =  "El formato de la imagen no es válido, debe ser uno de los siguientes formatos: " + string.Join(", ", extensiones);
                    return View();
                }

                await iFirebaseModel.EliminarImagen("productos", ent.IdProducto);
                ent.RutaImagen =  await iFirebaseModel.GuardarImagen("productos", ent.IdProducto, ImagenProducto);
                iProductoModel.ActualizarRutaImagen(ent);
            }

            //Actualiza los demas datos
            var resp = iProductoModel.ActualizarProducto(ent);
            if (resp.Codigo == 1)
            {
                return RedirectToAction("ConsultarProductos", "Producto");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }
        }

        [HttpGet]
        [FiltroSesiones]
        public IActionResult EliminarProducto(int id)
        {
            var resp = iProductoModel.EliminarProducto(id);

            if (resp.Codigo == 1)
            {

                iFirebaseModel.EliminarImagen("productos", id);
                return RedirectToAction("ConsultarProductos", "Producto");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return RedirectToAction("ConsultarProductos", "Producto");
            }
        }

        

        private void ConsultarTiposCategorias()
        {

            var resp = iProductoModel.ConsultarTiposCategorias();

            List<SelectListItem> listaCategorias = new List<SelectListItem>();
            listaCategorias = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)resp.Contenido!)!;
            listaCategorias.Insert(0, new SelectListItem { Text = "Seleccione una categoría ", Value = "" });

            ViewBag.TiposCategorias = listaCategorias;

        }
    }
}
