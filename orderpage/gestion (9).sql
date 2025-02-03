-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 10, 2023 alle 20:54
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `client`
--

CREATE TABLE `client` (
  `id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_1`
--

CREATE TABLE `client_1` (
  `id` int(50) NOT NULL,
  `Nom_Client` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `client_1`
--

INSERT INTO `client_1` (`id`, `Nom_Client`) VALUES
(131, 'mama'),
(132, 'mama'),
(133, 'hayat'),
(134, 'bobo'),
(135, 'bobo'),
(136, 'bobo'),
(137, 'bobo'),
(138, 'bibi'),
(139, 'zizo'),
(140, 'zizo'),
(141, 'zizo'),
(142, 'zizo'),
(143, 'zans'),
(144, 'zans'),
(145, 'ahmed'),
(146, 'hello the world'),
(147, 'hello the world'),
(148, 'hello the world'),
(149, 'hello the world'),
(150, 'hello the world'),
(151, 'Nou-rddine'),
(152, 'Nou-rddine'),
(153, 'Nou-rddine'),
(154, 'Nou-rddine');

-- --------------------------------------------------------

--
-- Struttura della tabella `command`
--

CREATE TABLE `command` (
  `id_command` int(50) NOT NULL,
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `GRAND_TOTAL` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `command`
--

INSERT INTO `command` (`id_command`, `id`, `date`, `GRAND_TOTAL`) VALUES
(100, 131, '2023-12-07', 5549885),
(101, 132, '2023-12-07', 5549885),
(102, 133, '2023-12-04', 54995),
(103, 134, '2023-12-04', 10003995),
(104, 135, '2023-12-04', 10003995),
(105, 136, '2023-12-04', 10003995),
(106, 137, '2023-12-04', 10003995),
(107, 138, '2023-12-04', 251415),
(108, 139, '2023-12-04', 251415),
(109, 140, '2023-12-04', 251415),
(110, 141, '2023-12-04', 251415),
(111, 142, '2023-12-04', 251415),
(112, 143, '2023-12-04', 251415),
(113, 144, '2023-12-04', 251415),
(114, 145, '2023-12-07', 643656),
(115, 146, '2023-12-20', 10),
(116, 147, '2023-12-20', 10),
(117, 148, '2023-12-20', 10),
(118, 149, '2023-12-20', 10),
(119, 150, '2023-12-20', 10),
(120, 151, '2023-12-06', 3320),
(121, 152, '2023-12-06', 3320),
(122, 153, '2023-12-06', 3320),
(123, 154, '2023-12-06', 3320);

-- --------------------------------------------------------

--
-- Struttura della tabella `lign_command`
--

CREATE TABLE `lign_command` (
  `id_lc` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_command` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lign_command`
--

INSERT INTO `lign_command` (`id_lc`, `id`, `id_command`) VALUES
(131, 134, 103),
(132, 134, 103),
(133, 135, 104),
(134, 135, 104),
(135, 136, 105),
(136, 136, 105),
(137, 137, 106),
(138, 138, 107),
(139, 138, 107),
(140, 139, 108),
(141, 140, 109),
(142, 141, 110),
(143, 142, 111),
(144, 143, 112),
(145, 144, 113),
(146, 145, 114),
(147, 145, 114),
(148, 146, 115),
(149, 147, 116),
(150, 148, 117),
(151, 149, 118),
(152, 150, 119),
(153, 151, 120),
(154, 151, 120),
(155, 151, 120),
(156, 151, 120),
(157, 151, 120),
(158, 152, 121),
(159, 152, 121),
(160, 152, 121),
(161, 152, 121),
(162, 152, 121),
(163, 153, 122),
(164, 153, 122),
(165, 153, 122),
(166, 153, 122),
(167, 153, 122),
(168, 154, 123),
(169, 154, 123),
(170, 154, 123),
(171, 154, 123),
(172, 154, 123);

-- --------------------------------------------------------

--
-- Struttura della tabella `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(50) NOT NULL,
  `id` int(11) NOT NULL,
  `Nom_produit` varchar(50) NOT NULL,
  `QTE` int(11) NOT NULL,
  `prix` double(10,2) NOT NULL,
  `TOTAL` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `produit`
--

INSERT INTO `produit` (`id_produit`, `id`, `Nom_produit`, `QTE`, `prix`, `TOTAL`) VALUES
(135, 132, 'Product2', 5, 88.00, 440.00),
(136, 132, 'Product3', 555, 9999.00, 5549445.00),
(137, 133, 'Product2', 999, 5.00, 4995.00),
(138, 133, 'Product3', 10000, 5.00, 50000.00),
(139, 134, 'Pizza', 999, 5.00, 4995.00),
(140, 134, 'Product3', 1000, 9999.00, 9999000.00),
(141, 134, 'Pizza', 999, 5.00, 4995.00),
(142, 134, 'Product3', 1000, 9999.00, 9999000.00),
(143, 135, 'Pizza', 999, 5.00, 4995.00),
(144, 135, 'Product3', 1000, 9999.00, 9999000.00),
(145, 135, 'Pizza', 999, 5.00, 4995.00),
(146, 135, 'Product3', 1000, 9999.00, 9999000.00),
(147, 136, 'Pizza', 999, 5.00, 4995.00),
(148, 136, 'Product3', 1000, 9999.00, 9999000.00),
(149, 136, 'Pizza', 999, 5.00, 4995.00),
(150, 136, 'Product3', 1000, 9999.00, 9999000.00),
(151, 137, 'Pizza', 999, 5.00, 4995.00),
(152, 137, 'Pizza', 999, 5.00, 4995.00),
(153, 138, 'Pizza', 999, 5.00, 4995.00),
(154, 138, 'Pizza', 555, 444.00, 246420.00),
(155, 139, 'Pizza', 999, 5.00, 4995.00),
(156, 140, 'Pizza', 999, 5.00, 4995.00),
(157, 141, 'Pizza', 999, 5.00, 4995.00),
(158, 142, 'Pizza', 999, 5.00, 4995.00),
(159, 143, 'Pizza', 999, 5.00, 4995.00),
(160, 144, 'Pizza', 999, 5.00, 4995.00),
(161, 145, 'Product2', 9984, 5.00, 49920.00),
(162, 145, 'Product3', 98956, 6.00, 593736.00),
(163, 146, 'Italian Pizza', 5, 2.00, 10.00),
(164, 147, 'Italian Pizza', 5, 2.00, 10.00),
(165, 148, 'Italian Pizza', 5, 2.00, 10.00),
(166, 149, 'Italian Pizza', 5, 2.00, 10.00),
(167, 150, 'Italian Pizza', 5, 2.00, 10.00),
(168, 151, 'Italian Pizza', 10, 2.00, 20.00),
(169, 151, 'Hawaiian Special', 100, 3.00, 300.00),
(170, 151, 'Greek Pizza', 200, 1.00, 200.00),
(171, 151, 'Bacon Pizza', 100, 3.00, 300.00),
(172, 151, 'Hawaiian Pizza', 500, 5.00, 2500.00),
(173, 152, 'Italian Pizza', 10, 2.00, 20.00),
(174, 152, 'Hawaiian Special', 100, 3.00, 300.00),
(175, 152, 'Greek Pizza', 200, 1.00, 200.00),
(176, 152, 'Bacon Pizza', 100, 3.00, 300.00),
(177, 152, 'Hawaiian Pizza', 500, 5.00, 2500.00),
(178, 153, 'Italian Pizza', 10, 2.00, 20.00),
(179, 153, 'Hawaiian Special', 100, 3.00, 300.00),
(180, 153, 'Greek Pizza', 200, 1.00, 200.00),
(181, 153, 'Bacon Pizza', 100, 3.00, 300.00),
(182, 153, 'Hawaiian Pizza', 500, 5.00, 2500.00),
(183, 154, 'Italian Pizza', 10, 2.00, 20.00),
(184, 154, 'Hawaiian Special', 100, 3.00, 300.00),
(185, 154, 'Greek Pizza', 200, 1.00, 200.00),
(186, 154, 'Bacon Pizza', 100, 3.00, 300.00),
(187, 154, 'Hawaiian Pizza', 500, 5.00, 2500.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `serveur`
--

CREATE TABLE `serveur` (
  `id_serveur` int(50) NOT NULL,
  `id` int(11) NOT NULL,
  `Nom_serveur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `serveur`
--

INSERT INTO `serveur` (`id_serveur`, `id`, `Nom_serveur`) VALUES
(82, 131, 'papa'),
(83, 132, 'papa'),
(84, 133, 'babe'),
(85, 134, 'babe'),
(86, 135, 'babe'),
(87, 136, 'babe'),
(88, 137, 'babe'),
(89, 138, 'babe'),
(90, 139, 'babe'),
(91, 140, 'babe'),
(92, 141, 'babe'),
(93, 142, 'babe'),
(94, 143, 'babe'),
(95, 144, 'babe'),
(96, 145, 'sarbay'),
(97, 146, 'kjlj'),
(98, 147, 'kjlj'),
(99, 148, 'kjlj'),
(100, 149, 'kjlj'),
(101, 150, 'kjlj'),
(102, 151, 'amin_elhilali'),
(103, 152, 'amin_elhilali'),
(104, 153, 'amin_elhilali'),
(105, 154, 'amin_elhilali');

-- --------------------------------------------------------

--
-- Struttura della tabella `table`
--

CREATE TABLE `table` (
  `id_table` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `Num_table` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `table`
--

INSERT INTO `table` (`id_table`, `id`, `Num_table`) VALUES
(77, 131, 888),
(78, 132, 888),
(79, 133, 554),
(80, 134, 554),
(81, 135, 554),
(82, 136, 554),
(83, 137, 554),
(84, 138, 554),
(85, 139, 554),
(86, 140, 554),
(87, 141, 554),
(88, 142, 554),
(89, 143, 554),
(90, 144, 554),
(91, 145, 999999999),
(92, 146, 22),
(93, 147, 22),
(94, 148, 22),
(95, 149, 22),
(96, 150, 22),
(97, 151, 10),
(98, 152, 10),
(99, 153, 10),
(100, 154, 10);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `client_1`
--
ALTER TABLE `client_1`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id_command`);

--
-- Indici per le tabelle `lign_command`
--
ALTER TABLE `lign_command`
  ADD PRIMARY KEY (`id_lc`);

--
-- Indici per le tabelle `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`);

--
-- Indici per le tabelle `serveur`
--
ALTER TABLE `serveur`
  ADD PRIMARY KEY (`id_serveur`);

--
-- Indici per le tabelle `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id_table`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `client`
--
ALTER TABLE `client`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `client_1`
--
ALTER TABLE `client_1`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT per la tabella `command`
--
ALTER TABLE `command`
  MODIFY `id_command` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT per la tabella `lign_command`
--
ALTER TABLE `lign_command`
  MODIFY `id_lc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT per la tabella `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT per la tabella `serveur`
--
ALTER TABLE `serveur`
  MODIFY `id_serveur` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `table`
--
ALTER TABLE `table`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
