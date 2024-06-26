-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xqwzyuqgpayvluqqlambdjjkfyjfgyyfwxxj` (`ownerId`),
  CONSTRAINT `fk_okohdyhbmvxqfouyyvloknrbkbhdltsqgkdm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xqwzyuqgpayvluqqlambdjjkfyjfgyyfwxxj` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pgastdmgdapqbgouwpjiggfkmsmwkbemrvsd` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_fbbmcegvxraxdfibkjddjjkdfdxqjcgsnfju` (`dateRead`),
  KEY `fk_ufroocivtlseydhidxejjiqovzacslsozvty` (`pluginId`),
  CONSTRAINT `fk_ldqrxfqrvjmfefulpdgdvmwfqeixkosczqhc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ufroocivtlseydhidxejjiqovzacslsozvty` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnorihhcnadgojrngwhyliubwrnvehyhydjg` (`sessionId`,`volumeId`),
  KEY `idx_xmopqchsvzquiqpmdorvpexfiblsdxceifyq` (`volumeId`),
  CONSTRAINT `fk_wcnldmbaumokbcmitigbbgozdfuoysnancqm` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yihkwpirtilpcpatfwlhhsqkcktgutmmtkpa` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bpkojaguxjhtnygqdjripdtbcthrnqcbuetf` (`filename`,`folderId`),
  KEY `idx_yweuklkqxziuqhifbsmhruriussvbsobvbpp` (`folderId`),
  KEY `idx_lijrpyaibgsemtonwtpidsukrlhojxsbnjnw` (`volumeId`),
  KEY `fk_rvsewwqgyihannbrramhkpjvhjfbszydkotz` (`uploaderId`),
  CONSTRAINT `fk_ixlhpkzkweyynujeauhvpjiiwfpzspfvrlqm` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_maeqvbuwlbphfoybyposdnuzagvnzyxenymf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rvsewwqgyihannbrramhkpjvhjfbszydkotz` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wfnggwpajwtylidlstxlqofdkvzmiifzamds` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (7,1,1,1,'nmixx-dash-backgroung.jpg','image',NULL,700,467,334027,NULL,NULL,NULL,'2024-05-08 11:56:20','2024-05-08 11:56:21','2024-05-08 11:56:21'),(10,2,4,1,'logo-trans.png','image',NULL,675,675,346734,NULL,NULL,NULL,'2024-06-26 20:39:43','2024-05-08 12:05:55','2024-06-26 20:39:43'),(12,1,1,1,'d58db7931b0d44f08d3a1dc92924d0c4-공홈-pc.png','image',NULL,1921,1081,3698972,NULL,NULL,NULL,'2024-05-09 19:34:59','2024-05-09 19:34:59','2024-05-09 19:34:59'),(25,1,1,1,'240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.jpg','image',NULL,1500,500,34633,NULL,NULL,NULL,'2024-05-18 19:10:01','2024-05-18 19:10:01','2024-05-18 19:10:01'),(28,1,1,1,'231128-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-jdmg29jirw2c1.jpg','image',NULL,1500,500,99932,NULL,NULL,NULL,'2024-05-18 19:14:12','2024-05-18 19:14:12','2024-05-18 19:14:12'),(33,1,1,1,'240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.png','image',NULL,2000,500,580296,NULL,NULL,NULL,'2024-05-18 19:43:41','2024-05-18 19:43:41','2024-05-18 19:43:41'),(54,1,1,1,'blue-orange-disc.jpg','image',NULL,5184,3456,1602515,NULL,NULL,NULL,'2024-06-22 13:41:24','2024-06-22 13:41:24','2024-06-22 13:41:24'),(58,1,1,1,'seoul.jpg','image',NULL,5184,3888,2034416,NULL,NULL,NULL,'2024-06-22 13:46:37','2024-06-22 13:46:37','2024-06-22 13:46:37'),(60,1,1,1,'pexels-ethan-brooke-1123775-10259522.jpg','image',NULL,3840,2283,702156,NULL,NULL,NULL,'2024-06-22 13:57:18','2024-06-22 13:57:18','2024-06-22 13:57:18'),(64,1,1,1,'impressum.jpg','image',NULL,3999,2667,940372,NULL,NULL,NULL,'2024-06-22 13:59:48','2024-06-22 13:59:48','2024-06-22 13:59:48'),(73,1,1,1,'clean-desk-background.jpg','image',NULL,6016,4016,774145,NULL,NULL,NULL,'2024-06-26 20:33:17','2024-06-26 20:31:55','2024-06-26 20:33:17'),(79,1,1,1,'clean-desk-background_2024-06-26-203313_moks.jpg','image',NULL,6016,4016,774121,NULL,0,0,'2024-06-26 20:33:13','2024-06-26 20:33:13','2024-06-26 20:33:13');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nodxgrdihmtalktqwnkxerboxoqvhawxodsd` (`groupId`),
  KEY `fk_beqrjwvmqbngzglwkokfuhjozcxqacuthlci` (`parentId`),
  CONSTRAINT `fk_beqrjwvmqbngzglwkokfuhjozcxqacuthlci` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dpzrwlcoyclouogjmgfrekizdozhhrlbyiis` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hqbenxhopoulkgnfpazdaiuxkctjxbxmdxmm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qshonaqishwohdlcoritevdmanfblmavrblw` (`name`),
  KEY `idx_fwivjzvowqzxknnropdlvyihudzgwueigmrp` (`handle`),
  KEY `idx_aqpnemmladvrrlricqgtvcmuzgurfjzstogv` (`structureId`),
  KEY `idx_vuelvpchthragnfjdekuzepgmrmjmxqmuwqt` (`fieldLayoutId`),
  KEY `idx_fnursssxnwouqqsorgxwxzkhninyputiovwb` (`dateDeleted`),
  CONSTRAINT `fk_euclxoxgughdcspiqrpixlxjildvvuyivqnq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hfmdfhsewcizlrneekjufwlldwklesqpqftj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iumdqvihygpnwkvkjhfmcdvqlberhyhcifml` (`groupId`,`siteId`),
  KEY `idx_jkwepajqmwmyhjukimrxebgwpfgfkpzvcyjn` (`siteId`),
  CONSTRAINT `fk_hchxyxmxnkrdmpplbmvzddslofqpgxmeebww` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_omgyqzgivkxkthrdwbofpgsukyvjpjowagbs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_pewuxvzerxrfvupdcfokzcbpgiqtitmtvddk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ssizjyinespgrsmurzlhtzvhwfbbtloyccph` (`siteId`),
  KEY `fk_fehyaiwleqxbrpidnyhtijazbiczztjdmjtv` (`userId`),
  CONSTRAINT `fk_fehyaiwleqxbrpidnyhtijazbiczztjdmjtv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_gpszrhwmpmovnkbkbphikkqyxneeprqndxll` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ssizjyinespgrsmurzlhtzvhwfbbtloyccph` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (15,1,'postDate','2024-05-18 18:36:53',0,1),(15,1,'slug','2024-05-18 18:36:51',0,1),(15,1,'title','2024-05-18 18:36:51',0,1),(15,1,'uri','2024-05-18 18:36:51',0,1),(21,1,'postDate','2024-05-18 18:42:52',0,1),(21,1,'slug','2024-05-18 18:42:29',0,1),(21,1,'title','2024-05-18 18:42:29',0,1),(21,1,'uri','2024-05-18 18:42:32',0,1),(35,1,'postDate','2024-06-08 13:18:21',0,1),(35,1,'slug','2024-06-08 13:17:34',0,1),(35,1,'title','2024-06-08 13:17:34',0,1),(35,1,'uri','2024-06-08 13:17:38',0,1),(44,1,'postDate','2024-06-09 17:04:05',0,1),(44,1,'slug','2024-06-09 17:03:33',0,1),(44,1,'title','2024-06-09 17:03:33',0,1),(44,1,'uri','2024-06-09 17:03:33',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_qbwzjirztacknibqmxwsfifdyhdmyhpjlfmk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_aybbbdmcrfddpawsmtafbygzwpsqoxwtxfro` (`siteId`),
  KEY `fk_joxhkouszbippgnkkgxovzpkshopfyeeqwal` (`fieldId`),
  KEY `fk_mpkvqvxvesbvgsznxigdqprhnkzezpipdvpu` (`userId`),
  CONSTRAINT `fk_aybbbdmcrfddpawsmtafbygzwpsqoxwtxfro` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_joxhkouszbippgnkkgxovzpkshopfyeeqwal` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lojbfnkvxsqlgqvfiyzmgourhutgumeszjrg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mpkvqvxvesbvgsznxigdqprhnkzezpipdvpu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'2024-05-09 19:35:33',0,1),(2,1,2,'2024-05-08 12:06:09',0,1),(15,1,1,'2024-05-18 19:12:28',0,1),(15,1,2,'2024-05-18 18:38:32',0,1),(15,1,5,'2024-05-18 19:12:28',0,1),(21,1,1,'2024-06-22 13:57:22',0,1),(21,1,2,'2024-05-18 18:42:40',0,1),(21,1,4,'2024-06-08 13:19:02',0,1),(21,1,5,'2024-06-22 13:46:41',0,1),(21,1,11,'2024-06-22 12:08:52',0,1),(32,1,5,'2024-05-18 19:15:36',0,1),(35,1,1,'2024-06-26 20:33:19',0,1),(35,1,2,'2024-06-08 13:17:56',0,1),(35,1,4,'2024-06-26 20:32:09',0,1),(35,1,5,'2024-06-22 13:59:50',0,1),(35,1,10,'2024-06-26 20:17:02',0,1),(44,1,2,'2024-06-09 17:03:36',0,1),(44,1,4,'2024-06-09 17:04:01',0,1),(44,1,5,'2024-06-09 17:03:41',0,1),(44,1,10,'2024-06-22 12:09:04',0,1),(44,1,11,'2024-06-22 12:09:04',0,1),(66,1,1,'2024-06-25 08:40:18',0,1),(66,1,2,'2024-06-25 08:40:18',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_infoText_rpcmnocd` text,
  `field_introduction_nqyxulez` text,
  `field_isform_iuldjxop` tinyint(1) DEFAULT NULL,
  `field_islocation_tufaleqa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ynqeqzgbpnxuqkginyhbgygmgsttnptwjdci` (`elementId`,`siteId`),
  KEY `idx_qcpdeosibzkainujnomvzvbsgmnvoskbzppv` (`siteId`),
  KEY `idx_sypulvjgydczrvkihvjixwaghptblmtilokw` (`title`),
  CONSTRAINT `fk_dhwbhczdpjinxotrmerxhaiiwrxauysnizvr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebjbfeijtvhacztmlolflulwaiuxpmxqhnvn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2024-04-26 12:08:10','2024-04-26 12:08:10','d906e322-35d3-44da-a84b-0ae68133fa46',NULL,NULL,NULL,NULL),(2,2,1,'homepage','2024-04-26 12:33:45','2024-05-09 19:35:32','d2827543-1c40-430a-aea0-edd8f5d773b6',NULL,NULL,NULL,NULL),(3,3,1,'homepage','2024-04-26 12:33:45','2024-04-26 12:33:45','0dbe07c3-176c-4db7-85fc-cd14b9de7cca',NULL,NULL,NULL,NULL),(4,4,1,'homepage','2024-04-26 12:41:01','2024-04-26 12:41:01','beca95e9-7e32-463f-bcc9-e454232498bc',NULL,NULL,NULL,NULL),(5,5,1,'homepage','2024-04-26 12:41:02','2024-04-26 12:41:02','5a636bd7-fc73-4bd6-984e-67990b1575aa',NULL,NULL,NULL,NULL),(6,6,1,'homepage','2024-05-08 11:50:39','2024-05-08 11:50:39','0d502cfe-8d9f-45d3-9f05-ecfb11c41e45',NULL,NULL,NULL,NULL),(7,7,1,'Nmixx dash backgroung','2024-05-08 11:56:20','2024-05-08 11:56:20','a64f5519-b10f-42da-a486-32a5acc08700',NULL,NULL,NULL,NULL),(9,9,1,'homepage','2024-05-08 12:05:23','2024-05-08 12:05:23','86662785-2eef-468b-8df7-c9efd573d28f',NULL,NULL,NULL,NULL),(10,10,1,'Spotify logo without text svg','2024-05-08 12:05:52','2024-06-26 20:39:46','103acdc2-d504-421d-ae6e-994ab2fcde1d',NULL,NULL,NULL,NULL),(11,11,1,'homepage','2024-05-08 12:06:09','2024-05-08 12:06:09','d9b0cf2e-2014-4596-850e-19b30fce941c',NULL,NULL,NULL,NULL),(12,12,1,'Dash full HD Quality','2024-05-09 19:34:59','2024-05-09 19:35:16','48e9a058-e663-41b2-b5e5-a260aaf1d352',NULL,NULL,NULL,NULL),(14,14,1,'homepage','2024-05-09 19:35:33','2024-05-09 19:35:33','064c8884-ce73-4029-b67c-77a0c70badf4',NULL,NULL,NULL,NULL),(15,15,1,'About','2024-05-18 18:36:47','2024-05-18 19:12:28','9981acc0-9c4c-4430-becb-af46e9f01bf5',NULL,NULL,NULL,NULL),(16,16,1,'About','2024-05-18 18:36:53','2024-05-18 18:36:53','78c41bb7-7fa0-4772-845e-1c819517d60b',NULL,NULL,NULL,NULL),(18,18,1,'About','2024-05-18 18:37:39','2024-05-18 18:37:39','6a8cf570-cce6-41a0-9ff8-9611bba7164f',NULL,NULL,NULL,NULL),(20,20,1,'About','2024-05-18 18:38:32','2024-05-18 18:38:32','926d3f9b-01a0-4a44-af43-d55ae72532b1',NULL,NULL,NULL,NULL),(21,21,1,'Location','2024-05-18 18:42:17','2024-06-22 13:57:22','3145ca25-e53c-40c5-980a-22ef9f27f5e2',NULL,'Hier finden Sie uns',0,1),(22,22,1,'Location','2024-05-18 18:42:52','2024-05-18 18:42:52','06276a40-b2ee-42a6-bfb7-bb24834b4ae6',NULL,NULL,NULL,NULL),(25,25,1,'240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1','2024-05-18 19:10:01','2024-05-18 19:10:01','23880adc-9da9-4ed1-806f-47447637bead',NULL,NULL,NULL,NULL),(26,26,1,'Location','2024-05-18 19:10:15','2024-05-18 19:10:15','db020b36-a0cf-4e16-a548-ce04182e1ac3',NULL,NULL,NULL,NULL),(27,27,1,'About','2024-05-18 19:12:28','2024-05-18 19:12:28','b5d1804c-d2b0-4c47-908d-0197e22a494a',NULL,NULL,NULL,NULL),(28,28,1,'231128 nmixx 2nd ep fe3o4 break new banner logo v0 jdmg29jirw2c1','2024-05-18 19:14:12','2024-05-18 19:14:12','f3e20207-e53f-4249-b4ef-02a7adf3a1ed',NULL,NULL,NULL,NULL),(30,30,1,'Location','2024-05-18 19:14:16','2024-05-18 19:14:16','7f496c76-fed7-45f0-8bbc-c093b0706671',NULL,NULL,NULL,NULL),(32,32,1,'About','2024-05-18 19:15:36','2024-05-18 19:15:36','3cef556c-1638-4560-9f2e-a79f2ac9ae7d',NULL,NULL,NULL,NULL),(33,33,1,'240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1','2024-05-18 19:43:40','2024-05-18 19:43:40','68e302e2-710f-4973-bad6-77614f65ba40',NULL,NULL,NULL,NULL),(34,34,1,'Location','2024-05-18 19:43:49','2024-05-18 19:43:49','96428e9a-dbcc-409d-aba0-e35737220855',NULL,NULL,NULL,NULL),(35,35,1,'Impressum','2024-06-08 13:17:29','2024-06-26 20:33:19','e67da379-627d-4d06-910c-0fca42eebef6',NULL,'Impressum',1,0),(36,36,1,'Impressum','2024-06-08 13:18:21','2024-06-08 13:18:21','731b6ed6-c3a0-4521-8113-267aac7df082',NULL,'Nur Sigmas haben ein Impressum',NULL,NULL),(38,38,1,'Location','2024-06-08 13:19:02','2024-06-08 13:19:02','96b5e9ca-b6cb-4b5a-8e60-0a41230c1480',NULL,'Hier finden Sie uns',NULL,NULL),(39,39,1,'Location','2024-06-08 14:18:03','2024-06-08 14:18:03','11a83fb8-25c8-4134-88d9-bf762b3a7a4b',NULL,'Hier finden Sie uns',NULL,NULL),(41,41,1,'Impressum','2024-06-09 13:58:39','2024-06-09 13:58:39','31324e7b-218a-4c78-9087-9bc02b5fef9b',NULL,'Nur Sigmas haben ein Impressum',NULL,NULL),(43,43,1,'Location','2024-06-09 14:00:45','2024-06-09 14:00:45','e4be31ad-a54d-4af5-8469-12d2400eb7f8',NULL,'Hier finden Sie uns',NULL,NULL),(44,44,1,'Kontakt','2024-06-09 17:03:29','2024-06-22 12:09:04','41196345-4022-40b4-b884-a0cb69a91891',NULL,'Schreibe uns eine E-Mail',1,0),(45,45,1,'Kontakt','2024-06-09 17:04:05','2024-06-09 17:04:05','f482eb3f-67cc-4567-8f3c-f3e20b424eb9',NULL,'Schreibe uns eine E-Mail',NULL,NULL),(47,47,1,'Kontakt','2024-06-09 17:04:12','2024-06-09 17:04:12','fb09416d-4b68-4211-8caa-6f5f6fbea190',NULL,'Schreibe uns eine E-Mail',NULL,NULL),(49,49,1,'Impressum','2024-06-09 17:05:01','2024-06-09 17:05:01','a3fca7c3-6f18-4b99-9399-d9a89cf8c3c6',NULL,'Nur Sigmas haben ein Impressum',NULL,NULL),(51,51,1,'Location','2024-06-22 12:08:53','2024-06-22 12:08:53','a252a72a-f442-4f82-8402-3562cd69be05',NULL,'Hier finden Sie uns',0,1),(53,53,1,'Kontakt','2024-06-22 12:09:04','2024-06-22 12:09:04','e7872b82-c672-4ac7-8494-335100b507a1',NULL,'Schreibe uns eine E-Mail',1,0),(54,54,1,'Blue orange disc','2024-06-22 13:41:24','2024-06-22 13:41:24','02f71b0b-57ce-450e-94e8-d8f1070e86b5',NULL,NULL,NULL,NULL),(56,56,1,'Location','2024-06-22 13:41:32','2024-06-22 13:41:32','357f553e-6ba9-4900-9019-bdff89f48dbb',NULL,'Hier finden Sie uns',0,1),(58,58,1,'Seoul','2024-06-22 13:46:36','2024-06-22 13:46:36','932eaf15-3f1a-47a4-94b5-063d56e3d8a1',NULL,NULL,NULL,NULL),(59,59,1,'Location','2024-06-22 13:46:41','2024-06-22 13:46:41','779d84d3-d4e2-4c52-937c-50e34fe7f6a3',NULL,'Hier finden Sie uns',0,1),(60,60,1,'Pexels ethan brooke 1123775 10259522','2024-06-22 13:57:18','2024-06-22 13:57:18','debb98a4-0d35-4ede-8e0a-b9b2c50d57b5',NULL,NULL,NULL,NULL),(62,62,1,'Location','2024-06-22 13:57:22','2024-06-22 13:57:22','dfb0601e-c33b-4b03-85ae-e735a44d1c7f',NULL,'Hier finden Sie uns',0,1),(64,64,1,'Impressum','2024-06-22 13:59:48','2024-06-22 13:59:48','89e9f765-ed68-4b2b-885d-06a79f4b7bdb',NULL,NULL,NULL,NULL),(65,65,1,'Impressum','2024-06-22 13:59:50','2024-06-22 13:59:50','049dc8dc-2a79-447e-8acd-d59cc80ab800',NULL,'Nur Sigmas haben ein Impressum',0,0),(66,66,1,'Album','2024-06-25 08:39:02','2024-06-25 08:40:18','f2f8a916-8426-4841-a9be-d0d1d1a494f3',NULL,NULL,NULL,NULL),(67,67,1,'Album','2024-06-25 08:39:02','2024-06-25 08:39:02','a1a461b1-4688-4d82-bf20-9d841f99688c',NULL,NULL,NULL,NULL),(68,68,1,'Album','2024-06-25 08:39:53','2024-06-25 08:39:53','de64177f-8135-4275-b691-209d9ec59b3c',NULL,NULL,NULL,NULL),(70,70,1,'Album','2024-06-25 08:40:18','2024-06-25 08:40:18','bc86b33a-a2dd-4612-9949-b36f7c19ccc6',NULL,NULL,NULL,NULL),(72,72,1,'Impressum','2024-06-26 20:17:02','2024-06-26 20:17:02','886e1c50-5afb-4501-9eaa-235d96c06c10',NULL,'Nur Sigmas haben ein Impressum',1,0),(73,73,1,'Clean desk background','2024-06-26 20:31:54','2024-06-26 20:33:16','dcbed1f9-7940-4ec1-b651-ad0a77eb72b5',NULL,NULL,NULL,NULL),(75,75,1,'Impressum','2024-06-26 20:31:58','2024-06-26 20:31:58','49e70d07-b647-4e20-811a-51316e0afe09',NULL,'Nur Sigmas haben ein Impressum',1,0),(77,77,1,'Impressum','2024-06-26 20:32:09','2024-06-26 20:32:09','4cfa5b05-aaa8-45f8-a9ad-5361a7677533',NULL,'Impressum',1,0),(79,79,1,'Clean desk background','2024-06-26 20:33:13','2024-06-26 20:33:13','36bf53dc-52e7-4012-86f2-59f99577138b',NULL,NULL,NULL,NULL),(80,80,1,'Impressum','2024-06-26 20:33:19','2024-06-26 20:33:19','e0dd5061-4225-4df2-811a-04b6ba36b8a7',NULL,'Impressum',1,0);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wrxyodhpqcthlxygcdtojzapeplzpmktabkn` (`userId`),
  CONSTRAINT `fk_wrxyodhpqcthlxygcdtojzapeplzpmktabkn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yudchyodbktasbcxdfubsbcfnfvmfvlvmpqr` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_unxuztrlwiofohuzvyteqcraqellhtljsaiu` (`creatorId`,`provisional`),
  KEY `idx_scjpgkmeurilmbqtkynnmpxtqkgprpvokdhw` (`saved`),
  KEY `fk_rwojbosbbtwnbkhlmmhbhawdduajxbqvbqnd` (`canonicalId`),
  CONSTRAINT `fk_rwojbosbbtwnbkhlmmhbhawdduajxbqvbqnd` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfmoxzfpvocmsyjypkedjurutwezzuxkbcjv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (11,15,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_wpkqlxdonuruhythybrcjbgsuplaidkcseax` (`elementId`,`timestamp`,`userId`),
  KEY `fk_mgjoqfkdvraylnvarrthwolyhrktilmmbpmn` (`userId`),
  KEY `fk_azuffqqkrgamabyomsmuxxvtgwwbkvpxoglv` (`siteId`),
  KEY `fk_zdsobqcrnlzlnojpqwaqkftzfdykezhvpeej` (`draftId`),
  CONSTRAINT `fk_azuffqqkrgamabyomsmuxxvtgwwbkvpxoglv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ijtatixrqbtczwsbcwkfgribaswsqsexcgwr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mgjoqfkdvraylnvarrthwolyhrktilmmbpmn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdsobqcrnlzlnojpqwaqkftzfdykezhvpeej` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-05-09 19:35:28'),(2,1,1,NULL,'save','2024-05-09 19:35:33'),(10,1,1,NULL,'save','2024-06-26 20:39:46'),(12,1,1,NULL,'save','2024-05-09 19:35:16'),(15,1,1,NULL,'edit','2024-05-18 19:15:36'),(15,1,1,NULL,'save','2024-05-18 19:12:28'),(21,1,1,NULL,'edit','2024-06-22 13:57:19'),(21,1,1,NULL,'save','2024-06-22 13:57:22'),(35,1,1,NULL,'edit','2024-06-26 20:33:17'),(35,1,1,NULL,'save','2024-06-26 20:33:19'),(44,1,1,NULL,'edit','2024-06-22 12:09:03'),(44,1,1,NULL,'save','2024-06-22 12:09:04'),(66,1,1,NULL,'edit','2024-06-25 08:40:16'),(66,1,1,NULL,'save','2024-06-25 08:40:19');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yoaipnibxeyekkjgonchvfjlemrownggberr` (`dateDeleted`),
  KEY `idx_bhfqioxruvgktmxeswuiolccmhbnzewczfbo` (`fieldLayoutId`),
  KEY `idx_shuebwidezgsbgtqcenuaysglyfdragwtdzj` (`type`),
  KEY `idx_acpyoafpyyyqhxkmlnkdwhhycvggbooccxvx` (`enabled`),
  KEY `idx_yuzayjilxfiwaoiwwyajuxzmbukmabupgscl` (`canonicalId`),
  KEY `idx_isyosndwqpmlhhdkzfkpscgneshhweguxcvw` (`archived`,`dateCreated`),
  KEY `idx_gwomyormdvjowzujldwhcpsqquvqyxleovto` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_wzdkluonyderyoqtdhqgdvfwzujraxzxsgra` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_ekcgzxqqehzyznegenhbwgbmzhycuksohwwc` (`draftId`),
  KEY `fk_lxwewpentjkkhjhcmjuolnfrocjarbcnjzkw` (`revisionId`),
  CONSTRAINT `fk_ekcgzxqqehzyznegenhbwgbmzhycuksohwwc` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jiomnmdnuziozbmyykpzcclrldrcudhglkqp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lxwewpentjkkhjhcmjuolnfrocjarbcnjzkw` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pfmwttmiczkfksjhqxpgnxyorfbedzcukonf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,NULL,'19f0aa9a-9f03-4a80-b0dd-95b7ae181112'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:33:45','2024-05-09 19:35:32',NULL,NULL,'eec88c3d-2da5-4636-8b48-51acb096583a'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,NULL,'af727021-4030-4a89-a203-57821fc474fa'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:41:01','2024-04-26 12:41:01',NULL,NULL,'b165256c-657a-42e5-85e3-515b8a45e979'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:41:02','2024-04-26 12:41:02',NULL,NULL,'9dc63517-d4c3-46d3-b4ea-53a44eb16bc3'),(6,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2024-05-08 11:50:39','2024-05-08 11:50:39',NULL,NULL,'7a3c3b26-e1dc-49b6-8937-de4d5b332968'),(7,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-05-08 11:56:20','2024-05-08 11:56:20',NULL,NULL,'abdd68b1-479a-441e-9070-e507cf60dbe2'),(9,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2024-05-08 12:05:23','2024-05-08 12:05:23',NULL,NULL,'a8179b25-a37c-4242-bc92-dacff1451b61'),(10,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-05-08 12:05:52','2024-06-26 20:39:46',NULL,NULL,'70f5eadd-1a53-42d1-82c7-eb0fc8838f17'),(11,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2024-05-08 12:06:09','2024-05-08 12:06:09',NULL,NULL,'cb9d3588-7b05-4350-b38c-b4d45b4130d1'),(12,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-05-09 19:34:59','2024-05-09 19:35:16',NULL,NULL,'2efc65ed-6302-46ec-8127-b23d47390bdc'),(14,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2024-05-09 19:35:32','2024-05-09 19:35:33',NULL,NULL,'c6050957-2849-4841-8bf1-c0309dfad2d1'),(15,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:36:47','2024-05-18 19:12:28',NULL,NULL,'f922c1f4-1b3f-4ea9-bfe4-a68ee9a92979'),(16,15,NULL,8,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:36:53','2024-05-18 18:36:53',NULL,NULL,'142cb604-2d84-4fed-bee3-e679956db152'),(18,15,NULL,9,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:37:39','2024-05-18 18:37:39',NULL,NULL,'6e479add-ca06-4943-9774-f913fc8720cb'),(20,15,NULL,10,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:38:32','2024-05-18 18:38:32',NULL,NULL,'7ec55be9-01bd-4485-92a5-374333097941'),(21,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:42:17','2024-06-22 13:57:22',NULL,NULL,'b0f1442c-ae84-42b6-970c-9369ce1720cd'),(22,21,NULL,11,4,'craft\\elements\\Entry',1,0,'2024-05-18 18:42:52','2024-05-18 18:42:52',NULL,NULL,'9494fecd-e662-4325-812d-2b6a7e3839cf'),(25,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-05-18 19:10:01','2024-05-18 19:10:01',NULL,NULL,'faf31bfc-ae63-4b3b-88c2-3fe8d7ae0a0b'),(26,21,NULL,12,4,'craft\\elements\\Entry',1,0,'2024-05-18 19:10:15','2024-05-18 19:10:15',NULL,NULL,'a338d0fa-6ba2-4a9a-9ba7-73f0b959fff3'),(27,15,NULL,13,4,'craft\\elements\\Entry',1,0,'2024-05-18 19:12:28','2024-05-18 19:12:28',NULL,NULL,'42402504-2998-4ad9-ab95-573769c8c9f9'),(28,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-05-18 19:14:12','2024-05-18 19:14:12',NULL,NULL,'208f0f5c-36ba-4e0d-9111-d7c8b307fbba'),(30,21,NULL,14,4,'craft\\elements\\Entry',1,0,'2024-05-18 19:14:16','2024-05-18 19:14:16',NULL,NULL,'ed856097-c5db-49e9-a73f-8256dbee97dd'),(32,15,11,NULL,4,'craft\\elements\\Entry',1,0,'2024-05-18 19:15:36','2024-05-18 19:15:36',NULL,NULL,'6d408cd3-ced0-45bd-aacd-7db763773dcc'),(33,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-05-18 19:43:40','2024-05-18 19:43:40',NULL,NULL,'30cc4465-49cb-43df-9d2a-14522affbd29'),(34,21,NULL,15,4,'craft\\elements\\Entry',1,0,'2024-05-18 19:43:49','2024-05-18 19:43:49',NULL,NULL,'c00ebf87-2bcf-483e-9ed6-70a6644f096f'),(35,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-06-08 13:17:29','2024-06-26 20:33:19',NULL,NULL,'b8b02945-7e5e-4c69-9f78-66ba4c4f024b'),(36,35,NULL,16,4,'craft\\elements\\Entry',1,0,'2024-06-08 13:18:21','2024-06-08 13:18:21',NULL,NULL,'c3e7aaa8-37aa-463b-b427-8976c17f4e07'),(38,21,NULL,17,4,'craft\\elements\\Entry',1,0,'2024-06-08 13:19:02','2024-06-08 13:19:02',NULL,NULL,'8a3bd380-1c05-49f4-8433-a7acd488afac'),(39,21,NULL,18,4,'craft\\elements\\Entry',1,0,'2024-06-08 14:18:03','2024-06-08 14:18:03',NULL,NULL,'db686376-9a1c-4cd0-8860-5b9fbad7e470'),(41,35,NULL,19,4,'craft\\elements\\Entry',1,0,'2024-06-09 13:58:39','2024-06-09 13:58:39',NULL,NULL,'35703014-8faa-45d2-bfb1-8829e000247a'),(43,21,NULL,20,4,'craft\\elements\\Entry',1,0,'2024-06-09 14:00:45','2024-06-09 14:00:45',NULL,NULL,'f5226046-e1f5-4d75-9876-9feaab5d6f46'),(44,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-06-09 17:03:29','2024-06-22 12:09:04',NULL,NULL,'30163961-fc03-48d1-be10-6c26531db324'),(45,44,NULL,21,4,'craft\\elements\\Entry',1,0,'2024-06-09 17:04:05','2024-06-09 17:04:05',NULL,NULL,'33ae765f-b0f0-44b3-8fd3-50bb701eda23'),(47,44,NULL,22,4,'craft\\elements\\Entry',1,0,'2024-06-09 17:04:12','2024-06-09 17:04:12',NULL,NULL,'447d06a6-d410-4091-bc70-7f539767f591'),(49,35,NULL,23,4,'craft\\elements\\Entry',1,0,'2024-06-09 17:05:01','2024-06-09 17:05:01',NULL,NULL,'49055fa3-9cce-43bc-bfe0-99685cf63c54'),(51,21,NULL,24,4,'craft\\elements\\Entry',1,0,'2024-06-22 12:08:52','2024-06-22 12:08:53',NULL,NULL,'39aa4110-2e24-4c72-82b7-34144464dc60'),(53,44,NULL,25,4,'craft\\elements\\Entry',1,0,'2024-06-22 12:09:04','2024-06-22 12:09:04',NULL,NULL,'76dca377-fa31-437f-bb25-41d52a9c46eb'),(54,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-22 13:41:24','2024-06-22 13:41:24',NULL,NULL,'992800d5-f845-45d3-851d-0cdc8c174037'),(56,21,NULL,26,4,'craft\\elements\\Entry',1,0,'2024-06-22 13:41:32','2024-06-22 13:41:32',NULL,NULL,'0a13ac39-9edd-442d-9a15-67c18b0a1c0c'),(58,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-22 13:46:36','2024-06-22 13:46:36',NULL,NULL,'0242bd06-0a0e-4838-b966-7b60f9cc4ebd'),(59,21,NULL,27,4,'craft\\elements\\Entry',1,0,'2024-06-22 13:46:41','2024-06-22 13:46:41',NULL,NULL,'22c93050-8504-4edb-9ef0-ceeec6fea4f1'),(60,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-22 13:57:18','2024-06-22 13:57:18',NULL,NULL,'ff0495c9-3c8e-45d6-9bd4-1ff8b5dbd89d'),(62,21,NULL,28,4,'craft\\elements\\Entry',1,0,'2024-06-22 13:57:22','2024-06-22 13:57:22',NULL,NULL,'678a151c-aa1a-47a9-80f7-4be191e92790'),(64,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-22 13:59:48','2024-06-22 13:59:48',NULL,NULL,'5b8d918b-5296-46d7-bebd-7de9d9a87a92'),(65,35,NULL,29,4,'craft\\elements\\Entry',1,0,'2024-06-22 13:59:50','2024-06-22 13:59:50',NULL,NULL,'ceedeb7a-b03b-44d3-b741-61a91b6b2cdd'),(66,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-06-25 08:39:02','2024-06-25 08:40:18',NULL,NULL,'d2fcc20f-5ff6-4ed3-a401-b141ebccf8df'),(67,66,NULL,30,6,'craft\\elements\\Entry',1,0,'2024-06-25 08:39:02','2024-06-25 08:39:02',NULL,NULL,'35576818-1487-42ee-ab23-8e70582f1ec3'),(68,66,NULL,31,6,'craft\\elements\\Entry',1,0,'2024-06-25 08:39:53','2024-06-25 08:39:53',NULL,NULL,'e8ed1f02-fe5a-4ec4-a10a-e23370ef9d84'),(70,66,NULL,32,6,'craft\\elements\\Entry',1,0,'2024-06-25 08:40:18','2024-06-25 08:40:18',NULL,NULL,'1faab40e-d6e4-4a93-876d-5d6a6a53ca9e'),(72,35,NULL,33,4,'craft\\elements\\Entry',1,0,'2024-06-26 20:17:02','2024-06-26 20:17:02',NULL,NULL,'744fd33d-af64-4ac4-b664-dfe54aa56928'),(73,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-26 20:31:54','2024-06-26 20:33:16',NULL,NULL,'03686415-8b96-4c58-9d0e-11ac8189c5d6'),(75,35,NULL,34,4,'craft\\elements\\Entry',1,0,'2024-06-26 20:31:58','2024-06-26 20:31:58',NULL,NULL,'695c867d-7ea6-4eee-a7c4-3316080c81c1'),(77,35,NULL,35,4,'craft\\elements\\Entry',1,0,'2024-06-26 20:32:09','2024-06-26 20:32:09',NULL,NULL,'50e4b5e8-f445-4463-92fa-a1fd4b11a4dc'),(79,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-06-26 20:33:13','2024-06-26 20:33:13',NULL,'2024-06-26 20:33:17','117a91db-9e7a-47a4-b040-8a568157c5ba'),(80,35,NULL,36,4,'craft\\elements\\Entry',1,0,'2024-06-26 20:33:19','2024-06-26 20:33:19',NULL,NULL,'b3daf829-515a-410a-856e-b1289e2b2716');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ivuhkrzzlbwqqqijsqjggdbhjtetexgwrxnq` (`elementId`,`siteId`),
  KEY `idx_kbgudfwcxevedmahsffmvijrbrnoezqnlmac` (`siteId`),
  KEY `idx_aaanmanyjjcrmileofzaevbhplbqnhnavcsx` (`slug`,`siteId`),
  KEY `idx_xzyztpbbmrkeeexwdwequocigyrzxyzmlmyo` (`enabled`),
  KEY `idx_ldsrporeodejnfhazposcprpkhgovtyhvvrx` (`uri`,`siteId`),
  CONSTRAINT `fk_ghaznsjqsodtwutdxfmngiyzcdoidpnofzom` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hpeflrdlmxsxbctxqbfdbhepkxmmilochbzx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2024-04-26 12:08:10','2024-04-26 12:08:10','cc75f60f-0049-41f5-87cf-38132f330923'),(2,2,1,'homepage','__home__',1,'2024-04-26 12:33:45','2024-04-26 12:33:45','31aa09fd-b208-4d94-8c35-24f9b9d5b2cd'),(3,3,1,'homepage','__home__',1,'2024-04-26 12:33:45','2024-04-26 12:33:45','cf73caf3-145f-41db-8561-12cfd1077e8a'),(4,4,1,'homepage','__home__',1,'2024-04-26 12:41:01','2024-04-26 12:41:01','46f671f6-9977-4a49-bd26-ce7035f1e839'),(5,5,1,'homepage','__home__',1,'2024-04-26 12:41:02','2024-04-26 12:41:02','a3e55185-0318-454a-8769-fca35e9b4b2b'),(6,6,1,'homepage','__home__',1,'2024-05-08 11:50:39','2024-05-08 11:50:39','bc3f5884-85e0-4ddc-9c40-180eb90d9d8f'),(7,7,1,NULL,NULL,1,'2024-05-08 11:56:20','2024-05-08 11:56:20','28a3461a-4341-4be8-b0d0-7ca1669ec485'),(9,9,1,'homepage','__home__',1,'2024-05-08 12:05:23','2024-05-08 12:05:23','e109c2e6-e51c-484c-9fc7-4c092d2303ad'),(10,10,1,NULL,NULL,1,'2024-05-08 12:05:52','2024-05-08 12:05:52','0796a183-f0b4-4425-92d5-6d2d21aa8222'),(11,11,1,'homepage','__home__',1,'2024-05-08 12:06:09','2024-05-08 12:06:09','ea817d08-6cbf-4ceb-b729-ee4688d40306'),(12,12,1,NULL,NULL,1,'2024-05-09 19:34:59','2024-05-09 19:34:59','587ec64e-230d-43d6-92bd-0cdc3e8a04ae'),(14,14,1,'homepage','__home__',1,'2024-05-09 19:35:33','2024-05-09 19:35:33','74cc8ba1-1349-4492-86f5-a280ea8d11a9'),(15,15,1,'about','about',1,'2024-05-18 18:36:47','2024-05-18 18:36:51','86bcbca5-311e-48c0-9470-256232c1a2b7'),(16,16,1,'about','about',1,'2024-05-18 18:36:53','2024-05-18 18:36:53','568ee7d6-5176-4f63-b282-98bfec3ba8e0'),(18,18,1,'about','about',1,'2024-05-18 18:37:39','2024-05-18 18:37:39','e9340b53-6d0c-4c31-909e-cdce17dfee68'),(20,20,1,'about','about',1,'2024-05-18 18:38:32','2024-05-18 18:38:32','4cfd6e19-6963-4e6e-aed9-505850d54f39'),(21,21,1,'location','about/location',1,'2024-05-18 18:42:17','2024-05-18 19:12:29','0969e3e8-ae90-443a-a993-9a4eb6150d98'),(22,22,1,'location','about/location',1,'2024-05-18 18:42:52','2024-05-18 18:42:52','20883d9f-28fa-42b0-aedc-498900607bcb'),(25,25,1,NULL,NULL,1,'2024-05-18 19:10:01','2024-05-18 19:10:01','36789566-7f0c-4d49-a0b5-e7173f3280e6'),(26,26,1,'location','about/location',1,'2024-05-18 19:10:15','2024-05-18 19:10:15','001271b7-4d1e-4e55-86ad-87452d34507f'),(27,27,1,'about','about',1,'2024-05-18 19:12:28','2024-05-18 19:12:28','55e6a520-94fa-42d5-99e8-489e7aea41d3'),(28,28,1,NULL,NULL,1,'2024-05-18 19:14:12','2024-05-18 19:14:12','7babb96a-25d0-49cb-a5de-fefc03c94d0e'),(30,30,1,'location','about/location',1,'2024-05-18 19:14:16','2024-05-18 19:14:16','651aa969-66b4-42ef-a566-cb5e6bd5bd37'),(32,32,1,'about','about',1,'2024-05-18 19:15:36','2024-05-18 19:15:36','67d95e02-dae5-4470-9985-c70a4a201cd6'),(33,33,1,NULL,NULL,1,'2024-05-18 19:43:40','2024-05-18 19:43:40','4135570c-5001-447d-b5bb-75520ac5a941'),(34,34,1,'location','about/location',1,'2024-05-18 19:43:49','2024-05-18 19:43:49','fc09200b-9f4f-44a5-8b65-fba5102df663'),(35,35,1,'impressum','about/impressum',1,'2024-06-08 13:17:29','2024-06-08 13:18:22','49442e76-e9f3-4894-b837-206a1f1ae547'),(36,36,1,'impressum','about/impressum',1,'2024-06-08 13:18:21','2024-06-08 13:18:21','2fb5a988-6995-4a24-ae99-62cfbf5fdabf'),(38,38,1,'location','about/location',1,'2024-06-08 13:19:02','2024-06-08 13:19:02','9a66d447-96d0-4a4a-a582-31cac0f13a7c'),(39,39,1,'location','about/location',1,'2024-06-08 14:18:03','2024-06-08 14:18:03','d07cba5f-3a84-4c3f-9396-077ba4d75a56'),(41,41,1,'impressum','about/impressum',1,'2024-06-09 13:58:39','2024-06-09 13:58:39','4f93bac9-2f79-4473-a6b5-51266848d61b'),(43,43,1,'location','about/location',1,'2024-06-09 14:00:45','2024-06-09 14:00:45','31ab9047-3540-410e-9b0b-565ba5cb19da'),(44,44,1,'kontakt','about/kontakt',1,'2024-06-09 17:03:29','2024-06-09 17:04:13','6f687bfa-280f-4b87-91b5-51480c1b7e4c'),(45,45,1,'kontakt','kontakt',1,'2024-06-09 17:04:05','2024-06-09 17:04:05','1b57cd1f-eaf7-4885-9055-ae7be0ffcd3f'),(47,47,1,'kontakt','about/kontakt',1,'2024-06-09 17:04:12','2024-06-09 17:04:12','a612a4d5-a7f4-4e79-a051-96f6f49e42fe'),(49,49,1,'impressum','about/impressum',1,'2024-06-09 17:05:01','2024-06-09 17:05:01','830bfaaf-8bae-449a-8c1c-efa9ecaf18c6'),(51,51,1,'location','about/location',1,'2024-06-22 12:08:53','2024-06-22 12:08:53','b85ef689-3c15-4409-bcdf-327bc69941c8'),(53,53,1,'kontakt','about/kontakt',1,'2024-06-22 12:09:04','2024-06-22 12:09:04','46de9ecf-d827-4b4c-a179-e929e7dd3aa4'),(54,54,1,NULL,NULL,1,'2024-06-22 13:41:24','2024-06-22 13:41:24','6965f83a-68e4-4051-b21f-2dbb79bc47d3'),(56,56,1,'location','about/location',1,'2024-06-22 13:41:32','2024-06-22 13:41:32','4b9460d8-2148-4604-bb8d-5b64f7151442'),(58,58,1,NULL,NULL,1,'2024-06-22 13:46:36','2024-06-22 13:46:36','91cb6d5b-45fe-4f16-a2e3-e2447a67e8d3'),(59,59,1,'location','about/location',1,'2024-06-22 13:46:41','2024-06-22 13:46:41','892c55eb-771c-48fd-b944-f16411d3b2da'),(60,60,1,NULL,NULL,1,'2024-06-22 13:57:18','2024-06-22 13:57:18','a7b1f428-e424-494f-83cd-b6796dd34bf8'),(62,62,1,'location','about/location',1,'2024-06-22 13:57:22','2024-06-22 13:57:22','38e748ad-6429-4ba9-8fb6-20dc8315db84'),(64,64,1,NULL,NULL,1,'2024-06-22 13:59:48','2024-06-22 13:59:48','9d5b8222-2932-4ec2-97fc-55e05c591523'),(65,65,1,'impressum','about/impressum',1,'2024-06-22 13:59:50','2024-06-22 13:59:50','58fcffe6-cc05-4ef2-85a5-e96db40c4945'),(66,66,1,'album','album',1,'2024-06-25 08:39:02','2024-06-25 08:39:02','1781889c-fea1-4701-961c-c8f32ca47faf'),(67,67,1,'album','album',1,'2024-06-25 08:39:02','2024-06-25 08:39:02','6c536df3-1ae6-4835-9126-a05e4c9a1b86'),(68,68,1,'album','album',1,'2024-06-25 08:39:53','2024-06-25 08:39:53','44ef66e3-db1d-4b9e-b2f5-584b8be7c893'),(70,70,1,'album','album',1,'2024-06-25 08:40:18','2024-06-25 08:40:18','dedb4e75-8c8c-4218-be20-61233215acfa'),(72,72,1,'impressum','about/impressum',1,'2024-06-26 20:17:02','2024-06-26 20:17:02','9e54466d-8232-4a8d-b8fe-ec8896dcc52f'),(73,73,1,NULL,NULL,1,'2024-06-26 20:31:54','2024-06-26 20:31:54','e6b4de73-2e89-41d5-9308-fe6b1e093458'),(75,75,1,'impressum','about/impressum',1,'2024-06-26 20:31:58','2024-06-26 20:31:58','a4914805-8e1e-469d-b40a-0efd4e3471a4'),(77,77,1,'impressum','about/impressum',1,'2024-06-26 20:32:09','2024-06-26 20:32:09','5c4a3dbb-01a5-4dc4-a8f7-7c693cbef83e'),(79,79,1,NULL,NULL,1,'2024-06-26 20:33:13','2024-06-26 20:33:13','395d41e4-8849-4a80-80e2-a796cb89e830'),(80,80,1,'impressum','about/impressum',1,'2024-06-26 20:33:19','2024-06-26 20:33:19','0edc1128-66c4-4d49-bacf-2f15ac701e93');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msuqnugoqhvqdevvobpneyygwbgudknofhcw` (`postDate`),
  KEY `idx_yuzcvckzfzjdqxcpjobbcxycwhykpqgmcdom` (`expiryDate`),
  KEY `idx_rkowgffbidgkhabvzyfvsvxpuibgqownieoh` (`authorId`),
  KEY `idx_dexnboydrqigknkjhcigsjrbewfuysbaomgz` (`sectionId`),
  KEY `idx_wcostitsyuanvbvedrzeagkpicmlqvkjglrs` (`typeId`),
  KEY `fk_snltyoarggultqmsaotrgtbumsaulfzmvjmu` (`parentId`),
  CONSTRAINT `fk_fczpgkxlmhotuuxwyibazoknyvqctoaanwwg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gkhhgnffqxaorgpixejixtmxvhucergqpjox` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kqtuirprcatofzdtkvsligltxcbrlqwycgci` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ryvjjdbfhrwauavcaklipglmpssrhyaaewhc` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snltyoarggultqmsaotrgtbumsaulfzmvjmu` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:33:45','2024-04-26 12:33:45'),(3,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:33:45','2024-04-26 12:33:45'),(4,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:41:01','2024-04-26 12:41:01'),(5,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:41:02','2024-04-26 12:41:02'),(6,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-05-08 11:50:39','2024-05-08 11:50:39'),(9,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-05-08 12:05:23','2024-05-08 12:05:23'),(11,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-05-08 12:06:09','2024-05-08 12:06:09'),(14,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-05-09 19:35:33','2024-05-09 19:35:33'),(15,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 18:36:47','2024-05-18 18:36:53'),(16,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 18:36:53','2024-05-18 18:36:53'),(18,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 18:37:39','2024-05-18 18:37:39'),(20,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 18:38:32','2024-05-18 18:38:32'),(21,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-05-18 18:42:17','2024-05-18 18:42:52'),(22,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-05-18 18:42:52','2024-05-18 18:42:52'),(26,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-05-18 19:10:15','2024-05-18 19:10:15'),(27,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 19:12:28','2024-05-18 19:12:28'),(30,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-05-18 19:14:16','2024-05-18 19:14:16'),(32,2,NULL,2,1,'2024-05-18 18:36:00',NULL,NULL,'2024-05-18 19:15:36','2024-05-18 19:15:36'),(34,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-05-18 19:43:49','2024-05-18 19:43:49'),(35,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-08 13:17:29','2024-06-08 13:18:21'),(36,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-08 13:18:21','2024-06-08 13:18:21'),(38,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-08 13:19:02','2024-06-08 13:19:02'),(39,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-08 14:18:03','2024-06-08 14:18:03'),(41,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-09 13:58:39','2024-06-09 13:58:39'),(43,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-09 14:00:45','2024-06-09 14:00:45'),(44,2,NULL,2,1,'2024-06-09 17:04:00',NULL,NULL,'2024-06-09 17:03:29','2024-06-09 17:04:05'),(45,2,NULL,2,1,'2024-06-09 17:04:00',NULL,NULL,'2024-06-09 17:04:05','2024-06-09 17:04:05'),(47,2,NULL,2,1,'2024-06-09 17:04:00',NULL,NULL,'2024-06-09 17:04:12','2024-06-09 17:04:12'),(49,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-09 17:05:01','2024-06-09 17:05:01'),(51,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-22 12:08:53','2024-06-22 12:08:53'),(53,2,NULL,2,1,'2024-06-09 17:04:00',NULL,NULL,'2024-06-22 12:09:04','2024-06-22 12:09:04'),(56,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-22 13:41:32','2024-06-22 13:41:32'),(59,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-22 13:46:41','2024-06-22 13:46:41'),(62,2,NULL,2,1,'2024-05-18 18:42:00',NULL,NULL,'2024-06-22 13:57:22','2024-06-22 13:57:22'),(65,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-22 13:59:50','2024-06-22 13:59:50'),(66,3,NULL,3,NULL,'2024-06-25 08:39:00',NULL,NULL,'2024-06-25 08:39:02','2024-06-25 08:39:02'),(67,3,NULL,3,NULL,'2024-06-25 08:39:00',NULL,NULL,'2024-06-25 08:39:02','2024-06-25 08:39:02'),(68,3,NULL,3,NULL,'2024-06-25 08:39:00',NULL,NULL,'2024-06-25 08:39:53','2024-06-25 08:39:53'),(70,3,NULL,3,NULL,'2024-06-25 08:39:00',NULL,NULL,'2024-06-25 08:40:18','2024-06-25 08:40:18'),(72,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-26 20:17:02','2024-06-26 20:17:02'),(75,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-26 20:31:58','2024-06-26 20:31:58'),(77,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-26 20:32:09','2024-06-26 20:32:09'),(80,2,NULL,2,1,'2024-06-08 13:18:00',NULL,NULL,'2024-06-26 20:33:19','2024-06-26 20:33:19');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qomnsqympduyfctpnwmbsfvfnxqleprcqwdu` (`name`,`sectionId`),
  KEY `idx_nvriyijcyihxviwwklbuoqwjyvedrabphzfi` (`handle`,`sectionId`),
  KEY `idx_njasujvhuzigplscpdgorsosbemuveokeyyx` (`sectionId`),
  KEY `idx_fcuntmdcbbwqaxjdybffezrmsifvmruphdts` (`fieldLayoutId`),
  KEY `idx_ffoyewlalwetyqgqetokfjlfhjbvmajtxlmq` (`dateDeleted`),
  CONSTRAINT `fk_argldhocporukzffxqlibtwlineplgtqhnzv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dgtkgmpbmifxvmpknjvsergeyvpxpbhmdwsp` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,'44b1b133-2a7f-410d-a791-d08d689ced20'),(2,2,4,'Default','default',1,'site',NULL,NULL,'site',NULL,1,1,'2024-05-10 21:01:49','2024-05-10 21:01:49',NULL,'d14d2f9e-1b65-4dc6-8871-dfabe0db522f'),(3,3,6,'Album','album',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-06-25 08:39:02','2024-06-25 08:39:02',NULL,'e95a0410-74a3-4886-aff5-f90c5936225c');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fkqaacpihdqiekjhtmuzefzvphfhcbosmmjt` (`name`),
  KEY `idx_vedotpbaoadxnqaxoipuklnccpudxyjtvqqg` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,'f3796036-0ba8-4173-b40f-873b81ef93c2'),(2,'background image','2024-05-08 10:08:58','2024-05-08 10:08:58','2024-05-08 11:49:02','7c737064-7967-4623-b775-bf4e0db0ddea'),(3,'About','2024-05-10 21:02:02','2024-05-10 21:02:02',NULL,'592d68f4-b1af-4517-93fc-ad9dadb2ab09');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_suvkvklpkeovnkspgakpdlxjptxxncdlhhqv` (`layoutId`,`fieldId`),
  KEY `idx_awwenbcsokibgucanatvzjtwhqfnxyoutimc` (`sortOrder`),
  KEY `idx_koiavseattgvmanjrrsviyoxeqnuaesesyph` (`tabId`),
  KEY `idx_mtjihrvvgduknhjnoxnotgdjimeesnnuxccd` (`fieldId`),
  CONSTRAINT `fk_nwqfjmvjdgofmdjlgikfzqvamvwlhcwlofyg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjlkvbnkhvugubpzxnwcqnncwaiqmtlzjupd` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zamximolwdyayyepoedomxgbjqjzwcgubaya` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (2,1,5,2,0,1,'2024-05-08 12:05:23','2024-05-08 12:05:23','5c481a5f-a1c5-4c1e-ac17-5b57a8694c07'),(3,1,5,1,0,2,'2024-05-08 12:05:23','2024-05-08 12:05:23','06354584-1b7b-4024-8dd1-ed6400c4d18e'),(37,4,14,2,0,1,'2024-06-22 12:08:44','2024-06-22 12:08:44','e50256d1-ad5c-4764-a0fa-016275212efd'),(38,4,14,5,0,2,'2024-06-22 12:08:44','2024-06-22 12:08:44','28dba935-7660-49ac-a2c4-b2c13486a1ca'),(39,4,14,3,0,3,'2024-06-22 12:08:44','2024-06-22 12:08:44','e38123c3-a7a8-47c6-9024-c272274dc81c'),(40,4,14,4,0,4,'2024-06-22 12:08:44','2024-06-22 12:08:44','6cc5b8da-5581-4c99-842a-e4dbbd20f2f9'),(41,4,14,1,0,5,'2024-06-22 12:08:44','2024-06-22 12:08:44','4cb21f2e-453a-408e-b086-9d32c0fa6293'),(42,4,14,10,0,6,'2024-06-22 12:08:44','2024-06-22 12:08:44','927f4efc-3634-4d1b-99b5-d3ceff002907'),(43,4,14,11,0,7,'2024-06-22 12:08:44','2024-06-22 12:08:44','ae5b54e7-e4b6-4304-a13a-8674af9f97da'),(44,6,16,2,0,1,'2024-06-25 08:39:53','2024-06-25 08:39:53','22d68b9d-b75a-4453-8f27-3940308944d3'),(45,6,16,1,0,2,'2024-06-25 08:39:53','2024-06-25 08:39:53','770f81ad-5954-42c2-85d3-006494856df5');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bktbtkyavetkaruvohmhcvlppoeyxknskoqf` (`dateDeleted`),
  KEY `idx_kfhphztleatzvkvkzffpdjkxvcigswyjjuai` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,'68c6df2a-b2d9-423b-b89d-75e056fb6a4b'),(2,'craft\\elements\\Asset','2024-05-08 11:48:41','2024-05-08 11:48:41',NULL,'e6827c04-474b-4ae4-9ad7-8221b276a05f'),(3,'craft\\elements\\Asset','2024-05-08 12:03:34','2024-05-08 12:03:34',NULL,'cfab1eea-3c13-4789-b3eb-7ed0b433f424'),(4,'craft\\elements\\Entry','2024-05-10 21:01:49','2024-05-10 21:01:49',NULL,'9a2e3832-075e-4e7a-963a-a8a596d34155'),(5,'craft\\elements\\MatrixBlock','2024-06-08 14:29:04','2024-06-08 14:29:04','2024-06-09 13:57:20','a538cbbb-0641-497d-9166-ac97ff8fed5e'),(6,'craft\\elements\\Entry','2024-06-25 08:39:02','2024-06-25 08:39:02',NULL,'31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_srggzgmocvzzvicnhgomveqhzclakygjzahz` (`sortOrder`),
  KEY `idx_fabguujmzlceiecyvcibyuvvjgoqmszoiuta` (`layoutId`),
  CONSTRAINT `fk_nqnpfuafbfxbbiibdkkhncegzynwkreuvrfn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (2,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4a2dbfbc-7c6a-4b0e-9ec5-05516f531749\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\",\"attribute\":\"alt\",\"requirable\":true,\"class\":null,\"rows\":null,\"cols\":null,\"name\":null,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b4e053c8-1682-40bd-8a92-1e7d04d0b27b\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-05-08 11:48:41','2024-05-08 11:48:41','6e80dd84-d816-44bf-9e04-3a94bf186d1b'),(4,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"e281ac19-1285-41fb-8a31-d2c440c0d7f3\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\",\"attribute\":\"alt\",\"requirable\":true,\"class\":null,\"rows\":null,\"cols\":null,\"name\":null,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"13413487-b34f-4f89-8345-c1987af2c48e\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-05-08 12:03:34','2024-05-08 12:03:34','bc23138f-3d9c-490d-a1d9-60e68feb081f'),(5,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"819cafad-bdbd-488e-aae8-4cfd22568003\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d3d38bfd-e09b-4bf3-aeaf-486667254328\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"639a69ad-d5f3-4057-8d87-137c69661c57\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b2fd7d0a-36f4-4111-9358-6e6ef8196b8b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"}]',1,'2024-05-08 12:05:23','2024-05-08 12:05:23','bf334499-f8ea-47d6-83f9-c6e0b2bf9613'),(9,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"86e8e7dc-727e-4952-8088-66b2d034c2a1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6a11be08-d76f-4f2c-b320-a5e1831c13c2\"}]',1,'2024-06-08 14:29:04','2024-06-08 14:29:04','00772418-fc67-4064-ac7c-44168dcc15b7'),(14,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"2cdd6c09-3ca7-4247-af6a-bb645728079d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e7c7824f-e00e-4f95-9e47-cd8f89c778de\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"639a69ad-d5f3-4057-8d87-137c69661c57\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"17057392-f17b-4cb8-ac67-a89bc63052e8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1c2c9305-05ec-4708-a9bc-b5bb20733aac\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9846ca1c-fa6a-41dd-96e3-85d249fda858\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d2f9ed8d-d015-40ee-91a5-8d893b010e25\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"24a508b4-acb9-410c-a496-dd28e33e966b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"39b1bd22-567b-4b8c-a35e-1812f761a414\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0f7a4793-4659-49bc-93f3-8fd932d7fd86\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"14358472-714a-48c4-8eb1-3039bd84b318\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d3297840-9fce-4338-9145-1a95555ad540\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b8b49ec9-7e9f-4e54-b186-2383b03a00d0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"faba4b5e-82a2-478b-bd0b-4750e64b6d78\"}]',1,'2024-06-22 12:08:44','2024-06-22 12:08:44','d4244078-957e-4144-9c0d-0f1f526a16ab'),(16,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"808a3bb6-a66d-4a28-8a4d-43d8e723677f\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"96d4d1b3-3cd7-4295-af21-2b0ee53d7599\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"639a69ad-d5f3-4057-8d87-137c69661c57\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b6f216e2-25f9-4ee2-a44b-3fceb050ff7e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"}]',1,'2024-06-25 08:39:53','2024-06-25 08:39:53','391edf64-1c2c-4f87-9435-12378d9e9f00');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wauzkimqsdvwdvnxlzpajbonxtgbtawernnt` (`handle`,`context`),
  KEY `idx_dtkagagwogoypkrcumngypjxjrtckllsbnkv` (`groupId`),
  KEY `idx_foxfdvqfoaaajzqhsgncplocxdnoistoniec` (`context`),
  CONSTRAINT `fk_zcxnakbgbjcdphdfwzlyvwfyhbkmkirnkkxl` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Background Image','backgroundImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-08 11:49:46','2024-05-08 11:49:46','f2f10eba-1a45-41d9-9e63-c76bcb33a98b'),(2,1,'Logo','logo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:f8041b4b-1238-4323-a5c5-ee22373ce456\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:f8041b4b-1238-4323-a5c5-ee22373ce456\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-08 12:05:01','2024-05-08 12:05:01','639a69ad-d5f3-4057-8d87-137c69661c57'),(3,3,'Info Text','infoText','global','rpcmnocd',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2024-05-10 21:04:26','2024-05-10 21:04:26','d2f9ed8d-d015-40ee-91a5-8d893b010e25'),(4,3,'Introduction','introduction','global','nqyxulez',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-10 21:04:45','2024-05-10 21:04:45','39b1bd22-567b-4b8c-a35e-1812f761a414'),(5,3,'Banner Image','bannerImage','global','nkacqcru',NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-10 21:09:53','2024-05-18 18:37:57','1c2c9305-05ec-4708-a9bc-b5bb20733aac'),(10,3,'IsForm','isform','global','iuldjxop',NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2024-06-22 12:08:07','2024-06-22 12:08:07','d3297840-9fce-4338-9145-1a95555ad540'),(11,3,'IsLocation','islocation','global','tufaleqa',NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2024-06-22 12:08:26','2024-06-22 12:08:26','faba4b5e-82a2-478b-bd0b-4750e64b6d78');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bifqtyrszlfblxeadkltpcqotsvxeqxxdzqj` (`name`),
  KEY `idx_ihiyaotmyonidornzoyofwwpebqfacuwgrbh` (`handle`),
  KEY `idx_byhahaknkuritcubyrolwjeliwkxkknezvzb` (`fieldLayoutId`),
  KEY `idx_vjbnsghylvwrzxvamabqptwtpeaypwffpaer` (`sortOrder`),
  CONSTRAINT `fk_ghofwdoihgkdokuyfvlnqqueqhxnlhglmlpb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjkuxuuykomiageokityygrqvatdbknzsxcw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xevopvtdmjyywplprhzbvywluzkvjrsrnmzm` (`accessToken`),
  UNIQUE KEY `idx_ziknwfnffmmezxbafyzmbgdvqtldvqbzymgt` (`name`),
  KEY `fk_orjbxosdhhqjevcunfrxdvilgnslfdwsvoes` (`schemaId`),
  CONSTRAINT `fk_orjbxosdhhqjevcunfrxdvilgnslfdwsvoes` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rtjhenjdvdxtbkhzejhzcfnoihtfqxoqohum` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES (1,7,'craft\\imagetransforms\\ImageTransformer','nmixx-dash-backgroung.jpg',NULL,'_34x22_crop_center-center_none',1,0,0,'2024-05-08 11:56:22','2024-05-08 11:56:22','2024-05-08 12:05:38','a8d0e3a9-295c-40c0-bf34-3671065e3b57'),(2,7,'craft\\imagetransforms\\ImageTransformer','nmixx-dash-backgroung.jpg',NULL,'_68x45_crop_center-center_none',1,0,0,'2024-05-08 11:56:22','2024-05-08 11:56:22','2024-05-08 12:05:38','10e8750a-ca81-445c-b058-1675c963bcf3'),(5,12,'craft\\imagetransforms\\ImageTransformer','d58db7931b0d44f08d3a1dc92924d0c4-공홈-pc.png',NULL,'_34x19_crop_center-center_none',1,0,0,'2024-05-09 19:34:59','2024-05-09 19:34:59','2024-05-09 19:35:00','4a0cd653-34ac-45bc-93c8-acafa0e35b2f'),(6,12,'craft\\imagetransforms\\ImageTransformer','d58db7931b0d44f08d3a1dc92924d0c4-공홈-pc.png',NULL,'_68x38_crop_center-center_none',1,0,0,'2024-05-09 19:35:00','2024-05-09 19:35:00','2024-05-09 19:35:04','8a82bf03-12a0-4f60-816b-87b58de40b79'),(7,12,'craft\\imagetransforms\\ImageTransformer','d58db7931b0d44f08d3a1dc92924d0c4-공홈-pc.png',NULL,'_337x190_crop_center-center_none',1,0,0,'2024-05-09 19:35:03','2024-05-09 19:35:03','2024-05-09 19:35:04','e95d44ab-59ef-4b05-9c6d-7ff48b0ad279'),(8,12,'craft\\imagetransforms\\ImageTransformer','d58db7931b0d44f08d3a1dc92924d0c4-공홈-pc.png',NULL,'_674x380_crop_center-center_none',1,0,0,'2024-05-09 19:35:03','2024-05-09 19:35:03','2024-05-09 19:35:05','b7bcd625-1e5c-43d9-af10-24886ed17f18'),(9,7,'craft\\imagetransforms\\ImageTransformer','nmixx-dash-backgroung.jpg',NULL,'_284x190_crop_center-center_none',1,0,0,'2024-05-09 19:35:18','2024-05-09 19:35:18','2024-05-09 19:35:18','3284c3fb-59a3-4231-abdb-38ad62fe5112'),(10,7,'craft\\imagetransforms\\ImageTransformer','nmixx-dash-backgroung.jpg',NULL,'_568x380_crop_center-center_none',1,0,0,'2024-05-09 19:35:18','2024-05-09 19:35:18','2024-05-09 19:35:18','f1fd49a0-5c4d-48e1-9c1b-304625054fcd'),(11,25,'craft\\imagetransforms\\ImageTransformer','240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.jpg',NULL,'_34x11_crop_center-center_none',1,0,0,'2024-05-18 19:10:01','2024-05-18 19:10:01','2024-05-18 19:10:01','e52f6e00-38c8-438c-815d-209c2c2981ad'),(12,25,'craft\\imagetransforms\\ImageTransformer','240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.jpg',NULL,'_68x22_crop_center-center_none',1,0,0,'2024-05-18 19:10:01','2024-05-18 19:10:01','2024-05-18 19:10:15','8344cc51-f5cb-44e0-b333-614a5f665a24'),(13,28,'craft\\imagetransforms\\ImageTransformer','231128-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-jdmg29jirw2c1.jpg',NULL,'_34x11_crop_center-center_none',1,0,0,'2024-05-18 19:14:12','2024-05-18 19:14:12','2024-05-18 19:14:12','6f3ca1f9-d58d-467b-95e5-27720336aec4'),(14,28,'craft\\imagetransforms\\ImageTransformer','231128-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-jdmg29jirw2c1.jpg',NULL,'_68x22_crop_center-center_none',1,0,0,'2024-05-18 19:14:12','2024-05-18 19:14:12','2024-05-18 19:14:17','09626837-c9f8-4e28-9f8f-fdad5ab2a5df'),(15,33,'craft\\imagetransforms\\ImageTransformer','240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.png',NULL,'_34x8_crop_center-center_none',1,0,0,'2024-05-18 19:43:41','2024-05-18 19:43:41','2024-05-18 19:43:41','23efc537-7047-435a-a137-9db9540e80ff'),(16,33,'craft\\imagetransforms\\ImageTransformer','240102-nmixx-2nd-ep-fe3o4-break-new-banner-logo-v0-wb5sw75mtu9c1.png',NULL,'_68x17_crop_center-center_none',1,0,0,'2024-05-18 19:43:41','2024-05-18 19:43:41','2024-05-18 19:43:42','0e125804-fabf-429d-9036-424aaaf29e86'),(17,54,'craft\\imagetransforms\\ImageTransformer','blue-orange-disc.jpg',NULL,'_34x22_crop_center-center_none',1,0,0,'2024-06-22 13:41:25','2024-06-22 13:41:25','2024-06-22 13:41:25','e50b1e20-5912-41d1-8d97-08c0d37260c9'),(18,54,'craft\\imagetransforms\\ImageTransformer','blue-orange-disc.jpg',NULL,'_68x45_crop_center-center_none',1,0,0,'2024-06-22 13:41:25','2024-06-22 13:41:25','2024-06-22 13:41:25','b26a7151-ccd1-4bf7-b0d4-e279e697c550'),(19,58,'craft\\imagetransforms\\ImageTransformer','seoul.jpg',NULL,'_34x25_crop_center-center_none',1,0,0,'2024-06-22 13:46:37','2024-06-22 13:46:37','2024-06-22 13:46:37','d03932de-e4d4-4508-bc10-bb727cbfc1b7'),(20,58,'craft\\imagetransforms\\ImageTransformer','seoul.jpg',NULL,'_68x51_crop_center-center_none',1,0,0,'2024-06-22 13:46:37','2024-06-22 13:46:37','2024-06-22 13:46:38','a23f570e-b9a2-41c2-a198-d424fb43ed44'),(21,60,'craft\\imagetransforms\\ImageTransformer','pexels-ethan-brooke-1123775-10259522.jpg',NULL,'_34x20_crop_center-center_none',1,0,0,'2024-06-22 13:57:18','2024-06-22 13:57:18','2024-06-22 13:57:19','71d23e07-2afc-41f6-9652-5b8202aa826d'),(22,60,'craft\\imagetransforms\\ImageTransformer','pexels-ethan-brooke-1123775-10259522.jpg',NULL,'_68x40_crop_center-center_none',1,0,0,'2024-06-22 13:57:18','2024-06-22 13:57:18','2024-06-22 13:57:19','c0d82882-dfeb-489e-86af-99d89f6fceee'),(23,64,'craft\\imagetransforms\\ImageTransformer','impressum.jpg',NULL,'_34x22_crop_center-center_none',1,0,0,'2024-06-22 13:59:48','2024-06-22 13:59:48','2024-06-22 13:59:49','3a070382-0593-432e-86a1-e4ce037d9e07'),(24,64,'craft\\imagetransforms\\ImageTransformer','impressum.jpg',NULL,'_68x45_crop_center-center_none',1,0,0,'2024-06-22 13:59:48','2024-06-22 13:59:48','2024-06-22 13:59:49','736fc0bb-2b6f-4f75-a47f-589020a5ea69'),(28,73,'craft\\imagetransforms\\ImageTransformer','clean-desk-background.jpg',NULL,'_34x22_crop_center-center_none',1,0,0,'2024-06-26 20:33:17','2024-06-26 20:33:17','2024-06-26 20:33:20','0b91c652-c5d1-4f63-a415-7e3dd1297ee4'),(29,73,'craft\\imagetransforms\\ImageTransformer','clean-desk-background.jpg',NULL,'_68x45_crop_center-center_none',1,0,0,'2024-06-26 20:33:17','2024-06-26 20:33:17','2024-06-26 20:33:17','7b4d0132-1d94-4329-bbe7-149080fa440f'),(32,10,'craft\\imagetransforms\\ImageTransformer','logo-trans.png',NULL,'_190x190_crop_center-center_none',1,0,0,'2024-06-26 20:39:44','2024-06-26 20:39:44','2024-06-26 20:39:44','0d524f49-1670-4419-a6bd-d497acde24c5'),(33,10,'craft\\imagetransforms\\ImageTransformer','logo-trans.png',NULL,'_380x380_crop_center-center_none',1,0,0,'2024-06-26 20:39:44','2024-06-26 20:39:44','2024-06-26 20:39:44','f8fb382a-1fe7-45a1-ad10-d7fa69fc7023'),(34,10,'craft\\imagetransforms\\ImageTransformer','logo-trans.png',NULL,'_34x34_crop_center-center_none',1,0,0,'2024-06-26 20:39:46','2024-06-26 20:39:46','2024-06-26 20:39:47','dab06f93-1ef3-41c9-87d2-c90bfd32c976'),(35,10,'craft\\imagetransforms\\ImageTransformer','logo-trans.png',NULL,'_68x68_crop_center-center_none',1,0,0,'2024-06-26 20:39:46','2024-06-26 20:39:46','2024-06-26 20:39:47','70a97bd4-a026-426d-8f48-b2731132b25e');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_evkuzmzdvhfkvxafbwiwgkgtsyatumkendng` (`name`),
  KEY `idx_nsbhmujznbykndylvqgajnmswycfgleinwve` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.9.2','4.5.3.0',0,'vkcncajprglq','3@kgxyypztml','2024-04-26 12:08:10','2024-06-25 18:56:25','3b8ae655-5914-4b93-8af1-267528af7272');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fhtacfpavcubfoqiurdgissyfwcidajwsrnj` (`primaryOwnerId`),
  KEY `idx_kuhbzbdwjamnunywujvzzfyyesnnnuiuyyhk` (`fieldId`),
  KEY `idx_kiwrcpgiqtgkzimqmaciyaeuxhekjigzjxhr` (`typeId`),
  CONSTRAINT `fk_rgolwiflyroozabwaefoyzksotgiarmokkre` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulytbsvblycmcqagysckabrtffftqpfdaeds` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_upotfwxdlrtesnavhzcgiazzvqrwyjywwyek` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xlssfoikcarcndagdrtdykcmuhsijftfohdl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_ypsvpiffiaspjviikgvbknzqgyuwayxtqwuh` (`ownerId`),
  CONSTRAINT `fk_vnmnqyjrvilalnlqntksyngogxvxywwxgyyy` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ypsvpiffiaspjviikgvbknzqgyuwayxtqwuh` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kzplioaieomgpwgivsxinvnoyhrvewzbypos` (`name`,`fieldId`),
  KEY `idx_gcembwsagnmmtsepzybmvpalufrikdzguxxp` (`handle`,`fieldId`),
  KEY `idx_jlepcmwjlehatuidbddbyvavbqguqnmdubxt` (`fieldId`),
  KEY `idx_vivrhevreqxildsqesgvgsevsclfhfvhbfcv` (`fieldLayoutId`),
  CONSTRAINT `fk_ozvtteropajnrljqzhhdlgyayquoglenotyl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_raajamjtrefsottejuwtfihqyhijjkgxcxmd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rxhpuvrydeuoyhdeavozcceponanqjiuoogr` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','5d328b1b-0707-4353-9fe7-db6dbdba8421'),(2,'craft','m210121_145800_asset_indexing_changes','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','9e06fa03-d50f-4339-9887-a738922572b6'),(3,'craft','m210624_222934_drop_deprecated_tables','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','4379be83-864b-46d1-ae85-2f77082d2e6f'),(4,'craft','m210724_180756_rename_source_cols','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','2e6da205-4291-4c4e-95be-8a28a06547ae'),(5,'craft','m210809_124211_remove_superfluous_uids','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','d0b1f264-ef94-4d4f-bfb9-fd6ebd327b70'),(6,'craft','m210817_014201_universal_users','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','03b4fe27-a690-4ed5-91d6-12009c3e74a4'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','8f80032f-10a3-4db1-9ade-1725b5a20dad'),(8,'craft','m211115_135500_image_transformers','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','774aceba-f089-456d-b0a1-58c3f246a0f1'),(9,'craft','m211201_131000_filesystems','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','eac78cda-8c5b-4d67-a69d-969e9da6a2f0'),(10,'craft','m220103_043103_tab_conditions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','dc0f17d2-d5e5-4989-8b13-fe1278171b22'),(11,'craft','m220104_003433_asset_alt_text','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','767fc0bc-9a6f-45c5-8610-22b57e0b07ca'),(12,'craft','m220123_213619_update_permissions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3f20e52b-822d-4a14-a6c0-f08b5de5a069'),(13,'craft','m220126_003432_addresses','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3178f8ab-2865-4988-9d83-dc77d6813441'),(14,'craft','m220209_095604_add_indexes','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','461e1a76-932f-4b04-98a7-d0ff8f51b684'),(15,'craft','m220213_015220_matrixblocks_owners_table','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','7e5fb189-077b-4983-be3c-4544ad408def'),(16,'craft','m220214_000000_truncate_sessions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','51681b54-dff8-4476-802a-58600c53b750'),(17,'craft','m220222_122159_full_names','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','a84fc30d-ce71-46b0-9661-c86cd87afaf1'),(18,'craft','m220223_180559_nullable_address_owner','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','42258c4c-1b9b-402e-97aa-96beb7ed578d'),(19,'craft','m220225_165000_transform_filesystems','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','7fb922d2-6842-4684-b34a-e3f4b697bfe4'),(20,'craft','m220309_152006_rename_field_layout_elements','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','a5d61c4c-b57a-4cf0-941c-97e63e8b7f85'),(21,'craft','m220314_211928_field_layout_element_uids','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','09f600b9-8d3d-4295-a00f-098df7a1cc73'),(22,'craft','m220316_123800_transform_fs_subpath','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','6a77bc7c-5196-4e70-9e6c-681c3450d085'),(23,'craft','m220317_174250_release_all_jobs','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','44e3a521-2d73-47ea-a61f-deedcb916b54'),(24,'craft','m220330_150000_add_site_gql_schema_components','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','f587e448-baba-4082-8f49-ab4a86028a3a'),(25,'craft','m220413_024536_site_enabled_string','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','bb051f75-d5f2-4788-9ead-aebbfa4cc59e'),(26,'craft','m221027_160703_add_image_transform_fill','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','077b4d9d-fe9e-4e25-a009-3cc67cae9232'),(27,'craft','m221028_130548_add_canonical_id_index','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','8147ac9f-3d24-4e80-ba1e-3e19f144e566'),(28,'craft','m221118_003031_drop_element_fks','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','20487e39-fae2-4167-a73c-293ab65af48f'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','51469bc9-a261-48ae-bfc4-e8310ed4b88a'),(30,'craft','m230226_013114_drop_plugin_license_columns','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','384ead00-b161-4f44-8d21-36fdf11466e9'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','90e67130-923f-4666-9825-4ff7b7b66166'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3b91d352-8749-477b-b42c-ea02305a599b'),(33,'craft','m230710_162700_element_activity','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','dc0b91ce-7013-4a55-8027-9e1ec36b2102'),(34,'craft','m230820_162023_fix_cache_id_type','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','93b6eea9-a650-42a5-a58b-e0fb21fb00e3'),(35,'craft','m230826_094050_fix_session_id_type','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','4d46295e-2e53-400a-9c7e-58df15a0b636'),(36,'plugin:project-extension','Install','2024-04-26 12:08:18','2024-04-26 12:08:18','2024-04-26 12:08:18','1cbf0a40-1e39-46ac-a248-1badc309e084'),(37,'plugin:redactor','m180430_204710_remove_old_plugins','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','8b2a2bbe-8b4a-4181-bb48-51b947721f8a'),(38,'plugin:redactor','Install','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','bad00462-dcf6-4533-9927-db911aafcd0d'),(39,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2024-04-26 12:08:34','2024-04-26 12:08:34','2024-04-26 12:08:34','514970a4-92e1-4ac6-8d33-623228e18c5b'),(70,'plugin:super-table','Install','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','ffc56303-8af4-4c6e-aca9-39f090269a04'),(71,'plugin:super-table','m220308_000000_remove_superfluous_uids','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','0e79403f-4bf5-4199-97ba-fbbb89f92130'),(72,'plugin:super-table','m220308_100000_owners_table','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','04519f5e-9c98-4d3f-82dd-de28b0a10401');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cpjrjksdaonhdznslygwuaigeyevjilnehxt` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'project-extension','1.0.1','1.0.0','2024-04-26 12:08:18','2024-04-26 12:08:18','2024-04-26 12:08:18','c7cb9997-4919-45d5-98ea-6ab5560f169e'),(2,'contact-form','3.1.0','1.0.0','2024-04-26 12:08:23','2024-04-26 12:08:23','2024-04-26 12:08:23','783eab51-10c5-4d83-97d8-08f5177e8de9'),(3,'contact-form-honeypot','2.1.0','1.0.0','2024-04-26 12:08:28','2024-04-26 12:08:28','2024-04-26 12:08:28','3da3ff6c-6fe2-43a5-af4d-48c0dbf76fed'),(4,'redactor','3.0.4','2.3.0','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','b099b69e-8ee7-432c-91f2-6ee652f807fc'),(7,'cp-field-inspect','1.4.4','1.0.0','2024-04-26 12:09:05','2024-04-26 12:09:05','2024-04-26 12:09:05','37225584-a1e6-44e6-8c7f-1d36a85594a0'),(8,'super-table','3.0.14','3.0.0','2024-04-26 12:09:14','2024-04-26 12:09:14','2024-05-03 08:58:22','3cae3955-e97d-400f-8663-5ae0352dd5ac'),(9,'architect','4.0.1','2.0.0','2024-04-26 12:09:23','2024-04-26 12:09:23','2024-04-26 12:09:23','9f6cfced-d39a-4050-96f5-64e9b0cafa53'),(10,'craft-components','dev-master','1.0.0','2024-04-26 12:09:52','2024-04-26 12:09:52','2024-04-26 12:09:52','6348b90c-34be-4180-b675-e85419e37c9d');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1719304793'),('email.fromEmail','\"dev-test@yoo.digital\"'),('email.fromName','\"293-m-project\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocapitalize','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocomplete','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocorrect','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.class','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.disabled','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.id','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.inputType','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.instructions','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.label','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.max','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.min','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.name','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.orientation','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.placeholder','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.readonly','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.requirable','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.size','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.step','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.tip','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.title','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.uid','\"819cafad-bdbd-488e-aae8-4cfd22568003\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.warning','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.width','100'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.fieldUid','\"639a69ad-d5f3-4057-8d87-137c69661c57\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.instructions','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.label','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.required','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.tip','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.uid','\"d3d38bfd-e09b-4bf3-aeaf-486667254328\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.warning','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.1.width','100'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.fieldUid','\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.instructions','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.label','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.required','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.tip','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.uid','\"b2fd7d0a-36f4-4111-9358-6e6ef8196b8b\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.warning','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.2.width','100'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.name','\"Content\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.uid','\"bf334499-f8ea-47d6-83f9-c6e0b2bf9613\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.handle','\"homepage\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.hasTitleField','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.name','\"homepage\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.section','\"e64fed43-43e3-4ef1-bd91-cba55dff1e11\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.showStatusField','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.slugTranslationKeyFormat','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.slugTranslationMethod','\"site\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.sortOrder','1'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleFormat','\"{section.name|raw}\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleTranslationKeyFormat','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleTranslationMethod','\"site\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.autocomplete','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.autocorrect','true'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.class','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.disabled','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.id','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.inputType','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.max','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.min','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.name','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.orientation','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.placeholder','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.readonly','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.requirable','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.size','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.step','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.title','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.uid','\"2cdd6c09-3ca7-4247-af6a-bb645728079d\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.0.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.fieldUid','\"639a69ad-d5f3-4057-8d87-137c69661c57\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.uid','\"e7c7824f-e00e-4f95-9e47-cd8f89c778de\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.1.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.fieldUid','\"1c2c9305-05ec-4708-a9bc-b5bb20733aac\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.uid','\"17057392-f17b-4cb8-ac67-a89bc63052e8\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.2.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.fieldUid','\"d2f9ed8d-d015-40ee-91a5-8d893b010e25\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.uid','\"9846ca1c-fa6a-41dd-96e3-85d249fda858\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.3.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.fieldUid','\"39b1bd22-567b-4b8c-a35e-1812f761a414\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.uid','\"24a508b4-acb9-410c-a496-dd28e33e966b\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.4.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.fieldUid','\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.uid','\"0f7a4793-4659-49bc-93f3-8fd932d7fd86\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.5.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.fieldUid','\"d3297840-9fce-4338-9145-1a95555ad540\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.uid','\"14358472-714a-48c4-8eb1-3039bd84b318\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.6.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.elementCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.fieldUid','\"faba4b5e-82a2-478b-bd0b-4750e64b6d78\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.instructions','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.label','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.required','false'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.tip','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.uid','\"b8b49ec9-7e9f-4e54-b186-2383b03a00d0\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.warning','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.elements.7.width','100'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.name','\"Content\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.uid','\"d4244078-957e-4144-9c0d-0f1f526a16ab\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.fieldLayouts.9a2e3832-075e-4e7a-963a-a8a596d34155.tabs.0.userCondition','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.handle','\"default\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.hasTitleField','true'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.name','\"Default\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.section','\"ba830877-e04b-4616-808c-6b8461b0b2e2\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.showStatusField','true'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.slugTranslationKeyFormat','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.slugTranslationMethod','\"site\"'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.sortOrder','1'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.titleFormat','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.titleTranslationKeyFormat','null'),('entryTypes.d14d2f9e-1b65-4dc6-8871-dfabe0db522f.titleTranslationMethod','\"site\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elementCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.autocomplete','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.autocorrect','true'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.class','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.disabled','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.elementCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.id','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.inputType','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.instructions','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.label','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.max','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.min','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.name','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.orientation','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.placeholder','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.readonly','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.requirable','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.size','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.step','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.tip','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.title','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.uid','\"808a3bb6-a66d-4a28-8a4d-43d8e723677f\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.userCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.warning','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.0.width','100'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.elementCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.fieldUid','\"639a69ad-d5f3-4057-8d87-137c69661c57\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.instructions','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.label','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.required','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.tip','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.uid','\"96d4d1b3-3cd7-4295-af21-2b0ee53d7599\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.userCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.warning','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.1.width','100'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.elementCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.fieldUid','\"f2f10eba-1a45-41d9-9e63-c76bcb33a98b\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.instructions','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.label','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.required','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.tip','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.uid','\"b6f216e2-25f9-4ee2-a44b-3fceb050ff7e\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.userCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.warning','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.elements.2.width','100'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.name','\"Content\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.uid','\"391edf64-1c2c-4f87-9435-12378d9e9f00\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.fieldLayouts.31a0dabf-f6c4-41b1-be5e-e5a46f7f3b2a.tabs.0.userCondition','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.handle','\"album\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.hasTitleField','false'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.name','\"Album\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.section','\"1fb2a281-789b-47cd-bd5c-d568da249a35\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.showStatusField','true'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.slugTranslationKeyFormat','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.slugTranslationMethod','\"site\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.sortOrder','1'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.titleFormat','\"{section.name|raw}\"'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.titleTranslationKeyFormat','null'),('entryTypes.e95a0410-74a3-4886-aff5-f90c5936225c.titleTranslationMethod','\"site\"'),('fieldGroups.592d68f4-b1af-4517-93fc-ad9dadb2ab09.name','\"About\"'),('fieldGroups.f3796036-0ba8-4173-b40f-873b81ef93c2.name','\"Common\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.columnSuffix','\"nkacqcru\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.contentColumnType','\"string\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.fieldGroup','\"592d68f4-b1af-4517-93fc-ad9dadb2ab09\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.handle','\"bannerImage\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.instructions','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.name','\"Banner Image\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.searchable','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.allowedKinds','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.allowSelfRelations','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.allowSubfolders','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.allowUploads','true'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.branchLimit','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.defaultUploadLocationSource','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.defaultUploadLocationSubpath','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.localizeRelations','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.maintainHierarchy','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.maxRelations','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.minRelations','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.previewMode','\"full\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.restrictedDefaultUploadSubpath','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.restrictedLocationSource','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.restrictedLocationSubpath','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.restrictFiles','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.restrictLocation','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.selectionLabel','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.showSiteMenu','true'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.showUnpermittedFiles','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.showUnpermittedVolumes','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.sources','\"*\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.targetSiteId','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.validateRelatedElements','false'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.settings.viewMode','\"list\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.translationKeyFormat','null'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.translationMethod','\"site\"'),('fields.1c2c9305-05ec-4708-a9bc-b5bb20733aac.type','\"craft\\\\fields\\\\Assets\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.columnSuffix','\"nqyxulez\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.contentColumnType','\"text\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.fieldGroup','\"592d68f4-b1af-4517-93fc-ad9dadb2ab09\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.handle','\"introduction\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.instructions','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.name','\"Introduction\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.searchable','false'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.byteLimit','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.charLimit','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.code','false'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.columnType','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.initialRows','4'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.multiline','false'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.placeholder','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.settings.uiMode','\"normal\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.translationKeyFormat','null'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.translationMethod','\"none\"'),('fields.39b1bd22-567b-4b8c-a35e-1812f761a414.type','\"craft\\\\fields\\\\PlainText\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.columnSuffix','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.contentColumnType','\"string\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.fieldGroup','\"f3796036-0ba8-4173-b40f-873b81ef93c2\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.handle','\"logo\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.instructions','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.name','\"Logo\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.searchable','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.allowedKinds','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.allowSelfRelations','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.allowSubfolders','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.allowUploads','true'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.branchLimit','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.defaultUploadLocationSource','\"volume:f8041b4b-1238-4323-a5c5-ee22373ce456\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.defaultUploadLocationSubpath','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.localizeRelations','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.maintainHierarchy','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.maxRelations','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.minRelations','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.previewMode','\"full\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.restrictedDefaultUploadSubpath','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.restrictedLocationSource','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.restrictedLocationSubpath','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.restrictFiles','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.restrictLocation','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.selectionLabel','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.showSiteMenu','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.showUnpermittedFiles','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.showUnpermittedVolumes','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.sources.0','\"volume:f8041b4b-1238-4323-a5c5-ee22373ce456\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.targetSiteId','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.validateRelatedElements','false'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.settings.viewMode','\"list\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.translationKeyFormat','null'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.translationMethod','\"site\"'),('fields.639a69ad-d5f3-4057-8d87-137c69661c57.type','\"craft\\\\fields\\\\Assets\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.columnSuffix','\"rpcmnocd\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.contentColumnType','\"text\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.fieldGroup','\"592d68f4-b1af-4517-93fc-ad9dadb2ab09\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.handle','\"infoText\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.instructions','null'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.name','\"Info Text\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.searchable','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.availableTransforms','\"\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.availableVolumes','\"*\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.columnType','\"text\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.configSelectionMode','\"choose\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.defaultTransform','\"\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.manualConfig','\"\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.purifierConfig','null'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.purifyHtml','true'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.redactorConfig','null'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.removeEmptyTags','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.removeInlineStyles','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.removeNbsp','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.showHtmlButtonForNonAdmins','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.showUnpermittedFiles','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.showUnpermittedVolumes','false'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.settings.uiMode','\"enlarged\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.translationKeyFormat','null'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.translationMethod','\"none\"'),('fields.d2f9ed8d-d015-40ee-91a5-8d893b010e25.type','\"craft\\\\redactor\\\\Field\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.columnSuffix','\"iuldjxop\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.contentColumnType','\"boolean\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.fieldGroup','\"592d68f4-b1af-4517-93fc-ad9dadb2ab09\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.handle','\"isform\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.instructions','null'),('fields.d3297840-9fce-4338-9145-1a95555ad540.name','\"IsForm\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.searchable','false'),('fields.d3297840-9fce-4338-9145-1a95555ad540.settings.default','false'),('fields.d3297840-9fce-4338-9145-1a95555ad540.settings.offLabel','null'),('fields.d3297840-9fce-4338-9145-1a95555ad540.settings.onLabel','null'),('fields.d3297840-9fce-4338-9145-1a95555ad540.translationKeyFormat','null'),('fields.d3297840-9fce-4338-9145-1a95555ad540.translationMethod','\"none\"'),('fields.d3297840-9fce-4338-9145-1a95555ad540.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.columnSuffix','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.contentColumnType','\"string\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.fieldGroup','\"f3796036-0ba8-4173-b40f-873b81ef93c2\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.handle','\"backgroundImage\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.instructions','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.name','\"Background Image\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.searchable','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.allowedKinds','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.allowSelfRelations','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.allowSubfolders','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.allowUploads','true'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.branchLimit','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.defaultUploadLocationSource','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.defaultUploadLocationSubpath','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.localizeRelations','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.maintainHierarchy','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.maxRelations','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.minRelations','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.previewMode','\"full\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.restrictedDefaultUploadSubpath','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.restrictedLocationSource','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.restrictedLocationSubpath','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.restrictFiles','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.restrictLocation','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.selectionLabel','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.showSiteMenu','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.showUnpermittedFiles','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.showUnpermittedVolumes','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.sources.0','\"volume:651cb76d-e620-419f-9030-4a6c45f86ed3\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.targetSiteId','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.validateRelatedElements','false'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.settings.viewMode','\"list\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.translationKeyFormat','null'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.translationMethod','\"site\"'),('fields.f2f10eba-1a45-41d9-9e63-c76bcb33a98b.type','\"craft\\\\fields\\\\Assets\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.columnSuffix','\"tufaleqa\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.contentColumnType','\"boolean\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.fieldGroup','\"592d68f4-b1af-4517-93fc-ad9dadb2ab09\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.handle','\"islocation\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.instructions','null'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.name','\"IsLocation\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.searchable','false'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.settings.default','false'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.settings.offLabel','null'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.settings.onLabel','null'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.translationKeyFormat','null'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.translationMethod','\"none\"'),('fields.faba4b5e-82a2-478b-bd0b-4750e64b6d78.type','\"craft\\\\fields\\\\Lightswitch\"'),('fs.backgroundImage.hasUrls','true'),('fs.backgroundImage.name','\"Background Image\"'),('fs.backgroundImage.settings.path','\"@webroot/images/uploads/background\"'),('fs.backgroundImage.type','\"craft\\\\fs\\\\Local\"'),('fs.backgroundImage.url','\"@web/images/uploads/background\"'),('fs.logo.hasUrls','true'),('fs.logo.name','\"Logo\"'),('fs.logo.settings.path','\"@webroot/images/uploads/logo\"'),('fs.logo.type','\"craft\\\\fs\\\\Local\"'),('fs.logo.url','\"@web/images/uploads/logo\"'),('meta.__names__.0223b707-3c9a-486e-8d9f-4e0a9b65b004','\"293-m-project\"'),('meta.__names__.1c2c9305-05ec-4708-a9bc-b5bb20733aac','\"Banner Image\"'),('meta.__names__.1fb2a281-789b-47cd-bd5c-d568da249a35','\"Album\"'),('meta.__names__.39b1bd22-567b-4b8c-a35e-1812f761a414','\"Introduction\"'),('meta.__names__.44b1b133-2a7f-410d-a791-d08d689ced20','\"homepage\"'),('meta.__names__.58e5330c-b0ef-43ce-bc09-04944358f3ee','\"293-m-project\"'),('meta.__names__.592d68f4-b1af-4517-93fc-ad9dadb2ab09','\"About\"'),('meta.__names__.639a69ad-d5f3-4057-8d87-137c69661c57','\"Logo\"'),('meta.__names__.651cb76d-e620-419f-9030-4a6c45f86ed3','\"Background Image\"'),('meta.__names__.ba830877-e04b-4616-808c-6b8461b0b2e2','\"About\"'),('meta.__names__.d14d2f9e-1b65-4dc6-8871-dfabe0db522f','\"Default\"'),('meta.__names__.d2f9ed8d-d015-40ee-91a5-8d893b010e25','\"Info Text\"'),('meta.__names__.d3297840-9fce-4338-9145-1a95555ad540','\"IsForm\"'),('meta.__names__.e64fed43-43e3-4ef1-bd91-cba55dff1e11','\"homepage\"'),('meta.__names__.e95a0410-74a3-4886-aff5-f90c5936225c','\"Album\"'),('meta.__names__.f2f10eba-1a45-41d9-9e63-c76bcb33a98b','\"Background Image\"'),('meta.__names__.f3796036-0ba8-4173-b40f-873b81ef93c2','\"Common\"'),('meta.__names__.f8041b4b-1238-4323-a5c5-ee22373ce456','\"Logo\"'),('meta.__names__.faba4b5e-82a2-478b-bd0b-4750e64b6d78','\"IsLocation\"'),('plugins.architect.edition','\"standard\"'),('plugins.architect.enabled','true'),('plugins.architect.schemaVersion','\"2.0.0\"'),('plugins.contact-form-honeypot.edition','\"standard\"'),('plugins.contact-form-honeypot.enabled','true'),('plugins.contact-form-honeypot.schemaVersion','\"1.0.0\"'),('plugins.contact-form.edition','\"standard\"'),('plugins.contact-form.enabled','true'),('plugins.contact-form.schemaVersion','\"1.0.0\"'),('plugins.cp-field-inspect.edition','\"standard\"'),('plugins.cp-field-inspect.enabled','true'),('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),('plugins.craft-components.edition','\"standard\"'),('plugins.craft-components.enabled','true'),('plugins.craft-components.schemaVersion','\"1.0.0\"'),('plugins.project-extension.edition','\"standard\"'),('plugins.project-extension.enabled','true'),('plugins.project-extension.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"3.0.0\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.defaultPlacement','\"end\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.enableVersioning','true'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.handle','\"album\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.name','\"Album\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.propagationMethod','\"all\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.enabledByDefault','true'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.template','\"_entry-types/Album/album.twig\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.uriFormat','\"album\"'),('sections.1fb2a281-789b-47cd-bd5c-d568da249a35.type','\"single\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.defaultPlacement','\"end\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.enableVersioning','true'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.handle','\"about\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.name','\"About\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.propagationMethod','\"all\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.enabledByDefault','true'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.template','\"_entry-types/About/about.twig\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.uriFormat','\"{parent.uri}/{slug}\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.structure.maxLevels','null'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.structure.uid','\"2029c043-b99e-4531-bd1c-62d12eba4709\"'),('sections.ba830877-e04b-4616-808c-6b8461b0b2e2.type','\"structure\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.defaultPlacement','\"end\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.enableVersioning','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.handle','\"homepage\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.name','\"homepage\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.propagationMethod','\"all\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.enabledByDefault','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.template','\"_entry-types/home/home.twig\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.uriFormat','\"__home__\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.type','\"single\"'),('siteGroups.58e5330c-b0ef-43ce-bc09-04944358f3ee.name','\"293-m-project\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.handle','\"default\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.language','\"en-US\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.name','\"293-m-project\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.primary','true'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.siteGroup','\"58e5330c-b0ef-43ce-bc09-04944358f3ee\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"293-m-project\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elementCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.autocapitalize','true'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.autocomplete','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.autocorrect','true'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.class','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.disabled','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.elementCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.id','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.inputType','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.instructions','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.label','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.max','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.min','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.name','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.orientation','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.placeholder','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.readonly','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.requirable','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.size','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.step','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.tip','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.title','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.uid','\"4a2dbfbc-7c6a-4b0e-9ec5-05516f531749\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.userCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.warning','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.0.width','100'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.attribute','\"alt\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.class','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.cols','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.disabled','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.elementCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.id','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.instructions','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.label','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.name','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.orientation','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.placeholder','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.readonly','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.requirable','true'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.required','false'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.rows','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.tip','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.title','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.uid','\"b4e053c8-1682-40bd-8a92-1e7d04d0b27b\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.userCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.warning','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.elements.1.width','100'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.name','\"Content\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.uid','\"6e80dd84-d816-44bf-9e04-3a94bf186d1b\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fieldLayouts.e6827c04-474b-4ae4-9ad7-8221b276a05f.tabs.0.userCondition','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.fs','\"backgroundImage\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.handle','\"backgroundImage\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.name','\"Background Image\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.sortOrder','1'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.titleTranslationKeyFormat','null'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.titleTranslationMethod','\"site\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.transformFs','\"\"'),('volumes.651cb76d-e620-419f-9030-4a6c45f86ed3.transformSubpath','\"\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elementCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.autocapitalize','true'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.autocomplete','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.autocorrect','true'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.class','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.disabled','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.elementCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.id','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.inputType','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.instructions','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.label','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.max','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.min','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.name','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.orientation','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.placeholder','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.readonly','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.requirable','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.size','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.step','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.tip','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.title','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.uid','\"e281ac19-1285-41fb-8a31-d2c440c0d7f3\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.userCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.warning','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.0.width','100'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.attribute','\"alt\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.class','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.cols','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.disabled','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.elementCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.id','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.instructions','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.label','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.name','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.orientation','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.placeholder','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.readonly','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.requirable','true'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.required','false'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.rows','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.tip','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.title','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.uid','\"13413487-b34f-4f89-8345-c1987af2c48e\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.userCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.warning','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.elements.1.width','100'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.name','\"Content\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.uid','\"bc23138f-3d9c-490d-a1d9-60e68feb081f\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fieldLayouts.cfab1eea-3c13-4789-b3eb-7ed0b433f424.tabs.0.userCondition','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.fs','\"logo\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.handle','\"logo\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.name','\"Logo\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.sortOrder','2'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.titleTranslationKeyFormat','null'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.titleTranslationMethod','\"site\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.transformFs','\"\"'),('volumes.f8041b4b-1238-4323-a5c5-ee22373ce456.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectextension_projectextensionrecord`
