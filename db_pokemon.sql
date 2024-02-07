-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_pokemon
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amigo`
--

DROP TABLE IF EXISTS `amigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_amigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_amigo` (`id_amigo`),
  CONSTRAINT `amigo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `amigo_ibfk_2` FOREIGN KEY (`id_amigo`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigo`
--

LOCK TABLES `amigo` WRITE;
/*!40000 ALTER TABLE `amigo` DISABLE KEYS */;
INSERT INTO `amigo` VALUES
(1,1,3),
(2,1,4),
(3,2,3),
(4,2,4),
(5,3,1),
(6,3,2),
(7,4,1),
(8,4,2),
(9,6,1),
(10,1,6);
/*!40000 ALTER TABLE `amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add amigo',1,'add_amigo'),
(2,'Can change amigo',1,'change_amigo'),
(3,'Can delete amigo',1,'delete_amigo'),
(4,'Can view amigo',1,'view_amigo'),
(5,'Can add usuario',2,'add_usuario'),
(6,'Can change usuario',2,'change_usuario'),
(7,'Can delete usuario',2,'delete_usuario'),
(8,'Can view usuario',2,'view_usuario'),
(9,'Can add pokemon',3,'add_pokemon'),
(10,'Can change pokemon',3,'change_pokemon'),
(11,'Can delete pokemon',3,'delete_pokemon'),
(12,'Can view pokemon',3,'view_pokemon'),
(13,'Can add registro intercambio',4,'add_registrointercambio'),
(14,'Can change registro intercambio',4,'change_registrointercambio'),
(15,'Can delete registro intercambio',4,'delete_registrointercambio'),
(16,'Can view registro intercambio',4,'view_registrointercambio'),
(17,'Can add capturado',5,'add_capturado'),
(18,'Can change capturado',5,'change_capturado'),
(19,'Can delete capturado',5,'delete_capturado'),
(20,'Can view capturado',5,'view_capturado'),
(21,'Can add deseado',6,'add_deseado'),
(22,'Can change deseado',6,'change_deseado'),
(23,'Can delete deseado',6,'delete_deseado'),
(24,'Can view deseado',6,'view_deseado'),
(25,'Can add favorito',7,'add_favorito'),
(26,'Can change favorito',7,'change_favorito'),
(27,'Can delete favorito',7,'delete_favorito'),
(28,'Can view favorito',7,'view_favorito'),
(29,'Can add log entry',8,'add_logentry'),
(30,'Can change log entry',8,'change_logentry'),
(31,'Can delete log entry',8,'delete_logentry'),
(32,'Can view log entry',8,'view_logentry'),
(33,'Can add permission',9,'add_permission'),
(34,'Can change permission',9,'change_permission'),
(35,'Can delete permission',9,'delete_permission'),
(36,'Can view permission',9,'view_permission'),
(37,'Can add group',10,'add_group'),
(38,'Can change group',10,'change_group'),
(39,'Can delete group',10,'delete_group'),
(40,'Can view group',10,'view_group'),
(41,'Can add user',11,'add_user'),
(42,'Can change user',11,'change_user'),
(43,'Can delete user',11,'delete_user'),
(44,'Can view user',11,'view_user'),
(45,'Can add content type',12,'add_contenttype'),
(46,'Can change content type',12,'change_contenttype'),
(47,'Can delete content type',12,'delete_contenttype'),
(48,'Can view content type',12,'view_contenttype'),
(49,'Can add session',13,'add_session'),
(50,'Can change session',13,'change_session'),
(51,'Can delete session',13,'delete_session'),
(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturado`
--

DROP TABLE IF EXISTS `capturado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capturado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `capturado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `capturado_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturado`
--

LOCK TABLES `capturado` WRITE;
/*!40000 ALTER TABLE `capturado` DISABLE KEYS */;
INSERT INTO `capturado` VALUES
(1,1,3),
(2,1,5),
(3,1,10),
(4,1,15),
(5,1,21),
(6,2,9),
(7,2,13),
(8,3,1),
(9,3,14),
(10,3,16),
(11,3,19),
(12,3,20),
(13,4,22);
/*!40000 ALTER TABLE `capturado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deseado`
--

DROP TABLE IF EXISTS `deseado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deseado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `deseado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `deseado_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deseado`
--

LOCK TABLES `deseado` WRITE;
/*!40000 ALTER TABLE `deseado` DISABLE KEYS */;
INSERT INTO `deseado` VALUES
(1,1,14),
(2,1,20),
(3,2,3),
(4,3,6),
(5,3,9),
(6,4,16);
/*!40000 ALTER TABLE `deseado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(8,'admin','logentry'),
(10,'auth','group'),
(9,'auth','permission'),
(11,'auth','user'),
(12,'contenttypes','contenttype'),
(1,'pokemon','amigo'),
(5,'pokemon','capturado'),
(6,'pokemon','deseado'),
(7,'pokemon','favorito'),
(3,'pokemon','pokemon'),
(4,'pokemon','registrointercambio'),
(2,'pokemon','usuario'),
(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2024-02-01 09:46:22.379652'),
(2,'auth','0001_initial','2024-02-01 09:46:23.575762'),
(3,'admin','0001_initial','2024-02-01 09:46:23.911025'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-01 09:46:23.925514'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-01 09:46:23.935839'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-01 09:46:24.107966'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-01 09:46:24.214688'),
(8,'auth','0003_alter_user_email_max_length','2024-02-01 09:46:24.267916'),
(9,'auth','0004_alter_user_username_opts','2024-02-01 09:46:24.281951'),
(10,'auth','0005_alter_user_last_login_null','2024-02-01 09:46:24.381212'),
(11,'auth','0006_require_contenttypes_0002','2024-02-01 09:46:24.393865'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-01 09:46:24.403526'),
(13,'auth','0008_alter_user_username_max_length','2024-02-01 09:46:24.481241'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-01 09:46:24.533167'),
(15,'auth','0010_alter_group_name_max_length','2024-02-01 09:46:24.585936'),
(16,'auth','0011_update_proxy_permissions','2024-02-01 09:46:24.598433'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-01 09:46:24.660033'),
(18,'pokemon','0001_initial','2024-02-01 09:46:24.670577'),
(19,'sessions','0001_initial','2024-02-01 09:46:24.764354'),
(20,'pokemon','0002_alter_amigo_options','2024-02-01 09:52:45.889571');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES
(1,1,3),
(2,1,7),
(3,1,10),
(4,2,11),
(5,2,15),
(6,2,19),
(7,3,4),
(8,3,12),
(9,3,17),
(10,3,18);
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES
(1,'Bulbasaur','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png','Planta-Veneno'),
(2,'Ivysaur','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png','Planta-Veneno'),
(3,'Venusaur','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png','Planta-Veneno'),
(4,'Charmander','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png','Fuego'),
(5,'Charmeleon','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png','Fuego'),
(6,'Charizard','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png','Fuego-Volador'),
(7,'Squirtle','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png','Agua'),
(8,'Wartortle','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png','Agua'),
(9,'Blastoise','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png','Agua'),
(10,'Articuno','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/144.png','Hielo-Volador'),
(11,'Zapdos','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png','Electrico-Volador'),
(12,'Moltres','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/146.png','Fuego-Volador'),
(13,'Dratini','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/147.png','Dragon'),
(14,'Dragonair','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/148.png','Dragon'),
(15,'Dragonite','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png','Dragon-Volador'),
(16,'Mewtwo','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png','Psiquico'),
(17,'Mew','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png','Psiquico'),
(18,'Chimchar','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/390.png','Fuego'),
(19,'Monferno','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/391.png','Fuego-Lucha'),
(20,'Infernape','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/392.png','Fuego-Lucha'),
(21,'Giratina','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/487.png','Fantasma-Dragon'),
(22,'Snorlax','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png','Normal');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_intercambio`
--

DROP TABLE IF EXISTS `registro_intercambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_intercambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_amigo` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  `id_pokemon_amigo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idUsuario` (`id_usuario`),
  KEY `fk_idAmigo` (`id_amigo`),
  KEY `fk_pokemon` (`id_pokemon`),
  KEY `fk_pokemonAmigo` (`id_pokemon_amigo`),
  CONSTRAINT `fk_idAmigo` FOREIGN KEY (`id_amigo`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_pokemon` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `fk_pokemonAmigo` FOREIGN KEY (`id_pokemon_amigo`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_intercambio`
--

LOCK TABLES `registro_intercambio` WRITE;
/*!40000 ALTER TABLE `registro_intercambio` DISABLE KEYS */;
INSERT INTO `registro_intercambio` VALUES
(1,1,4,5,16,'2023-08-04 17:00:00'),
(2,3,1,20,21,'2023-11-20 13:20:00'),
(3,4,2,3,19,'2023-05-16 19:45:00');
/*!40000 ALTER TABLE `registro_intercambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES
(1,'Jorge','Seijas Garcia','Calaverita','contraseña','jseijasg@gmail.com','2023-03-27 16:00:00','',''),
(2,'Gabriel','Alonso Varela','Gabalovar55','oculto123','galonsov@gmail.com','2023-10-10 09:30:00','',''),
(3,'Jacobo','Rodriguez Rial','Chocovpic','meGustaPHP','jrodriguezrw@gmail.com','2023-06-30 14:15:00','',''),
(4,'Rodrigo','Eiris Padin','elRodri','m1c4s43s4z2l','reirisp@gmail.com','2023-12-15 21:45:00','',''),
(6,'john','cena','Cenation','pbkdf2_sha256$720000$A0nQbYotip3xZCipYZwBTt$hhJvsgEjCEh0Xm3KOPOeP8g5Uoihknlmb+QvIUTAukc=','ejemplo@gmail.com','2024-01-31 13:43:07',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6bnVsbCwiZXhwIjoxNzA2Nzk0OTg3LCJpYXQiOjE3MDY3MDg1ODd9.g6o8FnfTYt0vvBlKEb2oeo-8jiHILpNPEqZ8dhqWIq8');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07 13:52:15
