-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 sep. 2023 à 04:52
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hockey`
--
CREATE DATABASE IF NOT EXISTS `hockey` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hockey`;

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `id` int(11) NOT NULL,
  `nom_equipe` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT '',
  `nombre_victoires` int(11) DEFAULT NULL,
  `nombre_defaites` int(11) DEFAULT NULL,
  `nombre_matchs_nuls` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipes`
--

INSERT INTO `equipes` (`id`, `nom_equipe`, `pays`, `image_url`, `nombre_victoires`, `nombre_defaites`, `nombre_matchs_nuls`) VALUES
(1, 'Firestorm Strikers', 'États-Unis', 'img1.jpg', 20, 10, 5),
(2, 'Thunderbolt United', 'Canada', 'img2.jpg', 18, 12, 6),
(3, 'Azure Titans', 'Russie', 'img3.jpg\r\n', 22, 8, 4),
(4, 'Crimson Thunder', 'Suède', 'img4.jpg', 16, 14, 2),
(5, 'Radiant Ravens', 'Finlande', 'img5.jpg\r\n', 19, 11, 3),
(6, 'Solaris Strikers', 'République tchèque', 'img6.jpg\r\n', 17, 13, 4),
(7, 'Frostbite Legends', 'Suisse', 'img7.jpg\r\n', 21, 9, 2),
(8, 'Phoenix Fury', 'Allemagne', 'img8.jpg', 15, 15, 0),
(9, 'Eclipse Knights', 'Slovaquie', 'img9.jpg\r\n', 23, 7, 0),
(10, 'Nebula United', 'Norvège', 'img10.jpg', 14, 16, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `equipes_joueurs`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `equipes_joueurs` (
`nom_equipe` varchar(255)
,`nom_joueur` varchar(255)
,`buts_marques` int(11)
,`passes_decisives` int(11)
,`tirs_hors_cadre` int(11)
,`interceptions` int(11)
,`fautes` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` int(11) NOT NULL,
  `nom_evenement` varchar(255) NOT NULL,
  `date_evenement` date NOT NULL,
  `equipe_hote_id` int(11) NOT NULL,
  `equipe_adverse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`id`, `nom_evenement`, `date_evenement`, `equipe_hote_id`, `equipe_adverse_id`) VALUES
(0, 'Tournoi de Hockey Glacial', '2023-08-16', 5, 4),
(1, 'La Bataille des Rois de la Patinoire', '2023-08-30', 3, 1),
(2, 'Coupe des Morsures Glaciales', '2023-10-25', 9, 6),
(3, 'Frénésie de la Patinoire Gelée', '2023-12-13', 8, 6),
(4, 'Derby Feu et Glace', '2024-01-17', 7, 3),
(5, 'Éliminatoires de la Foire Gelée', '2024-02-21', 6, 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `evenements_equipes`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `evenements_equipes` (
`evenement_id` int(11)
,`evenement_nom` varchar(255)
,`date` date
,`equipe_hote_nom` varchar(255)
,`equipe_adverse_nom` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE `joueurs` (
  `id` int(11) NOT NULL,
  `nom_joueur` varchar(255) NOT NULL,
  `equipe_id` int(11) NOT NULL,
  `buts_marques` int(11) NOT NULL,
  `passes_decisives` int(11) NOT NULL,
  `tirs_hors_cadre` int(11) NOT NULL,
  `interceptions` int(11) NOT NULL,
  `fautes` int(11) NOT NULL,
  `image_joueur` varchar(255) NOT NULL,
  `image_profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `nom_joueur`, `equipe_id`, `buts_marques`, `passes_decisives`, `tirs_hors_cadre`, `interceptions`, `fautes`, `image_joueur`, `image_profile`) VALUES
