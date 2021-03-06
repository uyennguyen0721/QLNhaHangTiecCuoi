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
INSERT INTO `django_admin_log` VALUES (1,'2021-08-16 15:45:10.501773','1','FoodType object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Croissant tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Puff bacon & corn\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Pate chaud\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Croissant cheese\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Danish ham & cheese rolls\"}}]',7,1),(2,'2021-08-16 16:00:07.455240','2','FoodType object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 t\\u00f4m Th\\u00e1i Lan\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 \\u1ebfch n\\u01b0\\u1edbng m\\u1ee1 ch\\u00e0i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 gi\\u00f2 h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad h\\u1ea3i s\\u1ea3n ki\\u1ec3u Th\\u00e1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad s\\u00f2 \\u0111i\\u1ec7p tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad \\u1ee9c g\\u00e0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi m\\u1ef1c Th\\u00e1i Lan\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi c\\u1ee7 h\\u1ee7 d\\u1eeba t\\u00f4m th\\u1ecbt\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi th\\u1ed1t n\\u1ed1t t\\u00f4m th\\u1ecbt\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c chi\\u00ean x\\u00f9 s\\u1ed1t xo\\u00e0i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c nh\\u1ed3i tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u1ef1c chi\\u00ean gi\\u00f2n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u00fa s\\u1ed1t chanh d\\u00e2y\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m rang tr\\u1ee9ng mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi c\\u1ee7 h\\u1ee7 d\\u1eeba chay\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u1ecfi g\\u00e0 x\\u00e9 phay chay\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u1ea3 gi\\u00f2 rau c\\u1ee7\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Salad xo\\u00e0i n\\u1ea5m\"}}]',7,1),(3,'2021-08-16 16:14:36.488831','3','FoodType object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t rang mu\\u1ed1i H\\u1ed3ng K\\u00f4ng\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t chi\\u00ean gi\\u00f2n s\\u1ed1t tartar\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t \\u0111\\u00fat l\\u00f2 ph\\u00f4 mai\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Cua l\\u1ed9t s\\u1ed1t t\\u1ecfi \\u1edbt\"}}]',7,1),(4,'2021-08-16 16:26:57.307086','4','FoodType object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm s\\u1ed1t gi\\u1ea5m \\u0111en\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm s\\u1ed1t kem chanh\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 ch\\u1ebdm \\u00e1p ch\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 cu\\u1ed9n bacon h\\u01b0\\u01a1ng th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 h\\u1ed3i \\u00e1p ch\\u1ea3o s\\u1ed1t cam v\\u00e0 h\\u01b0\\u01a1ng th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 h\\u1ed3i s\\u1ed1t b\\u01a1 chanh\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 t\\u1ea7m \\u0111\\u00fat l\\u00f2\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u00e1 b\\u1ed1ng m\\u00fa h\\u1ea5p H\\u1ed3ng K\\u00f4ng\"}}]',7,1),(5,'2021-08-16 16:31:46.497361','5','FoodType object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup tuy\\u1ebft nh\\u0129 cua g\\u00e0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup s\\u01b0\\u1eddn \\u0111\\u00f4ng tr\\u00f9ng h\\u1ea1 th\\u1ea3o\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Soup chay th\\u1eadp c\\u1ea9m\"}}]',7,1),(6,'2021-08-16 16:36:15.938618','6','FoodType object (6)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m c\\u00e0ng xanh n\\u01b0\\u1edbng b\\u01a1 t\\u1ecfi\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m h\\u1ea5p n\\u01b0\\u1edbc d\\u1eeba\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u1ed1t g\\u1ea1ch cua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"T\\u00f4m s\\u00fa rang mu\\u1ed1i H\\u1ed3ng K\\u00f4ng\"}}]',7,1),(7,'2021-08-16 16:39:59.649251','7','FoodType object (7)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 \\u00dac s\\u1ed1t ti\\u00eau \\u0111en - Khoai t\\u00e2y\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 h\\u1ea7m s\\u1ed1t vang \\u0111\\u1ecf - B\\u00e1nh m\\u00ec\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00f2 cu\\u1ed9n ph\\u00f4 mai s\\u1ed1t n\\u1ea5m\"}}]',7,1),(8,'2021-08-16 16:42:55.006648','8','FoodType object (8)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Heo s\\u1eefa quay - B\\u00e1nh bao h\\u1ea5p\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"S\\u01b0\\u1eddn n\\u01b0\\u1edbng m\\u1eadt ong\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"S\\u01b0\\u1eddn n\\u01b0\\u1edbng BBQ s\\u1ed1t cay\"}}]',7,1),(9,'2021-08-16 16:46:24.179840','9','FoodType object (9)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"V\\u1ecbt quay V\\u00e2n \\u0110\\u00ecnh  - B\\u00e1nh bao chi\\u00ean\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"G\\u00e0 n\\u01b0\\u1edbng s\\u1ed1t Teriyaki\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"\\u1ee8c v\\u1ecbt s\\u1ed1t ti\\u00eau \\u0111en\"}}]',7,1),(10,'2021-08-16 17:06:51.204824','10','FoodType object (10)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00fan x\\u00e0o Singapore\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u00ec x\\u00e0o h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n cua \\u0111\\u1ed3ng - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u t\\u00f4m Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u c\\u00e1 b\\u1edbp m\\u0103ng chua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u Th\\u00e1i chay\"}}]',7,1),(11,'2021-08-16 17:08:43.221256','10','FoodType object (10)',3,'',7,1),(12,'2021-08-16 17:14:59.600869','62','L???u Th??i chay',3,'',15,1),(13,'2021-08-16 17:14:59.611182','61','L???u c?? b???p m??ng chua',3,'',15,1),(14,'2021-08-16 17:14:59.620138','60','L???u h???i s???n Th??i Lan - B??n t????i',3,'',15,1),(15,'2021-08-16 17:14:59.631092','59','L???u t??m Th??i Lan - B??n t????i',3,'',15,1),(16,'2021-08-16 17:14:59.642125','58','L???u h???i s???n cua ?????ng - B??n t????i',3,'',15,1),(17,'2021-08-16 17:14:59.653601','57','M?? x??o h???i s???n',3,'',15,1),(18,'2021-08-16 17:14:59.661726','56','B??n x??o Singapore',3,'',15,1),(19,'2021-08-16 17:14:59.669723','55','C??m chi??n b??o ng??',3,'',15,1),(20,'2021-08-16 17:14:59.678114','54','C??m chi??n h???i s???n',3,'',15,1),(21,'2021-08-16 17:18:41.142655','11','FoodType object (11)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean h\\u1ea3i s\\u1ea3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"C\\u01a1m chi\\u00ean b\\u00e0o ng\\u01b0\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"B\\u00fan x\\u00e0o Singapore\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"M\\u00ec x\\u00e0o h\\u1ea3i s\\u1ea3n\"}}]',7,1),(22,'2021-08-16 17:24:27.462126','12','FoodType object (12)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n cua \\u0111\\u1ed3ng - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u t\\u00f4m Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u h\\u1ea3i s\\u1ea3n Th\\u00e1i Lan - B\\u00fan t\\u01b0\\u01a1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u c\\u00e1 b\\u1edbp m\\u0103ng chua\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"L\\u1ea9u Th\\u00e1i chay\"}}]',7,1),(23,'2021-08-16 17:29:50.637925','13','FoodType object (13)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Mousse chanh mu\\u1ed1i\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Passion fruit layer cake\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Nho M\\u1ef9\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u00e8 h\\u1ea1t sen long nh\\u00e3n\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Ch\\u00e8 kh\\u00fac b\\u1ea1ch\"}}, {\"added\": {\"name\": \"menu food\", \"object\": \"Rau c\\u00e2u d\\u1eeba\"}}]',7,1),(24,'2021-08-16 17:36:40.156213','1','N?????c su???i',1,'[{\"added\": {}}]',8,1),(25,'2021-08-16 18:04:05.117988','2','R?????u vang ?????',1,'[{\"added\": {}}]',8,1),(26,'2021-08-16 18:04:45.895035','3','R?????u vang tr???ng',1,'[{\"added\": {}}]',8,1),(27,'2021-08-16 18:17:18.333123','4','Champagne',1,'[{\"added\": {}}]',8,1),(28,'2021-08-17 06:29:36.980363','5','Bia Heineken chai',1,'[{\"added\": {}}]',8,1),(29,'2021-08-17 06:38:22.459198','6','Bia Heineken lon',1,'[{\"added\": {}}]',8,1),(30,'2021-08-17 06:44:18.183213','5','Bia Heineken chai',2,'[{\"changed\": {\"fields\": [\"Unit\"]}}]',8,1),(31,'2021-08-17 06:46:52.474227','7','Bia Tiger chai',1,'[{\"added\": {}}]',8,1),(32,'2021-08-17 06:50:55.681278','8','Bia Tiger lon',1,'[{\"added\": {}}]',8,1),(33,'2021-08-17 06:59:48.177595','9','Bia Sapporo chai',1,'[{\"added\": {}}]',8,1),(34,'2021-08-17 07:07:41.215928','10','Bia Sapporo lon',1,'[{\"added\": {}}]',8,1),(35,'2021-08-17 07:12:45.765108','11','Pepsi',1,'[{\"added\": {}}]',8,1),(36,'2021-08-17 07:18:45.539272','12','Mirinda soda kem',1,'[{\"added\": {}}]',8,1),(37,'2021-08-17 08:39:57.519480','1','S???nh Tulip',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (1)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (2)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (3)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (4)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (5)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (6)\"}}]',11,1),(38,'2021-08-17 08:51:26.791776','2','S???nh Rose',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (7)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (8)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (9)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (10)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (11)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (12)\"}}]',11,1),(39,'2021-08-17 08:59:18.811962','3','S???nh Violet',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (13)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (14)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (15)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (16)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (17)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (18)\"}}]',11,1),(40,'2021-08-17 09:04:07.589283','4','S???nh Gloria',1,'[{\"added\": {}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (19)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (20)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (21)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (22)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (23)\"}}, {\"added\": {\"name\": \"wedding lobby price\", \"object\": \"WeddingLobbyPrice object (24)\"}}]',11,1),(41,'2021-08-17 09:57:39.543226','1','ServiceType object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng hoa tr\\u00f2n 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng vu\\u00f4ng\"}}, {\"added\": {\"name\": \"service\", \"object\": \"c\\u1ed5ng hoa tr\\u00f2n 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng hoa vu\\u00f4ng\"}}]',10,1),(42,'2021-08-17 10:05:27.384303','2','ServiceType object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 3\"}}]',10,1),(43,'2021-08-17 10:06:27.279609','1','ServiceType object (1)',2,'[{\"changed\": {\"name\": \"service\", \"object\": \"C\\u1ed5ng vu\\u00f4ng\", \"fields\": [\"Image\"]}}]',10,1),(44,'2021-08-17 10:07:56.394033','2','ServiceType object (2)',2,'[{\"added\": {\"name\": \"service\", \"object\": \"L\\u1ed1i \\u0111i 4\"}}]',10,1),(45,'2021-08-17 10:16:42.059675','3','ServiceType object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 3\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Khung \\u1ea3nh 4\"}}]',10,1),(46,'2021-08-17 10:17:20.832090','3','ServiceType object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(47,'2021-08-17 10:56:27.010792','4','ServiceType object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Ch\\u01a1i \\u0111\\u00e0n violin\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Ch\\u01a1i \\u0111\\u00e0n piano\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u00faa\"}}]',10,1),(48,'2021-08-17 11:08:47.633487','5','ServiceType object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Ban nh\\u1ea1c\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Ca s\\u0129\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1eabn ch\\u01b0\\u01a1ng tr\\u00ecnh - MC\"}}]',10,1),(49,'2021-08-17 11:13:10.475526','5','ServiceType object (5)',2,'[{\"added\": {\"name\": \"service\", \"object\": \"\\u0110\\u1ed9i kh\\u00e1nh ti\\u1ebft l\\u00e0m l\\u1ec5\"}}]',10,1),(50,'2021-08-17 11:13:44.961167','3','ServiceType object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(51,'2021-08-17 11:23:14.258945','6','ServiceType object (6)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Trang tr\\u00ed 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Trang tr\\u00ed 2\"}}]',10,1),(52,'2021-08-17 11:49:18.178248','6','ServiceType object (6)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(53,'2021-08-17 11:56:34.189183','7','ServiceType object (7)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 2\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 3\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu trang tr\\u00ed 4\"}}]',10,1),(54,'2021-08-17 12:17:55.461447','8','ServiceType object (8)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"MC Ch\\u00fa h\\u1ec1\"}}]',10,1),(55,'2021-08-17 12:57:13.683839','9','ServiceType object (9)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu h\\u1ed9i ngh\\u1ecb 1\"}}, {\"added\": {\"name\": \"service\", \"object\": \"M\\u1eabu h\\u1ed9i ngh\\u1ecb 2\"}}]',10,1),(56,'2021-08-17 13:07:52.155882','10','ServiceType object (10)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng l\\u1edbp h\\u1ecdc\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng r\\u1ea1p h\\u00e1t\"}}, {\"added\": {\"name\": \"service\", \"object\": \"D\\u1ea1ng U-Shape\"}}]',10,1),(57,'2021-09-19 05:58:02.967190','4','Champagne',2,'[]',8,1);
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
INSERT INTO `feedback` VALUES (1,'2021-11-30 12:11:37.287461','Nh?? h??ng ph???c v??? r???t chu ????o!',4,'2021-11-30 12:11:37.288458'),(2,'2021-12-04 12:25:50.490255','Kh??ng gian ?????p v?? tho??ng m??t, nh??n vi??n ph???c v??? t???n t??nh.',11,'2021-12-04 12:25:50.490255'),(3,'2021-12-04 12:37:05.258701','Ph???c v??? t???t, kh??ng gian s???ch s???.',7,'2021-12-04 12:37:05.258701'),(4,'2021-12-04 12:44:10.936651','T??i c???m th???y r???t h??i l??ng v???i c??ch ph???c v??? ??? ????y.',9,'2021-12-04 12:44:10.936651'),(5,'2021-12-04 12:52:58.503874','Kh??ng gian sach ?????p v?? trang tr?? b???t m???t, ph???c v??? t???n t??nh.',10,'2021-12-04 12:52:58.503874'),(6,'2021-12-04 12:58:27.597976','Ph???c v??? t???n t??nh, chu ????o!',12,'2021-12-04 12:58:27.597976'),(28,'2021-12-04 13:35:43.923949','R???t t???n t??nh v?? t???n t??m!',4,'2021-12-04 13:35:43.923949'),(29,'2021-12-04 13:37:59.212505','T??i th??ch c??ch trang tr?? c??ng nh?? s??? ph???c v??? ??? ????y.',8,'2021-12-04 13:37:59.212505');
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
INSERT INTO `food_type` VALUES (1,'B??nh m???n khai v???'),(11,'C??m - mi???n'),(2,'Khai v??? ba m??n'),(7,'M??n b??'),(4,'M??n c??'),(3,'M??n cua'),(9,'M??n g?? - v???t'),(8,'M??n heo'),(12,'M??n l???u'),(5,'M??n soup'),(6,'M??n t??m'),(13,'M??n tr??ng mi???ng');
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
INSERT INTO `menu_drink` VALUES (1,'N?????c su???i',100000,1,'img/drink/N?????c_l???c.jpg','b??nh'),(2,'R?????u vang ?????',2000000,1,'img/drink/Red_win.jpg','chai'),(3,'R?????u vang tr???ng',1600000,1,'img/drink/White_win.jpg','chai'),(4,'Champagne',4000000,1,'img/drink/Champagne.jpg','chai'),(5,'Bia Heineken chai',540000,1,'img/drink/Heineken_chai.jpg','k??t'),(6,'Bia Heineken lon',650000,1,'img/drink/Heineken_lon.jpg','th??ng'),(7,'Bia Tiger chai',360000,1,'img/drink/Tiger_chai.jpg','k??t'),(8,'Bia Tiger lon',400000,1,'img/drink/Tiger_lon.jpg','th??ng'),(9,'Bia Sapporo chai',370000,1,'img/drink/Sapporo_chai.jpg','k??t'),(10,'Bia Sapporo lon',420000,1,'img/drink/Sapporo_lon.jpg','th??ng'),(11,'Pepsi',240000,1,'img/drink/Pepsi.jpg','th??ng'),(12,'Mirinda soda kem',204000,1,'img/drink/Mirinda_soda_kem.jpg','th??ng');
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
INSERT INTO `menu_food` VALUES (1,'Croissant tr???ng mu???i',500000,1,'B??nh Croissant c?? ngu???n g???c t??? ??o ???????c s???n xu???t t??? b???t m??, men, b??, s???a, v?? mu???i. ???n d?????i l???p b??nh n??ng gi??n b??n ngo??i l?? l???p tr???ng mu???i s??nh m???n, ?????m ????, b??i b??i, b??o ng???t, s??ng s??nh v??ng ????m h??a l???n v???i tr???ng mu???i m???n m???n. Chi???c b??nh nh??? nh???n, xinh x???n, k???t h???p ?????c bi???t v???i ????? m???m d???o b??n trong, gi??n tan b??n ngo??i c???a croissant, v??? b??nh m??u v??ng c??nh gi??n ?????p m???t.','img/food/Croissant_tr???ng_mu???i.jpg',0,1),(2,'Puff bacon & corn',500000,1,'B??nh cu???n gi??n v???i ng?? ng???t, th???t x??ng kh??i v?? ph?? mai mozzarella.','img/food/Puff_bacon__corn.jpg',0,1),(3,'Pate chaud',400000,1,'Pate chaud l?? m???t lo???i b??nh c?? ngu???n g???c t??? Ph??p c?? v??? b???ng b???t m?? v?? b?? n?????ng l??, b??n trong c?? nh??n th???t heo, n???m m??o v?? h??nh kh??. B??nh ng???t c?? l???p v??? m???ng nh??? b??n ngo??i v???i nh??n th???t.','img/food/Pate_chaud.jpg',0,1),(4,'Croissant cheese',500000,1,'B??nh Croissant c?? ngu???n g???c t??? ??o ???????c s???n xu???t t??? b???t m??, men, b??, s???a, v?? mu???i. ???n d?????i l???p b??nh n??ng gi??n b??n ngo??i l?? l???p ph?? mai s??nh m???n, ?????m ????, b??o ng???t. Chi???c b??nh nh??? nh???n, xinh x???n, k???t h???p ?????c bi???t v???i ????? m???m d???o b??n trong, gi??n tan b??n ngo??i c???a croissant, v??? b??nh m??u v??ng c??nh gi??n ?????p m???t.','img/food/Croissant_cheese.jpg',0,1),(5,'Danish ham & cheese rolls',400000,1,'Danish ham & cheese rolls ???????c l??m t??? 5 nguy??n li???u: b??nh ph???ng, m?? t???t, gi??m b??ng, ph?? mai v?? tr???ng. S??? k???t h???p gi???a gi??m b??ng m???n v?? ph?? mai tan ch???y k??m theo b??nh ng???t b?? t???o n??n m???t h????ng v??? cu???n h??t kh?? c?????ng.','img/food/Danish_ham__cheese_rolls.jpg',0,1),(6,'Ch??? t??m Th??i Lan',100000,1,'Ch??? t??m ki???u Th??i thu h??t ng?????i th?????ng th???c b???i v??? ?????p t????i s??ng b??n ngo??i v?? h????ng v??? th??m ngon b??n trong. C??i gi??n r???m c???a b???t ??o ??? ngo??i k???t h???p v???i v??? ng???t ?????m ???? c???a t??m ??? trong ch???c ch???n s??? l??m b???n kh??ng th??? ch???i t???.','img/food/Ch???_t??m_Th??i_Lan.jpg',0,2),(7,'Ch??? ???ch n?????ng m??? ch??i',150000,1,'S??? k???t h???p gi???a h????ng v??? th??m ngon, ng???t c???a th???t v?? b??o ng???y c???a m???, n?????c ch???m ????? v??? chua, cay, m???n, ng???t t???o n??n b???c tranh h????ng v??? s???ng ?????ng, ng???t ng??o, ?????m v???.','img/food/Ch???_???ch_n?????ng_m???_ch??i.jpg',0,2),(8,'Ch??? gi?? h???i s???n',100000,1,'Ch??? gi?? gi??n r???m v???i nh??n h???i s???n g???m t??m, m???c t????i ngon b??n trong s??? l?? m??n ??n khai v??? h???p d???n cho c??c b???a ti???c.','img/food/Ch???_gi??_h???i_s???n.jpg',0,2),(9,'Salad h???i s???n ki???u Th??i',150000,1,'M??n salad h???i s???n ki???u Th??i gi??n, m??t, s???ng kho??i v???i v??? chua cay d???u nh??? s??? gi???i tho??t b???n kh???i c??i n???ng n??ng b???c b???i c???a m??a h??.','img/food/Salad_h???i_s???n_ki???u_Th??i.jpg',0,2),(10,'Salad s?? ??i???p tr???ng mu???i',200000,1,'Salad s?? ??i???p tr???ng mu???i l?? m???t m??n ??n c?? ????? m??u: m??u xanh c???a rau, m??u v??ng v?? ????? c???a ???t chu??ng, m??u cam c???a c?? r???t, m??u c???a l??ng ????? tr???ng v???t mu???i.','img/food/Salad_s??_??i???p_tr???ng_mu???i.jpg',0,2),(11,'Salad ???c g??',300000,1,'Salad ???c g?? l?? m??n ??n ngon mi???ng, kh??ng g??y b??o, ???????c nhi???u b???n ??ang gi???m c??n ??a chu???ng.','img/food/Salad_???c_g??.jpg',0,2),(12,'G???i m???c Th??i Lan',150000,1,'Th???t m???c ng???t thanh t??? nhi??n, rau c??? gi??n ngon t????i m??t quy???n c??ng v???i v??? cay n???ng chua chua c???a n?????c s???t, t???ng th??? t???o n??n m???t m??n g???i m???c Th??i Lan kh?? qu??n trong l??ng ng?????i ??n.','img/food/G???i_m???c_Th??i_Lan.jpg',0,2),(13,'G???i c??? h??? d???a t??m th???t',150000,1,'G???i c??? h??? d???a t??m th???t l?? m??n ngon d??n d?? c???a ng?????i mi???n T??y. C??? h??? d???a l?? ph???n non nh???t tr??n ?????t c??y d???a, c?? v??? ng???t, m???m kh?? c?????ng d?? l?? ??n s???ng hay b??p g???i.','img/food/G???i_c???_h???_d???a_t??m_th???t.jpg',0,2),(14,'G???i th???t n???t t??m th???t',150000,1,'S??? k???t h???p gi???a v??? ?????m ???? c???a th???t, v??? t????i ngon c???a t??m, v??? ngon ng???t c???a th???t n???t l??m n??n m???t g???i h???p d???n, ngon mi???ng.','img/food/G???i_th???t_n???t_t??m_th???t.jpg',0,2),(15,'M???c chi??n x?? s???t xo??i',150000,1,'M???c chi??n x?? c?? l??? kh??ng c??n xa l??? v???i nhi???u ng?????i, nh??ng m??n ??n tr??? n??n h???p d???n h??n nhi???u khi ???????c k???t h???p v???i x???t xo??i th??m m???n.','img/food/M???c_chi??n_x??_s???t_xo??i.jpg',0,2),(16,'M???c nh???i tr???ng mu???i',200000,1,'V???i s??? t????i ngon c???a m???c v?? s??? b??o b??o b??i b??i c???a tr???ng mu???i ???? t???o n??n m???t m??n ??n th??m ngon, tr??n v???.','img/food/M???c_nh???i_tr???ng_mu???i.jpg',0,2),(17,'M???c chi??n gi??n',150000,1,'M???c c?? v??? ng???t t??? nhi??n, dai dai ???????c t???m ?????p gia v??? v?? ph??? l???p b???t b??n ngo??i mang ????n c???m gi??c gi??n r???m v?? ?????m ???? cho ng?????i th?????ng th???c.','img/food/M???c_chi??n_gi??n.jpg',0,2),(18,'T??m s?? s???t chanh d??y',200000,1,'T??m s?? chanh d??y v???a ngon l???i c?? v??? th??m th??m, chua chua, ng???t ng???t v?? c??ng th?? v???','img/food/T??m_s??_s???t_chanh_d??y.jpg',0,2),(19,'T??m rang tr???ng mu???i',300000,1,'Tr???ng mu???i b??o b??o, th??m th??m, rang c??ng t??m h???p ?????n l??? k??? ??em ?????n m???t m??n ??n l??? mi???ng nh??ng r???t ngon.','img/food/T??m_rang_tr???ng_mu???i.jpg',0,2),(20,'G???i c??? h??? d???a chay',100000,1,'G???i c??? h?? d???a chay v???i ????? gi??n gi??n c???a h?? d???a, chua ng???t c???a m???m ch???m chay r???t th??ch h???p ????? l??m m??n khai v??? trong c??c b???a ti???c chay.','img/food/G???i_c???_h???_d???a_chay.jpg',1,2),(21,'G???i g?? x?? phay chay',100000,1,'G???i g?? xe phay chay c?? h????ng v??? v?? c??ng th??m ngon v??i h??i h??a. Ph???n rau th??m ??n k??m v???i m?? c??n x?? s???i ???????c n??m n???m gia v??? v???a mi???ng v?? mang ?????n h????ng v??? t????i m??t c???a m??n g???i.','img/food/G???i_g??_x??_chay.jpg',1,2),(22,'Ch??? gi?? rau c???',100000,1,'V???i s??? t????i ngon t??? rau c??? t???o ???? t???o n??n nh???ng cu???n ch??? gi?? ngon mi???ng cho th???c kh??ch.','img/food/Ch???_gi??_rau_c???.jpg',1,2),(23,'Salad xo??i n???m',100000,1,'Salad xo??i n???m m??n ??n khai v??? y??u th??ch c???a r???t nhi???u th???c kh??ch, m??n ??n v???i hai nguy??n li???u ch??nh l?? xo??i  v?? n???m k??m theo v??? n?????c s???t chanh leo chua ng???t d???u nh???.','img/food/Salad_xo??i_n???m.jpg',1,2),(24,'Cua l???t rang mu???i H???ng K??ng',1500000,1,'Cua sau khi rang chuy???n th??nh gam m??u cam b??ng thu r??t ??nh nh??n t??? m???i ph??a k???t h???p v???i v??? mu???i H???ng Kong m???n m???n t???o n??n m???t m??n ??n ngon mi???ng kh?? c?????ng.','img/food/Cua_l???t_rang_mu???i_H???ng_K??ng.jpg',0,3),(25,'Cua l???t chi??n gi??n s???t tartar',1500000,1,'Kh??c v???i m??n Cua l???t chi??n ki???u truy???n th???ng, cua l???t chi??n s???t Tartar l?? m???t lo???i m??n ??n ???????c ch??? bi???n theo phong c??ch c???a ng?????i T??y Ban Nha. M??n cua n??y khi ??n s??? ???????c ch???m k??m m???t lo???i s???t c?? t??n l?? tartar v?? c??ng l??? mi???ng.','img/food/Cua_l???t_chi??n_gi??n_s???t_tartar.jpg',0,3),(26,'Cua l???t ????t l?? ph?? mai',1500000,1,'Nh???ng con cua c??ng tr??n, v??ng ????m, t???a m??i th??m n???c, ch??a c???n ??n, m??n cua ????t l?? v???i ph?? mai ???? khi???n con m???t b???n th???a thu?? b???i m??u s???c h???p d???n c???a n??!','img/food/Cua_l???t_????t_l??_ph??_mai.jpg',0,3),(27,'Cua l???t s???t t???i ???t',1500000,1,'S??? b??o ng???y, t????i ngon c???a cua c??ng m??i th??m ph???c, cay cay c???a t???i ???t t???o c???m gi??c th??ch th?? v?? ngon mi???ng cho th???c kh??ch.','img/food/Cua_l???t_s???t_t???i_???t.jpg',0,3),(28,'C?? ch???m s???t gi???m ??en',1000000,1,'Th???t c?? ch???m k???t h???p c??ng x???t gi???m ??en s??? mang ?????n cho b???n m???t m??n ??n ho??n ch???nh c??? v??? h????ng v??? l???n h??nh th???c. Th???t c?? m???m ng???t th???m ?????m n?????c x???t cu???n h??t m???i th???c kh??ch d?? l?? ng?????i kh?? t??nh nh???t. Kh??ng ch??? d???ng l???i ??? c?? ch???m v?? x???t gi???m ??en, b???n c??n ???????c t???n h?????ng h????ng v??? thanh m??t c??ng m??i th??m ?????c tr??ng c???a c??c lo???i rau c??? ??p ch???o ??n k??m.','img/food/C??_ch???m_s???t_gi???m_??en.jpg',0,4),(29,'C?? ch???m s???t kem chanh',1000000,1,'C?? ch???m ???????c chi??n v???a ch??n t???i, k???t h???p x???t v??? b??o chua h??i h??a t???o n??n m??n ??n v???a ngon mi???ng, v???a b??? d?????ng.','img/food/C??_ch???m_s???t_kem_chanh.jpg',0,4),(30,'C?? ch???m ??p ch???o',1000000,1,'C?? ch???m ???????c phi l?? t???m ?????p gia v??? v???a ph???i ??p ch???o ??n k??m v???i m???t ??t s???t hoa qu??? ng???t v??? s??nh m???n.','img/food/C??_ch???m_??p_ch???o.jpg',0,4),(31,'C?? cu???n bacon h????ng th???o',1000000,1,'Th??? ch??t h????ng v??? c???a ???m th???c ph????ng T??y cho m??n C?? cu???n bacon h????ng th???o ????? b???a ??n nh?? b???n th??m m???i l??? nh??. T???ng l???p th???t bacon n??u s??m quy???n v???i m??i h????ng th???o th??m n???c cu???n mi???ng c?? ng???t m???m b??n trong, ch???m th??m t?? s???t th?? th???t tuy???t v???i!','img/food/C??_cu???n_bacon_h????ng_th???o.jpg',0,4),(32,'C?? h???i ??p ch???o s???t cam v?? h????ng th???o',1200000,1,'C?? h???i ??p ch???o s???t cam v?? h????ng th???o l?? m???t m??n ??n chu???n b???p ??u. C?? h???i ??p ch???o ????ng ????? s??? gi??n v??ng b??n ngo??i nh??ng v???n m???m, ng???t b??n trong. V??? cam v?? h????ng th???o t????i c??n khi???n m??n c?? th??m, ng???t t??? nhi??n ch???c ch???n khi???n th???c kh??ch h???ng th?? v?? s???n kho??i.','img/food/C??_h???i_??p_ch???o_s???t_cam.jpg',0,4),(33,'C?? h???i s???t b?? chanh',1200000,1,'C?? h???i s???t b?? chanh mang h????ng v??? l??i cu???n t??? v??? chua chua c???a chanh v?? b??? b??o b??o c???a c??.','img/food/C??_h???i_s???t_b??_chanh.jpg',0,4),(34,'C?? t???m ????t l??',1100000,1,'C?? t???m ????t l?? mang h????ng v??? ?? - ??u th??m ngon, m???m m???i khi???n th???c kh??ch kh??ng th??? ch???i t???.','img/food/C??_t???m_????t_l??.jpg',0,4),(35,'C?? b???ng m?? h???p H???ng K??ng',1200000,1,'M??n c?? m?? h???p H???ng K??ng l?? m??n ??n ?????c s???c c???a ng?????i Hoa, l???i c?? th??? n???i danh ??? nhi???u n?????c b???i h????ng v??? th??m ngon, ?????c bi???t c???a n??.','img/food/C??_b???ng_m??_h???p_H???ng_K??ng.jpg',0,4),(36,'Soup h???i s???n',300000,1,'S??p h???i s???n m???t trong nh???ng m??n ??n ???????c c??? ng?????i l???n c??ng nh?? tr??? em y??u th??ch. V???i nh???ng nguy??n li???u ch??nh ???? l?? m???c ???ng, th???t cua, t??m, ... v?? rau c??? l??m cho m??n ??n c?? ????? dinh d?????ng cao v?? ?????m ???? ng???t v???.','img/food/Soup_h???i_s???n.jpg',0,5),(37,'Soup tuy???t nh?? cua g??',320000,1,'S??p g?? n???m tuy???t n??ng h???i thanh m??t v?? gi??n ng???t cho th???c ????n khai v??? ng??y ????ng c???c h???p d???n v?? b??? d?????ng.','img/food/Soup_tuy???t_nh??_cua_g??.jpg',0,5),(38,'Soup s?????n ????ng tr??ng h??? th???o',400000,1,'Soup s?????n ????ng tr??ng h??? th???o v???a ngon v???a t???t cho s???c kh???e v?? ph??ng ng???a m???t s??? b???nh.','img/food/Soup_s?????n_????ng_tr??ng_th???o.jpg',0,5),(39,'Soup b??o ng??',500000,1,'Soup b??o ng?? v???a th??m ngon tr??n v??? v???a b??? kh???e, t???t cho s???c kh???e.','img/food/Soup_b??o_ng??.jpg',0,5),(40,'Soup chay th???p c???m',250000,1,'Soup chay rau c??? qu???','img/food/Soup_chay_th???p_c???m.jpg',1,5),(41,'T??m c??ng xanh n?????ng b?? t???i',300000,1,'T??m c??ng xanh n?????ng b?? t???i l?? s??? k???t h???p ho??n h???o gi???a h????ng v??? t????i ngon t??? bi???n ho?? v???i h????ng th??m t??? t???i quy???n ch??t v??? b??o c???a b??, l?? m???t m??n n?????ng h???p d???n trong c??c bu???i ti???c.','img/food/T??m_c??ng_xanh_n?????ng_b??_t???i.jpg',0,6),(42,'T??m h???p n?????c d???a',500000,1,'V???i nh???ng ch?? t??m th??m ng???t c?? th??m m??i th??m v?? v??? ng???y c???a d???a. Khi ??n n???u kh??ng th??ch ??n v??? c??c b???n c?? th??? b??c v??? t??m v?? ch???m c??ng v???i ph???n n?????c s???t b??n trong tr??i d???a.','img/food/T??m_h???p_n?????c_d???a.jpg',0,6),(43,'T??m s???t g???ch cua',700000,1,'M??n t??m s???t g???ch cua c??ng v???i h????ng v??? ngon mi???ng v?? v?? c??ng m???i l??? c??ng v???i v??? b??i b??i m???n m???n c???a tr???ng mu???i, c??ng v??? ?????m ???? c???a g???ch cua t???o th??nh m??n x???t ngon kh??ng th??? c?????ng l???i ???????c.','img/food/T??m_s???t_g???ch_cua.jpg',0,6),(44,'T??m s?? rang mu???i H???ng K??ng',450000,1,'H????ng v??? ?????c bi???t h???p d???n v?? ?????m ????, ??n c???c k?? l??? mi???ng.T??m s?? rang mu???i v???i nhi???u s??? k???t h???p, t??? vi???c l???a ch???n nguy??n li???u t????i ngon, ?????n k??? thu???t t???m ?????p gia v???, k??? thu???t n?????ng hay c??ch l??m mu???i ti??u ch???m k??m t???o n??n m???t m??n ??n ngon tr??n v???.','img/food/T??m_s??_rang_mu???i_H???ng_K??ng.jpg',0,6),(45,'B?? ??c s???t ti??u ??en - Khoai t??y',1500000,1,'B?? b??t t???t l?? m??n ??n ???????c bi???t ?????n kh?? nhi???u t???i c??c nh?? h??ng, qu??n ??n. ????y l?? m??n ??n ???????c tr??nh b??y ?????p m???t, c?? h??i h?????ng sang ch???nh v?? h????ng v??? th?? kh???i ph???i b??n, nh???t l?? ph???n n?????c s???t ti??u ??en.','img/food/B??_??c_s???t_ti??u_??en.jpg',0,7),(46,'B?? h???m s???t vang ????? - B??nh m??',1000000,1,'B?? s???t vang l?? m??n ??n quen thu???c ?????i v???i nhi???u ng?????i. ????y l?? m??n b?? d??? ch??? bi???n c?? th??? ??n k??m v???i c??m, b??n ho???c b??nh m??.','img/food/B??_h???m_s???t_vang_?????.jpg',0,7),(47,'B?? cu???n ph?? mai s???t n???m',1200000,1,'B?? cu???n ph?? mai s???t n???m h????ng v???i th???t b?? t????i ngon quy???n c??ng ph?? mai b??o ng???y t???o c???m gi??c ngon mi???ng v?? h???p d???n th???c kh??ch t??? mi???ng ?????u ti??n.','img/food/B??_cu???n_ph??_mai_s???t_n???m.jpg',0,7),(48,'Heo s???a quay - B??nh bao h???p',1500000,1,'M??n Heo S???a Quay Flyfood h???p d???n b???i mi???ng th???t quay m??u v??ng n??u ?????p m???t, m???m v?? ng???t, l???p da b??n ngo??i gi??n tan, th??m b??i.','img/food/Heo_s???a_quay.jpg',0,8),(49,'S?????n n?????ng m???t ong',450000,1,'S?????n n?????ng m???t ong l?? m???t m??n ??n r???t ???????c ??a chu???ng b???i h????ng v??? ?????m ???? kh?? qu??n.','img/food/S?????n_n?????ng_m???t_ong.jpg',0,8),(50,'S?????n n?????ng BBQ s???t cay',450000,1,'S??????n n??????ng BBQ s????t cay v????i h????ng vi?? cay cay cu??a t????ng ????t gochujang, l????p da gio??n tan ho??a quy????n cu??ng thi??t s??????n mo??ng n??????c.','img/food/S?????n_BBQ_s???t_cay.jpg',0,8),(51,'V???t quay V??n ????nh  - B??nh bao chi??n',500000,1,'M??i th??m ?????c tr??ng c???a v???t ch??n v???i m??u n??u b??nh m???t, gi??n gi??n v?? b??o b??o. Trong ???? th?? b??nh bao lu??n l?? th???c ph???m ??i k??m gi??p l??m t??ng h????ng v??? v?? th???c kh??ch s??? kh??ng b??? ng??n. V???i s??? k???t h???p h??i h??a ?????m ch???t n??y ch???c ch???n s??? kh??ng l??m cho th???c kh??ch th???t v???ng','img/food/V???t_quay.jpg',0,9),(52,'G?? n?????ng s???t Teriyaki',800000,1,'Kh??ng c??n g?? tuy???t v???i h??n khi c??ng b???n b?? v?? ng?????i th??n th?????ng th???c nh???ng mi???ng g?? n?????ng v??ng ru???m, th???m ?????m gia v???, m???m ng???t, b??o ng???y v???i n?????c x???t teriyaki ?????m ????.','img/food/G??_n?????ng_s???t_Teriyaki.jpg',0,9),(53,'???c v???t s???t ti??u ??en',800000,1,'???c v???t quay v???i l???p da ngo??i ngo??i gi??n r???m, th??m ngon, cay cay, ng???t th???t r???t h???p d???n.','img/food/???c_v???t_s???t_ti??u_??en.jpg',0,9),(63,'C??m chi??n h???i s???n',300000,1,'V???i m??n c??m n??y v???a ?????m b???o ngon mi???ng m?? c??n cung c???p ?????y ????? ch???t dinh d?????ng.','img/food/C??m_chi??n_h???i_s???n.png',0,11),(64,'C??m chi??n b??o ng??',500000,1,'C??c m??n ??n ch??? bi???n t??? b??o ng?? ?????u mang h????ng v??? th??m ngon v?? ng???t ng??o ri??ng. ?????c bi???t, m??n c??m chi??n b??o ng?? ch???c ch???n s??? khi???n b???n ng???t ng??y.','img/food/C??m_chi??n_b??o_ng??.jpg',0,11),(65,'B??n x??o Singapore',300000,1,'M??n b??n x??o ?????c ????o theo c??ng th???c ki???u Singapore c???c k?? th??m ngon v???i nh???ng s???i b??n th???m v??? d???u m?? k???t h???p c??ng t??m, th???t, tr???ng ?????y ????? dinh d?????ng h??a quy???n c??ng n?????c s???t t????ng ?????m ???? cho b???n b???a ??n ngon mi???ng v?? ????? ch???t.','img/food/B??n_x??o_Singapore_YzSajr9.jpg',0,11),(66,'M?? x??o h???i s???n',300000,1,'M?? x??o h???i s???n l?? m???t m??n ??n r???t ngon, h??a tr???n nh???ng mi???ng h???i s???n th??m ngon c??ng v???i nh???ng lo???i rau c???, x??o chung v???i nhau c??ng v???i v??? chua chua ng???t ng???t, t???o n??n m???t m??n ??n v?? c??ng tuy???t h???o','img/food/M??_tr???n_h???i_s???n.jpg',0,11),(67,'L???u h???i s???n cua ?????ng - B??n t????i',1500000,1,'Trong ca??c mo??n l????u ??????c tr??ng h????ng vi?? truy????n th????ng ????m th????c Vi????t thi?? l????u ri??u cua ??????ng x????ng ??a??ng ????????c x????p va??o TOP nh???ng mo??n l????u ngon ????????c nhi????u ng??????i y??u thi??ch nh????t. Mo??n l????u d??n da?? na??y lu??n ?????? la??i d?? vi?? kho?? qu??n cho nh????ng ai t????ng th??????ng th????c.','img/food/L???u_h???i_s???n_cua_?????ng.jpg',0,12),(68,'L???u t??m Th??i Lan - B??n t????i',1500000,1,'L???u t??m Th??i Lan l?? s??? k???t h???p h??i h??a gi???a h???i s???n c??ng v??? chua chua, cay cay ?????c tr??ng c???a x??? s??? ch??a V??ng th?? L???u t??m Th??i Lan l?? s??? ch???n th??ch h???p nh???t. V???i nguy??n li???u ch??nh l?? t??m ngon ?????c bi???t c?? l???p v??? s??n ch???c v?? th???t cho v??? th??m, m???m ng???t khi ch??n t???i, gi??u dinh d?????ng m?? kh??ng k??m ph???n thanh ng???t. N?????c l???u l?? s??? k???t h???p c???a m???t ch??t cay c???a g???ng, ???t, v??? n???ng c???a ti??u, v??? ng???t t??? n?????c h???m, th??m v?? c?? chua. M??u ????? au c???a t??m h??a c??ng s???c t????i c???a c?? chua h???p d???n b???t c??? ai ngay t??? khi v???a m???i ??em ra.','img/food/L???u_t??m_Th??i_Lan.jpg',0,12),(69,'L???u h???i s???n Th??i Lan - B??n t????i',1500000,1,'L???u h???i s???n Th??i Lan l?? m??n ??n bi???n th??? t??? m??n canh chua Tom yum n???i ti???ng c???a Th??i Lan. Nguy??n li???u ????? l??m ra m???t n???i l???u Th??i r???t phong ph??, ???? l?? th???t b??, th???t g??, h???i s???n, ch??? c??, n???m v?? c??c lo???i rau xanh.','img/food/L???u_h???i_s???n.jpg',0,12),(70,'L???u c?? b???p m??ng chua',1500000,1,'L???u c?? b???p m??ng chua l?? m???t trong nh???ng m??n l???u ???????c nhi???u ng?????i say m?? b???i v??? ngon kh?? c?????ng.','img/food/L???u_c??_b???p_n???u_m??ng_chua.jpg',0,12),(71,'L???u Th??i chay',700000,1,'N?????c l???u n???m th??i c?? v??? chua chua cay cay h????ng v??? ?????m ????, th??m ngon. B???n c?? th??? ??n l???u th??i chay k??m b??n t????i, r???c th??m rau th??m, t???i t??y ????? t???n h?????ng c???m gi??c tuy???t v???i nh???t.','img/food/L???u_Th??i_chay.jpg',1,12),(72,'Mousse chanh mu???i',300000,1,'B??nh mousse chanh mu???i m??t m??? t????i m???i, mang l???i v??? b??nh kh??ng qu?? ng???t b???i nguy??n li???u m?? c??? thanh m??t, s???ng kho??i.','img/food/Mousse_chanh_mu???i.jpg',0,13),(73,'Passion fruit layer cake',300000,1,'Passion fruit layer cake h????ng v??? kiwi','img/food/Passion_fruit_and_kiwi_cheesecake.jpg',0,13),(74,'Nho M???',500000,1,'Nho M??? t????i ngon l?? m???t m??n tr??ng mi???ng ???????c nhi???u ng?????i ??a chu???ng.','img/food/Nho_M???.jpg',1,13),(75,'Ch?? h???t sen long nh??n',300000,1,'Ch?? sen long nh??n l?? m???t m??n ??n c???c k??? b??? d?????ng. Hi???n ??ang ???????c r???t nhi???u ng?????i y??u th??ch, b???i l???i ??ch m?? n?? mang l???i c???c k??? l???n.','img/food/Ch??_h???t_sen_long_nh??n.jpg',1,13),(76,'Ch?? kh??c b???ch',300000,1,'Ch?? kh??c b???ch l?? m??n ch?? ??a th??ch c???a m???i ng?????i v?? r??t th??ch h???p ????? gi???i nhi???t m??a h??. Nh???ng mi???ng kh??c b???ch th??m b??o v?? m???m m???n h??a quy???n v???i n?????c ???????ng v?? c??c topping ngon mi???ng nh?? h???nh nh??n, h???t chia s??? khi???n b???n m?? m???n khi th?????ng th???c.','img/food/Ch??_kh??c_b???ch.jpg',1,13),(77,'Rau c??u d???a',300000,1,'M??n th???ch d???a m??t l???nh ch??a bao gi??? h???t h???p d???n v??o m???i m??a h??, t???ng mi???ng th???ch trong m??t, th??m ng???t tan tr???ng mi???ng gi??p b???n qu??n ??i c??i n??ng, c??i n???ng ch??i trang.','img/food/Rau_c??u_d???a.jpg',1,13);
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
INSERT INTO `service` VALUES (1,'C???ng hoa tr??n 1',1000000,1,'img/service/C???ng_hoa_tr??n.jpg',1),(2,'C???ng vu??ng',500000,1,'img/service/C???ng_vu??ng.jpg',1),(3,'c???ng hoa tr??n 2',1000000,1,'img/service/C???ng_hoa_tr??n_2.jpg',1),(4,'C???ng hoa vu??ng',700000,1,'img/service/C???ng_hoa_vu??ng.jpg',1),(5,'L???i ??i 1',1000000,1,'img/service/L???i_??i_1.jpg',2),(6,'L???i ??i 2',600000,1,'img/service/L???i_??i_2.jpg',2),(7,'L???i ??i 3',1200000,1,'img/service/L???i_??i_3.jpg',2),(8,'L???i ??i 4',1000000,1,'img/service/L???i_??i_4.jpg',2),(9,'Khung ???nh 1',700000,1,'img/service/Khung_???nh_1.jpg',3),(10,'Khung ???nh 2',1000000,1,'img/service/Khung_???nh_2.jpg',3),(11,'Khung ???nh 3',800000,1,'img/service/Khung_???nh_3.jpg',3),(12,'Khung ???nh 4',1000000,1,'img/service/Khung_???nh_4.jpg',3),(13,'Ch??i ????n violin',500000,1,'img/service/violin.jpg',4),(14,'Ch??i ????n piano',500000,1,'img/service/Piano.jpg',4),(15,'M??a',700000,1,'img/service/M??a.jpg',4),(16,'Ban nh???c',3000000,1,'img/service/Ban_nh???c.jpg',5),(17,'Ca s??',2000000,1,'img/service/Ca_s??.jpg',5),(18,'D???n ch????ng tr??nh - MC',1500000,1,'img/service/MC.jpg',5),(19,'?????i kh??nh ti???t l??m l???',500000,1,'img/service/Kh??nh_ti???t.jpg',5),(20,'Trang tr?? 1',1000000,1,'img/service/Trang_tr??_1.jpg',6),(21,'Trang tr?? 2',700000,1,'img/service/Trang_tr??_2.jpg',6),(22,'M???u trang tr?? 1',1000000,1,'img/service/M???u_trang_tr??_1.jpg',7),(23,'M???u trang tr?? 2',700000,1,'img/service/M???u_trang_tr??_2.jpg',7),(24,'M???u trang tr?? 3',800000,1,'img/service/M???u_trang_tr??_3.jpg',7),(25,'M???u trang tr?? 4',1200000,1,'img/service/M???u_trang_tr??_4.jpg',7),(26,'MC Ch?? h???',2500000,1,'img/service/MC_Ch??_h???.jpg',8),(27,'M???u h???i ngh??? 1',1000000,1,'img/service/M???u_h???i_ngh???_1.jpg',9),(28,'M???u h???i ngh??? 2',1000000,1,'img/service/M???u_h???i_ngh???_2.jpg',9),(29,'D???ng l???p h???c',2000000,1,'img/service/D???ng_l???p_h???c.jpg',10),(30,'D???ng r???p h??t',1500000,1,'img/service/D???ng_r???p_h??t.jpg',10),(31,'D???ng U-Shape',2000000,1,'img/service/D???ng_U-Shape.jpg',10);
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
INSERT INTO `service_type` VALUES (1,'Trang tr?? c???ng',1),(2,'Trang tr?? l???i ??i',1),(3,'B??n l??? t??n - Khung ???nh',1),(4,'V??n ngh??? khai ti???c',1),(5,'D???ch v??? kh??c',1),(6,'Trang tr?? c???ng sinh nh???t',3),(7,'B??n trang tr?? - khung ???nh',3),(8,'D???ch v??? sinh nh???t kh??c',3),(9,'Trang tr?? c???ng h???i ngh???',2),(10,'B??? tr?? s???nh h???i ngh???',2);
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
INSERT INTO `user` VALUES (1,'pbkdf2_sha256$260000$BVoRbUkxTb4d1TPPZHdWzV$mx5QWDy73WfD5C24Vdhsl3Z6jdZOoU/m4+Ssvfa1ey8=','2021-11-09 08:17:39.304225',1,'admin','','','1851050182uyen@ou.edu.vn',1,1,'2021-08-16 15:36:55.332295','','',''),(4,'pbkdf2_sha256$260000$iLKf91Z9CQN7cW8mtvfvxO$rqRKZSnztHzmyjycB2668mgtiyrcMbtGBhmSwgmYtmY=',NULL,0,'uyennguyen','Uy??n','Nguy???n','uyennguyen0721@gmail.com',0,1,'2021-08-18 13:01:26.060279','0947653170','58/4 ???????ng s??? 7, ph?????ng 7, G?? V???p, TPHCM','img/avatar/2021/08/avatar_WHXgW5u.jpg'),(6,'123456789',NULL,0,'linhphan','Linh','Phan','linh@gmail.com',0,1,'2021-10-31 07:06:22.399010','1234567890','123 L?? Ch??nh Th???ng, ph?????ng 7, qu???n 3, TPHCM','img/avatar/2021/11/avatar-1_Wftz5Xy.jpg'),(7,'pbkdf2_sha256$260000$TFZRDKPizuKCSVdAI3ygWF$K2sAVaHHUoXMFYpwG1SXSh3cqvdEJh3f5Ax7FL71XS4=',NULL,0,'tieumytran','Ti???u My','Tr???n','tieumy@gmail.com',0,1,'2021-10-31 07:20:20.052806','0123456789','150 C???ng H??a, T??n B??nh, TPHCM','img/avatar/2021/11/avatar-4.jpg'),(8,'pbkdf2_sha256$260000$qEvLMEjCxAcODfdgBVSxDt$eSFEkNU4SHvI7MurXO6aAVfmQrjo1eNeW5c38qNcY1M=',NULL,0,'quynhle','Qu???nh','L??','lequynh@gmail.com',0,1,'2021-10-31 07:53:18.158603','1234567890','97 V?? V??n T???n, qu???n 3, TPHCM','img/avatar/2021/11/avatar-7_WZqMXT8.jpg'),(9,'pbkdf2_sha256$260000$sGXpF6ht9wyQKagwSubzRB$flKF/cq2p4ekRmHJ+57+9YKEqdYz6fU78HxMwdLhnKs=',NULL,0,'linhdam','????m','Linh','linhdam@gmail.com',0,1,'2021-10-31 08:06:46.490810','1234567890','140 Nguy???n Du, G?? V???p, TPHCM','img/avatar/2021/11/avatar-6.jpg'),(10,'pbkdf2_sha256$260000$Fh1TuSEPvzBJQ29zleK1WQ$5aMIGAuB6YAAfR8aYZxrt8m30UMiXI/CzsUKCjv86nw=',NULL,0,'thuynguyen','Th??y','Nguy???n','thuynguyen@gmail.com',0,1,'2021-10-31 08:26:54.274169','','','img/avatar/2021/10/avatar-4.jpg'),(11,'pbkdf2_sha256$260000$XkXZpz6MFbBWMmMYjyQrqe$K48G7zTiAlrD1cgVhxKjNy5uhzM1BKrh9vp9KtKuYmg=',NULL,0,'lequynh','Qu???nh','L??','lequynh@gmail.com',0,1,'2021-11-01 16:22:57.972288','','','img/avatar/2021/11/avatar-7.jpg'),(12,'pbkdf2_sha256$260000$3jyyZMtdWuIIH5q04v81K0$UdqWaOXxMQJVPzzTVYR11vUxu4T/1GBOATTa0KaqYZw=',NULL,0,'hoaduong','H??a','D????ng','duonghoa@gmail.com',0,1,'2021-11-09 08:53:24.255961','','','');
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
INSERT INTO `wedding_lobby` VALUES (1,'S???nh Tulip','img/lobby/S???nh_Tulip.jpg',2,850,'M??u v??ng trong ????m c?????i t?????ng tr??ng cho s??? sung t??c, ????? ?????y, ???????c thi???t k??? v???i s???c v??ng tr???m ???m.\r\nC??ch s??? d???ng m??u v??ng c???a c??nh ?????ng hoa Tulip ??ang ????? ????n n???ng xu??n l??m t??ng m??u ch??? ?????o ???? t???o n??n m???t s???nh c?????i v?? c??ng ?????c bi???t t???i nh?? h??ng ti???c c?????i Glorian. S??? sang tr???ng v?? tinh t??? c??n th??? hi???n qua m??u v??ng ??nh ?????ng c???a n?? gh??? khi ch??ng tr??? n??n ???n t?????ng d?????i ??nh ????n pha l?? l???p l??nh.'),(2,'S???nh Rose','img/lobby/S???nh_Rose.jpg',3,750,'M??u ????? mang ?? ngh??a v??? t??nh y??u n???ng ch??y n??n c??ng l?? m???t trong nh???ng m??u s???c ???????c ??a chu???ng trong ????m c?????i, ?????c bi???t l?? ??? c??c n?????c ?? ????ng.  \r\n??? Glorian, s???c ????? ???????c th??? hi???n trong kh??ng gian s???nh Rose ?????y tinh t???. B???n s??? th???y s??? xu???t hi???n c???a nh???ng c??nh h???ng nhung t????i m???i, nh???ng chi???c n?? ????? ????nh k??m ?????y tinh t??? trong kh??ng gian s???nh. S???nh Rose ???????c thi???t k??? pha tr???n gi???a c??c t??ng m??u ????? kh??c nhau m???t c??ch c??ch h??i h??a t???o s??? ???n t?????ng ?????i v???i th??? gi??c, ?????ng th???i c??ng t???o n??n s??? sang tr???ng kh??ng ch??? trong c??i nh??n m?? t???n ?????n s??? c???m nh???n.'),(3,'S???nh Violet','img/lobby/S???nh_Violet.jpg',5,850,'T?????ng tr??ng cho s??? th???y chung, m??u t??m ng???t ng??o ???????c s??? d???ng nh???m t??n l??n v??? sang tr???ng v?? tinh t??? c???a ti???c c?????i\r\nL?? m???t trong nh???ng nh?? h??ng c?? s???nh c?????i ?????p t???i TP.HCM, Glorian kh??ng ch??? d???ng l???i ??? nh???ng gam m??u truy???n th???ng v?? ????n ??i???u. Kh??ch h??ng c?? th??? ???????c tr???i nghi???m kh??ng gian l??ng m???n v???i s???nh t??m Violet l???y c???m h???ng t??? s???c t??m ?????m c???a m???t chi???u ho??ng h??n, pha l???n v???i m??u t??m thanh d???u c???a lo??i hoa violet d???i. Ch??m ?????m trong ??nh n???n lung linh, huy???n ???o t???i s???nh Violet s??? l?? m???t tr???i nghi???m kh?? qu??n ?????i v???i c??c c???p ????i v?? c??c quan kh??ch.'),(4,'S???nh Gloria','img/lobby/S???nh_Gloria.jpg',6,750,'L?? m??u t?????ng tr??ng cho thi??n nhi??n, mang ?? ngh??a c???a s??? ph??t tri???n, sinh s??i, n???y n???, m??u xanh l?? c??y ????a l???i cho s???nh Gloria c???m gi??c d??? ch???u, m??t m??? nh?? m???t b???a ti???c ngo??i tr???i. \r\nS???nh Gloria s??? d???ng 2 s???c xanh c???a ????i hoa loa k??n, m???t lo??i hoa bi???u t?????ng c???a ng??y c?????i, ????? ph???i h???p trong thi???t k??? n???i th???t. S???nh c?????i n??y t???o c???m gi??c t????i m??t, g???n g??i v?? tr??? trung. Kh??ch ?????n d??? ti???c s??? c???m th???y th???t s??? tho???i m??i trong ??nh ????n xanh d???u nh??? g???i c???m gi??c h??a m??nh v??o thi??n nhi??n trong tr???o, y??n b??nh nh?? h???nh ph??c l???a ????i.');
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
