USE [master]
GO
/****** Object:  Database [BDEmpresa]    Script Date: 17/06/2015 11:55:14 a.m. ******/
CREATE DATABASE [BDEmpresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDEmpresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDEmpresa.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDEmpresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDEmpresa_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDEmpresa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDEmpresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDEmpresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDEmpresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDEmpresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDEmpresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDEmpresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDEmpresa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDEmpresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDEmpresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDEmpresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDEmpresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDEmpresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDEmpresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDEmpresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDEmpresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDEmpresa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDEmpresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDEmpresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDEmpresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDEmpresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDEmpresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDEmpresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDEmpresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDEmpresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDEmpresa] SET  MULTI_USER 
GO
ALTER DATABASE [BDEmpresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDEmpresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDEmpresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDEmpresa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDEmpresa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDEmpresa]
GO
/****** Object:  Schema [Produccion]    Script Date: 17/06/2015 11:55:15 a.m. ******/
CREATE SCHEMA [Produccion]
GO
/****** Object:  Schema [RecursosHumanos]    Script Date: 17/06/2015 11:55:15 a.m. ******/
CREATE SCHEMA [RecursosHumanos]
GO
/****** Object:  Schema [Reportes]    Script Date: 17/06/2015 11:55:15 a.m. ******/
CREATE SCHEMA [Reportes]
GO
/****** Object:  Schema [Ventas]    Script Date: 17/06/2015 11:55:15 a.m. ******/
CREATE SCHEMA [Ventas]
GO
/****** Object:  Table [Produccion].[Categorias]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Produccion].[Categorias](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre_categoria] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NULL,
	[codigo]  AS ('CAT-'+CONVERT([varchar],[id_categoria])),
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Categorias_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Produccion].[Productos]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Produccion].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[precio_unitario] [money] NULL,
	[detalles] [varchar](150) NULL,
	[codigo]  AS ('PRO-'+CONVERT([varchar],[id_producto])),
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Productos_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [RecursosHumanos].[Empleados]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [RecursosHumanos].[Empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[codigo]  AS ('EMP-'+CONVERT([varchar],[id_empleado])),
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Empleados_NombreApellido] UNIQUE NONCLUSTERED 
(
	[nombre_empleado] ASC,
	[apellido_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Reportes].[FechasLookup]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Reportes].[FechasLookup](
	[Fecha] [int] NOT NULL,
	[Año] [char](4) NULL,
	[NombreMes] [varchar](12) NULL,
	[NumeroMes] [tinyint] NULL,
 CONSTRAINT [PK_FechasLookup] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Ventas].[Clientes]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Ventas].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[nombre_contacto] [varchar](50) NULL,
	[direccion] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[codigo]  AS ('CLI-'+CONVERT([varchar],[id_cliente])),
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Clientes_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Ventas].[DetallesPedido]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[DetallesPedido](
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio_unitario] [money] NOT NULL,
	[cantidad] [int] NOT NULL,
	[descuento] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_DetallesPedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Ventas].[Pedidos]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Ventas].[Pedidos](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_transportista] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha_ordenado] [datetime] NOT NULL,
	[fecha_requerido] [datetime] NULL,
	[fecha_entregado] [datetime] NULL,
	[costo_envio] [money] NOT NULL,
	[codigo]  AS ('PED-'+CONVERT([varchar],[id_pedido])),
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Ventas].[Transportistas]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Ventas].[Transportistas](
	[id_transportista] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empresa] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[codigo]  AS ('TRA-'+CONVERT([varchar],[id_transportista])),
 CONSTRAINT [PK_Transportistas] PRIMARY KEY CLUSTERED 
(
	[id_transportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Transportistas_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [Produccion].[v_Productos_NombreCategoria]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Produccion].[v_Productos_NombreCategoria]
WITH SCHEMABINDING
AS
SELECT Produccion.Productos.id_producto AS ID, Produccion.Productos.codigo AS CÓDIGO,
Produccion.Productos.nombre_producto AS NOMBRE, Produccion.Categorias.nombre_categoria AS CATEGORÍA, Produccion.Productos.precio_unitario AS PRECIO, Produccion.Productos.detalles AS
[DETALLES DEL PRODUCTO]
FROM Produccion.Productos INNER JOIN Produccion.Categorias
ON Produccion.Productos.id_categoria = Produccion.Categorias.id_categoria;

GO
/****** Object:  View [Ventas].[v_Pedidos]    Script Date: 17/06/2015 11:55:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Ventas].[v_Pedidos] 
WITH SCHEMABINDING
AS
SELECT Ventas.Pedidos.id_pedido AS ID, Ventas.Pedidos.codigo AS CÓDIGO, Ventas.Clientes.nombre_cliente AS CLIENTE, Ventas.Transportistas.nombre_empresa AS TRANSPORTE,
RecursosHumanos.Empleados.apellido_empleado + ', ' + RecursosHumanos.Empleados.nombre_empleado AS
RESPONSABLE, Ventas.Pedidos.fecha_ordenado AS ORDENADO, Ventas.Pedidos.fecha_requerido AS
REQUERIDO, Ventas.Pedidos.fecha_entregado AS ENTREGADO, Ventas.Pedidos.costo_envio AS 
[COSTO DE ENVÍO]
FROM Ventas.Pedidos INNER JOIN Ventas.Clientes ON Ventas.Pedidos.id_cliente = Ventas.Clientes.id_cliente
INNER JOIN RecursosHumanos.Empleados ON Ventas.Pedidos.id_empleado = 
RecursosHumanos.Empleados.id_empleado 
INNER JOIN Ventas.Transportistas ON Ventas.Pedidos.id_transportista =
Ventas.Transportistas.id_transportista;

GO
ALTER TABLE [Produccion].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([id_categoria])
REFERENCES [Produccion].[Categorias] ([id_categoria])
GO
ALTER TABLE [Produccion].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPedido_Pedidos] FOREIGN KEY([id_pedido])
REFERENCES [Ventas].[Pedidos] ([id_pedido])
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [FK_DetallesPedido_Pedidos]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPedido_Productos] FOREIGN KEY([id_producto])
REFERENCES [Produccion].[Productos] ([id_producto])
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [FK_DetallesPedido_Productos]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [Ventas].[Clientes] ([id_cliente])
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [RecursosHumanos].[Empleados] ([id_empleado])
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Empleados]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Transportistas] FOREIGN KEY([id_transportista])
REFERENCES [Ventas].[Transportistas] ([id_transportista])
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Transportistas]
GO
ALTER TABLE [Produccion].[Categorias]  WITH CHECK ADD  CONSTRAINT [CHK_Categorias_NombreCategoriaVacio] CHECK  (([nombre_categoria]<>''))
GO
ALTER TABLE [Produccion].[Categorias] CHECK CONSTRAINT [CHK_Categorias_NombreCategoriaVacio]
GO
ALTER TABLE [Produccion].[Productos]  WITH CHECK ADD  CONSTRAINT [CHK_Productos_NombreProductoVacio] CHECK  (([nombre_producto]<>''))
GO
ALTER TABLE [Produccion].[Productos] CHECK CONSTRAINT [CHK_Productos_NombreProductoVacio]
GO
ALTER TABLE [Produccion].[Productos]  WITH CHECK ADD  CONSTRAINT [CHK_Productos_PrecioPositivo] CHECK  (([precio_unitario]>=(0)))
GO
ALTER TABLE [Produccion].[Productos] CHECK CONSTRAINT [CHK_Productos_PrecioPositivo]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Empleados_ApellidoEmpleadoVacio] CHECK  (([nombre_empleado]<>''))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [CHK_Empleados_ApellidoEmpleadoVacio]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Empleados_CiudadVacio] CHECK  (([ciudad]<>''))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [CHK_Empleados_CiudadVacio]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Empleados_DireccionVacio] CHECK  (([direccion]<>''))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [CHK_Empleados_DireccionVacio]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Empleados_NombreEmpleadoVacio] CHECK  (([nombre_empleado]<>''))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [CHK_Empleados_NombreEmpleadoVacio]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Empleados_PaisVacio] CHECK  (([pais]<>''))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [CHK_Empleados_PaisVacio]
GO
ALTER TABLE [Ventas].[Clientes]  WITH CHECK ADD  CONSTRAINT [CHK_Clientes_CiudadVacio] CHECK  (([ciudad]<>''))
GO
ALTER TABLE [Ventas].[Clientes] CHECK CONSTRAINT [CHK_Clientes_CiudadVacio]
GO
ALTER TABLE [Ventas].[Clientes]  WITH CHECK ADD  CONSTRAINT [CHK_Clientes_DireccionVacio] CHECK  (([direccion]<>''))
GO
ALTER TABLE [Ventas].[Clientes] CHECK CONSTRAINT [CHK_Clientes_DireccionVacio]
GO
ALTER TABLE [Ventas].[Clientes]  WITH CHECK ADD  CONSTRAINT [CHK_Clientes_NombreClienteVacio] CHECK  (([nombre_cliente]<>''))
GO
ALTER TABLE [Ventas].[Clientes] CHECK CONSTRAINT [CHK_Clientes_NombreClienteVacio]
GO
ALTER TABLE [Ventas].[Clientes]  WITH CHECK ADD  CONSTRAINT [CHK_Clientes_PaisVacio] CHECK  (([pais]<>''))
GO
ALTER TABLE [Ventas].[Clientes] CHECK CONSTRAINT [CHK_Clientes_PaisVacio]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [CHK_DetallesPedido_CantidadPositivo] CHECK  (([cantidad]>(0)))
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [CHK_DetallesPedido_CantidadPositivo]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [CHK_DetallesPedido_CantidadVacio] CHECK  (([cantidad]<>''))
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [CHK_DetallesPedido_CantidadVacio]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [CHK_DetallesPedido_DescuentoVacio] CHECK  ((CONVERT([varchar],[descuento])<>''))
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [CHK_DetallesPedido_DescuentoVacio]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [CHK_DetallesPedido_PrecioPositivo] CHECK  (([precio_unitario]>=(0)))
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [CHK_DetallesPedido_PrecioPositivo]
GO
ALTER TABLE [Ventas].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [CHK_DetallesPedido_PrecioVacio] CHECK  (([precio_unitario]<>''))
GO
ALTER TABLE [Ventas].[DetallesPedido] CHECK CONSTRAINT [CHK_DetallesPedido_PrecioVacio]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [CHK_Pedidos_CostoEnvioPositivo] CHECK  (([costo_envio]>=(0)))
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [CHK_Pedidos_CostoEnvioPositivo]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [CHK_Pedidos_CostoEnvioVacio] CHECK  (([costo_envio]<>''))
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [CHK_Pedidos_CostoEnvioVacio]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [CHK_Pedidos_FechaOrdenadoVacio] CHECK  (([fecha_ordenado]<>''))
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [CHK_Pedidos_FechaOrdenadoVacio]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [CHK_Pedidos_OrdenadoEntregado] CHECK  (([fecha_entregado]>=[fecha_ordenado]))
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [CHK_Pedidos_OrdenadoEntregado]
GO
ALTER TABLE [Ventas].[Pedidos]  WITH CHECK ADD  CONSTRAINT [CHK_Pedidos_OrdenadoRequerido] CHECK  (([fecha_requerido]>=[fecha_ordenado]))
GO
ALTER TABLE [Ventas].[Pedidos] CHECK CONSTRAINT [CHK_Pedidos_OrdenadoRequerido]
GO
ALTER TABLE [Ventas].[Transportistas]  WITH CHECK ADD  CONSTRAINT [CHK_Transportistas_CiudadVacio] CHECK  (([ciudad]<>''))
GO
ALTER TABLE [Ventas].[Transportistas] CHECK CONSTRAINT [CHK_Transportistas_CiudadVacio]
GO
ALTER TABLE [Ventas].[Transportistas]  WITH CHECK ADD  CONSTRAINT [CHK_Transportistas_DireccionVacio] CHECK  (([direccion]<>''))
GO
ALTER TABLE [Ventas].[Transportistas] CHECK CONSTRAINT [CHK_Transportistas_DireccionVacio]
GO
ALTER TABLE [Ventas].[Transportistas]  WITH CHECK ADD  CONSTRAINT [CHK_Transportistas_NombreEmpresaVacio] CHECK  (([nombre_empresa]<>''))
GO
ALTER TABLE [Ventas].[Transportistas] CHECK CONSTRAINT [CHK_Transportistas_NombreEmpresaVacio]
GO
ALTER TABLE [Ventas].[Transportistas]  WITH CHECK ADD  CONSTRAINT [CHK_Transportistas_PaisVacio] CHECK  (([pais]<>''))
GO
ALTER TABLE [Ventas].[Transportistas] CHECK CONSTRAINT [CHK_Transportistas_PaisVacio]
GO
USE [master]
GO
ALTER DATABASE [BDEmpresa] SET  READ_WRITE 
GO
