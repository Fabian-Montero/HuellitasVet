namespace HuellitasVetApi.Entidades
{
    public class Usuario
    {
        public string? NombreCompleto { get; set; }
        public string? Identificacion { get; set; }
        public string? Correo { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public string? Contrasenna { get; set; }
        public bool Estado { get; set; }
        public long RolId { get; set; }
    }
}
