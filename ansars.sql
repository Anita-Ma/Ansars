-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2024 a las 05:47:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ansars`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL,
  `IdUsuariop` bigint(11) NOT NULL,
  `FechaPedido` date NOT NULL,
  `Destinatario` varchar(80) NOT NULL,
  `DireccionDestinatario` varchar(120) NOT NULL,
  `CiudadDestinatario` varchar(30) NOT NULL,
  `DetallesAdicionales` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL,
  `NombreProducto` varchar(80) NOT NULL,
  `PrecioUnidad` float NOT NULL,
  `UnidadesEnPedido` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Identificacion` bigint(20) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `TipoIden` char(2) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `rol` char(1) DEFAULT NULL,
  `Telefono` int(25) NOT NULL,
  `Ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Identificacion`, `Nombre`, `Apellido`, `TipoIden`, `Correo`, `Contraseña`, `rol`, `Telefono`, `Ciudad`) VALUES
(98765, 'Loren', 'Ospina', 'CC', 'loren@gmail.com', '$2b$10$3IW6oPSoeze84', 'A', 31256276, 'Bogotá'),
(238713, 'Andres', 'Calderon', 'CC', 'andres@gmail.com', '$2b$10$yDmTtxibThHMV', 'U', 34456787, 'Bogotá'),
(420537, 'Felipe', 'Rios', 'CC', 'feliper@gmail.com', '$2b$10$EMpPIOtdi2y/I', 'U', 35642485, 'Bogotá'),
(1084506, 'Ana', 'Niño', 'CC', 'ana@gmail.com', '$2b$10$FVYVYnSdmqPpJ', 'A', 45312253, 'Cali'),
(1234567, 'Sara', 'Gómez', 'TI', 'sara@gmail.com', '$2b$10$C6UNwqvWvO0Dj', 'A', 8901234, 'Bogotá'),
(4584345, 'Milena', 'Pinzon', 'CC', 'anita20@gmail.com', '$2b$10$qDZFrhUoh0ITc', 'A', 64858333, 'Cali'),
(43834743, 'Helena', 'Romero', 'CC', 'helena20@gmail.com', '$2b$10$D1UK21/yqC4Z7', 'U', 43949334, 'Bogotá');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `IdPedido` (`IdPedido`),
  ADD KEY `IdPedido_2` (`IdPedido`),
  ADD KEY `IdUsuariop` (`IdUsuariop`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Identificacion`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD UNIQUE KEY `Contraseña` (`Contraseña`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IdUsuariop`) REFERENCES `usuario` (`Identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
