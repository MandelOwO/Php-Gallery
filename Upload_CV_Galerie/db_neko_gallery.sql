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
-- Struktura tabulky `tb_galleries`
--

CREATE TABLE IF NOT EXISTS `tb_galleries`
(
    `id_gallery`  int(11)                            NOT NULL AUTO_INCREMENT,
    `name`        varchar(50) COLLATE utf8_czech_ci  NOT NULL,
    `created_at`  datetime                           NOT NULL DEFAULT current_timestamp(),
    `description` varchar(2000) COLLATE utf8_czech_ci         DEFAULT NULL,
    `thumbnail`   varchar(100) COLLATE utf8_czech_ci NOT NULL DEFAULT 'thumb.png',
    PRIMARY KEY (`id_gallery`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_likes`
--

CREATE TABLE IF NOT EXISTS `tb_likes`
(
    `id`       int(11)    NOT NULL AUTO_INCREMENT,
    `value`    tinyint(1) NOT NULL DEFAULT 1,
    `photo_id` int(11)    NOT NULL,
    `user`     int(11)             DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_photos`
--

CREATE TABLE IF NOT EXISTS `tb_photos`
(
    `id_photo`      int(11)                            NOT NULL AUTO_INCREMENT,
    `original_name` varchar(270) COLLATE utf8_czech_ci NOT NULL,
    `unique_name`   varchar(270) COLLATE utf8_czech_ci NOT NULL,
    `extension`     varchar(10) COLLATE utf8_czech_ci  NOT NULL,
    `file_size`     int(11)                            NOT NULL,
    `title`         varchar(100) COLLATE utf8_czech_ci          DEFAULT NULL,
    `description`   varchar(300) COLLATE utf8_czech_ci          DEFAULT NULL,
    `likes`         int(11)                            NOT NULL DEFAULT 0,
    `gallery_id`    int(11)                            NOT NULL,
    PRIMARY KEY (`id_photo`),
    KEY `fk_photos_M-1_galleries` (`gallery_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `tb_ratings`
--

CREATE TABLE IF NOT EXISTS `tb_ratings`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `value`    float   NOT NULL,
    `photo_id` int(11) NOT NULL,
    `user`     int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_ratings_M-1_photos` (`photo_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `tb_photos`
--
ALTER TABLE `tb_photos`
    ADD CONSTRAINT `fk_photos_M-1_galleries` FOREIGN KEY (`gallery_id`) REFERENCES `tb_galleries` (`id_gallery`);

--
-- Omezení pro tabulku `tb_ratings`
--
ALTER TABLE `tb_ratings`
    ADD CONSTRAINT `fk_ratings_M-1_photos` FOREIGN KEY (`photo_id`) REFERENCES `tb_photos` (`id_photo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
