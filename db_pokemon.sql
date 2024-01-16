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
  `id_usuario` int(11) NOT NULL,
  `id_amigo` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_amigo`),
  KEY `id_amigo` (`id_amigo`),
  CONSTRAINT `amigo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `amigo_ibfk_2` FOREIGN KEY (`id_amigo`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigo`
--

LOCK TABLES `amigo` WRITE;
/*!40000 ALTER TABLE `amigo` DISABLE KEYS */;
INSERT INTO `amigo` VALUES
(1,3),
(1,4),
(2,3),
(2,4),
(3,1),
(3,2),
(4,1),
(4,2);
/*!40000 ALTER TABLE `amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturado`
--

DROP TABLE IF EXISTS `capturado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capturado` (
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_pokemon`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `capturado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `capturado_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturado`
--

LOCK TABLES `capturado` WRITE;
/*!40000 ALTER TABLE `capturado` DISABLE KEYS */;
INSERT INTO `capturado` VALUES
(1,3),
(1,5),
(1,10),
(1,15),
(1,21),
(2,9),
(2,13),
(3,1),
(3,14),
(3,16),
(3,19),
(3,20),
(4,22);
/*!40000 ALTER TABLE `capturado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deseado`
--

DROP TABLE IF EXISTS `deseado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deseado` (
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_pokemon`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `deseado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `deseado_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deseado`
--

LOCK TABLES `deseado` WRITE;
/*!40000 ALTER TABLE `deseado` DISABLE KEYS */;
INSERT INTO `deseado` VALUES
(1,14),
(1,20),
(2,3),
(3,6),
(3,9),
(4,16);
/*!40000 ALTER TABLE `deseado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorito` (
  `id_usuario` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_pokemon`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES
(1,3),
(1,7),
(1,10),
(2,11),
(2,15),
(2,19),
(3,4),
(3,12),
(3,17),
(3,18);
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
  `id_usuario` int(11) NOT NULL,
  `id_amigo` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  `id_pokemon_amigo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_amigo`,`id_pokemon`,`id_pokemon_amigo`),
  KEY `id_amigo` (`id_amigo`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_pokemon_amigo` (`id_pokemon_amigo`),
  CONSTRAINT `registro_intercambio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `registro_intercambio_ibfk_2` FOREIGN KEY (`id_amigo`) REFERENCES `usuario` (`id`),
  CONSTRAINT `registro_intercambio_ibfk_3` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `registro_intercambio_ibfk_4` FOREIGN KEY (`id_pokemon_amigo`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_intercambio`
--

LOCK TABLES `registro_intercambio` WRITE;
/*!40000 ALTER TABLE `registro_intercambio` DISABLE KEYS */;
INSERT INTO `registro_intercambio` VALUES
(1,4,5,16,'2023-08-04 17:00:00'),
(3,1,20,21,'2023-11-20 13:20:00'),
(4,2,3,19,'2023-05-16 19:45:00');
/*!40000 ALTER TABLE `registro_intercambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(4,'Rodrigo','Eiris Padin','elRodri','m1c4s43s4z2l','reirisp@gmail.com','2023-12-15 21:45:00','','');
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

-- Dump completed on 2024-01-16 14:30:25
