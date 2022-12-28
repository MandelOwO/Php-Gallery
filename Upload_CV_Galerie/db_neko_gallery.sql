-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 14. pro 2022, 12:34
-- Verze serveru: 10.4.6-MariaDB
-- Verze PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `db_neko_gallery`
--
DROP DATABASE IF EXISTS `db_neko_gallery`;
CREATE DATABASE IF NOT EXISTS `db_neko_gallery` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `db_neko_gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_galleries`
--

CREATE TABLE `tb_galleries`
(
    `id_gallery`  int(11)                            NOT NULL,
    `name`        varchar(50) COLLATE utf8_czech_ci  NOT NULL,
    `created_at`  datetime                           NOT NULL DEFAULT current_timestamp(),
    `description` varchar(2000) COLLATE utf8_czech_ci         DEFAULT NULL,
    `thumbnail`   varchar(100) COLLATE utf8_czech_ci NOT NULL DEFAULT 'thumb.png'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

--
-- Dumping data for table `tb_galleries`
--

INSERT INTO `tb_galleries` (`id_gallery`, `name`, `created_at`, `description`, `thumbnail`)
VALUES (25, 'Kočky', '2022-12-27 19:18:26', 'just kočky', 'thumb_Kočky_63ab36f22630e.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
    ADD PRIMARY KEY (`id_gallery`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
    MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
