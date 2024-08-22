USE [master]
GO
/****** Object:  Database [HuellitasVet]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Cita]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Cita_Detalle]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Especie]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Mascota]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/8/2024 20:30:28 ******/
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
INSERT [dbo].[Mascota] ([IdMascota], [Nombre], [Raza], [Color], [Edad], [Sexo], [EspecieId], [UsuarioId]) VALUES (8, N'Max', N'Pastor Alemán', N'Negro', 9, N'M', 3, 4)
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
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (3, N'Tifanny Camacho Monge', N'305070199', N'tcamacho70199@ufide.ac.cr', N'61046045', N'Cartago', N'5555', 1, 2)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (4, N'Frank Garay', N'116510000', N'frank@gmail.com', N'61344003', N'Heredia, San Francisco, 40103', N'Frank1234', 1, 2)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (5, N'Frank Joseph Garay Morales', N'116510847', N'fgaray10847@ufide.ac.cr', N'6134003', N'condominio francisco de heredia, apt 119', N'QAxitIS86NMf', 1, 1)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (12, N'Fabian Montero Madrigal edit', N'118560019', N'fabianja0477@gmail.com', N'84955721', N'San José Vázquez de coronado', N'h7njfGopwZVF', 1, 2)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (13, N'Melissa Vargas Gómez', N'402510174', N'mv213845@gmail.com', N'87963587', N'Heredia, Mercedes Norte', N'h7njfGopwZVF', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__D6F931E531381072]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarCategoria]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCategoria]
    @Descripcion VARCHAR(200),
	@IdCategoria BIGINT
AS
BEGIN
    UPDATE [dbo].[Categoria] 
    SET [Descripcion] = COALESCE(@Descripcion, [Descripcion])
      
 WHERE IdCategoria = @IdCategoria
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEspecie]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEspecie]
    @Descripcion VARCHAR(200),
	@IdEspecie BIGINT
AS
BEGIN
    UPDATE [dbo].[Especie] 
    SET [Descripcion] = COALESCE(@Descripcion, [Descripcion])
      
 WHERE IdEspecie = @IdEspecie
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMascota]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarMascota]
    @Nombre VARCHAR(200),
    @Raza VARCHAR(200) = NULL,
    @Color VARCHAR(20) = NULL,
    @Edad INT = NULL,
    @Sexo VARCHAR(1) = NULL,
    @EspecieId BIGINT,
    @UsuarioId BIGINT,
	@IdMascota BIGINT
AS
BEGIN
    UPDATE [dbo].[Mascota]
   SET [Nombre] = @Nombre
      ,[Raza] = @Raza
      ,[Color] = @Color
      ,[Edad] = @Edad
      ,[Sexo] = @Sexo
      ,[EspecieId] = @EspecieId
      ,[UsuarioId] = @UsuarioId
 WHERE IdMascota = @IdMascota
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRol]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarRol]
    @Nombre VARCHAR(200),
	@IdRol BIGINT
AS
BEGIN
    UPDATE [dbo].[Rol] 
    SET [Nombre] = COALESCE(@Nombre, [Nombre])
      
 WHERE IdRol = @IdRol
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@NombreCompleto   varchar(255),
	@Identificacion   varchar(12),
	@Correo           varchar(50),
	@Telefono         varchar(50),
	@Direccion        varchar(250),
	@Estado bit,
	@RolId bigint,
	@IdUsuario BIGINT
AS
BEGIN
	

UPDATE [dbo].[Usuario]
   SET [NombreCompleto] = @NombreCompleto
      ,[Identificacion] = @Identificacion
      ,[Correo] = @Correo
      ,[Telefono] = @Telefono
      ,[Direccion] = @Direccion
      ,[Estado] = @Estado
      ,[RolId] = @RolId
 WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategoria]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCategoria]
@Id bigint
AS
BEGIN
    SELECT [IdCategoria]
          ,[Descripcion]
          
      FROM [dbo].[Categoria]
	  WHERE IdCategoria = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategorias]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCategorias]
AS
BEGIN
    SELECT [IdCategoria]
          ,[Descripcion]
          
      FROM [dbo].[Categoria]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEspecie]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEspecie]
@Id bigint
AS
BEGIN
    SELECT [IdEspecie]
          ,[Descripcion]
          
      FROM [dbo].[Especie]
	  WHERE IdEspecie = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEspecies]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarEspecies]
AS
BEGIN
    SELECT [IdEspecie]
          ,[Descripcion]
          
      FROM [dbo].[Especie]
END
------------------
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMascota]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarMascota]
@Id bigint
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
	  WHERE IdMascota = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMascotas]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarPerfilUsuario]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ConsultarPerfilUsuario] 
@idusuario bigint
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
      ,rol.Nombre as Rol

  FROM [dbo].[Usuario] users
  inner join  Rol rol on users.RolId=rol.IdRol

  where users.IdUsuario=@idusuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRol]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarRol]
@Id bigint
AS
BEGIN
    SELECT [IdRol]
          ,[Nombre]
          
      FROM [dbo].[Rol]
	  WHERE IdRol = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarRoles]
AS
BEGIN
    SELECT [IdRol]
          ,[Nombre]
          
      FROM [dbo].[Rol]
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposEspecies]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTiposRoles]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTiposRoles]
AS
BEGIN
    SELECT IdRol 'value'
          ,Nombre 'text'
      FROM Rol
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposUsuarios]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
@Id bigint
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
	  WHERE IdUsuario = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCategoria]
@Id bigint
AS
BEGIN

DELETE FROM Categoria
      WHERE IdCategoria = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEspecie]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEspecie]
@Id bigint
AS
BEGIN

DELETE FROM Especie
      WHERE IdEspecie = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMascota]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarMascota]
@Id bigint
AS
BEGIN

DELETE FROM Mascota
      WHERE IdMascota = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarRol]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarRol]
@Id bigint
AS
BEGIN

DELETE FROM Rol
      WHERE IdRol = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
@Id bigint
AS
BEGIN

DELETE FROM Usuario
      WHERE IdUsuario = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCategoria]
    @Descripcion VARCHAR(200)  
AS
BEGIN
    INSERT INTO [dbo].[Categoria] (
        [Descripcion]
    ) VALUES (
        @Descripcion
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarEspecie]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarEspecie]
    @Descripcion VARCHAR(200)  
AS
BEGIN
    INSERT INTO [dbo].[Especie] (
        [Descripcion]
    ) VALUES (
        @Descripcion
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarMascota]    Script Date: 17/8/2024 20:30:28 ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarRol]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarRol]
    @Nombre VARCHAR(200)  
AS
BEGIN
    INSERT INTO [dbo].[Rol] (
        [Nombre]
    ) VALUES (
        @Nombre
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 17/8/2024 20:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
USE [master]
GO
ALTER DATABASE [HuellitasVet] SET  READ_WRITE 
GO
