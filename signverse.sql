-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2025 a las 02:21:31
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
-- Base de datos: `signverse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
('BAR', 'Barranquilla', '2025-04-06 03:03:10', '2025-04-06 03:03:10'),
('BOG', 'Bogotá', '2025-04-06 03:03:10', '2025-04-06 03:03:10'),
('CAL', 'Cali', '2025-04-06 03:03:10', '2025-04-06 03:03:10'),
('MED', 'Medellín', '2025-04-06 03:03:10', '2025-04-06 03:03:10'),
('PER', 'Pereira', '2025-04-06 03:03:10', '2025-04-06 03:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `cod_genero` varchar(1) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`cod_genero`, `descripcion`) VALUES
('F', 'Femenino'),
('M', 'Masculino'),
('O', 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lib_autor`
--

CREATE TABLE `lib_autor` (
  `cod_autor` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cod_sexo_fk` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lib_tipou`
--

CREATE TABLE `lib_tipou` (
  `cod_tipo` varchar(1) NOT NULL,
  `nom_tipo` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lib_tipou`
--

INSERT INTO `lib_tipou` (`cod_tipo`, `nom_tipo`, `created_at`, `updated_at`) VALUES
('A', 'Administrador', NULL, NULL),
('C', 'Cliente', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2025_03_17_150930_create_lib_sexo_table', 1),
(3, '2025_03_21_144710_create_sessions_table', 1),
(4, '2025_04_01_145439_create_lib_autor_table', 1),
(5, '2025_04_03_150344_create_cache_table', 1),
(6, '2025_04_03_150457_create_lib_tipou_table', 1),
(7, '2025_04_03_150621_create_users_table', 1),
(11, '2025_04_05_211643_create_ciudades_table', 2),
(12, '2025_04_05_212108_create_tipos_documento_table', 2),
(13, '2025_04_05_212611_create_generos_table', 2),
(14, '2025_04_06_020916_add_cod_tipo_doc_fk_to_users_table', 3),
(15, '2025_04_06_030409_add_ciudad_id_to_users_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('smercado745@gmail.com', '$2y$12$Yuqrx08/tFOqzE4zBVIYOOr4YXZKCVxHoBQQk6.e/2rcTP6b7fryO', '2025-04-07 00:36:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ogzlv02mFkrsBBrAx16vHeCYfctsWYXmxGHNfGbU', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWm5abTBQUGFlUXBtYVpobUQyOXdKWDZQellCT1FGY3BCNE9QdU9OYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnRlL2FjdGl2aWRhZGVzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzQ0MDY2MTgzO319', 1744070663);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documento`
--

CREATE TABLE `tipos_documento` (
  `id` varchar(3) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_documento`
--

INSERT INTO `tipos_documento` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
('CC', 'Cédula de Ciudadanía', NULL, NULL),
('PE', 'Pasaporte Extranjero', NULL, NULL),
('TI', 'Tarjeta de Identidad', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cod_tipo_fk` varchar(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cod_tipo_doc_fk` varchar(3) DEFAULT NULL,
  `ciudad_id` varchar(3) DEFAULT NULL,
  `cod_genero_fk` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `num_id` varchar(20) NOT NULL,
  `name_2` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `lastname_2` varchar(50) DEFAULT NULL,
  `discapacidad_aud` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_naci` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `cod_tipo_fk`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `cod_tipo_doc_fk`, `ciudad_id`, `cod_genero_fk`, `num_id`, `name_2`, `lastname`, `lastname_2`, `discapacidad_aud`, `fecha_naci`) VALUES
(5, 'Juan Pérez', 'C', 'juanperez@example.com', NULL, '$2y$12$c/rQF27UKTDKEp/Jg5aZb.cnxmEsrdWFgcYR/1.0yV93T0D8f4IhW', NULL, '2025-04-06 07:19:09', '2025-04-06 07:19:09', 'CC', NULL, NULL, '', NULL, '', NULL, 0, NULL),
(6, 'Carlos Rodríguez', 'C', 'carlosrodriguez@example.com', NULL, '$2y$12$SENMeWsekkimQEWTRcM7juxS69oa8CPIw/3XJEe8bXW.GaQDphjsK', NULL, '2025-04-06 08:14:25', '2025-04-06 08:14:25', 'CC', 'BOG', NULL, '', NULL, '', NULL, 0, NULL),
(18, 'Sebastian', 'A', 'sebassmercado97@gmail.com', NULL, '$2y$12$plLvCWydOl4K/AK8pxDVCu6Ib54OPm99DTxjVUQ0pfXpELEjKrDqy', NULL, '2025-04-06 23:34:09', '2025-04-06 23:34:09', 'CC', 'BOG', NULL, '', NULL, '', NULL, 0, NULL),
(21, 'Sandra', 'C', 'smercado745@gmail.com', NULL, '$2y$12$2ZL/aXCMAoZR3MrcKfnfze4z7eoap3dZutYogAyleSm2skERCkz.i', NULL, '2025-04-07 02:14:40', '2025-04-07 02:14:40', 'CC', 'BOG', 'F', '123456788', 'Marian', 'Mercado', 'Mendez', 1, '2005-12-17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`cod_genero`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `lib_autor`
--
ALTER TABLE `lib_autor`
  ADD PRIMARY KEY (`cod_autor`),
  ADD KEY `lib_autor_cod_sexo_fk_foreign` (`cod_sexo_fk`);

--
-- Indices de la tabla `lib_tipou`
--
ALTER TABLE `lib_tipou`
  ADD PRIMARY KEY (`cod_tipo`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_cod_tipo_fk_foreign` (`cod_tipo_fk`),
  ADD KEY `users_cod_tipo_doc_fk_foreign` (`cod_tipo_doc_fk`),
  ADD KEY `users_ciudad_id_foreign` (`ciudad_id`),
  ADD KEY `users_cod_genero_fk_foreign` (`cod_genero_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lib_autor`
--
ALTER TABLE `lib_autor`
  MODIFY `cod_autor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ciudad_id_foreign` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`),
  ADD CONSTRAINT `users_cod_genero_fk_foreign` FOREIGN KEY (`cod_genero_fk`) REFERENCES `generos` (`cod_genero`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_cod_tipo_doc_fk_foreign` FOREIGN KEY (`cod_tipo_doc_fk`) REFERENCES `tipos_documento` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_cod_tipo_fk_foreign` FOREIGN KEY (`cod_tipo_fk`) REFERENCES `lib_tipou` (`cod_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
