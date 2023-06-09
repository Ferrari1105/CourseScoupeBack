USE [master]
GO
/****** Object:  Database [ProyectoCourseScope]    Script Date: 9/6/2023 11:06:01 ******/
CREATE DATABASE [ProyectoCourseScope]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoCourseScope', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProyectoCourseScope.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoCourseScope_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProyectoCourseScope_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoCourseScope] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoCourseScope].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoCourseScope] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoCourseScope] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoCourseScope] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoCourseScope] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoCourseScope] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoCourseScope] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoCourseScope] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoCourseScope] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoCourseScope] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoCourseScope] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoCourseScope] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoCourseScope', N'ON'
GO
ALTER DATABASE [ProyectoCourseScope] SET QUERY_STORE = OFF
GO
USE [ProyectoCourseScope]
GO
/****** Object:  User [alumno]    Script Date: 9/6/2023 11:06:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idAreas] [int] IDENTITY(1,1) NOT NULL,
	[NombreArea] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idAreas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelCurso] [varchar](50) NOT NULL,
	[HechoConIa] [bit] NOT NULL,
	[idLecciones] [int] NOT NULL,
	[idCategorias] [int] NOT NULL,
	[idAreas] [int] NOT NULL,
	[idEstilo] [int] NOT NULL,
	[idRecursosAdicionales] [int] NOT NULL,
	[PrecioDelCurso] [float] NOT NULL,
	[ResumenCurso] [varchar](50) NOT NULL,
	[Adelanto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos_Idioma]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos_Idioma](
	[idIdioma] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estilo](
	[idEstilo] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstilo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estilo] PRIMARY KEY CLUSTERED 
(
	[idEstilo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[idIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Idioma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[idIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leccion]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leccion](
	[idLeccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreLeccion] [varchar](50) NOT NULL,
	[ContenidoLeccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Leccion] PRIMARY KEY CLUSTERED 
(
	[idLeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[idPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[NombrePresentacion] [varchar](50) NOT NULL,
	[idSlide] [int] NOT NULL,
	[idEstilo] [int] NOT NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecursosAdicionales]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecursosAdicionales](
	[idRecursosAdicionales] [int] IDENTITY(1,1) NOT NULL,
	[NombreRecurso] [varchar](50) NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RecursosAdicionales] PRIMARY KEY CLUSTERED 
(
	[idRecursosAdicionales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[idSlide] [int] IDENTITY(1,1) NOT NULL,
	[ContenidoSlide] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[idSlide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TipoUsuario] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Cursos]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Cursos](
	[idUsuario] [int] NOT NULL,
	[idCurso] [int] NOT NULL,
	[CreadorDelCurso] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Presentacion]    Script Date: 9/6/2023 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Presentacion](
	[idUsuario] [int] NOT NULL,
	[idPresentacion] [int] NOT NULL,
	[Editor] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (1, N'3D')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (2, N'Animacion 2D')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (3, N'Arquitectura de la Informacion')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (4, N'Arquitectura Interior')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (5, N'Arte Ubano')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (6, N'Artesania')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (7, N'Album ilustrado')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (8, N'Animacion')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (9, N'Animacion 3D')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (10, N'Artes Culinarios')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (11, N'Bellas Artes')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (12, N'Boceteado')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (13, N'Business')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (14, N'Caligrafia')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (15, N'Carpinteria')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (16, N'Ceramica')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (17, N'Cine')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (18, N'Cocina')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (19, N'Concept Art')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (20, N'Creatividad')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (21, N'CSS')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (22, N'Decoracion de Interiores')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (23, N'Desarrollo de apps')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (24, N'Desarrollo de Videoujuegos')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (25, N'Desarrollo Web')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (26, N'Dibujo')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (27, N'Dibujo a lapiz')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (28, N'Dibujo Anatomico')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (29, N'Dibujo Artistico')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (30, N'Dibujo Digital')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (31, N'Diseño')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (32, N'Diseño 3D')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (33, N'Diseño de Apps')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (34, N'Diseño de Calzado')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (35, N'Diseño de Carteles')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (36, N'Diseño Digital')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (37, N'Diseño Mobil')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (38, N'Diseño Web')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (39, N'Diseño Textil')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (40, N'E-Commerce')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (41, N'Escritura')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (42, N'Escultura')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (43, N'Estampacion')
INSERT [dbo].[Area] ([idAreas], [NombreArea]) VALUES (44, N'Estrategia de marcas')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (1, N'Desarrollo Web')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (2, N'Desarrollo Movil')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (3, N'Lenguajes de programacion')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (4, N'Desarrollo de videojuegos')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (5, N'Herramientas de desarrollo de software')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (6, N'Comunicacion')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (7, N'Gestion empresarial')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (8, N'Ventas')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (9, N'Gestion de proyectos')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (10, N'Recursos Humanos')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (11, N'Contabilidad y tesoreria')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (12, N'Inversion y comercio')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (13, N'Finanzas')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (14, N'Redes y seguridad')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (15, N'Liderazgo')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (16, N'Desarrollo profesional')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (17, N'Diseño Web')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (18, N'Diseño Grafico')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (19, N'Ilustracion')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (20, N'3D y animacion')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (21, N'Diseño Arquitectonico')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (22, N'Diseño de Juegos')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (23, N'Marketing Digital')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (24, N'Relaciones Publicas')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (25, N'Creacion de marca')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (26, N'Marketing de producto')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (27, N'Relaciones Publicas')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (28, N'Arte Y Manualidades')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (29, N'Maquillaje')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (30, N'Fotografia ')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (31, N'Fotografia Comercial')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (32, N'Deportes')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (33, N'Nutricion ')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (34, N'Meditacion')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (35, N'Instrumentos')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (36, N'Produccion Musical')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (37, N'Aprendizaje de Idiomas')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idLecciones], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto]) VALUES (1, N'Curso1', 0, 1, 1, 1, 1, 1, 120, N'Resumen1', N'Adelanto1')
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
INSERT [dbo].[Cursos_Idioma] ([idIdioma], [idCurso]) VALUES (1, 1)
INSERT [dbo].[Cursos_Idioma] ([idIdioma], [idCurso]) VALUES (2, 1)
INSERT [dbo].[Cursos_Idioma] ([idIdioma], [idCurso]) VALUES (3, 1)
INSERT [dbo].[Cursos_Idioma] ([idIdioma], [idCurso]) VALUES (4, 1)
GO
SET IDENTITY_INSERT [dbo].[Estilo] ON 

INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (1, N'Aesthetic')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (2, N'Creativa')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (3, N'Minimalista')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (4, N'Simple')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (5, N'Vintage')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (6, N'Formal')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (7, N'Divertida')
INSERT [dbo].[Estilo] ([idEstilo], [NombreEstilo]) VALUES (8, N'Elegante')
SET IDENTITY_INSERT [dbo].[Estilo] OFF
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (1, N'Español')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (2, N'Ingles')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (3, N'Aleman')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (4, N'Ruso')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (5, N'Frances')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (6, N'Chino')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (7, N'Arabe Estandar')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (8, N'Portugués')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (9, N'Japonés')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (10, N'Turco')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (11, N'Italiano')
INSERT [dbo].[Idioma] ([idIdioma], [Idioma]) VALUES (12, N'Polaco')
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[Leccion] ON 

INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion]) VALUES (1, N'Leccion1', N'ContenidoLeccion1')
INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion]) VALUES (2, N'Leccion2', N'ContenidoLeccion2')
SET IDENTITY_INSERT [dbo].[Leccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentacion] ON 

INSERT [dbo].[Presentacion] ([idPresentacion], [NombrePresentacion], [idSlide], [idEstilo]) VALUES (1, N'Presentacion1', 1, 1)
SET IDENTITY_INSERT [dbo].[Presentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[RecursosAdicionales] ON 

INSERT [dbo].[RecursosAdicionales] ([idRecursosAdicionales], [NombreRecurso], [Contenido]) VALUES (1, N'RecursoAdicional1', N'Contenido1')
INSERT [dbo].[RecursosAdicionales] ([idRecursosAdicionales], [NombreRecurso], [Contenido]) VALUES (2, N'RecursoAdicional2', N'Contenido2')
SET IDENTITY_INSERT [dbo].[RecursosAdicionales] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([idSlide], [ContenidoSlide]) VALUES (1, N'Contenido1')
INSERT [dbo].[Slide] ([idSlide], [ContenidoSlide]) VALUES (2, N'Contenido2')
INSERT [dbo].[Slide] ([idSlide], [ContenidoSlide]) VALUES (3, N'Contenido3')
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [TipoUsuario]) VALUES (1, N'Usuario1', N'Contraseña1', N'Usuario1@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Cursos] ([idUsuario], [idCurso], [CreadorDelCurso]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Usuario_Presentacion] ([idUsuario], [idPresentacion], [Editor]) VALUES (1, 1, 1)
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Area] FOREIGN KEY([idAreas])
REFERENCES [dbo].[Area] ([idAreas])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Area]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Categoria] FOREIGN KEY([idCategorias])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Categoria]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Estilo] FOREIGN KEY([idEstilo])
REFERENCES [dbo].[Estilo] ([idEstilo])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Estilo]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Leccion] FOREIGN KEY([idLecciones])
REFERENCES [dbo].[Leccion] ([idLeccion])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Leccion]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_RecursosAdicionales] FOREIGN KEY([idRecursosAdicionales])
REFERENCES [dbo].[RecursosAdicionales] ([idRecursosAdicionales])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_RecursosAdicionales]
GO
ALTER TABLE [dbo].[Cursos_Idioma]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Idioma_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Cursos_Idioma] CHECK CONSTRAINT [FK_Cursos_Idioma_Cursos]
GO
ALTER TABLE [dbo].[Cursos_Idioma]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Idioma_Idioma] FOREIGN KEY([idIdioma])
REFERENCES [dbo].[Idioma] ([idIdioma])
GO
ALTER TABLE [dbo].[Cursos_Idioma] CHECK CONSTRAINT [FK_Cursos_Idioma_Idioma]
GO
ALTER TABLE [dbo].[Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_Presentacion_Estilo] FOREIGN KEY([idEstilo])
REFERENCES [dbo].[Estilo] ([idEstilo])
GO
ALTER TABLE [dbo].[Presentacion] CHECK CONSTRAINT [FK_Presentacion_Estilo]
GO
ALTER TABLE [dbo].[Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_Presentacion_Slide] FOREIGN KEY([idSlide])
REFERENCES [dbo].[Slide] ([idSlide])
GO
ALTER TABLE [dbo].[Presentacion] CHECK CONSTRAINT [FK_Presentacion_Slide]
GO
ALTER TABLE [dbo].[Usuario_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cursos_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Usuario_Cursos] CHECK CONSTRAINT [FK_Usuario_Cursos_Cursos]
GO
ALTER TABLE [dbo].[Usuario_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cursos_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario_Cursos] CHECK CONSTRAINT [FK_Usuario_Cursos_Usuario]
GO
ALTER TABLE [dbo].[Usuario_Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Presentacion_Presentacion] FOREIGN KEY([idPresentacion])
REFERENCES [dbo].[Presentacion] ([idPresentacion])
GO
ALTER TABLE [dbo].[Usuario_Presentacion] CHECK CONSTRAINT [FK_Usuario_Presentacion_Presentacion]
GO
ALTER TABLE [dbo].[Usuario_Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Presentacion_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario_Presentacion] CHECK CONSTRAINT [FK_Usuario_Presentacion_Usuario]
GO
USE [master]
GO
ALTER DATABASE [ProyectoCourseScope] SET  READ_WRITE 
GO
