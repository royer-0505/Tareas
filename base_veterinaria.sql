-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2026 a las 05:57:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_Pacientes` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_Pacientes`, `id_usuario`, `fecha`, `hora`, `motivo`, `estado`) VALUES
(1, 1, 1, '2026-04-10', '09:00:00', 'Consulta general', 'Pendiente'),
(2, 2, 1, '2026-04-10', '09:30:00', 'Vacunacion', 'Completada'),
(3, 3, 1, '2026-04-10', '10:00:00', 'Problema dermatologico', 'Pendiente'),
(4, 4, 1, '2026-04-10', '10:30:00', 'Desparasitacion', 'Completada'),
(5, 5, 1, '2026-04-10', '11:00:00', 'Revision de fractura', 'Pendiente'),
(6, 6, 1, '2026-04-10', '11:30:00', 'Otitis', 'Completada'),
(7, 7, 1, '2026-04-10', '12:00:00', 'Chequeo general', 'Pendiente'),
(8, 8, 1, '2026-04-10', '12:30:00', 'Vacunacion anual', 'Completada'),
(9, 9, 1, '2026-04-11', '09:00:00', 'Control de peso', 'Pendiente'),
(10, 10, 1, '2026-04-11', '09:30:00', 'Infeccion ocular', 'Pendiente'),
(11, 11, 1, '2026-04-11', '10:00:00', 'Dolor articular', 'Pendiente'),
(12, 12, 1, '2026-04-11', '10:30:00', 'Chequeo general', 'Completada'),
(13, 13, 1, '2026-04-11', '11:00:00', 'Gripe canina', 'Pendiente'),
(14, 14, 1, '2026-04-11', '11:30:00', 'Limpieza dental', 'Pendiente'),
(15, 15, 1, '2026-04-11', '12:00:00', 'Aplicacion de suero', 'Completada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_Clientes` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `Fecha_registro` date DEFAULT NULL,
  `telefono2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id_Clientes`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono1`, `email`, `direccion`, `Fecha_registro`, `telefono2`) VALUES
(1, 'Carlos', 'Lopez', 'Martinez', '932140303', 'carlos1@gmail.com', 'Centro, Oaxaca', '2026-01-10', '9512221111'),
(2, 'Maria', 'Perez', 'Gomez', '932467888', 'maria2@gmail.com', 'Reforma, Oaxaca', '2026-01-11', '9512221112'),
(3, 'Juan', 'Hernandez', 'Ruiz', '931189653', 'juan3@gmail.com', 'Juarez, Oaxaca', '2026-01-12', '9512221113'),
(4, 'Ana', 'Garcia', 'Torres', '93117814', 'ana4@gmail.com', 'Centro, Puebla', '2026-01-13', '9512221114'),
(5, 'Luis', 'Ramirez', 'Flores', '9324571115', 'luis5@gmail.com', 'Roma, CDMX', '2026-01-14', '9512221115'),
(6, 'Sofia', 'Sanchez', 'Diaz', '93256816', 'sofia6@gmail.com', 'Norte, Oaxaca', '2026-01-15', '9512221116'),
(7, 'Miguel', 'Castro', 'Vega', '93245687', 'miguel7@gmail.com', 'Sur, Oaxaca', '2026-01-16', '9512221117'),
(8, 'Elena', 'Morales', 'Cruz', '932456808', 'elena8@gmail.com', 'Centro, Veracruz', '2026-01-17', '9512221118'),
(9, 'Pedro', 'Jimenez', 'Rios', '93214567890', 'pedro9@gmail.com', 'Centro, Oaxaca', '2026-01-18', '9512221119'),
(10, 'Lucia', 'Navarro', 'Silva', '9321234569', 'lucia10@gmail.com', 'Del Valle, CDMX', '2026-01-19', '9512221120'),
(11, 'Jorge', 'Ortega', 'Reyes', '9324568821', 'jorge11@gmail.com', 'Centro, Oaxaca', '2026-01-20', '9512221121'),
(12, 'Daniela', 'Mendoza', 'Campos', '9532456722', 'daniela12@gmail.com', 'Reforma, Oaxaca', '2026-01-21', '9512221122'),
(13, 'Ricardo', 'Vargas', 'Luna', '932456723', 'ricardo13@gmail.com', 'Centro, Puebla', '2026-01-22', '9512221123'),
(14, 'Fernanda', 'Cortes', 'Nava', '9324567904', 'fernanda14@gmail.com', 'Centro, Oaxaca', '2026-01-23', '9512221124'),
(15, 'Jose', 'Herrera', 'Mora', '9325456725', 'jose15@gmail.com', 'Norte, Oaxaca', '2026-01-24', '9512221125'),
(16, 'Valeria', 'Aguilar', 'Pineda', '9511111126', 'valeria16@gmail.com', 'Sur, Oaxaca', '2026-01-25', '9512221126'),
(17, 'Raul', 'Delgado', 'Salas', '9511111127', 'raul17@gmail.com', 'Centro, Oaxaca', '2026-01-26', '9512221127'),
(18, 'Patricia', 'Fuentes', 'Mejia', '9324567898', 'patricia18@gmail.com', 'Centro, Veracruz', '2026-01-27', '9512221128'),
(19, 'Diego', 'Rojas', 'Campos', '99359769869', 'diego19@gmail.com', 'Juarez, Oaxaca', '2026-01-28', '9512221129'),
(20, 'Camila', 'Paz', 'Cruz', '9935678950', 'camila20@gmail.com', 'Centro, Oaxaca', '2026-01-29', '9512221130'),
(21, 'Eduardo', 'Leon', 'Soto', '9511111131', 'eduardo21@gmail.com', 'Centro, Oaxaca', '2026-01-30', '9512221131'),
(22, 'Gabriela', 'Molina', 'Ramos', '93245989032', 'gabriela22@gmail.com', 'Roma, CDMX', '2026-02-01', '9512221132'),
(23, 'Andres', 'Salazar', 'Ruiz', '9324567933', 'andres23@gmail.com', 'Centro, Oaxaca', '2026-02-02', '9512221133'),
(24, 'Paola', 'Nuñez', 'Flores', '99345678034', 'paola24@gmail.com', 'Centro, Oaxaca', '2026-02-03', '9512221134'),
(25, 'Fernando', 'Vega', 'Lara', '9324567835', 'fernando25@gmail.com', 'Norte, Oaxaca', '2026-02-04', '9512221135'),
(26, 'Monica', 'Cabrera', 'Diaz', '932456736', 'monica26@gmail.com', 'Centro, Puebla', '2026-02-05', '9512221136'),
(27, 'Oscar', 'Campos', 'Reyes', '932456837', 'oscar27@gmail.com', 'Centro, Oaxaca', '2026-02-06', '9512221137'),
(28, 'Andrea', 'Pineda', 'Lopez', '9511111138', 'andrea28@gmail.com', 'Sur, Oaxaca', '2026-02-07', '9512221138'),
(29, 'Victor', 'Silva', 'Mora', '9324567889', 'victor29@gmail.com', 'Centro, Oaxaca', '2026-02-08', '9512221139'),
(30, 'Natalia', 'Ramos', 'Torres', '932456789', 'natali324567a30@gmail.com', 'Centro, Veracruz', '2026-02-09', '9512221140'),
(31, 'Hugo', 'Cruz', 'Garcia', '932678356', 'hugo31@gmail.com', 'Juarez, Oaxaca', '2026-02-10', '9512221141'),
(32, 'Karla', 'Flores', 'Perez', '932456142', 'karla32@gmail.com', 'Centro, Oaxaca', '2026-02-11', '9512221142'),
(33, 'Martin', 'Soto', 'Jimenez', '9324563', 'martin33@gmail.com', 'Reforma, Oaxaca', '2026-02-12', '9512221143'),
(34, 'Alondra', 'Rios', 'Castro', '932456144', 'alondra34@gmail.com', 'Centro, Oaxaca', '2026-02-13', '9512221144'),
(35, 'Ivan', 'Mora', 'Ruiz', '932456845', 'ivan35@gmail.com', 'Centro, Puebla', '2026-02-14', '9512221145');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_proveedor`, `fecha`, `total`) VALUES
(1, 1, '2026-03-01', 4500.00),
(2, 2, '2026-03-03', 3200.00),
(3, 3, '2026-03-05', 7800.00),
(4, 4, '2026-03-07', 5200.00),
(5, 5, '2026-03-09', 6100.00),
(6, 1, '2026-03-11', 3900.00),
(7, 2, '2026-03-13', 4500.00),
(8, 3, '2026-03-15', 7300.00),
(9, 4, '2026-03-17', 2800.00),
(10, 5, '2026-03-19', 6400.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consultas` int(11) NOT NULL,
  `id_historial` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `costos` decimal(10,2) DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consultas`, `id_historial`, `fecha`, `costos`, `notas`) VALUES
