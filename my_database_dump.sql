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
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ynqeqzgbpnxuqkginyhbgygmgsttnptwjdci` (`elementId`,`siteId`),
  KEY `idx_qcpdeosibzkainujnomvzvbsgmnvoskbzppv` (`siteId`),
  KEY `idx_sypulvjgydczrvkihvjixwaghptblmtilokw` (`title`),
  CONSTRAINT `fk_dhwbhczdpjinxotrmerxhaiiwrxauysnizvr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebjbfeijtvhacztmlolflulwaiuxpmxqhnvn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2024-04-26 12:08:10','2024-04-26 12:08:10','d906e322-35d3-44da-a84b-0ae68133fa46'),(2,2,1,'homepage','2024-04-26 12:33:45','2024-04-26 12:41:02','d2827543-1c40-430a-aea0-edd8f5d773b6'),(3,3,1,'homepage','2024-04-26 12:33:45','2024-04-26 12:33:45','0dbe07c3-176c-4db7-85fc-cd14b9de7cca'),(4,4,1,'homepage','2024-04-26 12:41:01','2024-04-26 12:41:01','beca95e9-7e32-463f-bcc9-e454232498bc'),(5,5,1,'homepage','2024-04-26 12:41:02','2024-04-26 12:41:02','5a636bd7-fc73-4bd6-984e-67990b1575aa');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,NULL,'19f0aa9a-9f03-4a80-b0dd-95b7ae181112'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:33:45','2024-04-26 12:41:02',NULL,NULL,'eec88c3d-2da5-4636-8b48-51acb096583a'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,NULL,'af727021-4030-4a89-a203-57821fc474fa'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:41:01','2024-04-26 12:41:01',NULL,NULL,'b165256c-657a-42e5-85e3-515b8a45e979'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-04-26 12:41:02','2024-04-26 12:41:02',NULL,NULL,'9dc63517-d4c3-46d3-b4ea-53a44eb16bc3');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2024-04-26 12:08:10','2024-04-26 12:08:10','cc75f60f-0049-41f5-87cf-38132f330923'),(2,2,1,'homepage','__home__',1,'2024-04-26 12:33:45','2024-04-26 12:33:45','31aa09fd-b208-4d94-8c35-24f9b9d5b2cd'),(3,3,1,'homepage','__home__',1,'2024-04-26 12:33:45','2024-04-26 12:33:45','cf73caf3-145f-41db-8561-12cfd1077e8a'),(4,4,1,'homepage','__home__',1,'2024-04-26 12:41:01','2024-04-26 12:41:01','46f671f6-9977-4a49-bd26-ce7035f1e839'),(5,5,1,'homepage','__home__',1,'2024-04-26 12:41:02','2024-04-26 12:41:02','a3e55185-0318-454a-8769-fca35e9b4b2b');
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
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:33:45','2024-04-26 12:33:45'),(3,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:33:45','2024-04-26 12:33:45'),(4,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:41:01','2024-04-26 12:41:01'),(5,1,NULL,1,NULL,'2024-04-26 12:33:00',NULL,NULL,'2024-04-26 12:41:02','2024-04-26 12:41:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,'44b1b133-2a7f-410d-a791-d08d689ced20');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-04-26 12:08:10','2024-04-26 12:08:10',NULL,'f3796036-0ba8-4173-b40f-873b81ef93c2');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-04-26 12:33:45','2024-04-26 12:33:45',NULL,'68c6df2a-b2d9-423b-b89d-75e056fb6a4b');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"819cafad-bdbd-488e-aae8-4cfd22568003\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-04-26 12:33:45','2024-04-26 12:33:45','bf334499-f8ea-47d6-83f9-c6e0b2bf9613');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
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
INSERT INTO `info` VALUES (1,'4.8.10','4.5.3.0',0,'wkvuulwpoasj','3@jnbymcmwoh','2024-04-26 12:08:10','2024-04-26 12:41:02','3b8ae655-5914-4b93-8af1-267528af7272');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','5d328b1b-0707-4353-9fe7-db6dbdba8421'),(2,'craft','m210121_145800_asset_indexing_changes','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','9e06fa03-d50f-4339-9887-a738922572b6'),(3,'craft','m210624_222934_drop_deprecated_tables','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','4379be83-864b-46d1-ae85-2f77082d2e6f'),(4,'craft','m210724_180756_rename_source_cols','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','2e6da205-4291-4c4e-95be-8a28a06547ae'),(5,'craft','m210809_124211_remove_superfluous_uids','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','d0b1f264-ef94-4d4f-bfb9-fd6ebd327b70'),(6,'craft','m210817_014201_universal_users','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','03b4fe27-a690-4ed5-91d6-12009c3e74a4'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','8f80032f-10a3-4db1-9ade-1725b5a20dad'),(8,'craft','m211115_135500_image_transformers','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','774aceba-f089-456d-b0a1-58c3f246a0f1'),(9,'craft','m211201_131000_filesystems','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','eac78cda-8c5b-4d67-a69d-969e9da6a2f0'),(10,'craft','m220103_043103_tab_conditions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','dc0f17d2-d5e5-4989-8b13-fe1278171b22'),(11,'craft','m220104_003433_asset_alt_text','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','767fc0bc-9a6f-45c5-8610-22b57e0b07ca'),(12,'craft','m220123_213619_update_permissions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3f20e52b-822d-4a14-a6c0-f08b5de5a069'),(13,'craft','m220126_003432_addresses','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3178f8ab-2865-4988-9d83-dc77d6813441'),(14,'craft','m220209_095604_add_indexes','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','461e1a76-932f-4b04-98a7-d0ff8f51b684'),(15,'craft','m220213_015220_matrixblocks_owners_table','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','7e5fb189-077b-4983-be3c-4544ad408def'),(16,'craft','m220214_000000_truncate_sessions','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','51681b54-dff8-4476-802a-58600c53b750'),(17,'craft','m220222_122159_full_names','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','a84fc30d-ce71-46b0-9661-c86cd87afaf1'),(18,'craft','m220223_180559_nullable_address_owner','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','42258c4c-1b9b-402e-97aa-96beb7ed578d'),(19,'craft','m220225_165000_transform_filesystems','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','7fb922d2-6842-4684-b34a-e3f4b697bfe4'),(20,'craft','m220309_152006_rename_field_layout_elements','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','a5d61c4c-b57a-4cf0-941c-97e63e8b7f85'),(21,'craft','m220314_211928_field_layout_element_uids','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','09f600b9-8d3d-4295-a00f-098df7a1cc73'),(22,'craft','m220316_123800_transform_fs_subpath','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','6a77bc7c-5196-4e70-9e6c-681c3450d085'),(23,'craft','m220317_174250_release_all_jobs','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','44e3a521-2d73-47ea-a61f-deedcb916b54'),(24,'craft','m220330_150000_add_site_gql_schema_components','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','f587e448-baba-4082-8f49-ab4a86028a3a'),(25,'craft','m220413_024536_site_enabled_string','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','bb051f75-d5f2-4788-9ead-aebbfa4cc59e'),(26,'craft','m221027_160703_add_image_transform_fill','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','077b4d9d-fe9e-4e25-a009-3cc67cae9232'),(27,'craft','m221028_130548_add_canonical_id_index','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','8147ac9f-3d24-4e80-ba1e-3e19f144e566'),(28,'craft','m221118_003031_drop_element_fks','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','20487e39-fae2-4167-a73c-293ab65af48f'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','51469bc9-a261-48ae-bfc4-e8310ed4b88a'),(30,'craft','m230226_013114_drop_plugin_license_columns','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','384ead00-b161-4f44-8d21-36fdf11466e9'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','90e67130-923f-4666-9825-4ff7b7b66166'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','3b91d352-8749-477b-b42c-ea02305a599b'),(33,'craft','m230710_162700_element_activity','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','dc0b91ce-7013-4a55-8027-9e1ec36b2102'),(34,'craft','m230820_162023_fix_cache_id_type','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','93b6eea9-a650-42a5-a58b-e0fb21fb00e3'),(35,'craft','m230826_094050_fix_session_id_type','2024-04-26 12:08:10','2024-04-26 12:08:10','2024-04-26 12:08:10','4d46295e-2e53-400a-9c7e-58df15a0b636'),(36,'plugin:project-extension','Install','2024-04-26 12:08:18','2024-04-26 12:08:18','2024-04-26 12:08:18','1cbf0a40-1e39-46ac-a248-1badc309e084'),(37,'plugin:redactor','m180430_204710_remove_old_plugins','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','8b2a2bbe-8b4a-4181-bb48-51b947721f8a'),(38,'plugin:redactor','Install','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','bad00462-dcf6-4533-9927-db911aafcd0d'),(39,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2024-04-26 12:08:34','2024-04-26 12:08:34','2024-04-26 12:08:34','514970a4-92e1-4ac6-8d33-623228e18c5b'),(40,'plugin:seomatic','Install','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','e42fdc5c-e8bd-45c7-b105-7a97a23e37b8'),(41,'plugin:seomatic','m180314_002755_field_type','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','5a1207b1-779c-4e72-9650-1325f1e03f64'),(42,'plugin:seomatic','m180314_002756_base_install','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','f5213c4f-5882-4860-8376-fb3ace27ee7b'),(43,'plugin:seomatic','m180502_202319_remove_field_metabundles','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','cfa7052a-77cc-42c1-b020-7d3fc25eb09e'),(44,'plugin:seomatic','m180711_024947_commerce_products','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','1dddc77e-80bb-48cc-a832-271ccd5c7606'),(45,'plugin:seomatic','m190401_220828_longer_handles','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','96c7607e-2c7c-44c8-a682-e89cdbceb21e'),(46,'plugin:seomatic','m190518_030221_calendar_events','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','00a28572-a5a8-4d48-b619-a162c99c2fcf'),(47,'plugin:seomatic','m200419_203444_add_type_id','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','e4e6544d-8666-4931-bf05-01c3386ca096'),(48,'plugin:seomatic','m210603_213100_add_gql_schema_components','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','43a49559-88af-4ef5-ad57-781f2c890f81'),(49,'plugin:seomatic','m210817_230853_announcement_v3_4','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','f1f9f4c4-741b-4c29-b63b-e7318044d8ae'),(50,'plugin:seomatic','m230601_184259_announcement_google_ua_deprecated','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','a6cf84c2-052e-4c7b-8e84-2733d33548bd'),(51,'plugin:neo','Install','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','5c325054-3307-4e30-890a-44ae9544ead5'),(52,'plugin:neo','m220409_142203_neoblocks_owners_table','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','1ce2b5f6-2554-4212-8034-e994532e75f3'),(53,'plugin:neo','m220411_111523_remove_ownersiteid_and_uid_neoblocks_columns','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','bedf15fa-45c6-4862-9d66-4b01408bf0d8'),(54,'plugin:neo','m220412_135950_neoblockstructures_rename_ownersiteid_to_siteid','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','7bb8dd73-8873-4cf3-a96d-50cf786f32db'),(55,'plugin:neo','m220421_105948_resave_shared_field_layouts','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','249b4760-f24f-4168-9808-7b708b390067'),(56,'plugin:neo','m220428_060316_add_group_dropdown_setting','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','27d2a5dc-543b-4896-923a-d0c913fd387d'),(57,'plugin:neo','m220511_054742_delete_converted_field_block_types_and_groups','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','cb6fcdea-493f-4cf6-91e4-9ccf949a926f'),(58,'plugin:neo','m220516_124013_add_blocktype_description','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','0190c44b-d46c-488f-b2bd-cbec176c2a69'),(59,'plugin:neo','m220723_153601_add_conditions_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','a1999582-ff97-4546-97f4-d972513a3257'),(60,'plugin:neo','m220731_130608_add_min_child_blocks_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','bc9e0c3b-2fb1-4617-87de-bc653121e520'),(61,'plugin:neo','m220805_072702_add_min_blocks_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','a066dfc0-6b62-4950-bf0b-7e942444babd'),(62,'plugin:neo','m220805_112335_add_min_sibling_blocks_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','cc5e32d3-4e8b-42ac-915f-244fd45098fb'),(63,'plugin:neo','m220812_115137_add_enabled_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','1fb1e087-9d00-41c0-9dd6-34853d056179'),(64,'plugin:neo','m221006_052456_add_group_child_block_types_column_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','b0607553-af2f-4882-a8eb-282abdbb617e'),(65,'plugin:neo','m221110_132322_add_ignore_permissions_to_block_types','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','8148a41e-2cdf-4e90-8757-098fa09f0b78'),(66,'plugin:neo','m221231_110307_add_block_type_icon_property','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','4b1b1fda-1c06-4011-9c83-230020314693'),(67,'plugin:neo','m230202_000653_convert_project_config_icon_data','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','cd124a91-cfb7-4150-babc-ac29fe904b51'),(68,'plugin:neo','m231005_132818_add_block_type_icon_filename_property','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','25e3adc6-f536-4e73-b530-d29e36634020'),(69,'plugin:neo','m231027_012155_project_config_sort_orders','2024-04-26 12:08:55','2024-04-26 12:08:55','2024-04-26 12:08:55','5938bd2a-5192-4d24-9315-0ff9b2745867'),(70,'plugin:super-table','Install','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','ffc56303-8af4-4c6e-aca9-39f090269a04'),(71,'plugin:super-table','m220308_000000_remove_superfluous_uids','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','0e79403f-4bf5-4199-97ba-fbbb89f92130'),(72,'plugin:super-table','m220308_100000_owners_table','2024-04-26 12:09:15','2024-04-26 12:09:15','2024-04-26 12:09:15','04519f5e-9c98-4d3f-82dd-de28b0a10401');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neoblocks`
--

DROP TABLE IF EXISTS `neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lvlpnjqxicxxhtscdhwvjnibieqcarhnifmu` (`primaryOwnerId`),
  KEY `idx_foavudkukwooieadveympjegpkdvblshglel` (`fieldId`),
  KEY `idx_ndybcryozhankkijobhzccqikeacmqiztcrc` (`typeId`),
  CONSTRAINT `fk_awzzntqihnmrmzoumtkvthhasghjmluvfbhi` FOREIGN KEY (`typeId`) REFERENCES `neoblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bkshdeojkvdvpvrmjowavvaedbrgtjnlbdqo` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fzzpivrnlozicpimpullottenxlrmtsbgqqa` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkqlamoyhgflexentfevseywwnqairbmqkpj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neoblocks_owners`
--

DROP TABLE IF EXISTS `neoblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_javzxpdsblhatvigdlwnofdjsiitmibfckjq` (`ownerId`),
  CONSTRAINT `fk_javzxpdsblhatvigdlwnofdjsiitmibfckjq` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jwotnhucyqprhzzjerwulizofclhqwdcbybp` FOREIGN KEY (`blockId`) REFERENCES `neoblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neoblocks_owners`
