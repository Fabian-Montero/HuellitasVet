USE [master]
GO
/****** Object:  Database [HuellitasVet]    Script Date: 8/25/2024 8:18:41 PM ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 8/25/2024 8:18:41 PM ******/
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
/****** Object:  Table [dbo].[Cita]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[Cita_Detalle]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[Especie]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[horarios_citas]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horarios_citas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[estado] [bit] NULL,
	[IdServicio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[IdServicio] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [float] NOT NULL,
	[RutaImagen] [varchar](200) NULL,
 CONSTRAINT [PK_SERVICIO_ID] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
	[EsTemporal] [bit] NULL,
	[VigenciaTemporal] [datetime] NULL,
 CONSTRAINT [PK_USUARIO_ID] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'Cósmeticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Medicinas')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Juguetes')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Alimentos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (5, N'Accesorios')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

INSERT [dbo].[Cita] ([IdCita], [HoraInicio], [HoraFinal], [UsuarioId], [Estado], [SubTotal], [Impuesto], [Total]) VALUES (1, CAST(N'2024-09-17T13:00:00.000' AS DateTime), CAST(N'2024-09-17T15:00:00.000' AS DateTime), 18, N'1', 20000, 800, 20800)
SET IDENTITY_INSERT [dbo].[Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[Cita_Detalle] ON 

INSERT [dbo].[Cita_Detalle] ([IdCitaDetalle], [CitaId], [MascotaId], [ServicioId], [SubTotal], [Impuesto], [Total]) VALUES (1, 1, 9, 10, 20000, 800, 20800)
SET IDENTITY_INSERT [dbo].[Cita_Detalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Especie] ON 

INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (1, N'GATOS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (2, N'PERROS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (3, N'CONEJOS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (4, N'ROEDORES')
SET IDENTITY_INSERT [dbo].[Especie] OFF
GO
SET IDENTITY_INSERT [dbo].[horarios_citas] ON 

INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (1, CAST(N'2024-08-21' AS Date), CAST(N'09:00:00' AS Time), 0, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (2, CAST(N'2024-08-21' AS Date), CAST(N'11:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (3, CAST(N'2024-08-21' AS Date), CAST(N'13:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (4, CAST(N'2024-08-21' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (5, CAST(N'2024-08-22' AS Date), CAST(N'09:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (6, CAST(N'2024-08-22' AS Date), CAST(N'11:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (7, CAST(N'2024-08-22' AS Date), CAST(N'13:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (8, CAST(N'2024-08-22' AS Date), CAST(N'15:00:00' AS Time), 0, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (9, CAST(N'2024-08-23' AS Date), CAST(N'09:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (10, CAST(N'2024-08-23' AS Date), CAST(N'11:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (11, CAST(N'2024-08-23' AS Date), CAST(N'13:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (12, CAST(N'2024-08-23' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (13, CAST(N'2024-08-24' AS Date), CAST(N'09:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (14, CAST(N'2024-08-24' AS Date), CAST(N'11:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (15, CAST(N'2024-08-24' AS Date), CAST(N'13:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (16, CAST(N'2024-08-24' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (17, CAST(N'2024-08-26' AS Date), CAST(N'09:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (18, CAST(N'2024-08-26' AS Date), CAST(N'11:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (19, CAST(N'2024-08-26' AS Date), CAST(N'13:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (20, CAST(N'2024-08-26' AS Date), CAST(N'15:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (21, CAST(N'2024-08-27' AS Date), CAST(N'09:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (22, CAST(N'2024-08-27' AS Date), CAST(N'11:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (23, CAST(N'2024-08-27' AS Date), CAST(N'13:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (24, CAST(N'2024-08-27' AS Date), CAST(N'15:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (25, CAST(N'2024-08-28' AS Date), CAST(N'09:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (26, CAST(N'2024-08-28' AS Date), CAST(N'11:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (27, CAST(N'2024-08-28' AS Date), CAST(N'13:00:00' AS Time), 0, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (28, CAST(N'2024-08-28' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (29, CAST(N'2024-08-29' AS Date), CAST(N'09:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (30, CAST(N'2024-08-29' AS Date), CAST(N'11:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (31, CAST(N'2024-08-29' AS Date), CAST(N'13:00:00' AS Time), 0, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (32, CAST(N'2024-08-29' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (33, CAST(N'2024-08-30' AS Date), CAST(N'09:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (34, CAST(N'2024-08-30' AS Date), CAST(N'11:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (35, CAST(N'2024-08-30' AS Date), CAST(N'13:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (36, CAST(N'2024-08-30' AS Date), CAST(N'15:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (37, CAST(N'2024-08-31' AS Date), CAST(N'09:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (38, CAST(N'2024-08-31' AS Date), CAST(N'11:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (39, CAST(N'2024-08-31' AS Date), CAST(N'13:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (40, CAST(N'2024-08-31' AS Date), CAST(N'15:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (41, CAST(N'2024-09-02' AS Date), CAST(N'09:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (42, CAST(N'2024-09-02' AS Date), CAST(N'11:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (43, CAST(N'2024-09-02' AS Date), CAST(N'13:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (44, CAST(N'2024-09-02' AS Date), CAST(N'15:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (45, CAST(N'2024-09-03' AS Date), CAST(N'09:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (46, CAST(N'2024-09-03' AS Date), CAST(N'11:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (47, CAST(N'2024-09-03' AS Date), CAST(N'13:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (48, CAST(N'2024-09-03' AS Date), CAST(N'15:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (49, CAST(N'2024-09-04' AS Date), CAST(N'09:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (50, CAST(N'2024-09-04' AS Date), CAST(N'11:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (51, CAST(N'2024-09-04' AS Date), CAST(N'13:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (52, CAST(N'2024-09-04' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (53, CAST(N'2024-09-05' AS Date), CAST(N'09:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (54, CAST(N'2024-09-05' AS Date), CAST(N'11:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (55, CAST(N'2024-09-05' AS Date), CAST(N'13:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (56, CAST(N'2024-09-05' AS Date), CAST(N'15:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (57, CAST(N'2024-09-06' AS Date), CAST(N'09:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (58, CAST(N'2024-09-06' AS Date), CAST(N'11:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (59, CAST(N'2024-09-06' AS Date), CAST(N'13:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (60, CAST(N'2024-09-06' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (61, CAST(N'2024-09-07' AS Date), CAST(N'09:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (62, CAST(N'2024-09-07' AS Date), CAST(N'11:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (63, CAST(N'2024-09-07' AS Date), CAST(N'13:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (64, CAST(N'2024-09-07' AS Date), CAST(N'15:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (65, CAST(N'2024-09-09' AS Date), CAST(N'09:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (66, CAST(N'2024-09-09' AS Date), CAST(N'11:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (67, CAST(N'2024-09-09' AS Date), CAST(N'13:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (68, CAST(N'2024-09-09' AS Date), CAST(N'15:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (69, CAST(N'2024-09-10' AS Date), CAST(N'09:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (70, CAST(N'2024-09-10' AS Date), CAST(N'11:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (71, CAST(N'2024-09-10' AS Date), CAST(N'13:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (72, CAST(N'2024-09-10' AS Date), CAST(N'15:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (73, CAST(N'2024-09-11' AS Date), CAST(N'09:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (74, CAST(N'2024-09-11' AS Date), CAST(N'11:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (75, CAST(N'2024-09-11' AS Date), CAST(N'13:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (76, CAST(N'2024-09-11' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (77, CAST(N'2024-09-12' AS Date), CAST(N'09:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (78, CAST(N'2024-09-12' AS Date), CAST(N'11:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (79, CAST(N'2024-09-12' AS Date), CAST(N'13:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (80, CAST(N'2024-09-12' AS Date), CAST(N'15:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (81, CAST(N'2024-09-13' AS Date), CAST(N'09:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (82, CAST(N'2024-09-13' AS Date), CAST(N'11:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (83, CAST(N'2024-09-13' AS Date), CAST(N'13:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (84, CAST(N'2024-09-13' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (85, CAST(N'2024-09-14' AS Date), CAST(N'09:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (86, CAST(N'2024-09-14' AS Date), CAST(N'11:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (87, CAST(N'2024-09-14' AS Date), CAST(N'13:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (88, CAST(N'2024-09-14' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (89, CAST(N'2024-09-16' AS Date), CAST(N'09:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (90, CAST(N'2024-09-16' AS Date), CAST(N'11:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (91, CAST(N'2024-09-16' AS Date), CAST(N'13:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (92, CAST(N'2024-09-16' AS Date), CAST(N'15:00:00' AS Time), 1, 6)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (93, CAST(N'2024-09-17' AS Date), CAST(N'09:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (94, CAST(N'2024-09-17' AS Date), CAST(N'11:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (95, CAST(N'2024-09-17' AS Date), CAST(N'13:00:00' AS Time), 0, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (96, CAST(N'2024-09-17' AS Date), CAST(N'15:00:00' AS Time), 1, 10)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (97, CAST(N'2024-09-18' AS Date), CAST(N'09:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (98, CAST(N'2024-09-18' AS Date), CAST(N'11:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (99, CAST(N'2024-09-18' AS Date), CAST(N'13:00:00' AS Time), 1, 7)
GO
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (100, CAST(N'2024-09-18' AS Date), CAST(N'15:00:00' AS Time), 1, 7)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (101, CAST(N'2024-09-19' AS Date), CAST(N'09:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (102, CAST(N'2024-09-19' AS Date), CAST(N'11:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (103, CAST(N'2024-09-19' AS Date), CAST(N'13:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (104, CAST(N'2024-09-19' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (105, CAST(N'2024-09-20' AS Date), CAST(N'09:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (106, CAST(N'2024-09-20' AS Date), CAST(N'11:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (107, CAST(N'2024-09-20' AS Date), CAST(N'13:00:00' AS Time), 1, 9)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (108, CAST(N'2024-09-20' AS Date), CAST(N'15:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (109, CAST(N'2024-09-21' AS Date), CAST(N'09:00:00' AS Time), 1, 3)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (110, CAST(N'2024-09-21' AS Date), CAST(N'11:00:00' AS Time), 1, 4)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (111, CAST(N'2024-09-21' AS Date), CAST(N'13:00:00' AS Time), 1, 11)
INSERT [dbo].[horarios_citas] ([id], [fecha], [hora], [estado], [IdServicio]) VALUES (112, CAST(N'2024-09-21' AS Date), CAST(N'15:00:00' AS Time), 1, 4)
SET IDENTITY_INSERT [dbo].[horarios_citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Mascota] ON 

INSERT [dbo].[Mascota] ([IdMascota], [Nombre], [Raza], [Color], [Edad], [Sexo], [EspecieId], [UsuarioId]) VALUES (9, N'Chanel', N'Shitzu', N'Beige', 1, N'F', 2, 18)
SET IDENTITY_INSERT [dbo].[Mascota] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (2, N'CLIENTE')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (3, N'Medicina Interna', 50000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F3?alt=media&token=70d1585f-ea04-4518-8d44-ba8a57497925')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (4, N'Laboratorio', 20000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F4?alt=media&token=4ec6d5bc-a876-41b7-888f-c7a5e9d8a90e')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (6, N'Ultrasonido', 30000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F6?alt=media&token=9b06b84b-aec0-499d-8e86-9ac015496342')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (7, N'Cirugia', 8585, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F7?alt=media&token=057ec246-1195-4338-b529-be88f093d3f2')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (9, N'Limpieza Dental', 60000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F9?alt=media&token=8404b6a1-7b42-47b4-a0de-43d1d1a0caec')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (10, N'Grooming', 20000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F10?alt=media&token=f3ba4627-6437-4861-be99-c7d410163fb5')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (11, N'Rayos x', 35000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F11?alt=media&token=be5e83a2-8dcc-4e90-bf95-34716c2d0868')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (44, N'Cirugia menor', 60000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F44?alt=media&token=ec9d41fa-c1ad-4174-8659-ae11962c5994')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (48, N'Prueba edit', 5000, N'https://firebasestorage.googleapis.com/v0/b/huellitasvet.appspot.com/o/servicio%2F48?alt=media&token=1977c515-997f-4e63-b7ae-f5442252356a')
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (3, N'Tifanny Camacho Monge', N'305070199', N'tcamacho70199@ufide.ac.cr', N'61046045', N'Cartago', N'5555', 1, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (4, N'Frank Garay', N'116510000', N'frank@gmail.com', N'61344003', N'Heredia, San Francisco, 40103', N'xN4niZSZlNp8', 1, 2, 1, CAST(N'2024-08-21T22:21:27.840' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (12, N'Fabian Montero Madrigal', N'118560019', N'fabianja0477@gmail.com', N'84955721', N'San José Vázquez de coronado', N'h7njfGopwZVF', 1, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (13, N'Melissa Vargas Gómez', N'402510174', N'mv213845@gmail.com', N'87963587', N'Heredia, Mercedes Norte', N'h7njfGopwZVF', 1, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (17, N'Joseph', N'116510847', N'moralesjoseph11@gmail.com', N'61344003', N'Heredia', N'KhJMruK4XaKj', 1, 2, 0, CAST(N'2024-08-22T03:36:12.600' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId], [EsTemporal], [VigenciaTemporal]) VALUES (18, N'Tifanny Camacho', N'3050744', N'tifas@gmail.com', N'61046045', N'll', N'rjJcRFfcJXUS', 1, 2, 0, CAST(N'2024-08-25T18:20:59.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__D6F931E5238A64C3]    Script Date: 8/25/2024 8:18:42 PM ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[horarios_citas] ADD  DEFAULT ((1)) FOR [estado]
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
/****** Object:  StoredProcedure [dbo].[ActualizarCategoria]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ActualizarContrasenna]
@IdUsuario bigint,
@Contrasenna VARCHAR(12),
@EsTemporal BIT,
@VigenciaTemporal DATETIME


AS
BEGIN
    UPDATE [dbo].[Usuario]
   SET 
      [Contrasenna] = @Contrasenna,
      [EsTemporal] = @EsTemporal,
      [VigenciaTemporal] = @VigenciaTemporal
 WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEspecie]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarMascota]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarRol]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarRutaImagen]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarRutaImagen]
    @IdServicio BIGINT ,
	@RutaImagen VARCHAR(200)
AS
BEGIN
UPDATE Servicio
   SET 
      RutaImagen = @RutaImagen
 WHERE IdServicio = @IdServicio

END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarServicio]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarServicio]
@IdServicio BIGINT,
@Descripcion VARCHAR(200),
@Precio float
AS
BEGIN
    
UPDATE Servicio
   SET [Descripcion] = @Descripcion
      ,[Precio] = @Precio
 WHERE IdServicio = @IdServicio

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCategoria]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCategorias]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarEspecie]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarEspecies]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarMascota]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarMascotas]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarPerfilUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarRol]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarServicio]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarServicio]
@Id BIGINT
AS

BEGIN
    SELECT *
  FROM Servicio where IdServicio = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarServicios]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarServicios]
AS
BEGIN
    SELECT *
  FROM Servicio
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposEspecies]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTiposRoles]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTiposUsuarios]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioIdentificacion]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ConsultarUsuarioIdentificacion]
@Identificacion INT
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
	  WHERE Identificacion = @Identificacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Correo_ConfirmacionCita]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Correo_ConfirmacionCita] 
@idCita bigint
as begin

declare @Fecha varchar(50)
declare @Cliente varchar(100)
declare @Mascota varchar(100)
declare @Servicio varchar(100)
declare @Fecha_Cita varchar(100)
declare @Hora varchar(100)
declare @Impuesto   varchar(100)
declare @SubTotal  varchar(100)
declare @Total varchar(100)
declare @Mensaje varchar(MAX)
declare @correo varchar(MAX)


set @Fecha=(SELECT FORMAT(GETDATE(), 'dddd dd \de MMMM yyyy', 'es-ES'))
set @Cliente=(select NombreCompleto from  DetalleCitas where IdCita=@idCita)
set @Mascota=(select Mascota from  DetalleCitas where IdCita=@idCita)
set @Servicio=(select Servicio from  DetalleCitas where IdCita=@idCita)
set @Fecha_Cita=(select FechaCita from  DetalleCitas where IdCita=@idCita)
set @Hora=(select Hora from  DetalleCitas where IdCita=@idCita)
set @Impuesto=(select Impuesto from  DetalleCitas where IdCita=@idCita)
set @SubTotal=(select SubTotal from  DetalleCitas where IdCita=@idCita)
set @Total=(select Total from  DetalleCitas where IdCita=@idCita)
SET @Correo=(select correo from  DetalleCitas where IdCita=@idCita)


set @Mensaje='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" lang="es">
 <head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta name="x-apple-disable-message-reformatting">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="telephone=no" name="format-detection">
  <title>Nueva plantilla de correo electr%C3%B3nico 2024-08-25</title><!--[if (mso 16)]>
    <style type="text/css">
    a {text-decoration: none;}
    </style>
    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>
<noscript>
         <xml>
           <o:OfficeDocumentSettings>
           <o:AllowPNG></o:AllowPNG>
           <o:PixelsPerInch>96</o:PixelsPerInch>
           </o:OfficeDocumentSettings>
         </xml>
      </noscript>
<![endif]--><!--[if !mso]><!---->
  <link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet"><!--<![endif]--><!--[if mso]>
 <style type="text/css">
   ul {
  margin: 0 !important;
}
ol {
  margin: 0 !important;
}
li {
  margin-left: 47px !important;
}
 </style><![endif]
-->
  <style type="text/css">
.rollover:hover .rollover-first {
  max-height:0px!important;
  display:none!important;
}
.rollover:hover .rollover-second {
  max-height:none!important;
  display:block!important;
}
.rollover span {
  font-size:0px;
}
u + .body img ~ div div {
  display:none;
}
#outlook a {
  padding:0;
}
span.MsoHyperlink,
span.MsoHyperlinkFollowed {
  color:inherit;
  mso-style-priority:99;
}
a.es-button {
  mso-style-priority:100!important;
  text-decoration:none!important;
}
a[x-apple-data-detectors],
#MessageViewBody a {
  color:inherit!important;
  text-decoration:none!important;
  font-size:inherit!important;
  font-family:inherit!important;
  font-weight:inherit!important;
  line-height:inherit!important;
}
.es-desk-hidden {
  display:none;
  float:left;
  overflow:hidden;
  width:0;
  max-height:0;
  line-height:0;
  mso-hide:all;
}
@media only screen and (max-width:600px) {.es-m-p0r { padding-right:0px!important } .es-m-p20b { padding-bottom:20px!important } .es-m-p40r { padding-right:40px!important } .es-p-default { } *[class="gmail-fix"] { display:none!important } p, a { line-height:150%!important } h1, h1 a { line-height:120%!important } h2, h2 a { line-height:120%!important } h3, h3 a { line-height:120%!important } h4, h4 a { line-height:120%!important } h5, h5 a { line-height:120%!important } h6, h6 a { line-height:120%!important } .es-header-body p { } .es-content-body p { } .es-footer-body p { } .es-infoblock p { } h1 { font-size:30px!important; text-align:left } h2 { font-size:24px!important; text-align:left } h3 { font-size:20px!important; text-align:left } h4 { font-size:24px!important; text-align:left } h5 { font-size:20px!important; text-align:left } h6 { font-size:16px!important; text-align:left } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important } .es-header-body h4 a, .es-content-body h4 a, .es-footer-body h4 a { font-size:24px!important } .es-header-body h5 a, .es-content-body h5 a, .es-footer-body h5 a { font-size:20px!important } .es-header-body h6 a, .es-content-body h6 a, .es-footer-body h6 a { font-size:16px!important } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body a { font-size:14px!important } .es-content-body p, .es-content-body a { font-size:14px!important } .es-footer-body p, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock a { font-size:12px!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3, .es-m-txt-c h4, .es-m-txt-c h5, .es-m-txt-c h6 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3, .es-m-txt-r h4, .es-m-txt-r h5, .es-m-txt-r h6 { text-align:right!important } .es-m-txt-j, .es-m-txt-j h1, .es-m-txt-j h2, .es-m-txt-j h3, .es-m-txt-j h4, .es-m-txt-j h5, .es-m-txt-j h6 { text-align:justify!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3, .es-m-txt-l h4, .es-m-txt-l h5, .es-m-txt-l h6 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-m-txt-r .rollover:hover .rollover-second, .es-m-txt-c .rollover:hover .rollover-second, .es-m-txt-l .rollover:hover .rollover-second { display:inline!important } .es-m-txt-r .rollover span, .es-m-txt-c .rollover span, .es-m-txt-l .rollover span { line-height:0!important; font-size:0!important; display:block } .es-spacer { display:inline-table } a.es-button, button.es-button { font-size:18px!important; padding:10px 20px 10px 20px!important; line-height:120%!important } a.es-button, button.es-button, .es-button-border { display:inline-block!important } .es-m-fw, .es-m-fw.es-fw, .es-m-fw .es-button { display:block!important } .es-m-il, .es-m-il .es-button, .es-social, .es-social td, .es-menu { display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .adapt-img { width:100%!important; height:auto!important } .es-mobile-hidden, .es-hidden { display:none!important } .es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } .h-auto { height:auto!important } }
@media screen and (max-width:384px) {.mail-message-content { width:414px!important } }
</style>
 </head>
 <body class="body" style="width:100%;height:100%;padding:0;Margin:0">
  <div dir="ltr" class="es-wrapper-color" lang="es" style="background-color:#F6F6F6"><!--[if gte mso 9]>
			<v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">
				<v:fill type="tile" color="#f6f6f6"></v:fill>
			</v:background>
		<![endif]-->
   <table width="100%" cellspacing="0" cellpadding="0" class="es-wrapper" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#F6F6F6">
     <tr>
      <td valign="top" style="padding:0;Margin:0">
       <table cellspacing="0" cellpadding="0" align="center" class="es-header" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important;background-color:transparent;background-repeat:repeat;background-position:center top">
         <tr>
          <td align="center" style="padding:0;Margin:0">
           <table cellspacing="0" cellpadding="0" bgcolor="#D4D9FA" align="center" class="es-header-body" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#d4d9fa;width:600px" role="none">
             <tr>
              <td align="left" style="Margin:0;padding-top:35px;padding-right:20px;padding-bottom:30px;padding-left:20px"><!--[if mso]><table style="width:560px" cellpadding="0"
                            cellspacing="0"><tr><td style="width:324px" valign="top"><![endif]-->
               <table cellspacing="0" cellpadding="0" align="left" class="es-left" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left">
                 <tr>
                  <td valign="top" align="center" class="es-m-p0r es-m-p20b" style="padding:0;Margin:0;width:324px">
                   <table width="100%" cellspacing="0" cellpadding="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;font-size:0"><img width="324" src="https://eotpprp.stripocdn.email/content/guids/CABINET_01733169e9ea9aa162b7fb011710e9226f4d90a3929303a9a44018c1829d9f88/images/huellitas_logo_sinfondo.png" alt="" class="adapt-img" style="display:block;font-size:14px;border:0;outline:none;text-decoration:none"></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td><td style="width:20px"></td><td style="width:216px" valign="top"><![endif]-->
               <table cellspacing="0" cellpadding="0" align="right" class="es-right" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right">
                 <tr>
                  <td align="left" style="padding:0;Margin:0;width:216px">
                   <table width="100%" cellspacing="0" cellpadding="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="right" class="es-m-txt-l" style="padding:0;Margin:0"><h2 style="Margin:0;font-family:Jost, Arial, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:24px;font-style:normal;font-weight:normal;line-height:29px;color:#020202">Confirmaci�n Cita</h2></td>
                     </tr>
                     <tr>
                      <td align="right" class="es-m-txt-l" style="padding:0;Margin:0;padding-top:5px"><p style="Margin:0;mso-line-height-rule:exactly;font-family:Jost, Arial, sans-serif;line-height:21px;letter-spacing:0;color:#020202;font-size:14px"> <p>' + @Fecha + '</p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td></tr></table><![endif]--></td>
             </tr>
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;padding-top:5px;padding-bottom:5px;font-size:0">
                       <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                         <tr>
                          <td style="padding:0;Margin:0;border-bottom:1px solid #3a0bc7;background:unset;height:1px;width:100%;margin:0px"></td>
                         </tr>
                       </table></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <table cellspacing="0" cellpadding="0" align="center" class="es-content" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important">
       </table>
       <table cellpadding="0" cellspacing="0" align="center" class="es-content" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important">
         <tr>
          <td align="center" style="padding:0;Margin:0">
           <table bgcolor="#fffdf7" align="center" cellpadding="0" cellspacing="0" class="es-content-body" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFDF7;width:600px">
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px;padding-top:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="left" style="padding:0;Margin:0"><h2 style="Margin:0;font-family:Jost, Arial, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:24px;font-style:normal;font-weight:normal;line-height:29px;color:#020202">Informaci�n de Servicio</h2></td>
                     </tr>
                     <tr>
                      <td align="left" style="padding:0;Margin:0;padding-top:10px;padding-bottom:10px">
                       <ul style="font-family:Jost, Arial, sans-serif;padding:0px 0px 0px 40px;margin:15px 0px">
                        <li><strong>Cliente:</strong> ' + ISNULL(@Cliente, '') + '</li>
                        <li><strong>Mascota:</strong> ' + ISNULL(@Mascota, '') + '</li>
                        <li><strong>Servicio:</strong> ' + ISNULL(@Servicio, '') + '</li>
                        <li><strong>Fecha:</strong> ' + ISNULL(@Fecha_Cita, '') + '</li>
                        <li><strong>Hora:</strong> ' + ISNULL(@Hora, '') + '</li>
                       </ul></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;padding-top:5px;padding-bottom:5px;font-size:0">
                       <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                         <tr>
                          <td style="padding:0;Margin:0;border-bottom:1px solid #d4d9fa;background:unset;height:1px;width:100%;margin:0px"></td>
                         </tr>
                       </table></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px;padding-top:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="left" style="padding:0;Margin:0"><h2 style="Margin:0;font-family:Jost, Arial, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:24px;font-style:normal;font-weight:normal;line-height:29px;color:#020202">Datos del Servicio</h2></td>
                     </tr>
                     <tr>
                      <td align="left" style="padding:0;Margin:0;padding-top:10px;padding-bottom:10px">
                       <ul style="font-family:Jost, Arial, sans-serif;padding:0px 0px 0px 40px;margin:15px 0px">
                       
						   <li><strong>SubTotal:</strong> ' + ISNULL(@SubTotal, '') + '</li>
						   <li><strong>Impuesto:</strong> ' + ISNULL(@Impuesto, '') + '</li>
						   <li><strong>Total:</strong> ' + ISNULL(@Total, '') + '</li>
						
                       </ul></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;padding-top:5px;padding-bottom:5px;font-size:0">
                       <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                         <tr>
                          <td style="padding:0;Margin:0;border-bottom:1px solid #d4d9fa;background:unset;height:1px;width:100%;margin:0px"></td>
                         </tr>
                       </table></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="padding:20px;Margin:0">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td valign="top" align="center" style="padding:0;Margin:0;width:560px">
                   <table cellspacing="0" width="100%" cellpadding="0" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;display:none"></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="padding:0;Margin:0;padding-right:20px;padding-left:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;padding-top:5px;padding-bottom:5px;font-size:0">
                       <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                         <tr>
                          <td style="padding:0;Margin:0;border-bottom:1px solid #d4d9fa;background:unset;height:1px;width:100%;margin:0px"></td>
                         </tr>
                       </table></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align="left" style="Margin:0;padding-right:20px;padding-bottom:30px;padding-left:20px;padding-top:20px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="center" valign="top" style="padding:0;Margin:0;width:560px">
                   <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;display:none"></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <table cellpadding="0" cellspacing="0" align="center" class="es-footer" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important;background-color:transparent;background-repeat:repeat;background-position:center top">
         <tr>
          <td align="center" style="padding:0;Margin:0">
           <table cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" class="es-footer-body" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#3A0BC7;width:600px">
             <tr>
              <td align="left" style="Margin:0;padding-right:20px;padding-bottom:30px;padding-left:20px;padding-top:30px">
               <table cellpadding="0" cellspacing="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="left" style="padding:0;Margin:0;width:560px">
                   <table width="100%" cellpadding="0" cellspacing="0" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" style="padding:0;Margin:0;display:none"></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <table cellspacing="0" cellpadding="0" align="center" class="es-footer" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important;background-color:transparent;background-repeat:repeat;background-position:center top">
         <tr>
          <td align="center" style="padding:0;Margin:0">
           <table cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" class="es-footer-body" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#3A0BC7;width:600px">
             <tr>
              <td align="left" style="Margin:0;padding-right:20px;padding-left:20px;padding-bottom:20px;padding-top:20px">
               <table cellspacing="0" cellpadding="0" width="100%" role="none" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tr>
                  <td align="left" style="padding:0;Margin:0;width:560px">
                   <table width="100%" cellspacing="0" cellpadding="0" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tr>
                      <td align="center" class="es-infoblock made_with" style="padding:0;Margin:0;font-size:0"><a target="_blank" href="https://viewstripo.email/?utm_source=templates&utm_medium=email&utm_campaign=translator_email_1&utm_content=invoice_for_translation_services" style="mso-line-height-rule:exactly;text-decoration:underline;color:#CCCCCC;font-size:12px"><img src="https://eotpprp.stripocdn.email/content/guids/CABINET_09023af45624943febfa123c229a060b/images/7911561025989373.png" alt="" width="125" style="display:block;font-size:14px;border:0;outline:none;text-decoration:none"></a></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table></td>
     </tr>
   </table>
  </div>
 </body>
</html>'



IF @Correo <> ''
			BEGIN
				EXEC msdb.dbo.sp_send_dbmail
					@profile_name = 'EnvioMail',
					@recipients =  @correo,
					@subject = 'Confirmaci�n Cita',
					@body =  @Mensaje,
					@body_format = 'HTML';
			END

			
			select @Mensaje
		select	 @Fecha
select @Cliente
select @Mascota
select @Servicio
select @Fecha_Cita

select @Impuesto
select @SubTotal
select @Total
Select @Correo

end


CREATE TABLE [dbo].[horarios_citas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[estado] [bit] NULL,
	[IdServicio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarEspecie]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarMascota]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarRol]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarServicio]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarServicio]
@Id bigint
AS
BEGIN

DELETE FROM Servicio
      WHERE IdServicio = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo			varchar(50),
	@Contrasenna	varchar(12)

AS
BEGIN
	SELECT IdUsuario, Identificacion, NombreCompleto, Correo, U.RolId, Estado, R.Nombre,EsTemporal, VigenciaTemporal
	FROM dbo.Usuario U
	INNER JOIN dbo.Rol R ON U.RolId = R.IdRol
	WHERE	Correo = @Correo
	AND		Contrasenna = @Contrasenna
	AND		Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHorariosDisponibles]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ObtenerHorariosDisponibles] 
  @Id_Servicio BIGINT,
  @Fecha DATE
AS
BEGIN
   
    
    
    
    SELECT  id as idhorario ,fecha, hora 
    FROM horarios_citas
    WHERE estado = 1
      AND IdServicio = @Id_Servicio
      AND fecha = @Fecha
    ORDER BY hora;  -- Ordenar por hora

    
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerMascotasUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ObtenerMascotasUsuario]
 @UsuarioId bigint
 as begin

 select IdMascota , Nombre+'-'+ Raza  AS Mascotas  from  Mascota

 WHERE UsuarioId=@UsuarioId

 
 end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerServicios]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create proc [dbo].[ObtenerServicios]
  as begin


  select IdServicio, Descripcion from Servicio 

  END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarCita]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create PROCEDURE [dbo].[RegistrarCita]
  @idhorario BIGINT,
  @IdServicio BIGINT,
  @IdUsuario BIGINT,
  @IdMascota BIGINT
AS
BEGIN
 
  DECLARE @horainicio DATETIME;
  DECLARE @horafinal DATETIME;
  DECLARE @subtotal DECIMAL(18, 2);
  DECLARE @impuesto DECIMAL(18, 2);
  DECLARE @total DECIMAL(18, 2);
  DECLARE @citaId BIGINT;

  
  BEGIN TRANSACTION;

  BEGIN TRY
    
    SET @horainicio = (SELECT CAST(fecha AS DATETIME) + CAST(hora AS DATETIME) FROM horarios_citas WHERE id = @idhorario);

    
    SET @horafinal = DATEADD(HOUR, 2, @horainicio);

    
    SET @subtotal = (SELECT Precio FROM Servicio WHERE IdServicio = @IdServicio);

   
    SET @impuesto = @subtotal * 0.04;

   
    SET @total = @subtotal + @impuesto;

  
    INSERT INTO [dbo].[Cita](HoraInicio, HoraFinal, UsuarioId, Estado, SubTotal, Impuesto, Total)
    VALUES (@horainicio, @horafinal, @IdUsuario, 1, @subtotal, @impuesto, @total);

  
    SET @citaId = SCOPE_IDENTITY();

   
    INSERT INTO Cita_Detalle(CitaId, MascotaId, ServicioId, SubTotal, Impuesto, Total)
    VALUES (@citaId, @IdMascota, @IdServicio, @subtotal, @impuesto, @total);

	update horarios_citas set estado=0 where id=@idhorario

	--exec  Correo_ConfirmacionCita @citaId 

    
    COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    
    ROLLBACK TRANSACTION;

   
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

  
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[RegistrarEspecie]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarMascota]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarRol]    Script Date: 8/25/2024 8:18:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarServicio]    Script Date: 8/25/2024 8:18:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarServicio]
    @Descripcion VARCHAR(200) ,
	@Precio float
AS
BEGIN
    INSERT INTO Servicio(
        Descripcion,
		Precio
    ) VALUES (
        @Descripcion, @Precio
    );
		SELECT CONVERT(BIGINT,@@IDENTITY) IdServicio
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 8/25/2024 8:18:42 PM ******/
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
            @Estado BIT    = 1,
			@Temporal BIT  = 0
	
	IF NOT EXISTS(SELECT 1 FROM dbo.Usuario WHERE Correo = @Correo OR Identificacion = @Identificacion)
	BEGIN
		INSERT INTO dbo.Usuario(NombreCompleto, Identificacion, Correo, Telefono, Direccion, Contrasenna, RolId, Estado, EsTemporal, VigenciaTemporal)
		VALUES(@NombreCompleto, @Identificacion, @Correo, @Telefono, @Direccion, @Contrasenna, @Rol, @Estado, @Temporal, GETDATE())
	END
END
GO
USE [master]
GO
ALTER DATABASE [HuellitasVet] SET  READ_WRITE 
GO
