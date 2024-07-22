USE [master]
GO
/****** Object:  Database [HuellitasVet]    Script Date: 20/7/2024 21:46:21 ******/
CREATE DATABASE [HuellitasVet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HuellitasVet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HuellitasVet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HuellitasVet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HuellitasVet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HuellitasVet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HuellitasVet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HuellitasVet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HuellitasVet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HuellitasVet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HuellitasVet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HuellitasVet] SET ARITHABORT OFF 
GO
ALTER DATABASE [HuellitasVet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HuellitasVet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HuellitasVet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HuellitasVet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HuellitasVet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HuellitasVet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HuellitasVet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HuellitasVet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HuellitasVet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HuellitasVet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HuellitasVet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HuellitasVet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HuellitasVet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HuellitasVet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HuellitasVet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HuellitasVet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HuellitasVet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HuellitasVet] SET RECOVERY FULL 
GO
ALTER DATABASE [HuellitasVet] SET  MULTI_USER 
GO
ALTER DATABASE [HuellitasVet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HuellitasVet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HuellitasVet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HuellitasVet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HuellitasVet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HuellitasVet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HuellitasVet', N'ON'
GO
ALTER DATABASE [HuellitasVet] SET QUERY_STORE = ON
GO
ALTER DATABASE [HuellitasVet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HuellitasVet]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_CATEGORIA_ID] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[IdCita] [bigint] IDENTITY(1,1) NOT NULL,
	[HoraInicio] [datetime] NOT NULL,
	[HoraFinal] [datetime] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[Estado] [varchar](1) NOT NULL,
	[SubTotal] [float] NULL,
	[Impuesto] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_CITA_ID] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita_Detalle]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita_Detalle](
	[IdCitaDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[CitaId] [bigint] NULL,
	[MascotaId] [bigint] NOT NULL,
	[ServicioId] [bigint] NOT NULL,
	[SubTotal] [float] NULL,
	[Impuesto] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_CITADETALLLE_ID] PRIMARY KEY CLUSTERED 
(
	[IdCitaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especie]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especie](
	[IdEspecie] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_ESPECIE_ID] PRIMARY KEY CLUSTERED 
(
	[IdEspecie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[IdMascota] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Raza] [varchar](200) NULL,
	[Color] [varchar](20) NULL,
	[Edad] [int] NULL,
	[Sexo] [varchar](1) NULL,
	[EspecieId] [bigint] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
 CONSTRAINT [PK_MASCOTA_ID] PRIMARY KEY CLUSTERED 
(
	[IdMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [float] NOT NULL,
	[RutaImagen] [varchar](200) NOT NULL,
	[CategoriaId] [bigint] NOT NULL,
 CONSTRAINT [PK_PRODUCTO_ID] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ROL_ID] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[IdServicio] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [float] NOT NULL,
	[RutaImagen] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SERVICIO_ID] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/7/2024 21:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](255) NOT NULL,
	[Identificacion] [varchar](12) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Direccion] [varchar](250) NULL,
	[Contrasenna] [varchar](12) NOT NULL,
	[Estado] [bit] NOT NULL,
	[RolId] [bigint] NOT NULL,
 CONSTRAINT [PK_USUARIO_ID] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'Cósmeticos')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Medicinas')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Juguetes')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Alimentos')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (5, N'Accesorios')
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Especie] ON 
GO
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (1, N'GATOS')
GO
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (2, N'PERROS')
GO
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (3, N'CONEJOS')
GO
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (4, N'ROEDORES')
GO
SET IDENTITY_INSERT [dbo].[Especie] OFF
GO
SET IDENTITY_INSERT [dbo].[Mascota] ON 
GO
INSERT [dbo].[Mascota] ([IdMascota], [Nombre], [Raza], [Color], [Edad], [Sexo], [EspecieId], [UsuarioId]) VALUES (8, N'Max', N'Pastor Alemán', N'Negro', 9, N'M', 2, 3)
GO
SET IDENTITY_INSERT [dbo].[Mascota] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (1, N'ADMINISTRADOR')
GO
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (2, N'CLIENTE')
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (3, N'Medicina Interna', 50000, N'mi')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (4, N'Laboratorio', 20000, N'lab')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (6, N'Ultrasonido', 30000, N'ul')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (7, N'Cirugia', 20000, N'ciru')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (9, N'Limpieza Dental', 45000, N'ld')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (10, N'Grooming', 20000, N'go')
GO
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (11, N'Rayos x', 35000, N'rx')
GO
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (3, N'Tifanny Camacho Monge', N'305070199', N'tcamacho70199@ufide.ac.cr', N'61046045', N'Cartago', N'5555', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__D6F931E54151FEF4]    Script Date: 20/7/2024 21:46:22 ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_CITA_USUARIO] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_CITA_USUARIO]
GO
ALTER TABLE [dbo].[Cita_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_MASCOTA_CITADETALLE] FOREIGN KEY([MascotaId])
REFERENCES [dbo].[Mascota] ([IdMascota])
GO
ALTER TABLE [dbo].[Cita_Detalle] CHECK CONSTRAINT [FK_MASCOTA_CITADETALLE]
GO
ALTER TABLE [dbo].[Cita_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_SERVICIO_CITADETALLE] FOREIGN KEY([ServicioId])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[Cita_Detalle] CHECK CONSTRAINT [FK_SERVICIO_CITADETALLE]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_MASCOTA_ESPECIE] FOREIGN KEY([EspecieId])
REFERENCES [dbo].[Especie] ([IdEspecie])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_MASCOTA_ESPECIE]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_MASCOTA_USUARIO] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_MASCOTA_USUARIO]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_CATEGORIA] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_PRODUCTO_CATEGORIA]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROL] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_USUARIO_ROL]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMascotas]    Script Date: 20/7/2024 21:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarMascotas]
AS
BEGIN
    SELECT [IdMascota]
          ,[Nombre]
          ,[Raza]
          ,[Color]
          ,[Edad]
          ,[Sexo]
          ,[EspecieId]
          ,[UsuarioId]
      FROM [dbo].[Mascota]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposEspecies]    Script Date: 20/7/2024 21:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTiposEspecies]