--

LOCK TABLES `neoblocks_owners` WRITE;
/*!40000 ALTER TABLE `neoblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `neoblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neoblockstructures`
--

DROP TABLE IF EXISTS `neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblockstructures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `ownerId` int NOT NULL,
  `siteId` int DEFAULT NULL,
  `fieldId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_czbchomfnywmfjdvihhupveobpffqsumltsl` (`structureId`),
  KEY `idx_eefhizwmjmdwlgqywonryqdxoulfucghtfai` (`ownerId`),
  KEY `idx_eplgijghurmvkdnmwnpvpcxtfbrzasfgiozm` (`siteId`),
  KEY `idx_rbvlordqrrldhyoryjyacbvellclohawovzv` (`fieldId`),
  CONSTRAINT `fk_barxnruwazmomkgqdhiwsrjoewhwpnbkucuu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mmnrbnihzjzjhxtlsxqlqofzvtoutaahhbya` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgcyfspcphllmoeqplhfauptipdtyprqmsqa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyovucxnmxphzoxukdecbsbnjatntojsaojd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neoblocktypegroups`
--

DROP TABLE IF EXISTS `neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocktypegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `alwaysShowDropdown` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qhzxhmqboulwuutzmbdjxoiwyuuhhdiagqtr` (`name`,`fieldId`),
  KEY `idx_vvgprycjrdhppuotbtgztgdccuzenoijcvth` (`fieldId`),
  CONSTRAINT `fk_klzfffernxdebriqrvugzofdaysgazhunivm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neoblocktypes`
--

DROP TABLE IF EXISTS `neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `iconFilename` varchar(255) DEFAULT NULL,
  `iconId` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `minBlocks` smallint unsigned DEFAULT '0',
  `maxBlocks` smallint unsigned DEFAULT NULL,
  `minSiblingBlocks` smallint unsigned DEFAULT '0',
  `maxSiblingBlocks` smallint unsigned DEFAULT '0',
  `minChildBlocks` smallint unsigned DEFAULT '0',
  `maxChildBlocks` smallint unsigned DEFAULT NULL,
  `groupChildBlockTypes` tinyint(1) NOT NULL DEFAULT '1',
  `childBlocks` text,
  `topLevel` tinyint(1) NOT NULL DEFAULT '1',
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `conditions` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_anipudbwsjhbvpcmsuitzkmqmwpawnzckchm` (`handle`,`fieldId`),
  KEY `idx_bvgxjhpxsgoaakhxmwfbvyagggdsxuoltyxf` (`name`,`fieldId`),
  KEY `idx_jjprtzatmitetiktlqbamynebbvzbifkfgpo` (`fieldId`),
  KEY `idx_aebhitxmpkspqvibpwqmjyobegrijpmhutti` (`fieldLayoutId`),
  KEY `idx_gdzkhrfmgxanoktengwxrjngnfhdsjbcrqgd` (`groupId`),
  KEY `fk_evflwkbgjfudyuccbvleorougoxcxnnatpsw` (`iconId`),
  CONSTRAINT `fk_evflwkbgjfudyuccbvleorougoxcxnnatpsw` FOREIGN KEY (`iconId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_urihjkilwpzsspmrdoeaqigofjsvhhldsbys` FOREIGN KEY (`groupId`) REFERENCES `neoblocktypegroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wzzxtvnzwskletiofvninpzbhxowadovdnyg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xgibgotpjmihkbmimrjvvzpdukyygxyaiicp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
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
INSERT INTO `plugins` VALUES (1,'project-extension','1.0.1','1.0.0','2024-04-26 12:08:18','2024-04-26 12:08:18','2024-04-26 12:08:18','c7cb9997-4919-45d5-98ea-6ab5560f169e'),(2,'contact-form','3.1.0','1.0.0','2024-04-26 12:08:23','2024-04-26 12:08:23','2024-04-26 12:08:23','783eab51-10c5-4d83-97d8-08f5177e8de9'),(3,'contact-form-honeypot','2.1.0','1.0.0','2024-04-26 12:08:28','2024-04-26 12:08:28','2024-04-26 12:08:28','3da3ff6c-6fe2-43a5-af4d-48c0dbf76fed'),(4,'redactor','3.0.4','2.3.0','2024-04-26 12:08:33','2024-04-26 12:08:33','2024-04-26 12:08:33','b099b69e-8ee7-432c-91f2-6ee652f807fc'),(5,'seomatic','4.0.48','3.0.12','2024-04-26 12:08:44','2024-04-26 12:08:44','2024-04-26 12:08:44','1585b68f-82ec-4e6e-9ef6-842792a31248'),(6,'neo','4.1.2','4.0.0','2024-04-26 12:08:53','2024-04-26 12:08:53','2024-04-26 12:08:53','832a715c-3570-459b-94f5-8d92efb5ba17'),(7,'cp-field-inspect','1.4.4','1.0.0','2024-04-26 12:09:05','2024-04-26 12:09:05','2024-04-26 12:09:05','37225584-a1e6-44e6-8c7f-1d36a85594a0'),(8,'super-table','3.0.14','3.0.0','2024-04-26 12:09:14','2024-04-26 12:09:14','2024-05-03 08:58:22','3cae3955-e97d-400f-8663-5ae0352dd5ac'),(9,'architect','4.0.1','2.0.0','2024-04-26 12:09:23','2024-04-26 12:09:23','2024-04-26 12:09:23','9f6cfced-d39a-4050-96f5-64e9b0cafa53'),(10,'craft-components','dev-master','1.0.0','2024-04-26 12:09:52','2024-04-26 12:09:52','2024-04-26 12:09:52','6348b90c-34be-4180-b675-e85419e37c9d');
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
INSERT INTO `projectconfig` VALUES ('dateModified','1714135261'),('email.fromEmail','\"dev-test@yoo.digital\"'),('email.fromName','\"293-m-project\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocapitalize','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocomplete','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.autocorrect','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.class','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.disabled','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.elementCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.id','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.inputType','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.instructions','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.label','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.max','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.min','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.name','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.orientation','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.placeholder','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.readonly','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.requirable','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.size','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.step','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.tip','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.title','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.uid','\"819cafad-bdbd-488e-aae8-4cfd22568003\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.warning','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.elements.0.width','100'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.name','\"Content\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.uid','\"bf334499-f8ea-47d6-83f9-c6e0b2bf9613\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.fieldLayouts.68c6df2a-b2d9-423b-b89d-75e056fb6a4b.tabs.0.userCondition','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.handle','\"homepage\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.hasTitleField','false'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.name','\"homepage\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.section','\"e64fed43-43e3-4ef1-bd91-cba55dff1e11\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.showStatusField','true'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.slugTranslationKeyFormat','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.slugTranslationMethod','\"site\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.sortOrder','1'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleFormat','\"{section.name|raw}\"'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleTranslationKeyFormat','null'),('entryTypes.44b1b133-2a7f-410d-a791-d08d689ced20.titleTranslationMethod','\"site\"'),('fieldGroups.f3796036-0ba8-4173-b40f-873b81ef93c2.name','\"Common\"'),('meta.__names__.0223b707-3c9a-486e-8d9f-4e0a9b65b004','\"293-m-project\"'),('meta.__names__.44b1b133-2a7f-410d-a791-d08d689ced20','\"homepage\"'),('meta.__names__.58e5330c-b0ef-43ce-bc09-04944358f3ee','\"293-m-project\"'),('meta.__names__.e64fed43-43e3-4ef1-bd91-cba55dff1e11','\"homepage\"'),('meta.__names__.f3796036-0ba8-4173-b40f-873b81ef93c2','\"Common\"'),('plugins.architect.edition','\"standard\"'),('plugins.architect.enabled','true'),('plugins.architect.schemaVersion','\"2.0.0\"'),('plugins.contact-form-honeypot.edition','\"standard\"'),('plugins.contact-form-honeypot.enabled','true'),('plugins.contact-form-honeypot.schemaVersion','\"1.0.0\"'),('plugins.contact-form.edition','\"standard\"'),('plugins.contact-form.enabled','true'),('plugins.contact-form.schemaVersion','\"1.0.0\"'),('plugins.cp-field-inspect.edition','\"standard\"'),('plugins.cp-field-inspect.enabled','true'),('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),('plugins.craft-components.edition','\"standard\"'),('plugins.craft-components.enabled','true'),('plugins.craft-components.schemaVersion','\"1.0.0\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"JOPFSUHXE19PIL0YLL65MSGT\"'),('plugins.neo.schemaVersion','\"4.0.0\"'),('plugins.project-extension.edition','\"standard\"'),('plugins.project-extension.enabled','true'),('plugins.project-extension.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seomatic.edition','\"standard\"'),('plugins.seomatic.enabled','true'),('plugins.seomatic.licenseKey','\"DAVSW2BRE3PKQMWQBVI0X9LQ\"'),('plugins.seomatic.schemaVersion','\"3.0.12\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"3.0.0\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.defaultPlacement','\"end\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.enableVersioning','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.handle','\"homepage\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.name','\"homepage\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.propagationMethod','\"all\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.enabledByDefault','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.template','\"_entry-types/home/home.twig\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.siteSettings.0223b707-3c9a-486e-8d9f-4e0a9b65b004.uriFormat','\"__home__\"'),('sections.e64fed43-43e3-4ef1-bd91-cba55dff1e11.type','\"single\"'),('siteGroups.58e5330c-b0ef-43ce-bc09-04944358f3ee.name','\"293-m-project\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.handle','\"default\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.hasUrls','true'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.language','\"en-US\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.name','\"293-m-project\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.primary','true'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.siteGroup','\"58e5330c-b0ef-43ce-bc09-04944358f3ee\"'),('sites.0223b707-3c9a-486e-8d9f-4e0a9b65b004.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"293-m-project\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
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
INSERT INTO `resourcepaths` VALUES ('13daa4bd','@pennebaker/architect/assetbundles/indexcpsection/dist'),('1cb31ce4','@craft/web/assets/admintable/dist'),('258f680c','@craft/web/assets/fabric/dist'),('263ebce1','@vendor/yoo/craft-components/resources/dist'),('48143553','@craft/web/assets/conditionbuilder/dist'),('4b935d07','@craft/web/assets/recententries/dist'),('5366c85e','@craft/web/assets/axios/dist'),('622b9d2e','@craft/web/assets/installer/dist'),('631f64b0','@craft/web/assets/selectize/dist'),('640ade92','@craft/web/assets/tailwindreset/dist'),('6f57c6f8','@craft/web/assets/cp/dist'),('75291f69','@craft/web/assets/updateswidget/dist'),('7562e0b1','@craft/web/assets/d3/dist'),('7e03e906','@craft/web/assets/iframeresizer/dist'),('80057060','@craft/web/assets/htmx/dist'),('8fd4f19c','@craft/web/assets/edituser/dist'),('94d3f2ef','@craft/web/assets/dashboard/dist'),('a530b40f','@craft/web/assets/fileupload/dist'),('b1acf2b2','@bower/jquery/dist'),('b44ced5a','@craft/web/assets/elementresizedetector/dist'),('bb4b62a4','@craft/web/assets/jqueryui/dist'),('d0e13ea4','@craft/web/assets/xregexp/dist'),('d285e960','@craft/web/assets/craftsupport/dist'),('d3d5f1b','@craft/web/assets/garnish/dist'),('da835ead','@craft/web/assets/login/dist'),('db5983a4','@craft/web/assets/picturefill/dist'),('dbdcaf87','@root/plugins/project-extension/src/assetbundles/projectextension/dist'),('de81ab7b','@nystudio107/seomatic/web/assets/dist'),('e2955bcd','@craft/web/assets/velocity/dist'),('e702597a','@craft/web/assets/jquerypayment/dist'),('e7518618','@craft/web/assets/jquerytouchevents/dist'),('e909d0bd','@craft/web/assets/datepickeri18n/dist'),('ed90d424','@craft/web/assets/feed/dist'),('f6b58396','@craft/web/assets/vue/dist'),('f6ed73c9','@craft/web/assets/editsection/dist');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL);
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
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev test yoo digital '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' homepage '),(2,'title',0,1,' homepage ');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'homepage','homepage','single',1,'all','end',NULL,'2024-04-26 12:33:44','2024-04-26 12:33:44',NULL,'e64fed43-43e3-4ef1-bd91-cba55dff1e11');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','_entry-types/home/home.twig',1,'2024-04-26 12:33:44','2024-04-26 12:41:01','9d093b51-fd47-4e16-af12-1f242e5b34d7');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int DEFAULT NULL,
  `sourceAltSiteSettings` text,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text,
  `metaSiteVars` text,
  `metaSitemapVars` text,
  `metaContainers` text,
  `redirectsContainer` text,
  `frontendTemplatesContainer` text,
  `metaBundleSettings` text,
  PRIMARY KEY (`id`),
  KEY `idx_jzbbtrxlajakicismohpiawdswfkapsijhfs` (`sourceBundleType`),
  KEY `idx_wcbhzkktehcomiembcexujoamupkeufgxifc` (`sourceId`),
  KEY `idx_oheokgzmmvpqwdyouuurxaxpyrhtzvnclxyu` (`sourceSiteId`),
  KEY `idx_uxbrvdgsdrveyfdtfikcozjvnssuiqxrzskw` (`sourceHandle`),
  CONSTRAINT `fk_lsnmpjzrqqjcosepmxchwfyzneomcdukvvmi` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
INSERT INTO `seomatic_metabundles` VALUES (1,'2024-04-26 12:08:44','2024-04-26 12:08:44','9d543d49-00e0-4e20-b5e4-c1b9a468b0c5','1.0.71','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2024-04-26 12:08:44','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"293-m-project\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":null,\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text\\/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https:\\/\\/developers.google.com\\/gtagjs\\/)\",\"templatePath\":\"_frontend\\/scripts\\/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement\\/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/adwords-remarketing-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/dcm\\/partner\\/answer\\/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https:\\/\\/support.google.com\\/tagmanager\\/answer\\/6102821?hl=en)\",\"templatePath\":\"_frontend\\/scripts\\/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"><\\/iframe><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/tag-manager\\/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/ns.html\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https:\\/\\/www.facebook.com\\/business\\/help\\/651294705016616)\",\"templatePath\":\"_frontend\\/scripts\\/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.facebook.com\\/docs\\/facebook-pixel\\/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.facebook.com\\/tr\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend\\/scripts\\/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text\\/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text\\/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n<\\/script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" \\/>\\n<\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/www.linkedin.com\\/help\\/lms\\/answer\\/65513\\/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/snap.licdn.com\\/li.lms-analytics\\/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/dc.ads.linkedin.com\\/collect\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text\\/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/knowledge.hubspot.com\\/articles\\/kcs_article\\/reports\\/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"\\/\\/js.hs-scripts.com\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https:\\/\\/help.pinterest.com\\/en\\/business\\/article\\/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend\\/scripts\\/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.pinterest.com\\/docs\\/ad-tools\\/conversion-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/s.pinimg.com\\/ct\\/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/ct.pinterest.com\\/v3\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https:\\/\\/usefathom.com\\/)\",\"templatePath\":\"_frontend\\/scripts\\/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/cdn.usefathom.com\\/script.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https:\\/\\/matomo.org\\/)\",\"templatePath\":\"_frontend\\/scripts\\/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text\\/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https:\\/\\/plausible.io\\/)\",\"templatePath\":\"_frontend\\/scripts\\/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https:\\/\\/plausible.io\\/docs\\/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/plausible.io\\/js\\/plausible.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https:\\/\\/www.google.com\\/analytics\\/analytics\\/)\",\"templatePath\":\"_frontend\\/scripts\\/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.google-analytics.com\\/analytics.js\"}},\"dataLayer\":[],\"deprecated\":true,\"deprecationNotice\":\"Universal Analytics (which is what this script uses) is being [discontinued on July 1st, 2023](https:\\/\\/support.google.com\\/analytics\\/answer\\/11583528). You should use Google gtag.js or Google Tag Manager instead and transition to a new GA4 property.\",\"discontinued\":false,\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"dateModified\":null,\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":null,\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":null,\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":null,\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":null,\"isAccessibleForFree\":null,\"dateCreated\":null,\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"},\"identity\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.identity.genericName }}\",\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null},\"creator\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.creator.genericName }}\",\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"\\/* TEAM *\\/\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n\\/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n\\/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n\\/a\\\" }}\\n\\n\\/* THANKS *\\/\\n\\nCraft CMS - https:\\/\\/craftcms.com\\nPixel & Tonic - https:\\/\\/pixelandtonic.com\\n\\n\\/* SITE *\\/\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 4, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend\\/pages\\/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n    # live - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% case \\\"staging\\\" %}\\n\\n    # staging - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% case \\\"local\\\" %}\\n\\n    # local - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% default %}\\n\\n    # default - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% endswitch %}\\n\\n# Disallow ChatGPT bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: GPTBot\\nDisallow: \\/\\n\\n# Disallow Google Bard and Vertex AI bots, as there\'s no benefit to allowing it to index your site\\nUser-agent: Google-Extended\\nDisallow: \\/\\n\\n# Disallow Perplexity bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: PerplexityBot\\nDisallow: \\/\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend\\/pages\\/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n# More info: https:\\/\\/support.google.com\\/admanager\\/answer\\/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend\\/pages\\/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }} - more info: https:\\/\\/securitytxt.org\\/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\".well-known\\/security.txt\",\"template\":\"_frontend\\/pages\\/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2024-04-26 12:33:44','2024-04-26 12:41:02','03c38aae-1ec0-4453-9a5b-91ffe71a8240','1.0.31','section',1,'homepage','homepage','single',NULL,'_entry-types/home/home.twig',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"_entry-types\\/home\\/home.twig\",\"language\":\"en-us\"}}','2024-04-26 12:41:02','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"sameAsGlobal\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"sameAsGlobal\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"293-m-project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"specialty\":null,\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"significantLinks\":null,\"reviewedBy\":null,\"relatedLink\":null,\"primaryImageOfPage\":null,\"significantLink\":null,\"speakable\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"isAccessibleForFree\":null,\"dateCreated\":\"{{ entry.dateCreated |atom }}\",\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'gkmTg9fYdNxFWYnic1B2wBgknD7bxPa0p3odosbFQeX0N35VSmJ1TbGm_aQkRdnh2cUT8ant-Vo0mq9ZWlrfxz1Y91G8Lsnm-eIO','2024-04-26 12:27:06','2024-04-27 12:42:23','20e040b6-d647-41f3-847b-b12aa8cd14e4'),(2,1,'E84H7rkoAFGX-xhoLZZoCsf_ixmZCiSuWpG23_MbhtRsUIYF0O52CPfd3N8hUNwU34FW_A9L4rXE-SwkcRX2ZptpjpSgf6-MIMKk','2024-04-26 13:52:45','2024-04-26 14:13:05','0d978c74-3daa-4442-b4ef-a228048c439e'),(3,1,'W-objIts6Tr0xsXe9Hm6NZ7cW4SPAKJXyEX4zZWHpQPmj_QpkrijULKySTDP3ulq0UMkGRb4Xi-D0ihsRDPXGpP7A1uMFVtmVm8B','2024-04-27 12:42:23','2024-04-27 12:42:23','1a00338b-093f-4e23-ad00-c6f4668bf02d'),(5,1,'Hr5D-pnwx2cSX8wriUbwCT3Nt8q78XGu40N1A_gZgiO0ar8P-D_WFmRtKABq23OzIhAcJwBI9gBUFuRg4qosXQLBd9XnF_ImZM3U','2024-04-27 20:59:04','2024-04-27 21:09:57','c9c7c9ab-8aac-4f22-a7e4-6d4ee42a9b00'),(6,1,'L52yjKqchACMoMWCViMWOoaW6raHfE7CM-oEA1OJJpj7B8mdbGsGgEa5QVO7cQArBTbhdHZmPImF3-svh8hMnaZAiTpHcTjlSU4m','2024-04-27 21:09:57','2024-04-27 21:09:57','d9a9fa25-25af-4aee-b381-88ba4eec2395'),(7,1,'Z7bPfpPBQN349eD-YqjkRrBWuzPi9pUwkbKOdvyQdwNswb9gh3uFozK_jNLcvta3lX73w6--s7mqP_snTLLRCMlBwaGR5ppYxJCZ','2024-04-27 21:09:57','2024-05-03 08:58:22','07496db8-0c4d-4cc0-9609-d07a787e16e1'),(8,1,'JzwI1mv8-8sq4SqoswLGOrX6IbcKMEHHBsAPIULhw7oFqTwEX-zcrGtqXy1vWUu9ytG3IcjJphzh-pWHla_UB-Db7xFBITrRlAL8','2024-04-28 20:18:33','2024-04-28 21:10:23','e6969c02-292c-4f25-b951-5ab2ae91d06a'),(9,1,'QqvpaueQDyt4mGwS-mgZzQAnad092wfXtYcfks61LowZT4ys97NAN2wz9UxIX6Tlzk5uS5hpLLhA7hRqfoNh7Ri1dIH3Dkd2FIP6','2024-05-03 08:58:22','2024-05-03 11:56:53','4db3aaab-723a-4f95-b465-32c503733d47'),(10,1,'fKQWlpbYG4zR7RQwPpm4mUryXAhakw6tzaXR92JOGmWDpH6V0Ny4yvZvil6C_ZWNmH_4jk_sdYqwBQg5QXaYMaR8KBdcWOLFA-w5','2024-05-03 11:56:53','2024-05-03 13:21:42','161f5d65-9cf5-471b-be70-5db7240c3f9f');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
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
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'dev-test@yoo.digital','$2y$13$/cg2CAO3.W8KkdFBdi3MreueK6.VUVozoPtny1x9rIfc0zzU679j2','2024-05-03 11:56:53',NULL,NULL,NULL,'2024-04-26 12:26:55',NULL,1,NULL,NULL,NULL,0,'2024-04-26 12:08:10','2024-04-26 12:08:10','2024-05-03 11:56:53');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
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

-- Dump completed on 2024-05-04 13:49:24
