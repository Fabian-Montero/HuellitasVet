﻿using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public class UsuarioModel(HttpClient httpClient, IConfiguration iConfiguration): IUsuarioModel
    {
        public Respuesta ConsultarUsuarios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarUsuarios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarTiposUsuarios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarTiposUsuarios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
