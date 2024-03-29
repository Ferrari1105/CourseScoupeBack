USE [master]
GO
/****** Object:  Database [ProyectoCourseScope]    Script Date: 16/11/2023 06:20:45 ******/
CREATE DATABASE [ProyectoCourseScope]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoCourseScope', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoCourseScope.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoCourseScope_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoCourseScope_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [ProyectoCourseScope] SET QUERY_STORE = OFF
GO
USE [ProyectoCourseScope]
GO
/****** Object:  User [Reportes]    Script Date: 16/11/2023 06:20:45 ******/
CREATE USER [Reportes] FOR LOGIN [Reportes] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Reportes]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[Carrito]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[idCarrito] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idCurso] [int] NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[idCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_Curso]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Curso](
	[idCarrito] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[idColor] [int] IDENTITY(1,1) NOT NULL,
	[NombreColor] [varchar](50) NOT NULL,
	[CodigoHexadecimal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[idColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[MontoCompra] [float] NOT NULL,
	[TipoDePago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_ImagenCurso]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_ImagenCurso](
	[idCurso] [int] NULL,
	[idImagenCurso] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_RecursosAdicionales]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_RecursosAdicionales](
	[idCurso] [int] NULL,
	[idRecursosAdicionales] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelCurso] [nvarchar](max) NULL,
	[HechoConIa] [bit] NULL,
	[idCategorias] [int] NULL,
	[idAreas] [int] NULL,
	[idEstilo] [int] NULL,
	[idRecursosAdicionales] [int] NULL,
	[PrecioDelCurso] [float] NULL,
	[ResumenCurso] [text] NULL,
	[Adelanto] [text] NULL,
	[idImagenCursos] [int] NULL,
	[PortadaCurso] [nvarchar](max) NULL,
	[idCreador] [int] NULL,
	[Valoracion] [int] NULL,
	[NumeroEstudiantes] [int] NULL,
	[Terminado] [bit] NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos_Idioma]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos_Idioma](
	[idIdioma] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[idCompra_idCurso]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idCompra_idCurso](
	[idCompra] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idCompra_idUsuario]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idCompra_idUsuario](
	[idCompra] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Comprador_Vendedor] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idEstilo_idColor]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idColor](
	[idEstilo] [int] NOT NULL,
	[idColor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idEstilo_idTipografia]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idTipografia](
	[idEstilo] [int] NOT NULL,
	[idTipografia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[ImagenesCursos]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenesCursos](
	[idImagenesCursos] [int] IDENTITY(1,1) NOT NULL,
	[NombreImagen] [text] NOT NULL,
	[SrcImagen] [text] NOT NULL,
	[idLeccion] [int] NULL,
	[EsBanner] [bit] NULL,
	[EsVideo] [bit] NULL,
 CONSTRAINT [PK_ImagenesCursos] PRIMARY KEY CLUSTERED 
(
	[idImagenesCursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leccion]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leccion](
	[idLeccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreLeccion] [varchar](50) NOT NULL,
	[ContenidoLeccion] [varchar](5000) NOT NULL,
	[idCursos] [int] NULL,
 CONSTRAINT [PK_Leccion] PRIMARY KEY CLUSTERED 
(
	[idLeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[RecursosAdicionales]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[Tipografia]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipografia](
	[idTipografia] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipografia] [varchar](50) NOT NULL,
	[FontFamily] [varchar](50) NOT NULL,
	[FontSrc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipografia] PRIMARY KEY CLUSTERED 
(
	[idTipografia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/11/2023 06:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FotoDePerfil] [varchar](max) NULL,
	[Biografia] [varchar](50) NULL,
	[Ubicacion] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Cursos]    Script Date: 16/11/2023 06:20:45 ******/
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
/****** Object:  Table [dbo].[Usuario_Presentacion]    Script Date: 16/11/2023 06:20:45 ******/
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
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (38, N'arquitectura')
INSERT [dbo].[Categoria] ([idCategoria], [NombreCategoria]) VALUES (39, N'Moda')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [Terminado]) VALUES (1, N'Fotografía profesional para Instagram', 0, 30, 13, 2, 1, 12, N'Instagram se ha convertido en el escaparate virtual en el que todo el mundo quiere destacar. Mina Barrio –fotógrafa de producto de Melon Blanc, encargada de crear contenido visual para todo tipo de marcas– te enseñará, en este curso online, todos los trucos para mostrar tu proyecto en Instagram solo con tu móvil', N'Lo que Mina te enseñará en este curso va mucho más allá de hacer una foto bonita: aprenderás a comunicar tus valores, creando un estilo fotográfico personal para tu proyecto. Para ello, descubrirás cómo cuidar tanto el aspecto creativo de tus fotografías como la técnica, utilizando exclusivamente las herramientas que te brinda tu smartphone, editando tus imágenes como un gran instagrammer.', 14, N'https://crehana-blog.imgix.net/media/filer_public/41/5a/415a14f0-4073-42d0-ad39-cc15fcea6455/mejores-cursos-fotografia-online.jpg', 1, 8, 1002, 1)
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [Terminado]) VALUES (7, N'Diseño de patrones ilustrados: ilustración vectorial llamativa', 0, 18, 31, 2, 2, 19, N'Sumérgete en el mundo de la ilustración con Nick Liefhebber, un ilustrador experimentado y talentoso conocido por sus creaciones vibrantes y ligeramente psicodélicas. En este curso en línea, Nick te guiará a través del proceso de creación de ilustraciones cautivadoras e infinitamente repetibles.', N'A lo largo del curso, descubrirá cómo Nick se inspira en los elementos diversos y en constante cambio de la naturaleza para crear composiciones cálidas e intrigantes. Explorarás la combinación única de técnicas analógicas y digitales, comenzando con la creación de collages utilizando elementos de papel y luego traduciéndolos en imágenes vectoriales', 15, N'https://cdn.domestika.org/c_fill,dpr_auto,f_auto,pg_1,t_base_params/v1605798900/course-covers/000/001/492/1492-original.jpg?1605798900', 2, 7, 750, 1)
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [Terminado]) VALUES (11, N'Diseño de interiores: minimalismo y funcionalidad en los espacios habitables', 1, 38, 4, 4, 1, 0, N'Explore el arte de la planificación espacial minimalista en este curso en línea dirigido por Nicolas Bossard, un reconocido arquitecto y fundador de Nicolas Bossard Architecture. En este curso aprenderás a diseñar y crear un espacio minimalista que optimice la funcionalidad y la estética.', N'Nicolas lo guiará a través de los principios del diseño de interiores y el minimalismo, brindándole información sobre los códigos universales y atemporales de la geometría y la simetría. Descubra cómo la simplicidad y la economía de formas pueden crear espacios armoniosos que resisten el paso del tiempo', 16, N'https://i.ytimg.com/vi/yQojEZeEJB8/maxresdefault.jpg', 3, 6, 2200, 1)
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [Terminado]) VALUES (13, N'Diseño textil para moda infantil', 0, 39, 39, 8, 1, 10, N'Sumérgete en el mundo del diseño textil y de moda con Anne Stettner, la fundadora de la marca von.anne, en este curso en línea. En este viaje creativo, aprenderá a crear diseños de telas únicos para ropa infantil, incorporando adorables motivos de animales y comida. Anne lo guía en cada paso, desde el desarrollo de cautivadores bocetos de personajes hasta el diseño de patrones perfectos y listos para imprimir', N'En este curso en línea, Anne compartirá su experiencia y pasión por romper los estereotipos de género mientras crea diseños que los niños encuentran hermosos y divertidos. Al principio aprenderás los conceptos básicos de motivos, patrones y tipos de tejidos, lo que te dará una base sólida para tus creaciones', 15, N'https://i.ytimg.com/vi/nZ3brJQePRY/maxresdefault.jpg', 24, 9, 3500, 1)
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
SET IDENTITY_INSERT [dbo].[ImagenesCursos] ON 

INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen], [idLeccion], [EsBanner], [EsVideo]) VALUES (14, N'asa', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, NULL)
INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen], [idLeccion], [EsBanner], [EsVideo]) VALUES (15, N'a', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, NULL)
INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen], [idLeccion], [EsBanner], [EsVideo]) VALUES (16, N'fda', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ImagenesCursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Leccion] ON 

INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (1, N'Conceptos Básicos de Fotografía:', N'Composición: Explora los principios de composición, como la regla de los tercios, la simetría y el uso del espacio negativo para mejorar la estética de tus fotos.', 1)
INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (2, N'Equipo y Herramientas Fotográficas:', N'Cámaras y Lentes: Familiarízate con los tipos de cámaras y lentes disponibles, así como con sus características. Comprende cómo elegir el equipo adecuado para diferentes situaciones.', 1)
INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (3, N'Edición de Imágenes y Postproducción:', N'Software de Edición: Introdúcete en el uso de programas de edición de imágenes como Adobe Lightroom o Photoshop. Aprende a ajustar el contraste, la saturación, la nitidez y a corregir imperfecciones.', 1)
INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (4, N'Estilo Personal y Narrativa Visual:', N'Desarrollo de Estilo: Descubre tu propio estilo fotográfico, ya sea a través de la elección de temas, la composición distintiva o el tratamiento visual único.', 1)
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

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (1, N'Choclo', N'abcde', N'arenaalessandro156@gmail.com', N'https://marketplace.canva.com/EAEjqRGOBRY/2/0/1600w/canva-amarillo-y-negro-gamer-desgastado-imagen-de-perfil-de-twitch-Z4ptk26F498.jpg', N'PEDILAAAAAAAAAAA', N'El Chaco', N'Santiago')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (2, N'Suezii', N'12345', N'sueztobias@gmail.com', N'data:image/jpeg;base64,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', N'Debe Solicitarla ', N'La matanza ', N'Thiago
')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (3, N'Ferrari_Rocco_1105', N'abcde12345', N'roccoferrari@gmail.com', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1c7vpdNn74M0_dcx0J5oK7nVeTofVQFEPweNbAa_gHBoltdwGZwx1-NCmR-EDXD7Myco&usqp=CAU', N'La estoy pidiendo', N'C.A.B.A', N'Benjamín')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (24, N'samlucas', N'samPass123', N'samlucas@gmail.com', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR4x73K47ciJkyYmyq-_Sor2_6Jymw-y48fg&usqp=CAU', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (25, N'oliverrichards', N'oliverPass456', N'oliverrichards@gmail.com', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZExzYkNRxalDBD9Rtx2ivtebjx-h763zmjnuQ-I27Ui-P_gClwex7cxyAmv4M2Qp4jwo&usqp=CAU', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (26, N'sophieharris', N'sophiePass789', N'sophieharris@gmail.com', N'https://i.pinimg.com/550x/72/df/30/72df30b8b200848e492625ef95dd2e50.jpg', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (27, N'danielturner', N'danielPass321', N'danielturner@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (28, N'emilyclark', N'emilyPass654', N'emilyclark@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (29, N'matthewmiller', N'matthewPass987', N'matthewmiller@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (30, N'ameliascott', N'ameliaPass123', N'ameliascott@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (31, N'willowyoung', N'willowPass456', N'willowyoung@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (32, N'benjaminwhite', N'benjaminPass789', N'benjaminwhite@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (33, N'gracestewart', N'gracePass321', N'gracestewart@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (34, N'jacksonroberts', N'jacksonPass654', N'jacksonroberts@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (35, N'sophiamitchell', N'sophiaPass987', N'sophiamitchell@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (36, N'loganlee', N'loganPass123', N'loganlee@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (37, N'victoriawalker', N'victoriaPass456', N'victoriawalker@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (38, N'sebastianking', N'sebastianPass789', N'sebastianking@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (39, N'hannahwright', N'hannahPass321', N'hannahwright@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (40, N'dylanross', N'dylanPass654', N'dylanross@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (41, N'zoecampbell', N'zoePass987', N'zoecampbell@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (42, N'leonardhughes', N'leonardPass123', N'leonardhughes@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (43, N'annabennett', N'annaPass456', N'annabennett@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (44, N'lucasbrown', N'lucasPass123', N'lucasbrown@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (45, N'sophiacarter', N'sophiaPass456', N'sophiacarter@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (46, N'noahhughes', N'noahPass789', N'noahhughes@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (47, N'emilycooper', N'emilyPass321', N'emilycooper@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (48, N'jacobturner', N'jacobPass654', N'jacobturner@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (49, N'olivialopez', N'oliviaPass987', N'olivialopez@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (50, N'ethanpowell', N'ethanPass123', N'ethanpowell@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (51, N'madisonrodriguez', N'madisonPass456', N'madisonrodriguez@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (52, N'liamstewart', N'liamPass789', N'liamstewart@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (53, N'isabellamorgan', N'isabellaPass321', N'isabellamorgan@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (54, N'jaydenthompson', N'jaydenPass654', N'jaydenthompson@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (55, N'sophiebaker', N'sophiePass987', N'sophiebaker@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (56, N'aidenparker', N'aidenPass123', N'aidenparker@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (57, N'miaclark', N'miaPass456', N'miaclark@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (58, N'calebhill', N'calebPass789', N'calebhill@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (59, N'ameliawright', N'ameliaPass321', N'ameliawright@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (60, N'henrygonzalez', N'henryPass654', N'henrygonzalez@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (61, N'avasmith', N'avaPass987', N'avasmith@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (62, N'williamturner', N'williamPass123', N'williamturner@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (63, N'emilyrogers', N'emilyPass456', N'emilyrogers@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (64, N'masonmiller', N'masonPass789', N'masonmiller@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (65, N'charlotteperez', N'charlottePass321', N'charlotteperez@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (66, N'danieljames', N'danielPass654', N'danieljames@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (67, N'sofiacooper', N'sofiaPass987', N'sofiacooper@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (68, N'samuelbarnes', N'samuelPass123', N'samuelbarnes@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (69, N'emilyflores', N'emilyPass456', N'emilyflores@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (70, N'alexanderharris', N'alexanderPass789', N'alexanderharris@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (71, N'ellieclark', N'elliePass321', N'ellieclark@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (72, N'jacksonkelly', N'jacksonPass654', N'jacksonkelly@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (73, N'chloewalker', N'chloePass987', N'chloewalker@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (74, N'matthewcooper', N'matthewPass123', N'matthewcooper@gmail.com', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Cursos] ([idUsuario], [idCurso], [CreadorDelCurso]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Usuario_Presentacion] ([idUsuario], [idPresentacion], [Editor]) VALUES (1, 1, 1)
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Usuario]
GO
ALTER TABLE [dbo].[Carrito_Curso]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Curso_Carrito] FOREIGN KEY([idCarrito])
REFERENCES [dbo].[Carrito] ([idCarrito])
GO
ALTER TABLE [dbo].[Carrito_Curso] CHECK CONSTRAINT [FK_Carrito_Curso_Carrito]
GO
ALTER TABLE [dbo].[Carrito_Curso]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Curso_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Carrito_Curso] CHECK CONSTRAINT [FK_Carrito_Curso_Cursos]
GO
ALTER TABLE [dbo].[Curso_ImagenCurso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_ImagenCurso_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Curso_ImagenCurso] CHECK CONSTRAINT [FK_Curso_ImagenCurso_Cursos]
GO
ALTER TABLE [dbo].[Curso_ImagenCurso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_ImagenCurso_ImagenesCursos] FOREIGN KEY([idImagenCurso])
REFERENCES [dbo].[ImagenesCursos] ([idImagenesCursos])
GO
ALTER TABLE [dbo].[Curso_ImagenCurso] CHECK CONSTRAINT [FK_Curso_ImagenCurso_ImagenesCursos]
GO
ALTER TABLE [dbo].[Curso_RecursosAdicionales]  WITH CHECK ADD  CONSTRAINT [FK_Curso_RecursosAdicionales_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Curso_RecursosAdicionales] CHECK CONSTRAINT [FK_Curso_RecursosAdicionales_Cursos]
GO
ALTER TABLE [dbo].[Curso_RecursosAdicionales]  WITH CHECK ADD  CONSTRAINT [FK_Curso_RecursosAdicionales_RecursosAdicionales] FOREIGN KEY([idRecursosAdicionales])
REFERENCES [dbo].[RecursosAdicionales] ([idRecursosAdicionales])
GO
ALTER TABLE [dbo].[Curso_RecursosAdicionales] CHECK CONSTRAINT [FK_Curso_RecursosAdicionales_RecursosAdicionales]
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
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Usuario1] FOREIGN KEY([idCreador])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Usuario1]
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
ALTER TABLE [dbo].[idCompra_idCurso]  WITH CHECK ADD  CONSTRAINT [FK_idCompra_idCurso_Compra] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compra] ([idCompra])
GO
ALTER TABLE [dbo].[idCompra_idCurso] CHECK CONSTRAINT [FK_idCompra_idCurso_Compra]
GO
ALTER TABLE [dbo].[idCompra_idCurso]  WITH CHECK ADD  CONSTRAINT [FK_idCompra_idCurso_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[idCompra_idCurso] CHECK CONSTRAINT [FK_idCompra_idCurso_Cursos]
GO
ALTER TABLE [dbo].[idCompra_idUsuario]  WITH CHECK ADD  CONSTRAINT [FK_idCompra_idUsuario_Compra] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compra] ([idCompra])
GO
ALTER TABLE [dbo].[idCompra_idUsuario] CHECK CONSTRAINT [FK_idCompra_idUsuario_Compra]
GO
ALTER TABLE [dbo].[idCompra_idUsuario]  WITH CHECK ADD  CONSTRAINT [FK_idCompra_idUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[idCompra_idUsuario] CHECK CONSTRAINT [FK_idCompra_idUsuario_Usuario]
GO
ALTER TABLE [dbo].[idEstilo_idColor]  WITH CHECK ADD  CONSTRAINT [FK_idEstilo_idColor_Color] FOREIGN KEY([idColor])
REFERENCES [dbo].[Color] ([idColor])
GO
ALTER TABLE [dbo].[idEstilo_idColor] CHECK CONSTRAINT [FK_idEstilo_idColor_Color]
GO
ALTER TABLE [dbo].[idEstilo_idColor]  WITH CHECK ADD  CONSTRAINT [FK_idEstilo_idColor_Estilo] FOREIGN KEY([idEstilo])
REFERENCES [dbo].[Estilo] ([idEstilo])
GO
ALTER TABLE [dbo].[idEstilo_idColor] CHECK CONSTRAINT [FK_idEstilo_idColor_Estilo]
GO
ALTER TABLE [dbo].[idEstilo_idTipografia]  WITH CHECK ADD  CONSTRAINT [FK_idEstilo_idTipografia_Estilo] FOREIGN KEY([idEstilo])
REFERENCES [dbo].[Estilo] ([idEstilo])
GO
ALTER TABLE [dbo].[idEstilo_idTipografia] CHECK CONSTRAINT [FK_idEstilo_idTipografia_Estilo]
GO
ALTER TABLE [dbo].[idEstilo_idTipografia]  WITH CHECK ADD  CONSTRAINT [FK_idEstilo_idTipografia_Tipografia] FOREIGN KEY([idTipografia])
REFERENCES [dbo].[Tipografia] ([idTipografia])
GO
ALTER TABLE [dbo].[idEstilo_idTipografia] CHECK CONSTRAINT [FK_idEstilo_idTipografia_Tipografia]
GO
ALTER TABLE [dbo].[Leccion]  WITH CHECK ADD  CONSTRAINT [FK_Leccion_Cursos] FOREIGN KEY([idCursos])
REFERENCES [dbo].[Cursos] ([idCurso])
GO
ALTER TABLE [dbo].[Leccion] CHECK CONSTRAINT [FK_Leccion_Cursos]
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
