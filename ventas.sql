-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2025 a las 17:51:09
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `caja_id` int(5) NOT NULL,
  `caja_numero` int(5) NOT NULL,
  `caja_nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL,
  `empresa_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`, `empresa_id`) VALUES
(1, 1, 'Caja1', '14225.00', 1),
(4, 2, 'Caja Principal', '12634.56', 2),
(5, 1, 'Caja Rapida', '1000.00', 2),
(9, 123, 'asdasd', '0.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_ubicacion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`, `empresa_id`) VALUES
(1, 'Liquidos', 'Almacen1', 1),
(2, 'Cemento', 'Bodega1', 1),
(3, 'METAL', 'Bodega 1', 2),
(4, 'Zapatos', 'bodega', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(10) NOT NULL,
  `cliente_tipo_documento` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_numero_documento` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_provincia` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_ciudad` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_direccion` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_telefono`, `cliente_email`, `empresa_id`) VALUES
(1, 'Otro', 'N/A', 'Publico', 'General', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 1),
(2, 'Cedula', '042-080686-0007C', 'Henrry Antonio', 'Orozco', 'Managua', 'Ciudad Sandino', 'por ahi', '12345645', 'hantoso@gmail.com', 1),
(3, 'OTRO', 'N/A', 'PUBLICO', 'GENERAL', 'N/A', 'N/A', 'N/A', '', '', 2),
(4, 'Cedula', '04101098700011N', 'sayda', 'guido', 'carazo', 'san marcos', 'distribuidora iza', '12345687', 'sayda@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_foto` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`, `empresa_foto`) VALUES
(1, 'FERRETERIA LA TUANI', '45645612', 'prueba@gmail.com', 'Managua', 'FERRETERIA_GOMEZ_97.jpg'),
(2, 'PINTURAS BRAKO', '12347896', 'PinutrasBrako@gmail.com', 'Ciudad Siniestra', 'PINTURAS_BRAKO_35.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `evento_id` int(11) NOT NULL,
  `tipo` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `tabla` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `datos` longtext COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` longtext COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usuario_id` int(7) NOT NULL,
  `fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`evento_id`, `tipo`, `tabla`, `datos`, `condicion`, `usuario_id`, `fecha_creacion`) VALUES
