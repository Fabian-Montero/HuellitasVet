using HuellitasVetWeb.Entidades;
using Microsoft.Extensions.Configuration;
using System.Net.Http;

namespace HuellitasVetWeb.Models
{
    public class EspecieModel(HttpClient httpClient, IConfiguration iConfiguration) : IEspecieModel
    {
        public Respuesta ConsultarTiposEspecies()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Especies/ConsultarTiposEspecies";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
