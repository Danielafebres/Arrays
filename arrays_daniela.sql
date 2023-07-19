-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2023 a las 19:31:29
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arrays_daniela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calzado`
--

CREATE TABLE `calzado` (
  `codigo` int(11) NOT NULL,
  `calzado` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calzado`
--

INSERT INTO `calzado` (`codigo`, `calzado`, `tipo`, `modelo`, `marca`, `talla`, `precio`) VALUES
(1, 'Zapatillas', 'Deportivas', 'Air Max', 'Nike', '42', '120.50'),
(2, 'Botas', 'Casuales', 'Classic', 'Timberland', '40', '200.00'),
(3, 'Sandalias', 'Formales', 'Elegance', 'Clarks', '38', '79.99'),
(4, 'Zapatos', 'Formales', 'Oxford', 'Hugo Boss', '43', '250.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `edad`, `telefono`) VALUES
(123456789, 'Juan', 'Pérez', 30, '555-1234'),
(234567890, 'María', 'García', 25, '555-5678'),
(345678901, 'Pedro', 'Sánchez', 40, '555-2345'),
(456789012, 'Ana', 'Martínez', 45, '555-6789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_compras`
--

CREATE TABLE `registro_compras` (
  `id` int(11) NOT NULL,
  `codigo_calzado` int(11) DEFAULT NULL,
  `cedula_comprador` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_compras`
--

INSERT INTO `registro_compras` (`id`, `codigo_calzado`, `cedula_comprador`, `fecha`, `hora`) VALUES
(1, 1, 123456789, '2022-01-01', '10:00:00'),
(2, 2, 234567890, '2022-01-02', '11:00:00'),
(3, 3, 345678901, '2022-01-03', '12:00:00'),
(4, 4, 456789012, '2022-01-04', '13:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calzado`
--
ALTER TABLE `calzado`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `registro_compras`
--
ALTER TABLE `registro_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_calzado` (`codigo_calzado`),
  ADD KEY `cedula_comprador` (`cedula_comprador`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registro_compras`
--
ALTER TABLE `registro_compras`
  ADD CONSTRAINT `registro_compras_ibfk_1` FOREIGN KEY (`codigo_calzado`) REFERENCES `calzado` (`codigo`),
  ADD CONSTRAINT `registro_compras_ibfk_2` FOREIGN KEY (`cedula_comprador`) REFERENCES `personas` (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
