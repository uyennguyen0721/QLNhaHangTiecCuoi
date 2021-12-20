-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlynhahangdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add drink bill detail',6,'add_drinkbilldetail'),(22,'Can change drink bill detail',6,'change_drinkbilldetail'),(23,'Can delete drink bill detail',6,'delete_drinkbilldetail'),(24,'Can view drink bill detail',6,'view_drinkbilldetail'),(25,'Can add food type',7,'add_foodtype'),(26,'Can change food type',7,'change_foodtype'),(27,'Can delete food type',7,'delete_foodtype'),(28,'Can view food type',7,'view_foodtype'),(29,'Can add menu drink',8,'add_menudrink'),(30,'Can change menu drink',8,'change_menudrink'),(31,'Can delete menu drink',8,'delete_menudrink'),(32,'Can view menu drink',8,'view_menudrink'),(33,'Can add payment method',9,'add_paymentmethod'),(34,'Can change payment method',9,'change_paymentmethod'),(35,'Can delete payment method',9,'delete_paymentmethod'),(36,'Can view payment method',9,'view_paymentmethod'),(37,'Can add service type',10,'add_servicetype'),(38,'Can change service type',10,'change_servicetype'),(39,'Can delete service type',10,'delete_servicetype'),(40,'Can view service type',10,'view_servicetype'),(41,'Can add wedding lobby',11,'add_weddinglobby'),(42,'Can change wedding lobby',11,'change_weddinglobby'),(43,'Can delete wedding lobby',11,'delete_weddinglobby'),(44,'Can view wedding lobby',11,'view_weddinglobby'),(45,'Can add user',12,'add_user'),(46,'Can change user',12,'change_user'),(47,'Can delete user',12,'delete_user'),(48,'Can view user',12,'view_user'),(49,'Can add wedding lobby price',13,'add_weddinglobbyprice'),(50,'Can change wedding lobby price',13,'change_weddinglobbyprice'),(51,'Can delete wedding lobby price',13,'delete_weddinglobbyprice'),(52,'Can view wedding lobby price',13,'view_weddinglobbyprice'),(53,'Can add service',14,'add_service'),(54,'Can change service',14,'change_service'),(55,'Can delete service',14,'delete_service'),(56,'Can view service',14,'view_service'),(57,'Can add menu food',15,'add_menufood'),(58,'Can change menu food',15,'change_menufood'),(59,'Can delete menu food',15,'delete_menufood'),(60,'Can view menu food',15,'view_menufood'),(61,'Can add invoice',16,'add_invoice'),(62,'Can change invoice',16,'change_invoice'),(63,'Can delete invoice',16,'delete_invoice'),(64,'Can view invoice',16,'view_invoice'),(65,'Can add feedback',17,'add_feedback'),(66,'Can change feedback',17,'change_feedback'),(67,'Can delete feedback',17,'delete_feedback'),(68,'Can view feedback',17,'view_feedback'),(69,'Can add application',18,'add_application'),(70,'Can change application',18,'change_application'),(71,'Can delete application',18,'delete_application'),(72,'Can view application',18,'view_application'),(73,'Can add access token',19,'add_accesstoken'),(74,'Can change access token',19,'change_accesstoken'),(75,'Can delete access token',19,'delete_accesstoken'),(76,'Can view access token',19,'view_accesstoken'),(77,'Can add grant',20,'add_grant'),(78,'Can change grant',20,'change_grant'),(79,'Can delete grant',20,'delete_grant'),(80,'Can view grant',20,'view_grant'),(81,'Can add refresh token',21,'add_refreshtoken'),(82,'Can change refresh token',21,'change_refreshtoken'),(83,'Can delete refresh token',21,'delete_refreshtoken'),(84,'Can view refresh token',21,'view_refreshtoken'),(85,'Can add id token',22,'add_idtoken'),(86,'Can change id token',22,'change_idtoken'),(87,'Can delete id token',22,'delete_idtoken'),(88,'Can view id token',22,'view_idtoken'),(89,'Can add association',23,'add_association'),(90,'Can change association',23,'change_association'),(91,'Can delete association',23,'delete_association'),(92,'Can view association',23,'view_association'),(93,'Can add code',24,'add_code'),(94,'Can change code',24,'change_code'),(95,'Can delete code',24,'delete_code'),(96,'Can view code',24,'view_code'),(97,'Can add nonce',25,'add_nonce'),(98,'Can change nonce',25,'change_nonce'),(99,'Can delete nonce',25,'delete_nonce'),(100,'Can view nonce',25,'view_nonce'),(101,'Can add user social auth',26,'add_usersocialauth'),(102,'Can change user social auth',26,'change_usersocialauth'),(103,'Can delete user social auth',26,'delete_usersocialauth'),(104,'Can view user social auth',26,'view_usersocialauth'),(105,'Can add partial',27,'add_partial'),(106,'Can change partial',27,'change_partial'),(107,'Can delete partial',27,'delete_partial'),(108,'Can view partial',27,'view_partial'),(109,'Can add rating',28,'add_rating'),(110,'Can change rating',28,'change_rating'),(111,'Can delete rating',28,'delete_rating'),(112,'Can view rating',28,'view_rating'),(113,'Can add cors model',29,'add_corsmodel'),(114,'Can change cors model',29,'change_corsmodel'),(115,'Can delete cors model',29,'delete_corsmodel'),(116,'Can view cors model',29,'view_corsmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-08-16 15:45:10.501773','1','FoodType object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Croissant tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Puff bacon & corn\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Pate chaud\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Croissant cheese\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Danish ham & cheese rolls\"}}]',7,1),(2,'2021-08-16 16:00:07.455240','2','FoodType object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 t\\u00f4m Th\\u00e1i Lan\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 \\u1ebfch n\\u01b0\\u1edbng m\\u1ee1 ch\\u00e0i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 gi\\u00f2 h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad h\\u1ea3i s\\u1ea3n ki\\u1ec3u Th\\u00e1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad s\\u00f2 \\u0111i\\u1ec7p tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad \\u1ee9c g\\u00e0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi m\\u1ef1c Th\\u00e1i Lan\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi c\\u1ee7 h\\u1ee7 d\\u1eeba t\\u00f4m th\\u1ecbt\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi th\\u1ed1t n\\u1ed1t t\\u00f4m th\\u1ecbt\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c chi\\u00ean x\\u00f9 s\\u1ed1t xo\\u00e0i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c nh\\u1ed3i tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c chi\\u00ean gi\\u00f2n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u00fa s\\u1ed1t chanh d\\u00e2y\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m rang tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi c\\u1ee7 h\\u1ee7 d\\u1eeba chay\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi g\\u00e0 x\\u00e9 phay chay\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 gi\\u00f2 rau c\\u1ee7\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad xo\\u00e0i n\\u1ea5m\"}}]',7,1),(3,'2021-08-16 16:14:36.488831','3','FoodType object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t rang mu\\u1ed1i H\\u1ed3ng K\\u00f4ng\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t chi\\u00ean gi\\u00f2n s\\u1ed1t tartar\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t \\u0111\\u00fat l\\u00f2 ph\\u00f4 mai\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t s\\u1ed1t t\\u1ecfi \\u1edbt\"}}]',7,1),(4,'2021-08-16 16:26:57.307086','4','FoodType object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm s\\u1ed1t gi\\u1ea5m \\u0111en\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm s\\u1ed1t kem chanh\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm \\u00e1p ch\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 cu\\u1ed9n bacon h\\u01b0\\u01a1ng th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 h\\u1ed3i \\u00e1p ch\\u1ea3o s\\u1ed1t cam v\\u00e0 h\\u01b0\\u01a1ng th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 h\\u1ed3i s\\u1ed1t b\\u01a1 chanh\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 t\\u1ea7m \\u0111\\u00fat l\\u00f2\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 b\\u1ed1ng m\\u00fa h\\u1ea5p H\\u1ed3ng K\\u00f4ng\"}}]',7,1),(5,'2021-08-16 16:31:46.497361','5','FoodType object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup tuy\\u1ebft nh\\u0129 cua g\\u00e0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup s\\u01b0\\u1eddn \\u0111\\u00f4ng tr\\u00f9ng h\\u1ea1 th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup chay th\\u1eadp c\\u1ea9m\"}}]',7,1),(6,'2021-08-16 16:36:15.938618','6','FoodType object (6)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m c\\u00e0ng xanh n\\u01b0\\u1edbng b\\u01a1 t\\u1ecfi\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m h\\u1ea5p n\\u01b0\\u1edbc d\\u1eeba\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u1ed1t g\\u1ea1ch cua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u00fa rang mu\\u1ed1i H\\u1ed3ng K\\u00f4ng\"}}]',7,1),(7,'2021-08-16 16:39:59.649251','7','FoodType object (7)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 \\u00dac s\\u1ed1t ti\\u00eau \\u0111en - Khoai t\\u00e2y\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 h\\u1ea7m s\\u1ed1t vang \\u0111\\u1ecf - B\\u00e1nh m\\u00ec\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 cu\\u1ed9n ph\\u00f4 mai s\\u1ed1t n\\u1ea5m\"}}]',7,1),(8,'2021-08-16 16:42:55.006648','8','FoodType object (8)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Heo s\\u1eefa quay - B\\u00e1nh bao h\\u1ea5p\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"S\\u01b0\\u1eddn n\\u01b0\\u1edbng m\\u1eadt ong\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"S\\u01b0\\u1eddn n\\u01b0\\u1edbng BBQ s\\u1ed1t cay\"}}]',7,1),(9,'2021-08-16 16:46:24.179840','9','FoodType object (9)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"V\\u1ecbt quay V\\u00e2n \\u0110\\u00ecnh  - B\\u00e1nh bao chi\\u00ean\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u00e0 n\\u01b0\\u1edbng s\\u1ed1t Teriyaki\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"\\u1ee8c v\\u1ecbt s\\u1ed1t ti\\u00eau \\u0111en\"}}]',7,1),(10,'2021-08-16 17:06:51.204824','10','FoodType object (10)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00fan x\\u00e0o Singapore\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u00ec x\\u00e0o h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n cua \\u0111\\u1ed3ng - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u t\\u00f4m Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u c\\u00e1 b\\u1edbp m\\u0103ng chua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u Th\\u00e1i chay\"}}]',7,1),(11,'2021-08-16 17:08:43.221256','10','FoodType object (10)',3,'',7,1),(12,'2021-08-16 17:14:59.600869','62','Lẩu Thái chay',3,'',15,1),(13,'2021-08-16 17:14:59.611182','61','Lẩu cá bớp măng chua',3,'',15,1),(14,'2021-08-16 17:14:59.620138','60','Lẩu hải sản Thái Lan - Bún tươi',3,'',15,1),(15,'2021-08-16 17:14:59.631092','59','Lẩu tôm Thái Lan - Bún tươi',3,'',15,1),(16,'2021-08-16 17:14:59.642125','58','Lẩu hải sản cua đồng - Bún tươi',3,'',15,1),(17,'2021-08-16 17:14:59.653601','57','Mì xào hải sản',3,'',15,1),(18,'2021-08-16 17:14:59.661726','56','Bún xào Singapore',3,'',15,1),(19,'2021-08-16 17:14:59.669723','55','Cơm chiên bào ngư',3,'',15,1),(20,'2021-08-16 17:14:59.678114','54','Cơm chiên hải sản',3,'',15,1),(21,'2021-08-16 17:18:41.142655','11','FoodType object (11)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00fan x\\u00e0o Singapore\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u00ec x\\u00e0o h\\u1ea3i s\\u1ea3n\"}}]',7,1),(22,'2021-08-16 17:24:27.462126','12','FoodType object (12)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n cua \\u0111\\u1ed3ng - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u t\\u00f4m Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u c\\u00e1 b\\u1edbp m\\u0103ng chua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u Th\\u00e1i chay\"}}]',7,1),(23,'2021-08-16 17:29:50.637925','13','FoodType object (13)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Mousse chanh mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Passion fruit layer cake\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Nho M\\u1ef9\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u00e8 h\\u1ea1t sen long nh\\u00e3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u00e8 kh\\u00fac b\\u1ea1ch\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Rau c\\u00e2u d\\u1eeba\"}}]',7,1),(24,'2021-08-16 17:36:40.156213','1','Nước suối',1,'[{\"added\": {}}]',8,1),(25,'2021-08-16 18:04:05.117988','2','Rượu vang đỏ',1,'[{\"added\": {}}]',8,1),(26,'2021-08-16 18:04:45.895035','3','Rượu vang trắng',1,'[{\"added\": {}}]',8,1),(27,'2021-08-16 18:17:18.333123','4','Champagne',1,'[{\"added\": {}}]',8,1),(28,'2021-08-17 06:29:36.980363','5','Bia Heineken chai',1,'[{\"added\": {}}]',8,1),(29,'2021-08-17 06:38:22.459198','6','Bia Heineken lon',1,'[{\"added\": {}}]',8,1),(30,'2021-08-17 06:44:18.183213','5','Bia Heineken chai',2,'[{\"changed\": {\"fields\": [\"Unit\"]}}]',8,1),(31,'2021-08-17 06:46:52.474227','7','Bia Tiger chai',1,'[{\"added\": {}}]',8,1),(32,'2021-08-17 06:50:55.681278','8','Bia Tiger lon',1,'[{\"added\": {}}]',8,1),(33,'2021-08-17 06:59:48.177595','9','Bia Sapporo chai',1,'[{\"added\": {}}]',8,1),(34,'2021-08-17 07:07:41.215928','10','Bia Sapporo lon',1,'[{\"added\": {}}]',8,1),(35,'2021-08-17 07:12:45.765108','11','Pepsi',1,'[{\"added\": {}}]',8,1),(36,'2021-08-17 07:18:45.539272','12','Mirinda soda kem',1,'[{\"added\": {}}]',8,1),(37,'2021-08-17 08:39:57.519480','1','Sảnh Tulip',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (1)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (2)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (3)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (4)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (5)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (6)\"}}]',11,1),(38,'2021-08-17 08:51:26.791776','2','Sảnh Rose',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (7)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (8)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (9)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (10)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (11)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (12)\"}}]',11,1),(39,'2021-08-17 08:59:18.811962','3','Sảnh Violet',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (13)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (14)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (15)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (16)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (17)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (18)\"}}]',11,1),(40,'2021-08-17 09:04:07.589283','4','Sảnh Gloria',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (19)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (20)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (21)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (22)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (23)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (24)\"}}]',11,1),(41,'2021-08-17 09:57:39.543226','1','ServiceType object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng hoa tr\\u00f2n 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng vu\\u00f4ng\"}}, {\"added\": {\"name\": \"service\", \"object\": \"c\\u1ed5ng hoa tr\\u00f2n 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng hoa vu\\u00f4ng\"}}]',10,1),(42,'2021-08-17 10:05:27.384303','2','ServiceType object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 3\"}}]',10,1),(43,'2021-08-17 10:06:27.279609','1','ServiceType object (1)',2,'[{\"changed\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng vu\\u00f4ng\", \"fields\": [\"Image\"]}}]',10,1),(44,'2021-08-17 10:07:56.394033','2','ServiceType object (2)',2,'[{\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 4\"}}]',10,1),(45,'2021-08-17 10:16:42.059675','3','ServiceType object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 3\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 4\"}}]',10,1),(46,'2021-08-17 10:17:20.832090','3','ServiceType object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(47,'2021-08-17 10:56:27.010792','4','ServiceType object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Ch\\u01a1i \\u0111\\u00e0n violin\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Ch\\u01a1i \\u0111\\u00e0n piano\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u00faa\"}}]',10,1),(48,'2021-08-17 11:08:47.633487','5','ServiceType object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Ban nh\\u1ea1c\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Ca s\\u0129\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1eabn ch\\u01b0\\u01a1ng tr\\u00ecnh - MC\"}}]',10,1),(49,'2021-08-17 11:13:10.475526','5','ServiceType object (5)',2,'[{\"added\": {\"name\": \"service\", \"object\": \"\\u0110\\u1ed9i kh\\u00e1nh ti\\u1ebft l\\u00e0m l\\u1ec5\"}}]',10,1),(50,'2021-08-17 11:13:44.961167','3','ServiceType object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(51,'2021-08-17 11:23:14.258945','6','ServiceType object (6)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Trang tr\\u00ed 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Trang tr\\u00ed 2\"}}]',10,1),(52,'2021-08-17 11:49:18.178248','6','ServiceType object (6)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(53,'2021-08-17 11:56:34.189183','7','ServiceType object (7)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 3\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 4\"}}]',10,1),(54,'2021-08-17 12:17:55.461447','8','ServiceType object (8)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"MC Ch\\u00fa h\\u1ec1\"}}]',10,1),(55,'2021-08-17 12:57:13.683839','9','ServiceType object (9)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu h\\u1ed9i ngh\\u1ecb 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu h\\u1ed9i ngh\\u1ecb 2\"}}]',10,1),(56,'2021-08-17 13:07:52.155882','10','ServiceType object (10)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng l\\u1edbp h\\u1ecdc\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng r\\u1ea1p h\\u00e1t\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng U-Shape\"}}]',10,1),(57,'2021-09-19 05:58:02.967190','4','Champagne',2,'[]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(29,'corsheaders','corsmodel'),(6,'NhaHangTiecCuoiApp','drinkbilldetail'),(17,'NhaHangTiecCuoiApp','feedback'),(7,'NhaHangTiecCuoiApp','foodtype'),(16,'NhaHangTiecCuoiApp','invoice'),(8,'NhaHangTiecCuoiApp','menudrink'),(15,'NhaHangTiecCuoiApp','menufood'),(9,'NhaHangTiecCuoiApp','paymentmethod'),(28,'NhaHangTiecCuoiApp','rating'),(14,'NhaHangTiecCuoiApp','service'),(10,'NhaHangTiecCuoiApp','servicetype'),(12,'NhaHangTiecCuoiApp','user'),(11,'NhaHangTiecCuoiApp','weddinglobby'),(13,'NhaHangTiecCuoiApp','weddinglobbyprice'),(19,'oauth2_provider','accesstoken'),(18,'oauth2_provider','application'),(20,'oauth2_provider','grant'),(22,'oauth2_provider','idtoken'),(21,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(23,'social_django','association'),(24,'social_django','code'),(25,'social_django','nonce'),(27,'social_django','partial'),(26,'social_django','usersocialauth');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-08-16 15:35:21.262352'),(2,'contenttypes','0002_remove_content_type_name','2021-08-16 15:35:21.484785'),(3,'auth','0001_initial','2021-08-16 15:35:22.508724'),(4,'auth','0002_alter_permission_name_max_length','2021-08-16 15:35:22.652741'),(5,'auth','0003_alter_user_email_max_length','2021-08-16 15:35:22.666741'),(6,'auth','0004_alter_user_username_opts','2021-08-16 15:35:22.681892'),(7,'auth','0005_alter_user_last_login_null','2021-08-16 15:35:22.697912'),(8,'auth','0006_require_contenttypes_0002','2021-08-16 15:35:22.715500'),(9,'auth','0007_alter_validators_add_error_messages','2021-08-16 15:35:22.744980'),(10,'auth','0008_alter_user_username_max_length','2021-08-16 15:35:22.768082'),(11,'auth','0009_alter_user_last_name_max_length','2021-08-16 15:35:22.801050'),(12,'auth','0010_alter_group_name_max_length','2021-08-16 15:35:22.937179'),(13,'auth','0011_update_proxy_permissions','2021-08-16 15:35:22.959964'),(14,'auth','0012_alter_user_first_name_max_length','2021-08-16 15:35:22.978103'),(15,'NhaHangTiecCuoiApp','0001_initial','2021-08-16 15:35:28.011984'),(16,'admin','0001_initial','2021-08-16 15:35:28.548214'),(17,'admin','0002_logentry_remove_auto_add','2021-08-16 15:35:28.569227'),(18,'admin','0003_logentry_add_action_flag_choices','2021-08-16 15:35:28.589139'),(19,'sessions','0001_initial','2021-08-16 15:35:28.722706'),(20,'NhaHangTiecCuoiApp','0002_alter_menudrink_image','2021-08-16 17:35:06.667221'),(21,'NhaHangTiecCuoiApp','0003_weddinglobby_description','2021-08-17 07:29:24.856440'),(22,'NhaHangTiecCuoiApp','0004_auto_20210817_1539','2021-08-17 08:39:32.581111'),(23,'NhaHangTiecCuoiApp','0005_alter_servicetype_event_type','2021-08-17 11:18:30.048673'),(24,'NhaHangTiecCuoiApp','0006_auto_20210818_1211','2021-08-18 05:11:14.274314'),(25,'oauth2_provider','0001_initial','2021-08-18 08:25:51.957297'),(26,'oauth2_provider','0002_auto_20190406_1805','2021-08-18 08:25:52.664748'),(27,'oauth2_provider','0003_auto_20201211_1314','2021-08-18 08:25:52.888418'),(28,'oauth2_provider','0004_auto_20200902_2022','2021-08-18 08:25:54.760889'),(29,'default','0001_initial','2021-08-19 08:18:58.072396'),(30,'social_auth','0001_initial','2021-08-19 08:18:58.078390'),(31,'default','0002_add_related_name','2021-08-19 08:18:58.102392'),(32,'social_auth','0002_add_related_name','2021-08-19 08:18:58.108393'),(33,'default','0003_alter_email_max_length','2021-08-19 08:18:58.130395'),(34,'social_auth','0003_alter_email_max_length','2021-08-19 08:18:58.138391'),(35,'default','0004_auto_20160423_0400','2021-08-19 08:18:58.164386'),(36,'social_auth','0004_auto_20160423_0400','2021-08-19 08:18:58.170389'),(37,'social_auth','0005_auto_20160727_2333','2021-08-19 08:18:58.203311'),(38,'social_django','0006_partial','2021-08-19 08:18:58.274370'),(39,'social_django','0007_code_timestamp','2021-08-19 08:18:58.341374'),(40,'social_django','0008_partial_timestamp','2021-08-19 08:18:58.421370'),(41,'social_django','0009_auto_20191118_0520','2021-08-19 08:18:58.541599'),(42,'social_django','0010_uid_db_index','2021-08-19 08:18:58.589431'),(43,'social_django','0004_auto_20160423_0400','2021-08-19 08:18:58.600064'),(44,'social_django','0003_alter_email_max_length','2021-08-19 08:18:58.605062'),(45,'social_django','0001_initial','2021-08-19 08:18:58.611266'),(46,'social_django','0005_auto_20160727_2333','2021-08-19 08:18:58.617264'),(47,'social_django','0002_add_related_name','2021-08-19 08:18:58.623266'),(48,'NhaHangTiecCuoiApp','0007_auto_20211117_1636','2021-11-17 09:37:06.220305'),(49,'corsheaders','0001_initial','2021-11-17 09:37:06.409309'),(50,'corsheaders','0002_alter_corsmodel_id','2021-11-17 09:37:06.699298'),(51,'NhaHangTiecCuoiApp','0008_alter_feedback_user','2021-12-04 13:34:05.239335'),(52,'NhaHangTiecCuoiApp','0009_invoice_session','2021-12-11 09:18:06.112065'),(53,'NhaHangTiecCuoiApp','0010_alter_invoice_session','2021-12-11 09:20:53.012959'),(54,'NhaHangTiecCuoiApp','0011_invoice_user','2021-12-14 08:10:38.798453');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a3pkrnbvxxs5rtou0epxi9p79g3pta8x','.eJxVjEEOwiAQRe_C2hAYpAwu3fcMBJipVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-txTzg-sO6B7rrcnc6rrMSe6KPGiXYyN-Xg_376DEXr71FK1RXmMm9kCavXEKYDBgzxNl8No4az07h9ElxYR5QLAJs1NKo0fx_gDGRDbM:1mFefk:CLVMu26HTlkAts3PycAy-L3twZdW6AZQ09a77Qi1X64','2021-08-30 15:37:08.653562'),('izikan6twhoel3bng8ix1lvafhzz7xfw','.eJxVjEEOwiAQRe_C2hAYpAwu3fcMBJipVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-txTzg-sO6B7rrcnc6rrMSe6KPGiXYyN-Xg_376DEXr71FK1RXmMm9kCavXEKYDBgzxNl8No4az07h9ElxYR5QLAJs1NKo0fx_gDGRDbM:1mgMcz:pcv_b_cVhSOWoBUANIByodG1AmUY_B2p4k4OH8tLem4','2021-11-12 07:48:41.605036'),('tjxmpca0pkvzobl5ff6t1wv3nfwswm2a','.eJxVjEEOwiAQRe_C2hAYpAwu3fcMBJipVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-txTzg-sO6B7rrcnc6rrMSe6KPGiXYyN-Xg_376DEXr71FK1RXmMm9kCavXEKYDBgzxNl8No4az07h9ElxYR5QLAJs1NKo0fx_gDGRDbM:1mRppa:saNuPhXOJkG-4Sjggboqal6p2izTMAGCmI3RClRzUDY','2021-10-03 05:57:38.007987'),('u2p89hpilnuwc8o7pl0beyjxg3ncu5se','.eJxVjEEOwiAQRe_C2hAYpAwu3fcMBJipVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-txTzg-sO6B7rrcnc6rrMSe6KPGiXYyN-Xg_376DEXr71FK1RXmMm9kCavXEKYDBgzxNl8No4az07h9ElxYR5QLAJs1NKo0fx_gDGRDbM:1mkMK3:YVPfiWI28oaFinBcVyO0FaLQ4wTYmYlT02PfQAhTdRQ','2021-11-23 08:17:39.591244');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drink_bill_detail`
--

