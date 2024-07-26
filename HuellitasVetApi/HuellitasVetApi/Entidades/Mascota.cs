namespace HuellitasVetApi.Entidades
{
    public class Mascota
    {
        public int IdMascota { get; set; }
        public string? Nombre { get; set; }
        public string? Raza { get; set; }
        public string? Color { get; set; }
        public int Edad { get; set; }
        public string? Sexo{ get; set;}
        public long EspecieId { get; set; }
        public long UsuarioId { get; set; }
    }
}
