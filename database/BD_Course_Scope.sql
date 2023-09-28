
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
/****** Object:  User [Reportes]    Script Date: 21/9/2023 07:43:49 ******/
CREATE USER [Reportes] FOR LOGIN [Reportes] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Reportes]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Reportes]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 21/9/2023 07:43:49 ******/
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_RecursosAdicionales](
	[idCurso] [int] NULL,
	[idRecursosAdicionales] [int] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_ImagenCurso](
	[idCurso] [int] NULL,
	[idImagenCurso] [int] NULL,
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Cursos]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[idCurso] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelCurso] [text] NULL,
	[HechoConIa] [bit] NULL,
	[idCategorias] [int] NULL,
	[idAreas] [int] NULL,
	[idEstilo] [int] NULL,
	[idRecursosAdicionales] [int] NULL,
	[PrecioDelCurso] [float] NULL,
	[ResumenCurso] [text] NULL,
	[Adelanto] [text] NULL,
	[idImagenCursos] [int] NULL,
	[PortadaCurso] [varchar](200) NULL,
	[idCreador] [int] NULL,
	[Valoracion] [int] NULL,
	[NumeroEstudiantes] [int] NULL,
	[NivelCurso] [varchar](50) NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos_Idioma]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos_Idioma](
	[idIdioma] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Carrito]    Script Date: 27/9/2023 07:16:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[idCarrito] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idCurso] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_Curso]    Script Date: 27/9/2023 07:16:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Curso](
	[idCarrito] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[idCompra_idCurso]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idCompra_idCurso](
	[idCompra] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idCompra_idUsuario]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[idEstilo_idColor]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idColor](
	[idEstilo] [int] NOT NULL,
	[idColor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idEstilo_idTipografia]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idTipografia](
	[idEstilo] [int] NOT NULL,
	[idTipografia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[ImagenesCursos]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenesCursos](
	[idImagenesCursos] [int] IDENTITY(1,1) NOT NULL,
	[NombreImagen] [text] NOT NULL,
	[SrcImagen] [text] NOT NULL,
	[idLeccion][int] NULL
 CONSTRAINT [PK_ImagenesCursos] PRIMARY KEY CLUSTERED 
(
	[idImagenesCursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leccion]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leccion](
	[idLeccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreLeccion] [varchar](50) NOT NULL,
	[ContenidoLeccion] [varchar](50) NOT NULL,
	[idCursos] [int] NULL,
 CONSTRAINT [PK_Leccion] PRIMARY KEY CLUSTERED 
(
	[idLeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[RecursosAdicionales]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Tipografia]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/9/2023 07:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FotoDePerfil] [varchar](200) NULL,
	[Biografia] [varchar](50) NULL,
	[Ubicacion] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Cursos]    Script Date: 21/9/2023 07:43:49 ******/
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
/****** Object:  Table [dbo].[Usuario_Presentacion]    Script Date: 21/9/2023 07:43:49 ******/
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

INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [NivelCurso]) VALUES (1, N'Fotografía profesional para Instagram', 0, 30, 13, 2, 1, 12, N'Instagram se ha convertido en el escaparate virtual en el que todo el mundo quiere destacar. Mina Barrio –fotógrafa de producto de Melon Blanc, encargada de crear contenido visual para todo tipo de marcas– te enseñará, en este curso online, todos los trucos para mostrar tu proyecto en Instagram solo con tu móvil', N'Lo que Mina te enseñará en este curso va mucho más allá de hacer una foto bonita: aprenderás a comunicar tus valores, creando un estilo fotográfico personal para tu proyecto. Para ello, descubrirás cómo cuidar tanto el aspecto creativo de tus fotografías como la técnica, utilizando exclusivamente las herramientas que te brinda tu smartphone, editando tus imágenes como un gran instagrammer.', 14, N'https://crehana-blog.imgix.net/media/filer_public/41/5a/415a14f0-4073-42d0-ad39-cc15fcea6455/mejores-cursos-fotografia-online.jpg', NULL, 8, 1002, N'Inicial')
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [NivelCurso]) VALUES (7, N'Diseño de patrones ilustrados: ilustración vectorial llamativa', 0, 18, 31, 2, 2, 19, N'Sumérgete en el mundo de la ilustración con Nick Liefhebber, un ilustrador experimentado y talentoso conocido por sus creaciones vibrantes y ligeramente psicodélicas. En este curso en línea, Nick te guiará a través del proceso de creación de ilustraciones cautivadoras e infinitamente repetibles.', N'A lo largo del curso, descubrirá cómo Nick se inspira en los elementos diversos y en constante cambio de la naturaleza para crear composiciones cálidas e intrigantes. Explorarás la combinación única de técnicas analógicas y digitales, comenzando con la creación de collages utilizando elementos de papel y luego traduciéndolos en imágenes vectoriales', 15, N'https://cdn.domestika.org/c_fill,dpr_auto,f_auto,pg_1,t_base_params/v1605798900/course-covers/000/001/492/1492-original.jpg?1605798900', NULL, 7, 750, N'Inicial')
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [NivelCurso]) VALUES (11, N'Diseño de interiores: minimalismo y funcionalidad en los espacios habitables', 1, 38, 4, 4, 1, 0, N'Explore el arte de la planificación espacial minimalista en este curso en línea dirigido por Nicolas Bossard, un reconocido arquitecto y fundador de Nicolas Bossard Architecture. En este curso aprenderás a diseñar y crear un espacio minimalista que optimice la funcionalidad y la estética.', N'Nicolas lo guiará a través de los principios del diseño de interiores y el minimalismo, brindándole información sobre los códigos universales y atemporales de la geometría y la simetría. Descubra cómo la simplicidad y la economía de formas pueden crear espacios armoniosos que resisten el paso del tiempo', 16, N'https://i.ytimg.com/vi/yQojEZeEJB8/maxresdefault.jpg', NULL, 6, 2200, N'Medio')
INSERT [dbo].[Cursos] ([idCurso], [NombreDelCurso], [HechoConIa], [idCategorias], [idAreas], [idEstilo], [idRecursosAdicionales], [PrecioDelCurso], [ResumenCurso], [Adelanto], [idImagenCursos], [PortadaCurso], [idCreador], [Valoracion], [NumeroEstudiantes], [NivelCurso]) VALUES (13, N'Diseño textil para moda infantil', 0, 39, 39, 8, 1, 10, N'Sumérgete en el mundo del diseño textil y de moda con Anne Stettner, la fundadora de la marca von.anne, en este curso en línea. En este viaje creativo, aprenderá a crear diseños de telas únicos para ropa infantil, incorporando adorables motivos de animales y comida. Anne lo guía en cada paso, desde el desarrollo de cautivadores bocetos de personajes hasta el diseño de patrones perfectos y listos para imprimir', N'En este curso en línea, Anne compartirá su experiencia y pasión por romper los estereotipos de género mientras crea diseños que los niños encuentran hermosos y divertidos. Al principio aprenderás los conceptos básicos de motivos, patrones y tipos de tejidos, lo que te dará una base sólida para tus creaciones', 15, N'https://i.ytimg.com/vi/nZ3brJQePRY/maxresdefault.jpg', NULL, 9, 3500, N'Experto')
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

INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen]) VALUES (14, N'asa', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen]) VALUES (15, N'a', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[ImagenesCursos] ([idImagenesCursos], [NombreImagen], [SrcImagen]) VALUES (16, N'fda', N'https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
SET IDENTITY_INSERT [dbo].[ImagenesCursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Leccion] ON 

INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (1, N'Leccion1', N'ContenidoLeccion1', NULL)
INSERT [dbo].[Leccion] ([idLeccion], [NombreLeccion], [ContenidoLeccion], [idCursos]) VALUES (2, N'Leccion2', N'ContenidoLeccion2', NULL)
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

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (1, N'Choclo', N'abcde', N'arenaalessandro156@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (2, N'Suezii', N'12345', N'sueztobias@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (3, N'Ferrari_Rocco_1105', N'abcde12345', N'roccoferrari@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (24, N'samlucas', N'samPass123', N'samlucas@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (25, N'oliverrichards', N'oliverPass456', N'oliverrichards@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [Contraseña], [Email], [FotoDePerfil], [Biografia], [Ubicacion], [Nombre]) VALUES (26, N'sophieharris', N'sophiePass789', N'sophieharris@gmail.com', NULL, NULL, NULL, NULL)
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
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_ImagenesCursos] FOREIGN KEY([idImagenCursos])
REFERENCES [dbo].[ImagenesCursos] ([idImagenesCursos])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_ImagenesCursos]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_RecursosAdicionales] FOREIGN KEY([idRecursosAdicionales])
REFERENCES [dbo].[RecursosAdicionales] ([idRecursosAdicionales])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_RecursosAdicionales]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Usuario] FOREIGN KEY([idCreador])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Usuario]
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