DROP TABLE IF EXISTS `drink_bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drink_bill_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit_price` double NOT NULL,
  `quantity` int NOT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint NOT NULL,
  `menu_drink_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drink_bill_detail_invoice_id_a3667dcb_fk_invoice_id` (`invoice_id`),
  KEY `drink_bill_detail_menu_drink_id_6c7ecc8a_fk_menu_drink_id` (`menu_drink_id`),
  CONSTRAINT `drink_bill_detail_invoice_id_a3667dcb_fk_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `drink_bill_detail_menu_drink_id_6c7ecc8a_fk_menu_drink_id` FOREIGN KEY (`menu_drink_id`) REFERENCES `menu_drink` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drink_bill_detail`
--

LOCK TABLES `drink_bill_detail` WRITE;
/*!40000 ALTER TABLE `drink_bill_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `drink_bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint DEFAULT NULL,
  `updated_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_user_id_0104a377` (`user_id`),
  CONSTRAINT `feedback_user_id_0104a377_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'2021-11-30 12:11:37.287461','Nhà hàng phục vụ rất chu đáo!',4,'2021-11-30 12:11:37.288458'),(2,'2021-12-04 12:25:50.490255','Không gian đẹp và thoáng mát, nhân viên phục vụ tận tình.',11,'2021-12-04 12:25:50.490255'),(3,'2021-12-04 12:37:05.258701','Phục vụ tốt, không gian sạch sẽ.',7,'2021-12-04 12:37:05.258701'),(4,'2021-12-04 12:44:10.936651','Tôi cảm thấy rất hài lòng với cách phục vụ ở đây.',9,'2021-12-04 12:44:10.936651'),(5,'2021-12-04 12:52:58.503874','Không gian sach đẹp và trang trí bắt mắt, phục vụ tận tình.',10,'2021-12-04 12:52:58.503874'),(6,'2021-12-04 12:58:27.597976','Phục vụ tận tình, chu đáo!',12,'2021-12-04 12:58:27.597976'),(28,'2021-12-04 13:35:43.923949','Rất tận tình và tận tâm!',4,'2021-12-04 13:35:43.923949'),(29,'2021-12-04 13:37:59.212505','Tôi thích cách trang trí cũng như sự phục vụ ở đây.',8,'2021-12-04 13:37:59.212505');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_bill_detail`
--

DROP TABLE IF EXISTS `food_bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_bill_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit_price` double NOT NULL,
  `invoice_id` bigint NOT NULL,
  `menu_food_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_bill_detail`
--

LOCK TABLES `food_bill_detail` WRITE;
/*!40000 ALTER TABLE `food_bill_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
INSERT INTO `food_type` VALUES (1,'Bánh mặn khai vị'),(11,'Cơm - miến'),(2,'Khai vị ba món'),(7,'Món bò'),(4,'Món cá'),(3,'Món cua'),(9,'Món gà - vịt'),(8,'Món heo'),(12,'Món lẩu'),(5,'Món soup'),(6,'Món tôm'),(13,'Món tráng miệng');
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `party_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_quantity` int NOT NULL,
  `rental_date` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `lobby_price` double NOT NULL,
  `totalBill` double NOT NULL,
  `payment_method_id` bigint DEFAULT NULL,
  `wedding_lobby_id` bigint DEFAULT NULL,
  `session` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_payment_method_id_701b7a4d_fk_payment_method_id` (`payment_method_id`),
  KEY `invoice_wedding_lobby_id_ce5336ec_fk_wedding_lobby_id` (`wedding_lobby_id`),
  KEY `invoice_user_id_a981336c_fk_user_id` (`user_id`),
  CONSTRAINT `invoice_payment_method_id_701b7a4d_fk_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `invoice_user_id_a981336c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `invoice_wedding_lobby_id_ce5336ec_fk_wedding_lobby_id` FOREIGN KEY (`wedding_lobby_id`) REFERENCES `wedding_lobby` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_foods`
--

DROP TABLE IF EXISTS `invoice_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_foods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `menufood_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_foods_invoice_id_menufood_id_7ba6282e_uniq` (`invoice_id`,`menufood_id`),
  KEY `invoice_foods_menufood_id_106b867d_fk_menu_food_id` (`menufood_id`),
  CONSTRAINT `invoice_foods_invoice_id_fde2ff4f_fk_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `invoice_foods_menufood_id_106b867d_fk_menu_food_id` FOREIGN KEY (`menufood_id`) REFERENCES `menu_food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_foods`
--

LOCK TABLES `invoice_foods` WRITE;
/*!40000 ALTER TABLE `invoice_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_services`
--

DROP TABLE IF EXISTS `invoice_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_services_invoice_id_service_id_0244b19c_uniq` (`invoice_id`,`service_id`),
  KEY `invoice_services_service_id_7267714f_fk_service_id` (`service_id`),
  CONSTRAINT `invoice_services_invoice_id_b74bbd49_fk_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `invoice_services_service_id_7267714f_fk_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_services`
--

LOCK TABLES `invoice_services` WRITE;
/*!40000 ALTER TABLE `invoice_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_drink`
--

DROP TABLE IF EXISTS `menu_drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_drink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_drink`
--

LOCK TABLES `menu_drink` WRITE;
/*!40000 ALTER TABLE `menu_drink` DISABLE KEYS */;
INSERT INTO `menu_drink` VALUES (1,'Nước suối',100000,1,'img/drink/Nước_lọc.jpg','bình'),(2,'Rượu vang đỏ',2000000,1,'img/drink/Red_win.jpg','chai'),(3,'Rượu vang trắng',1600000,1,'img/drink/White_win.jpg','chai'),(4,'Champagne',4000000,1,'img/drink/Champagne.jpg','chai'),(5,'Bia Heineken chai',540000,1,'img/drink/Heineken_chai.jpg','két'),(6,'Bia Heineken lon',650000,1,'img/drink/Heineken_lon.jpg','thùng'),(7,'Bia Tiger chai',360000,1,'img/drink/Tiger_chai.jpg','két'),(8,'Bia Tiger lon',400000,1,'img/drink/Tiger_lon.jpg','thùng'),(9,'Bia Sapporo chai',370000,1,'img/drink/Sapporo_chai.jpg','két'),(10,'Bia Sapporo lon',420000,1,'img/drink/Sapporo_lon.jpg','thùng'),(11,'Pepsi',240000,1,'img/drink/Pepsi.jpg','thùng'),(12,'Mirinda soda kem',204000,1,'img/drink/Mirinda_soda_kem.jpg','thùng');
/*!40000 ALTER TABLE `menu_drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_food`
--

DROP TABLE IF EXISTS `menu_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vegetarian` tinyint(1) NOT NULL,
  `food_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `menu_food_food_type_id_6c0b1c04_fk_food_type_id` (`food_type_id`),
  CONSTRAINT `menu_food_food_type_id_6c0b1c04_fk_food_type_id` FOREIGN KEY (`food_type_id`) REFERENCES `food_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_food`
--

LOCK TABLES `menu_food` WRITE;
/*!40000 ALTER TABLE `menu_food` DISABLE KEYS */;
INSERT INTO `menu_food` VALUES (1,'Croissant trứng muối',500000,1,'Bánh Croissant có nguồn gốc từ Áo được sản xuất từ bột mì, men, bơ, sữa, và muối. Ẩn dưới lớp bánh nóng giòn bên ngoài là lớp trứng muối sánh mịn, đậm đà, bùi bùi, béo ngọt, sóng sánh vàng ươm hòa lẫn với trứng muối mằn mặn. Chiếc bánh nhỏ nhắn, xinh xắn, kết hợp đặc biệt với độ mềm dẻo bên trong, giòn tan bên ngoài của croissant, vỏ bánh màu vàng cánh gián đẹp mắt.','img/food/Croissant_trứng_muối.jpg',0,1),(2,'Puff bacon & corn',500000,1,'Bánh cuộn giòn với ngô ngọt, thịt xông khói và phô mai mozzarella.','img/food/Puff_bacon__corn.jpg',0,1),(3,'Pate chaud',400000,1,'Pate chaud là một loại bánh có nguồn gốc từ Pháp có vỏ bằng bột mì và bơ nướng lò, bên trong có nhân thịt heo, nấm mèo và hành khô. Bánh ngọt có lớp vỏ mỏng nhẹ bên ngoài với nhân thịt.','img/food/Pate_chaud.jpg',0,1),(4,'Croissant cheese',500000,1,'Bánh Croissant có nguồn gốc từ Áo được sản xuất từ bột mì, men, bơ, sữa, và muối. Ẩn dưới lớp bánh nóng giòn bên ngoài là lớp phô mai sánh mịn, đậm đà, béo ngọt. Chiếc bánh nhỏ nhắn, xinh xắn, kết hợp đặc biệt với độ mềm dẻo bên trong, giòn tan bên ngoài của croissant, vỏ bánh màu vàng cánh gián đẹp mắt.','img/food/Croissant_cheese.jpg',0,1),(5,'Danish ham & cheese rolls',400000,1,'Danish ham & cheese rolls được làm từ 5 nguyên liệu: bánh phồng, mù tạt, giăm bông, phô mai và trứng. Sự kết hợp giữa giăm bông mặn và phô mai tan chảy kèm theo bánh ngọt bơ tạo nên một hương vị cuốn hút khó cưỡng.','img/food/Danish_ham__cheese_rolls.jpg',0,1),(6,'Chả tôm Thái Lan',100000,1,'Chả tôm kiểu Thái thu hút người thưởng thức bởi vẻ đẹp tươi sáng bên ngoài và hương vị thơm ngon bên trong. Cái giòn rợm của bột áo ở ngoài kết hợp với vị ngọt đậm đà của tôm ở trong chắc chắn sẽ làm bạn không thể chối từ.','img/food/Chả_tôm_Thái_Lan.jpg',0,2),(7,'Chả ếch nướng mỡ chài',150000,1,'Sự kết hợp giữa hương vị thơm ngon, ngọt của thịt và béo ngậy của mỡ, nước chấm đủ vị chua, cay, mặn, ngọt tạo nên bức tranh hương vị sống động, ngọt ngào, đậm vị.','img/food/Chả_ếch_nướng_mỡ_chài.jpg',0,2),(8,'Chả giò hải sản',100000,1,'Chả giò giòn rụm với nhân hải sản gồm tôm, mực tươi ngon bên trong sẽ là món ăn khai vị hấp dẫn cho các bữa tiệc.','img/food/Chả_giò_hải_sản.jpg',0,2),(9,'Salad hải sản kiểu Thái',150000,1,'Món salad hải sản kiểu Thái giòn, mát, sảng khoái với vị chua cay dịu nhẹ sẽ giải thoát bạn khỏi cái nắng nóng bức bối của mùa hè.','img/food/Salad_hải_sản_kiểu_Thái.jpg',0,2),(10,'Salad sò điệp trứng muối',200000,1,'Salad sò điệp trứng muối là một món ăn có đủ màu: màu xanh của rau, màu vàng và đỏ của ớt chuông, màu cam của cà rốt, màu của lòng đỏ trứng vịt muối.','img/food/Salad_sò_điệp_trứng_muối.jpg',0,2),(11,'Salad ức gà',300000,1,'Salad ức gà là món ăn ngon miệng, không gây béo, được nhiều bạn đang giảm cân ưa chuộng.','img/food/Salad_ức_gà.jpg',0,2),(12,'Gỏi mực Thái Lan',150000,1,'Thịt mực ngọt thanh tự nhiên, rau củ giòn ngon tươi mát quyện cùng với vị cay nồng chua chua của nước sốt, tổng thể tạo nên một món gỏi mực Thái Lan khó quên trong lòng người ăn.','img/food/Gỏi_mực_Thái_Lan.jpg',0,2),(13,'Gỏi củ hủ dừa tôm thịt',150000,1,'Gỏi củ hủ dừa tôm thịt là món ngon dân dã của người miền Tây. Củ hủ dừa là phần non nhất trên đọt cây dừa, có vị ngọt, mềm khó cưỡng dù là ăn sống hay bóp gỏi.','img/food/Gỏi_củ_hủ_dừa_tôm_thịt.jpg',0,2),(14,'Gỏi thốt nốt tôm thịt',150000,1,'Sự kết hợp giữa vị đậm đà của thịt, vị tươi ngon của tôm, vị ngon ngọt của thốt nốt làm nên một gỏi hấp dẫn, ngon miệng.','img/food/Gỏi_thốt_nốt_tôm_thịt.jpg',0,2),(15,'Mực chiên xù sốt xoài',150000,1,'Mực chiên xù có lẽ không còn xa lạ với nhiều người, nhưng món ăn trở nên hấp dẫn hơn nhiều khi được kết hợp với xốt xoài thơm mịn.','img/food/Mực_chiên_xù_sốt_xoài.jpg',0,2),(16,'Mực nhồi trứng muối',200000,1,'Với sự tươi ngon của mực và sự béo béo bùi bùi của trứng muối đã tạo nên một món ăn thơm ngon, tròn vị.','img/food/Mực_nhồi_trứng_muối.jpg',0,2),(17,'Mực chiên giòn',150000,1,'Mực có vị ngọt tự nhiên, dai dai được tẩm ướp gia vị và phủ lớp bột bên ngoài mang đén cảm giác giòn rụm và đậm đà cho người thưởng thức.','img/food/Mực_chiên_giòn.jpg',0,2),(18,'Tôm sú sốt chanh dây',200000,1,'Tôm sú chanh dây vừa ngon lại có vị thơm thơm, chua chua, ngọt ngọt vô cùng thú vị','img/food/Tôm_sú_sốt_chanh_dây.jpg',0,2),(19,'Tôm rang trứng muối',300000,1,'Trứng muối béo béo, thơm thơm, rang cùng tôm hợp đến lạ kỳ đem đến một món ăn lạ miệng nhưng rất ngon.','img/food/Tôm_rang_trứng_muối.jpg',0,2),(20,'Gỏi củ hủ dừa chay',100000,1,'Gỏi củ hũ dừa chay với độ giòn giòn của hũ dừa, chua ngọt của mắm chấm chay rất thích hợp để làm món khai vị trong các bữa tiệc chay.','img/food/Gỏi_củ_hủ_dừa_chay.jpg',1,2),(21,'Gỏi gà xé phay chay',100000,1,'Gỏi gà xe phay chay có hương vị vô cùng thơm ngon vài hài hòa. Phần rau thơm ăn kèm với mì căn xé sợi được nêm nếm gia vị vừa miệng và mang đến hương vị tươi mát của món gỏi.','img/food/Gỏi_gà_xé_chay.jpg',1,2),(22,'Chả giò rau củ',100000,1,'Với sự tươi ngon từ rau củ tạo đã tạo nên những cuốn chả giò ngon miệng cho thực khách.','img/food/Chả_giò_rau_củ.jpg',1,2),(23,'Salad xoài nấm',100000,1,'Salad xoài nấm món ăn khai vị yêu thích của rất nhiều thực khách, món ăn với hai nguyên liệu chính là xoài  và nấm kèm theo vị nước sốt chanh leo chua ngọt dịu nhẹ.','img/food/Salad_xoài_nấm.jpg',1,2),(24,'Cua lột rang muối Hồng Kông',1500000,1,'Cua sau khi rang chuyển thành gam màu cam bóng thu rút ánh nhìn từ mọi phía kết hợp với vị muối Hồng Kong mặn mặn tạo nên một món ăn ngon miệng khó cưỡng.','img/food/Cua_lột_rang_muối_Hồng_Kông.jpg',0,3),(25,'Cua lột chiên giòn sốt tartar',1500000,1,'Khác với món Cua lột chiên kiểu truyền thống, cua lột chiên sốt Tartar là một loại món ăn được chế biến theo phong cách của người Tây Ban Nha. Món cua này khi ăn sẽ được chấm kèm một loại sốt có tên là tartar vô cùng lạ miệng.','img/food/Cua_lột_chiên_giòn_sốt_tartar.jpg',0,3),(26,'Cua lột đút lò phô mai',1500000,1,'Những con cua căng tròn, vàng ươm, tỏa mùi thơm nức, chưa cần ăn, món cua đút lò với phô mai đã khiến con mắt bạn thỏa thuê bởi màu sắc hấp dẫn của nó!','img/food/Cua_lột_đút_lò_phô_mai.jpg',0,3),(27,'Cua lột sốt tỏi ớt',1500000,1,'Sự béo ngậy, tươi ngon của cua cùng mùi thơm phức, cay cay của tỏi ớt tạo cảm giác thích thú và ngon miệng cho thực khách.','img/food/Cua_lột_sốt_tỏi_ớt.jpg',0,3),(28,'Cá chẽm sốt giấm đen',1000000,1,'Thịt cá chẽm kết hợp cùng xốt giấm đen sẽ mang đến cho bạn một món ăn hoàn chỉnh cả về hương vị lẫn hình thức. Thịt cá mềm ngọt thấm đẫm nước xốt cuốn hút mọi thực khách dù là người khó tính nhất. Không chỉ dừng lại ở cá chẽm và xốt giấm đen, bạn còn được tận hưởng hương vị thanh mát cùng mùi thơm đặc trưng của các loại rau củ áp chảo ăn kèm.','img/food/Cá_chẽm_sốt_giấm_đen.jpg',0,4),(29,'Cá chẽm sốt kem chanh',1000000,1,'Cá chẽm được chiên vừa chín tới, kết hợp xốt vị béo chua hài hòa tạo nên món ăn vừa ngon miệng, vừa bổ dưỡng.','img/food/Cá_chẽm_sốt_kem_chanh.jpg',0,4),(30,'Cá chẽm áp chảo',1000000,1,'Cá chẽm được phi lê tẩm ướp gia vị vừa phải áp chảo ăn kèm với một ít sốt hoa quả ngọt vị sánh mịn.','img/food/Cá_chẽm_áp_chảo.jpg',0,4),(31,'Cá cuộn bacon hương thảo',1000000,1,'Thử chút hương vị của ẩm thực phương Tây cho món Cá cuộn bacon hương thảo để bữa ăn nhà bạn thêm mới lạ nhé. Từng lớp thịt bacon nâu sém quyện với mùi hương thảo thơm nức cuộn miếng cá ngọt mềm bên trong, chấm thêm tí sốt thì thật tuyệt vời!','img/food/Cá_cuộn_bacon_hương_thảo.jpg',0,4),(32,'Cá hồi áp chảo sốt cam và hương thảo',1200000,1,'Cá hồi áp chảo sốt cam và hương thảo là một món ăn chuẩn bếp Âu. Cá hồi áp chảo đúng độ sẽ giòn vàng bên ngoài nhưng vẫn mềm, ngọt bên trong. Vị cam và hương thảo tươi còn khiến món cá thơm, ngọt tự nhiên chắc chắn khiến thực khách hứng thú và sản khoái.','img/food/Cá_hồi_áp_chảo_sốt_cam.jpg',0,4),(33,'Cá hồi sốt bơ chanh',1200000,1,'Cá hồi sốt bơ chanh mang hương vị lôi cuốn từ vị chua chua của chanh và bị béo béo của cá.','img/food/Cá_hồi_sốt_bơ_chanh.jpg',0,4),(34,'Cá tầm đút lò',1100000,1,'Cá tầm đút lò mang hương vị Á - Âu thơm ngon, mềm mại khiến thực khách không thể chối từ.','img/food/Cá_tầm_đút_lò.jpg',0,4),(35,'Cá bống mú hấp Hồng Kông',1200000,1,'Món cá mú hấp Hồng Kông là món ăn đặc sắc của người Hoa, lại có thể nổi danh ở nhiều nước bởi hương vị thơm ngon, đặc biệt của nó.','img/food/Cá_bống_mú_hấp_Hồng_Kông.jpg',0,4),(36,'Soup hải sản',300000,1,'Súp hải sản một trong những món ăn được cả người lớn cũng như trẻ em yêu thích. Với những nguyên liệu chính đó là mực ống, thịt cua, tôm, ... và rau củ làm cho món ăn có độ dinh dưỡng cao và đậm đà ngọt vị.','img/food/Soup_hải_sản.jpg',0,5),(37,'Soup tuyết nhĩ cua gà',320000,1,'Súp gà nấm tuyết nóng hổi thanh mát và giòn ngọt cho thực đơn khai vị ngày đông cực hấp dẫn và bổ dưỡng.','img/food/Soup_tuyết_nhĩ_cua_gà.jpg',0,5),(38,'Soup sườn đông trùng hạ thảo',400000,1,'Soup sườn đông trùng hạ thảo vừa ngon vừa tốt cho sức khỏe và phòng ngừa một số bệnh.','img/food/Soup_sườn_đông_trùng_thảo.jpg',0,5),(39,'Soup bào ngư',500000,1,'Soup bào ngư vừa thơm ngon tròn vị vừa bổ khỏe, tốt cho sức khỏe.','img/food/Soup_bào_ngư.jpg',0,5),(40,'Soup chay thập cẩm',250000,1,'Soup chay rau củ quả','img/food/Soup_chay_thập_cẩm.jpg',1,5),(41,'Tôm càng xanh nướng bơ tỏi',300000,1,'Tôm càng xanh nướng bơ tỏi là sự kết hợp hoàn hảo giữa hương vị tươi ngon từ biển hoà với hương thơm từ tỏi quyện chút vị béo của bơ, là một món nướng hấp dẫn trong các buổi tiệc.','img/food/Tôm_càng_xanh_nướng_bơ_tỏi.jpg',0,6),(42,'Tôm hấp nước dừa',500000,1,'Với những chú tôm thơm ngọt có thêm mùi thơm và vị ngậy của dừa. Khi ăn nếu không thích ăn vỏ các bạn có thể bóc vỏ tôm và chấm cùng với phần nước sốt bên trong trái dừa.','img/food/Tôm_hấp_nước_dừa.jpg',0,6),(43,'Tôm sốt gạch cua',700000,1,'Món tôm sốt gạch cua cùng với hương vị ngon miệng và vô cùng mới lạ cùng với vị bùi bùi mằn mặn của trứng muối, cùng vị đậm đà của gạch cua tạo thành món xốt ngon không thể cưỡng lại được.','img/food/Tôm_sốt_gạch_cua.jpg',0,6),(44,'Tôm sú rang muối Hồng Kông',450000,1,'Hương vị đặc biệt hấp dẫn và đậm đà, ăn cực kì lạ miệng.Tôm sú rang muối với nhiều sự kết hợp, từ việc lựa chọn nguyên liệu tươi ngon, đến kỹ thuật tẩm ướp gia vị, kỹ thuật nướng hay cách làm muối tiêu chấm kèm tạo nên một món ăn ngon tròn vị.','img/food/Tôm_sú_rang_muối_Hồng_Kông.jpg',0,6),(45,'Bò Úc sốt tiêu đen - Khoai tây',1500000,1,'Bò bít tết là món ăn được biết đến khá nhiều tại các nhà hàng, quán ăn. Đây là món ăn được trình bày đẹp mắt, có hơi hướng sang chảnh và hương vị thì khỏi phải bàn, nhất là phần nước sốt tiêu đen.','img/food/Bò_Úc_sốt_tiêu_đen.jpg',0,7),(46,'Bò hầm sốt vang đỏ - Bánh mì',1000000,1,'Bò sốt vang là món ăn quen thuộc đối với nhiều người. Đây là món bò dễ chế biến có thể ăn kèm với cơm, bún hoặc bánh mì.','img/food/Bò_hầm_sốt_vang_đỏ.jpg',0,7),(47,'Bò cuộn phô mai sốt nấm',1200000,1,'Bò cuộn phô mai sốt nấm hương với thịt bò tươi ngon quyện cùng phô mai béo ngậy tạo cảm giác ngon miệng và hấp dẫn thực khách từ miếng đầu tiên.','img/food/Bò_cuộn_phô_mai_sốt_nấm.jpg',0,7),(48,'Heo sữa quay - Bánh bao hấp',1500000,1,'Món Heo Sữa Quay Flyfood hấp dẫn bởi miếng thịt quay màu vàng nâu đẹp mắt, mềm và ngọt, lớp da bên ngoài giòn tan, thơm bùi.','img/food/Heo_sữa_quay.jpg',0,8),(49,'Sườn nướng mật ong',450000,1,'Sườn nướng mật ong là một món ăn rất được ưa chuộng bởi hương vị đậm đà khó quên.','img/food/Sườn_nướng_mật_ong.jpg',0,8),(50,'Sườn nướng BBQ sốt cay',450000,1,'Sườn nướng BBQ sốt cay với hương vị cay cay của tương ớt gochujang, lớp da giòn tan hòa quyện cùng thịt sườn mọng nước.','img/food/Sườn_BBQ_sốt_cay.jpg',0,8),(51,'Vịt quay Vân Đình  - Bánh bao chiên',500000,1,'Mùi thơm đặc trưng của vịt chín với màu nâu bánh mật, giòn giòn và béo béo. Trong đó thì bánh bao luôn là thực phẩm đi kèm giúp làm tăng hương vị và thực khách sẽ không bị ngán. Với sự kết hợp hài hòa đậm chất này chắc chắn sẽ không làm cho thực khách thất vọng','img/food/Vịt_quay.jpg',0,9),(52,'Gà nướng sốt Teriyaki',800000,1,'Không còn gì tuyệt vời hơn khi cùng bạn bè và người thân thưởng thức những miếng gà nướng vàng ruộm, thấm đẫm gia vị, mềm ngọt, béo ngậy với nước xốt teriyaki đậm đà.','img/food/Gà_nướng_sốt_Teriyaki.jpg',0,9),(53,'Ức vịt sốt tiêu đen',800000,1,'Ức vịt quay với lớp da ngoài ngoài giòn rụm, thơm ngon, cay cay, ngọt thịt rất hấp dẫn.','img/food/ức_vịt_sốt_tiêu_đen.jpg',0,9),(63,'Cơm chiên hải sản',300000,1,'Với món cơm này vừa đảm bảo ngon miệng mà còn cung cấp đầy đủ chất dinh dưỡng.','img/food/Cơm_chiên_hải_sản.png',0,11),(64,'Cơm chiên bào ngư',500000,1,'Các món ăn chế biến từ bào ngư đều mang hương vị thơm ngon và ngọt ngào riêng. Đặc biệt, món cơm chiên bào ngư chắc chắn sẽ khiến bạn ngất ngây.','img/food/Cơm_chiên_bào_ngư.jpg',0,11),(65,'Bún xào Singapore',300000,1,'Món bún xào độc đáo theo công thức kiểu Singapore cực kì thơm ngon với những sợi bún thấm vị dầu mè kết hợp cùng tôm, thịt, trứng đầy đủ dinh dưỡng hòa quyện cùng nước sốt tương đậm đà cho bạn bữa ăn ngon miệng và đủ chất.','img/food/Bún_xào_Singapore_YzSajr9.jpg',0,11),(66,'Mì xào hải sản',300000,1,'Mì xào hải sản là một món ăn rất ngon, hòa trộn những miếng hải sản thơm ngon cùng với những loại rau củ, xào chung với nhau cùng với vị chua chua ngọt ngọt, tạo nên một món ăn vô cùng tuyệt hảo','img/food/Mì_trộn_hải_sản.jpg',0,11),(67,'Lẩu hải sản cua đồng - Bún tươi',1500000,1,'Trong các món lẩu đặc trưng hương vị truyền thống ẩm thực Việt thì lẩu riêu cua đồng xứng đáng được xếp vào TOP những món lẩu ngon được nhiều người yêu thích nhất. Món lẩu dân dã này luôn để lại dư vị khó quên cho những ai từng thưởng thức.','img/food/Lẩu_hải_sản_cua_đồng.jpg',0,12),(68,'Lẩu tôm Thái Lan - Bún tươi',1500000,1,'Lẩu tôm Thái Lan là sự kết hợp hài hòa giữa hải sản cùng vị chua chua, cay cay đặc trưng của xứ sở chùa Vàng thì Lẩu tôm Thái Lan là sự chọn thích hợp nhất. Với nguyên liệu chính là tôm ngon đặc biệt có lớp vỏ săn chắc và thịt cho vị thơm, mềm ngọt khi chín tới, giàu dinh dưỡng mà không kém phần thanh ngọt. Nước lẩu là sự kết hợp của một chút cay của gừng, ớt, vị nồng của tiêu, vị ngọt từ nước hầm, thơm và cà chua. Màu đỏ au của tôm hòa cùng sắc tươi của cà chua hấp dẫn bất cứ ai ngay từ khi vừa mới đem ra.','img/food/Lẩu_tôm_Thái_Lan.jpg',0,12),(69,'Lẩu hải sản Thái Lan - Bún tươi',1500000,1,'Lẩu hải sản Thái Lan là món ăn biến thể từ món canh chua Tom yum nổi tiếng của Thái Lan. Nguyên liệu để làm ra một nồi lẩu Thái rất phong phú, đó là thịt bò, thịt gà, hải sản, chả cá, nấm và các loại rau xanh.','img/food/Lẩu_hải_sản.jpg',0,12),(70,'Lẩu cá bớp măng chua',1500000,1,'Lẩu cá bớp măng chua là một trong những món lẩu được nhiều người say mê bởi vị ngon khó cưỡng.','img/food/Lẩu_cá_bớp_nấu_măng_chua.jpg',0,12),(71,'Lẩu Thái chay',700000,1,'Nước lẩu nấm thái có vị chua chua cay cay hương vị đậm đà, thơm ngon. Bạn có thể ăn lẩu thái chay kèm bún tươi, rắc thêm rau thơm, tỏi tây để tận hưởng cảm giác tuyệt vời nhất.','img/food/Lẩu_Thái_chay.jpg',1,12),(72,'Mousse chanh muối',300000,1,'Bánh mousse chanh muối mát mẻ tươi mới, mang lại vị bánh không quá ngọt bởi nguyên liệu mà cứ thanh mát, sảng khoái.','img/food/Mousse_chanh_muối.jpg',0,13),(73,'Passion fruit layer cake',300000,1,'Passion fruit layer cake hương vị kiwi','img/food/Passion_fruit_and_kiwi_cheesecake.jpg',0,13),(74,'Nho Mỹ',500000,1,'Nho Mỹ tươi ngon là một món tráng miệng được nhiều người ưa chuộng.','img/food/Nho_Mỹ.jpg',1,13),(75,'Chè hạt sen long nhãn',300000,1,'Chè sen long nhãn là một món ăn cực kỳ bổ dưỡng. Hiện đang được rất nhiều người yêu thích, bởi lợi ích mà nó mang lại cực kỳ lớn.','img/food/Chè_hạt_sen_long_nhãn.jpg',1,13),(76,'Chè khúc bạch',300000,1,'Chè khúc bạch là món chè ưa thích của mọi người và rát thích hợp để giải nhiệt mùa hè. Những miếng khúc bạch thơm béo và mềm mịn hòa quyện với nước đường và các topping ngon miệng như hạnh nhân, hạt chia sẽ khiến bạn mê mẩn khi thưởng thức.','img/food/Chè_khúc_bạch.jpg',1,13),(77,'Rau câu dừa',300000,1,'Món thạch dừa mát lạnh chưa bao giờ hết hấp dẫn vào mỗi mùa hè, từng miếng thạch trong mát, thơm ngọt tan trọng miệng giúp bạn quên đi cái nóng, cái nắng chói trang.','img/food/Rau_câu_dừa.jpg',1,13);
/*!40000 ALTER TABLE `menu_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'q8lKbrpUvJzPKr0QklLLIwq2L2s1do','2021-08-18 19:16:04.039285','read write',1,1,'2021-08-18 09:16:04.040287','2021-08-18 09:16:04.040287',NULL,NULL),(2,'6DyNMb1GZSVdjralZDPJyGfO1RBtRr','2021-08-19 02:06:17.552548','read write',1,4,'2021-08-18 16:06:17.553554','2021-08-18 16:06:17.553554',NULL,NULL),(3,'wQhbWC3SF0pP5svv5E9iJw5ZST64K1','2021-10-29 18:11:52.181451','read write',1,4,'2021-10-29 08:11:52.182452','2021-10-29 08:11:52.182452',NULL,NULL),(4,'P4AyAtm5HdBLl2MBBY2Mfi9EGKBbxa','2021-10-30 00:06:25.081889','read write',1,4,'2021-10-29 14:06:25.081889','2021-10-29 14:06:25.082887',NULL,NULL),(5,'w2avmCD3tA2zoWJl9b7no6SZYuvGIO','2021-10-30 00:06:26.858886','read write',1,4,'2021-10-29 14:06:26.861888','2021-10-29 14:06:26.861888',NULL,NULL),(6,'p3YSp3bEAu5xdzC8Gl7H5koVkVHHio','2021-10-30 00:22:33.712812','read write',1,4,'2021-10-29 14:22:33.713813','2021-10-29 14:22:33.713813',NULL,NULL),(7,'0jlloD2do82Fqz32A7yta7yfBlkTaP','2021-10-30 01:13:39.881503','read write',1,4,'2021-10-29 15:13:39.882497','2021-10-29 15:13:39.882497',NULL,NULL),(8,'r1IoKIMxh5wiwloJCwKKyOEeAduAUU','2021-10-31 17:06:49.643333','read write',1,6,'2021-10-31 07:06:49.643333','2021-10-31 07:06:49.644332',NULL,NULL),(9,'fmgn3rvDxum7S4Pt1cc4bSBpSeAF32','2021-10-31 18:07:30.737038','read write',1,9,'2021-10-31 08:07:30.738033','2021-10-31 08:07:30.738033',NULL,NULL),(10,'JAvJQFMCLkMNgKui4Kn6N3lnaqmbig','2021-10-31 18:27:10.679610','read write',1,10,'2021-10-31 08:27:10.680605','2021-10-31 08:27:10.680605',NULL,NULL),(11,'z7ohrEhjYEi9XcKdatHIjgXcExfyt4','2021-11-02 02:23:24.509449','read write',1,11,'2021-11-01 16:23:24.513447','2021-11-01 16:23:24.513447',NULL,NULL),(12,'aVNjpLAdsBPvr3Ja2NlaBwSllJLKry','2021-11-09 18:23:28.965886','read write',1,4,'2021-11-09 08:23:28.965886','2021-11-09 08:23:28.965886',NULL,NULL),(13,'mqzYLOxIZzrgp8XBClxlmElMVmKkNv','2021-11-09 19:05:47.171996','read write',1,12,'2021-11-09 09:05:47.172996','2021-11-09 09:05:47.172996',NULL,NULL),(14,'pa0Vs9UyqlWOcs2etzumqAHR0rk3FC','2021-11-09 19:09:29.435943','read write',1,4,'2021-11-09 09:09:29.435943','2021-11-09 09:09:29.435943',NULL,NULL),(15,'cGJAO0fpKZxG3mYoYgYtM6o7UlCr38','2021-11-10 01:08:36.875318','read write',1,4,'2021-11-09 15:08:36.876325','2021-11-09 15:08:36.876325',NULL,NULL),(16,'NqL5ltTpMyn5q6UVmc9lY8LxwMuONb','2021-11-10 01:16:38.940495','read write',1,6,'2021-11-09 15:16:38.941496','2021-11-09 15:16:38.941496',NULL,NULL),(17,'UOQml7iBFDG3N7z7bMD6hY9k4eJfKU','2021-11-10 12:30:44.769857','read write',1,4,'2021-11-10 02:30:44.770860','2021-11-10 02:30:44.770860',NULL,NULL),(18,'IeTGNr1l0kZMIhQZyGfvHGmO7Wpc7Q','2021-11-10 13:01:04.038818','read write',1,4,'2021-11-10 03:01:04.039827','2021-11-10 03:01:04.039827',NULL,NULL),(19,'1WY3Bnp3VTEV3qEhUlrPoilDj7i2Uj','2021-11-10 14:05:51.503491','read write',1,4,'2021-11-10 04:05:51.504493','2021-11-10 04:05:51.504493',NULL,NULL),(20,'yu6cTKBnKuhYRd2SAg2FAkR3VcFHun','2021-11-10 23:10:05.534893','read write',1,6,'2021-11-10 13:10:05.535919','2021-11-10 13:10:05.535919',NULL,NULL),(21,'VYCHOgTPjhfyMP0WC0msDngmpjGouZ','2021-11-11 00:20:04.593412','read write',1,7,'2021-11-10 14:20:04.594411','2021-11-10 14:20:04.594411',NULL,NULL),(22,'biQbz9otzQjVg7L6g8pxWktFOcUm4b','2021-11-11 00:57:42.738593','read write',1,7,'2021-11-10 14:57:42.738593','2021-11-10 14:57:42.738593',NULL,NULL),(23,'nBVtdQsnhEv7TN8jalTkbyz9UJ7XJL','2021-11-11 01:42:19.858122','read write',1,8,'2021-11-10 15:42:19.859122','2021-11-10 15:42:19.859122',NULL,NULL),(24,'j4Imw9iJVFf6LPs2dBAwDIyYfj6knD','2021-11-11 01:46:23.015569','read write',1,9,'2021-11-10 15:46:23.015569','2021-11-10 15:46:23.015569',NULL,NULL),(25,'hYtg6ayKjpNaaC6S5uMCkQ7cUQF0wk','2021-11-16 16:31:25.231967','read write',1,4,'2021-11-16 06:31:25.234968','2021-11-16 06:31:25.234968',NULL,NULL),(26,'wZRlPlD23dwg4l8YCDxrk0lLW6b7sw','2021-11-16 16:31:30.763977','read write',1,4,'2021-11-16 06:31:30.796972','2021-11-16 06:31:30.796972',NULL,NULL),(27,'ziev8ro7TU5ukQh1icR5wxIWAgDxT2','2021-11-16 16:31:57.900375','read write',1,4,'2021-11-16 06:31:57.901376','2021-11-16 06:31:57.901376',NULL,NULL),(28,'c2F4yZ67p60f53SVQmS9UDQ2nBgitZ','2021-11-16 16:35:12.661779','read write',1,4,'2021-11-16 06:35:12.662811','2021-11-16 06:35:12.663811',NULL,NULL),(29,'ZabS0TKkohWOV5Zlnuip9zLocb0CkT','2021-11-27 17:59:39.410566','read write',1,4,'2021-11-27 07:59:39.413566','2021-11-27 07:59:39.413566',NULL,NULL),(30,'AreofKOR47VkFRRpH2v3lvgKQA99B5','2021-11-29 12:13:46.665748','read write',1,4,'2021-11-29 02:13:46.666750','2021-11-29 02:13:46.666750',NULL,NULL),(31,'bx2T1M1CLLWCaTzqQ8S1d1VRp0iied','2021-11-29 18:16:24.869901','read write',1,8,'2021-11-29 08:16:24.869901','2021-11-29 08:16:24.869901',NULL,NULL),(32,'l7Vni25GixcG3Xh4gzY4rr4v4fBJJs','2021-11-29 19:32:20.300803','read write',1,4,'2021-11-29 09:32:20.300803','2021-11-29 09:32:20.300803',NULL,NULL),(33,'ZHVhPzrRJoSP29MS1WLkZQbHYcfwnZ','2021-11-30 13:15:56.765072','read write',1,4,'2021-11-30 03:15:56.768070','2021-11-30 03:15:56.768070',NULL,NULL),(34,'Ctb0y6N33ZvFCauatxgdaU8wCjAAWk','2021-12-01 00:45:54.659800','read write',1,4,'2021-11-30 14:45:54.666810','2021-11-30 14:45:54.666810',NULL,NULL),(35,'DVr7yZANTIa8ks14q6dMlwtY1wTJyB','2021-12-04 12:02:55.865442','read write',1,4,'2021-12-04 02:02:55.865442','2021-12-04 02:02:55.865442',NULL,NULL),(36,'4hrzrWogSLZKOyuPkhV5p8fQsHCVu6','2021-12-04 18:43:53.498516','read write',1,4,'2021-12-04 08:43:53.499520','2021-12-04 08:43:53.499520',NULL,NULL),(37,'PKS65oBZQqDP0GENUajoDxn4iKvTKp','2021-12-04 19:00:17.000644','read write',1,11,'2021-12-04 09:00:17.001645','2021-12-04 09:00:17.001645',NULL,NULL),(38,'nc4VwuiB1AjHLeYm6RJz5qcQWBuOJU','2021-12-04 22:21:40.723215','read write',1,11,'2021-12-04 12:21:40.724216','2021-12-04 12:21:40.724216',NULL,NULL),(39,'Ku15uxhPZqfvtiUsXHcMdOJw9gUfzd','2021-12-04 22:33:08.648259','read write',1,7,'2021-12-04 12:33:08.649261','2021-12-04 12:33:08.649261',NULL,NULL),(40,'VRnogiXNLMxWO5BLbLFMufe9CTHGaQ','2021-12-04 22:42:50.253698','read write',1,9,'2021-12-04 12:42:50.254703','2021-12-04 12:42:50.254703',NULL,NULL),(41,'6nzhR9xbuxV2V8cidhzAOU1BJC5RNt','2021-12-04 22:47:33.957514','read write',1,10,'2021-12-04 12:47:33.957514','2021-12-04 12:47:33.957514',NULL,NULL),(42,'2WCfqQXjJX8XDuqrUfsTY8wafdW3bJ','2021-12-04 22:56:55.288571','read write',1,12,'2021-12-04 12:56:55.289569','2021-12-04 12:56:55.289569',NULL,NULL),(43,'EhhaKH2i8ANCecmKuQ04sBJnoPVnsJ','2021-12-04 23:00:47.385140','read write',1,4,'2021-12-04 13:00:47.386141','2021-12-04 13:00:47.386141',NULL,NULL),(44,'QTSjakU1gkUZM7Y91GNcVhImvRovFN','2021-12-04 23:36:55.512928','read write',1,8,'2021-12-04 13:36:55.513933','2021-12-04 13:36:55.513933',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'7V3mkjDEPGYtcxpId71FJ2BdEkS3oucor0ikLSy5','','confidential','password','lHFNYYiF9Y5hUenYf57hAaMZ97CeHKbDUJSc4mzbkDSGNV3JdM9ZqEL3TquAB2irU6t0NW8TkYxKNPGMosvyrAd4CeC8bFwYPam2SrGoPjroElCEZBWjr9rJJPWLq9UH','GlorianRestaurant',1,0,'2021-08-18 08:31:27.879778','2021-08-18 08:31:27.879778','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'LzyBjVA256iq8at1yhOekOQmkAp6QU',1,1,1,'2021-08-18 09:16:04.050287','2021-08-18 09:16:04.050287',NULL),(2,'NTEkLt4YSWNkmMqYwQGapu7ewEbEOS',2,1,4,'2021-08-18 16:06:17.561553','2021-08-18 16:06:17.561553',NULL),(3,'GVqTn2aAEOzqZ1KjKsCQz8kQLwSHIV',3,1,4,'2021-10-29 08:11:52.272460','2021-10-29 08:11:52.272460',NULL),(4,'PYn5i5tMgmC31PFGsXxALGhgoNk0uc',4,1,4,'2021-10-29 14:06:25.159882','2021-10-29 14:06:25.159882',NULL),(5,'v2jkAr2Iquej76Ud20ILnR9bUZaHx0',5,1,4,'2021-10-29 14:06:27.004883','2021-10-29 14:06:27.004883',NULL),(6,'QwKxPJOGkQ61a8pY4FPwAgtUMr5ycg',6,1,4,'2021-10-29 14:22:33.755813','2021-10-29 14:22:33.755813',NULL),(7,'Kb9gae6xSVYg8ZlDhSWl4Y1z1swRA1',7,1,4,'2021-10-29 15:13:39.933498','2021-10-29 15:13:39.933498',NULL),(8,'TT803IbqDnoToK9BbsLgWocr05P2vU',8,1,6,'2021-10-31 07:06:49.710330','2021-10-31 07:06:49.711332',NULL),(9,'VvStpBVcupLnGJbuTNpQNG1KG4UUI0',9,1,9,'2021-10-31 08:07:30.780039','2021-10-31 08:07:30.780039',NULL),(10,'Fxh4DBvLuiCanPt4zUaR1wm0Af2Zsw',10,1,10,'2021-10-31 08:27:10.724606','2021-10-31 08:27:10.724606',NULL),(11,'ULS1bekdIsWBOuDOabR1jt3b1qEjzt',11,1,11,'2021-11-01 16:23:24.792438','2021-11-01 16:23:24.792438',NULL),(12,'kMimBVLjMkDK54zs6tlaDA4gQ0rdY0',12,1,4,'2021-11-09 08:23:29.060882','2021-11-09 08:23:29.061881',NULL),(13,'8EEGmrN7Xd9GBDLs8YOw6OB2pygEy9',13,1,12,'2021-11-09 09:05:47.219995','2021-11-09 09:05:47.219995',NULL),(14,'KBFPrxCX5G6Nmt7T0eB0jKuf5mST5D',14,1,4,'2021-11-09 09:09:29.491947','2021-11-09 09:09:29.491947',NULL),(15,'LjbeCPR1XADAwocTm8dvrGiHnkrKmj',15,1,4,'2021-11-09 15:08:36.923325','2021-11-09 15:08:36.923325',NULL),(16,'8sBnxMVPeuEomM5tPiSDACVirgytFm',16,1,6,'2021-11-09 15:16:38.981496','2021-11-09 15:16:38.981496',NULL),(17,'2y8vvJIVx8XnWtiONnWIAx7ZhVOVFB',17,1,4,'2021-11-10 02:30:44.849859','2021-11-10 02:30:44.849859',NULL),(18,'CZYbTbwOCGsFpqMpYhgGfkE1iMkyOU',18,1,4,'2021-11-10 03:01:04.081817','2021-11-10 03:01:04.081817',NULL),(19,'IfP1Ndexnh74GiEUaNrVXk9NMpgtXK',19,1,4,'2021-11-10 04:05:51.548490','2021-11-10 04:05:51.548490',NULL),(20,'TjgQrjlFtSye7Txmsq69FUtaFQQHd2',20,1,6,'2021-11-10 13:10:05.627991','2021-11-10 13:10:05.627991',NULL),(21,'3j7LnWAX8zLE8RyFmLQAQd8CrJVs3p',21,1,7,'2021-11-10 14:20:04.662409','2021-11-10 14:20:04.662409',NULL),(22,'yK0U6mEpuJZJNZZbXSobXskO2fvivQ',22,1,7,'2021-11-10 14:57:42.781593','2021-11-10 14:57:42.781593',NULL),(23,'Pe93Dmei4txM50RVUH7AC0QVtZ6sv5',23,1,8,'2021-11-10 15:42:19.899780','2021-11-10 15:42:19.899780',NULL),(24,'71ELUveUVCatVQKEsYKWFMEGwTHwms',24,1,9,'2021-11-10 15:46:23.054569','2021-11-10 15:46:23.054569',NULL),(25,'tQYIGaKHqFNuNUms6kRvDeHBoaHJxN',25,1,4,'2021-11-16 06:31:25.652978','2021-11-16 06:31:25.652978',NULL),(26,'Log0otcl1PNJyfVXgBvbSfLoO63rrv',26,1,4,'2021-11-16 06:31:31.275972','2021-11-16 06:31:31.275972',NULL),(27,'nCdawJnNHCUwEHy7tkZcSjGUmGotUl',27,1,4,'2021-11-16 06:31:58.080384','2021-11-16 06:31:58.080384',NULL),(28,'T1cBMip7OfZvhKBruVlCo6AUEKCPZ2',28,1,4,'2021-11-16 06:35:12.854796','2021-11-16 06:35:12.855791',NULL),(29,'Rm8QH26RGYN1Xe2U7d7Q53xYk9AMHp',29,1,4,'2021-11-27 07:59:39.506421','2021-11-27 07:59:39.506421',NULL),(30,'8WP4OMWr1tpCnztLiKvlTNzq4TdIDw',30,1,4,'2021-11-29 02:13:46.744760','2021-11-29 02:13:46.744760',NULL),(31,'CvmvrprPtrrDGsPImr6MYuvw4h9lIJ',31,1,8,'2021-11-29 08:16:24.928906','2021-11-29 08:16:24.928906',NULL),(32,'W3CPQP3M82Q7tyQYPhjp3wrSPUBGOT',32,1,4,'2021-11-29 09:32:20.351806','2021-11-29 09:32:20.351806',NULL),(33,'m7a7h9ChId6QVXHgXOHA8u4R1pVdqV',33,1,4,'2021-11-30 03:15:57.034069','2021-11-30 03:15:57.034069',NULL),(34,'tiIKBjCzS5teZCmb24nw7t9Ko7T1sq',34,1,4,'2021-11-30 14:45:54.996796','2021-11-30 14:45:54.996796',NULL),(35,'aLIPhHoaRJg3bnUNm6DA4nfRRmjfc9',35,1,4,'2021-12-04 02:02:55.951450','2021-12-04 02:02:55.951450',NULL),(36,'YkHIbKpnMB3gG6979rShOf50YbjFZ6',36,1,4,'2021-12-04 08:43:53.567520','2021-12-04 08:43:53.567520',NULL),(37,'2932b2JfsyIlFJw7E74g0TaqtREEv5',37,1,11,'2021-12-04 09:00:17.043635','2021-12-04 09:00:17.043635',NULL),(38,'8hyNBCsGXDjb2eTXXBGVloGCloCLYN',38,1,11,'2021-12-04 12:21:40.774215','2021-12-04 12:21:40.774215',NULL),(39,'ToZdtsvCYU025OU61vFD8S1Exxp2iy',39,1,7,'2021-12-04 12:33:08.693266','2021-12-04 12:33:08.693266',NULL),(40,'t8ok4SWNoc6oypAsucbzPY8NPhKAw0',40,1,9,'2021-12-04 12:42:50.296703','2021-12-04 12:42:50.296703',NULL),(41,'JdtwrmmqN3tXZHzC47uXD4CkFEcYLc',41,1,10,'2021-12-04 12:47:33.999523','2021-12-04 12:47:34.000519',NULL),(42,'NlmLDzZQjbpl9540ggqGmcHoEpCxlZ',42,1,12,'2021-12-04 12:56:55.352574','2021-12-04 12:56:55.352574',NULL),(43,'RKw3JZSV4NN7tkFgL4IeiCzjXHmyuf',43,1,4,'2021-12-04 13:00:47.438133','2021-12-04 13:00:47.438133',NULL),(44,'9BNJqjIxOpn6iYMN8qtqtWVuDkS4v6',44,1,8,'2021-12-04 13:36:55.583929','2021-12-04 13:36:55.583929',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint unsigned NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `rating_user_id_029b834f_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `rating_chk_1` CHECK ((`rate` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'2021-11-29 02:15:05.478235','2021-11-29 02:15:05.478235',5,7),(2,'2021-11-29 02:16:15.795852','2021-11-29 02:16:15.795852',5,9),(8,'2021-11-29 03:40:54.759312','2021-11-29 03:40:54.759312',5,10),(9,'2021-11-29 08:11:01.261465','2021-12-04 07:37:53.921411',4,4),(10,'2021-11-29 08:17:29.380798','2021-11-29 09:31:00.432127',5,8),(12,'2021-12-04 09:00:39.274143','2021-12-04 09:00:39.274143',4,11),(13,'2021-12-04 12:57:13.660156','2021-12-04 12:57:13.660156',4,12);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `service_service_type_id_432b5960_fk_service_type_id` (`service_type_id`),
  CONSTRAINT `service_service_type_id_432b5960_fk_service_type_id` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Cổng hoa tròn 1',1000000,1,'img/service/Cổng_hoa_tròn.jpg',1),(2,'Cổng vuông',500000,1,'img/service/Cổng_vuông.jpg',1),(3,'cổng hoa tròn 2',1000000,1,'img/service/Cổng_hoa_tròn_2.jpg',1),(4,'Cổng hoa vuông',700000,1,'img/service/Cổng_hoa_vuông.jpg',1),(5,'Lối đi 1',1000000,1,'img/service/Lối_đi_1.jpg',2),(6,'Lối đi 2',600000,1,'img/service/Lối_đi_2.jpg',2),(7,'Lối đi 3',1200000,1,'img/service/Lối_đi_3.jpg',2),(8,'Lối đi 4',1000000,1,'img/service/Lối_đi_4.jpg',2),(9,'Khung ảnh 1',700000,1,'img/service/Khung_ảnh_1.jpg',3),(10,'Khung ảnh 2',1000000,1,'img/service/Khung_ảnh_2.jpg',3),(11,'Khung ảnh 3',800000,1,'img/service/Khung_ảnh_3.jpg',3),(12,'Khung ảnh 4',1000000,1,'img/service/Khung_ảnh_4.jpg',3),(13,'Chơi đàn violin',500000,1,'img/service/violin.jpg',4),(14,'Chơi đàn piano',500000,1,'img/service/Piano.jpg',4),(15,'Múa',700000,1,'img/service/Múa.jpg',4),(16,'Ban nhạc',3000000,1,'img/service/Ban_nhạc.jpg',5),(17,'Ca sĩ',2000000,1,'img/service/Ca_sĩ.jpg',5),(18,'Dẫn chương trình - MC',1500000,1,'img/service/MC.jpg',5),(19,'Đội khánh tiết làm lễ',500000,1,'img/service/Khánh_tiết.jpg',5),(20,'Trang trí 1',1000000,1,'img/service/Trang_trí_1.jpg',6),(21,'Trang trí 2',700000,1,'img/service/Trang_trí_2.jpg',6),(22,'Mẫu trang trí 1',1000000,1,'img/service/Mẫu_trang_trí_1.jpg',7),(23,'Mẫu trang trí 2',700000,1,'img/service/Mẫu_trang_trí_2.jpg',7),(24,'Mẫu trang trí 3',800000,1,'img/service/Mẫu_trang_trí_3.jpg',7),(25,'Mẫu trang trí 4',1200000,1,'img/service/Mẫu_trang_trí_4.jpg',7),(26,'MC Chú hề',2500000,1,'img/service/MC_Chú_hề.jpg',8),(27,'Mẫu hội nghị 1',1000000,1,'img/service/Mẫu_hội_nghị_1.jpg',9),(28,'Mẫu hội nghị 2',1000000,1,'img/service/Mẫu_hội_nghị_2.jpg',9),(29,'Dạng lớp học',2000000,1,'img/service/Dạng_lớp_học.jpg',10),(30,'Dạng rạp hát',1500000,1,'img/service/Dạng_rạp_hát.jpg',10),(31,'Dạng U-Shape',2000000,1,'img/service/Dạng_U-Shape.jpg',10);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_bill_detail`
--

DROP TABLE IF EXISTS `service_bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_bill_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit_price` double NOT NULL,
  `invoice_id` bigint NOT NULL,
  `service_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_bill_detail`
--

LOCK TABLES `service_bill_detail` WRITE;
/*!40000 ALTER TABLE `service_bill_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_type`
--

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
INSERT INTO `service_type` VALUES (1,'Trang trí cổng',1),(2,'Trang trí lối đi',1),(3,'Bàn lễ tân - Khung ảnh',1),(4,'Văn nghệ khai tiệc',1),(5,'Dịch vụ khác',1),(6,'Trang trí cổng sinh nhật',3),(7,'Bàn trang trí - khung ảnh',3),(8,'Dịch vụ sinh nhật khác',3),(9,'Trang trí cổng hội nghị',2),(10,'Bố trí sảnh hội nghị',2);
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pbkdf2_sha256$260000$BVoRbUkxTb4d1TPPZHdWzV$mx5QWDy73WfD5C24Vdhsl3Z6jdZOoU/m4+Ssvfa1ey8=','2021-11-09 08:17:39.304225',1,'admin','','','1851050182uyen@ou.edu.vn',1,1,'2021-08-16 15:36:55.332295','','',''),(4,'pbkdf2_sha256$260000$iLKf91Z9CQN7cW8mtvfvxO$rqRKZSnztHzmyjycB2668mgtiyrcMbtGBhmSwgmYtmY=',NULL,0,'uyennguyen','Uyên','Nguyễn','uyennguyen0721@gmail.com',0,1,'2021-08-18 13:01:26.060279','0947653170','58/4 đường số 7, phường 7, Gò Vấp, TPHCM','img/avatar/2021/08/avatar_WHXgW5u.jpg'),(6,'123456789',NULL,0,'linhphan','Linh','Phan','linh@gmail.com',0,1,'2021-10-31 07:06:22.399010','1234567890','123 Lý Chính Thắng, phường 7, quận 3, TPHCM','img/avatar/2021/11/avatar-1_Wftz5Xy.jpg'),(7,'pbkdf2_sha256$260000$TFZRDKPizuKCSVdAI3ygWF$K2sAVaHHUoXMFYpwG1SXSh3cqvdEJh3f5Ax7FL71XS4=',NULL,0,'tieumytran','Tiểu My','Trần','tieumy@gmail.com',0,1,'2021-10-31 07:20:20.052806','0123456789','150 Cộng Hòa, Tân Bình, TPHCM','img/avatar/2021/11/avatar-4.jpg'),(8,'pbkdf2_sha256$260000$qEvLMEjCxAcODfdgBVSxDt$eSFEkNU4SHvI7MurXO6aAVfmQrjo1eNeW5c38qNcY1M=',NULL,0,'quynhle','Quỳnh','Lê','lequynh@gmail.com',0,1,'2021-10-31 07:53:18.158603','1234567890','97 Võ Văn Tần, quận 3, TPHCM','img/avatar/2021/11/avatar-7_WZqMXT8.jpg'),(9,'pbkdf2_sha256$260000$sGXpF6ht9wyQKagwSubzRB$flKF/cq2p4ekRmHJ+57+9YKEqdYz6fU78HxMwdLhnKs=',NULL,0,'linhdam','Đàm','Linh','linhdam@gmail.com',0,1,'2021-10-31 08:06:46.490810','1234567890','140 Nguyễn Du, Gò Vấp, TPHCM','img/avatar/2021/11/avatar-6.jpg'),(10,'pbkdf2_sha256$260000$Fh1TuSEPvzBJQ29zleK1WQ$5aMIGAuB6YAAfR8aYZxrt8m30UMiXI/CzsUKCjv86nw=',NULL,0,'thuynguyen','Thúy','Nguyễn','thuynguyen@gmail.com',0,1,'2021-10-31 08:26:54.274169','','','img/avatar/2021/10/avatar-4.jpg'),(11,'pbkdf2_sha256$260000$XkXZpz6MFbBWMmMYjyQrqe$K48G7zTiAlrD1cgVhxKjNy5uhzM1BKrh9vp9KtKuYmg=',NULL,0,'lequynh','Quỳnh','Lê','lequynh@gmail.com',0,1,'2021-11-01 16:22:57.972288','','','img/avatar/2021/11/avatar-7.jpg'),(12,'pbkdf2_sha256$260000$3jyyZMtdWuIIH5q04v81K0$UdqWaOXxMQJVPzzTVYR11vUxu4T/1GBOATTa0KaqYZw=',NULL,0,'hoaduong','Hòa','Dương','duonghoa@gmail.com',0,1,'2021-11-09 08:53:24.255961','','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_lobby`
--

DROP TABLE IF EXISTS `wedding_lobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_lobby` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` int NOT NULL,
  `capacity` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_lobby`
--

LOCK TABLES `wedding_lobby` WRITE;
/*!40000 ALTER TABLE `wedding_lobby` DISABLE KEYS */;
INSERT INTO `wedding_lobby` VALUES (1,'Sảnh Tulip','img/lobby/Sảnh_Tulip.jpg',2,850,'Màu vàng trong đám cưới tượng trưng cho sự sung túc, đủ đầy, được thiết kế với sắc vàng trầm ấm.\r\nCách sử dụng màu vàng của cánh đồng hoa Tulip đang độ đón nắng xuân làm tông màu chủ đạo đã tạo nên một sảnh cưới vô cùng đặc biệt tại nhà hàng tiệc cưới Glorian. Sự sang trọng và tinh tế còn thể hiện qua màu vàng ánh đồng của nơ ghế khi chúng trở nên ấn tượng dưới ánh đèn pha lê lấp lánh.'),(2,'Sảnh Rose','img/lobby/Sảnh_Rose.jpg',3,750,'Màu đỏ mang ý nghĩa về tình yêu nồng cháy nên cũng là một trong những màu sắc được ưa chuộng trong đám cưới, đặc biệt là ở các nước Á Đông.  \r\nỞ Glorian, sắc đỏ được thể hiện trong không gian sảnh Rose đầy tinh tế. Bạn sẽ thấy sự xuất hiện của những cánh hồng nhung tươi mới, những chiếc nơ đỏ đính kèm đầy tinh tế trong không gian sảnh. Sảnh Rose được thiết kế pha trộn giữa các tông màu đỏ khác nhau một cách cách hài hòa tạo sự ấn tượng đối với thị giác, đồng thời cũng tạo nên sự sang trọng không chỉ trong cái nhìn mà tận đến sự cảm nhận.'),(3,'Sảnh Violet','img/lobby/Sảnh_Violet.jpg',5,850,'Tượng trưng cho sự thủy chung, màu tím ngọt ngào được sử dụng nhằm tôn lên vẻ sang trọng và tinh tế của tiệc cưới\r\nLà một trong những nhà hàng có sảnh cưới đẹp tại TP.HCM, Glorian không chỉ dừng lại ở những gam màu truyền thống và đơn điệu. Khách hàng có thể được trải nghiệm không gian lãng mạn với sảnh tím Violet lấy cảm hứng từ sắc tím đậm của một chiều hoàng hôn, pha lẫn với màu tím thanh dịu của loài hoa violet dại. Chìm đắm trong ánh nến lung linh, huyền ảo tại sảnh Violet sẽ là một trải nghiệm khó quên đối với các cặp đôi và các quan khách.'),(4,'Sảnh Gloria','img/lobby/Sảnh_Gloria.jpg',6,750,'Là màu tượng trưng cho thiên nhiên, mang ý nghĩa của sự phát triển, sinh sôi, nảy nở, màu xanh lá cây đưa lại cho sảnh Gloria cảm giác dễ chịu, mát mẻ như một bữa tiệc ngoài trời. \r\nSảnh Gloria sử dụng 2 sắc xanh của đài hoa loa kèn, một loài hoa biểu tượng của ngày cưới, để phối hợp trong thiết kế nội thất. Sảnh cưới này tạo cảm giác tươi mát, gần gũi và trẻ trung. Khách đến dự tiệc sẽ cảm thấy thật sự thoải mái trong ánh đèn xanh dịu nhẹ gợi cảm giác hòa mình vào thiên nhiên trong trẻo, yên bình như hạnh phúc lứa đôi.');
/*!40000 ALTER TABLE `wedding_lobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_lobby_price`
--

DROP TABLE IF EXISTS `wedding_lobby_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_lobby_price` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` int NOT NULL,
  `is_weekend` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  `wedding_lobby_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_lobby_price_wedding_lobby_id_a9bc8f0c_fk_wedding_l` (`wedding_lobby_id`),
  CONSTRAINT `wedding_lobby_price_wedding_lobby_id_a9bc8f0c_fk_wedding_l` FOREIGN KEY (`wedding_lobby_id`) REFERENCES `wedding_lobby` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_lobby_price`
--

LOCK TABLES `wedding_lobby_price` WRITE;
/*!40000 ALTER TABLE `wedding_lobby_price` DISABLE KEYS */;
INSERT INTO `wedding_lobby_price` VALUES (1,1,0,20000000,1),(2,2,0,20000000,1),(3,3,0,25000000,1),(4,1,1,25000000,1),(5,2,1,25000000,1),(6,3,1,30000000,1),(7,1,0,17000000,2),(8,2,0,17000000,2),(9,3,0,22000000,2),(10,1,1,22000000,2),(11,2,1,22000000,2),(12,3,1,27000000,2),(13,1,0,20000000,3),(14,2,0,20000000,3),(15,3,0,25000000,3),(16,1,1,25000000,3),(17,2,1,25000000,3),(18,3,1,30000000,3),(19,1,0,17000000,4),(20,2,0,17000000,4),(21,3,0,22000000,4),(22,1,1,22000000,4),(23,2,1,22000000,4),(24,3,1,27000000,4);
/*!40000 ALTER TABLE `wedding_lobby_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quanlynhahangdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-15 11:27:38