AS
BEGIN
    SELECT [IdEspecie] 'value'
          ,[Descripcion] 'text'
      FROM [dbo].[Especie]
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposUsuarios]    Script Date: 20/7/2024 21:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarTiposUsuarios]
AS
BEGIN
    SELECT [IdUsuario] 'value'
          ,[NombreCompleto] 'text'
      FROM [dbo].[Usuario]
END

GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 20/7/2024 21:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
AS
BEGIN
    SELECT [IdUsuario]
      ,[NombreCompleto]
      ,[Identificacion]
      ,[Correo]
      ,[Telefono]
      ,[Direccion]
      ,[Contrasenna]
      ,[Estado]
      ,[RolId]
  FROM [dbo].[Usuario]
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarMascota]    Script Date: 20/7/2024 21:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarMascota]
    @Nombre VARCHAR(200),
    @Raza VARCHAR(200) = NULL,
    @Color VARCHAR(20) = NULL,
    @Edad INT = NULL,
    @Sexo VARCHAR(1) = NULL,
    @EspecieId BIGINT,
    @UsuarioId BIGINT
AS
BEGIN
    INSERT INTO [dbo].[Mascota] (
        [Nombre],
        [Raza],
        [Color],
        [Edad],
        [Sexo],
        [EspecieId],
        [UsuarioId]
    ) VALUES (
        @Nombre,
        @Raza,
        @Color,
        @Edad,
        @Sexo,
        @EspecieId,
        @UsuarioId
    );
END;
GO
USE [master]
GO
ALTER DATABASE [HuellitasVet] SET  READ_WRITE 
GO

USE HuellitasVet

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@NombreCompleto   varchar(255),
	@Identificacion   varchar(12),
	@Correo           varchar(50),
	@Telefono         varchar(50),
	@Direccion        varchar(250),
	@Contrasenna      varchar(12)
AS
BEGIN
	DECLARE @Rol   TINYINT = 2,
            @Estado BIT    = 1
	
	IF NOT EXISTS(SELECT 1 FROM dbo.Usuario WHERE Correo = @Correo OR Identificacion = @Identificacion)
	BEGIN
		INSERT INTO dbo.Usuario(NombreCompleto, Identificacion, Correo, Telefono, Direccion, Contrasenna, RolId, Estado)
		VALUES(@NombreCompleto, @Identificacion, @Correo, @Telefono, @Direccion, @Contrasenna, @Rol, @Estado)
	END
END
GO


CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo			varchar(50),
	@Contrasenna	varchar(12)

AS
BEGIN
	SELECT IdUsuario, Identificacion, NombreCompleto, Correo, U.RolId, Estado, R.Nombre
	FROM dbo.Usuario U
	INNER JOIN dbo.Rol R ON U.RolId = R.IdRol
	WHERE	Correo = @Correo
	AND		Contrasenna = @Contrasenna
	AND		Estado = 1

END
GO