--

DROP TABLE IF EXISTS `projectextension_projectextensionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectextension_projectextensionrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int NOT NULL,
  `some_field` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qjdioucnmzftykdakgredtmefomphbyhfehx` (`some_field`),
  KEY `fk_vkdqobadrpeonghnqdrkrtpxxvzznpwwxtmo` (`siteId`),
  CONSTRAINT `fk_vkdqobadrpeonghnqdrkrtpxxvzznpwwxtmo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectextension_projectextensionrecord`
--

LOCK TABLES `projectextension_projectextensionrecord` WRITE;
/*!40000 ALTER TABLE `projectextension_projectextensionrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectextension_projectextensionrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_fvqcezcbtehhluqqhqbkjsryykhcrsznvbna` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_vvgoqimdtgjizjveijllxsferkdscfmipehj` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nfbmpgbspmkrnujvvqvsedoigxbfrtdavsxj` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ehbaohmpexmhxwqwkpcwxwejtxewmbcjlacw` (`sourceId`),
  KEY `idx_kswoovihvurahisjoxpomoinjnahxnyzwpzl` (`targetId`),
  KEY `idx_pezayfxseoouajxbrfnyfmowodhlswgcisim` (`sourceSiteId`),
  CONSTRAINT `fk_bgzodiqnikcbddulooslimjjfganyrvfccpr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eataaednhhwoxezexecqeffwjfglifdxacdk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kyummyhjfunzpbhglpxavnnqwlwtmwaazkfs` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (3,2,2,NULL,10,1,'2024-05-08 12:06:09','2024-05-08 12:06:09','597a8c36-6d57-485f-8f24-5fe471cd82fe'),(5,2,11,NULL,10,1,'2024-05-08 12:06:09','2024-05-08 12:06:09','9c23764a-fc85-4df7-9117-a51b45e60a1b'),(6,1,11,NULL,7,1,'2024-05-08 12:06:09','2024-05-08 12:06:09','a2bdef45-474c-4b55-a89a-fdc804915d59'),(10,1,2,NULL,12,1,'2024-05-09 19:35:33','2024-05-09 19:35:33','45ce1da8-5a86-47d6-991f-2bb15972d965'),(11,2,14,NULL,10,1,'2024-05-09 19:35:33','2024-05-09 19:35:33','a3147234-817d-4df3-86d0-6575ed0a037d'),(12,1,14,NULL,12,1,'2024-05-09 19:35:33','2024-05-09 19:35:33','a87470d9-76f1-4efc-b4f0-7f9bdb85c342'),(15,1,18,NULL,12,1,'2024-05-18 18:37:39','2024-05-18 18:37:39','57e4460f-078f-47f9-b0c5-a0f932590226'),(18,2,15,NULL,10,1,'2024-05-18 18:38:32','2024-05-18 18:38:32','8daf482c-5480-4c48-854e-3ca07ef5e08e'),(19,2,20,NULL,10,1,'2024-05-18 18:38:32','2024-05-18 18:38:32','477ffce1-3c07-4780-8849-c6d0e3f676f4'),(20,1,20,NULL,12,1,'2024-05-18 18:38:32','2024-05-18 18:38:32','8acab006-eec8-45a9-923e-bf6ded128513'),(21,2,21,NULL,10,1,'2024-05-18 18:42:40','2024-05-18 18:42:40','fe6dc3b6-b81f-4fce-acc0-a95844d8907a'),(23,2,22,NULL,10,1,'2024-05-18 18:42:52','2024-05-18 18:42:52','f1597c49-d703-4204-b89f-31bd113e0353'),(24,1,22,NULL,12,1,'2024-05-18 18:42:52','2024-05-18 18:42:52','f2d79544-2fc6-42ea-9a78-503b635141d8'),(32,2,26,NULL,10,1,'2024-05-18 19:10:15','2024-05-18 19:10:15','9a4f094d-048e-486e-a19a-b2c4e34a0f25'),(33,5,26,NULL,25,1,'2024-05-18 19:10:15','2024-05-18 19:10:15','7eec8547-8bee-40ba-86cf-bd4b0206d3f1'),(35,5,15,NULL,25,1,'2024-05-18 19:12:28','2024-05-18 19:12:28','1ac6f7f1-84a0-4bfb-b1ec-7e7e6f270d7d'),(36,2,27,NULL,10,1,'2024-05-18 19:12:28','2024-05-18 19:12:28','f23a116d-708f-4cc3-82f6-c812c9bbcd42'),(37,5,27,NULL,25,1,'2024-05-18 19:12:28','2024-05-18 19:12:28','f67dbe6b-6999-4f64-9d52-a77c224fd85f'),(42,2,30,NULL,10,1,'2024-05-18 19:14:16','2024-05-18 19:14:16','8108b446-5c3d-411c-94f0-4be7a391c771'),(43,5,30,NULL,28,1,'2024-05-18 19:14:16','2024-05-18 19:14:16','9edc3271-8e2f-498d-bb16-52076d55b62c'),(46,2,32,NULL,10,1,'2024-05-18 19:15:36','2024-05-18 19:15:36','b820c642-3c0f-43b5-aa15-a0bb2152d5f3'),(50,2,34,NULL,10,1,'2024-05-18 19:43:49','2024-05-18 19:43:49','be31c465-bf72-40c4-9c2d-4863675a4ef3'),(51,5,34,NULL,33,1,'2024-05-18 19:43:49','2024-05-18 19:43:49','9eeb591a-c3a7-482c-87ad-a4fe7b649cb6'),(52,2,35,NULL,10,1,'2024-06-08 13:17:56','2024-06-08 13:17:56','ceb0cef5-530f-4d04-bb94-a42959cc557f'),(54,2,36,NULL,10,1,'2024-06-08 13:18:21','2024-06-08 13:18:21','8512bbed-9d0c-4ea9-baf1-304c7b29434b'),(55,5,36,NULL,33,1,'2024-06-08 13:18:21','2024-06-08 13:18:21','0c9a8bf5-b821-4fab-acc0-a3a24ec41e6b'),(58,2,38,NULL,10,1,'2024-06-08 13:19:02','2024-06-08 13:19:02','f4c6e8b5-78e6-48d0-834e-765d64722a79'),(59,5,38,NULL,33,1,'2024-06-08 13:19:02','2024-06-08 13:19:02','f9c61e2e-df0e-4aff-b233-9254964f7e73'),(60,2,39,NULL,10,1,'2024-06-08 14:18:03','2024-06-08 14:18:03','62a13d5d-a263-4adf-b581-09b3b749bba8'),(61,5,39,NULL,33,1,'2024-06-08 14:18:03','2024-06-08 14:18:03','121ac4a7-1283-4853-86e4-280578e52578'),(64,2,41,NULL,10,1,'2024-06-09 13:58:39','2024-06-09 13:58:39','bba33cd9-d150-4c1b-9e88-e810db01470d'),(65,5,41,NULL,33,1,'2024-06-09 13:58:39','2024-06-09 13:58:39','9dbdb167-2c2a-47f0-aaeb-18a4c1c73767'),(68,2,43,NULL,10,1,'2024-06-09 14:00:45','2024-06-09 14:00:45','ab89f6b2-a72e-4888-ae2d-b41d0025d76b'),(69,5,43,NULL,33,1,'2024-06-09 14:00:45','2024-06-09 14:00:45','b290a68f-6347-4238-8da8-99f37d0ba867'),(70,2,44,NULL,10,1,'2024-06-09 17:03:36','2024-06-09 17:03:36','0bfdc694-8443-43ff-8bfe-3247fccfb38b'),(71,5,44,NULL,33,1,'2024-06-09 17:03:41','2024-06-09 17:03:41','7aafe538-9d4b-4f46-bf76-18d3e8b48a3d'),(72,2,45,NULL,10,1,'2024-06-09 17:04:05','2024-06-09 17:04:05','51f9262a-c5ec-4ad5-a555-24e6cfb21844'),(73,5,45,NULL,33,1,'2024-06-09 17:04:05','2024-06-09 17:04:05','460ee2d0-a6ad-4829-82e5-499dd265d615'),(76,2,47,NULL,10,1,'2024-06-09 17:04:12','2024-06-09 17:04:12','797ae264-761b-45f2-85b1-e4de7971b3bf'),(77,5,47,NULL,33,1,'2024-06-09 17:04:12','2024-06-09 17:04:12','c4c10486-beee-473e-bb3e-41abd8c5680f'),(80,2,49,NULL,10,1,'2024-06-09 17:05:01','2024-06-09 17:05:01','2b637c7c-8d9e-4ddb-8005-7096bd176f2b'),(81,5,49,NULL,33,1,'2024-06-09 17:05:01','2024-06-09 17:05:01','52254c9f-f804-452c-ab52-a7181bae65c8'),(84,2,51,NULL,10,1,'2024-06-22 12:08:53','2024-06-22 12:08:53','a66e4c31-8f34-46ed-80b2-3c6842ac4577'),(85,5,51,NULL,33,1,'2024-06-22 12:08:53','2024-06-22 12:08:53','f360f3cc-4cb6-47d3-beb8-1958ac46021f'),(88,2,53,NULL,10,1,'2024-06-22 12:09:04','2024-06-22 12:09:04','3272262a-e84d-47aa-bb52-c69e1c0b234f'),(89,5,53,NULL,33,1,'2024-06-22 12:09:04','2024-06-22 12:09:04','1513770a-0936-4280-9924-0b709bc8003b'),(94,2,56,NULL,10,1,'2024-06-22 13:41:32','2024-06-22 13:41:32','f14235a2-7554-4e5d-9ec7-b90d9966f25f'),(95,5,56,NULL,54,1,'2024-06-22 13:41:32','2024-06-22 13:41:32','e1eba8a1-b34c-49a3-8d21-97af423f9a98'),(99,5,21,NULL,58,1,'2024-06-22 13:46:41','2024-06-22 13:46:41','0659eff6-39f6-4e0b-948c-8fc976a55c02'),(100,2,59,NULL,10,1,'2024-06-22 13:46:41','2024-06-22 13:46:41','194f4293-5609-4867-a66e-836ba7d02f82'),(101,5,59,NULL,58,1,'2024-06-22 13:46:41','2024-06-22 13:46:41','5f523365-ac71-4e05-b4d3-35f8a56098cb'),(105,1,21,NULL,60,1,'2024-06-22 13:57:22','2024-06-22 13:57:22','24e63de2-36d6-485e-bc51-efa207c8b835'),(106,2,62,NULL,10,1,'2024-06-22 13:57:22','2024-06-22 13:57:22','76f4f2f5-91b0-4dae-b556-a84df797ce47'),(107,5,62,NULL,58,1,'2024-06-22 13:57:22','2024-06-22 13:57:22','465785d3-5d4c-405b-bd9d-189ee75d43a5'),(108,1,62,NULL,60,1,'2024-06-22 13:57:22','2024-06-22 13:57:22','57a6411b-35b5-4d48-934b-09e1a6488782'),(112,5,35,NULL,64,1,'2024-06-22 13:59:50','2024-06-22 13:59:50','f2103ea1-8f06-4dad-ab63-60fe4d0a9e4b'),(113,2,65,NULL,10,1,'2024-06-22 13:59:50','2024-06-22 13:59:50','0dcbd82a-c854-4c85-940f-9d72f051cec1'),(114,5,65,NULL,64,1,'2024-06-22 13:59:50','2024-06-22 13:59:50','1d1f29da-e317-4f4b-a12b-cd87d3f2ad55'),(117,2,66,NULL,10,1,'2024-06-25 08:40:18','2024-06-25 08:40:18','696d518e-af6a-40f9-ac9d-54c9da79e6e5'),(118,1,66,NULL,12,1,'2024-06-25 08:40:18','2024-06-25 08:40:18','1780a365-2ccd-4dd7-98df-70e412fcb812'),(119,2,70,NULL,10,1,'2024-06-25 08:40:19','2024-06-25 08:40:19','4f57e336-8c73-40c7-b275-bfce79e56fe1'),(120,1,70,NULL,12,1,'2024-06-25 08:40:19','2024-06-25 08:40:19','565759f8-a52a-4a83-8648-adc3bb73c81e'),(123,2,72,NULL,10,1,'2024-06-26 20:17:02','2024-06-26 20:17:02','67ab5f04-dd4a-4056-871a-1ecb027b8ecc'),(124,5,72,NULL,64,1,'2024-06-26 20:17:02','2024-06-26 20:17:02','53597c02-3f3b-499f-9997-b2b3847c73c3'),(128,1,35,NULL,73,1,'2024-06-26 20:31:58','2024-06-26 20:31:58','4a97c383-3ee8-4466-96fc-5638c8767ba2'),(129,2,75,NULL,10,1,'2024-06-26 20:31:58','2024-06-26 20:31:58','61863a95-c73a-425d-9d6f-6a8491b4ae02'),(130,5,75,NULL,64,1,'2024-06-26 20:31:58','2024-06-26 20:31:58','81df1755-0478-47da-8bb0-088ade3009a9'),(131,1,75,NULL,73,1,'2024-06-26 20:31:58','2024-06-26 20:31:58','66b8d363-2ed4-4a78-a5d7-c13b7157e294'),(135,2,77,NULL,10,1,'2024-06-26 20:32:09','2024-06-26 20:32:09','a0ed2019-08be-4071-abec-b4b26cb8e3a3'),(136,5,77,NULL,64,1,'2024-06-26 20:32:09','2024-06-26 20:32:09','ea1b1010-6484-4be9-89bc-db80c13f09ee'),(137,1,77,NULL,73,1,'2024-06-26 20:32:09','2024-06-26 20:32:09','c6f1193c-9aae-451c-8b2c-63673affb8c0'),(142,2,80,NULL,10,1,'2024-06-26 20:33:19','2024-06-26 20:33:19','1013e727-c279-40ee-98d0-54765461951c'),(143,5,80,NULL,64,1,'2024-06-26 20:33:19','2024-06-26 20:33:19','2a600ae4-66fb-431d-82ab-02d2264461ac'),(144,1,80,NULL,73,1,'2024-06-26 20:33:19','2024-06-26 20:33:19','6ca6c904-52e2-4f90-86b8-00422ef5f270');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('13daa4bd','@pennebaker/architect/assetbundles/indexcpsection/dist'),('17fb6f43','@craft/web/assets/fields/dist'),('1cb31ce4','@craft/web/assets/admintable/dist'),('1ed59796','@craft/web/assets/admintable/dist'),('1f412c0a','@craft/web/assets/utilities/dist'),('258f680c','@craft/web/assets/fabric/dist'),('263ebce1','@vendor/yoo/craft-components/resources/dist'),('27d98d23','@craft/web/assets/garnish/dist'),('27e9e37e','@craft/web/assets/fabric/dist'),('33eeb098','@craft/web/assets/focalpoint/dist'),('3657cedc','@craft/web/assets/admintable/dist'),('3f793609','@craft/web/assets/fields/dist'),('45b314c0','@craft/web/assets/cp/dist'),('48143553','@craft/web/assets/conditionbuilder/dist'),('49f5d675','@craft/web/assets/recententries/dist'),('49fbb688','@craft/web/assets/selectize/dist'),('4a72be21','@craft/web/assets/conditionbuilder/dist'),('4b935d07','@craft/web/assets/recententries/dist'),('4eee0caa','@craft/web/assets/tailwindreset/dist'),('5100432c','@craft/web/assets/axios/dist'),('516ff16b','@root/plugins/project-extension/src/assetbundles/projectextension/dist'),('528eee08','@craft/web/assets/fieldsettings/dist'),('5366c85e','@craft/web/assets/axios/dist'),('549f29ae','@craft/redactor/assets/redactor/dist'),('54e73b3e','@craft/web/assets/iframeresizer/dist'),('5f863289','@craft/web/assets/d3/dist'),('5fcdcd51','@craft/web/assets/updateswidget/dist'),('61778f3f','@craft/web/assets/recententries/dist'),('6179efc2','@craft/web/assets/selectize/dist'),('622b9d2e','@craft/web/assets/installer/dist'),('62f0e76b','@craft/web/assets/conditionbuilder/dist'),('631f64b0','@craft/web/assets/selectize/dist'),('640ade92','@craft/web/assets/tailwindreset/dist'),('666c55e0','@craft/web/assets/tailwindreset/dist'),('68b4c960','@craft/web/assets/updater/dist'),('6d314d8a','@craft/web/assets/cp/dist'),('6f57c6f8','@craft/web/assets/cp/dist'),('75291f69','@craft/web/assets/updateswidget/dist'),('7562e0b1','@craft/web/assets/d3/dist'),('77046bc3','@craft/web/assets/d3/dist'),('774f941b','@craft/web/assets/updateswidget/dist'),('79821a66','@craft/web/assets/axios/dist'),('7a4ba69c','@vendor/yoo/craft-components/resources/dist'),('7c656274','@craft/web/assets/iframeresizer/dist'),('7e03e906','@craft/web/assets/iframeresizer/dist'),('80057060','@craft/web/assets/htmx/dist'),('8263fb12','@craft/web/assets/htmx/dist'),('845c455e','@craft/web/assets/prismjs/dist'),('8fd46637','@craft/web/assets/fileupload/dist'),('8fd4f19c','@craft/web/assets/edituser/dist'),('91afb09c','@craft/web/assets/jqueryui/dist'),('9210b7fc','@vendor/yoo/craft-components/resources/dist'),('94d3f2ef','@craft/web/assets/dashboard/dist'),('96b5799d','@craft/web/assets/dashboard/dist'),('9b48208a','@bower/jquery/dist'),('9ea83f62','@craft/web/assets/elementresizedetector/dist'),('a1fdc3bb','@craft/web/assets/matrixsettings/dist'),('a530b40f','@craft/web/assets/fileupload/dist'),('a7563f7d','@craft/web/assets/fileupload/dist'),('aae1a258','@craft/web/assets/htmx/dist'),('acde1c14','@craft/web/assets/prismjs/dist'),('afcb9481','@root/plugins/project-extension/src/assetbundles/projectextension/dist'),('b1acf2b2','@bower/jquery/dist'),('b3ca79c0','@bower/jquery/dist'),('b44ced5a','@craft/web/assets/elementresizedetector/dist'),('b62a6628','@craft/web/assets/elementresizedetector/dist'),('b92de9d6','@craft/web/assets/jqueryui/dist'),('b94302d3','@vendor/yoo/craft-components/resources/dist'),('b9d2e551','@root/plugins/project-extension/src/assetbundles/projectextension/dist'),('bb4b62a4','@craft/web/assets/jqueryui/dist'),('be3720d7','@craft/web/assets/dashboard/dist'),('c1930237','@craft/redactor/assets/field/dist'),('c3ed0285','@craft/web/assets/datepickeri18n/dist'),('c774061c','@craft/web/assets/feed/dist'),('c87189f5','@craft/web/assets/velocity/dist'),('cdb55420','@craft/web/assets/jquerytouchevents/dist'),('cde68b42','@craft/web/assets/jquerypayment/dist'),('d0e13ea4','@craft/web/assets/xregexp/dist'),('d0e36212','@craft/web/assets/craftsupport/dist'),('d285e960','@craft/web/assets/craftsupport/dist'),('d287b5d6','@craft/web/assets/xregexp/dist'),('d3d5f1b','@craft/web/assets/garnish/dist'),('d8e5d5df','@craft/web/assets/login/dist'),('d93f08d6','@craft/web/assets/picturefill/dist'),('da835ead','@craft/web/assets/login/dist'),('db5983a4','@craft/web/assets/picturefill/dist'),('dbdcaf87','@root/plugins/project-extension/src/assetbundles/projectextension/dist'),('dc09a1f1','@craft/web/assets/editsection/dist'),('dc5151ae','@craft/web/assets/vue/dist'),('de81ab7b','@nystudio107/seomatic/web/assets/dist'),('e0f3d0bf','@craft/web/assets/velocity/dist'),('e2955bcd','@craft/web/assets/velocity/dist'),('e5370d6a','@craft/web/assets/jquerytouchevents/dist'),('e564d208','@craft/web/assets/jquerypayment/dist'),('e702597a','@craft/web/assets/jquerypayment/dist'),('e7518618','@craft/web/assets/jquerytouchevents/dist'),('e909d0bd','@craft/web/assets/datepickeri18n/dist'),('eb6f5bcf','@craft/web/assets/datepickeri18n/dist'),('ed90d424','@craft/web/assets/feed/dist'),('eff65f56','@craft/web/assets/feed/dist'),('f0678c95','@craft/web/assets/login/dist'),('f1bd519c','@craft/web/assets/picturefill/dist'),('f48bf8bb','@craft/web/assets/editsection/dist'),('f4d308e4','@craft/web/assets/vue/dist'),('f5bd469','@craft/web/assets/garnish/dist'),('f6b58396','@craft/web/assets/vue/dist'),('f6bba34','@craft/web/assets/fabric/dist'),('f6ed73c9','@craft/web/assets/editsection/dist'),('f8613b58','@craft/web/assets/craftsupport/dist'),('fa05ec9c','@craft/web/assets/xregexp/dist'),('fecfa120','@craft/web/assets/timepicker/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cnydaljrhactzjvasoybysuheefbuwzspudf` (`canonicalId`,`num`),
  KEY `fk_qnptjiywilppxlyjppnvmedttawhyavyxznu` (`creatorId`),
  CONSTRAINT `fk_hcmpqcxdonvgyctlmayiyfxrxggeqwncohyy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnptjiywilppxlyjppnvmedttawhyavyxznu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,NULL),(5,2,1,5,NULL),(6,2,1,6,'Applied “Draft 1”'),(7,2,1,7,'Applied “Draft 1”'),(8,15,1,1,''),(9,15,1,2,'Applied “Draft 1”'),(10,15,1,3,'Applied “Draft 1”'),(11,21,1,1,''),(12,21,1,2,'Applied “Draft 1”'),(13,15,1,4,'Applied “Draft 1”'),(14,21,1,3,'Applied “Draft 1”'),(15,21,1,4,'Applied “Draft 1”'),(16,35,1,1,''),(17,21,1,5,'Applied “Draft 1”'),(18,21,1,6,''),(19,35,1,2,'Applied “Draft 1”'),(20,21,1,7,'Applied “Draft 1”'),(21,44,1,1,''),(22,44,1,2,'Applied “Draft 1”'),(23,35,1,3,'Applied “Draft 1”'),(24,21,1,8,'Applied “Draft 1”'),(25,44,1,3,'Applied “Draft 1”'),(26,21,1,9,'Applied “Draft 1”'),(27,21,1,10,'Applied “Draft 1”'),(28,21,1,11,'Applied “Draft 1”'),(29,35,1,4,'Applied “Draft 1”'),(30,66,1,1,NULL),(31,66,1,2,NULL),(32,66,1,3,'Applied “Draft 1”'),(33,35,1,5,'Applied “Draft 1”'),(34,35,1,6,'Applied “Draft 1”'),(35,35,1,7,'Applied “Draft 1”'),(36,35,1,8,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_beorcekldhhghcheegklcdilbjvggixrygeg` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev test yoo digital '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' homepage '),(2,'title',0,1,' homepage '),(7,'alt',0,1,''),(7,'extension',0,1,' jpg '),(7,'filename',0,1,' nmixx dash backgroung jpg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' nmixx dash backgroung '),(10,'alt',0,1,''),(10,'extension',0,1,' png '),(10,'filename',0,1,' logo trans png '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' spotify logo without text svg '),(12,'alt',0,1,''),(12,'extension',0,1,' png '),(12,'filename',0,1,' d58db7931b0d44f08d3a1dc92924d0c4 공홈 pc png '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' dash full hd quality '),(15,'slug',0,1,' about '),(15,'title',0,1,' about '),(21,'slug',0,1,' location '),(21,'title',0,1,' location '),(25,'alt',0,1,''),(25,'extension',0,1,' jpg '),(25,'filename',0,1,' 240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1 jpg '),(25,'kind',0,1,' image '),(25,'slug',0,1,''),(25,'title',0,1,' 240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1 '),(28,'alt',0,1,''),(28,'extension',0,1,' jpg '),(28,'filename',0,1,' 231128 nmixx 2nd ep fe3o4 break new banner logo v0 jdmg29jirw2c1 jpg '),(28,'kind',0,1,' image '),(28,'slug',0,1,''),(28,'title',0,1,' 231128 nmixx 2nd ep fe3o4 break new banner logo v0 jdmg29jirw2c1 '),(32,'slug',0,1,' about '),(32,'title',0,1,' about '),(33,'alt',0,1,''),(33,'extension',0,1,' png '),(33,'filename',0,1,' 240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1 png '),(33,'kind',0,1,' image '),(33,'slug',0,1,''),(33,'title',0,1,' 240102 nmixx 2nd ep fe3o4 break new banner logo v0 wb5sw75mtu9c1 '),(35,'slug',0,1,' impressum '),(35,'title',0,1,' impressum '),(44,'slug',0,1,' kontakt '),(44,'title',0,1,' kontakt '),(54,'alt',0,1,''),(54,'extension',0,1,' jpg '),(54,'filename',0,1,' blue orange disc jpg '),(54,'kind',0,1,' image '),(54,'slug',0,1,''),(54,'title',0,1,' blue orange disc '),(58,'alt',0,1,''),(58,'extension',0,1,' jpg '),(58,'filename',0,1,' seoul jpg '),(58,'kind',0,1,' image '),(58,'slug',0,1,''),(58,'title',0,1,' seoul '),(60,'alt',0,1,''),(60,'extension',0,1,' jpg '),(60,'filename',0,1,' pexels ethan brooke 1123775 10259522 jpg '),(60,'kind',0,1,' image '),(60,'slug',0,1,''),(60,'title',0,1,' pexels ethan brooke 1123775 10259522 '),(64,'alt',0,1,''),(64,'extension',0,1,' jpg '),(64,'filename',0,1,' impressum jpg '),(64,'kind',0,1,' image '),(64,'slug',0,1,''),(64,'title',0,1,' impressum '),(66,'slug',0,1,' album '),(66,'title',0,1,' album '),(73,'alt',0,1,''),(73,'extension',0,1,' jpg '),(73,'filename',0,1,' clean desk background jpg '),(73,'kind',0,1,' image '),(73,'slug',0,1,''),(73,'title',0,1,' clean desk background '),(79,'alt',0,1,''),(79,'extension',0,1,' jpg '),(79,'filename',0,1,' clean desk background 2024 06 26 203313 moks jpg '),(79,'kind',0,1,' image '),(79,'slug',0,1,''),(79,'title',0,1,' clean desk background ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jtbpocvyasiimmqxagekizmsqxhipdtuariy` (`handle`),
  KEY `idx_hozttcipwwangebyjsepoqeahubebaqgnozn` (`name`),
  KEY `idx_hcentqsrvyxkujmvrdoovuwkmfqdzsfwaiyx` (`structureId`),
  KEY `idx_hgibeicmknoqpjhcxayinaigyuoerfgokzbv` (`dateDeleted`),
  CONSTRAINT `fk_csajlnanfmcufjrdkwjvpvggozufwnojlcmf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'homepage','homepage','single',1,'all','end',NULL,'2024-04-26 12:33:44','2024-04-26 12:33:44',NULL,'e64fed43-43e3-4ef1-bd91-cba55dff1e11'),(2,1,'About','about','structure',1,'all','end',NULL,'2024-05-10 21:01:49','2024-05-10 21:01:49',NULL,'ba830877-e04b-4616-808c-6b8461b0b2e2'),(3,NULL,'Album','album','single',1,'all','end',NULL,'2024-06-25 08:39:02','2024-06-25 08:39:02',NULL,'1fb2a281-789b-47cd-bd5c-d568da249a35');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cfkjcsxcprswrrtihveaaxscgnlhnxkafvav` (`sectionId`,`siteId`),
  KEY `idx_lniubunghwkdiqjepvulmspdxbdbrlzuazcn` (`siteId`),
  CONSTRAINT `fk_scwvjhzoojrsyyzwznyknhwqnnrczuaikeeo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zuwjjvtutkofotiwkdmibdltrqxwrupbcvrk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','_entry-types/home/home.twig',1,'2024-04-26 12:33:44','2024-04-26 12:41:01','9d093b51-fd47-4e16-af12-1f242e5b34d7'),(2,2,1,1,'{parent.uri}/{slug}','_entry-types/About/about.twig',1,'2024-05-10 21:01:49','2024-05-10 21:01:49','46e4255e-99f7-4d93-8350-4a0bbe6f038b'),(3,3,1,1,'album','_entry-types/Album/album.twig',1,'2024-06-25 08:39:02','2024-06-25 08:39:02','0ac32738-7349-447c-88cc-b80f0c9b9ab1');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ktjhibnmdyddrmbdgqglgodnhrblixygtovq` (`uid`),
  KEY `idx_uajkwxxlzrkbeqpypcrpflbroxoihlmpsans` (`token`),
  KEY `idx_wfpslztmtktqzcetsrkjuebdowjczgyzttco` (`dateUpdated`),
  KEY `idx_ctzuchzhcuyhhewtiwbrosovutisstionfws` (`userId`),
  CONSTRAINT `fk_wjquwyplfnzjhiwelgibeaxssaudvzvumyoh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'gkmTg9fYdNxFWYnic1B2wBgknD7bxPa0p3odosbFQeX0N35VSmJ1TbGm_aQkRdnh2cUT8ant-Vo0mq9ZWlrfxz1Y91G8Lsnm-eIO','2024-04-26 12:27:06','2024-04-27 12:42:23','20e040b6-d647-41f3-847b-b12aa8cd14e4'),(2,1,'E84H7rkoAFGX-xhoLZZoCsf_ixmZCiSuWpG23_MbhtRsUIYF0O52CPfd3N8hUNwU34FW_A9L4rXE-SwkcRX2ZptpjpSgf6-MIMKk','2024-04-26 13:52:45','2024-04-26 14:13:05','0d978c74-3daa-4442-b4ef-a228048c439e'),(3,1,'W-objIts6Tr0xsXe9Hm6NZ7cW4SPAKJXyEX4zZWHpQPmj_QpkrijULKySTDP3ulq0UMkGRb4Xi-D0ihsRDPXGpP7A1uMFVtmVm8B','2024-04-27 12:42:23','2024-04-27 12:42:23','1a00338b-093f-4e23-ad00-c6f4668bf02d'),(5,1,'Hr5D-pnwx2cSX8wriUbwCT3Nt8q78XGu40N1A_gZgiO0ar8P-D_WFmRtKABq23OzIhAcJwBI9gBUFuRg4qosXQLBd9XnF_ImZM3U','2024-04-27 20:59:04','2024-04-27 21:09:57','c9c7c9ab-8aac-4f22-a7e4-6d4ee42a9b00'),(6,1,'L52yjKqchACMoMWCViMWOoaW6raHfE7CM-oEA1OJJpj7B8mdbGsGgEa5QVO7cQArBTbhdHZmPImF3-svh8hMnaZAiTpHcTjlSU4m','2024-04-27 21:09:57','2024-04-27 21:09:57','d9a9fa25-25af-4aee-b381-88ba4eec2395'),(7,1,'Z7bPfpPBQN349eD-YqjkRrBWuzPi9pUwkbKOdvyQdwNswb9gh3uFozK_jNLcvta3lX73w6--s7mqP_snTLLRCMlBwaGR5ppYxJCZ','2024-04-27 21:09:57','2024-05-03 08:58:22','07496db8-0c4d-4cc0-9609-d07a787e16e1'),(8,1,'JzwI1mv8-8sq4SqoswLGOrX6IbcKMEHHBsAPIULhw7oFqTwEX-zcrGtqXy1vWUu9ytG3IcjJphzh-pWHla_UB-Db7xFBITrRlAL8','2024-04-28 20:18:33','2024-04-28 21:10:23','e6969c02-292c-4f25-b951-5ab2ae91d06a'),(9,1,'QqvpaueQDyt4mGwS-mgZzQAnad092wfXtYcfks61LowZT4ys97NAN2wz9UxIX6Tlzk5uS5hpLLhA7hRqfoNh7Ri1dIH3Dkd2FIP6','2024-05-03 08:58:22','2024-05-03 11:56:53','4db3aaab-723a-4f95-b465-32c503733d47'),(10,1,'fKQWlpbYG4zR7RQwPpm4mUryXAhakw6tzaXR92JOGmWDpH6V0Ny4yvZvil6C_ZWNmH_4jk_sdYqwBQg5QXaYMaR8KBdcWOLFA-w5','2024-05-03 11:56:53','2024-05-03 13:21:42','161f5d65-9cf5-471b-be70-5db7240c3f9f'),(11,1,'7RDyeDIviAcfYQ-NrC4iH31CgMiUHbmAnODQrIt3Gg1WOg2N0QivycRuNhBnBstpkjBq68BBFtZFTqpN-agSrq-dyLBV1UhiGVk4','2024-05-08 10:07:11','2024-05-08 14:25:07','9f9de680-0e03-4250-afcf-dc6d648b79a9'),(12,1,'7zgBwK_2E8xheIJhR1UKbz5UhMsOt5k5GK3Q_bynx5cqZnZxxGrl91ko_F2aJuABDaaQDzxg01kPjK4_ZpP2EcfjubOMCOo2nurb','2024-05-09 19:04:58','2024-05-09 19:47:23','9fe46750-a988-408b-9e85-4029b8e0f0e9'),(13,1,'AXYYlLon_KKkASLpLJWM8dkc-de16egXNDEtw-7iiFtS3jJZ22wSyg9AqamzbR7dHYiKlB2wY1cpyoOkNWPQym_JuYv8XBSbRW2A','2024-05-09 19:47:23','2024-05-09 21:32:06','dcb175d5-4e8a-46ba-b85b-929e7bc6da82'),(15,1,'ICEucMmIkACb5bcH97b4R3C-BJdHSFa_mi4THm5QZbl7hPR3QsCGBOBMNETzZKtzdPmmnaQd5K5QyyAL2DzOunly6TJm_6WaTVgY','2024-05-18 17:22:54','2024-05-18 19:52:57','ccc536c8-c0d7-4bc2-8b14-0ed18df46162'),(16,1,'Cbf5EXtEySz67yO8_SwLtb_HNHL3V_AbVz7a3R5TKUC4KDQ_PHCLweYdXDfVQBnJAOTIHFGQ12qYweJF2OQug6z6gmWZoPqq-My-','2024-05-19 15:36:52','2024-05-19 15:41:04','f58206c5-c227-4df8-a51e-3d0155e3f1a7'),(17,1,'60ibYNHx8jINnaGzLS4vufQ6egQSxbC-DyCazPILPmCvOO3xZkwOAJq1w7nvps3mn8-WPKu7Jc4Fzn8xYkTLQdpFm9xZKzwYFiNj','2024-06-08 12:33:37','2024-06-08 14:29:04','57366cd9-6158-4182-bb6c-2a8e5b407c82'),(18,1,'b6ih9qOGoIc2kqBM5QKIEnHcOTPEXUgj9xY1h4dus5Jsrh_abtnV4d9v2oAmNAyr7GMeD-SQb9lOWF2sLfqQvFK2V20hKBpaFmog','2024-06-08 22:37:55','2024-06-09 13:37:59','104c312d-f6de-4f50-b701-47205ba695fd'),(19,1,'QAFaaki3WHSxLnGLjTVYFuvLckZF7qMqCxVey08siHVw5V71lxVViIqotB_-SBEkS68EYU930N4c5H2pbqY8uW9rEsYlUVaUZIQ5','2024-06-09 13:37:59','2024-06-09 20:24:17','3e83a9ad-cc3d-4708-91ef-006e73065215'),(20,1,'mJIBZolQHKvYF-Le2rAdBL6TWz9MSdTRuA0waXO-7V4WAzPWkw5EG48A_3Ctd9hfjdmivU7qO0fbwOz-VPXqg4W0CxWIO_TFftd2','2024-06-10 21:17:19','2024-06-10 22:09:10','3f496a2c-0847-44bd-850a-1eb414d4a0a4'),(21,1,'K3WZrSzHST0r5g8gWM7GWX5UUQbxq4gP2rh6ssfQ8Z0W7ZTjTdU90sA2sjGX0HOoQHfBtiPFXB_585F5G6gYSP6XP4V2vTV2mxJC','2024-06-22 12:05:41','2024-06-22 12:10:55','adefaf2c-8e1f-45f8-96ec-bfb9898a4a6f'),(22,1,'drdrr6pBWkMaE7u6yJunpxn6mbkcdQTnXF0-_FSiatnEhbiOmPgeE4K86u0PoOD_SYu057ppnlLndIYlFUC_Dz329bGPXzLtgIGX','2024-06-22 12:10:55','2024-06-22 14:00:51','c62c489c-5446-401d-a2e1-8f99a539e10f'),(23,1,'ahZMkIotPaterdLbJR1YeRoV6J4RlrMVmeepQ2Ijr9hgm3Rc4D4Sq78qGVkpPZQ2yyrE5SsI53EFki3HSotpuHJLAJOUEjO6q_tx','2024-06-22 13:41:07','2024-06-22 13:41:07','1b96d92c-30b9-42cd-8eea-719bb98f4819'),(24,1,'s6vos5xyEpe21P-Ft3bsNt60PP1mczpNy3a0s8feFe_sGDhe5dN28suHDaRYyfxEURcqabe1_YI_oV4ElGze4nN8BP_icKDpAJ7g','2024-06-25 08:37:48','2024-06-25 10:41:15','adc8219b-17a7-411b-957c-eb0f7a6dc162'),(25,1,'SOURuuXxycnAzBgqttzWTvgglmWQMh4w8U9qldH60Kc3hRazVQDIn4ICk_lk9zH7ouJ3ld2wZ1CC3LO33-dsYZQjAbEWQ5t9Zqhf','2024-06-26 20:16:50','2024-06-26 20:39:47','b9623870-4781-4905-a21e-3d2be3d24453');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nyjbzudyvlmwzbgtxurzvxmqkhomwcgupjga` (`userId`,`message`),
  CONSTRAINT `fk_cwuhhqnsbpnvdjmmonxviqqanitgjigzbpxu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cnstddnmragynhlkbkptocmogmwgdzroujgl` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'293-m-project','2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,'58e5330c-b0ef-43ce-bc09-04944358f3ee');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kbtoodftzqqeswgedjywsxxmbwudnmhspvor` (`dateDeleted`),
  KEY `idx_kzepylgihfduxsjczkawkfdlowlndumkvehs` (`handle`),
  KEY `idx_zyawsdxjearkenhvbmsllxridyhwmphbjzvv` (`sortOrder`),
  KEY `fk_phvozgthhiodygclfuvajiiflezbykmltbpl` (`groupId`),
  CONSTRAINT `fk_phvozgthhiodygclfuvajiiflezbykmltbpl` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'true','293-m-project','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,'0223b707-3c9a-486e-8d9f-4e0a9b65b004');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_duxjlrhqbervuxafbxcqfmsgizvpxensyoyt` (`structureId`,`elementId`),
  KEY `idx_cugonhavninsviaktzujujregerjqgpsendd` (`root`),
  KEY `idx_yvqerelywplcdllqdgfggayfesrkggietbao` (`lft`),
  KEY `idx_moaobhkibxstpediwtgtmzpfczkzrzwwfxmi` (`rgt`),
  KEY `idx_knkzfvdbqhptisiydzgammddbivvbnzniatj` (`level`),
  KEY `idx_qzrgqnmykcexygyjxusioggbnncxfoxyrlds` (`elementId`),
  CONSTRAINT `fk_zvwpteczfucrxkqpulcocaurgjfoqinrohos` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,10,0,'2024-05-18 18:36:47','2024-06-09 17:04:12','ddb9bb29-364f-4be0-8d24-942a22c117ac'),(2,1,15,1,2,9,1,'2024-05-18 18:36:47','2024-06-09 17:04:12','cd60ab9d-d597-479b-9913-88ad640391e6'),(3,1,21,1,3,4,2,'2024-05-18 18:42:17','2024-05-18 18:42:32','ea1a7c5d-dc0b-4c78-a8db-3831e4d78a95'),(4,1,35,1,5,6,2,'2024-06-08 13:17:29','2024-06-08 13:17:38','f5af8c96-3c82-4a9d-8aef-51d45e89c1a4'),(5,1,44,1,7,8,2,'2024-06-09 17:03:29','2024-06-09 17:04:12','26dc8d42-27e6-4945-8f1b-a6691d3e3f8d');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rvewooklypckbrjquhywhygoujjpofrhhlxw` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,NULL,'2024-05-10 21:01:49','2024-05-10 21:01:49',NULL,'2029c043-b99e-4531-bd1c-62d12eba4709');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supertableblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_drtifgufungtdxxeqnempzuiaompjnbqzzod` (`primaryOwnerId`),
  KEY `idx_ktfutmvucskuaajbrbrnrqzhsjlgvfxuwbig` (`fieldId`),
  KEY `idx_mcouzainuqoeohdegvyviiujxkfgdywwlces` (`typeId`),
  CONSTRAINT `fk_luvldajzasrkeboqutctltzuoqumyplulpll` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mvzzkolobgfnmtykeozcnllgzwuvkflsnhai` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnpxbkhftqfykssmjwkyguqiovnrwvrqzffo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stinygeiepburfivjstdwrijuflnqefdgnnv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supertableblocks_owners`
--

DROP TABLE IF EXISTS `supertableblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supertableblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_fhrxfeeqonvuvjhnudfegokbjcflexrbdajk` (`ownerId`),
  CONSTRAINT `fk_fhrxfeeqonvuvjhnudfegokbjcflexrbdajk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdmfpziekudljvlbdalumisstfacizfymlms` FOREIGN KEY (`blockId`) REFERENCES `supertableblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supertableblocks_owners`
--

LOCK TABLES `supertableblocks_owners` WRITE;
/*!40000 ALTER TABLE `supertableblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `supertableblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supertableblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wstdxeeqxjndjdxtpmjixfqzpfbepdcoblhj` (`fieldId`),
  KEY `idx_odhgdakojqqkgkqscgcugtdcrfeoxfzctifw` (`fieldLayoutId`),
  CONSTRAINT `fk_ezkzdtonovwtxskwhvnmcvnzltaddpjgqkqi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tzbfliwdeoszyglyongkgjxyhwgibdgykzrv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_osqiicuatgyursaijayuxllosbennrqjsxsp` (`key`,`language`),
  KEY `idx_ulrjrxrigfxolikxbgeezhyccfqxbcxcxohr` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kcjvyigzsscfemjqwbccvaycsbwmvmecaoge` (`name`),
  KEY `idx_urerhfaidihpnyrfannpduyejfyheimbtobx` (`handle`),
  KEY `idx_lbcpzdltdmmrjodzkutqupqouacrqtlxivop` (`dateDeleted`),
  KEY `fk_uaqoonebmidnooujvzefqlycetxhcdifqdsc` (`fieldLayoutId`),
  CONSTRAINT `fk_uaqoonebmidnooujvzefqlycetxhcdifqdsc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_htrlviztwzevfstshzaszifinqksdecqijxs` (`groupId`),
  CONSTRAINT `fk_lkpnhriqnqifdlwcthilydeofsoamshhqqfy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_narwvyhvgqepundpayjlafvegpbqfilyjhsy` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tcsynqfusxokafwgzrjivsndqytrskcsebtf` (`token`),
  KEY `idx_mnjpcemqpyspviuvjbzszqtilnvmhnffbwgc` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bqxypgvohtiahnzqsfaiwsqtebjhojrnmnnt` (`handle`),
  KEY `idx_jmslrvbrkxqytkpsfcwstgpfyyxzgbcrmpwd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dshybsnorpttxqeqvabujpkinpqwxwmyhvjf` (`groupId`,`userId`),
  KEY `idx_cxpnmxmzkjboxnxsdhdaeraghwmttjqmtigf` (`userId`),
  CONSTRAINT `fk_farvzivqvrzytpalddwasmmeftinlbjyiyhh` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wjupkkvwpczygqogjxzavitchjagugoxdupq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_byxndbybafnjjdayogxpsmuixrfrbpxlzlor` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgkidfrpuwcfprrrqnrzugfqtyvztekiacrl` (`permissionId`,`groupId`),
  KEY `idx_vmspmaulyheibiuhlrwpezlpmekbubaxsrfk` (`groupId`),
  CONSTRAINT `fk_mjakmcrmqqlnnffgykgenhiniayyrfptqdtf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_twlneqsmnibiwntwmfiszlwdbqenzwbvhtrz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kmienquxopoqjlmlxokzryrncipwsmbzzslw` (`permissionId`,`userId`),
  KEY `idx_ajsbtqguhxunwsuqwlhqcftksofvuqbmnogg` (`userId`),
  CONSTRAINT `fk_knoqcurthubwmcckqabiqbnjfudjsqebcwmr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vbrudbnnxijyogblfgridzelnqaxbnjeoxgh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_zbitkvwfczhecmwgtxqoonxpqexlkpokfdup` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_biqsooihutxxduombmgjabhzhxpdbqslwoia` (`active`),
  KEY `idx_wphylyidpsfqjempwldgslpraljjmkmkwreg` (`locked`),
  KEY `idx_uxocxvpwsrvqfnwmoavfmoyyazegqpomlqbu` (`pending`),
  KEY `idx_jgvvuieqwzlhpplsvyxduketamlhjvtqpyjr` (`suspended`),
  KEY `idx_zsrwyuswsaccofgixztdoetzquwyscbsikgi` (`verificationCode`),
  KEY `idx_uebsqcqkfqtjacnttkdgwhfmadzddlkqtskm` (`email`),
  KEY `idx_cmezuujvbxlkfwjeamceyqgidzyhkzemezdu` (`username`),
  KEY `fk_qutkayctablkbanxqlebgdqvysmezscdnbod` (`photoId`),
  CONSTRAINT `fk_qutkayctablkbanxqlebgdqvysmezscdnbod` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_unmefegbhimxamrvpbqgdysdhdxkgnsywwrq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'dev-test@yoo.digital','$2y$13$/cg2CAO3.W8KkdFBdi3MreueK6.VUVozoPtny1x9rIfc0zzU679j2','2024-06-26 20:16:50',NULL,NULL,NULL,'2024-04-26 12:26:55',NULL,1,'$2y$13$WK9ijLk7I5IopStuCAv/wO5gjPWl5D6ODcAlv50l3LvCzk49tZMF.','2024-06-22 12:05:34',NULL,0,'2024-04-26 12:08:10','2024-04-26 12:08:10','2024-06-26 20:16:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_airxsmgbvtpptquxquerdjgvfvckqynbbtom` (`name`,`parentId`,`volumeId`),
  KEY `idx_ehmlpzdugmzdewbtmxuharumwlruhtznquqy` (`parentId`),
  KEY `idx_gftpguxfbnovujwshklrzecwsxllzkxgecrc` (`volumeId`),
  CONSTRAINT `fk_oquixckvyefqxfbrkwdmrisurxzppwkkyekt` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qcpcwpgrkajcifbmidfpxfquysiipmbeqsef` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Background Image','','2024-05-08 11:48:41','2024-05-08 11:48:41','5b6a9721-6614-4b99-96b2-0bc39fc2d29c'),(2,NULL,NULL,'Temporary filesystem',NULL,'2024-05-08 11:50:58','2024-05-08 11:50:58','4fa66ecb-368c-43ac-8fa3-fb44b9611761'),(3,2,NULL,'user_1','user_1/','2024-05-08 11:50:58','2024-05-08 11:50:58','903fa967-203d-4ca8-bcb1-3fdb7039b240'),(4,NULL,2,'Logo','','2024-05-08 12:03:34','2024-05-08 12:03:34','3774393a-67c7-4300-a004-803a9b2c6ad1');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cswaaedvwyolvbuuffhazwbqqtdnpmodrsls` (`name`),
  KEY `idx_mpmheunpybdzafalsmjlzkkhrqwuieilusdp` (`handle`),
  KEY `idx_rtdbknvztgturlumgamdvslcrostrtnrcquj` (`fieldLayoutId`),
  KEY `idx_ltnasbzmvshxlilelmjemskvovagqgsqlgha` (`dateDeleted`),
  CONSTRAINT `fk_mcniyfofnghbjkwcdfrdjqasttlutxwiaeod` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Background Image','backgroundImage','backgroundImage','','','site',NULL,1,'2024-05-08 11:48:41','2024-05-08 11:48:41',NULL,'651cb76d-e620-419f-9030-4a6c45f86ed3'),(2,3,'Logo','logo','logo','','','site',NULL,2,'2024-05-08 12:03:34','2024-05-08 12:03:34',NULL,'f8041b4b-1238-4323-a5c5-ee22373ce456');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mekjaqdkorthhwfkyasjxoldhatzffcqscqd` (`userId`),
  CONSTRAINT `fk_krwxpjpwhjynldgdnxdlmxkxqzfsqbzrwzus` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-04-26 12:27:06','2024-04-26 12:27:06','03315026-df6d-48fe-a249-cd0ba5bd88a3'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-04-26 12:27:06','2024-04-26 12:27:06','6dbad4b3-bfcc-4c3b-8110-8fd89f1dc853'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-04-26 12:27:06','2024-04-26 12:27:06','f84e0fd8-3965-46a0-a65e-6575cc4d1b1e'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-04-26 12:27:06','2024-04-26 12:27:06','27efea44-beac-4af9-b4b7-beb917a3f668');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-26 20:40:30
