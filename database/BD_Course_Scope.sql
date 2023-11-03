USE [master]
GO
/****** Object:  Database [ProyectoCourseScope]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  User [Reportes]    Script Date: 3/11/2023 11:26:07 ******/
CREATE USER [Reportes] FOR LOGIN [Reportes] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 3/11/2023 11:26:07 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Reportes]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Carrito]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Carrito_Curso]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Curso](
	[idCarrito] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Compra]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Curso_ImagenCurso]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_ImagenCurso](
	[idCurso] [int] NULL,
	[idImagenCurso] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_RecursosAdicionales]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_RecursosAdicionales](
	[idCurso] [int] NULL,
	[idRecursosAdicionales] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Cursos_Idioma]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos_Idioma](
	[idIdioma] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[idCompra_idCurso]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idCompra_idCurso](
	[idCompra] [int] NOT NULL,
	[idCurso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idCompra_idUsuario]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[idEstilo_idColor]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idColor](
	[idEstilo] [int] NOT NULL,
	[idColor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idEstilo_idTipografia]    Script Date: 3/11/2023 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idEstilo_idTipografia](
	[idEstilo] [int] NOT NULL,
	[idTipografia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[ImagenesCursos]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Leccion]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Presentacion]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[RecursosAdicionales]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Tipografia]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Usuario_Cursos]    Script Date: 3/11/2023 11:26:07 ******/
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
/****** Object:  Table [dbo].[Usuario_Presentacion]    Script Date: 3/11/2023 11:26:07 ******/
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
