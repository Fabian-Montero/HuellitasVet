﻿namespace HuellitasVetWeb.Entidades
{
    public class Mascota
    {
        public int IdMascota { get; set; }  
        public string? Nombre { get; set; }
        public string? Raza { get; set; }
        public string? Color { get; set; }
        public int Edad { get; set; }
        public string? Sexo { get; set; }
        public int EspecieId { get; set; }
        public int UsuarioId { get; set; }

        public string? Mascotas { get; set; }
    }
}
