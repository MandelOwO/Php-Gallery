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
VALUES (25, 'Kočky', '2022-12-27 19:18:26', 'just kočky', '25_63b007a014c72.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_likes`
--

CREATE TABLE `tb_likes`
(
    `id`       int(11)    NOT NULL,
    `value`    tinyint(1) NOT NULL DEFAULT 1,
    `photo_id` int(11)    NOT NULL,
    `user`     int(11)             DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_photos`
--

CREATE TABLE `tb_photos`
(
    `id_photo`      int(11)                            NOT NULL,
    `original_name` varchar(270) COLLATE utf8_czech_ci NOT NULL,
    `unique_name`   varchar(270) COLLATE utf8_czech_ci NOT NULL,
    `extension`     varchar(10) COLLATE utf8_czech_ci  NOT NULL,
    `file_size`     int(11)                            NOT NULL,
    `title`         varchar(100) COLLATE utf8_czech_ci          DEFAULT NULL,
    `gallery_id`    int(11)                                     DEFAULT NULL,
    `created_at`    datetime                           NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

--
-- Dumping data for table `tb_photos`
--

INSERT INTO `tb_photos` (`id_photo`, `original_name`, `unique_name`, `extension`, `file_size`, `title`, `gallery_id`,
                         `created_at`)
VALUES (43, 'Untitled.png', '_63b305a1ce424', 'png', 130357, '', NULL, '2023-01-02 17:26:09'),
       (44, 'Untitled.png', '_63b305bb49609', 'png', 130357, '', NULL, '2023-01-02 17:26:35'),
       (45, 'Untitled.png', '_63b305d80b6c5', 'png', 130357, '', NULL, '2023-01-02 17:27:04'),
       (61, '1332010_20221204002620_1.png', '25_63b46fab41213', 'png', 3983634, '', 25, '2023-01-03 19:10:51'),
       (62, '1332010_20221204001954_1.png', '25_63b46fad7db50', 'png', 4379810, '', 25, '2023-01-03 19:10:53'),
       (63, '1332010_20221204001205_1.png', '25_63b46fb1d810d', 'png', 4712094, '', 25, '2023-01-03 19:10:57'),
       (65, '1332010_20221203235934_1.png', '25_63b46fbe88643', 'png', 2171721, '', 25, '2023-01-03 19:11:10'),
       (66, '1332010_20221203233912_1.png', '25_63b46fbfd8b3e', 'png', 4590211, '', 25, '2023-01-03 19:11:11'),
       (67, '1332010_20221203233534_1.png', '25_63b46fc0e1a55', 'png', 6011815, '', 25, '2023-01-03 19:11:12'),
       (69, '1332010_20221125231225_1.png', '25_63b46fc424d67', 'png', 3953308, '', 25, '2023-01-03 19:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ratings`
--

CREATE TABLE `tb_ratings`
(
    `id`       int(11) NOT NULL,
    `value`    float   NOT NULL,
    `photo_id` int(11) NOT NULL,
    `user`     int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
    ADD PRIMARY KEY (`id_gallery`);

--
-- Indexes for table `tb_likes`
--
ALTER TABLE `tb_likes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_likes_M-1_photos` (`photo_id`);

--
-- Indexes for table `tb_photos`
--
ALTER TABLE `tb_photos`
    ADD PRIMARY KEY (`id_photo`),
    ADD KEY `fk_photos_M-1_galleries` (`gallery_id`);

--
-- Indexes for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_ratings_M-1_photos` (`photo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
    MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 36;

--
-- AUTO_INCREMENT for table `tb_likes`
--
ALTER TABLE `tb_likes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 159;

--
-- AUTO_INCREMENT for table `tb_photos`
--
ALTER TABLE `tb_photos`
    MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 74;

--
-- AUTO_INCREMENT for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_likes`
--
ALTER TABLE `tb_likes`
    ADD CONSTRAINT `fk_likes_M-1_photos` FOREIGN KEY (`photo_id`) REFERENCES `tb_photos` (`id_photo`) ON DELETE CASCADE;

--
-- Constraints for table `tb_photos`
--
ALTER TABLE `tb_photos`
    ADD CONSTRAINT `fk_photos_M-1_galleries` FOREIGN KEY (`gallery_id`) REFERENCES `tb_galleries` (`id_gallery`) ON DELETE CASCADE;

--
-- Constraints for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
    ADD CONSTRAINT `fk_ratings_M-1_photos` FOREIGN KEY (`photo_id`) REFERENCES `tb_photos` (`id_photo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
