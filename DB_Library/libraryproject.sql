-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-07-2022 a las 14:23:26
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libraryproject`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_library_book`
--

DROP TABLE IF EXISTS `api_library_book`;
CREATE TABLE IF NOT EXISTS `api_library_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_library_book`
--

INSERT INTO `api_library_book` (`id`, `title`, `isbn`, `status`) VALUES
(1, 'HTML5 y CSS3', '124114651', 1),
(2, 'Java8', '0123456789', 1),
(3, 'Python3', '25364125', 1),
(7, 'Python-Tensorflow', '253164125', 0),
(6, 'Python-Django', '2536004125', 0),
(9, 'Python-Flask', '2958364125', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_library_borrower`
--

DROP TABLE IF EXISTS `api_library_borrower`;
CREATE TABLE IF NOT EXISTS `api_library_borrower` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `borrow_date` date DEFAULT NULL,
  `book_id` bigint(20) NOT NULL,
  `reader_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_library_borrower_book_id_2f895ae0` (`book_id`),
  KEY `api_library_borrower_reader_id_bb99ae82` (`reader_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_library_borrower`
--

INSERT INTO `api_library_borrower` (`id`, `borrow_date`, `book_id`, `reader_id`) VALUES
(22, '2022-07-06', 2, 3),
(21, '2022-07-06', 1, 3),
(25, '2022-07-07', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_library_reader`
--

DROP TABLE IF EXISTS `api_library_reader`;
CREATE TABLE IF NOT EXISTS `api_library_reader` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_library_reader`
--

INSERT INTO `api_library_reader` (`id`, `name`) VALUES
(1, 'Nany'),
(2, 'Nesty'),
(3, 'Grey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add book', 7, 'add_book'),
(26, 'Can change book', 7, 'change_book'),
(27, 'Can delete book', 7, 'delete_book'),
(28, 'Can view book', 7, 'view_book'),
(29, 'Can add reader', 8, 'add_reader'),
(30, 'Can change reader', 8, 'change_reader'),
(31, 'Can delete reader', 8, 'delete_reader'),
(32, 'Can view reader', 8, 'view_reader'),
(33, 'Can add borrower', 9, 'add_borrower'),
(34, 'Can change borrower', 9, 'change_borrower'),
(35, 'Can delete borrower', 9, 'delete_borrower'),
(36, 'Can view borrower', 9, 'view_borrower');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$Y8di7SNvUrwBc2sjpE7Lq6$OCdK+C1lKYPgKuMu8fnoQYkZ1MMvqtxn2/phStbETps=', '2022-07-05 23:25:15.174238', 1, 'ecarballea', '', '', 'nestycarballea@gmail.com', 1, 1, '2022-07-05 23:19:32.288043'),
(2, 'pbkdf2_sha256$260000$tCwENJnzZ2sr8zvzBkemUu$7jzrqhWqoN53roU2RTuOQZqGUO5YGSCabo4RHixVFbc=', NULL, 0, 'grey', '', '', '', 0, 1, '2022-07-06 03:43:07.672280');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-07-05 23:27:31.371168', '1', 'HTML 5', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-07-05 23:27:41.498139', '2', 'Java8', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-07-05 23:28:09.517715', '3', 'Python3', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-07-05 23:28:22.065819', '1', 'Nany', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-07-05 23:28:25.727815', '2', 'nesty', 1, '[{\"added\": {}}]', 8, 1),
(6, '2022-07-05 23:28:31.936255', '3', 'Grey', 1, '[{\"added\": {}}]', 8, 1),
(7, '2022-07-05 23:28:40.104477', '2', 'Nesty', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 1),
(8, '2022-07-05 23:28:50.090497', '1', 'Grey borrowed HTML 5 on 2022-07-05', 1, '[{\"added\": {}}]', 9, 1),
(9, '2022-07-05 23:28:56.282068', '2', 'Nany borrowed Java8 on 2022-07-05', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-07-05 23:29:14.001479', '3', 'Grey borrowed Python3 on 2022-07-05', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-07-06 03:43:08.164807', '2', 'grey', 1, '[{\"added\": {}}]', 4, 1),
(12, '2022-07-06 07:27:10.627349', '15', 'Grey borrowed JavaScript book on 2022-07-05', 3, '', 9, 1),
(13, '2022-07-06 07:27:14.531557', '14', 'Grey borrowed Python3 book on 2022-07-05', 3, '', 9, 1),
(14, '2022-07-06 07:27:26.996066', '13', 'Grey borrowed Java8 book on 2022-07-05', 3, '', 9, 1),
(15, '2022-07-06 07:27:26.997066', '12', 'Grey borrowed HTML book on 2022-07-05', 3, '', 9, 1),
(16, '2022-07-06 07:27:45.015922', '2', 'Java8', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(17, '2022-07-06 07:37:52.906341', '16', 'Grey borrowed HTML book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(18, '2022-07-06 07:38:09.860230', '17', 'Grey borrowed Java8 book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(19, '2022-07-06 07:38:32.718679', '16', 'Grey borrowed HTML book on 2022-07-06', 3, '', 9, 1),
(20, '2022-07-06 07:40:21.162070', '17', 'Grey borrowed Java8 book on 2022-07-06', 3, '', 9, 1),
(21, '2022-07-06 07:43:49.820553', '1', 'HTML', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(22, '2022-07-06 07:43:56.086565', '2', 'Java8', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(23, '2022-07-06 07:44:20.515087', '18', 'Grey borrowed HTML book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(24, '2022-07-06 07:44:33.265132', '18', 'Grey borrowed HTML book on 2022-07-06', 3, '', 9, 1),
(25, '2022-07-06 07:46:54.624969', '1', 'HTML', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(26, '2022-07-06 07:47:05.989319', '19', 'Grey borrowed HTML book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(27, '2022-07-06 07:47:12.002773', '20', 'Nany borrowed JavaScript book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(28, '2022-07-06 07:47:46.690525', '19', 'Grey borrowed HTML book on 2022-07-06', 3, '', 9, 1),
(29, '2022-07-06 07:48:08.954264', '20', 'Nany borrowed JavaScript book on 2022-07-06', 3, '', 9, 1),
(30, '2022-07-06 07:48:54.499337', '21', 'Grey borrowed HTML book on 2022-07-06', 1, '[{\"added\": {}}]', 9, 1),
(31, '2022-07-07 14:16:39.822245', '23', 'Nany borrowed Python3 book on 2022-07-07', 3, '', 9, 1),
(32, '2022-07-07 14:17:34.372868', '25', 'Nesty borrowed Python3 book on 2022-07-07', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'api_library', 'book'),
(8, 'api_library', 'reader'),
(9, 'api_library', 'borrower');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-05 23:18:51.813850'),
(2, 'auth', '0001_initial', '2022-07-05 23:18:53.797401'),
(3, 'admin', '0001_initial', '2022-07-05 23:18:54.550464'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-05 23:18:54.575892'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-05 23:18:54.598139'),
(6, 'api_library', '0001_initial', '2022-07-05 23:18:55.104872'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-07-05 23:18:55.296980'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-07-05 23:18:55.391376'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-07-05 23:18:55.488105'),
(10, 'auth', '0004_alter_user_username_opts', '2022-07-05 23:18:55.500117'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-07-05 23:18:55.551362'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-07-05 23:18:55.555359'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-07-05 23:18:55.567173'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-07-05 23:18:55.675332'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-07-05 23:18:55.753384'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-07-05 23:18:55.844358'),
(17, 'auth', '0011_update_proxy_permissions', '2022-07-05 23:18:55.857360'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-07-05 23:18:55.937390'),
(19, 'sessions', '0001_initial', '2022-07-05 23:18:56.062178'),
(20, 'api_library', '0002_alter_borrower_borrow_date', '2022-07-05 23:34:40.910998'),
(21, 'api_library', '0003_alter_borrower_id', '2022-07-06 05:18:23.453841'),
(22, 'api_library', '0004_alter_borrower_id', '2022-07-06 05:22:32.580902'),
(23, 'api_library', '0005_alter_borrower_options', '2022-07-06 06:11:03.141635'),
(24, 'api_library', '0006_alter_borrower_borrow_date', '2022-07-06 06:45:57.092863'),
(25, 'api_library', '0007_alter_borrower_options', '2022-07-06 06:55:25.971389'),
(26, 'api_library', '0008_alter_book_status', '2022-07-06 21:48:14.382038');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('u413ab1lb7jqvqj00ka6xbgxt57gtgku', '.eJxVjMEOwiAQRP-FsyHFLSx49O43kAW2UjWQlPZk_Hdp0oNmbm_ezFt42tbst8aLn5O4CCVOvyxQfHLZi_Sgcq8y1rIuc5C7Io-2yVtN_Loe7t9Bppb7mgAtDYSJo1OjsagCWGO0051GZ0aFijUCQ0CAMzg9wYTWoe3BAcXnC79tNk4:1o8rut:ApKg4J2Cnni8Ul5cDPnuZ75TA3RKdauZ_NkCkHsYuvQ', '2022-07-19 23:25:15.177243');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
