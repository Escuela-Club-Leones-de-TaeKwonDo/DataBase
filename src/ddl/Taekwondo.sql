CREATE DATABASE  IF NOT EXISTS `taekwondo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `taekwondo`;
-- Host: localhost    Database: taekwondo
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tipo_evento`
--

DROP TABLE IF EXISTS `tipo_evento`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evento` (
  `id_tipo_evento` int NOT NULL AUTO_INCREMENT,
  `nombre` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY(`id_tipo_evento`)
)  ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(13),
  `id_tipo_evento` int,
  `fecha_inicio` date,
  `fecha_fin` date,
  `costo` float(6.2),
  `enlace_facebook` text,
  PRIMARY KEY(`id_evento`),
  FOREIGN KEY(`id_tipo_evento`) REFERENCES `tipo_evento` (`id_tipo_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examen` (
  `id_examen` int NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `tipo_examen` varchar(255),
  `fecha` date,
  `costo` float(6.2),
  `horario` datetime,
  `enlace_facebook` text,
  `lista_alumnos` text,
  `solicitud_examen` text,
  PRIMARY KEY(`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `apellidos` text,
  `fecha_nacimiento` date,
  `fotografia` text,
  `actividad` text,
  `grado` text,
  `seguro_medico` text,
  `certificado_medico` text,
  `carta_responsiva` text,
  `password` text,
  `email` text,
  PRIMARY KEY(`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evento_alumno`
--

DROP TABLE IF EXISTS `evento_alumno`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_alumno` (
  `id_alumno` integer,
  `id_evento` integer,
  FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examen_alumno`
--

DROP TABLE IF EXISTS `examen_alumno`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examen_alumno` (
  `id_alumno` integer,
  `id_examen` integer,
  FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client	  = @@character_set_client*/;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int NOT NULL AUTO_INCREMENT,
  `password` text,
  `email` text,
  PRIMARY KEY(`id_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;