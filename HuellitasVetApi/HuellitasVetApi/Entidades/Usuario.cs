﻿namespace HuellitasVetApi.Entidades
{
    public class Usuario
    {   
        public int IdUsuario { get; set; }
        public string? NombreCompleto { get; set; }
        public string? Identificacion { get; set; }
        public string? Correo { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public string? Contrasenna { get; set; }
        public string? Token { get; set; }
        public bool? Estado { get; set; }
        public int RolId { get; set; }
        public string? Rol { get; set; }
        public bool EsTemporal { get; set; }
        public DateTime VigenciaTemporal { get; set; }
    }
}
