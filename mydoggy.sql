-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2023 a las 00:44:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydoggy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `DUENO` varchar(255) DEFAULT NULL,
  `MASCOTA` varchar(30) DEFAULT NULL,
  `EVENTO` varchar(100) NOT NULL,
  `FECHA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calendario`
--

INSERT INTO `calendario` (`DUENO`, `MASCOTA`, `EVENTO`, `FECHA`) VALUES
('camila', 'Azabache', 'Celebracion ', '2023-05-26'),
('Ana Maria', 'Lucas', 'Cita con veterinario', '2023-05-23'),
('johan', 'Trululu', 'Cita de juegos', '2023-06-02'),
('johan', 'Trululu', 'Esterilizacion', '2023-06-05'),
('Ana Maria', 'Lucas', 'Paseito', '2023-05-23'),
('gina', 'Tony', 'Paseo', '2023-05-27'),
('gina', 'Tony', 'Vacunas', '2023-05-26'),
('camila', 'Azabache', 'Viaje', '2023-05-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perros`
--

CREATE TABLE `perros` (
  `DUENO` varchar(20) DEFAULT NULL,
  `NOMBREM` varchar(20) NOT NULL,
  `RAZA` varchar(20) DEFAULT NULL,
  `EDAD` int(5) DEFAULT NULL,
  `VACUNA` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perros`
--

INSERT INTO `perros` (`DUENO`, `NOMBREM`, `RAZA`, `EDAD`, `VACUNA`) VALUES
('Camila', 'Azabache', 'Labrador', 7, 'Vacunado'),
('Ana Maria', 'Lucas', 'BoderCollie', 5, 'Vacunado'),
('gina', 'Tony', 'Criollo', 2, 'Sin vacunar'),
('johan', 'Trululu', 'chihuahua', 4, 'Vacunado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USUARIO` varchar(10) NOT NULL,
  `CONTRASENA` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USUARIO`, `CONTRASENA`) VALUES
('Ana Maria', '33333'),
('Camila', '99999'),
('Gina', '22222'),
('Johan', '11111'),
('nnn', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`EVENTO`);

--
-- Indices de la tabla `perros`
--
ALTER TABLE `perros`
  ADD PRIMARY KEY (`NOMBREM`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
