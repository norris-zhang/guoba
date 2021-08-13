-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guobadb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `goba_age_group`
--

DROP TABLE IF EXISTS `goba_age_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goba_age_group` (
  `aggp_id` bigint NOT NULL AUTO_INCREMENT,
  `aggp_name` varchar(45) NOT NULL,
  `aggp_description` varchar(200) DEFAULT NULL,
  `aggp_last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aggp_last_updated_by` varchar(45) NOT NULL DEFAULT 'Unknown',
  `aggp_version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`aggp_id`),
  UNIQUE KEY `aggp_name_UNIQUE` (`aggp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goba_age_group`
--

LOCK TABLES `goba_age_group` WRITE;
/*!40000 ALTER TABLE `goba_age_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `goba_age_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goba_course`
--

DROP TABLE IF EXISTS `goba_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goba_course` (
  `cors_id` bigint NOT NULL AUTO_INCREMENT,
  `cors_title` varchar(200) NOT NULL,
  `cors_lecturer_id` bigint NOT NULL,
  `cors_cover_pic` blob,
  `cors_cover_pic_content_type` varchar(45) DEFAULT NULL,
  `cors_short_description` varchar(200) DEFAULT NULL,
  `cors_long_description` text,
  `cors_language` varchar(45) NOT NULL DEFAULT 'CN',
  `cors_length_in_minutes` int NOT NULL,
  `cors_age_group_id` bigint NOT NULL,
  `cors_tags` varchar(200) DEFAULT NULL,
  `cors_last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cors_last_updated_by` varchar(45) NOT NULL DEFAULT 'Unknown',
  `cors_version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cors_id`),
  UNIQUE KEY `uq_title_lecturer_language` (`cors_title`,`cors_lecturer_id`,`cors_language`) /*!80000 INVISIBLE */,
  KEY `fk_lecturer_id_idx` (`cors_lecturer_id`),
  KEY `fk_age_group_id_idx` (`cors_age_group_id`),
  CONSTRAINT `fk_age_group_id` FOREIGN KEY (`cors_age_group_id`) REFERENCES `goba_age_group` (`aggp_id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_lecturer_id` FOREIGN KEY (`cors_lecturer_id`) REFERENCES `goba_lecturer` (`lctr_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goba_course`
--

LOCK TABLES `goba_course` WRITE;
/*!40000 ALTER TABLE `goba_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `goba_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goba_course_category`
--

DROP TABLE IF EXISTS `goba_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goba_course_category` (
  `cate_id` bigint NOT NULL AUTO_INCREMENT,
  `cate_parent_cate_id` bigint DEFAULT NULL,
  `cate_name` varchar(45) NOT NULL,
  `cate_description` varchar(200) DEFAULT NULL,
  `cate_status` char(4) NOT NULL DEFAULT 'ACTV' COMMENT 'Course categories could be deleted or inactivated. In order not to affect the courses that are already referencing the category, deleting a category will mark the category as DLTD.',
  `cate_last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cate_last_updated_by` varchar(45) NOT NULL DEFAULT 'Unknown',
  `cate_version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`),
  UNIQUE KEY `uq_parent_cate_id_name` (`cate_parent_cate_id`,`cate_name`),
  KEY `fk_parent_cate_id_idx` (`cate_parent_cate_id`),
  CONSTRAINT `fk_parent_cate_id` FOREIGN KEY (`cate_parent_cate_id`) REFERENCES `goba_course_category` (`cate_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Multiple level course category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goba_course_category`
--

LOCK TABLES `goba_course_category` WRITE;
/*!40000 ALTER TABLE `goba_course_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `goba_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goba_lecturer`
--

DROP TABLE IF EXISTS `goba_lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goba_lecturer` (
  `lctr_id` bigint NOT NULL AUTO_INCREMENT,
  `lctr_title` varchar(45) NOT NULL,
  `lctr_first_name` varchar(45) NOT NULL,
  `lctr_last_name` varchar(45) NOT NULL,
  `lctr_profile_pic` varchar(200) DEFAULT NULL,
  `lctr_last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lctr_last_updated_by` varchar(45) NOT NULL DEFAULT 'Unknown',
  `lctr_version` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lctr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goba_lecturer`
--

LOCK TABLES `goba_lecturer` WRITE;
/*!40000 ALTER TABLE `goba_lecturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `goba_lecturer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-13 16:41:13