(1, 'Liam Johnson', 1, 5, 8, 6, 9, 3, 'img1.jpg', ''),
(2, 'Noah Smith', 2, 3, 5, 5, 7, 2, 'img2.jpg', ''),
(3, 'Ethan Martinez', 3, 8, 10, 8, 12, 4, 'img3.jpg', ''),
(4, 'Oliver Taylor', 4, 6, 3, 4, 5, 2, 'img4.jpg', ''),
(5, 'Aiden Brown', 5, 12, 15, 12, 18, 6, 'img5.jpg', ''),
(6, 'Jackson Davis', 6, 4, 6, 7, 9, 5, 'img6.jpg', ''),
(7, 'Lucas Wilson', 1, 7, 8, 10, 14, 100, 'img7.jpg', ''),
(8, 'Carter White', 2, 2, 1, 2, 4, 2, 'img8.jpg', ''),
(9, 'Daniel Thompson', 3, 9, 12, 10, 15, 7, 'img9.jpg', ''),
(10, 'Matthew Harris', 4, 6, 8, 7, 10, 3, 'img10.jpg', ''),
(11, 'Alexander Martin', 5, 3, 6, 7, 10, 4, 'img11.jpg', ''),
(12, 'James Turner', 6, 1, 2, 3, 8, 6, 'img12.jpg', ''),
(13, 'Benjamin Adams', 1, 10, 8, 10, 12, 5, 'img13.jpg', ''),
(14, 'William Moore', 2, 2, 4, 2, 5, 3, 'img14.jpg', ''),
(15, 'Michael Jackson', 3, 8, 10, 8, 12, 4, 'img15.jpg', ''),
(16, 'Henry Smith', 4, 6, 3, 4, 5, 2, 'img16.jpg', ''),
(17, 'Joseph Harris', 5, 12, 15, 12, 18, 6, 'img17.jpg', ''),
(18, 'David Martin', 6, 4, 6, 7, 9, 5, 'img18.jpg', ''),
(19, 'Daniel Wilson', 8, 7, 8, 10, 14, 4, 'img19.jpg', ''),
(20, 'Matthew Turner', 7, 2, 1, 2, 4, 2, 'img20.jpg', ''),
(21, 'Christopher Thompson', 10, 9, 12, 10, 15, 7, 'img21.jpg', ''),
(22, 'James Martinez', 8, 4, 6, 3, 6, 2, 'img22.jpg', ''),
(23, 'Henry Davis', 7, 7, 9, 6, 11, 5, 'img23.jpg', ''),
(24, 'Benjamin Harris', 10, 3, 5, 5, 8, 3, 'img24.jpg', ''),
(25, 'William Johnson', 8, 5, 8, 6, 9, 3, 'img25.jpg', ''),
(26, 'Noah Miller', 9, 3, 5, 5, 7, 2, 'img26.jpg', ''),
(27, 'Ethan Thomas', 10, 8, 10, 8, 12, 4, 'img27.jpg', ''),
(28, 'Oliver Harris', 9, 6, 3, 4, 5, 2, 'img28.jpg', ''),
(29, 'Aiden Martinez', 7, 12, 15, 12, 18, 6, 'img29.jpg', ''),
(30, 'Jackson Johnson', 9, 4, 6, 7, 9, 5, 'img30.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la vue `equipes_joueurs`
--
DROP TABLE IF EXISTS `equipes_joueurs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `equipes_joueurs`  AS SELECT `e`.`nom_equipe` AS `nom_equipe`, `j`.`nom_joueur` AS `nom_joueur`, `j`.`buts_marques` AS `buts_marques`, `j`.`passes_decisives` AS `passes_decisives`, `j`.`tirs_hors_cadre` AS `tirs_hors_cadre`, `j`.`interceptions` AS `interceptions`, `j`.`fautes` AS `fautes` FROM (`equipes` `e` join `joueurs` `j` on(`e`.`id` = `j`.`equipe_id`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `evenements_equipes`
--
DROP TABLE IF EXISTS `evenements_equipes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evenements_equipes`  AS SELECT `ev`.`id` AS `evenement_id`, `ev`.`nom_evenement` AS `evenement_nom`, `ev`.`date_evenement` AS `date`, `eh`.`nom_equipe` AS `equipe_hote_nom`, `ea`.`nom_equipe` AS `equipe_adverse_nom` FROM ((`evenements` `ev` join `equipes` `eh` on(`ev`.`equipe_hote_id` = `eh`.`id`)) join `equipes` `ea` on(`ev`.`equipe_adverse_id` = `ea`.`id`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipe_hote_id` (`equipe_hote_id`),
  ADD KEY `equipe_adverse_id` (`equipe_adverse_id`);

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipe_id` (`equipe_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `joueurs`
--
ALTER TABLE `joueurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD CONSTRAINT `joueurs_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
