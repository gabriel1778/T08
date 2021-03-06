USE [master]
GO
/****** Object:  Database [Encuesta]    Script Date: 14/05/2015 14:17:42 ******/
CREATE DATABASE [Encuesta] ON  PRIMARY 
( NAME = N'Encuesta', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Encuesta.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Encuesta_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Encuesta_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Encuesta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Encuesta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Encuesta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Encuesta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Encuesta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Encuesta] SET ARITHABORT OFF 
GO
ALTER DATABASE [Encuesta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Encuesta] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Encuesta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Encuesta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Encuesta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Encuesta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Encuesta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Encuesta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Encuesta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Encuesta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Encuesta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Encuesta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Encuesta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Encuesta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Encuesta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Encuesta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Encuesta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Encuesta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Encuesta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Encuesta] SET  MULTI_USER 
GO
ALTER DATABASE [Encuesta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Encuesta] SET DB_CHAINING OFF 
GO
USE [Encuesta]
GO
/****** Object:  Table [dbo].[Accesos]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accesos](
	[IdAcceso] [int] IDENTITY(1,1) NOT NULL,
	[Login] [char](20) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
 CONSTRAINT [PK_Accesos] PRIMARY KEY CLUSTERED 
(
	[IdAcceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ElementoSeleccion]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElementoSeleccion](
	[IdElementoSeleccion] [int] NOT NULL,
	[IdSeleccion] [int] NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ElementoSeleccion] PRIMARY KEY CLUSTERED 
(
	[IdElementoSeleccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuesta](
	[IdEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NULL,
	[IdTipoEncuesta] [int] NOT NULL,
 CONSTRAINT [PK_Encuesta] PRIMARY KEY CLUSTERED 
(
	[IdEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plantilla]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plantilla](
	[IdPlantilla] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEncuesta] [int] NOT NULL,
	[Pregunta] [varchar](512) NOT NULL,
	[IdSeleccion] [int] NULL,
 CONSTRAINT [PK_Plantilla] PRIMARY KEY CLUSTERED 
(
	[IdPlantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdEncuesta] [int] NOT NULL,
	[Pregunta] [varchar](512) NOT NULL,
	[Respuesta] [varchar](512) NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seleccion]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seleccion](
	[IdSeleccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Seleccion] PRIMARY KEY CLUSTERED 
(
	[IdSeleccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEncuesta]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEncuesta](
	[IdTipoEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoEncuesta] PRIMARY KEY CLUSTERED 
(
	[IdTipoEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/05/2015 14:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Login] [char](20) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Accesos] ADD  CONSTRAINT [DF_Accesos_FechaHora]  DEFAULT (getutcdate()) FOR [FechaHora]
GO
ALTER TABLE [dbo].[Respuesta] ADD  CONSTRAINT [DF_Pregunta_Pregunta]  DEFAULT ('No det') FOR [Pregunta]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Activo]  DEFAULT ((0)) FOR [Activo]
GO
ALTER TABLE [dbo].[Accesos]  WITH CHECK ADD  CONSTRAINT [FK_Accesos_Usuario] FOREIGN KEY([Login])
REFERENCES [dbo].[Usuario] ([Login])
GO
ALTER TABLE [dbo].[Accesos] CHECK CONSTRAINT [FK_Accesos_Usuario]
GO
ALTER TABLE [dbo].[ElementoSeleccion]  WITH CHECK ADD  CONSTRAINT [FK_ElementoSeleccion_Seleccion] FOREIGN KEY([IdSeleccion])
REFERENCES [dbo].[Seleccion] ([IdSeleccion])
GO
ALTER TABLE [dbo].[ElementoSeleccion] CHECK CONSTRAINT [FK_ElementoSeleccion_Seleccion]
GO
ALTER TABLE [dbo].[Encuesta]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_TipoEncuesta] FOREIGN KEY([IdTipoEncuesta])
REFERENCES [dbo].[TipoEncuesta] ([IdTipoEncuesta])
GO
ALTER TABLE [dbo].[Encuesta] CHECK CONSTRAINT [FK_Encuesta_TipoEncuesta]
GO
ALTER TABLE [dbo].[Plantilla]  WITH CHECK ADD  CONSTRAINT [FK_Plantilla_Seleccion] FOREIGN KEY([IdSeleccion])
REFERENCES [dbo].[Seleccion] ([IdSeleccion])
GO
ALTER TABLE [dbo].[Plantilla] CHECK CONSTRAINT [FK_Plantilla_Seleccion]
GO
ALTER TABLE [dbo].[Plantilla]  WITH CHECK ADD  CONSTRAINT [FK_Plantilla_TipoEncuesta] FOREIGN KEY([IdTipoEncuesta])
REFERENCES [dbo].[TipoEncuesta] ([IdTipoEncuesta])
GO
ALTER TABLE [dbo].[Plantilla] CHECK CONSTRAINT [FK_Plantilla_TipoEncuesta]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Encuesta] FOREIGN KEY([IdEncuesta])
REFERENCES [dbo].[Encuesta] ([IdEncuesta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Pregunta_Encuesta]
GO
USE [master]
GO
ALTER DATABASE [Encuesta] SET  READ_WRITE 
GO
