-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2021 at 03:54 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `access_value` int(2) NOT NULL,
  `access_label` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`id`, `access_value`, `access_label`) VALUES
(1, 0, 'user'),
(2, 1, 'admin'),
(3, 2, 'supUser');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'T-SHIRTS'),
(2, 'exemple2'),
(33, 'jeans\r\n'),
(36, 'COMPUTERS'),
(37, 'BELT'),
(53, 'BAG'),
(54, 'Electroniques');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_amount` float NOT NULL,
  `order_transaction` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_currency` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_amount`, `order_transaction`, `order_status`, `order_currency`) VALUES
(64, 256, 'USA', '33456', 'Completed'),
(65, 256, 'USA', '33456', 'Completed'),
(66, 256, 'USA', '33456', 'Completed'),
(67, 256, 'USA', '33456', 'Completed'),
(68, 256, 'USA', '33456', 'Completed'),
(69, 256, 'USA', '33456', 'Completed'),
(70, 256, 'USA', '33456', 'Completed'),
(71, 256, 'USA', '33456', 'Completed'),
(72, 256, 'USA', '33456', 'Completed'),
(73, 256, 'USA', '33456', 'Completed'),
(74, 256, 'USA', '33456', 'Completed'),
(75, 256, 'USA', '33456', 'Completed'),
(76, 256, 'USA', '33456', 'Completed'),
(77, 256, 'USA', '33456', 'Completed'),
(78, 256, 'USA', '33456', 'Completed'),
(79, 256, 'USA', '33456', 'Completed'),
(80, 256, 'USA', '33456', 'Completed'),
(81, 256, 'USA', '33456', 'Completed'),
(82, 256, 'USA', '33456', 'Completed'),
(83, 256, 'USA', '33456', 'Completed'),
(84, 256, 'USA', '33456', 'Completed'),
(85, 256, 'USA', '33456', 'Completed'),
(86, 256, 'USA', '33456', 'Completed'),
(87, 256, 'USA', '33456', 'Completed'),
(88, 256, 'USA', '33456', 'Completed'),
(89, 256, 'USA', '33456', 'Completed'),
(90, 256, 'USA', '33456', 'Completed'),
(91, 256, 'USA', '33456', 'Completed'),
(92, 256, 'USA', '33456', 'Completed'),
(93, 256, 'USA', '33456', 'Completed'),
(94, 256, 'USA', '33456', 'Completed'),
(95, 256, 'USA', '33456', 'Completed'),
(96, 256, 'USA', '33456', 'Completed'),
(97, 256, 'USA', '33456', 'Completed'),
(98, 256, 'USA', '33456', 'Completed'),
(99, 256, 'USA', '33456', 'Completed'),
(100, 256, 'USA', '33456', 'Completed'),
(101, 256, 'USA', '33456', 'Completed'),
(102, 256, 'USA', '33456', 'Completed'),
(103, 256, 'USA', '33456', 'Completed'),
(104, 256, 'USA', '33456', 'Completed'),
(105, 256, 'USA', '33456', 'Completed'),
(106, 256, 'USA', '33456', 'Completed'),
(107, 256, '34567', '{status}', '{currency}'),
(108, 345, '34567', '{status}', '{currency}'),
(109, 345, '34567', 'Completed', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` varchar(255) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `short_desc` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_category_id`, `product_price`, `product_quantity`, `product_description`, `short_desc`, `product_image`, `user_id`) VALUES
(3, 'Sac jolie demoiselle', 53, 0, 7000, 'Faire un formulaire c\'est bien, mais encore faut-il savoir quoi demander à l\'utilisateur. Dans notre cas, nous allons faire simple et\r\nclassique : un formulaire d\'inscription. Notre formulaire d\'inscription aura besoin de quelques informations concernant\r\nl\'utilisateur, cela nous permettra d\'utiliser un peu tous les éléments HTML spécifiques auxformulaires que nous avons vus\r\njusqu\'à présent. V oici les informations à récupérer ainsi que les types d\'éléments HTML', 'Sac jolie demoiselle. Faites vous belle', '11098_01-300x300.jpg', 13),
(4, 'Sac jolie femme', 53, 9000, 5, 'Bien sûr, chacune de ces informations devra être traitée afin que l\\\'on sache si le contenu est bon. Par exemple, si l\\\'utilisateur a\\r\\nbien spécifié son sexe ou bien s\\\'il n\\\'a pas entré de chiffres dans son prénom, etc. Dans notre cas, nos vérifications de contenu ne\\r\\nseront pas très poussées pour la simple et bonne raison que nous n\\\'avons pas encore étudié les « regex» à ce stade du cours,\\r\\nnous nous limiterons donc à la vérification de la longueur de la chaîne ou bien à la présence de certains caractères. Bref, rien\\r\\nd\\\'incroyable, mais cela suffira amplement car le but de ce TP n\\\'est pas vraiment de vous faire analyser le contenu mais plutôt de\\r\\ngérer les événements et le CSS de votre formulaire.', 'Sac jolie femme', '11477_01-300x300.jpg', 0),
(5, 'Sac jolie jolie', 53, 7000, 10, 'Concrètement, l\'utilisateur n\'est pas censé connaître toutes ces conditions quand il arrive sur votre formulaire, il faudra donc les\r\nlu\r\ni indiquer avant même qu\'il ne commence à entrer ses informations, comme ça il ne perdra pas de temps à corriger ses fautes.\r\nPour cela, il va vous falloir afficher chaque condition d\'un champ de texte quand l\'utilisateur fera une erreur. Pourquoi parlonsnous ici uniquement des champs de texte ? Tout simplement parce que nous n\'allons pas dire à l\'utilisateur « Sélectionnez votre\r\nsexe » alors qu\'il n\'a qu\'une case à cocher, cela paraît évident.', 'Sac jolie jolie venez voir', '11159_01-300x300.jpg', 0),
(6, 'Sac nouveau modele', 0, 5000, 2, 'Nous avons vu dans la première partie du cours un chapitre sur les objets et les tableaux. Ce chapitre en est la suite et permet de\r\nmettre les pieds dans l\'univers de la création et de la modification d\'objets en Javascript.', 'venez vous faire belle', '11450_01-2-300x300.jpg', 0),
(7, 'My first product', 53, 12000, 2, 'Au programme, vous découvrirez comment créer un objet de A à Z en lui définissant un constructeur, des propriétés et des\r\nméthodes ; vous saurez aussi comment modifier un objet natif. S\'en suivra alors une manière d\'exploiter les objets pour les utiliser\r\nen tant que namespaces et, pour terminer, nous étudierons la modification du contexte d\'exécution d\'une méthode.', 'My first product  for women', '19967_05-300x300.jpg', 0),
(9, 'sac de sortie M1', 53, 8000, 12, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'sac de sortie modele de luxe', '11569_01-300x300.jpg', 0),
(10, 'super nike', 33, 7000, 8, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'super nike', 'main-product01.jpg', 0),
(11, 'nike rose', 53, 8000, 9, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'nike rose bonbon', 'main-product02.jpg', 0),
(12, 'nike violet', 53, 8200, 5, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'nike 2', 'thumb-product04.jpg', 0),
(13, 'nike  violet M', 53, 4500, 6, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'thumb-product03.jpg', 0),
(14, 'Sac à main vert', 53, 10000, 5, 'Le sujet va porter sur la création d\\\'un formulaire dynamique. Qu\\\'est-ce nous entendons par formulaire dynamique ? Eh bien, un\\r\\nformulaire dont une partie des vérifications est effectuée par le Javascript, côté client. On peut par exemple vérifier que\\r\\nl\\\'utilisateur a bien complété tous les champs, ou bien qu\\\'ils contiennent des valeurs valides (si le champ « âge » ne contient pas\\r\\ndes lettres au lieu de chiffres par exemple)', 'Sac à main vert pour plaire', '10593_01-300x300.jpg', 0),
(20, 'Sac jolie demoiselle', 53, 0, 7000, 'Faire un formulaire c\'est bien, mais encore faut-il savoir quoi demander à l\'utilisateur. Dans notre cas, nous allons faire simple et\r\nclassique : un formulaire d\'inscription. Notre formulaire d\'inscription aura besoin de quelques informations concernant\r\nl\'utilisateur, cela nous permettra d\'utiliser un peu tous les éléments HTML spécifiques auxformulaires que nous avons vus\r\njusqu\'à présent. V oici les informations à récupérer ainsi que les types d\'éléments HTML', 'Sac jolie demoiselle. Faites vous belle', '11098_01-300x300.jpg', 0),
(21, 'Sac jolie femme', 53, 9000, 5, 'Bien sûr, chacune de ces informations devra être traitée afin que l\\\'on sache si le contenu est bon. Par exemple, si l\\\'utilisateur a\\r\\nbien spécifié son sexe ou bien s\\\'il n\\\'a pas entré de chiffres dans son prénom, etc. Dans notre cas, nos vérifications de contenu ne\\r\\nseront pas très poussées pour la simple et bonne raison que nous n\\\'avons pas encore étudié les « regex» à ce stade du cours,\\r\\nnous nous limiterons donc à la vérification de la longueur de la chaîne ou bien à la présence de certains caractères. Bref, rien\\r\\nd\\\'incroyable, mais cela suffira amplement car le but de ce TP n\\\'est pas vraiment de vous faire analyser le contenu mais plutôt de\\r\\ngérer les événements et le CSS de votre formulaire.', 'Sac jolie femme', '11477_01-300x300.jpg', 0),
(22, 'Sac jolie jolie', 53, 7000, 10, 'Concrètement, l\'utilisateur n\'est pas censé connaître toutes ces conditions quand il arrive sur votre formulaire, il faudra donc les\r\nlu\r\ni indiquer avant même qu\'il ne commence à entrer ses informations, comme ça il ne perdra pas de temps à corriger ses fautes.\r\nPour cela, il va vous falloir afficher chaque condition d\'un champ de texte quand l\'utilisateur fera une erreur. Pourquoi parlonsnous ici uniquement des champs de texte ? Tout simplement parce que nous n\'allons pas dire à l\'utilisateur « Sélectionnez votre\r\nsexe » alors qu\'il n\'a qu\'une case à cocher, cela paraît évident.', 'Sac jolie jolie venez voir', '11159_01-300x300.jpg', 0),
(23, 'Sac nouveau modele', 0, 5000, 2, 'Nous avons vu dans la première partie du cours un chapitre sur les objets et les tableaux. Ce chapitre en est la suite et permet de\r\nmettre les pieds dans l\'univers de la création et de la modification d\'objets en Javascript.', 'venez vous faire belle', '11450_01-2-300x300.jpg', 0),
(24, 'My first product', 53, 12000, 2, 'Au programme, vous découvrirez comment créer un objet de A à Z en lui définissant un constructeur, des propriétés et des\r\nméthodes ; vous saurez aussi comment modifier un objet natif. S\'en suivra alors une manière d\'exploiter les objets pour les utiliser\r\nen tant que namespaces et, pour terminer, nous étudierons la modification du contexte d\'exécution d\'une méthode.', 'My first product  for women', '19967_05-300x300.jpg', 20),
(25, 'sac de sortie M1', 53, 8000, 12, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'sac de sortie modele de luxe', '11569_01-300x300.jpg', 21),
(26, 'super nike', 33, 7000, 8, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'super nike', 'main-product01.jpg', 0),
(27, 'nike rose', 53, 8000, 9, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'nike rose bonbon', 'main-product02.jpg', 0),
(28, 'nike violet', 53, 8200, 5, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'nike 2', 'thumb-product04.jpg', 0),
(29, 'nike  violet M', 53, 4500, 6, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'thumb-product03.jpg', 0),
(30, 'Sac à main vert', 53, 10000, 5, 'Le sujet va porter sur la création d\\\'un formulaire dynamique. Qu\\\'est-ce nous entendons par formulaire dynamique ? Eh bien, un\\r\\nformulaire dont une partie des vérifications est effectuée par le Javascript, côté client. On peut par exemple vérifier que\\r\\nl\\\'utilisateur a bien complété tous les champs, ou bien qu\\\'ils contiennent des valeurs valides (si le champ « âge » ne contient pas\\r\\ndes lettres au lieu de chiffres par exemple)', 'Sac à main vert pour plaire', '10593_01-300x300.jpg', 21),
(31, 'nike', 4, 15, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 21),
(33, 'nike', 4, 15, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(34, 'Sac jolie demoiselle', 53, 0, 7000, 'Faire un formulaire c\'est bien, mais encore faut-il savoir quoi demander à l\'utilisateur. Dans notre cas, nous allons faire simple et\r\nclassique : un formulaire d\'inscription. Notre formulaire d\'inscription aura besoin de quelques informations concernant\r\nl\'utilisateur, cela nous permettra d\'utiliser un peu tous les éléments HTML spécifiques auxformulaires que nous avons vus\r\njusqu\'à présent. V oici les informations à récupérer ainsi que les types d\'éléments HTML', 'Sac jolie demoiselle. Faites vous belle', '11098_01-300x300.jpg', 0),
(35, 'Sac jolie femme', 53, 9000, 5, 'Bien sûr, chacune de ces informations devra être traitée afin que l\\\'on sache si le contenu est bon. Par exemple, si l\\\'utilisateur a\\r\\nbien spécifié son sexe ou bien s\\\'il n\\\'a pas entré de chiffres dans son prénom, etc. Dans notre cas, nos vérifications de contenu ne\\r\\nseront pas très poussées pour la simple et bonne raison que nous n\\\'avons pas encore étudié les « regex» à ce stade du cours,\\r\\nnous nous limiterons donc à la vérification de la longueur de la chaîne ou bien à la présence de certains caractères. Bref, rien\\r\\nd\\\'incroyable, mais cela suffira amplement car le but de ce TP n\\\'est pas vraiment de vous faire analyser le contenu mais plutôt de\\r\\ngérer les événements et le CSS de votre formulaire.', 'Sac jolie femme', '11477_01-300x300.jpg', 0),
(36, 'Sac jolie jolie', 53, 7000, 10, 'Concrètement, l\'utilisateur n\'est pas censé connaître toutes ces conditions quand il arrive sur votre formulaire, il faudra donc les\r\nlu\r\ni indiquer avant même qu\'il ne commence à entrer ses informations, comme ça il ne perdra pas de temps à corriger ses fautes.\r\nPour cela, il va vous falloir afficher chaque condition d\'un champ de texte quand l\'utilisateur fera une erreur. Pourquoi parlonsnous ici uniquement des champs de texte ? Tout simplement parce que nous n\'allons pas dire à l\'utilisateur « Sélectionnez votre\r\nsexe » alors qu\'il n\'a qu\'une case à cocher, cela paraît évident.', 'Sac jolie jolie venez voir', '11159_01-300x300.jpg', 0),
(37, 'Sac nouveau modele', 0, 5000, 2, 'Nous avons vu dans la première partie du cours un chapitre sur les objets et les tableaux. Ce chapitre en est la suite et permet de\r\nmettre les pieds dans l\'univers de la création et de la modification d\'objets en Javascript.', 'venez vous faire belle', '11450_01-2-300x300.jpg', 0),
(38, 'My first product', 53, 12000, 2, 'Au programme, vous découvrirez comment créer un objet de A à Z en lui définissant un constructeur, des propriétés et des\r\nméthodes ; vous saurez aussi comment modifier un objet natif. S\'en suivra alors une manière d\'exploiter les objets pour les utiliser\r\nen tant que namespaces et, pour terminer, nous étudierons la modification du contexte d\'exécution d\'une méthode.', 'My first product  for women', '19967_05-300x300.jpg', 0),
(39, 'sac de sortie M1', 53, 8000, 12, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'sac de sortie modele de luxe', '11569_01-300x300.jpg', 0),
(40, 'super nike', 33, 7000, 8, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'super nike', 'main-product01.jpg', 0),
(41, 'nike rose', 53, 8000, 9, 'Ce n\'est pas encore trop compliqué car les données restent relativement simples. Maintenant, pour chaque personne, nous\r\nallons ajouter un tableau qui contiendra ses amis, et pour chaque ami, les mêmes données. Là, c\'est déjà plus compliqué…\r\nProfitons de cette problématique pour étudier les objets !', 'nike rose bonbon', 'main-product02.jpg', 0),
(42, 'nike violet', 53, 8200, 5, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'nike 2', 'thumb-product04.jpg', 0),
(43, 'nike  violet M', 53, 4500, 6, 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'Le constructeur (ou objet constructeur ou constructeur d\'objet) va contenir la structure de base de notre objet. Si vous avez\r\ndéjà fait de la programmation orientée objet dans des langages tels que le C++, le C# ou le Java, sachez que ce constructeur\r\nressemble, sur le principe, à une classe.', 'thumb-product03.jpg', 0),
(44, 'Sac à main vert', 53, 10000, 5, 'Le sujet va porter sur la création d\\\'un formulaire dynamique. Qu\\\'est-ce nous entendons par formulaire dynamique ? Eh bien, un\\r\\nformulaire dont une partie des vérifications est effectuée par le Javascript, côté client. On peut par exemple vérifier que\\r\\nl\\\'utilisateur a bien complété tous les champs, ou bien qu\\\'ils contiennent des valeurs valides (si le champ « âge » ne contient pas\\r\\ndes lettres au lieu de chiffres par exemple)', 'Sac à main vert pour plaire', '10593_01-300x300.jpg', 0),
(45, 'nike', 4, 15, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\\r\\ndivert nature’s path—across history, geography, culture, gender,\\r\\nand orientation . . . how sex works.\\r\\nAlong the way, we’re going to look at nature’s silent hand in\\r\\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', 'html5 logo.PNG', 0),
(110, 'nike', 4, 15, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(111, 'nike', 4, 16, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(112, 'nike', 4, 16, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(113, 'nike', 4, 16, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(114, 'nike', 4, 16, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 0),
(116, 'nike', 4, 16, 9, 'We’re here to explore human sexuality from beginning to end—what we like and why we like it; how it makes us feel; how it can go wrong; and how human intervention, through cultural traditions, scientific discovery, or both, can\r\ndivert nature’s path—across history, geography, culture, gender,\r\nand orientation . . . how sex works.\r\nAlong the way, we’re going to look at nature’s silent hand in\r\nthe development of human sexuality. Over and over you’ll be sur', 'We’re here to explore human sexuality from beginning to end—what we like', '', 13),
(119, 'TEST1', 2, 80, 98, 'PRODUCT TEST', 'PRODUCT TEST', 'bananeFrite.PNG', 0),
(120, 'montre', 2, 5000, 58, 'regardez l\'heure', 'regardez l\'heure', 'montre.PNG', 0),
(121, 'shoees', 2, 4000, 1, 'chausurre de sport', 'chausurre de sport', 'shoes.jpg', 0),
(122, 'dfsg', 2, 45, 54, 'erty', '4', 'deals.png', 0),
(123, 'table de bureau', 2, 50000, 10, 'En utilisant toutes les informations suivantes, il vous est demande de réaliser le modèle E/A\r\nde la conception d’un livre d’exercices de physique.', 'En utilisant toutes les informations suivantes', 'photo2.png', 0),
(124, 'title', 2, 1, 0, 'dgfhj', 'jhgf', 'Capture.PNG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `product_id`, `order_id`, `product_price`, `product_title`, `product_quantity`) VALUES
(13, 2, 0, 99, '', 2),
(14, 1, 0, 89, '', 2),
(15, 2, 0, 99, '', 2),
(16, 1, 0, 89, '', 2),
(17, 2, 0, 99, '', 2),
(18, 1, 0, 89, '', 2),
(19, 2, 0, 99, '', 2),
(20, 1, 100, 89, '', 2),
(21, 2, 100, 99, '', 2),
(22, 1, 101, 89, '', 2),
(23, 2, 101, 99, '', 2),
(26, 1, 103, 89, 'Biscuit', 1),
(27, 2, 103, 99, 'Noisette', 1),
(28, 1, 0, 89, 'Biscuit', 1),
(29, 2, 0, 99, 'Noisette', 1),
(30, 1, 0, 89, 'Biscuit', 1),
(31, 1, 0, 89, 'Biscuit', 1),
(32, 2, 0, 99, 'Noisette', 1),
(33, 2, 0, 99, 'Noisette', 1),
(34, 1, 0, 89, 'Biscuit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `slide_title` varchar(255) NOT NULL,
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_image` text NOT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`slide_title`, `slide_id`, `slide_image`) VALUES
('im1', 46, 'hotdeal.png'),
('projector', 47, 'shop02.png'),
('pc', 53, 'banner_2_product.png'),
('gad', 54, 'blog_9.jpg'),
('phone', 58, 'banner_product.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `droit` enum('1','2','3') NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `droit`, `user_photo`) VALUES
(7, 'eric', 'cirecodeur@gmail.com', '$2y$10$XMxYNmEJi05INHVQdA9MUOjhmqzDYzeOULYrg6m0SqDp8WqPRKdzC', '2', ''),
(21, 'arsene', 'testons@gmail.com', '$2y$10$2iI3ZaK0mDsT.1pkFritdeLW5w1ChZ92EWaL7HLPf7qHzRFnZ8ruO', '1', ''),
(23, 'eric3', 'example@gmail.com', '$2y$10$ZHEJw2OJxgQ5fRznNdtr8eqFFrQ1toxDgPi5CpyCeWGPw/Bu0.hcq', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