(1, 'Actualizar', 'caja', '\"UPDATE caja SET caja_numero=:Numero,caja_nombre=:Nombre,caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_numero\",\"campo_marcador\":\":Numero\",\"campo_valor\":\"2342\"},{\"campo_nombre\":\"caja_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"asdasdas\"},{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"0.00\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"8\"}', 1, '2023-12-06 14:49:51'),
(2, 'Eliminar', 'caja', '\"DELETE FROM caja WHERE caja_id=:id\"', '8', 1, '2023-12-06 14:49:54'),
(3, 'Guardar', 'roles', '\"INSERT INTO roles (rol,fecha_creacion,usuario_creacion ) VALUES(:Nombre,:fecha,:usuario)\"', '[{\"campo_nombre\":\"rol\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"sdfsafasdfasdfd\"},{\"campo_nombre\":\"fecha_creacion\",\"campo_marcador\":\":fecha\",\"campo_valor\":\"2023-12-06 15:14:46\"},{\"campo_nombre\":\"usuario_creacion \",\"campo_marcador\":\":usuario\",\"campo_valor\":\"1\"}]', 1, '2023-12-06 15:14:46'),
(4, 'Eliminar', 'roles', '\"DELETE FROM roles WHERE id_rol=:id\"', '16', 1, '2023-12-06 15:14:54'),
(5, 'Eliminar', 'roles', '\"DELETE FROM roles WHERE id_rol=:id\"', '17', 1, '2023-12-06 15:14:58'),
(6, 'Guardar', 'opcion', '\"INSERT INTO opcion (id_menu,nombre,descripcion,icono,orden,nombrevista,mostrar) VALUES(:menu,:nombreopcion,:descrip,:icono,:orden,:vista,:mostrar)\"', '[{\"campo_nombre\":\"id_menu\",\"campo_marcador\":\":menu\",\"campo_valor\":\"4\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombreopcion\",\"campo_valor\":\"Eventos por usuario\"},{\"campo_nombre\":\"descripcion\",\"campo_marcador\":\":descrip\",\"campo_valor\":\"para ver los eventos por usuario en el sistema\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-eye\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"nombrevista\",\"campo_marcador\":\":vista\",\"campo_valor\":\"eventoList\"},{\"campo_nombre\":\"mostrar\",\"campo_marcador\":\":mostrar\",\"campo_valor\":1}]', 1, '2023-12-06 16:17:18'),
(7, 'Guardar', 'rol_opcion', '\"INSERT INTO rol_opcion (id_rol,id_opcion,ver,agregar,actualizar,eliminar) VALUES(:rol,:opcion,:ver,:agregar,:actualizar,:eliminar)\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"51\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":0},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":0},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]', 1, '2023-12-06 16:17:51'),
(8, 'Guardar', 'rol_opcion', '\"INSERT INTO rol_opcion (id_rol,id_opcion,ver,agregar,actualizar,eliminar) VALUES(:rol,:opcion,:ver,:agregar,:actualizar,:eliminar)\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"14\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"3\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":0},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":1},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]', 4, '2023-12-06 16:25:36'),
(9, 'Guardar', 'rol_opcion', '\"INSERT INTO rol_opcion (id_rol,id_opcion,ver,agregar,actualizar,eliminar) VALUES(:rol,:opcion,:ver,:agregar,:actualizar,:eliminar)\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"14\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"2\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":1},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":0},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]', 4, '2023-12-06 16:25:45'),
(10, 'Guardar', 'caja', '\"INSERT INTO caja (caja_numero,caja_nombre,caja_efectivo,empresa_id ) VALUES(:Numero,:Nombre,:Efectivo,:Empresa)\"', '[{\"campo_nombre\":\"caja_numero\",\"campo_marcador\":\":Numero\",\"campo_valor\":\"123\"},{\"campo_nombre\":\"caja_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"asdasd\"},{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"0.00\"},{\"campo_nombre\":\"empresa_id \",\"campo_marcador\":\":Empresa\",\"campo_valor\":\"2\"}]', 4, '2023-12-06 16:26:14'),
(11, 'Guardar', 'rol_opcion', '\"INSERT INTO rol_opcion (id_rol,id_opcion,ver,agregar,actualizar,eliminar) VALUES(:rol,:opcion,:ver,:agregar,:actualizar,:eliminar)\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"14\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"48\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":0},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":1},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]', 4, '2023-12-06 16:26:50'),
(12, 'Guardar', 'menu', '\"INSERT INTO menu (id_menupadre,nombre,icono,orden) VALUES(:Nombre,:nombremenu,:icono,:orden)\"', '[{\"campo_nombre\":\"id_menupadre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"0\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombremenu\",\"campo_valor\":\"Sistema\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fab fa-windows\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"4\"}]', 1, '2023-12-06 16:31:39'),
(13, 'Actualizar', 'opcion', '\"UPDATE opcion SET id_menu=:menu,nombre=:nombreopcion,descripcion=:descrip,icono=:icono,orden=:orden,nombrevista=:vista,mostrar=:mostrar WHERE id_opcion=:ID\"', '[{\"campo_nombre\":\"id_menu\",\"campo_marcador\":\":menu\",\"campo_valor\":\"29\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombreopcion\",\"campo_valor\":\"Eventos por usuario\"},{\"campo_nombre\":\"descripcion\",\"campo_marcador\":\":descrip\",\"campo_valor\":\"para ver los eventos por usuario en el sistema\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-eye\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"nombrevista\",\"campo_marcador\":\":vista\",\"campo_valor\":\"eventoList\"},{\"campo_nombre\":\"mostrar\",\"campo_marcador\":\":mostrar\",\"campo_valor\":1}]{\"condicion_campo\":\"id_opcion\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"51\"}', 1, '2023-12-06 16:32:00'),
(14, 'Actualizar', 'producto', '\"UPDATE producto SET producto_stock_total=:Stock WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":88}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"5\"}', 1, '2023-12-06 16:56:53'),
(15, 'Guardar', 'venta', '\"INSERT INTO venta (venta_codigo,venta_fecha,venta_hora,venta_total,venta_pagado,venta_cambio,usuario_id,cliente_id,caja_id,empresa_id ) VALUES(:Codigo,:Fecha,:Hora,:Total,:Pagado,:Cambio,:Usuario,:Cliente,:Caja,:Empresa)\"', '[{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"C1H0K1M2H5-12\"},{\"campo_nombre\":\"venta_fecha\",\"campo_marcador\":\":Fecha\",\"campo_valor\":\"2023-12-06\"},{\"campo_nombre\":\"venta_hora\",\"campo_marcador\":\":Hora\",\"campo_valor\":\"04:56 pm\"},{\"campo_nombre\":\"venta_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"4250.00\"},{\"campo_nombre\":\"venta_pagado\",\"campo_marcador\":\":Pagado\",\"campo_valor\":\"4300.00\"},{\"campo_nombre\":\"venta_cambio\",\"campo_marcador\":\":Cambio\",\"campo_valor\":\"50.00\"},{\"campo_nombre\":\"usuario_id\",\"campo_marcador\":\":Usuario\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"cliente_id\",\"campo_marcador\":\":Cliente\",\"campo_valor\":1},{\"campo_nombre\":\"caja_id\",\"campo_marcador\":\":Caja\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"empresa_id \",\"campo_marcador\":\":Empresa\",\"campo_valor\":\"1\"}]', 1, '2023-12-06 16:56:53'),
(16, 'Guardar', 'venta_detalle', '\"INSERT INTO venta_detalle (venta_detalle_cantidad,venta_detalle_precio_compra,venta_detalle_precio_venta,venta_detalle_total,venta_detalle_descripcion,venta_codigo,producto_id) VALUES(:Cantidad,:PrecioCompra,:PrecioVenta,:Total,:Descripcion,:VentaCodigo,:Producto)\"', '[{\"campo_nombre\":\"venta_detalle_cantidad\",\"campo_marcador\":\":Cantidad\",\"campo_valor\":\"5\"},{\"campo_nombre\":\"venta_detalle_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"800.00\"},{\"campo_nombre\":\"venta_detalle_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"850.00\"},{\"campo_nombre\":\"venta_detalle_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"4250.00\"},{\"campo_nombre\":\"venta_detalle_descripcion\",\"campo_marcador\":\":Descripcion\",\"campo_valor\":\"Sandalia plataforma grande\"},{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":VentaCodigo\",\"campo_valor\":\"C1H0K1M2H5-12\"},{\"campo_nombre\":\"producto_id\",\"campo_marcador\":\":Producto\",\"campo_valor\":\"5\"}]', 1, '2023-12-06 16:56:53'),
(17, 'Actualizar', 'caja', '\"UPDATE caja SET caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"12520.00\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-06 16:56:53'),
(18, 'Actualizar', 'rol_opcion', '\"UPDATE rol_opcion SET id_rol=:rol,id_opcion=:opcion,ver=:ver,agregar=:agregar,actualizar=:actualizar,eliminar=:eliminar WHERE rolopcion_id=:ID\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"6\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"26\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":1},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":0},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]{\"condicion_campo\":\"rolopcion_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"39\"}', 1, '2023-12-06 17:01:31'),
(19, 'Actualizar', 'rol_opcion', '\"UPDATE rol_opcion SET id_rol=:rol,id_opcion=:opcion,ver=:ver,agregar=:agregar,actualizar=:actualizar,eliminar=:eliminar WHERE rolopcion_id=:ID\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"6\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"32\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":0},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":1},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]{\"condicion_campo\":\"rolopcion_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"43\"}', 1, '2023-12-06 17:01:47'),
(20, 'Actualizar', 'rol_opcion', '\"UPDATE rol_opcion SET id_rol=:rol,id_opcion=:opcion,ver=:ver,agregar=:agregar,actualizar=:actualizar,eliminar=:eliminar WHERE rolopcion_id=:ID\"', '[{\"campo_nombre\":\"id_rol\",\"campo_marcador\":\":rol\",\"campo_valor\":\"6\"},{\"campo_nombre\":\"id_opcion\",\"campo_marcador\":\":opcion\",\"campo_valor\":\"33\"},{\"campo_nombre\":\"ver\",\"campo_marcador\":\":ver\",\"campo_valor\":1},{\"campo_nombre\":\"agregar\",\"campo_marcador\":\":agregar\",\"campo_valor\":0},{\"campo_nombre\":\"actualizar\",\"campo_marcador\":\":actualizar\",\"campo_valor\":1},{\"campo_nombre\":\"eliminar\",\"campo_marcador\":\":eliminar\",\"campo_valor\":0}]{\"condicion_campo\":\"rolopcion_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"44\"}', 1, '2023-12-06 17:01:57'),
(21, 'Actualizar', 'producto', '\"UPDATE producto SET producto_stock_total=:Stock WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":87}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"5\"}', 1, '2023-12-07 08:36:01'),
(22, 'Guardar', 'venta', '\"INSERT INTO venta (venta_codigo,venta_fecha,venta_hora,venta_total,venta_pagado,venta_cambio,usuario_id,cliente_id,caja_id,empresa_id ) VALUES(:Codigo,:Fecha,:Hora,:Total,:Pagado,:Cambio,:Usuario,:Cliente,:Caja,:Empresa)\"', '[{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"D0P1C6D5K8-13\"},{\"campo_nombre\":\"venta_fecha\",\"campo_marcador\":\":Fecha\",\"campo_valor\":\"2023-12-07\"},{\"campo_nombre\":\"venta_hora\",\"campo_marcador\":\":Hora\",\"campo_valor\":\"08:36 am\"},{\"campo_nombre\":\"venta_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"850.00\"},{\"campo_nombre\":\"venta_pagado\",\"campo_marcador\":\":Pagado\",\"campo_valor\":\"860.00\"},{\"campo_nombre\":\"venta_cambio\",\"campo_marcador\":\":Cambio\",\"campo_valor\":\"10.00\"},{\"campo_nombre\":\"usuario_id\",\"campo_marcador\":\":Usuario\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"cliente_id\",\"campo_marcador\":\":Cliente\",\"campo_valor\":1},{\"campo_nombre\":\"caja_id\",\"campo_marcador\":\":Caja\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"empresa_id \",\"campo_marcador\":\":Empresa\",\"campo_valor\":\"1\"}]', 1, '2023-12-07 08:36:01'),
(23, 'Guardar', 'venta_detalle', '\"INSERT INTO venta_detalle (venta_detalle_cantidad,venta_detalle_precio_compra,venta_detalle_precio_venta,venta_detalle_total,venta_detalle_descripcion,venta_codigo,producto_id) VALUES(:Cantidad,:PrecioCompra,:PrecioVenta,:Total,:Descripcion,:VentaCodigo,:Producto)\"', '[{\"campo_nombre\":\"venta_detalle_cantidad\",\"campo_marcador\":\":Cantidad\",\"campo_valor\":1},{\"campo_nombre\":\"venta_detalle_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"800.00\"},{\"campo_nombre\":\"venta_detalle_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"850.00\"},{\"campo_nombre\":\"venta_detalle_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"850.00\"},{\"campo_nombre\":\"venta_detalle_descripcion\",\"campo_marcador\":\":Descripcion\",\"campo_valor\":\"Sandalia plataforma grande\"},{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":VentaCodigo\",\"campo_valor\":\"D0P1C6D5K8-13\"},{\"campo_nombre\":\"producto_id\",\"campo_marcador\":\":Producto\",\"campo_valor\":\"5\"}]', 1, '2023-12-07 08:36:01'),
(24, 'Actualizar', 'caja', '\"UPDATE caja SET caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"13370.00\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-07 08:36:01'),
(25, 'Actualizar', 'caja', '\"UPDATE caja SET caja_numero=:Numero,caja_nombre=:Nombre,caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_numero\",\"campo_marcador\":\":Numero\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"caja_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"Caja1\"},{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"13370.00\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-07 10:01:10'),
(26, 'Actualizar', 'producto', '\"UPDATE producto SET producto_stock_total=:Stock WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":41}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-15 14:17:25'),
(27, 'Guardar', 'venta', '\"INSERT INTO venta (venta_codigo,venta_fecha,venta_hora,venta_total,venta_pagado,venta_cambio,usuario_id,cliente_id,caja_id,empresa_id ) VALUES(:Codigo,:Fecha,:Hora,:Total,:Pagado,:Cambio,:Usuario,:Cliente,:Caja,:Empresa)\"', '[{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"C2G5M4U9A3-14\"},{\"campo_nombre\":\"venta_fecha\",\"campo_marcador\":\":Fecha\",\"campo_valor\":\"2023-12-15\"},{\"campo_nombre\":\"venta_hora\",\"campo_marcador\":\":Hora\",\"campo_valor\":\"02:17 pm\"},{\"campo_nombre\":\"venta_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"855.00\"},{\"campo_nombre\":\"venta_pagado\",\"campo_marcador\":\":Pagado\",\"campo_valor\":\"900.00\"},{\"campo_nombre\":\"venta_cambio\",\"campo_marcador\":\":Cambio\",\"campo_valor\":\"45.00\"},{\"campo_nombre\":\"usuario_id\",\"campo_marcador\":\":Usuario\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"cliente_id\",\"campo_marcador\":\":Cliente\",\"campo_valor\":\"2\"},{\"campo_nombre\":\"caja_id\",\"campo_marcador\":\":Caja\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"empresa_id \",\"campo_marcador\":\":Empresa\",\"campo_valor\":\"1\"}]', 1, '2023-12-15 14:17:25'),
(28, 'Guardar', 'venta_detalle', '\"INSERT INTO venta_detalle (venta_detalle_cantidad,venta_detalle_precio_compra,venta_detalle_precio_venta,venta_detalle_total,venta_detalle_descripcion,venta_codigo,producto_id) VALUES(:Cantidad,:PrecioCompra,:PrecioVenta,:Total,:Descripcion,:VentaCodigo,:Producto)\"', '[{\"campo_nombre\":\"venta_detalle_cantidad\",\"campo_marcador\":\":Cantidad\",\"campo_valor\":\"10\"},{\"campo_nombre\":\"venta_detalle_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"45.36\"},{\"campo_nombre\":\"venta_detalle_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"85.50\"},{\"campo_nombre\":\"venta_detalle_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"855.00\"},{\"campo_nombre\":\"venta_detalle_descripcion\",\"campo_marcador\":\":Descripcion\",\"campo_valor\":\"Aceite\"},{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":VentaCodigo\",\"campo_valor\":\"C2G5M4U9A3-14\"},{\"campo_nombre\":\"producto_id\",\"campo_marcador\":\":Producto\",\"campo_valor\":\"1\"}]', 1, '2023-12-15 14:17:25'),
(29, 'Actualizar', 'caja', '\"UPDATE caja SET caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"14225.00\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-15 14:17:25'),
(30, 'Actualizar', 'empresa', '\"UPDATE empresa SET empresa_nombre=:Nombre,empresa_telefono=:Telefono,empresa_email=:Email,empresa_direccion=:Direccion WHERE empresa_id=:ID\"', '[{\"campo_nombre\":\"empresa_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"FERRETERIA LA TUANI\"},{\"campo_nombre\":\"empresa_telefono\",\"campo_marcador\":\":Telefono\",\"campo_valor\":\"45645612\"},{\"campo_nombre\":\"empresa_email\",\"campo_marcador\":\":Email\",\"campo_valor\":\"prueba@gmail.com\"},{\"campo_nombre\":\"empresa_direccion\",\"campo_marcador\":\":Direccion\",\"campo_valor\":\"Managua\"}]{\"condicion_campo\":\"empresa_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2023-12-15 14:23:06'),
(31, 'Actualizar', 'opcion', '\"UPDATE opcion SET id_menu=:menu,nombre=:nombreopcion,descripcion=:descrip,icono=:icono,orden=:orden,nombrevista=:vista,mostrar=:mostrar WHERE id_opcion=:ID\"', '[{\"campo_nombre\":\"id_menu\",\"campo_marcador\":\":menu\",\"campo_valor\":\"29\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombreopcion\",\"campo_valor\":\"Datos de empresa\"},{\"campo_nombre\":\"descripcion\",\"campo_marcador\":\":descrip\",\"campo_valor\":\"para agregar datos de la empresa\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-store-alt fa-fw\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"nombrevista\",\"campo_marcador\":\":vista\",\"campo_valor\":\"companyNew\"},{\"campo_nombre\":\"mostrar\",\"campo_marcador\":\":mostrar\",\"campo_valor\":1}]{\"condicion_campo\":\"id_opcion\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"29\"}', 1, '2023-12-15 14:24:31'),
(32, 'Actualizar', 'opcion', '\"UPDATE opcion SET id_menu=:menu,nombre=:nombreopcion,descripcion=:descrip,icono=:icono,orden=:orden,nombrevista=:vista,mostrar=:mostrar WHERE id_opcion=:ID\"', '[{\"campo_nombre\":\"id_menu\",\"campo_marcador\":\":menu\",\"campo_valor\":\"4\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombreopcion\",\"campo_valor\":\"Datos de empresa\"},{\"campo_nombre\":\"descripcion\",\"campo_marcador\":\":descrip\",\"campo_valor\":\"para agregar datos de la empresa\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-store-alt fa-fw\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"nombrevista\",\"campo_marcador\":\":vista\",\"campo_valor\":\"companyNew\"},{\"campo_nombre\":\"mostrar\",\"campo_marcador\":\":mostrar\",\"campo_valor\":1}]{\"condicion_campo\":\"id_opcion\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"29\"}', 1, '2023-12-15 14:25:08'),
(33, 'Actualizar', 'producto', '\"UPDATE producto SET producto_codigo=:Codigo,producto_nombre=:Nombre,producto_stock_total=:Stock,producto_tipo_unidad=:Unidad,producto_precio_compra=:PrecioCompra,producto_precio_venta=:PrecioVenta,producto_marca=:Marca,producto_modelo=:Modelo,categoria_id=:Categoria WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"CEM-12563\"},{\"campo_nombre\":\"producto_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"Cemento Canal\"},{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":\"465\"},{\"campo_nombre\":\"producto_tipo_unidad\",\"campo_marcador\":\":Unidad\",\"campo_valor\":\"Bolsa\"},{\"campo_nombre\":\"producto_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"150.86\"},{\"campo_nombre\":\"producto_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"350.00\"},{\"campo_nombre\":\"producto_marca\",\"campo_marcador\":\":Marca\",\"campo_valor\":\"CEMEX\"},{\"campo_nombre\":\"producto_modelo\",\"campo_marcador\":\":Modelo\",\"campo_valor\":\"\"},{\"campo_nombre\":\"categoria_id\",\"campo_marcador\":\":Categoria\",\"campo_valor\":\"2\"}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"2\"}', 1, '2024-01-19 11:34:32'),
(34, 'Actualizar', 'producto', '\"UPDATE producto SET producto_codigo=:Codigo,producto_nombre=:Nombre,producto_stock_total=:Stock,producto_tipo_unidad=:Unidad,producto_precio_compra=:PrecioCompra,producto_precio_venta=:PrecioVenta,producto_marca=:Marca,producto_modelo=:Modelo,categoria_id=:Categoria WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"Pantalonmierda\"},{\"campo_nombre\":\"producto_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"Cemento Canal\"},{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":\"465\"},{\"campo_nombre\":\"producto_tipo_unidad\",\"campo_marcador\":\":Unidad\",\"campo_valor\":\"Bolsa\"},{\"campo_nombre\":\"producto_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"150.86\"},{\"campo_nombre\":\"producto_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"350.00\"},{\"campo_nombre\":\"producto_marca\",\"campo_marcador\":\":Marca\",\"campo_valor\":\"CEMEX\"},{\"campo_nombre\":\"producto_modelo\",\"campo_marcador\":\":Modelo\",\"campo_valor\":\"\"},{\"campo_nombre\":\"categoria_id\",\"campo_marcador\":\":Categoria\",\"campo_valor\":\"2\"}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"2\"}', 1, '2024-01-19 11:40:29'),
(35, 'Actualizar', 'producto', '\"UPDATE producto SET producto_codigo=:Codigo,producto_nombre=:Nombre,producto_stock_total=:Stock,producto_tipo_unidad=:Unidad,producto_precio_compra=:PrecioCompra,producto_precio_venta=:PrecioVenta,producto_marca=:Marca,producto_modelo=:Modelo,categoria_id=:Categoria WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"aceite\"},{\"campo_nombre\":\"producto_nombre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"Aceite\"},{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":\"41\"},{\"campo_nombre\":\"producto_tipo_unidad\",\"campo_marcador\":\":Unidad\",\"campo_valor\":\"Botella\"},{\"campo_nombre\":\"producto_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"45.36\"},{\"campo_nombre\":\"producto_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"85.50\"},{\"campo_nombre\":\"producto_marca\",\"campo_marcador\":\":Marca\",\"campo_valor\":\"suly\"},{\"campo_nombre\":\"producto_modelo\",\"campo_marcador\":\":Modelo\",\"campo_valor\":\"suly\"},{\"campo_nombre\":\"categoria_id\",\"campo_marcador\":\":Categoria\",\"campo_valor\":\"1\"}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2024-01-19 11:43:39'),
(36, 'Guardar', 'menu', '\"INSERT INTO menu (id_menupadre,nombre,icono,orden) VALUES(:Nombre,:nombremenu,:icono,:orden)\"', '[{\"campo_nombre\":\"id_menupadre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"0\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombremenu\",\"campo_valor\":\"probando\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=*fas fa-wrench*></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"}]', 1, '2024-12-30 09:16:39'),
(37, 'Actualizar', 'menu', '\"UPDATE menu SET id_menupadre=:Nombre,nombre=:nombremenu,icono=:icono,orden=:orden WHERE id_menu=:ID\"', '[{\"campo_nombre\":\"id_menupadre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"0\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombremenu\",\"campo_valor\":\"probando\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-wrench\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"1\"}]{\"condicion_campo\":\"id_menu\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"30\"}', 1, '2024-12-30 09:17:14'),
(38, 'Guardar', 'menu', '\"INSERT INTO menu (id_menupadre,nombre,icono,orden) VALUES(:Nombre,:nombremenu,:icono,:orden)\"', '[{\"campo_nombre\":\"id_menupadre\",\"campo_marcador\":\":Nombre\",\"campo_valor\":\"0\"},{\"campo_nombre\":\"nombre\",\"campo_marcador\":\":nombremenu\",\"campo_valor\":\"INTERNET\"},{\"campo_nombre\":\"icono\",\"campo_marcador\":\":icono\",\"campo_valor\":\"<i class=\"fas fa-wifi\"></i>\"},{\"campo_nombre\":\"orden\",\"campo_marcador\":\":orden\",\"campo_valor\":\"2\"}]', 1, '2024-12-30 09:18:09'),
(39, 'Actualizar', 'producto', '\"UPDATE producto SET producto_stock_total=:Stock WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":36}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2025-01-23 10:01:31'),
(40, 'Guardar', 'venta', '\"INSERT INTO venta (venta_codigo,venta_fecha,venta_hora,venta_total,venta_pagado,venta_cambio,usuario_id,cliente_id,caja_id,empresa_id ) VALUES(:Codigo,:Fecha,:Hora,:Total,:Pagado,:Cambio,:Usuario,:Cliente,:Caja,:Empresa)\"', '[{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":Codigo\",\"campo_valor\":\"K8V4S1R9P4-15\"},{\"campo_nombre\":\"venta_fecha\",\"campo_marcador\":\":Fecha\",\"campo_valor\":\"2025-01-23\"},{\"campo_nombre\":\"venta_hora\",\"campo_marcador\":\":Hora\",\"campo_valor\":\"10:01 am\"},{\"campo_nombre\":\"venta_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"427.50\"},{\"campo_nombre\":\"venta_pagado\",\"campo_marcador\":\":Pagado\",\"campo_valor\":\"500.00\"},{\"campo_nombre\":\"venta_cambio\",\"campo_marcador\":\":Cambio\",\"campo_valor\":\"72.50\"},{\"campo_nombre\":\"usuario_id\",\"campo_marcador\":\":Usuario\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"cliente_id\",\"campo_marcador\":\":Cliente\",\"campo_valor\":1},{\"campo_nombre\":\"caja_id\",\"campo_marcador\":\":Caja\",\"campo_valor\":\"1\"},{\"campo_nombre\":\"empresa_id \",\"campo_marcador\":\":Empresa\",\"campo_valor\":\"1\"}]', 1, '2025-01-23 10:01:31'),
(41, 'Guardar', 'venta_detalle', '\"INSERT INTO venta_detalle (venta_detalle_cantidad,venta_detalle_precio_compra,venta_detalle_precio_venta,venta_detalle_total,venta_detalle_descripcion,venta_codigo,producto_id) VALUES(:Cantidad,:PrecioCompra,:PrecioVenta,:Total,:Descripcion,:VentaCodigo,:Producto)\"', '[{\"campo_nombre\":\"venta_detalle_cantidad\",\"campo_marcador\":\":Cantidad\",\"campo_valor\":\"5\"},{\"campo_nombre\":\"venta_detalle_precio_compra\",\"campo_marcador\":\":PrecioCompra\",\"campo_valor\":\"45.36\"},{\"campo_nombre\":\"venta_detalle_precio_venta\",\"campo_marcador\":\":PrecioVenta\",\"campo_valor\":\"85.50\"},{\"campo_nombre\":\"venta_detalle_total\",\"campo_marcador\":\":Total\",\"campo_valor\":\"427.50\"},{\"campo_nombre\":\"venta_detalle_descripcion\",\"campo_marcador\":\":Descripcion\",\"campo_valor\":\"Aceite\"},{\"campo_nombre\":\"venta_codigo\",\"campo_marcador\":\":VentaCodigo\",\"campo_valor\":\"K8V4S1R9P4-15\"},{\"campo_nombre\":\"producto_id\",\"campo_marcador\":\":Producto\",\"campo_valor\":\"1\"}]', 1, '2025-01-23 10:01:31'),
(42, 'Actualizar', 'caja', '\"UPDATE caja SET caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":\"14652.50\"}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2025-01-23 10:01:31'),
(43, 'Actualizar', 'caja', '\"UPDATE caja SET caja_efectivo=:Efectivo WHERE caja_id=:ID\"', '[{\"campo_nombre\":\"caja_efectivo\",\"campo_marcador\":\":Efectivo\",\"campo_valor\":14225}]{\"condicion_campo\":\"caja_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2025-01-23 10:22:34'),
(44, 'Actualizar', 'producto', '\"UPDATE producto SET producto_stock_total=:Stock WHERE producto_id=:ID\"', '[{\"campo_nombre\":\"producto_stock_total\",\"campo_marcador\":\":Stock\",\"campo_valor\":41}]{\"condicion_campo\":\"producto_id\",\"condicion_marcador\":\":ID\",\"condicion_valor\":\"1\"}', 1, '2025-01-23 10:22:34'),
(45, 'Eliminar', 'venta_detalle', '\"DELETE FROM venta_detalle WHERE venta_codigo=:id\"', 'K8V4S1R9P4-15', 1, '2025-01-23 10:22:34'),
(46, 'Eliminar', 'venta', '\"DELETE FROM venta WHERE venta_id=:id\"', '20', 1, '2025-01-23 10:22:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_menupadre` int(11) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `icono` varchar(300) DEFAULT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `id_menupadre`, `nombre`, `icono`, `orden`) VALUES
(1, 0, 'catalogos', '<i class=\"fas fa-table\"></i>', 1),
(2, 4, 'USUARIOS', '<i class=\"far fa-id-card\"></i>', 2),
(3, 0, 'VENTAS', '<i class=\"fas fa-shopping-cart fa-fw\"></i>', 3),
(4, 0, 'CONFIGURACIONES', '<i class=\"fas fa-cogs fa-fw\"></i>', 4),
(19, 1, 'PRODUCTOS', '<i class=\"fas fa-poll-h\"></i>', 4),
(20, 1, 'CAJA', '<i class=\"fas fa-podcast\"></i>', 1),
(21, 1, 'clientes', '<i class=\"fas fa-address-book fa-fw\"></i>', 2),
(22, 1, 'categorías', '<i class=\"fas fa-tags fa-fw\"></i>', 3),
(23, 4, 'roles', '<i class=\"fas fa-id-card\"></i>', 1),
(24, 4, 'menu', '<i class=\"fas fa-th-list\"></i>', 2),
(25, 4, 'Opciones', '<i class=\"fas fa-link\"></i>', 3),
(29, 0, 'Sistema', '<i class=\"fab fa-windows\"></i>', 4),
(30, 0, 'probando', '<i class=\"fas fa-wrench\"></i>', 1),
(31, 0, 'INTERNET', '<i class=\"fas fa-wifi\"></i>', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id_opcion` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `icono` varchar(250) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `nombrevista` varchar(250) DEFAULT NULL,
  `mostrar` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id_opcion`, `id_menu`, `nombre`, `descripcion`, `icono`, `orden`, `nombrevista`, `mostrar`) VALUES
(2, 20, 'Nueva Caja', 'opcion para ingresar una caja en el sistema', '<i class=\"fas fa-cash-register fa-fw\"></i>', 1, 'cashierNew', 1),
(3, 20, 'Listar Cajas', 'Opción para mostrar el listado de cajas del sistema', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'cashierList', 1),
(5, 20, 'Buscar Caja', 'sirve para realizar busqueda de las cajas ingresadas al sistema', '<i class=\"fas fa-search fa-fw\"></i>', 3, 'cashierSearch', 1),
(7, 25, 'Nueva Opción', 'para agregar una nueva opcion', '<i class=\"fas fa-plus\"></i>', 1, 'opcionNew', 1),
(8, 25, 'Listar opciones', 'para mostrar grid de opciones', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'opcionList', 1),
(9, 21, 'Nuevo Cliente', 'para agregar un nuevo cliente', '<i class=\"fas fa-male fa-fw\"></i>', 1, 'clientNew', 1),
(10, 21, 'listar clientes', 'listado de clientes', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'clientList', 1),
(11, 21, 'Buscar Cliente', 'permite realizar busqueda de cliente', '<i class=\"fas fa-search fa-fw\"></i>', 3, 'clientSearch', 1),
(12, 19, 'Nuevo Producto', 'para agregar producto', '<i class=\"fas fa-box fa-fw\"></i>', 1, 'productNew', 1),
(13, 19, 'Listar Productos', 'para mostrar lista de productos ingresados', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'productList', 1),
(14, 19, 'Buscar Producto', 'para busqueda de productos', '<i class=\"fas fa-search fa-fw\"></i>', 3, 'productSearch', 1),
(15, 19, 'Productos por Categoría', 'para mostrar los productos por categorias', '<i class=\"fas fa-boxes fa-fw\"></i>', 4, 'productCategory', 1),
(16, 22, 'Nueva Categoria', 'para ingresar una categoria', '<i class=\"fas fa-tag fa-fw\"></i>', 1, 'categoryNew', 1),
(17, 23, 'Nuevo Rol', 'para ingresar un rol', '<i class=\"fas fa-id-card-alt\"></i>', 1, 'rolNew', 1),
(18, 23, 'listar Roles', 'para mostrar los roles ingresados en el sistema', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'rolList', 1),
(19, 24, 'Nuevo Menu', 'para ingresar una opcion de Menu', '<i class=\"fas fa-plus-square\"></i>', 1, 'menuNew', 1),
(20, 24, 'Listar Menu', 'para mostrar listado de menu', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'menuList', 1),
(21, 22, 'Lista de Categorías', 'para mostrar listado de categoria', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'categoryList', 1),
(22, 22, 'Buscar categoría', 'para buscar categorias', '<i class=\"fas fa-search fa-fw\"></i>', 3, 'categorySearch', 1),
(23, 2, 'Nuevo Usuario', 'para ingresar un usuario', '<i class=\"fas fa-cash-register fa-fw\"></i>', 1, 'userNew', 1),
(24, 2, 'Lista de Usuarios', 'para mostrar listado de usuarios', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'userList', 1),
(25, 2, 'Buscar usuario', 'para busqueda de usuario', '<i class=\"fas fa-search fa-fw\"></i>', 3, 'userSearch', 1),
(26, 3, 'Nueva Venta', 'para crear una nueva venta', '<i class=\"fas fa-cart-plus fa-fw\"></i>', 1, 'saleNew', 1),
(27, 3, 'Lista de ventas', 'para mostrar las ventas realizadas', '<i class=\"fas fa-clipboard-list fa-fw\"></i>', 2, 'saleList', 1),
(28, 3, 'Buscar venta', 'para busqueda de venta', '<i class=\"fas fa-search-dollar fa-fw\"></i>', 3, 'saleSearch', 1),
(29, 4, 'Datos de empresa', 'para agregar datos de la empresa', '<i class=\"fas fa-store-alt fa-fw\"></i>', 1, 'companyNew', 1),
(32, 4, 'Mi cuenta', 'para actualizar datos de la cuenta que esta en sesion', '<i class=\"fas fa-user-tie fa-fw\"></i>', 2, 'userUpdate', 1),
(33, 4, 'Mi foto', 'para actualizar la foto  del usario en sesion', '<i class=\"fas fa-camera\"></i>', 3, 'userPhoto', 1),
(34, 23, 'Opcion por rol', 'listado de opciones por rol', '<i class=\"fas fa-th-list\"></i>', 3, 'rolopcionList2', 1),
(35, 23, 'Listar rol opciones', 'muestra el listado de opciones por rol', '<i class=\"fas fa-th-list\"></i>', 4, 'rolopcionList', 1),
(36, 23, 'Nuevo Opcion Rol', 'para agregar una nueva opcion al rol', '<i class=\"fas fa-plus\"></i>', 2, 'rolopcionNew', 1),
(39, 4, 'actualizar opcion', 'para actualizar opciones', '', 1, 'opcionUpdate', 0),
(40, 4, 'actualizar rol opcion', 'para actualizar las opciones por rol', '', 1, 'rolopcionUpdate', 0),
(41, 4, 'Actualizar cliente', 'para permitir actualizar un cliente', '', 1, 'clientUpdate', 0),
(42, 4, 'Actualizar Categoria', 'para actualizar la categoria', '', 1, 'categoryUpdate', 0),
(43, 4, 'actualizar producto', 'para poder actualizar los productos', '', 1, 'productUpdate', 0),
(44, 4, 'actualizar foto producto', 'para poder actualizar la foto del  producto', '', 1, 'productPhoto', 0),
(45, 4, 'detalle de venta', 'para ver el detalle de las ventas', '', 1, 'saleDetail', 0),
(46, 4, 'actualizar rol', 'para actualizar el rol', '', 1, 'rolUpdate', 0),
(47, 4, 'actualizar menu', 'para poder actualizar el menu', '', 1, 'menuUpdate', 0),
(48, 4, 'actualizar caja', 'para poder actualizar una caja', '', 1, 'cashierUpdate', 0),
(50, 4, 'foto empresa', 'para actualizar la foto de la empresa', '<i class=\"fas fa-file-image\"></i>', 1, 'companyPhoto', 1),
(51, 29, 'Eventos por usuario', 'para ver los eventos por usuario en el sistema', '<i class=\"fas fa-eye\"></i>', 1, 'eventoList', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(20) NOT NULL,
  `producto_codigo` varchar(77) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_stock_total` int(25) NOT NULL,
  `producto_tipo_unidad` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_marca` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_modelo` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_foto` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_id` int(7) NOT NULL,
  `empresa_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`, `empresa_id`) VALUES
(1, 'aceite', 'Aceite', 41, 'Botella', '45.36', '85.50', 'suly', 'suly', 'Habilitado', '123455623156456_0.jpg', 1, 1),
(2, 'Pantalonmierda', 'Cemento Canal', 465, 'Bolsa', '150.86', '350.00', 'CEMEX', '', 'Habilitado', '123456_53.jpg', 2, 1),
(3, '123456', 'Hierro corrabado', 23, 'Unidad', '150.36', '350.96', 'FERROMAX', 'Hierro', 'Habilitado', '123456_42.jpg', 3, 2),
(4, '456446', 'sdasaddas', 149, 'Tira', '1566.00', '3633.00', '', '', 'Habilitado', '456446_55.jpg', 3, 2),
(5, '456366', 'Sandalia plataforma grande', 87, 'Unidad', '800.00', '850.00', 'SODA', '', 'Habilitado', '456366_5.jpg', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`, `fecha_creacion`, `usuario_creacion`) VALUES
(1, 'Super Administrador', '2020-06-26 00:00:00', 1),
(6, 'Operador', '2023-11-23 16:14:04', 4),
(13, 'Supervisor', '2023-11-29 12:01:41', 1),
(14, 'Administrador', '2023-11-29 15:26:54', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_menu`
--

CREATE TABLE `rol_menu` (
  `rol_menu_id` int(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol_menu`
--

INSERT INTO `rol_menu` (`rol_menu_id`, `id_rol`, `id_menu`) VALUES
(1, 1, 25),
(2, 1, 4),
(3, 1, 23),
(4, 1, 24),
(5, 1, 2),
(12, 14, 23),
(13, 14, 4),
(14, 14, 2),
(15, 6, 20),
(16, 6, 1),
(17, 6, 21),
(18, 6, 3),
(19, 6, 19),
(20, 6, 4),
(21, 1, 3),
(22, 13, 4),
(23, 13, 22),
(24, 13, 1),
(25, 13, 23),
(26, 13, 20),
(27, 13, 25),
(28, 1, 20),
(29, 1, 1),
(30, 1, 21),
(31, 1, 22),
(32, 1, 19),
(33, 14, 20),
(34, 14, 1),
(35, 14, 3),
(36, 14, 21),
(37, 14, 19),
(38, 1, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_opcion`
--

CREATE TABLE `rol_opcion` (
  `rolopcion_id` int(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `ver` int(1) DEFAULT NULL,
  `agregar` int(1) DEFAULT NULL,
  `actualizar` int(1) DEFAULT NULL,
  `eliminar` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol_opcion`
--

INSERT INTO `rol_opcion` (`rolopcion_id`, `id_rol`, `id_opcion`, `ver`, `agregar`, `actualizar`, `eliminar`) VALUES
(1, 1, 7, 1, 1, 0, 0),
(2, 1, 34, 1, 0, 1, 1),
(3, 1, 35, 1, 0, 1, 1),
(4, 1, 17, 1, 1, 0, 0),
(5, 1, 18, 1, 0, 1, 1),
(6, 1, 36, 1, 1, 0, 0),
(7, 1, 8, 1, 0, 1, 1),
(8, 1, 19, 1, 1, 0, 0),
(9, 1, 20, 1, 0, 1, 1),
(10, 1, 23, 1, 1, 0, 0),
(11, 1, 24, 1, 0, 1, 1),
(12, 1, 25, 1, 0, 0, 0),
(13, 1, 29, 1, 0, 1, 0),
(14, 1, 32, 1, 0, 1, 0),
(15, 1, 33, 1, 0, 1, 1),
(26, 14, 34, 1, 1, 1, 0),
(28, 14, 23, 1, 0, 0, 0),
(29, 14, 24, 1, 0, 0, 0),
(30, 14, 36, 1, 1, 0, 0),
(31, 14, 29, 1, 0, 0, 0),
(32, 14, 32, 1, 0, 0, 0),
(33, 14, 33, 1, 0, 0, 0),
(37, 6, 10, 1, 0, 0, 0),
(38, 6, 11, 1, 0, 0, 0),
(39, 6, 26, 1, 1, 0, 0),
(40, 6, 28, 1, 0, 0, 0),
(41, 6, 13, 1, 0, 0, 0),
(42, 6, 14, 1, 0, 0, 0),
(43, 6, 32, 1, 0, 1, 0),
(44, 6, 33, 1, 0, 1, 0),
(45, 14, 17, 1, 0, 0, 0),
(46, 14, 18, 1, 0, 0, 0),
(47, 1, 27, 1, 0, 1, 1),
(48, 1, 26, 1, 0, 0, 0),
(55, 1, 39, 1, 0, 1, 0),
(56, 1, 2, 1, 1, 0, 0),
(57, 1, 3, 1, 0, 1, 1),
(58, 1, 40, 1, 0, 1, 0),
(59, 1, 5, 1, 0, 0, 0),
(60, 1, 9, 1, 1, 0, 0),
(61, 1, 10, 1, 0, 1, 1),
(62, 1, 11, 1, 0, 0, 0),
(63, 1, 41, 1, 0, 1, 0),
(64, 1, 42, 1, 0, 1, 0),
(65, 1, 16, 1, 1, 0, 0),
(66, 1, 21, 1, 0, 1, 1),
(67, 1, 22, 1, 0, 0, 0),
(68, 1, 12, 1, 1, 0, 0),
(69, 1, 13, 1, 0, 1, 1),
(70, 1, 14, 1, 0, 0, 0),
(71, 1, 15, 1, 1, 1, 1),
(72, 1, 43, 1, 0, 1, 0),
(73, 1, 44, 1, 0, 1, 1),
(74, 1, 28, 1, 0, 0, 0),
(75, 1, 45, 1, 0, 0, 0),
(76, 1, 46, 1, 0, 0, 0),
(77, 1, 47, 1, 0, 1, 0),
(84, 1, 48, 1, 0, 1, 0),
(85, 6, 3, 1, 0, 0, 0),
(86, 14, 15, 1, 1, 1, 1),
(88, 1, 50, 1, 0, 1, 1),
(89, 14, 50, 1, 0, 1, 1),
(90, 14, 27, 1, 0, 0, 0),
(91, 1, 51, 1, 0, 0, 0),
(92, 14, 3, 1, 0, 1, 0),
(93, 14, 2, 1, 1, 0, 0),
(94, 14, 48, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(7) NOT NULL,
  `usuario_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_clave` varchar(535) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_foto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `caja_id` int(5) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`, `id_rol`) VALUES
(1, 'Mario Alberto', 'Gómez Briceño', 'mgomez@gmail.com', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', 'Mario_Alberto_45.png', 1, 1),
(2, 'Maria', 'Sarria', 'msarria@gmail.com', 'msarria', '$2y$10$35xG71cSqJwQ/4zozV9ENeHmLin4yrXU2I5OjLK2ZBQDpkTHfdVm2', 'Mario_Alberto_11.jpg', 1, 6),
(4, 'Prueba', 'Prueba', 'mgomez@yahoo.es', 'prueba', '$2y$10$sHSvQk3sOpUtfwglOauRCuOr09Zb.RpXh1ASISUK6OuGtFXf02RIu', 'Prueba_11.jpg', 4, 14),
(10, 'Alberto', 'Perez', 'aperez@gmail.com', 'aperez', '$2y$10$G49gPCSTgs34dK/Aa/.veuxPbZAjNNhHW4x2OJAVOtSHp41YEM6tm', 'Alberto_82.jpg', 4, 6),
(16, 'prueba', 'prueba', 'asdas@asd.com', 'empresa', '$2y$10$8E0Suo/lpcZAhgD0uzweguYsrQTVWyF03ujL4kKUZbsViOFnsTiL2', '', 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empresa`
--

CREATE TABLE `usuario_empresa` (
  `usuario_empresa_id` int(100) NOT NULL,
  `usuario_id` int(20) NOT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario_empresa`
--

INSERT INTO `usuario_empresa` (`usuario_empresa_id`, `usuario_id`, `empresa_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 4, 2),
(10, 10, 2),
(16, 16, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(30) NOT NULL,
  `venta_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL,
  `caja_id` int(5) NOT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `venta_pagado`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`, `empresa_id`) VALUES
(2, 'P7Z3O9C8I2-2', '2023-12-01', '02:20 pm', '350.00', '500.00', '150.00', 1, 1, 1, 1),
(3, 'O4W9P9U8F8-3', '2023-12-04', '03:14 pm', '350.00', '400.00', '50.00', 1, 1, 1, 1),
(4, 'U4U2I8J8K4-4', '2023-12-04', '03:57 pm', '3509.60', '3520.00', '10.40', 10, 1, 1, 2),
(5, 'H7J0F3H1H7-5', '2023-12-04', '04:01 pm', '350.96', '500.00', '149.04', 10, 1, 1, 2),
(6, 'C6R0Q5W2M0-6', '2023-12-04', '04:04 pm', '1754.80', '1800.00', '45.20', 10, 1, 1, 2),
(7, 'H7E1Q6W2Y2-7', '2023-12-04', '04:08 pm', '1.25', '5.00', '3.75', 1, 1, 1, 1),
(8, 'P7M9T2Y9Q5-8', '2023-12-05', '08:34 am', '2550.00', '2600.00', '50.00', 1, 1, 1, 1),
(13, 'K5B4B4S7V1-8', '2023-12-05', '04:11 pm', '2600.75', '2700.00', '99.25', 1, 2, 1, 1),
(14, 'S1K8H6L3I3-9', '2023-12-05', '04:22 pm', '7019.20', '7100.00', '80.80', 10, 1, 1, 2),
(15, 'D6K5P8E3R2-10', '2023-12-06', '08:50 am', '2332.50', '2400.00', '67.50', 1, 2, 1, 1),
(16, 'E3C4J0F7M6-11', '2023-12-06', '02:38 pm', '85.50', '100.00', '14.50', 1, 1, 1, 1),
(17, 'C1H0K1M2H5-12', '2023-12-06', '04:56 pm', '4250.00', '4300.00', '50.00', 1, 1, 1, 1),
(18, 'D0P1C6D5K8-13', '2023-12-07', '08:36 am', '850.00', '860.00', '10.00', 1, 1, 1, 1),
(19, 'C2G5M4U9A3-14', '2023-12-15', '02:17 pm', '855.00', '900.00', '45.00', 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venta_detalle_id` int(100) NOT NULL,
  `venta_detalle_cantidad` int(10) NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(2, 1, '150.86', '350.00', '350.00', 'Cemento Canal', 'P7Z3O9C8I2-2', 2),
(3, 1, '150.86', '350.00', '350.00', 'Cemento Canal', 'O4W9P9U8F8-3', 2),
(4, 10, '150.36', '350.96', '3509.60', 'Hierro corrabado', 'U4U2I8J8K4-4', 3),
(5, 1, '150.36', '350.96', '350.96', 'Hierro corrabado', 'H7J0F3H1H7-5', 3),
(6, 5, '150.36', '350.96', '1754.80', 'Hierro corrabado', 'C6R0Q5W2M0-6', 3),
(7, 5, '0.10', '0.25', '1.25', 'Aceite', 'H7E1Q6W2Y2-7', 1),
(8, 3, '800.00', '850.00', '2550.00', 'Sandalia plataforma grande', 'P7M9T2Y9Q5-8', 5),
(15, 5, '150.86', '350.00', '1750.00', 'Cemento Canal', 'K5B4B4S7V1-8', 2),
(16, 3, '0.10', '0.25', '0.75', 'Aceite', 'K5B4B4S7V1-8', 1),
(17, 1, '800.00', '850.00', '850.00', 'Sandalia plataforma grande', 'K5B4B4S7V1-8', 5),
(18, 20, '150.36', '350.96', '7019.20', 'Hierro corrabado', 'S1K8H6L3I3-9', 3),
(19, 15, '45.36', '85.50', '1282.50', 'Aceite', 'D6K5P8E3R2-10', 1),
(20, 3, '150.86', '350.00', '1050.00', 'Cemento Canal', 'D6K5P8E3R2-10', 2),
(21, 1, '45.36', '85.50', '85.50', 'Aceite', 'E3C4J0F7M6-11', 1),
(22, 5, '800.00', '850.00', '4250.00', 'Sandalia plataforma grande', 'C1H0K1M2H5-12', 5),
(23, 1, '800.00', '850.00', '850.00', 'Sandalia plataforma grande', 'D0P1C6D5K8-13', 5),
(24, 10, '45.36', '85.50', '855.00', 'Aceite', 'C2G5M4U9A3-14', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`evento_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `producto_empresa_FK` (`empresa_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_menu`
--
ALTER TABLE `rol_menu`
  ADD PRIMARY KEY (`rol_menu_id`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `rol_opcion`
--
ALTER TABLE `rol_opcion`
  ADD PRIMARY KEY (`rolopcion_id`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_opcion` (`id_opcion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  ADD PRIMARY KEY (`usuario_empresa_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `evento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `rol_menu`
--
ALTER TABLE `rol_menu`
  MODIFY `rol_menu_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `rol_opcion`
--
ALTER TABLE `rol_opcion`
  MODIFY `rolopcion_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuario_empresa`
--
ALTER TABLE `usuario_empresa`
  MODIFY `usuario_empresa_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `opcion_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `rol_menu`
--
ALTER TABLE `rol_menu`
  ADD CONSTRAINT `rol_menu_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `rol_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `rol_opcion`
--
ALTER TABLE `rol_opcion`
  ADD CONSTRAINT `rol_opcion_ibfk_1` FOREIGN KEY (`id_opcion`) REFERENCES `opcion` (`id_opcion`),
  ADD CONSTRAINT `rol_opcion_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`),
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
