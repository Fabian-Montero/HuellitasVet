using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Text.Json;

namespace HuellitasVetWeb.Models
{
    public class ServicioModel(HttpClient httpClient, IConfiguration iConfiguration) : IServicioModel
    {

        public Respuesta ConsultarServicios()
        {
            Respuesta respuesta = new Respuesta();
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public List<SelectListItem> ObtenerServicios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ObtenerListadoServicios";

                var response = httpClient.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var respuesta = response.Content.ReadFromJsonAsync<Respuesta>().Result;
                    if (respuesta!.Codigo == 1)
                    {
                        var jsonElement = (JsonElement)respuesta.Contenido!;
                        var productos = JsonSerializer.Deserialize<List<Servicio>>(jsonElement.GetRawText());
                        if (productos != null)
                        {
                            return productos.Select(t => new SelectListItem
                            {
                                Value = t.IdServicio.ToString(),
                                Text = t.Descripcion
                            }).ToList();
                        }
                    }
                }
                return new List<SelectListItem>();
            }
        }





        public Respuesta ConsultarServicio(int id)
        {
            Respuesta respuesta = new Respuesta();
            using (httpClient = new HttpClient())
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicio?Id=" + id;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }



        public Respuesta RegistrarServicio(Servicio ent) {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/RegistrarServicio";

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }
        public Respuesta ActualizarRutaImagen(Servicio ent)
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ActualizarRutaImagen";

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PutAsync(url, body).Result;
                
                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }

        public Respuesta EliminarServicio(int ServicioId) 
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {

                string url = iConfiguration.GetSection("LLaves:UrlApi").Value + "Servicio/EliminarServicio?Id=" + ServicioId;

                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else 
                {
                    return new Respuesta();
                }
            }
        }

        

        public Respuesta ActualizarServicio(Servicio ent)
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ActualizarServicio";

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }


}
}