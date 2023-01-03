-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 03. led 2023, 13:29
-- Verze serveru: 10.4.6-MariaDB
-- Verze PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `db_neko_gallery`
--
CREATE DATABASE IF NOT EXISTS `db_neko_gallery` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `db_neko_gallery`;

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_galleries`
--

CREATE TABLE IF NOT EXISTS `tb_galleries` (
  `id_gallery` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `description` varchar(2000) COLLATE utf8_czech_ci DEFAULT NULL,
  `thumbnail` varchar(100) COLLATE utf8_czech_ci NOT NULL DEFAULT 'thumb.png',
  PRIMARY KEY (`id_gallery`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `tb_galleries`
--

INSERT INTO `tb_galleries` (`id_gallery`, `name`, `created_at`, `description`, `thumbnail`) VALUES
(25, 'Kočky', '2022-12-27 19:18:26', 'just kočky', '25_63b007a014c72.png');

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_likes`
--

CREATE TABLE IF NOT EXISTS `tb_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` tinyint(1) NOT NULL DEFAULT 1,
  `photo_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_photos`
--

CREATE TABLE IF NOT EXISTS `tb_photos` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `original_name` varchar(270) COLLATE utf8_czech_ci NOT NULL,
  `unique_name` varchar(270) COLLATE utf8_czech_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_photo`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `tb_photos`
--

INSERT INTO `tb_photos` (`id_photo`, `original_name`, `unique_name`, `extension`, `file_size`, `title`, `gallery_id`, `created_at`) VALUES
(33, '1332010_20221204002620_1.png', '25_63b0077257932', 'png', 3983634, ':)', 25, '2022-12-31 10:57:06'),
(35, '1332010_20221204001205_1.png', '25_63b007875f6f7', 'png', 4712094, 'YO SPRINGTRAP', 25, '2022-12-31 10:57:27'),
(36, '1332010_20221203233912_1.png', '25_63b007944eff3', 'png', 4590211, ':(', 25, '2022-12-31 10:57:40'),
(37, '1332010_20221204001954_1.png', '25_63b00799f0dbc', 'png', 4379810, 'sleep', 25, '2022-12-31 10:57:45'),
(38, '1332010_20221203233534_1.png', '25_63b007a014c72', 'png', 6011815, 'sittin', 25, '2022-12-31 10:57:52'),
(43, 'Untitled.png', '_63b305a1ce424', 'png', 130357, '', NULL, '2023-01-02 17:26:09'),
(44, 'Untitled.png', '_63b305bb49609', 'png', 130357, '', NULL, '2023-01-02 17:26:35'),
(45, 'Untitled.png', '_63b305d80b6c5', 'png', 130357, '', NULL, '2023-01-02 17:27:04');

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_ratings`
--

CREATE TABLE IF NOT EXISTS `tb_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  `photo_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `tb_ratings`
--

INSERT INTO `tb_ratings` (`id`, `value`, `photo_id`, `user`) VALUES
(1, 3, 37, NULL),
(10, 5, 36, NULL),
(11, 3, 36, NULL),
(12, 4, 36, NULL),
(13, 1, 36, NULL),
(14, 2, 36, NULL),
(15, 3, 36, NULL),
(16, 2, 36, NULL),
(17, 5, 36, NULL),
(18, 5, 36, NULL),
(19, 5, 36, NULL),
(20, 4, 36, NULL),
(21, 5, 36, NULL),
(22, 4, 36, NULL),
(23, 4, 36, NULL),
(24, 4, 36, NULL),
(25, 5, 36, NULL),
(26, 5, 36, NULL),
(27, 5, 36, NULL),
(28, 5, 36, NULL),
(29, 5, 36, NULL),
(30, 5, 36, NULL),
(31, 5, 36, NULL),
(32, 5, 36, NULL),
(33, 5, 36, NULL),
(34, 5, 36, NULL),
(35, 2, 36, NULL),
(36, 1, 36, NULL),
(37, 1, 36, NULL),
(38, 1, 36, NULL),
(39, 1, 36, NULL),
(40, 1, 36, NULL),
(41, 1, 36, NULL),
(42, 1, 36, NULL),
(43, 5, 36, NULL),
(44, 5, 35, NULL),
(45, 4, 35, NULL),
(46, 1, 35, NULL),
(47, 1, 35, NULL),
(48, 1, 35, NULL),
(49, 1, 35, NULL),
(50, 1, 35, NULL),
(51, 1, 35, NULL),
(52, 3, 33, NULL),
(53, 4, 33, NULL),
(54, 4, 36, NULL),
(55, 3, 38, NULL),
(56, 5, 38, NULL),
(57, 5, 38, NULL),
(58, 1, 38, NULL),
(59, 1, 38, NULL),
(60, 1, 38, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
