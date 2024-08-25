using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Text.Json;

namespace HuellitasVetWeb.Models
{
    public class ServicioModel(HttpClient httpClient, IConfiguration iConfiguration) :IServicioModel
    {

        public List<SelectListItem> ConsultarServicios()
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


        public Respuesta ConsultarServicio(int IdServicio)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicio?IdServicio=" + IdServicio;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