(1, 1, '2026-01-15', 350.00, 'Consulta general y medicamentos'),
(2, 2, '2026-01-18', 500.00, 'Revision y antibioticos'),
(3, 3, '2026-01-20', 420.00, 'Tratamiento dermatologico'),
(4, 4, '2026-01-25', 250.00, 'Desparasitacion completa'),
(5, 5, '2026-01-28', 1200.00, 'Radiografia y consulta'),
(6, 6, '2026-02-01', 380.00, 'Consulta y gotas'),
(7, 7, '2026-02-03', 450.00, 'Vitaminas y analisis'),
(8, 8, '2026-02-05', 350.00, 'Vacunacion anual'),
(9, 9, '2026-02-06', 300.00, 'Control alimenticio'),
(10, 10, '2026-02-08', 400.00, 'Medicamento oftalmico'),
(11, 11, '2026-02-10', 650.00, 'Revision especializada'),
(12, 12, '2026-02-11', 250.00, 'Chequeo rutinario'),
(13, 13, '2026-02-13', 550.00, 'Tratamiento respiratorio'),
(14, 14, '2026-02-15', 900.00, 'Limpieza dental'),
(15, 15, '2026-02-16', 700.00, 'Aplicacion de suero'),
(16, 16, '2026-02-18', 420.00, 'Consulta por alergia'),
(17, 17, '2026-02-19', 500.00, 'Medicamento y revision'),
(18, 18, '2026-02-20', 250.00, 'Chequeo general'),
(19, 19, '2026-02-21', 380.00, 'Dieta y tratamiento'),
(20, 20, '2026-02-22', 450.00, 'Aplicacion de antibioticos'),
(21, 21, '2026-02-23', 300.00, 'Vacuna aplicada'),
(22, 22, '2026-02-24', 350.00, 'Baño antipulgas'),
(23, 23, '2026-02-25', 1200.00, 'Radiografia y vendaje'),
(24, 24, '2026-02-26', 850.00, 'Limpieza dental'),
(25, 25, '2026-02-27', 550.00, 'Tratamiento respiratorio'),
(26, 1, '2026-03-01', 300.00, 'Consulta de seguimiento'),
(27, 2, '2026-03-02', 350.00, 'Revision general'),
(28, 3, '2026-03-03', 420.00, 'Control dermatologico'),
(29, 4, '2026-03-04', 250.00, 'Nueva desparasitacion'),
(30, 5, '2026-03-05', 500.00, 'Revisión de fractura'),
(31, 6, '2026-03-06', 380.00, 'Control de otitis'),
(32, 7, '2026-03-07', 450.00, 'Aplicacion de vitaminas'),
(33, 8, '2026-03-08', 350.00, 'Refuerzo de vacuna'),
(34, 9, '2026-03-09', 300.00, 'Control de peso'),
(35, 10, '2026-03-10', 400.00, 'Revision ocular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_Productos` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id_detalle_compra`, `id_compra`, `id_Productos`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 10, 450.00),
(2, 1, 2, 5, 780.00),
(3, 2, 3, 10, 320.00),
(4, 2, 4, 15, 210.00),
(5, 3, 5, 20, 180.00),
(6, 3, 10, 5, 650.00),
(7, 4, 11, 10, 240.00),
(8, 4, 12, 15, 130.00),
(9, 5, 13, 8, 380.00),
(10, 5, 14, 10, 150.00),
(11, 6, 15, 12, 210.00),
(12, 6, 16, 20, 110.00),
(13, 7, 17, 30, 75.00),
(14, 7, 18, 5, 450.00),
(15, 8, 19, 6, 550.00),
(16, 8, 20, 10, 220.00),
(17, 9, 21, 4, 1450.00),
(18, 9, 22, 40, 35.00),
(19, 10, 23, 35, 40.00),
(20, 10, 24, 20, 95.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `Id_Clientes` int(11) DEFAULT NULL,
  `id_Productos` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `Id_Clientes`, `id_Productos`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 1, 1, 450.00),
(2, 2, 2, 3, 1, 320.00),
(3, 3, 3, 2, 1, 780.00),
(4, 4, 4, 4, 1, 210.00),
(5, 5, 5, 5, 1, 180.00),
(6, 6, 6, 10, 1, 650.00),
(7, 7, 7, 11, 1, 240.00),
(8, 8, 8, 12, 1, 130.00),
(9, 9, 9, 13, 1, 380.00),
(10, 10, 10, 14, 1, 150.00),
(11, 11, 11, 15, 1, 210.00),
(12, 12, 12, 16, 1, 110.00),
(13, 13, 13, 17, 1, 75.00),
(14, 14, 14, 18, 1, 450.00),
(15, 15, 15, 19, 1, 550.00),
(16, 16, 16, 20, 1, 220.00),
(17, 17, 17, 21, 1, 1450.00),
(18, 18, 18, 22, 1, 35.00),
(19, 19, 19, 23, 1, 40.00),
(20, 20, 20, 24, 1, 95.00),
(21, 21, 21, 25, 1, 85.00),
(22, 22, 22, 26, 1, 140.00),
(23, 23, 23, 27, 1, 125.00),
(24, 24, 24, 28, 1, 160.00),
(25, 25, 25, 29, 1, 70.00),
(26, 26, 26, 30, 1, 280.00),
(27, 27, 27, 31, 1, 150.00),
(28, 28, 28, 32, 1, 45.00),
(29, 29, 29, 33, 1, 60.00),
(30, 30, 30, 34, 1, 180.00),
(31, 31, 31, 35, 1, 210.00),
(32, 32, 32, 36, 1, 190.00),
(33, 33, 33, 37, 1, 230.00),
(34, 34, 34, 38, 1, 160.00),
(35, 35, 35, 39, 1, 850.00),
(36, 36, 1, 40, 1, 260.00),
(37, 37, 2, 1, 1, 450.00),
(38, 38, 3, 3, 1, 320.00),
(39, 39, 4, 2, 1, 780.00),
(40, 40, 5, 4, 1, 210.00),
(41, 41, 6, 5, 1, 180.00),
(42, 42, 7, 10, 1, 650.00),
(43, 43, 8, 11, 1, 240.00),
(44, 44, 9, 12, 1, 130.00),
(45, 45, 10, 13, 1, 380.00),
(46, 46, 11, 14, 1, 150.00),
(47, 47, 12, 15, 1, 210.00),
(48, 48, 13, 16, 1, 110.00),
(49, 49, 14, 17, 1, 75.00),
(50, 50, 15, 18, 1, 450.00),
(51, 51, 16, 19, 1, 550.00),
(52, 52, 17, 20, 1, 220.00),
(53, 53, 18, 21, 1, 1450.00),
(54, 54, 19, 22, 1, 35.00),
(55, 55, 20, 23, 1, 40.00),
(56, 56, 21, 24, 1, 95.00),
(57, 57, 22, 25, 1, 85.00),
(58, 58, 23, 26, 1, 140.00),
(59, 59, 24, 27, 1, 125.00),
(60, 60, 25, 28, 1, 160.00),
(61, 61, 26, 29, 1, 70.00),
(62, 62, 27, 30, 1, 280.00),
(63, 63, 28, 31, 1, 150.00),
(64, 64, 29, 32, 1, 45.00),
(65, 65, 30, 33, 1, 60.00),
(66, 66, 31, 34, 1, 180.00),
(67, 67, 32, 35, 1, 210.00),
(68, 68, 33, 36, 1, 190.00),
(69, 69, 34, 37, 1, 230.00),
(70, 70, 35, 38, 1, 160.00),
(71, 71, 1, 39, 1, 850.00),
(72, 72, 2, 40, 1, 260.00),
(73, 73, 3, 1, 1, 450.00),
(74, 74, 4, 3, 1, 320.00),
(75, 75, 5, 2, 1, 780.00),
(76, 76, 6, 4, 1, 210.00),
(77, 77, 7, 5, 1, 180.00),
(78, 78, 8, 10, 1, 650.00),
(79, 79, 9, 11, 1, 240.00),
(80, 80, 10, 12, 1, 130.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE `historial_medico` (
  `id_historial` int(11) NOT NULL,
  `id_Pacientes` int(11) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_medico`
--

INSERT INTO `historial_medico` (`id_historial`, `id_Pacientes`, `fecha_apertura`, `diagnostico`, `tratamiento`, `observaciones`) VALUES
(1, 1, '2026-01-15', 'Gastritis leve', 'Medicamento y dieta blanda', 'Paciente estable'),
(2, 2, '2026-01-18', 'Infeccion respiratoria', 'Antibiotico por 7 dias', 'Mejorando'),
(3, 3, '2026-01-20', 'Dermatitis', 'Shampoo medicado', 'Sin complicaciones'),
(4, 4, '2026-01-25', 'Parásitos intestinales', 'Desparasitacion', 'Control en 15 dias'),
(5, 5, '2026-01-28', 'Fractura menor', 'Reposo y analgesicos', 'Requiere seguimiento'),
(6, 6, '2026-02-01', 'Otitis', 'Gotas antibioticas', 'En tratamiento'),
(7, 7, '2026-02-03', 'Anemia', 'Vitaminas y suplemento', 'Recuperacion favorable'),
(8, 8, '2026-02-05', 'Vacunacion anual', 'Aplicacion completa', 'Paciente sano'),
(9, 9, '2026-02-06', 'Obesidad', 'Dieta controlada', 'Reducir alimento'),
(10, 10, '2026-02-08', 'Infeccion ocular', 'Gotas oftalmicas', 'Mejoria visible'),
(11, 11, '2026-02-10', 'Problemas articulares', 'Antiinflamatorios', 'Reposo recomendado'),
(12, 12, '2026-02-11', 'Chequeo general', 'Sin tratamiento', 'Estado saludable'),
(13, 13, '2026-02-13', 'Gripe canina', 'Antibioticos', 'Aislamiento temporal'),
(14, 14, '2026-02-15', 'Problemas dentales', 'Limpieza dental', 'Programar revision'),
(15, 15, '2026-02-16', 'Deshidratacion', 'Suero intravenoso', 'Monitoreo continuo'),
(16, 16, '2026-02-18', 'Alergia en piel', 'Medicamento antihistaminico', 'Evitar ciertos alimentos'),
(17, 17, '2026-02-19', 'Dolor muscular', 'Antiinflamatorios', 'Reposo por 5 dias'),
(18, 18, '2026-02-20', 'Chequeo general', 'Sin tratamiento', 'Paciente estable'),
(19, 19, '2026-02-21', 'Problemas digestivos', 'Dieta especial', 'Mejorando'),
(20, 20, '2026-02-22', 'Infeccion leve', 'Antibioticos', 'Control en una semana'),
(21, 21, '2026-02-23', 'Vacunacion', 'Aplicacion de vacuna', 'Sin reacciones'),
(22, 22, '2026-02-24', 'Parasitos externos', 'Shampoo antipulgas', 'Baño medicado'),
(23, 23, '2026-02-25', 'Fractura leve', 'Vendaje y reposo', 'En observacion'),
(24, 24, '2026-02-26', 'Problema dental', 'Limpieza dental', 'Programar seguimiento'),
(25, 25, '2026-02-27', 'Infeccion respiratoria', 'Antibioticos', 'Paciente delicado'),
(26, 30, '2026-05-21', 'Dolor de patita', 'Paracetamol', 'Mejora por cada hora'),
(27, 12, '2026-05-22', 'Presenta ligero dolor abdominal ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_Pacientes` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `sexo` enum('Macho','Hembra') DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `Id_Clientes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_Pacientes`, `nombre`, `especie`, `raza`, `sexo`, `fecha_nacimiento`, `peso`, `estado`, `Id_Clientes`) VALUES
(1, 'Max', 'Perro', 'Labrador', 'Macho', '2021-05-10', 28.50, 'Activo', 1),
(2, 'Luna', 'Gato', 'Siames', 'Hembra', '2022-03-11', 4.20, 'Activo', 2),
(3, 'Rocky', 'Perro', 'Pastor Aleman', 'Macho', '2020-01-15', 35.70, 'Activo', 3),
(4, 'Milo', 'Gato', 'Persa', 'Macho', '2021-07-20', 5.10, 'Activo', 4),
(5, 'Nala', 'Perro', 'Pug', 'Hembra', '2023-02-01', 8.40, 'Activo', 5),
(6, 'Toby', 'Perro', 'Chihuahua', 'Macho', '2022-08-10', 3.10, 'Activo', 6),
(7, 'Kiara', 'Gato', 'Angora', 'Hembra', '2021-09-12', 4.50, 'Activo', 7),
(8, 'Bruno', 'Perro', 'Bulldog', 'Macho', '2020-12-03', 22.60, 'Activo', 8),
(9, 'Coco', 'Perro', 'French Poodle', 'Hembra', '2023-04-18', 6.00, 'Activo', 9),
(10, 'Simba', 'Gato', 'Criollo', 'Macho', '2022-05-22', 4.80, 'Activo', 10),
(11, 'Zeus', 'Perro', 'Doberman', 'Macho', '2019-11-09', 40.00, 'Activo', 11),
(12, 'Mia', 'Gato', 'Bengala', 'Hembra', '2021-06-15', 5.00, 'Activo', 12),
(13, 'Thor', 'Perro', 'Husky', 'Macho', '2020-10-01', 30.40, 'Activo', 13),
(14, 'Lola', 'Perro', 'Beagle', 'Hembra', '2022-01-17', 12.30, 'Activo', 14),
(15, 'Pelusa', 'Conejo', 'Mini Lop', 'Hembra', '2023-02-20', 2.10, 'Activo', 15),
(16, 'Daisy', 'Perro', 'Golden Retriever', 'Hembra', '2021-03-08', 29.20, 'Activo', 16),
(17, 'Rex', 'Perro', 'Rottweiler', 'Macho', '2019-08-14', 45.60, 'Activo', 17),
(18, 'Tom', 'Gato', 'Criollo', 'Macho', '2020-09-10', 5.20, 'Activo', 18),
(19, 'Canela', 'Perro', 'Mestizo', 'Hembra', '2022-04-09', 14.30, 'Activo', 19),
(20, 'Bunny', 'Conejo', 'Cabeza de Leon', 'Hembra', '2023-05-12', 1.80, 'Activo', 20),
(21, 'Oreo', 'Gato', 'Siames', 'Macho', '2021-01-21', 4.60, 'Activo', 21),
(22, 'Firulais', 'Perro', 'Mestizo', 'Macho', '2020-06-13', 18.00, 'Activo', 22),
(23, 'Masha', 'Perro', 'Pomerania', 'Hembra', '2022-09-01', 4.10, 'Activo', 23),
(24, 'Garfield', 'Gato', 'Persa', 'Macho', '2019-12-30', 6.30, 'Activo', 24),
(25, 'Blue', 'Perro', 'Husky', 'Macho', '2021-11-11', 31.20, 'Activo', 25),
(26, 'Nieves', 'Gato', 'Angora', 'Hembra', '2022-03-04', 4.40, 'Activo', 26),
(27, 'Apolo', 'Perro', 'Pitbull', 'Macho', '2020-07-19', 26.50, 'Activo', 27),
(28, 'Lili', 'Perro', 'Poodle', 'Hembra', '2023-01-01', 5.30, 'Activo', 28),
(29, 'Benji', 'Perro', 'Cocker Spaniel', 'Macho', '2021-04-14', 13.20, 'Activo', 29),
(30, 'Mimi', 'Gato', 'Criollo', 'Hembra', '2020-05-10', 4.70, 'Activo', 30),
(31, 'Rambo', 'Perro', 'Boxer', 'Macho', '2019-10-20', 32.40, 'Activo', 31),
(32, 'Nube', 'Conejo', 'Holandes', 'Hembra', '2023-03-03', 2.00, 'Activo', 32),
(33, 'Sol', 'Perro', 'Mestizo', 'Hembra', '2022-06-18', 15.00, 'Activo', 33),
(34, 'Leo', 'Gato', 'Bengala', 'Macho', '2021-02-22', 5.50, 'Activo', 34),
(35, 'Spike', 'Perro', 'Bulldog', 'Macho', '2020-11-25', 24.10, 'Activo', 35),
(36, 'Candy', 'Perro', 'Chihuahua', 'Hembra', '2023-04-08', 2.80, 'Activo', 1),
(37, 'Tiger', 'Gato', 'Siames', 'Macho', '2022-08-15', 4.30, 'Activo', 2),
(38, 'Bethoven', 'Perro', 'San Bernardo', 'Macho', '2018-07-07', 60.50, 'Activo', 3),
(39, 'Princesa', 'Perro', 'French Poodle', 'Hembra', '2021-09-29', 6.20, 'Activo', 4),
(40, 'Copito', 'Conejo', 'Mini Rex', 'Macho', '2023-05-01', 1.90, 'Activo', 5),
(41, 'Lucy', 'Perro', 'Pitbul', NULL, '2026-04-30', NULL, 'Activo', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_Productos` int(11) NOT NULL,
  `nombre_productos` varchar(150) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `peso_medida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_Productos`, `nombre_productos`, `categoria`, `precio`, `stock`, `estado`, `peso_medida`) VALUES
(1, 'Croquetas Dog Chow 5kg', 'Alimento', 450.00, 20, 'Activo', '5 kg'),
(2, 'Croquetas Pedigree 10kg', 'Alimento', 780.00, 15, 'Activo', '10 kg'),
(3, 'Croquetas Whiskas 3kg', 'Alimento', 320.00, 18, 'Activo', '3 kg'),
(4, 'Arena para gato 10kg', 'Higiene', 210.00, 25, 'Activo', '10 kg'),
(5, 'Shampoo antipulgas', 'Higiene', 180.00, 30, 'Activo', '500 ml'),
(6, 'Jabon medicinal', 'Higiene', 95.00, 40, 'Activo', '150 g'),
(7, 'Correa para perro', 'Accesorios', 150.00, 35, 'Activo', '1 pieza'),
(8, 'Collar mediano', 'Accesorios', 120.00, 28, 'Activo', '1 pieza'),
(9, 'Plato de acero', 'Accesorios', 90.00, 22, 'Activo', '1 pieza'),
(10, 'Transportadora pequeña', 'Accesorios', 650.00, 10, 'Activo', '1 pieza'),
(11, 'Vitaminas caninas', 'Medicamento', 240.00, 16, 'Activo', '100 ml'),
(12, 'Desparasitante oral', 'Medicamento', 130.00, 20, 'Activo', '20 ml'),
(13, 'Antibiotico veterinario', 'Medicamento', 380.00, 12, 'Activo', '50 ml'),
(14, 'Gotas para ojos', 'Medicamento', 150.00, 14, 'Activo', '15 ml'),
(15, 'Spray cicatrizante', 'Medicamento', 210.00, 11, 'Activo', '250 ml'),
(16, 'Juguete mordedera', 'Juguetes', 110.00, 27, 'Activo', '1 pieza'),
(17, 'Pelota para perro', 'Juguetes', 75.00, 32, 'Activo', '1 pieza'),
(18, 'Rascador para gato', 'Juguetes', 450.00, 8, 'Activo', '1 pieza'),
(19, 'Cama mediana', 'Accesorios', 550.00, 9, 'Activo', '1 pieza'),
(20, 'Pechera ajustable', 'Accesorios', 220.00, 17, 'Activo', '1 pieza'),
(21, 'Croquetas Nupec 20kg', 'Alimento', 1450.00, 7, 'Activo', '20 kg'),
(22, 'Lata de alimento gato', 'Alimento', 35.00, 60, 'Activo', '85 g'),
(23, 'Lata de alimento perro', 'Alimento', 40.00, 55, 'Activo', '100 g'),
(24, 'Premios caninos', 'Snacks', 95.00, 30, 'Activo', '500 g'),
(25, 'Premios felinos', 'Snacks', 85.00, 25, 'Activo', '300 g'),
(26, 'Cepillo para mascota', 'Higiene', 140.00, 18, 'Activo', '1 pieza'),
(27, 'Corta uñas', 'Higiene', 125.00, 20, 'Activo', '1 pieza'),
(28, 'Perfume canino', 'Higiene', 160.00, 13, 'Activo', '250 ml'),
(29, 'Suero oral veterinario', 'Medicamento', 70.00, 24, 'Activo', '500 ml'),
(30, 'Termometro digital', 'Equipo', 280.00, 6, 'Activo', '1 pieza'),
(31, 'Guantes desechables', 'Equipo', 150.00, 50, 'Activo', 'Caja'),
(32, 'Venda elastica', 'Medicamento', 45.00, 70, 'Activo', '5 m'),
(33, 'Gasas esteriles', 'Medicamento', 60.00, 80, 'Activo', 'Paquete'),
(34, 'Bozal mediano', 'Accesorios', 180.00, 14, 'Activo', '1 pieza'),
(35, 'Bozal grande', 'Accesorios', 210.00, 10, 'Activo', '1 pieza'),
(36, 'Pipeta antipulgas', 'Medicamento', 190.00, 26, 'Activo', '5 ml'),
(37, 'Alimento para conejo', 'Alimento', 230.00, 12, 'Activo', '2 kg'),
(38, 'Heno para conejo', 'Alimento', 160.00, 15, 'Activo', '1 kg'),
(39, 'Jaula pequeña', 'Accesorios', 850.00, 5, 'Activo', '1 pieza'),
(40, 'Suplemento vitamínico', 'Medicamento', 260.00, 9, 'Activo', '120 ml');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_proveedores`
--

CREATE TABLE `productos_proveedores` (
  `id_relacion` int(11) NOT NULL,
  `id_Productos` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_proveedores`
--

INSERT INTO `productos_proveedores` (`id_relacion`, `id_Productos`, `id_proveedor`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4),
(12, 12, 4),
(13, 13, 5),
(14, 14, 5),
(15, 15, 5),
(16, 16, 1),
(17, 17, 1),
(18, 18, 2),
(19, 19, 2),
(20, 20, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_empresa` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_empresa`, `telefono`, `email`, `direccion`, `estado`) VALUES
(1, 'Distribuidora Animal Vet', '9325847123', 'contacto@animalvet.com', 'Centro, Villahermosa, Tabasco', 'Activo'),
(2, 'Mascotas del Sureste', '9327418569', 'ventas@mascotassureste.com', 'Jalapa, Tabasco', 'Activo'),
(3, 'Vet Pharma MX', '9323698741', 'info@vetpharma.com', 'Tuxtla Gutierrez, Chiapas', 'Activo'),
(4, 'Pet Food Premium', '9324587120', 'contacto@petfood.com', 'Centro, Tabasco', 'Activo'),
(5, 'Distribuciones Caninas', '9326201578', 'ventas@caninas.com', 'Comalcalco, Tabasco', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_Servicios` int(11) NOT NULL,
  `nombre_servicios` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_Servicios`, `nombre_servicios`, `descripcion`, `precio`, `estado`) VALUES
(1, 'Consulta general', 'Revision general de mascotas', 250.00, 'Activo'),
(2, 'Vacunacion', 'Aplicacion de vacunas', 350.00, 'Activo'),
(3, 'Desparasitacion', 'Control de parasitos', 180.00, 'Activo'),
(4, 'Cirugia menor', 'Procedimientos quirurgicos menores', 1500.00, 'Activo'),
(5, 'Esterilizacion', 'Operacion de esterilizacion', 2200.00, 'Activo'),
(6, 'Baño medicado', 'Baño especializado', 300.00, 'Activo'),
(7, 'Corte de uñas', 'Servicio de higiene', 120.00, 'Activo'),
(8, 'Limpieza dental', 'Higiene bucal', 900.00, 'Activo'),
(9, 'Rayos X', 'Radiografias veterinarias', 700.00, 'Activo'),
(10, 'Ultrasonido', 'Estudios de ultrasonido', 850.00, 'Activo'),
(11, 'Hospitalizacion', 'Cuidados intensivos', 1800.00, 'Activo'),
(12, 'Aplicacion de vitaminas', 'Vitaminas y suplementos', 250.00, 'Activo'),
(13, 'Consulta de emergencia', 'Atencion urgente', 500.00, 'Activo'),
(14, 'Control prenatal', 'Revision de gestacion', 600.00, 'Activo'),
(15, 'Microchip', 'Implantacion de chip', 950.00, 'Activo'),
(16, 'Peluqueria', 'Estetica canina y felina', 400.00, 'Activo'),
(17, 'Prueba de laboratorio', 'Analisis clinicos', 750.00, 'Activo'),
(18, 'Terapia fisica', 'Rehabilitacion animal', 650.00, 'Activo'),
(19, 'Vacuna antirrabica', 'Vacuna contra rabia', 200.00, 'Activo'),
(20, 'Cremacion', 'Servicio funerario', 3500.00, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas_rfid`
--

CREATE TABLE `tarjetas_rfid` (
  `id_tarjeta` int(11) NOT NULL,
  `uid_rfid` varchar(100) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `estado_tarjeta` varchar(50) DEFAULT NULL,
  `id_Pacientes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetas_rfid`
--

INSERT INTO `tarjetas_rfid` (`id_tarjeta`, `uid_rfid`, `fecha_asignacion`, `estado_tarjeta`, `id_Pacientes`) VALUES
(1, 'RFID1001A', '2026-04-01', 'Activa', 1),
(2, 'RFID1002B', '2026-04-01', 'Activa', 2),
(3, 'RFID1003C', '2026-04-01', 'Activa', 3),
(4, 'RFID1004D', '2026-04-01', 'Activa', 4),
(5, 'RFID1005E', '2026-04-02', 'Activa', 5),
(6, 'RFID1006F', '2026-04-02', 'Activa', 6),
(7, 'RFID1007G', '2026-04-02', 'Activa', 7),
(8, 'RFID1008H', '2026-04-02', 'Activa', 8),
(9, 'RFID1009I', '2026-04-03', 'Activa', 9),
(10, 'RFID1010J', '2026-04-03', 'Activa', 10),
(11, 'RFID1011K', '2026-04-03', 'Activa', 11),
(12, 'RFID1012L', '2026-04-03', 'Activa', 12),
(13, 'RFID1013M', '2026-04-04', 'Activa', 13),
(14, 'RFID1014N', '2026-04-04', 'Activa', 14),
(15, 'RFID1015O', '2026-04-04', 'Activa', 15),
(16, 'RFID1016P', '2026-04-04', 'Activa', 16),
(17, 'RFID1017Q', '2026-04-05', 'Activa', 17),
(18, 'RFID1018R', '2026-04-05', 'Activa', 18),
(19, 'RFID1019S', '2026-04-05', 'Activa', 19),
(20, 'RFID1020T', '2026-04-05', 'Activa', 20),
(21, 'RFID1021U', '2026-04-06', 'Activa', 21),
(22, 'RFID1022V', '2026-04-06', 'Activa', 22),
(23, 'RFID1023W', '2026-04-06', 'Activa', 23),
(24, 'RFID1024X', '2026-04-06', 'Activa', 24),
(25, 'RFID1025Y', '2026-04-07', 'Activa', 25),
(26, 'RFID1026Z', '2026-04-07', 'Activa', 26),
(27, 'RFID1027AA', '2026-04-07', 'Activa', 27),
(28, 'RFID1028BB', '2026-04-07', 'Activa', 28),
(29, 'RFID1029CC', '2026-04-08', 'Activa', 29),
(30, 'RFID1030DD', '2026-04-08', 'Activa', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('Veterinario','Recepcionista') NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `usuario`, `contraseña`, `rol`, `telefono`, `email`, `estado`) VALUES
(1, 'Sergio ', 'Ramirez ', 'Lopez', 'vet_sergio', 'Vet2026$', 'Veterinario', '9325847132', 'sergio.vet@gmail.com', 'Activo'),
(2, 'Fernanda', 'Gomez', 'Ruiz', 'recep_fernanda', 'Recep2026$', 'Recepcionista', '9327418560', 'fernanda.recep@gmail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `Id_Clientes` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `Id_Clientes`, `fecha_venta`, `total`, `metodo_pago`, `estado`) VALUES
(1, 1, '2026-03-01', 450.00, 'Efectivo', 'Completada'),
(2, 2, '2026-03-01', 320.00, 'Tarjeta', 'Completada'),
(3, 3, '2026-03-02', 780.00, 'Transferencia', 'Completada'),
(4, 4, '2026-03-02', 210.00, 'Efectivo', 'Completada'),
(5, 5, '2026-03-03', 180.00, 'Tarjeta', 'Completada'),
(6, 6, '2026-03-03', 650.00, 'Efectivo', 'Completada'),
(7, 7, '2026-03-04', 240.00, 'Transferencia', 'Completada'),
(8, 8, '2026-03-04', 130.00, 'Efectivo', 'Completada'),
(9, 9, '2026-03-05', 380.00, 'Tarjeta', 'Completada'),
(10, 10, '2026-03-05', 150.00, 'Efectivo', 'Completada'),
(11, 11, '2026-03-06', 210.00, 'Tarjeta', 'Completada'),
(12, 12, '2026-03-06', 110.00, 'Efectivo', 'Completada'),
(13, 13, '2026-03-07', 75.00, 'Transferencia', 'Completada'),
(14, 14, '2026-03-07', 450.00, 'Efectivo', 'Completada'),
(15, 15, '2026-03-08', 550.00, 'Tarjeta', 'Completada'),
(16, 16, '2026-03-08', 220.00, 'Efectivo', 'Completada'),
(17, 17, '2026-03-09', 1450.00, 'Transferencia', 'Completada'),
(18, 18, '2026-03-09', 35.00, 'Efectivo', 'Completada'),
(19, 19, '2026-03-10', 40.00, 'Tarjeta', 'Completada'),
(20, 20, '2026-03-10', 95.00, 'Efectivo', 'Completada'),
(21, 21, '2026-03-11', 85.00, 'Tarjeta', 'Completada'),
(22, 22, '2026-03-11', 140.00, 'Transferencia', 'Completada'),
(23, 23, '2026-03-12', 125.00, 'Efectivo', 'Completada'),
(24, 24, '2026-03-12', 160.00, 'Tarjeta', 'Completada'),
(25, 25, '2026-03-13', 70.00, 'Efectivo', 'Completada'),
(26, 26, '2026-03-13', 280.00, 'Transferencia', 'Completada'),
(27, 27, '2026-03-14', 150.00, 'Efectivo', 'Completada'),
(28, 28, '2026-03-14', 45.00, 'Tarjeta', 'Completada'),
(29, 29, '2026-03-15', 60.00, 'Efectivo', 'Completada'),
(30, 30, '2026-03-15', 180.00, 'Transferencia', 'Completada'),
(31, 31, '2026-03-16', 210.00, 'Tarjeta', 'Completada'),
(32, 32, '2026-03-16', 190.00, 'Efectivo', 'Completada'),
(33, 33, '2026-03-17', 230.00, 'Tarjeta', 'Completada'),
(34, 34, '2026-03-17', 160.00, 'Transferencia', 'Completada'),
(35, 35, '2026-03-18', 850.00, 'Efectivo', 'Completada'),
(36, 1, '2026-03-18', 260.00, 'Tarjeta', 'Completada'),
(37, 2, '2026-03-19', 450.00, 'Efectivo', 'Completada'),
(38, 3, '2026-03-19', 320.00, 'Transferencia', 'Completada'),
(39, 4, '2026-03-20', 780.00, 'Tarjeta', 'Completada'),
(40, 5, '2026-03-20', 210.00, 'Efectivo', 'Completada'),
(41, 6, '2026-03-21', 180.00, 'Tarjeta', 'Completada'),
(42, 7, '2026-03-21', 650.00, 'Efectivo', 'Completada'),
(43, 8, '2026-03-22', 240.00, 'Transferencia', 'Completada'),
(44, 9, '2026-03-22', 130.00, 'Tarjeta', 'Completada'),
(45, 10, '2026-03-23', 380.00, 'Efectivo', 'Completada'),
(46, 11, '2026-03-23', 150.00, 'Tarjeta', 'Completada'),
(47, 12, '2026-03-24', 210.00, 'Transferencia', 'Completada'),
(48, 13, '2026-03-24', 110.00, 'Efectivo', 'Completada'),
(49, 14, '2026-03-25', 75.00, 'Tarjeta', 'Completada'),
(50, 15, '2026-03-25', 450.00, 'Efectivo', 'Completada'),
(51, 16, '2026-03-26', 550.00, 'Transferencia', 'Completada'),
(52, 17, '2026-03-26', 220.00, 'Tarjeta', 'Completada'),
(53, 18, '2026-03-27', 1450.00, 'Efectivo', 'Completada'),
(54, 19, '2026-03-27', 35.00, 'Tarjeta', 'Completada'),
(55, 20, '2026-03-28', 40.00, 'Transferencia', 'Completada'),
(56, 21, '2026-03-28', 95.00, 'Efectivo', 'Completada'),
(57, 22, '2026-03-29', 85.00, 'Tarjeta', 'Completada'),
(58, 23, '2026-03-29', 140.00, 'Transferencia', 'Completada'),
(59, 24, '2026-03-30', 125.00, 'Efectivo', 'Completada'),
(60, 25, '2026-03-30', 160.00, 'Tarjeta', 'Completada'),
(61, 26, '2026-03-31', 70.00, 'Efectivo', 'Completada'),
(62, 27, '2026-03-31', 280.00, 'Transferencia', 'Completada'),
(63, 28, '2026-04-01', 150.00, 'Tarjeta', 'Completada'),
(64, 29, '2026-04-01', 45.00, 'Efectivo', 'Completada'),
(65, 30, '2026-04-02', 60.00, 'Tarjeta', 'Completada'),
(66, 31, '2026-04-02', 180.00, 'Transferencia', 'Completada'),
(67, 32, '2026-04-03', 210.00, 'Efectivo', 'Completada'),
(68, 33, '2026-04-03', 190.00, 'Tarjeta', 'Completada'),
(69, 34, '2026-04-04', 230.00, 'Efectivo', 'Completada'),
(70, 35, '2026-04-04', 160.00, 'Transferencia', 'Completada'),
(71, 1, '2026-04-05', 850.00, 'Tarjeta', 'Completada'),
(72, 2, '2026-04-05', 260.00, 'Efectivo', 'Completada'),
(73, 3, '2026-04-06', 450.00, 'Tarjeta', 'Completada'),
(74, 4, '2026-04-06', 320.00, 'Transferencia', 'Completada'),
(75, 5, '2026-04-07', 780.00, 'Efectivo', 'Completada'),
(76, 6, '2026-04-07', 210.00, 'Tarjeta', 'Completada'),
(77, 7, '2026-04-08', 180.00, 'Efectivo', 'Completada'),
(78, 8, '2026-04-08', 650.00, 'Transferencia', 'Completada'),
(79, 9, '2026-04-09', 240.00, 'Tarjeta', 'Completada'),
(80, 10, '2026-04-09', 130.00, 'Efectivo', 'Completada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_Pacientes` (`id_Pacientes`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Clientes`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consultas`),
  ADD KEY `id_historial` (`id_historial`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_Productos` (`id_Productos`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `Id_Clientes` (`Id_Clientes`),
  ADD KEY `id_Productos` (`id_Productos`);

--
-- Indices de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_Pacientes` (`id_Pacientes`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_Pacientes`),
  ADD KEY `Id_Clientes` (`Id_Clientes`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_Productos`);

--
-- Indices de la tabla `productos_proveedores`
--
ALTER TABLE `productos_proveedores`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_Productos` (`id_Productos`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_Servicios`);

--
-- Indices de la tabla `tarjetas_rfid`
--
ALTER TABLE `tarjetas_rfid`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD UNIQUE KEY `uid_rfid` (`uid_rfid`),
  ADD KEY `id_Pacientes` (`id_Pacientes`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `Id_Clientes` (`Id_Clientes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_Clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_Pacientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_Productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productos_proveedores`
--
ALTER TABLE `productos_proveedores`
  MODIFY `id_relacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_Servicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tarjetas_rfid`
--
ALTER TABLE `tarjetas_rfid`
  MODIFY `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_Pacientes`) REFERENCES `pacientes` (`id_Pacientes`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_historial`) REFERENCES `historial_medico` (`id_historial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`id_Productos`) REFERENCES `productos` (`id_Productos`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`Id_Clientes`) REFERENCES `clientes` (`Id_Clientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_3` FOREIGN KEY (`id_Productos`) REFERENCES `productos` (`id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`id_Pacientes`) REFERENCES `pacientes` (`id_Pacientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`Id_Clientes`) REFERENCES `clientes` (`Id_Clientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_proveedores`
--
ALTER TABLE `productos_proveedores`
  ADD CONSTRAINT `productos_proveedores_ibfk_1` FOREIGN KEY (`id_Productos`) REFERENCES `productos` (`id_Productos`),
  ADD CONSTRAINT `productos_proveedores_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `tarjetas_rfid`
--
ALTER TABLE `tarjetas_rfid`
  ADD CONSTRAINT `tarjetas_rfid_ibfk_1` FOREIGN KEY (`id_Pacientes`) REFERENCES `pacientes` (`id_Pacientes`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`Id_Clientes`) REFERENCES `clientes` (`Id_Clientes`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
