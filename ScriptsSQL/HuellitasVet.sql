
create database [HuellitasVet]
go

USE [HuellitasVet]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 7/15/2024 8:30:15 PM ******/
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
/****** Object:  Table [dbo].[Cita]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Cita_Detalle]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Especie]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Mascota]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 7/15/2024 8:30:16 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/15/2024 8:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](255) NOT NULL,
	[Identificacion] [varchar](12) unique NOT NULL,
	[Correo] [varchar](50) unique NOT NULL,
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

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'Cósmeticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Medicinas')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Juguetes')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Alimentos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (5, N'Accesorios')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Especie] ON 

INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (1, N'GATOS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (2, N'PERROS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (3, N'CONEJOS')
INSERT [dbo].[Especie] ([IdEspecie], [Descripcion]) VALUES (4, N'ROEDORES')
SET IDENTITY_INSERT [dbo].[Especie] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (2, N'CLIENTE')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 

INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (3, N'Medicina Interna', 50000, N'mi')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (4, N'Laboratorio', 20000, N'lab')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (6, N'Ultrasonido', 30000, N'ul')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (7, N'Cirugia', 20000, N'ciru')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (9, N'Limpieza Dental', 45000, N'ld')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (10, N'Grooming', 20000, N'go')
INSERT [dbo].[Servicio] ([IdServicio], [Descripcion], [Precio], [RutaImagen]) VALUES (11, N'Rayos x', 35000, N'rx')
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Identificacion], [Correo], [Telefono], [Direccion], [Contrasenna], [Estado], [RolId]) VALUES (3, N'Tifanny Camacho Monge', N'305070199', N'tcamacho70199@ufide.ac.cr', N'61046045', N'Cartago', N'5555', 1, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__D6F931E5B364F491]    Script Date: 7/15/2024 8:30:16 PM ******/
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
