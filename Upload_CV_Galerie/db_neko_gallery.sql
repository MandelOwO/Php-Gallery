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

--
-- Dumping data for table `tb_likes`
--

INSERT INTO `tb_likes` (`id`, `value`, `photo_id`, `user`)
VALUES (141, 1, 36, NULL),
       (142, 1, 36, NULL),
       (143, 1, 36, NULL);

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
VALUES (33, '1332010_20221204002620_1.png', '25_63b0077257932', 'png', 3983634, ':)', 25, '2022-12-31 10:57:06'),
       (35, '1332010_20221204001205_1.png', '25_63b007875f6f7', 'png', 4712094, 'YO SPRINGTRAP', 25,
        '2022-12-31 10:57:27'),
       (36, '1332010_20221203233912_1.png', '25_63b007944eff3', 'png', 4590211, ':(', 25, '2022-12-31 10:57:40'),
       (37, '1332010_20221204001954_1.png', '25_63b00799f0dbc', 'png', 4379810, 'sleep', 25, '2022-12-31 10:57:45'),
       (38, '1332010_20221203233534_1.png', '25_63b007a014c72', 'png', 6011815, 'sittin', 25, '2022-12-31 10:57:52'),
       (43, 'Untitled.png', '_63b305a1ce424', 'png', 130357, '', NULL, '2023-01-02 17:26:09'),
       (44, 'Untitled.png', '_63b305bb49609', 'png', 130357, '', NULL, '2023-01-02 17:26:35'),
       (45, 'Untitled.png', '_63b305d80b6c5', 'png', 130357, '', NULL, '2023-01-02 17:27:04');

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
-- Dumping data for table `tb_ratings`
--

INSERT INTO `tb_ratings` (`id`, `value`, `photo_id`, `user`)
VALUES (1, 3, 37, NULL),
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
    AUTO_INCREMENT = 34;

--
-- AUTO_INCREMENT for table `tb_likes`
--
ALTER TABLE `tb_likes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 149;

--
-- AUTO_INCREMENT for table `tb_photos`
--
ALTER TABLE `tb_photos`
    MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 49;

--
-- AUTO_INCREMENT for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 72;

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
