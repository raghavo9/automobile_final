-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: automobile_final
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` text,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` int unsigned DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `customSettings` longtext,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1617262051,1617262051,1,1,NULL,0,0),(2,1,'folder','_default_upload_bucket','/',NULL,1617277814,1617277814,1,0,'a:0:{}',0,1),(3,2,'image','carlogo02.png','/_default_upload_bucket/','image/png',1617277815,1617277815,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:252;s:11:\"imageHeight\";i:200;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(4,2,'image','ciaz.png','/_default_upload_bucket/','image/png',1617292005,1617292005,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:287;s:11:\"imageHeight\";i:176;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617292004;s:8:\"FileSize\";i:7318;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_metadata` (
  `cid` int NOT NULL,
  `name` varchar(190) NOT NULL,
  `language` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`cid`,`name`,`language`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` int unsigned DEFAULT NULL,
  `expire` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('asset_1',_binary 's:574:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:11:\"\0*\0filename\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1617262051;s:19:\"\0*\0modificationDate\";i:1617262051;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617262051;s:12:\"\0*\0_fulldump\";b:0;}\";',1617262550,1619681750),('asset_3',_binary 's:777:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:3;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:13:\"carlogo02.png\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1617277815;s:19:\"\0*\0modificationDate\";i:1617277815;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:252;s:11:\"imageHeight\";i:200;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277815;s:12:\"\0*\0_fulldump\";b:0;}\";',1617277819,1619697019),('asset_4',_binary 's:906:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:4;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:8:\"ciaz.png\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1617292005;s:19:\"\0*\0modificationDate\";i:1617292005;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:287;s:11:\"imageHeight\";i:176;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617292004;s:8:\"FileSize\";i:7318;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617292005;s:12:\"\0*\0_fulldump\";b:0;}\";',1617292008,1619711208),('document_1',_binary 's:886:\"O:27:\"Pimcore\\Model\\Document\\Page\":31:{s:8:\"\0*\0title\";s:0:\"\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";N;s:13:\"\0*\0controller\";s:7:\"default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:0:\"\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:6:\"\0*\0key\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:999999;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617262051;s:19:\"\0*\0modificationDate\";i:1617262051;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617262051;s:12:\"\0*\0_fulldump\";b:0;}\";',1617262546,1619681745),('document_properties_1',_binary 's:6:\"a:0:{}\";',1617262546,1619681745),('object_1',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:1;s:13:\"\0*\0o_parentId\";i:0;s:8:\"\0*\0o_key\";s:0:\"\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:999999;s:17:\"\0*\0o_creationDate\";i:1617262051;s:21:\"\0*\0o_modificationDate\";i:1617262051;s:14:\"\0*\0o_userOwner\";i:1;s:21:\"\0*\0o_userModification\";i:1;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617262051;s:12:\"\0*\0_fulldump\";b:0;}\";',1617262550,1619681750),('object_2',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:2;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:5:\"Brand\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617277693;s:21:\"\0*\0o_modificationDate\";i:1617277691;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277691;s:12:\"\0*\0_fulldump\";b:0;}\";',1617277695,1619696894),('object_3',_binary 's:601:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:3;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:8:\"Category\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617277703;s:21:\"\0*\0o_modificationDate\";i:1617277702;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277702;s:12:\"\0*\0_fulldump\";b:0;}\";',1617277705,1619696904),('object_4',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:4;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:7:\"Product\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617277713;s:21:\"\0*\0o_modificationDate\";i:1617277712;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277712;s:12:\"\0*\0_fulldump\";b:0;}\";',1617277714,1619696914),('object_5',_binary 's:2004:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":29:{s:12:\"\0*\0o_classId\";s:1:\"1\";s:14:\"\0*\0o_className\";s:5:\"Brand\";s:12:\"\0*\0brandName\";s:4:\"Audi\";s:19:\"\0*\0brandDescription\";s:31:\"<p>german luxury car brand</p>\n\";s:12:\"\0*\0brandLogo\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:3;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:13:\"carlogo02.png\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1617277815;s:19:\"\0*\0modificationDate\";i:1617277815;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:252;s:11:\"imageHeight\";i:200;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277815;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:7:\"asset_3\";}s:17:\"\0*\0brandCreatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:17:\"\0*\0brandUpdatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:16:\"\0*\0isBrandActive\";b:1;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:5;s:13:\"\0*\0o_parentId\";i:2;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:4:\"Audi\";s:9:\"\0*\0o_path\";s:7:\"/Brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617277726;s:21:\"\0*\0o_modificationDate\";i:1617277833;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277833;s:12:\"\0*\0_fulldump\";b:0;}\";',1617277837,1619697037),('object_6',_binary 's:1475:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:1:\"3\";s:14:\"\0*\0o_className\";s:7:\"Product\";s:13:\"\0*\0productSKU\";N;s:14:\"\0*\0productName\";N;s:21:\"\0*\0productDescription\";N;s:15:\"\0*\0productBrand\";s:0:\"\";s:15:\"\0*\0productPrice\";N;s:16:\"\0*\0productColour\";N;s:20:\"\0*\0productLaunchDate\";N;s:14:\"\0*\0airbagCount\";N;s:16:\"\0*\0productEngine\";N;s:16:\"\0*\0productLength\";N;s:19:\"\0*\0productCreatedAt\";N;s:19:\"\0*\0productUpdatedAt\";N;s:18:\"\0*\0isProductActive\";N;s:14:\"\0*\0ProductType\";O:44:\"Pimcore\\Model\\DataObject\\Product\\ProductType\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:15:\"CombustionTruck\";i:1;s:14:\"CoumbustionCar\";i:2;s:11:\"ElectricCar\";i:3;s:13:\"ElectricTruck\";}s:18:\"\0*\0CombustionTruck\";N;s:17:\"\0*\0CoumbustionCar\";N;s:14:\"\0*\0ElectricCar\";N;s:16:\"\0*\0ElectricTruck\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:11:\"ProductType\";s:11:\"\0*\0objectId\";i:6;}s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:0;s:7:\"\0*\0o_id\";i:6;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:2:\"A4\";s:9:\"\0*\0o_path\";s:9:\"/Product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617277858;s:21:\"\0*\0o_modificationDate\";i:1617277859;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617277859;s:12:\"\0*\0_fulldump\";b:0;}\";',1617291711,1619710910),('object_7',_binary 's:3781:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:1:\"3\";s:14:\"\0*\0o_className\";s:7:\"Product\";s:13:\"\0*\0productSKU\";s:4:\"1001\";s:14:\"\0*\0productName\";s:2:\"A6\";s:21:\"\0*\0productDescription\";s:18:\"<p>german car</p>\n\";s:15:\"\0*\0productBrand\";s:4:\"Audi\";s:15:\"\0*\0productPrice\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:2600000;s:9:\"\0*\0unitId\";s:1:\"1\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"1\";s:12:\"abbreviation\";s:3:\"INR\";s:5:\"group\";N;s:8:\"longname\";s:12:\"Indian Rupee\";s:8:\"baseunit\";s:1:\"1\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:16:\"\0*\0productColour\";s:10:\"metal blue\";s:20:\"\0*\0productLaunchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2019-04-23 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:14:\"\0*\0airbagCount\";i:5;s:16:\"\0*\0productEngine\";s:20:\"normal  power engine\";s:16:\"\0*\0productLength\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:245;s:9:\"\0*\0unitId\";s:1:\"3\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"3\";s:12:\"abbreviation\";s:2:\"cm\";s:5:\"group\";N;s:8:\"longname\";s:10:\"Centimeter\";s:8:\"baseunit\";s:1:\"3\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0productCreatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:19:\"\0*\0productUpdatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:18:\"\0*\0isProductActive\";b:1;s:14:\"\0*\0ProductType\";O:44:\"Pimcore\\Model\\DataObject\\Product\\ProductType\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:15:\"CombustionTruck\";i:1;s:14:\"CoumbustionCar\";i:2;s:11:\"ElectricCar\";i:3;s:13:\"ElectricTruck\";}s:18:\"\0*\0CombustionTruck\";N;s:17:\"\0*\0CoumbustionCar\";O:56:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\CoumbustionCar\":8:{s:7:\"\0*\0type\";s:14:\"CoumbustionCar\";s:10:\"\0*\0mileage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20.1;s:9:\"\0*\0unitId\";s:1:\"7\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"7\";s:12:\"abbreviation\";s:4:\"kmpl\";s:5:\"group\";N;s:8:\"longname\";s:19:\"kilometer per litre\";s:8:\"baseunit\";s:1:\"7\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:56;s:13:\"\0*\0_fieldname\";s:7:\"mileage\";s:12:\"\0*\0_language\";N;}s:10:\"\0*\0sunroof\";b:1;s:11:\"\0*\0fuelType\";s:6:\"Petrol\";s:12:\"\0*\0fieldname\";s:11:\"ProductType\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:7;s:12:\"\0*\0_fulldump\";b:0;}s:14:\"\0*\0ElectricCar\";N;s:16:\"\0*\0ElectricTruck\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:11:\"ProductType\";s:11:\"\0*\0objectId\";i:7;}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:1:\"1\";s:6:\"src_id\";s:1:\"7\";s:7:\"dest_id\";s:1:\"8\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:15:\"productCategory\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:7;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:2:\"A6\";s:9:\"\0*\0o_path\";s:9:\"/Product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617291707;s:21:\"\0*\0o_modificationDate\";i:1617292111;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617292111;s:12:\"\0*\0_fulldump\";b:0;}\";',1617292113,1619711313),('object_8',_binary 's:1180:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":28:{s:12:\"\0*\0o_classId\";s:1:\"2\";s:14:\"\0*\0o_className\";s:8:\"Category\";s:15:\"\0*\0categoryName\";s:5:\"Sedan\";s:22:\"\0*\0categoryDescription\";s:23:\"<p>long luxury car</p>\n\";s:20:\"\0*\0categoryCreatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0categoryUpdatedAt\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-03-31 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:19:\"\0*\0isCategoryActive\";b:1;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:8;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"Sedan\";s:9:\"\0*\0o_path\";s:10:\"/Category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617291777;s:21:\"\0*\0o_modificationDate\";i:1617291929;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617291929;s:12:\"\0*\0_fulldump\";b:0;}\";',1617291930,1619711130),('quantityvalue_units_table',_binary 's:2597:\"a:10:{i:1;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"1\";s:12:\"abbreviation\";s:3:\"INR\";s:5:\"group\";N;s:8:\"longname\";s:12:\"Indian Rupee\";s:8:\"baseunit\";s:1:\"1\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:10;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"10\";s:12:\"abbreviation\";s:2:\"ft\";s:5:\"group\";N;s:8:\"longname\";s:4:\"feet\";s:8:\"baseunit\";s:2:\"10\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:2;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"2\";s:12:\"abbreviation\";s:3:\"USD\";s:5:\"group\";N;s:8:\"longname\";s:20:\"United States Dollar\";s:8:\"baseunit\";s:1:\"2\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:3;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"3\";s:12:\"abbreviation\";s:2:\"cm\";s:5:\"group\";N;s:8:\"longname\";s:10:\"Centimeter\";s:8:\"baseunit\";s:1:\"3\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:4;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"4\";s:12:\"abbreviation\";s:2:\"in\";s:5:\"group\";N;s:8:\"longname\";s:4:\"Inch\";s:8:\"baseunit\";s:1:\"4\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:5;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"5\";s:12:\"abbreviation\";s:3:\"kWh\";s:5:\"group\";N;s:8:\"longname\";s:14:\"Kilo Watt Hour\";s:8:\"baseunit\";s:1:\"5\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:6;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"6\";s:12:\"abbreviation\";s:4:\"Whpm\";s:5:\"group\";N;s:8:\"longname\";s:18:\"Watt Hour per mile\";s:8:\"baseunit\";s:1:\"6\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:7;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"7\";s:12:\"abbreviation\";s:4:\"kmpl\";s:5:\"group\";N;s:8:\"longname\";s:19:\"kilometer per litre\";s:8:\"baseunit\";s:1:\"7\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:8;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"8\";s:12:\"abbreviation\";s:2:\"Kg\";s:5:\"group\";N;s:8:\"longname\";s:9:\"Kilo Gram\";s:8:\"baseunit\";s:1:\"8\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:9;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"9\";s:12:\"abbreviation\";s:3:\"ton\";s:5:\"group\";N;s:8:\"longname\";s:3:\"ton\";s:8:\"baseunit\";s:1:\"9\";s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}}\";',1617292016,1619711216),('system_resource_columns_edit_lock',_binary 's:101:\"a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}\";',1617291711,1619710910);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `tag` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('asset_1','asset_1'),('asset_3','asset_3'),('object_5','asset_3'),('asset_4','asset_4'),('object_5','class_1'),('object_8','class_2'),('object_6','class_3'),('object_7','class_3'),('document_1','document_1'),('document_properties_1','document_1'),('document_properties_1','document_properties'),('object_1','object_1'),('object_2','object_2'),('object_3','object_3'),('object_4','object_4'),('object_5','object_5'),('object_6','object_6'),('object_7','object_7'),('object_8','object_8'),('system_resource_columns_edit_lock','resource'),('system_resource_columns_edit_lock','system');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` varchar(50) NOT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('1','Brand'),('2','Category'),('3','Product');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` int unsigned NOT NULL,
  `groupId` int unsigned NOT NULL,
  `sorter` int DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `parentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` int unsigned NOT NULL,
  `keyId` int unsigned NOT NULL,
  `sorter` int DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_layouts` (
  `id` varchar(64) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combi` (`sourcetype`,`sourceid`,`targettype`,`targetid`),
  KEY `targettype_targetid` (`targettype`,`targetid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES (1,'object',5,'asset',3),(3,'object',7,'asset',4),(2,'object',7,'object',8);
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `index` int unsigned DEFAULT '0',
  `published` tinyint unsigned DEFAULT '1',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1617262051,1617262051,1,1,0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_elements` (
  `documentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_email` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_hardlink` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childrenFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_link` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset','object') DEFAULT NULL,
  `internal` int unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_newsletter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_page` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(383) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `targetGroupIds` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default','','','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_printpage` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_snippet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_translations` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_lock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (5,6,'object',2,'bj0rm0juq3flq88jimp07e9jo0',1617288127),(8,8,'object',2,'bj0rm0juq3flq88jimp07e9jo0',1617291901),(9,7,'object',2,'bj0rm0juq3flq88jimp07e9jo0',1617291938);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element_workflow_state` (
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `place` text,
  `workflow` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` int unsigned DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentDate` (`sentDate`,`id`),
  FULLTEXT KEY `fulltext` (`from`,`to`,`cc`,`bcc`,`subject`,`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glossary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_favourites`
--

DROP TABLE IF EXISTS `gridconfig_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_favourites` (
  `ownerId` int NOT NULL,
  `classId` varchar(50) NOT NULL,
  `objectId` int NOT NULL DEFAULT '0',
  `gridConfigId` int DEFAULT NULL,
  `searchType` varchar(50) NOT NULL DEFAULT '',
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  PRIMARY KEY (`ownerId`,`classId`,`searchType`,`objectId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_favourites`
--

LOCK TABLES `gridconfig_favourites` WRITE;
/*!40000 ALTER TABLE `gridconfig_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_shares`
--

DROP TABLE IF EXISTS `gridconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_shares` (
  `gridConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`gridConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_shares`
--

LOCK TABLES `gridconfig_shares` WRITE;
/*!40000 ALTER TABLE `gridconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfigs`
--

DROP TABLE IF EXISTS `gridconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `searchType` varchar(50) DEFAULT NULL,
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfigs`
--

LOCK TABLES `gridconfigs` WRITE;
/*!40000 ALTER TABLE `gridconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `http_error_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` int DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` int unsigned DEFAULT NULL,
  `count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfig_shares`
--

DROP TABLE IF EXISTS `importconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfig_shares` (
  `importConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`importConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfig_shares`
--

LOCK TABLES `importconfig_shares` WRITE;
/*!40000 ALTER TABLE `importconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfigs`
--

DROP TABLE IF EXISTS `importconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfigs`
--

LOCK TABLES `importconfigs` WRITE;
/*!40000 ALTER TABLE `importconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_keys`
--

DROP TABLE IF EXISTS `lock_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_keys` (
  `key_id` varchar(64) NOT NULL,
  `key_token` varchar(44) NOT NULL,
  `key_expiration` int unsigned NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_keys`
--

LOCK TABLES `lock_keys` WRITE;
/*!40000 ALTER TABLE `lock_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid_ctype` (`cid`,`ctype`),
  KEY `date` (`date`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_data` (
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'info',
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int DEFAULT NULL,
  `recipient` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificationDate` timestamp NULL DEFAULT NULL,
  `linkedElementType` enum('document','asset','object') DEFAULT NULL,
  `linkedElement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_1`
--

DROP TABLE IF EXISTS `object_1`;
/*!50001 DROP VIEW IF EXISTS `object_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_1` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `brandName`,
 1 AS `brandDescription`,
 1 AS `brandLogo`,
 1 AS `brandCreatedAt`,
 1 AS `brandUpdatedAt`,
 1 AS `isBrandActive`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_2`
--

DROP TABLE IF EXISTS `object_2`;
/*!50001 DROP VIEW IF EXISTS `object_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_2` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `categoryName`,
 1 AS `categoryDescription`,
 1 AS `categoryCreatedAt`,
 1 AS `categoryUpdatedAt`,
 1 AS `isCategoryActive`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_3`
--

DROP TABLE IF EXISTS `object_3`;
/*!50001 DROP VIEW IF EXISTS `object_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_3` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `productSKU`,
 1 AS `productName`,
 1 AS `productDescription`,
 1 AS `productPrice__value`,
 1 AS `productPrice__unit`,
 1 AS `productColour`,
 1 AS `productLaunchDate`,
 1 AS `airbagCount`,
 1 AS `productEngine`,
 1 AS `productLength__value`,
 1 AS `productLength__unit`,
 1 AS `productCreatedAt`,
 1 AS `productUpdatedAt`,
 1 AS `isProductActive`,
 1 AS `productBrand`,
 1 AS `productCategory__id`,
 1 AS `productCategory__type`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_brick_query_CombustionEngineVan_3`
--

DROP TABLE IF EXISTS `object_brick_query_CombustionEngineVan_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_CombustionEngineVan_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_CombustionEngineVan_3`
--

LOCK TABLES `object_brick_query_CombustionEngineVan_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_CombustionEngineVan_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_CombustionEngineVan_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_CombustionTruck_3`
--

DROP TABLE IF EXISTS `object_brick_query_CombustionTruck_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_CombustionTruck_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `fuelType` varchar(190) DEFAULT NULL,
  `maxLoadCapacity__value` double DEFAULT NULL,
  `maxLoadCapacity__unit` varchar(50) DEFAULT NULL,
  `wheelCount` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_CombustionTruck_3`
--

LOCK TABLES `object_brick_query_CombustionTruck_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_CombustionTruck_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_CombustionTruck_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_CoumbustionCar_3`
--

DROP TABLE IF EXISTS `object_brick_query_CoumbustionCar_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_CoumbustionCar_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `sunroof` tinyint(1) DEFAULT NULL,
  `fuelType` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_CoumbustionCar_3`
--

LOCK TABLES `object_brick_query_CoumbustionCar_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_CoumbustionCar_3` DISABLE KEYS */;
INSERT INTO `object_brick_query_CoumbustionCar_3` VALUES (7,'ProductType',20.1,'7',1,'Petrol');
/*!40000 ALTER TABLE `object_brick_query_CoumbustionCar_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_ElectricCar_3`
--

DROP TABLE IF EXISTS `object_brick_query_ElectricCar_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_ElectricCar_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `batteryCapacity__value` double DEFAULT NULL,
  `batteryCapacity__unit` varchar(50) DEFAULT NULL,
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `sunroof` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_ElectricCar_3`
--

LOCK TABLES `object_brick_query_ElectricCar_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_ElectricCar_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_ElectricCar_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_ElectricHatchback_3`
--

DROP TABLE IF EXISTS `object_brick_query_ElectricHatchback_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_ElectricHatchback_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_ElectricHatchback_3`
--

LOCK TABLES `object_brick_query_ElectricHatchback_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_ElectricHatchback_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_ElectricHatchback_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_ElectricTruck_3`
--

DROP TABLE IF EXISTS `object_brick_query_ElectricTruck_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_ElectricTruck_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `maxLoadCapacity__value` double DEFAULT NULL,
  `maxLoadCapacity__unit` varchar(50) DEFAULT NULL,
  `wheelCount` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_ElectricTruck_3`
--

LOCK TABLES `object_brick_query_ElectricTruck_3` WRITE;
/*!40000 ALTER TABLE `object_brick_query_ElectricTruck_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_ElectricTruck_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_CombustionEngineVan_3`
--

DROP TABLE IF EXISTS `object_brick_store_CombustionEngineVan_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_CombustionEngineVan_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_CombustionEngineVan_3`
--

LOCK TABLES `object_brick_store_CombustionEngineVan_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_CombustionEngineVan_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_CombustionEngineVan_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_CombustionTruck_3`
--

DROP TABLE IF EXISTS `object_brick_store_CombustionTruck_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_CombustionTruck_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `fuelType` varchar(190) DEFAULT NULL,
  `maxLoadCapacity__value` double DEFAULT NULL,
  `maxLoadCapacity__unit` varchar(50) DEFAULT NULL,
  `wheelCount` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_CombustionTruck_3`
--

LOCK TABLES `object_brick_store_CombustionTruck_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_CombustionTruck_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_CombustionTruck_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_CoumbustionCar_3`
--

DROP TABLE IF EXISTS `object_brick_store_CoumbustionCar_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_CoumbustionCar_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `sunroof` tinyint(1) DEFAULT NULL,
  `fuelType` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_CoumbustionCar_3`
--

LOCK TABLES `object_brick_store_CoumbustionCar_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_CoumbustionCar_3` DISABLE KEYS */;
INSERT INTO `object_brick_store_CoumbustionCar_3` VALUES (7,'ProductType',20.1,'7',1,'Petrol');
/*!40000 ALTER TABLE `object_brick_store_CoumbustionCar_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_ElectricCar_3`
--

DROP TABLE IF EXISTS `object_brick_store_ElectricCar_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_ElectricCar_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `batteryCapacity__value` double DEFAULT NULL,
  `batteryCapacity__unit` varchar(50) DEFAULT NULL,
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `sunroof` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_ElectricCar_3`
--

LOCK TABLES `object_brick_store_ElectricCar_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_ElectricCar_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_ElectricCar_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_ElectricHatchback_3`
--

DROP TABLE IF EXISTS `object_brick_store_ElectricHatchback_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_ElectricHatchback_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_ElectricHatchback_3`
--

LOCK TABLES `object_brick_store_ElectricHatchback_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_ElectricHatchback_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_ElectricHatchback_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_ElectricTruck_3`
--

DROP TABLE IF EXISTS `object_brick_store_ElectricTruck_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_ElectricTruck_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `mileage__value` double DEFAULT NULL,
  `mileage__unit` varchar(50) DEFAULT NULL,
  `maxLoadCapacity__value` double DEFAULT NULL,
  `maxLoadCapacity__unit` varchar(50) DEFAULT NULL,
  `wheelCount` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_ElectricTruck_3`
--

LOCK TABLES `object_brick_store_ElectricTruck_3` WRITE;
/*!40000 ALTER TABLE `object_brick_store_ElectricTruck_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_ElectricTruck_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_collection_productImages_3`
--

DROP TABLE IF EXISTS `object_collection_productImages_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_collection_productImages_3` (
  `o_id` int NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `productImage` int DEFAULT NULL,
  PRIMARY KEY (`o_id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_collection_productImages_3`
--

LOCK TABLES `object_collection_productImages_3` WRITE;
/*!40000 ALTER TABLE `object_collection_productImages_3` DISABLE KEYS */;
INSERT INTO `object_collection_productImages_3` VALUES (7,0,'productImages',4);
/*!40000 ALTER TABLE `object_collection_productImages_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_1`
--

DROP TABLE IF EXISTS `object_query_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '1',
  `oo_className` varchar(255) DEFAULT 'Brand',
  `brandName` varchar(190) DEFAULT NULL,
  `brandDescription` longtext,
  `brandLogo` int DEFAULT NULL,
  `brandCreatedAt` bigint DEFAULT NULL,
  `brandUpdatedAt` bigint DEFAULT NULL,
  `isBrandActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_1`
--

LOCK TABLES `object_query_1` WRITE;
/*!40000 ALTER TABLE `object_query_1` DISABLE KEYS */;
INSERT INTO `object_query_1` VALUES (5,'1','Brand','Audi','german luxury car brand ',3,1617215400,1617215400,1);
/*!40000 ALTER TABLE `object_query_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_2`
--

DROP TABLE IF EXISTS `object_query_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_2` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '2',
  `oo_className` varchar(255) DEFAULT 'Category',
  `categoryName` varchar(190) DEFAULT NULL,
  `categoryDescription` longtext,
  `categoryCreatedAt` bigint DEFAULT NULL,
  `categoryUpdatedAt` bigint DEFAULT NULL,
  `isCategoryActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_2`
--

LOCK TABLES `object_query_2` WRITE;
/*!40000 ALTER TABLE `object_query_2` DISABLE KEYS */;
INSERT INTO `object_query_2` VALUES (8,'2','Category','Sedan','long luxury car ',1617215400,1617215400,1);
/*!40000 ALTER TABLE `object_query_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_3`
--

DROP TABLE IF EXISTS `object_query_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_3` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '3',
  `oo_className` varchar(255) DEFAULT 'Product',
  `productSKU` varchar(190) DEFAULT NULL,
  `productName` varchar(190) DEFAULT NULL,
  `productDescription` longtext,
  `productPrice__value` double DEFAULT NULL,
  `productPrice__unit` varchar(50) DEFAULT NULL,
  `productColour` varchar(190) DEFAULT NULL,
  `productLaunchDate` bigint DEFAULT NULL,
  `airbagCount` double DEFAULT NULL,
  `productEngine` varchar(190) DEFAULT NULL,
  `productLength__value` double DEFAULT NULL,
  `productLength__unit` varchar(50) DEFAULT NULL,
  `productCreatedAt` bigint DEFAULT NULL,
  `productUpdatedAt` bigint DEFAULT NULL,
  `isProductActive` tinyint(1) DEFAULT NULL,
  `productBrand` varchar(190) DEFAULT NULL,
  `productCategory__id` int DEFAULT NULL,
  `productCategory__type` enum('document','asset','object') DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_3`
--

LOCK TABLES `object_query_3` WRITE;
/*!40000 ALTER TABLE `object_query_3` DISABLE KEYS */;
INSERT INTO `object_query_3` VALUES (6,'3','Product',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL),(7,'3','Product','1001','A6','german car ',2600000,'1','metal blue',1556044200,5,'normal  power engine',245,'3',1617215400,1617215400,1,'Audi',8,'object');
/*!40000 ALTER TABLE `object_query_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_1`
--

DROP TABLE IF EXISTS `object_relations_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_1`
--

LOCK TABLES `object_relations_1` WRITE;
/*!40000 ALTER TABLE `object_relations_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_2`
--

DROP TABLE IF EXISTS `object_relations_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_2`
--

LOCK TABLES `object_relations_2` WRITE;
/*!40000 ALTER TABLE `object_relations_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_3`
--

DROP TABLE IF EXISTS `object_relations_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_3`
--

LOCK TABLES `object_relations_3` WRITE;
/*!40000 ALTER TABLE `object_relations_3` DISABLE KEYS */;
INSERT INTO `object_relations_3` VALUES (1,7,8,'object','productCategory',0,'object','','0');
/*!40000 ALTER TABLE `object_relations_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_1`
--

DROP TABLE IF EXISTS `object_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `brandName` varchar(190) DEFAULT NULL,
  `brandDescription` longtext,
  `brandLogo` int DEFAULT NULL,
  `brandCreatedAt` bigint DEFAULT NULL,
  `brandUpdatedAt` bigint DEFAULT NULL,
  `isBrandActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_1`
--

LOCK TABLES `object_store_1` WRITE;
/*!40000 ALTER TABLE `object_store_1` DISABLE KEYS */;
INSERT INTO `object_store_1` VALUES (5,'Audi','<p>german luxury car brand</p>\n',3,1617215400,1617215400,1);
/*!40000 ALTER TABLE `object_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_2`
--

DROP TABLE IF EXISTS `object_store_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_2` (
  `oo_id` int NOT NULL DEFAULT '0',
  `categoryName` varchar(190) DEFAULT NULL,
  `categoryDescription` longtext,
  `categoryCreatedAt` bigint DEFAULT NULL,
  `categoryUpdatedAt` bigint DEFAULT NULL,
  `isCategoryActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_2`
--

LOCK TABLES `object_store_2` WRITE;
/*!40000 ALTER TABLE `object_store_2` DISABLE KEYS */;
INSERT INTO `object_store_2` VALUES (8,'Sedan','<p>long luxury car</p>\n',1617215400,1617215400,1);
/*!40000 ALTER TABLE `object_store_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_3`
--

DROP TABLE IF EXISTS `object_store_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_3` (
  `oo_id` int NOT NULL DEFAULT '0',
  `productSKU` varchar(190) DEFAULT NULL,
  `productName` varchar(190) DEFAULT NULL,
  `productDescription` longtext,
  `productPrice__value` double DEFAULT NULL,
  `productPrice__unit` varchar(50) DEFAULT NULL,
  `productColour` varchar(190) DEFAULT NULL,
  `productLaunchDate` bigint DEFAULT NULL,
  `airbagCount` double DEFAULT NULL,
  `productEngine` varchar(190) DEFAULT NULL,
  `productLength__value` double DEFAULT NULL,
  `productLength__unit` varchar(50) DEFAULT NULL,
  `productCreatedAt` bigint DEFAULT NULL,
  `productUpdatedAt` bigint DEFAULT NULL,
  `isProductActive` tinyint(1) DEFAULT NULL,
  `productBrand` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_3`
--

LOCK TABLES `object_store_3` WRITE;
/*!40000 ALTER TABLE `object_store_3` DISABLE KEYS */;
INSERT INTO `object_store_3` VALUES (6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(7,'1001','A6','<p>german car</p>\n',2600000,'1','metal blue',1556044200,5,'normal  power engine',245,'3',1617215400,1617215400,1,'Audi');
/*!40000 ALTER TABLE `object_store_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_url_slugs`
--

DROP TABLE IF EXISTS `object_url_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_url_slugs` (
  `objectId` int NOT NULL DEFAULT '0',
  `classId` varchar(50) NOT NULL DEFAULT '0',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  `slug` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`,`siteId`),
  KEY `index` (`index`),
  KEY `objectId` (`objectId`),
  KEY `classId` (`classId`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `ownername` (`ownername`),
  KEY `slug` (`slug`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_url_slugs`
--

LOCK TABLES `object_url_slugs` WRITE;
/*!40000 ALTER TABLE `object_url_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_url_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `o_id` int unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `o_path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `o_index` int unsigned DEFAULT '0',
  `o_published` tinyint unsigned DEFAULT '1',
  `o_creationDate` int unsigned DEFAULT NULL,
  `o_modificationDate` int unsigned DEFAULT NULL,
  `o_userOwner` int unsigned DEFAULT NULL,
  `o_userModification` int unsigned DEFAULT NULL,
  `o_classId` varchar(50) DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  `o_childrenSortBy` enum('key','index') DEFAULT NULL,
  `o_childrenSortOrder` enum('ASC','DESC') DEFAULT NULL,
  `o_versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `index` (`o_index`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`),
  KEY `o_classId` (`o_classId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1617262051,1617262051,1,1,NULL,NULL,NULL,NULL,0),(2,1,'folder','Brand','/',NULL,1,1617277693,1617277691,2,2,NULL,NULL,NULL,NULL,2),(3,1,'folder','Category','/',NULL,1,1617277703,1617277702,2,2,NULL,NULL,NULL,NULL,2),(4,1,'folder','Product','/',NULL,1,1617277713,1617277712,2,2,NULL,NULL,NULL,NULL,2),(5,2,'object','Audi','/Brand/',0,1,1617277726,1617277833,2,2,'1','Brand',NULL,NULL,2),(6,4,'object','A4','/Product/',NULL,0,1617277858,1617277859,2,2,'3','Product',NULL,NULL,1),(7,4,'object','A6','/Product/',0,1,1617291707,1617292111,2,2,'3','Product',NULL,NULL,2),(8,3,'object','Sedan','/Category/',0,1,1617291777,1617291929,2,2,'2','Category',NULL,NULL,2);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimcore_migrations`
--

DROP TABLE IF EXISTS `pimcore_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pimcore_migrations` (
  `migration_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migrated_at` datetime NOT NULL,
  PRIMARY KEY (`migration_set`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimcore_migrations`
--

LOCK TABLES `pimcore_migrations` WRITE;
/*!40000 ALTER TABLE `pimcore_migrations` DISABLE KEYS */;
INSERT INTO `pimcore_migrations` VALUES ('pimcore_core','20180724144005','2021-04-01 12:57:37'),('pimcore_core','20180830113528','2021-04-01 12:57:37'),('pimcore_core','20180830122128','2021-04-01 12:57:37'),('pimcore_core','20180904201947','2021-04-01 12:57:37'),('pimcore_core','20180906142115','2021-04-01 12:57:37'),('pimcore_core','20180907115436','2021-04-01 12:57:37'),('pimcore_core','20180912140913','2021-04-01 12:57:37'),('pimcore_core','20180913132106','2021-04-01 12:57:37'),('pimcore_core','20180924111736','2021-04-01 12:57:37'),('pimcore_core','20181008132414','2021-04-01 12:57:37'),('pimcore_core','20181009135158','2021-04-01 12:57:37'),('pimcore_core','20181115114003','2021-04-01 12:57:37'),('pimcore_core','20181126094412','2021-04-01 12:57:37'),('pimcore_core','20181126144341','2021-04-01 12:57:37'),('pimcore_core','20181128074035','2021-04-01 12:57:37'),('pimcore_core','20181128112320','2021-04-01 12:57:37'),('pimcore_core','20181214145532','2021-04-01 12:57:37'),('pimcore_core','20190102143436','2021-04-01 12:57:37'),('pimcore_core','20190102153226','2021-04-01 12:57:37'),('pimcore_core','20190108131401','2021-04-01 12:57:37'),('pimcore_core','20190124105627','2021-04-01 12:57:37'),('pimcore_core','20190131074054','2021-04-01 12:57:37'),('pimcore_core','20190131095936','2021-04-01 12:57:37'),('pimcore_core','20190320133439','2021-04-01 12:57:37'),('pimcore_core','20190402073052','2021-04-01 12:57:37'),('pimcore_core','20190403120728','2021-04-01 12:57:37'),('pimcore_core','20190405112707','2021-04-01 12:57:37'),('pimcore_core','20190408084129','2021-04-01 12:57:37'),('pimcore_core','20190508074339','2021-04-01 12:57:37'),('pimcore_core','20190515130651','2021-04-01 12:57:37'),('pimcore_core','20190520151448','2021-04-01 12:57:37'),('pimcore_core','20190522130545','2021-04-01 12:57:37'),('pimcore_core','20190527121800','2021-04-01 12:57:37'),('pimcore_core','20190618154000','2021-04-01 12:57:37'),('pimcore_core','20190701141857','2021-04-01 12:57:37'),('pimcore_core','20190708175236','2021-04-01 12:57:37'),('pimcore_core','20190729085052','2021-04-01 12:57:37'),('pimcore_core','20190802090149','2021-04-01 12:57:38'),('pimcore_core','20190806160450','2021-04-01 12:57:38'),('pimcore_core','20190807121356','2021-04-01 12:57:38'),('pimcore_core','20190828142756','2021-04-01 12:57:38'),('pimcore_core','20190902085052','2021-04-01 12:57:38'),('pimcore_core','20190904154339','2021-04-01 12:57:38'),('pimcore_core','20191015131700','2021-04-01 12:57:38'),('pimcore_core','20191107141816','2021-04-01 12:57:38'),('pimcore_core','20191114123638','2021-04-01 12:57:38'),('pimcore_core','20191114132014','2021-04-01 12:57:38'),('pimcore_core','20191121150326','2021-04-01 12:57:38'),('pimcore_core','20191125135853','2021-04-01 12:57:38'),('pimcore_core','20191125200416','2021-04-01 12:57:38'),('pimcore_core','20191126130004','2021-04-01 12:57:38'),('pimcore_core','20191208175348','2021-04-01 12:57:38'),('pimcore_core','20191213115045','2021-04-01 12:57:38'),('pimcore_core','20191218073528','2021-04-01 12:57:38'),('pimcore_core','20191230103524','2021-04-01 12:57:38'),('pimcore_core','20191230104529','2021-04-01 12:57:38'),('pimcore_core','20200113120101','2021-04-01 12:57:38'),('pimcore_core','20200116181758','2021-04-01 12:57:38'),('pimcore_core','20200121095650','2021-04-01 12:57:38'),('pimcore_core','20200121131304','2021-04-01 12:57:38'),('pimcore_core','20200127102432','2021-04-01 12:57:39'),('pimcore_core','20200129102132','2021-04-01 12:57:39'),('pimcore_core','20200210101048','2021-04-01 12:57:39'),('pimcore_core','20200210164037','2021-04-01 12:57:39'),('pimcore_core','20200211115044','2021-04-01 12:57:39'),('pimcore_core','20200212130011','2021-04-01 12:57:39'),('pimcore_core','20200218104052','2021-04-01 12:57:39'),('pimcore_core','20200226102938','2021-04-01 12:57:39'),('pimcore_core','20200310122412','2021-04-01 12:57:39'),('pimcore_core','20200313092019','2021-04-01 12:57:39'),('pimcore_core','20200317163018','2021-04-01 12:57:39'),('pimcore_core','20200318100042','2021-04-01 12:57:39'),('pimcore_core','20200324141723','2021-04-01 12:57:39'),('pimcore_core','20200407120641','2021-04-01 12:57:39'),('pimcore_core','20200407132737','2021-04-01 12:57:39'),('pimcore_core','20200407145422','2021-04-01 12:57:39'),('pimcore_core','20200410112354','2021-04-01 12:57:39'),('pimcore_core','20200421142950','2021-04-01 12:57:39'),('pimcore_core','20200422090352','2021-04-01 12:57:39'),('pimcore_core','20200428082346','2021-04-01 12:57:39'),('pimcore_core','20200428111313','2021-04-01 12:57:39'),('pimcore_core','20200529121630','2021-04-01 12:57:39'),('pimcore_core','20200604110336','2021-04-01 12:57:39'),('pimcore_core','20200619071650','2021-04-01 12:57:39'),('pimcore_core','20200703093410','2021-04-01 12:57:39'),('pimcore_core','20200721123847','2021-04-01 12:57:39'),('pimcore_core','20200807105448','2021-04-01 12:57:39'),('pimcore_core','20200812160035','2021-04-01 12:57:39'),('pimcore_core','20200817133132','2021-04-01 12:57:39'),('pimcore_core','20200820151104','2021-04-01 12:57:39'),('pimcore_core','20200828091305','2021-04-01 12:57:39'),('pimcore_core','20200902111642','2021-04-01 12:57:39'),('pimcore_core','20201001133558','2021-04-01 12:57:39'),('pimcore_core','20201207132025','2021-04-01 12:57:40'),('pimcore_core','20210211152319','2021-04-01 12:57:40');
/*!40000 ALTER TABLE `pimcore_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `getall` (`cpath`,`ctype`,`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantityvalue_units` (
  `id` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(50) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `converter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baseunit` (`baseunit`),
  CONSTRAINT `fk_baseunit` FOREIGN KEY (`baseunit`) REFERENCES `quantityvalue_units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
INSERT INTO `quantityvalue_units` VALUES ('1',NULL,'INR','Indian Rupee','1',NULL,NULL,NULL,''),('10',NULL,'ft','feet','10',NULL,NULL,NULL,''),('2',NULL,'USD','United States Dollar','2',NULL,NULL,NULL,''),('3',NULL,'cm','Centimeter','3',NULL,NULL,NULL,''),('4',NULL,'in','Inch','4',NULL,NULL,NULL,''),('5',NULL,'kWh','Kilo Watt Hour','5',NULL,NULL,NULL,''),('6',NULL,'Whpm','Watt Hour per mile','6',NULL,NULL,NULL,''),('7',NULL,'kmpl','kilometer per litre','7',NULL,NULL,NULL,''),('8',NULL,'Kg','Kilo Gram','8',NULL,NULL,NULL,''),('9',NULL,'ton','ton','9',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recyclebin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('entire_uri','path_query','path','auto_create') NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceSite` int DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `regex` tinyint(1) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `expiry` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `routing_lookup` (`active`,`regex`,`sourceSite`,`source`,`type`,`expiry`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanitycheck` (
  `id` int unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `userId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_backend_data` (
  `id` int NOT NULL,
  `fullpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(190) DEFAULT NULL,
  `published` tinyint unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int DEFAULT NULL,
  `userModification` int DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (2,'/_default_upload_bucket','asset','folder','folder',1,1617277814,1617277814,1,0,'ID: 2  \nPath: /_default_upload_bucket  \n_default_upload_bucket default upload bucket',''),(2,'/Brand','object','folder','folder',1,1617277693,1617277691,2,2,'ID: 2  \nPath: /Brand  \nBrand Brand',''),(3,'/_default_upload_bucket/carlogo02.png','asset','image','image',1,1617277815,1617277815,2,2,'ID: 3  \nPath: /_default_upload_bucket/carlogo02.png  \ncarlogo02.png default upload bucket carlogo02 png',''),(3,'/Category','object','folder','folder',1,1617277703,1617277702,2,2,'ID: 3  \nPath: /Category  \nCategory Category',''),(4,'/_default_upload_bucket/ciaz.png','asset','image','image',1,1617292005,1617292005,2,2,'ID: 4  \nPath: /_default_upload_bucket/ciaz.png  \nciaz.png FileName ciaz.png FileDateTime 1617292005 FileSize 7318 FileType MimeType image/jpeg SectionsFound default upload bucket ciaz png',''),(4,'/Product','object','folder','folder',1,1617277713,1617277712,2,2,'ID: 4  \nPath: /Product  \nProduct Product',''),(5,'/Brand/Audi','object','object','Brand',1,1617277726,1617277833,2,2,'ID: 5  \nPath: /Brand/Audi  \nAudi Audi german luxury car brand Brand Audi',''),(6,'/Product/A4','object','object','Product',0,1617277858,1617277859,2,2,'ID: 6  \nPath: /Product/A4  \nProduct',''),(7,'/Product/A6','object','object','Product',1,1617291707,1617292111,2,2,'ID: 7  \nPath: /Product/A6  \n1001 german car Audi 2600000 INR metal blue normal power engine 245 20.1 kmpl Petrol Product',''),(8,'/Category/Sedan','object','object','Category',1,1617291777,1617291929,2,2,'ID: 8  \nPath: /Category/Sedan  \nSedan Sedan long luxury car Category Sedan','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `idPath` varchar(190) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idPath_name` (`idPath`,`name`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_assignment` (
  `tagid` int unsigned NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `prio` smallint unsigned NOT NULL DEFAULT '0',
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_storage`
--

DROP TABLE IF EXISTS `targeting_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_storage` (
  `visitorId` varchar(100) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `creationDate` datetime DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitorId`,`scope`,`name`),
  KEY `targeting_storage_scope_index` (`scope`),
  KEY `targeting_storage_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_storage`
--

LOCK TABLES `targeting_storage` WRITE;
/*!40000 ALTER TABLE `targeting_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_target_groups`
--

DROP TABLE IF EXISTS `targeting_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_target_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `threshold` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_target_groups`
--

LOCK TABLES `targeting_target_groups` WRITE;
/*!40000 ALTER TABLE `targeting_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint NOT NULL DEFAULT '0',
  `date` int unsigned DEFAULT NULL,
  `expiryDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
INSERT INTO `tmp_store` VALUES ('thumb_3__76daf7d03329faf7dd099e3e05cde0ec','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__3__pimcore-system-treepreview/carlogo02.jpg',0,1617277815,1617882615),('thumb_3__f72f45e3c62359412ae96b020f376b83','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__3__auto_6eff904a1a9a57680d726da3d5459ac7/carlogo02.png',0,1617277819,1617882619),('thumb_4__2b1eacb27f13187f922c57c46390cd56','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__4__pimcore-system-treepreview/ciaz.jpg',0,1617292006,1617896806),('thumb_4__2ca7ab40647dbb5ec7518fc5b1d74053','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__4__auto_6eff904a1a9a57680d726da3d5459ac7/ciaz.png',0,1617292008,1617896808);
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `data` varchar(190) DEFAULT NULL,
  `timestamp` int unsigned DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `day` int unsigned DEFAULT NULL,
  `dayOfWeek` int unsigned DEFAULT NULL,
  `dayOfYear` int unsigned DEFAULT NULL,
  `weekOfYear` int unsigned DEFAULT NULL,
  `hour` int unsigned DEFAULT NULL,
  `minute` int unsigned DEFAULT NULL,
  `second` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES ('Airbag Count','cs','',1617277893,1617277893),('Airbag Count','de','',1617277893,1617277893),('Airbag Count','en','',1617277893,1617277893),('Airbag Count','es','',1617277893,1617277893),('Airbag Count','fa','',1617277893,1617277893),('Airbag Count','fr','',1617277893,1617277893),('Airbag Count','hu','',1617277893,1617277893),('Airbag Count','it','',1617277893,1617277893),('Airbag Count','ja','',1617277893,1617277893),('Airbag Count','nl','',1617277893,1617277893),('Airbag Count','pl','',1617277893,1617277893),('Airbag Count','pt_BR','',1617277893,1617277893),('Airbag Count','ru','',1617277893,1617277893),('Airbag Count','sk','',1617277893,1617277893),('Airbag Count','sv','',1617277893,1617277893),('Airbag Count','sv_FI','',1617277893,1617277893),('Airbag Count','th','',1617277893,1617277893),('Airbag Count','tr','',1617277893,1617277893),('Airbag Count','uk','',1617277893,1617277893),('Airbag Count','zh_Hans','',1617277893,1617277893),('Audi','cs','',1617277891,1617277891),('Audi','de','',1617277891,1617277891),('Audi','en','',1617277891,1617277891),('Audi','es','',1617277891,1617277891),('Audi','fa','',1617277891,1617277891),('Audi','fr','',1617277891,1617277891),('Audi','hu','',1617277891,1617277891),('Audi','it','',1617277891,1617277891),('Audi','ja','',1617277891,1617277891),('Audi','nl','',1617277891,1617277891),('Audi','pl','',1617277891,1617277891),('Audi','pt_BR','',1617277891,1617277891),('Audi','ru','',1617277891,1617277891),('Audi','sk','',1617277891,1617277891),('Audi','sv','',1617277891,1617277891),('Audi','sv_FI','',1617277891,1617277891),('Audi','th','',1617277891,1617277891),('Audi','tr','',1617277891,1617277891),('Audi','uk','',1617277891,1617277891),('Audi','zh_Hans','',1617277891,1617277891),('Brand','cs','',1617267585,1617267585),('Brand','de','',1617267585,1617267585),('Brand','en','',1617267585,1617267585),('Brand','es','',1617267585,1617267585),('Brand','fa','',1617267585,1617267585),('Brand','fr','',1617267585,1617267585),('Brand','hu','',1617267585,1617267585),('Brand','it','',1617267585,1617267585),('Brand','ja','',1617267585,1617267585),('Brand','nl','',1617267585,1617267585),('Brand','pl','',1617267585,1617267585),('Brand','pt_BR','',1617267585,1617267585),('Brand','ru','',1617267585,1617267585),('Brand','sk','',1617267585,1617267585),('Brand','sv','',1617267585,1617267585),('Brand','sv_FI','',1617267585,1617267585),('Brand','th','',1617267585,1617267585),('Brand','tr','',1617267585,1617267585),('Brand','uk','',1617267585,1617267585),('Brand','zh_Hans','',1617267585,1617267585),('Brand CreatedAt','cs','',1617277747,1617277747),('Brand CreatedAt','de','',1617277747,1617277747),('Brand CreatedAt','en','',1617277747,1617277747),('Brand CreatedAt','es','',1617277747,1617277747),('Brand CreatedAt','fa','',1617277747,1617277747),('Brand CreatedAt','fr','',1617277747,1617277747),('Brand CreatedAt','hu','',1617277747,1617277747),('Brand CreatedAt','it','',1617277747,1617277747),('Brand CreatedAt','ja','',1617277747,1617277747),('Brand CreatedAt','nl','',1617277747,1617277747),('Brand CreatedAt','pl','',1617277747,1617277747),('Brand CreatedAt','pt_BR','',1617277747,1617277747),('Brand CreatedAt','ru','',1617277747,1617277747),('Brand CreatedAt','sk','',1617277747,1617277747),('Brand CreatedAt','sv','',1617277747,1617277747),('Brand CreatedAt','sv_FI','',1617277747,1617277747),('Brand CreatedAt','th','',1617277747,1617277747),('Brand CreatedAt','tr','',1617277747,1617277747),('Brand CreatedAt','uk','',1617277747,1617277747),('Brand CreatedAt','zh_Hans','',1617277747,1617277747),('Brand Description','cs','',1617277744,1617277744),('Brand Description','de','',1617277744,1617277744),('Brand Description','en','',1617277744,1617277744),('Brand Description','es','',1617277744,1617277744),('Brand Description','fa','',1617277744,1617277744),('Brand Description','fr','',1617277744,1617277744),('Brand Description','hu','',1617277744,1617277744),('Brand Description','it','',1617277744,1617277744),('Brand Description','ja','',1617277744,1617277744),('Brand Description','nl','',1617277744,1617277744),('Brand Description','pl','',1617277744,1617277744),('Brand Description','pt_BR','',1617277744,1617277744),('Brand Description','ru','',1617277744,1617277744),('Brand Description','sk','',1617277744,1617277744),('Brand Description','sv','',1617277744,1617277744),('Brand Description','sv_FI','',1617277744,1617277744),('Brand Description','th','',1617277744,1617277744),('Brand Description','tr','',1617277744,1617277744),('Brand Description','uk','',1617277744,1617277744),('Brand Description','zh_Hans','',1617277744,1617277744),('Brand Logo','cs','',1617277745,1617277745),('Brand Logo','de','',1617277745,1617277745),('Brand Logo','en','',1617277745,1617277745),('Brand Logo','es','',1617277745,1617277745),('Brand Logo','fa','',1617277745,1617277745),('Brand Logo','fr','',1617277745,1617277745),('Brand Logo','hu','',1617277745,1617277745),('Brand Logo','it','',1617277745,1617277745),('Brand Logo','ja','',1617277745,1617277745),('Brand Logo','nl','',1617277745,1617277745),('Brand Logo','pl','',1617277745,1617277745),('Brand Logo','pt_BR','',1617277745,1617277745),('Brand Logo','ru','',1617277745,1617277745),('Brand Logo','sk','',1617277745,1617277745),('Brand Logo','sv','',1617277745,1617277745),('Brand Logo','sv_FI','',1617277745,1617277745),('Brand Logo','th','',1617277745,1617277745),('Brand Logo','tr','',1617277745,1617277745),('Brand Logo','uk','',1617277745,1617277745),('Brand Logo','zh_Hans','',1617277745,1617277745),('Brand Name','cs','',1617277743,1617277743),('Brand Name','de','',1617277743,1617277743),('Brand Name','en','',1617277743,1617277743),('Brand Name','es','',1617277743,1617277743),('Brand Name','fa','',1617277743,1617277743),('Brand Name','fr','',1617277743,1617277743),('Brand Name','hu','',1617277743,1617277743),('Brand Name','it','',1617277743,1617277743),('Brand Name','ja','',1617277743,1617277743),('Brand Name','nl','',1617277743,1617277743),('Brand Name','pl','',1617277743,1617277743),('Brand Name','pt_BR','',1617277743,1617277743),('Brand Name','ru','',1617277743,1617277743),('Brand Name','sk','',1617277743,1617277743),('Brand Name','sv','',1617277743,1617277743),('Brand Name','sv_FI','',1617277743,1617277743),('Brand Name','th','',1617277743,1617277743),('Brand Name','tr','',1617277743,1617277743),('Brand Name','uk','',1617277743,1617277743),('Brand Name','zh_Hans','',1617277743,1617277743),('Brand UpdatedAt','cs','',1617277748,1617277748),('Brand UpdatedAt','de','',1617277748,1617277748),('Brand UpdatedAt','en','',1617277748,1617277748),('Brand UpdatedAt','es','',1617277748,1617277748),('Brand UpdatedAt','fa','',1617277748,1617277748),('Brand UpdatedAt','fr','',1617277748,1617277748),('Brand UpdatedAt','hu','',1617277748,1617277748),('Brand UpdatedAt','it','',1617277748,1617277748),('Brand UpdatedAt','ja','',1617277748,1617277748),('Brand UpdatedAt','nl','',1617277748,1617277748),('Brand UpdatedAt','pl','',1617277748,1617277748),('Brand UpdatedAt','pt_BR','',1617277748,1617277748),('Brand UpdatedAt','ru','',1617277748,1617277748),('Brand UpdatedAt','sk','',1617277748,1617277748),('Brand UpdatedAt','sv','',1617277748,1617277748),('Brand UpdatedAt','sv_FI','',1617277748,1617277748),('Brand UpdatedAt','th','',1617277748,1617277748),('Brand UpdatedAt','tr','',1617277748,1617277748),('Brand UpdatedAt','uk','',1617277748,1617277748),('Brand UpdatedAt','zh_Hans','',1617277748,1617277748),('CNG','cs','',1617292115,1617292115),('CNG','de','',1617292115,1617292115),('CNG','en','',1617292115,1617292115),('CNG','es','',1617292115,1617292115),('CNG','fa','',1617292115,1617292115),('CNG','fr','',1617292115,1617292115),('CNG','hu','',1617292115,1617292115),('CNG','it','',1617292115,1617292115),('CNG','ja','',1617292115,1617292115),('CNG','nl','',1617292115,1617292115),('CNG','pl','',1617292115,1617292115),('CNG','pt_BR','',1617292115,1617292115),('CNG','ru','',1617292115,1617292115),('CNG','sk','',1617292115,1617292115),('CNG','sv','',1617292115,1617292115),('CNG','sv_FI','',1617292115,1617292115),('CNG','th','',1617292115,1617292115),('CNG','tr','',1617292115,1617292115),('CNG','uk','',1617292115,1617292115),('CNG','zh_Hans','',1617292115,1617292115),('Category','cs','',1617267897,1617267897),('Category','de','',1617267897,1617267897),('Category','en','',1617267897,1617267897),('Category','es','',1617267897,1617267897),('Category','fa','',1617267897,1617267897),('Category','fr','',1617267897,1617267897),('Category','hu','',1617267897,1617267897),('Category','it','',1617267897,1617267897),('Category','ja','',1617267897,1617267897),('Category','nl','',1617267897,1617267897),('Category','pl','',1617267897,1617267897),('Category','pt_BR','',1617267897,1617267897),('Category','ru','',1617267897,1617267897),('Category','sk','',1617267897,1617267897),('Category','sv','',1617267897,1617267897),('Category','sv_FI','',1617267897,1617267897),('Category','th','',1617267897,1617267897),('Category','tr','',1617267897,1617267897),('Category','uk','',1617267897,1617267897),('Category','zh_Hans','',1617267897,1617267897),('Category CreatedAt','cs','',1617291783,1617291783),('Category CreatedAt','de','',1617291783,1617291783),('Category CreatedAt','en','',1617291783,1617291783),('Category CreatedAt','es','',1617291783,1617291783),('Category CreatedAt','fa','',1617291783,1617291783),('Category CreatedAt','fr','',1617291783,1617291783),('Category CreatedAt','hu','',1617291783,1617291783),('Category CreatedAt','it','',1617291783,1617291783),('Category CreatedAt','ja','',1617291783,1617291783),('Category CreatedAt','nl','',1617291783,1617291783),('Category CreatedAt','pl','',1617291783,1617291783),('Category CreatedAt','pt_BR','',1617291783,1617291783),('Category CreatedAt','ru','',1617291783,1617291783),('Category CreatedAt','sk','',1617291783,1617291783),('Category CreatedAt','sv','',1617291783,1617291783),('Category CreatedAt','sv_FI','',1617291783,1617291783),('Category CreatedAt','th','',1617291783,1617291783),('Category CreatedAt','tr','',1617291783,1617291783),('Category CreatedAt','uk','',1617291783,1617291783),('Category CreatedAt','zh_Hans','',1617291783,1617291783),('Category Description','cs','',1617291783,1617291783),('Category Description','de','',1617291783,1617291783),('Category Description','en','',1617291783,1617291783),('Category Description','es','',1617291783,1617291783),('Category Description','fa','',1617291783,1617291783),('Category Description','fr','',1617291783,1617291783),('Category Description','hu','',1617291783,1617291783),('Category Description','it','',1617291783,1617291783),('Category Description','ja','',1617291783,1617291783),('Category Description','nl','',1617291783,1617291783),('Category Description','pl','',1617291783,1617291783),('Category Description','pt_BR','',1617291783,1617291783),('Category Description','ru','',1617291783,1617291783),('Category Description','sk','',1617291783,1617291783),('Category Description','sv','',1617291783,1617291783),('Category Description','sv_FI','',1617291783,1617291783),('Category Description','th','',1617291783,1617291783),('Category Description','tr','',1617291783,1617291783),('Category Description','uk','',1617291783,1617291783),('Category Description','zh_Hans','',1617291783,1617291783),('Category Name','cs','',1617291782,1617291782),('Category Name','de','',1617291782,1617291782),('Category Name','en','',1617291782,1617291782),('Category Name','es','',1617291782,1617291782),('Category Name','fa','',1617291782,1617291782),('Category Name','fr','',1617291782,1617291782),('Category Name','hu','',1617291782,1617291782),('Category Name','it','',1617291782,1617291782),('Category Name','ja','',1617291782,1617291782),('Category Name','nl','',1617291782,1617291782),('Category Name','pl','',1617291782,1617291782),('Category Name','pt_BR','',1617291782,1617291782),('Category Name','ru','',1617291782,1617291782),('Category Name','sk','',1617291782,1617291782),('Category Name','sv','',1617291782,1617291782),('Category Name','sv_FI','',1617291782,1617291782),('Category Name','th','',1617291782,1617291782),('Category Name','tr','',1617291782,1617291782),('Category Name','uk','',1617291782,1617291782),('Category Name','zh_Hans','',1617291782,1617291782),('Category UpdatedAt','cs','',1617291784,1617291784),('Category UpdatedAt','de','',1617291784,1617291784),('Category UpdatedAt','en','',1617291784,1617291784),('Category UpdatedAt','es','',1617291784,1617291784),('Category UpdatedAt','fa','',1617291784,1617291784),('Category UpdatedAt','fr','',1617291784,1617291784),('Category UpdatedAt','hu','',1617291784,1617291784),('Category UpdatedAt','it','',1617291784,1617291784),('Category UpdatedAt','ja','',1617291784,1617291784),('Category UpdatedAt','nl','',1617291784,1617291784),('Category UpdatedAt','pl','',1617291784,1617291784),('Category UpdatedAt','pt_BR','',1617291784,1617291784),('Category UpdatedAt','ru','',1617291784,1617291784),('Category UpdatedAt','sk','',1617291784,1617291784),('Category UpdatedAt','sv','',1617291784,1617291784),('Category UpdatedAt','sv_FI','',1617291784,1617291784),('Category UpdatedAt','th','',1617291784,1617291784),('Category UpdatedAt','tr','',1617291784,1617291784),('Category UpdatedAt','uk','',1617291784,1617291784),('Category UpdatedAt','zh_Hans','',1617291784,1617291784),('Centimeter','cs','',1617269093,1617269093),('Centimeter','de','',1617269093,1617269093),('Centimeter','en','',1617269093,1617269093),('Centimeter','es','',1617269093,1617269093),('Centimeter','fa','',1617269093,1617269093),('Centimeter','fr','',1617269093,1617269093),('Centimeter','hu','',1617269093,1617269093),('Centimeter','it','',1617269093,1617269093),('Centimeter','ja','',1617269093,1617269093),('Centimeter','nl','',1617269093,1617269093),('Centimeter','pl','',1617269093,1617269093),('Centimeter','pt_BR','',1617269093,1617269093),('Centimeter','ru','',1617269093,1617269093),('Centimeter','sk','',1617269093,1617269093),('Centimeter','sv','',1617269093,1617269093),('Centimeter','sv_FI','',1617269093,1617269093),('Centimeter','th','',1617269093,1617269093),('Centimeter','tr','',1617269093,1617269093),('Centimeter','uk','',1617269093,1617269093),('Centimeter','zh_Hans','',1617269093,1617269093),('CombustionTruck','cs','',1617291722,1617291722),('CombustionTruck','de','',1617291722,1617291722),('CombustionTruck','en','',1617291722,1617291722),('CombustionTruck','es','',1617291722,1617291722),('CombustionTruck','fa','',1617291722,1617291722),('CombustionTruck','fr','',1617291722,1617291722),('CombustionTruck','hu','',1617291722,1617291722),('CombustionTruck','it','',1617291722,1617291722),('CombustionTruck','ja','',1617291722,1617291722),('CombustionTruck','nl','',1617291722,1617291722),('CombustionTruck','pl','',1617291722,1617291722),('CombustionTruck','pt_BR','',1617291722,1617291722),('CombustionTruck','ru','',1617291722,1617291722),('CombustionTruck','sk','',1617291722,1617291722),('CombustionTruck','sv','',1617291722,1617291722),('CombustionTruck','sv_FI','',1617291722,1617291722),('CombustionTruck','th','',1617291722,1617291722),('CombustionTruck','tr','',1617291722,1617291722),('CombustionTruck','uk','',1617291722,1617291722),('CombustionTruck','zh_Hans','',1617291722,1617291722),('CoumbustionCar','cs','',1617291722,1617291722),('CoumbustionCar','de','',1617291722,1617291722),('CoumbustionCar','en','',1617291722,1617291722),('CoumbustionCar','es','',1617291722,1617291722),('CoumbustionCar','fa','',1617291722,1617291722),('CoumbustionCar','fr','',1617291722,1617291722),('CoumbustionCar','hu','',1617291722,1617291722),('CoumbustionCar','it','',1617291722,1617291722),('CoumbustionCar','ja','',1617291722,1617291722),('CoumbustionCar','nl','',1617291722,1617291722),('CoumbustionCar','pl','',1617291722,1617291722),('CoumbustionCar','pt_BR','',1617291722,1617291722),('CoumbustionCar','ru','',1617291722,1617291722),('CoumbustionCar','sk','',1617291722,1617291722),('CoumbustionCar','sv','',1617291722,1617291722),('CoumbustionCar','sv_FI','',1617291722,1617291722),('CoumbustionCar','th','',1617291722,1617291722),('CoumbustionCar','tr','',1617291722,1617291722),('CoumbustionCar','uk','',1617291722,1617291722),('CoumbustionCar','zh_Hans','',1617291722,1617291722),('Diesel','cs','',1617292114,1617292114),('Diesel','de','',1617292114,1617292114),('Diesel','en','',1617292114,1617292114),('Diesel','es','',1617292114,1617292114),('Diesel','fa','',1617292114,1617292114),('Diesel','fr','',1617292114,1617292114),('Diesel','hu','',1617292114,1617292114),('Diesel','it','',1617292114,1617292114),('Diesel','ja','',1617292114,1617292114),('Diesel','nl','',1617292114,1617292114),('Diesel','pl','',1617292114,1617292114),('Diesel','pt_BR','',1617292114,1617292114),('Diesel','ru','',1617292114,1617292114),('Diesel','sk','',1617292114,1617292114),('Diesel','sv','',1617292114,1617292114),('Diesel','sv_FI','',1617292114,1617292114),('Diesel','th','',1617292114,1617292114),('Diesel','tr','',1617292114,1617292114),('Diesel','uk','',1617292114,1617292114),('Diesel','zh_Hans','',1617292114,1617292114),('ElectricCar','cs','',1617291723,1617291723),('ElectricCar','de','',1617291723,1617291723),('ElectricCar','en','',1617291723,1617291723),('ElectricCar','es','',1617291723,1617291723),('ElectricCar','fa','',1617291723,1617291723),('ElectricCar','fr','',1617291723,1617291723),('ElectricCar','hu','',1617291723,1617291723),('ElectricCar','it','',1617291723,1617291723),('ElectricCar','ja','',1617291723,1617291723),('ElectricCar','nl','',1617291723,1617291723),('ElectricCar','pl','',1617291723,1617291723),('ElectricCar','pt_BR','',1617291723,1617291723),('ElectricCar','ru','',1617291723,1617291723),('ElectricCar','sk','',1617291723,1617291723),('ElectricCar','sv','',1617291723,1617291723),('ElectricCar','sv_FI','',1617291723,1617291723),('ElectricCar','th','',1617291723,1617291723),('ElectricCar','tr','',1617291723,1617291723),('ElectricCar','uk','',1617291723,1617291723),('ElectricCar','zh_Hans','',1617291723,1617291723),('ElectricHatchback','cs','',1617288192,1617288192),('ElectricHatchback','de','',1617288192,1617288192),('ElectricHatchback','en','',1617288192,1617288192),('ElectricHatchback','es','',1617288192,1617288192),('ElectricHatchback','fa','',1617288192,1617288192),('ElectricHatchback','fr','',1617288192,1617288192),('ElectricHatchback','hu','',1617288192,1617288192),('ElectricHatchback','it','',1617288192,1617288192),('ElectricHatchback','ja','',1617288192,1617288192),('ElectricHatchback','nl','',1617288192,1617288192),('ElectricHatchback','pl','',1617288192,1617288192),('ElectricHatchback','pt_BR','',1617288192,1617288192),('ElectricHatchback','ru','',1617288192,1617288192),('ElectricHatchback','sk','',1617288192,1617288192),('ElectricHatchback','sv','',1617288192,1617288192),('ElectricHatchback','sv_FI','',1617288192,1617288192),('ElectricHatchback','th','',1617288192,1617288192),('ElectricHatchback','tr','',1617288192,1617288192),('ElectricHatchback','uk','',1617288192,1617288192),('ElectricHatchback','zh_Hans','',1617288192,1617288192),('ElectricSedan','cs','',1617288193,1617288193),('ElectricSedan','de','',1617288193,1617288193),('ElectricSedan','en','',1617288193,1617288193),('ElectricSedan','es','',1617288193,1617288193),('ElectricSedan','fa','',1617288193,1617288193),('ElectricSedan','fr','',1617288193,1617288193),('ElectricSedan','hu','',1617288193,1617288193),('ElectricSedan','it','',1617288193,1617288193),('ElectricSedan','ja','',1617288193,1617288193),('ElectricSedan','nl','',1617288193,1617288193),('ElectricSedan','pl','',1617288193,1617288193),('ElectricSedan','pt_BR','',1617288193,1617288193),('ElectricSedan','ru','',1617288193,1617288193),('ElectricSedan','sk','',1617288193,1617288193),('ElectricSedan','sv','',1617288193,1617288193),('ElectricSedan','sv_FI','',1617288193,1617288193),('ElectricSedan','th','',1617288193,1617288193),('ElectricSedan','tr','',1617288193,1617288193),('ElectricSedan','uk','',1617288193,1617288193),('ElectricSedan','zh_Hans','',1617288193,1617288193),('ElectricTruck','cs','',1617291723,1617291723),('ElectricTruck','de','',1617291723,1617291723),('ElectricTruck','en','',1617291723,1617291723),('ElectricTruck','es','',1617291723,1617291723),('ElectricTruck','fa','',1617291723,1617291723),('ElectricTruck','fr','',1617291723,1617291723),('ElectricTruck','hu','',1617291723,1617291723),('ElectricTruck','it','',1617291723,1617291723),('ElectricTruck','ja','',1617291723,1617291723),('ElectricTruck','nl','',1617291723,1617291723),('ElectricTruck','pl','',1617291723,1617291723),('ElectricTruck','pt_BR','',1617291723,1617291723),('ElectricTruck','ru','',1617291723,1617291723),('ElectricTruck','sk','',1617291723,1617291723),('ElectricTruck','sv','',1617291723,1617291723),('ElectricTruck','sv_FI','',1617291723,1617291723),('ElectricTruck','th','',1617291723,1617291723),('ElectricTruck','tr','',1617291723,1617291723),('ElectricTruck','uk','',1617291723,1617291723),('ElectricTruck','zh_Hans','',1617291723,1617291723),('Fuel Type','cs','',1617292114,1617292114),('Fuel Type','de','',1617292114,1617292114),('Fuel Type','en','',1617292114,1617292114),('Fuel Type','es','',1617292114,1617292114),('Fuel Type','fa','',1617292114,1617292114),('Fuel Type','fr','',1617292114,1617292114),('Fuel Type','hu','',1617292114,1617292114),('Fuel Type','it','',1617292114,1617292114),('Fuel Type','ja','',1617292114,1617292114),('Fuel Type','nl','',1617292114,1617292114),('Fuel Type','pl','',1617292114,1617292114),('Fuel Type','pt_BR','',1617292114,1617292114),('Fuel Type','ru','',1617292114,1617292114),('Fuel Type','sk','',1617292114,1617292114),('Fuel Type','sv','',1617292114,1617292114),('Fuel Type','sv_FI','',1617292114,1617292114),('Fuel Type','th','',1617292114,1617292114),('Fuel Type','tr','',1617292114,1617292114),('Fuel Type','uk','',1617292114,1617292114),('Fuel Type','zh_Hans','',1617292114,1617292114),('INR','cs','',1617268611,1617268611),('INR','de','',1617268611,1617268611),('INR','en','',1617268611,1617268611),('INR','es','',1617268611,1617268611),('INR','fa','',1617268611,1617268611),('INR','fr','',1617268611,1617268611),('INR','hu','',1617268611,1617268611),('INR','it','',1617268611,1617268611),('INR','ja','',1617268611,1617268611),('INR','nl','',1617268611,1617268611),('INR','pl','',1617268611,1617268611),('INR','pt_BR','',1617268611,1617268611),('INR','ru','',1617268611,1617268611),('INR','sk','',1617268611,1617268611),('INR','sv','',1617268611,1617268611),('INR','sv_FI','',1617268611,1617268611),('INR','th','',1617268611,1617268611),('INR','tr','',1617268611,1617268611),('INR','uk','',1617268611,1617268611),('INR','zh_Hans','',1617268611,1617268611),('Inch','cs','',1617269113,1617269113),('Inch','de','',1617269113,1617269113),('Inch','en','',1617269113,1617269113),('Inch','es','',1617269113,1617269113),('Inch','fa','',1617269113,1617269113),('Inch','fr','',1617269113,1617269113),('Inch','hu','',1617269113,1617269113),('Inch','it','',1617269113,1617269113),('Inch','ja','',1617269113,1617269113),('Inch','nl','',1617269113,1617269113),('Inch','pl','',1617269113,1617269113),('Inch','pt_BR','',1617269113,1617269113),('Inch','ru','',1617269113,1617269113),('Inch','sk','',1617269113,1617269113),('Inch','sv','',1617269113,1617269113),('Inch','sv_FI','',1617269113,1617269113),('Inch','th','',1617269113,1617269113),('Inch','tr','',1617269113,1617269113),('Inch','uk','',1617269113,1617269113),('Inch','zh_Hans','',1617269113,1617269113),('Indian Rupee','cs','',1617268623,1617268623),('Indian Rupee','de','',1617268623,1617268623),('Indian Rupee','en','',1617268623,1617268623),('Indian Rupee','es','',1617268623,1617268623),('Indian Rupee','fa','',1617268623,1617268623),('Indian Rupee','fr','',1617268623,1617268623),('Indian Rupee','hu','',1617268623,1617268623),('Indian Rupee','it','',1617268623,1617268623),('Indian Rupee','ja','',1617268623,1617268623),('Indian Rupee','nl','',1617268623,1617268623),('Indian Rupee','pl','',1617268623,1617268623),('Indian Rupee','pt_BR','',1617268623,1617268623),('Indian Rupee','ru','',1617268623,1617268623),('Indian Rupee','sk','',1617268623,1617268623),('Indian Rupee','sv','',1617268623,1617268623),('Indian Rupee','sv_FI','',1617268623,1617268623),('Indian Rupee','th','',1617268623,1617268623),('Indian Rupee','tr','',1617268623,1617268623),('Indian Rupee','uk','',1617268623,1617268623),('Indian Rupee','zh_Hans','',1617268623,1617268623),('Kg','cs','',1617270834,1617270834),('Kg','de','',1617270834,1617270834),('Kg','en','',1617270834,1617270834),('Kg','es','',1617270834,1617270834),('Kg','fa','',1617270834,1617270834),('Kg','fr','',1617270834,1617270834),('Kg','hu','',1617270834,1617270834),('Kg','it','',1617270834,1617270834),('Kg','ja','',1617270834,1617270834),('Kg','nl','',1617270834,1617270834),('Kg','pl','',1617270834,1617270834),('Kg','pt_BR','',1617270834,1617270834),('Kg','ru','',1617270834,1617270834),('Kg','sk','',1617270834,1617270834),('Kg','sv','',1617270834,1617270834),('Kg','sv_FI','',1617270834,1617270834),('Kg','th','',1617270834,1617270834),('Kg','tr','',1617270834,1617270834),('Kg','uk','',1617270834,1617270834),('Kg','zh_Hans','',1617270834,1617270834),('Kilo Gram','cs','',1617270845,1617270845),('Kilo Gram','de','',1617270845,1617270845),('Kilo Gram','en','',1617270845,1617270845),('Kilo Gram','es','',1617270845,1617270845),('Kilo Gram','fa','',1617270845,1617270845),('Kilo Gram','fr','',1617270845,1617270845),('Kilo Gram','hu','',1617270845,1617270845),('Kilo Gram','it','',1617270845,1617270845),('Kilo Gram','ja','',1617270845,1617270845),('Kilo Gram','nl','',1617270845,1617270845),('Kilo Gram','pl','',1617270845,1617270845),('Kilo Gram','pt_BR','',1617270845,1617270845),('Kilo Gram','ru','',1617270845,1617270845),('Kilo Gram','sk','',1617270845,1617270845),('Kilo Gram','sv','',1617270845,1617270845),('Kilo Gram','sv_FI','',1617270845,1617270845),('Kilo Gram','th','',1617270845,1617270845),('Kilo Gram','tr','',1617270845,1617270845),('Kilo Gram','uk','',1617270845,1617270845),('Kilo Gram','zh_Hans','',1617270845,1617270845),('Kilo Watt Hour','cs','',1617269426,1617269426),('Kilo Watt Hour','de','',1617269426,1617269426),('Kilo Watt Hour','en','',1617269426,1617269426),('Kilo Watt Hour','es','',1617269426,1617269426),('Kilo Watt Hour','fa','',1617269426,1617269426),('Kilo Watt Hour','fr','',1617269426,1617269426),('Kilo Watt Hour','hu','',1617269426,1617269426),('Kilo Watt Hour','it','',1617269426,1617269426),('Kilo Watt Hour','ja','',1617269426,1617269426),('Kilo Watt Hour','nl','',1617269426,1617269426),('Kilo Watt Hour','pl','',1617269426,1617269426),('Kilo Watt Hour','pt_BR','',1617269426,1617269426),('Kilo Watt Hour','ru','',1617269426,1617269426),('Kilo Watt Hour','sk','',1617269426,1617269426),('Kilo Watt Hour','sv','',1617269426,1617269426),('Kilo Watt Hour','sv_FI','',1617269426,1617269426),('Kilo Watt Hour','th','',1617269426,1617269426),('Kilo Watt Hour','tr','',1617269426,1617269426),('Kilo Watt Hour','uk','',1617269426,1617269426),('Kilo Watt Hour','zh_Hans','',1617269426,1617269426),('Master','cs','',1617277742,1617277742),('Master','de','',1617277742,1617277742),('Master','en','',1617277742,1617277742),('Master','es','',1617277742,1617277742),('Master','fa','',1617277742,1617277742),('Master','fr','',1617277742,1617277742),('Master','hu','',1617277742,1617277742),('Master','it','',1617277742,1617277742),('Master','ja','',1617277742,1617277742),('Master','nl','',1617277742,1617277742),('Master','pl','',1617277742,1617277742),('Master','pt_BR','',1617277742,1617277742),('Master','ru','',1617277742,1617277742),('Master','sk','',1617277742,1617277742),('Master','sv','',1617277742,1617277742),('Master','sv_FI','',1617277742,1617277742),('Master','th','',1617277742,1617277742),('Master','tr','',1617277742,1617277742),('Master','uk','',1617277742,1617277742),('Master','zh_Hans','',1617277742,1617277742),('Master (Admin Mode)','cs','',1617277741,1617277741),('Master (Admin Mode)','de','',1617277741,1617277741),('Master (Admin Mode)','en','',1617277741,1617277741),('Master (Admin Mode)','es','',1617277741,1617277741),('Master (Admin Mode)','fa','',1617277741,1617277741),('Master (Admin Mode)','fr','',1617277741,1617277741),('Master (Admin Mode)','hu','',1617277741,1617277741),('Master (Admin Mode)','it','',1617277741,1617277741),('Master (Admin Mode)','ja','',1617277741,1617277741),('Master (Admin Mode)','nl','',1617277741,1617277741),('Master (Admin Mode)','pl','',1617277741,1617277741),('Master (Admin Mode)','pt_BR','',1617277741,1617277741),('Master (Admin Mode)','ru','',1617277741,1617277741),('Master (Admin Mode)','sk','',1617277741,1617277741),('Master (Admin Mode)','sv','',1617277741,1617277741),('Master (Admin Mode)','sv_FI','',1617277741,1617277741),('Master (Admin Mode)','th','',1617277741,1617277741),('Master (Admin Mode)','tr','',1617277741,1617277741),('Master (Admin Mode)','uk','',1617277741,1617277741),('Master (Admin Mode)','zh_Hans','',1617277741,1617277741),('Mileage','cs','',1617292113,1617292113),('Mileage','de','',1617292113,1617292113),('Mileage','en','',1617292113,1617292113),('Mileage','es','',1617292113,1617292113),('Mileage','fa','',1617292113,1617292113),('Mileage','fr','',1617292113,1617292113),('Mileage','hu','',1617292113,1617292113),('Mileage','it','',1617292113,1617292113),('Mileage','ja','',1617292113,1617292113),('Mileage','nl','',1617292113,1617292113),('Mileage','pl','',1617292113,1617292113),('Mileage','pt_BR','',1617292113,1617292113),('Mileage','ru','',1617292113,1617292113),('Mileage','sk','',1617292113,1617292113),('Mileage','sv','',1617292113,1617292113),('Mileage','sv_FI','',1617292113,1617292113),('Mileage','th','',1617292113,1617292113),('Mileage','tr','',1617292113,1617292113),('Mileage','uk','',1617292113,1617292113),('Mileage','zh_Hans','',1617292113,1617292113),('Petrol','cs','',1617292114,1617292114),('Petrol','de','',1617292114,1617292114),('Petrol','en','',1617292114,1617292114),('Petrol','es','',1617292114,1617292114),('Petrol','fa','',1617292114,1617292114),('Petrol','fr','',1617292114,1617292114),('Petrol','hu','',1617292114,1617292114),('Petrol','it','',1617292114,1617292114),('Petrol','ja','',1617292114,1617292114),('Petrol','nl','',1617292114,1617292114),('Petrol','pl','',1617292114,1617292114),('Petrol','pt_BR','',1617292114,1617292114),('Petrol','ru','',1617292114,1617292114),('Petrol','sk','',1617292114,1617292114),('Petrol','sv','',1617292114,1617292114),('Petrol','sv_FI','',1617292114,1617292114),('Petrol','th','',1617292114,1617292114),('Petrol','tr','',1617292114,1617292114),('Petrol','uk','',1617292114,1617292114),('Petrol','zh_Hans','',1617292114,1617292114),('Product','cs','',1617268083,1617268083),('Product','de','',1617268083,1617268083),('Product','en','',1617268083,1617268083),('Product','es','',1617268083,1617268083),('Product','fa','',1617268083,1617268083),('Product','fr','',1617268083,1617268083),('Product','hu','',1617268083,1617268083),('Product','it','',1617268083,1617268083),('Product','ja','',1617268083,1617268083),('Product','nl','',1617268083,1617268083),('Product','pl','',1617268083,1617268083),('Product','pt_BR','',1617268083,1617268083),('Product','ru','',1617268083,1617268083),('Product','sk','',1617268083,1617268083),('Product','sv','',1617268083,1617268083),('Product','sv_FI','',1617268083,1617268083),('Product','th','',1617268083,1617268083),('Product','tr','',1617268083,1617268083),('Product','uk','',1617268083,1617268083),('Product','zh_Hans','',1617268083,1617268083),('Product Brand','cs','',1617277890,1617277890),('Product Brand','de','',1617277890,1617277890),('Product Brand','en','',1617277890,1617277890),('Product Brand','es','',1617277890,1617277890),('Product Brand','fa','',1617277890,1617277890),('Product Brand','fr','',1617277890,1617277890),('Product Brand','hu','',1617277890,1617277890),('Product Brand','it','',1617277890,1617277890),('Product Brand','ja','',1617277890,1617277890),('Product Brand','nl','',1617277890,1617277890),('Product Brand','pl','',1617277890,1617277890),('Product Brand','pt_BR','',1617277890,1617277890),('Product Brand','ru','',1617277890,1617277890),('Product Brand','sk','',1617277890,1617277890),('Product Brand','sv','',1617277890,1617277890),('Product Brand','sv_FI','',1617277890,1617277890),('Product Brand','th','',1617277890,1617277890),('Product Brand','tr','',1617277890,1617277890),('Product Brand','uk','',1617277890,1617277890),('Product Brand','zh_Hans','',1617277890,1617277890),('Product Category','cs','',1617277891,1617277891),('Product Category','de','',1617277891,1617277891),('Product Category','en','',1617277891,1617277891),('Product Category','es','',1617277891,1617277891),('Product Category','fa','',1617277891,1617277891),('Product Category','fr','',1617277891,1617277891),('Product Category','hu','',1617277891,1617277891),('Product Category','it','',1617277891,1617277891),('Product Category','ja','',1617277891,1617277891),('Product Category','nl','',1617277891,1617277891),('Product Category','pl','',1617277891,1617277891),('Product Category','pt_BR','',1617277891,1617277891),('Product Category','ru','',1617277891,1617277891),('Product Category','sk','',1617277891,1617277891),('Product Category','sv','',1617277891,1617277891),('Product Category','sv_FI','',1617277891,1617277891),('Product Category','th','',1617277891,1617277891),('Product Category','tr','',1617277891,1617277891),('Product Category','uk','',1617277891,1617277891),('Product Category','zh_Hans','',1617277891,1617277891),('Product Colour','cs','',1617277892,1617277892),('Product Colour','de','',1617277892,1617277892),('Product Colour','en','',1617277892,1617277892),('Product Colour','es','',1617277892,1617277892),('Product Colour','fa','',1617277892,1617277892),('Product Colour','fr','',1617277892,1617277892),('Product Colour','hu','',1617277892,1617277892),('Product Colour','it','',1617277892,1617277892),('Product Colour','ja','',1617277892,1617277892),('Product Colour','nl','',1617277892,1617277892),('Product Colour','pl','',1617277892,1617277892),('Product Colour','pt_BR','',1617277892,1617277892),('Product Colour','ru','',1617277892,1617277892),('Product Colour','sk','',1617277892,1617277892),('Product Colour','sv','',1617277892,1617277892),('Product Colour','sv_FI','',1617277892,1617277892),('Product Colour','th','',1617277892,1617277892),('Product Colour','tr','',1617277892,1617277892),('Product Colour','uk','',1617277892,1617277892),('Product Colour','zh_Hans','',1617277892,1617277892),('Product CreatedAt','cs','',1617277895,1617277895),('Product CreatedAt','de','',1617277895,1617277895),('Product CreatedAt','en','',1617277895,1617277895),('Product CreatedAt','es','',1617277895,1617277895),('Product CreatedAt','fa','',1617277895,1617277895),('Product CreatedAt','fr','',1617277895,1617277895),('Product CreatedAt','hu','',1617277895,1617277895),('Product CreatedAt','it','',1617277895,1617277895),('Product CreatedAt','ja','',1617277895,1617277895),('Product CreatedAt','nl','',1617277895,1617277895),('Product CreatedAt','pl','',1617277895,1617277895),('Product CreatedAt','pt_BR','',1617277895,1617277895),('Product CreatedAt','ru','',1617277895,1617277895),('Product CreatedAt','sk','',1617277895,1617277895),('Product CreatedAt','sv','',1617277895,1617277895),('Product CreatedAt','sv_FI','',1617277895,1617277895),('Product CreatedAt','th','',1617277895,1617277895),('Product CreatedAt','tr','',1617277895,1617277895),('Product CreatedAt','uk','',1617277895,1617277895),('Product CreatedAt','zh_Hans','',1617277895,1617277895),('Product Description','cs','',1617277890,1617277890),('Product Description','de','',1617277890,1617277890),('Product Description','en','',1617277890,1617277890),('Product Description','es','',1617277890,1617277890),('Product Description','fa','',1617277890,1617277890),('Product Description','fr','',1617277890,1617277890),('Product Description','hu','',1617277890,1617277890),('Product Description','it','',1617277890,1617277890),('Product Description','ja','',1617277890,1617277890),('Product Description','nl','',1617277890,1617277890),('Product Description','pl','',1617277890,1617277890),('Product Description','pt_BR','',1617277890,1617277890),('Product Description','ru','',1617277890,1617277890),('Product Description','sk','',1617277890,1617277890),('Product Description','sv','',1617277890,1617277890),('Product Description','sv_FI','',1617277890,1617277890),('Product Description','th','',1617277890,1617277890),('Product Description','tr','',1617277890,1617277890),('Product Description','uk','',1617277890,1617277890),('Product Description','zh_Hans','',1617277890,1617277890),('Product Image','cs','',1617288193,1617288193),('Product Image','de','',1617288193,1617288193),('Product Image','en','',1617288193,1617288193),('Product Image','es','',1617288193,1617288193),('Product Image','fa','',1617288193,1617288193),('Product Image','fr','',1617288193,1617288193),('Product Image','hu','',1617288193,1617288193),('Product Image','it','',1617288193,1617288193),('Product Image','ja','',1617288193,1617288193),('Product Image','nl','',1617288193,1617288193),('Product Image','pl','',1617288193,1617288193),('Product Image','pt_BR','',1617288193,1617288193),('Product Image','ru','',1617288193,1617288193),('Product Image','sk','',1617288193,1617288193),('Product Image','sv','',1617288193,1617288193),('Product Image','sv_FI','',1617288193,1617288193),('Product Image','th','',1617288193,1617288193),('Product Image','tr','',1617288193,1617288193),('Product Image','uk','',1617288193,1617288193),('Product Image','zh_Hans','',1617288193,1617288193),('Product Images','cs','',1617277891,1617277891),('Product Images','de','',1617277891,1617277891),('Product Images','en','',1617277891,1617277891),('Product Images','es','',1617277891,1617277891),('Product Images','fa','',1617277891,1617277891),('Product Images','fr','',1617277891,1617277891),('Product Images','hu','',1617277891,1617277891),('Product Images','it','',1617277891,1617277891),('Product Images','ja','',1617277891,1617277891),('Product Images','nl','',1617277891,1617277891),('Product Images','pl','',1617277891,1617277891),('Product Images','pt_BR','',1617277891,1617277891),('Product Images','ru','',1617277891,1617277891),('Product Images','sk','',1617277891,1617277891),('Product Images','sv','',1617277891,1617277891),('Product Images','sv_FI','',1617277891,1617277891),('Product Images','th','',1617277891,1617277891),('Product Images','tr','',1617277891,1617277891),('Product Images','uk','',1617277891,1617277891),('Product Images','zh_Hans','',1617277891,1617277891),('Product Launch Date','cs','',1617277893,1617277893),('Product Launch Date','de','',1617277893,1617277893),('Product Launch Date','en','',1617277893,1617277893),('Product Launch Date','es','',1617277893,1617277893),('Product Launch Date','fa','',1617277893,1617277893),('Product Launch Date','fr','',1617277893,1617277893),('Product Launch Date','hu','',1617277893,1617277893),('Product Launch Date','it','',1617277893,1617277893),('Product Launch Date','ja','',1617277893,1617277893),('Product Launch Date','nl','',1617277893,1617277893),('Product Launch Date','pl','',1617277893,1617277893),('Product Launch Date','pt_BR','',1617277893,1617277893),('Product Launch Date','ru','',1617277893,1617277893),('Product Launch Date','sk','',1617277893,1617277893),('Product Launch Date','sv','',1617277893,1617277893),('Product Launch Date','sv_FI','',1617277893,1617277893),('Product Launch Date','th','',1617277893,1617277893),('Product Launch Date','tr','',1617277893,1617277893),('Product Launch Date','uk','',1617277893,1617277893),('Product Launch Date','zh_Hans','',1617277893,1617277893),('Product Length','cs','',1617277895,1617277895),('Product Length','de','',1617277895,1617277895),('Product Length','en','',1617277895,1617277895),('Product Length','es','',1617277895,1617277895),('Product Length','fa','',1617277895,1617277895),('Product Length','fr','',1617277895,1617277895),('Product Length','hu','',1617277895,1617277895),('Product Length','it','',1617277895,1617277895),('Product Length','ja','',1617277895,1617277895),('Product Length','nl','',1617277895,1617277895),('Product Length','pl','',1617277895,1617277895),('Product Length','pt_BR','',1617277895,1617277895),('Product Length','ru','',1617277895,1617277895),('Product Length','sk','',1617277895,1617277895),('Product Length','sv','',1617277895,1617277895),('Product Length','sv_FI','',1617277895,1617277895),('Product Length','th','',1617277895,1617277895),('Product Length','tr','',1617277895,1617277895),('Product Length','uk','',1617277895,1617277895),('Product Length','zh_Hans','',1617277895,1617277895),('Product Name','cs','',1617277889,1617277889),('Product Name','de','',1617277889,1617277889),('Product Name','en','',1617277889,1617277889),('Product Name','es','',1617277889,1617277889),('Product Name','fa','',1617277889,1617277889),('Product Name','fr','',1617277889,1617277889),('Product Name','hu','',1617277889,1617277889),('Product Name','it','',1617277889,1617277889),('Product Name','ja','',1617277889,1617277889),('Product Name','nl','',1617277889,1617277889),('Product Name','pl','',1617277889,1617277889),('Product Name','pt_BR','',1617277889,1617277889),('Product Name','ru','',1617277889,1617277889),('Product Name','sk','',1617277889,1617277889),('Product Name','sv','',1617277889,1617277889),('Product Name','sv_FI','',1617277889,1617277889),('Product Name','th','',1617277889,1617277889),('Product Name','tr','',1617277889,1617277889),('Product Name','uk','',1617277889,1617277889),('Product Name','zh_Hans','',1617277889,1617277889),('Product Price','cs','',1617277892,1617277892),('Product Price','de','',1617277892,1617277892),('Product Price','en','',1617277892,1617277892),('Product Price','es','',1617277892,1617277892),('Product Price','fa','',1617277892,1617277892),('Product Price','fr','',1617277892,1617277892),('Product Price','hu','',1617277892,1617277892),('Product Price','it','',1617277892,1617277892),('Product Price','ja','',1617277892,1617277892),('Product Price','nl','',1617277892,1617277892),('Product Price','pl','',1617277892,1617277892),('Product Price','pt_BR','',1617277892,1617277892),('Product Price','ru','',1617277892,1617277892),('Product Price','sk','',1617277892,1617277892),('Product Price','sv','',1617277892,1617277892),('Product Price','sv_FI','',1617277892,1617277892),('Product Price','th','',1617277892,1617277892),('Product Price','tr','',1617277892,1617277892),('Product Price','uk','',1617277892,1617277892),('Product Price','zh_Hans','',1617277892,1617277892),('Product SKU','cs','',1617277889,1617277889),('Product SKU','de','',1617277889,1617277889),('Product SKU','en','',1617277889,1617277889),('Product SKU','es','',1617277889,1617277889),('Product SKU','fa','',1617277889,1617277889),('Product SKU','fr','',1617277889,1617277889),('Product SKU','hu','',1617277889,1617277889),('Product SKU','it','',1617277889,1617277889),('Product SKU','ja','',1617277889,1617277889),('Product SKU','nl','',1617277889,1617277889),('Product SKU','pl','',1617277889,1617277889),('Product SKU','pt_BR','',1617277889,1617277889),('Product SKU','ru','',1617277889,1617277889),('Product SKU','sk','',1617277889,1617277889),('Product SKU','sv','',1617277889,1617277889),('Product SKU','sv_FI','',1617277889,1617277889),('Product SKU','th','',1617277889,1617277889),('Product SKU','tr','',1617277889,1617277889),('Product SKU','uk','',1617277889,1617277889),('Product SKU','zh_Hans','',1617277889,1617277889),('Product UpdatedAt','cs','',1617277895,1617277895),('Product UpdatedAt','de','',1617277895,1617277895),('Product UpdatedAt','en','',1617277895,1617277895),('Product UpdatedAt','es','',1617277895,1617277895),('Product UpdatedAt','fa','',1617277895,1617277895),('Product UpdatedAt','fr','',1617277895,1617277895),('Product UpdatedAt','hu','',1617277895,1617277895),('Product UpdatedAt','it','',1617277895,1617277895),('Product UpdatedAt','ja','',1617277895,1617277895),('Product UpdatedAt','nl','',1617277895,1617277895),('Product UpdatedAt','pl','',1617277895,1617277895),('Product UpdatedAt','pt_BR','',1617277895,1617277895),('Product UpdatedAt','ru','',1617277895,1617277895),('Product UpdatedAt','sk','',1617277895,1617277895),('Product UpdatedAt','sv','',1617277895,1617277895),('Product UpdatedAt','sv_FI','',1617277895,1617277895),('Product UpdatedAt','th','',1617277895,1617277895),('Product UpdatedAt','tr','',1617277895,1617277895),('Product UpdatedAt','uk','',1617277895,1617277895),('Product UpdatedAt','zh_Hans','',1617277895,1617277895),('ProductType','cs','',1617288181,1617288181),('ProductType','de','',1617288181,1617288181),('ProductType','en','',1617288181,1617288181),('ProductType','es','',1617288181,1617288181),('ProductType','fa','',1617288181,1617288181),('ProductType','fr','',1617288181,1617288181),('ProductType','hu','',1617288181,1617288181),('ProductType','it','',1617288181,1617288181),('ProductType','ja','',1617288181,1617288181),('ProductType','nl','',1617288181,1617288181),('ProductType','pl','',1617288181,1617288181),('ProductType','pt_BR','',1617288181,1617288181),('ProductType','ru','',1617288181,1617288181),('ProductType','sk','',1617288181,1617288181),('ProductType','sv','',1617288181,1617288181),('ProductType','sv_FI','',1617288181,1617288181),('ProductType','th','',1617288181,1617288181),('ProductType','tr','',1617288181,1617288181),('ProductType','uk','',1617288181,1617288181),('ProductType','zh_Hans','',1617288181,1617288181),('Rs','cs','',1617268590,1617268590),('Rs','de','',1617268590,1617268590),('Rs','en','',1617268590,1617268590),('Rs','es','',1617268590,1617268590),('Rs','fa','',1617268590,1617268590),('Rs','fr','',1617268590,1617268590),('Rs','hu','',1617268590,1617268590),('Rs','it','',1617268590,1617268590),('Rs','ja','',1617268590,1617268590),('Rs','nl','',1617268590,1617268590),('Rs','pl','',1617268590,1617268590),('Rs','pt_BR','',1617268590,1617268590),('Rs','ru','',1617268590,1617268590),('Rs','sk','',1617268590,1617268590),('Rs','sv','',1617268590,1617268590),('Rs','sv_FI','',1617268590,1617268590),('Rs','th','',1617268590,1617268590),('Rs','tr','',1617268590,1617268590),('Rs','uk','',1617268590,1617268590),('Rs','zh_Hans','',1617268590,1617268590),('Rupees','cs','',1617268598,1617268598),('Rupees','de','',1617268598,1617268598),('Rupees','en','',1617268598,1617268598),('Rupees','es','',1617268598,1617268598),('Rupees','fa','',1617268598,1617268598),('Rupees','fr','',1617268598,1617268598),('Rupees','hu','',1617268598,1617268598),('Rupees','it','',1617268598,1617268598),('Rupees','ja','',1617268598,1617268598),('Rupees','nl','',1617268598,1617268598),('Rupees','pl','',1617268598,1617268598),('Rupees','pt_BR','',1617268598,1617268598),('Rupees','ru','',1617268598,1617268598),('Rupees','sk','',1617268598,1617268598),('Rupees','sv','',1617268598,1617268598),('Rupees','sv_FI','',1617268598,1617268598),('Rupees','th','',1617268598,1617268598),('Rupees','tr','',1617268598,1617268598),('Rupees','uk','',1617268598,1617268598),('Rupees','zh_Hans','',1617268598,1617268598),('Sunroof','cs','',1617292114,1617292114),('Sunroof','de','',1617292114,1617292114),('Sunroof','en','',1617292114,1617292114),('Sunroof','es','',1617292114,1617292114),('Sunroof','fa','',1617292114,1617292114),('Sunroof','fr','',1617292114,1617292114),('Sunroof','hu','',1617292114,1617292114),('Sunroof','it','',1617292114,1617292114),('Sunroof','ja','',1617292114,1617292114),('Sunroof','nl','',1617292114,1617292114),('Sunroof','pl','',1617292114,1617292114),('Sunroof','pt_BR','',1617292114,1617292114),('Sunroof','ru','',1617292114,1617292114),('Sunroof','sk','',1617292114,1617292114),('Sunroof','sv','',1617292114,1617292114),('Sunroof','sv_FI','',1617292114,1617292114),('Sunroof','th','',1617292114,1617292114),('Sunroof','tr','',1617292114,1617292114),('Sunroof','uk','',1617292114,1617292114),('Sunroof','zh_Hans','',1617292114,1617292114),('USD','cs','',1617268636,1617268636),('USD','de','',1617268636,1617268636),('USD','en','',1617268636,1617268636),('USD','es','',1617268636,1617268636),('USD','fa','',1617268636,1617268636),('USD','fr','',1617268636,1617268636),('USD','hu','',1617268636,1617268636),('USD','it','',1617268636,1617268636),('USD','ja','',1617268636,1617268636),('USD','nl','',1617268636,1617268636),('USD','pl','',1617268636,1617268636),('USD','pt_BR','',1617268636,1617268636),('USD','ru','',1617268636,1617268636),('USD','sk','',1617268636,1617268636),('USD','sv','',1617268636,1617268636),('USD','sv_FI','',1617268636,1617268636),('USD','th','',1617268636,1617268636),('USD','tr','',1617268636,1617268636),('USD','uk','',1617268636,1617268636),('USD','zh_Hans','',1617268636,1617268636),('United States Dollar','cs','',1617268648,1617268648),('United States Dollar','de','',1617268648,1617268648),('United States Dollar','en','',1617268648,1617268648),('United States Dollar','es','',1617268648,1617268648),('United States Dollar','fa','',1617268648,1617268648),('United States Dollar','fr','',1617268648,1617268648),('United States Dollar','hu','',1617268648,1617268648),('United States Dollar','it','',1617268648,1617268648),('United States Dollar','ja','',1617268648,1617268648),('United States Dollar','nl','',1617268648,1617268648),('United States Dollar','pl','',1617268648,1617268648),('United States Dollar','pt_BR','',1617268648,1617268648),('United States Dollar','ru','',1617268648,1617268648),('United States Dollar','sk','',1617268648,1617268648),('United States Dollar','sv','',1617268648,1617268648),('United States Dollar','sv_FI','',1617268648,1617268648),('United States Dollar','th','',1617268648,1617268648),('United States Dollar','tr','',1617268648,1617268648),('United States Dollar','uk','',1617268648,1617268648),('United States Dollar','zh_Hans','',1617268648,1617268648),('Watt Hour per mile','cs','',1617269798,1617269798),('Watt Hour per mile','de','',1617269798,1617269798),('Watt Hour per mile','en','',1617269798,1617269798),('Watt Hour per mile','es','',1617269798,1617269798),('Watt Hour per mile','fa','',1617269798,1617269798),('Watt Hour per mile','fr','',1617269798,1617269798),('Watt Hour per mile','hu','',1617269798,1617269798),('Watt Hour per mile','it','',1617269798,1617269798),('Watt Hour per mile','ja','',1617269798,1617269798),('Watt Hour per mile','nl','',1617269798,1617269798),('Watt Hour per mile','pl','',1617269798,1617269798),('Watt Hour per mile','pt_BR','',1617269798,1617269798),('Watt Hour per mile','ru','',1617269798,1617269798),('Watt Hour per mile','sk','',1617269798,1617269798),('Watt Hour per mile','sv','',1617269798,1617269798),('Watt Hour per mile','sv_FI','',1617269798,1617269798),('Watt Hour per mile','th','',1617269798,1617269798),('Watt Hour per mile','tr','',1617269798,1617269798),('Watt Hour per mile','uk','',1617269798,1617269798),('Watt Hour per mile','zh_Hans','',1617269798,1617269798),('Whpm','cs','',1617269784,1617269784),('Whpm','de','',1617269784,1617269784),('Whpm','en','',1617269784,1617269784),('Whpm','es','',1617269784,1617269784),('Whpm','fa','',1617269784,1617269784),('Whpm','fr','',1617269784,1617269784),('Whpm','hu','',1617269784,1617269784),('Whpm','it','',1617269784,1617269784),('Whpm','ja','',1617269784,1617269784),('Whpm','nl','',1617269784,1617269784),('Whpm','pl','',1617269784,1617269784),('Whpm','pt_BR','',1617269784,1617269784),('Whpm','ru','',1617269784,1617269784),('Whpm','sk','',1617269784,1617269784),('Whpm','sv','',1617269784,1617269784),('Whpm','sv_FI','',1617269784,1617269784),('Whpm','th','',1617269784,1617269784),('Whpm','tr','',1617269784,1617269784),('Whpm','uk','',1617269784,1617269784),('Whpm','zh_Hans','',1617269784,1617269784),('brand','cs','',1617265565,1617265565),('brand','de','',1617265565,1617265565),('brand','en','',1617265565,1617265565),('brand','es','',1617265565,1617265565),('brand','fa','',1617265565,1617265565),('brand','fr','',1617265565,1617265565),('brand','hu','',1617265565,1617265565),('brand','it','',1617265565,1617265565),('brand','ja','',1617265565,1617265565),('brand','nl','',1617265565,1617265565),('brand','pl','',1617265565,1617265565),('brand','pt_BR','',1617265565,1617265565),('brand','ru','',1617265565,1617265565),('brand','sk','',1617265565,1617265565),('brand','sv','',1617265565,1617265565),('brand','sv_FI','',1617265565,1617265565),('brand','th','',1617265565,1617265565),('brand','tr','',1617265565,1617265565),('brand','uk','',1617265565,1617265565),('brand','zh_Hans','',1617265565,1617265565),('cm','cs','',1617269087,1617269087),('cm','de','',1617269087,1617269087),('cm','en','',1617269087,1617269087),('cm','es','',1617269087,1617269087),('cm','fa','',1617269087,1617269087),('cm','fr','',1617269087,1617269087),('cm','hu','',1617269087,1617269087),('cm','it','',1617269087,1617269087),('cm','ja','',1617269087,1617269087),('cm','nl','',1617269087,1617269087),('cm','pl','',1617269087,1617269087),('cm','pt_BR','',1617269087,1617269087),('cm','ru','',1617269087,1617269087),('cm','sk','',1617269087,1617269087),('cm','sv','',1617269087,1617269087),('cm','sv_FI','',1617269087,1617269087),('cm','th','',1617269087,1617269087),('cm','tr','',1617269087,1617269087),('cm','uk','',1617269087,1617269087),('cm','zh_Hans','',1617269087,1617269087),('default_value_warning','cs','',1617269991,1617269991),('default_value_warning','de','',1617269991,1617269991),('default_value_warning','en','',1617269991,1617269991),('default_value_warning','es','',1617269991,1617269991),('default_value_warning','fa','',1617269991,1617269991),('default_value_warning','fr','',1617269991,1617269991),('default_value_warning','hu','',1617269991,1617269991),('default_value_warning','it','',1617269991,1617269991),('default_value_warning','ja','',1617269991,1617269991),('default_value_warning','nl','',1617269991,1617269991),('default_value_warning','pl','',1617269991,1617269991),('default_value_warning','pt_BR','',1617269991,1617269991),('default_value_warning','ru','',1617269991,1617269991),('default_value_warning','sk','',1617269991,1617269991),('default_value_warning','sv','',1617269991,1617269991),('default_value_warning','sv_FI','',1617269991,1617269991),('default_value_warning','th','',1617269991,1617269991),('default_value_warning','tr','',1617269991,1617269991),('default_value_warning','uk','',1617269991,1617269991),('default_value_warning','zh_Hans','',1617269991,1617269991),('down','cs','',1617270168,1617270168),('down','de','',1617270168,1617270168),('down','en','',1617270168,1617270168),('down','es','',1617270168,1617270168),('down','fa','',1617270168,1617270168),('down','fr','',1617270168,1617270168),('down','hu','',1617270168,1617270168),('down','it','',1617270168,1617270168),('down','ja','',1617270168,1617270168),('down','nl','',1617270168,1617270168),('down','pl','',1617270168,1617270168),('down','pt_BR','',1617270168,1617270168),('down','ru','',1617270168,1617270168),('down','sk','',1617270168,1617270168),('down','sv','',1617270168,1617270168),('down','sv_FI','',1617270168,1617270168),('down','th','',1617270168,1617270168),('down','tr','',1617270168,1617270168),('down','uk','',1617270168,1617270168),('down','zh_Hans','',1617270168,1617270168),('false','cs','',1617269989,1617269989),('false','de','',1617269989,1617269989),('false','en','',1617269989,1617269989),('false','es','',1617269989,1617269989),('false','fa','',1617269989,1617269989),('false','fr','',1617269989,1617269989),('false','hu','',1617269989,1617269989),('false','it','',1617269989,1617269989),('false','ja','',1617269989,1617269989),('false','nl','',1617269989,1617269989),('false','pl','',1617269989,1617269989),('false','pt_BR','',1617269989,1617269989),('false','ru','',1617269989,1617269989),('false','sk','',1617269989,1617269989),('false','sv','',1617269989,1617269989),('false','sv_FI','',1617269989,1617269989),('false','th','',1617269989,1617269989),('false','tr','',1617269989,1617269989),('false','uk','',1617269989,1617269989),('false','zh_Hans','',1617269989,1617269989),('feet','cs','',1617270970,1617270970),('feet','de','',1617270970,1617270970),('feet','en','',1617270970,1617270970),('feet','es','',1617270970,1617270970),('feet','fa','',1617270970,1617270970),('feet','fr','',1617270970,1617270970),('feet','hu','',1617270970,1617270970),('feet','it','',1617270970,1617270970),('feet','ja','',1617270970,1617270970),('feet','nl','',1617270970,1617270970),('feet','pl','',1617270970,1617270970),('feet','pt_BR','',1617270970,1617270970),('feet','ru','',1617270970,1617270970),('feet','sk','',1617270970,1617270970),('feet','sv','',1617270970,1617270970),('feet','sv_FI','',1617270970,1617270970),('feet','th','',1617270970,1617270970),('feet','tr','',1617270970,1617270970),('feet','uk','',1617270970,1617270970),('feet','zh_Hans','',1617270970,1617270970),('ft','cs','',1617270964,1617270964),('ft','de','',1617270964,1617270964),('ft','en','',1617270964,1617270964),('ft','es','',1617270964,1617270964),('ft','fa','',1617270964,1617270964),('ft','fr','',1617270964,1617270964),('ft','hu','',1617270964,1617270964),('ft','it','',1617270964,1617270964),('ft','ja','',1617270964,1617270964),('ft','nl','',1617270964,1617270964),('ft','pl','',1617270964,1617270964),('ft','pt_BR','',1617270964,1617270964),('ft','ru','',1617270964,1617270964),('ft','sk','',1617270964,1617270964),('ft','sv','',1617270964,1617270964),('ft','sv_FI','',1617270964,1617270964),('ft','th','',1617270964,1617270964),('ft','tr','',1617270964,1617270964),('ft','uk','',1617270964,1617270964),('ft','zh_Hans','',1617270964,1617270964),('in','cs','',1617269108,1617269108),('in','de','',1617269108,1617269108),('in','en','',1617269108,1617269108),('in','es','',1617269108,1617269108),('in','fa','',1617269108,1617269108),('in','fr','',1617269108,1617269108),('in','hu','',1617269108,1617269108),('in','it','',1617269108,1617269108),('in','ja','',1617269108,1617269108),('in','nl','',1617269108,1617269108),('in','pl','',1617269108,1617269108),('in','pt_BR','',1617269108,1617269108),('in','ru','',1617269108,1617269108),('in','sk','',1617269108,1617269108),('in','sv','',1617269108,1617269108),('in','sv_FI','',1617269108,1617269108),('in','th','',1617269108,1617269108),('in','tr','',1617269108,1617269108),('in','uk','',1617269108,1617269108),('in','zh_Hans','',1617269108,1617269108),('isBrandActive','cs','',1617277749,1617277749),('isBrandActive','de','',1617277749,1617277749),('isBrandActive','en','',1617277749,1617277749),('isBrandActive','es','',1617277749,1617277749),('isBrandActive','fa','',1617277749,1617277749),('isBrandActive','fr','',1617277749,1617277749),('isBrandActive','hu','',1617277749,1617277749),('isBrandActive','it','',1617277749,1617277749),('isBrandActive','ja','',1617277749,1617277749),('isBrandActive','nl','',1617277749,1617277749),('isBrandActive','pl','',1617277749,1617277749),('isBrandActive','pt_BR','',1617277749,1617277749),('isBrandActive','ru','',1617277749,1617277749),('isBrandActive','sk','',1617277749,1617277749),('isBrandActive','sv','',1617277749,1617277749),('isBrandActive','sv_FI','',1617277749,1617277749),('isBrandActive','th','',1617277749,1617277749),('isBrandActive','tr','',1617277749,1617277749),('isBrandActive','uk','',1617277749,1617277749),('isBrandActive','zh_Hans','',1617277749,1617277749),('isCategoryActive','cs','',1617291784,1617291784),('isCategoryActive','de','',1617291784,1617291784),('isCategoryActive','en','',1617291784,1617291784),('isCategoryActive','es','',1617291784,1617291784),('isCategoryActive','fa','',1617291784,1617291784),('isCategoryActive','fr','',1617291784,1617291784),('isCategoryActive','hu','',1617291784,1617291784),('isCategoryActive','it','',1617291784,1617291784),('isCategoryActive','ja','',1617291784,1617291784),('isCategoryActive','nl','',1617291784,1617291784),('isCategoryActive','pl','',1617291784,1617291784),('isCategoryActive','pt_BR','',1617291784,1617291784),('isCategoryActive','ru','',1617291784,1617291784),('isCategoryActive','sk','',1617291784,1617291784),('isCategoryActive','sv','',1617291784,1617291784),('isCategoryActive','sv_FI','',1617291784,1617291784),('isCategoryActive','th','',1617291784,1617291784),('isCategoryActive','tr','',1617291784,1617291784),('isCategoryActive','uk','',1617291784,1617291784),('isCategoryActive','zh_Hans','',1617291784,1617291784),('isProductActive','cs','',1617277898,1617277898),('isProductActive','de','',1617277898,1617277898),('isProductActive','en','',1617277898,1617277898),('isProductActive','es','',1617277898,1617277898),('isProductActive','fa','',1617277898,1617277898),('isProductActive','fr','',1617277898,1617277898),('isProductActive','hu','',1617277898,1617277898),('isProductActive','it','',1617277898,1617277898),('isProductActive','ja','',1617277898,1617277898),('isProductActive','nl','',1617277898,1617277898),('isProductActive','pl','',1617277898,1617277898),('isProductActive','pt_BR','',1617277898,1617277898),('isProductActive','ru','',1617277898,1617277898),('isProductActive','sk','',1617277898,1617277898),('isProductActive','sv','',1617277898,1617277898),('isProductActive','sv_FI','',1617277898,1617277898),('isProductActive','th','',1617277898,1617277898),('isProductActive','tr','',1617277898,1617277898),('isProductActive','uk','',1617277898,1617277898),('isProductActive','zh_Hans','',1617277898,1617277898),('kWh','cs','',1617269416,1617269416),('kWh','de','',1617269416,1617269416),('kWh','en','',1617269416,1617269416),('kWh','es','',1617269416,1617269416),('kWh','fa','',1617269416,1617269416),('kWh','fr','',1617269416,1617269416),('kWh','hu','',1617269416,1617269416),('kWh','it','',1617269416,1617269416),('kWh','ja','',1617269416,1617269416),('kWh','nl','',1617269416,1617269416),('kWh','pl','',1617269416,1617269416),('kWh','pt_BR','',1617269416,1617269416),('kWh','ru','',1617269416,1617269416),('kWh','sk','',1617269416,1617269416),('kWh','sv','',1617269416,1617269416),('kWh','sv_FI','',1617269416,1617269416),('kWh','th','',1617269416,1617269416),('kWh','tr','',1617269416,1617269416),('kWh','uk','',1617269416,1617269416),('kWh','zh_Hans','',1617269416,1617269416),('kilometer per litre','cs','',1617270235,1617270235),('kilometer per litre','de','',1617270235,1617270235),('kilometer per litre','en','',1617270235,1617270235),('kilometer per litre','es','',1617270235,1617270235),('kilometer per litre','fa','',1617270235,1617270235),('kilometer per litre','fr','',1617270235,1617270235),('kilometer per litre','hu','',1617270235,1617270235),('kilometer per litre','it','',1617270235,1617270235),('kilometer per litre','ja','',1617270235,1617270235),('kilometer per litre','nl','',1617270235,1617270235),('kilometer per litre','pl','',1617270235,1617270235),('kilometer per litre','pt_BR','',1617270235,1617270235),('kilometer per litre','ru','',1617270235,1617270235),('kilometer per litre','sk','',1617270235,1617270235),('kilometer per litre','sv','',1617270235,1617270235),('kilometer per litre','sv_FI','',1617270235,1617270235),('kilometer per litre','th','',1617270235,1617270235),('kilometer per litre','tr','',1617270235,1617270235),('kilometer per litre','uk','',1617270235,1617270235),('kilometer per litre','zh_Hans','',1617270235,1617270235),('kmpl','cs','',1617270226,1617270226),('kmpl','de','',1617270226,1617270226),('kmpl','en','',1617270226,1617270226),('kmpl','es','',1617270226,1617270226),('kmpl','fa','',1617270226,1617270226),('kmpl','fr','',1617270226,1617270226),('kmpl','hu','',1617270226,1617270226),('kmpl','it','',1617270226,1617270226),('kmpl','ja','',1617270226,1617270226),('kmpl','nl','',1617270226,1617270226),('kmpl','pl','',1617270226,1617270226),('kmpl','pt_BR','',1617270226,1617270226),('kmpl','ru','',1617270226,1617270226),('kmpl','sk','',1617270226,1617270226),('kmpl','sv','',1617270226,1617270226),('kmpl','sv_FI','',1617270226,1617270226),('kmpl','th','',1617270226,1617270226),('kmpl','tr','',1617270226,1617270226),('kmpl','uk','',1617270226,1617270226),('kmpl','zh_Hans','',1617270226,1617270226),('null','cs','',1617269988,1617269988),('null','de','',1617269988,1617269988),('null','en','',1617269988,1617269988),('null','es','',1617269988,1617269988),('null','fa','',1617269988,1617269988),('null','fr','',1617269988,1617269988),('null','hu','',1617269988,1617269988),('null','it','',1617269988,1617269988),('null','ja','',1617269988,1617269988),('null','nl','',1617269988,1617269988),('null','pl','',1617269988,1617269988),('null','pt_BR','',1617269988,1617269988),('null','ru','',1617269988,1617269988),('null','sk','',1617269988,1617269988),('null','sv','',1617269988,1617269988),('null','sv_FI','',1617269988,1617269988),('null','th','',1617269988,1617269988),('null','tr','',1617269988,1617269988),('null','uk','',1617269988,1617269988),('null','zh_Hans','',1617269988,1617269988),('object_add_dialog_custom_text.Brand','cs','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','de','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','en','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','es','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','fa','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','fr','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','hu','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','it','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','ja','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','nl','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','pl','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','pt_BR','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','ru','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','sk','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','sv','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','sv_FI','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','th','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','tr','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','uk','',1617277740,1617277740),('object_add_dialog_custom_text.Brand','zh_Hans','',1617277740,1617277740),('object_add_dialog_custom_text.Category','cs','',1617291782,1617291782),('object_add_dialog_custom_text.Category','de','',1617291782,1617291782),('object_add_dialog_custom_text.Category','en','',1617291782,1617291782),('object_add_dialog_custom_text.Category','es','',1617291782,1617291782),('object_add_dialog_custom_text.Category','fa','',1617291782,1617291782),('object_add_dialog_custom_text.Category','fr','',1617291782,1617291782),('object_add_dialog_custom_text.Category','hu','',1617291782,1617291782),('object_add_dialog_custom_text.Category','it','',1617291782,1617291782),('object_add_dialog_custom_text.Category','ja','',1617291782,1617291782),('object_add_dialog_custom_text.Category','nl','',1617291782,1617291782),('object_add_dialog_custom_text.Category','pl','',1617291782,1617291782),('object_add_dialog_custom_text.Category','pt_BR','',1617291782,1617291782),('object_add_dialog_custom_text.Category','ru','',1617291782,1617291782),('object_add_dialog_custom_text.Category','sk','',1617291782,1617291782),('object_add_dialog_custom_text.Category','sv','',1617291782,1617291782),('object_add_dialog_custom_text.Category','sv_FI','',1617291782,1617291782),('object_add_dialog_custom_text.Category','th','',1617291782,1617291782),('object_add_dialog_custom_text.Category','tr','',1617291782,1617291782),('object_add_dialog_custom_text.Category','uk','',1617291782,1617291782),('object_add_dialog_custom_text.Category','zh_Hans','',1617291782,1617291782),('object_add_dialog_custom_text.Product','cs','',1617277858,1617277858),('object_add_dialog_custom_text.Product','de','',1617277858,1617277858),('object_add_dialog_custom_text.Product','en','',1617277858,1617277858),('object_add_dialog_custom_text.Product','es','',1617277858,1617277858),('object_add_dialog_custom_text.Product','fa','',1617277858,1617277858),('object_add_dialog_custom_text.Product','fr','',1617277858,1617277858),('object_add_dialog_custom_text.Product','hu','',1617277858,1617277858),('object_add_dialog_custom_text.Product','it','',1617277858,1617277858),('object_add_dialog_custom_text.Product','ja','',1617277858,1617277858),('object_add_dialog_custom_text.Product','nl','',1617277858,1617277858),('object_add_dialog_custom_text.Product','pl','',1617277858,1617277858),('object_add_dialog_custom_text.Product','pt_BR','',1617277858,1617277858),('object_add_dialog_custom_text.Product','ru','',1617277858,1617277858),('object_add_dialog_custom_text.Product','sk','',1617277858,1617277858),('object_add_dialog_custom_text.Product','sv','',1617277858,1617277858),('object_add_dialog_custom_text.Product','sv_FI','',1617277858,1617277858),('object_add_dialog_custom_text.Product','th','',1617277858,1617277858),('object_add_dialog_custom_text.Product','tr','',1617277858,1617277858),('object_add_dialog_custom_text.Product','uk','',1617277858,1617277858),('object_add_dialog_custom_text.Product','zh_Hans','',1617277858,1617277858),('object_add_dialog_custom_title.Brand','cs','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','de','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','en','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','es','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','fa','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','fr','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','hu','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','it','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','ja','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','nl','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','pl','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','pt_BR','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','ru','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','sk','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','sv','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','sv_FI','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','th','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','tr','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','uk','',1617277740,1617277740),('object_add_dialog_custom_title.Brand','zh_Hans','',1617277740,1617277740),('object_add_dialog_custom_title.Category','cs','',1617291782,1617291782),('object_add_dialog_custom_title.Category','de','',1617291782,1617291782),('object_add_dialog_custom_title.Category','en','',1617291782,1617291782),('object_add_dialog_custom_title.Category','es','',1617291782,1617291782),('object_add_dialog_custom_title.Category','fa','',1617291782,1617291782),('object_add_dialog_custom_title.Category','fr','',1617291782,1617291782),('object_add_dialog_custom_title.Category','hu','',1617291782,1617291782),('object_add_dialog_custom_title.Category','it','',1617291782,1617291782),('object_add_dialog_custom_title.Category','ja','',1617291782,1617291782),('object_add_dialog_custom_title.Category','nl','',1617291782,1617291782),('object_add_dialog_custom_title.Category','pl','',1617291782,1617291782),('object_add_dialog_custom_title.Category','pt_BR','',1617291782,1617291782),('object_add_dialog_custom_title.Category','ru','',1617291782,1617291782),('object_add_dialog_custom_title.Category','sk','',1617291782,1617291782),('object_add_dialog_custom_title.Category','sv','',1617291782,1617291782),('object_add_dialog_custom_title.Category','sv_FI','',1617291782,1617291782),('object_add_dialog_custom_title.Category','th','',1617291782,1617291782),('object_add_dialog_custom_title.Category','tr','',1617291782,1617291782),('object_add_dialog_custom_title.Category','uk','',1617291782,1617291782),('object_add_dialog_custom_title.Category','zh_Hans','',1617291782,1617291782),('object_add_dialog_custom_title.Product','cs','',1617277860,1617277860),('object_add_dialog_custom_title.Product','de','',1617277860,1617277860),('object_add_dialog_custom_title.Product','en','',1617277860,1617277860),('object_add_dialog_custom_title.Product','es','',1617277860,1617277860),('object_add_dialog_custom_title.Product','fa','',1617277860,1617277860),('object_add_dialog_custom_title.Product','fr','',1617277860,1617277860),('object_add_dialog_custom_title.Product','hu','',1617277860,1617277860),('object_add_dialog_custom_title.Product','it','',1617277860,1617277860),('object_add_dialog_custom_title.Product','ja','',1617277860,1617277860),('object_add_dialog_custom_title.Product','nl','',1617277860,1617277860),('object_add_dialog_custom_title.Product','pl','',1617277860,1617277860),('object_add_dialog_custom_title.Product','pt_BR','',1617277860,1617277860),('object_add_dialog_custom_title.Product','ru','',1617277860,1617277860),('object_add_dialog_custom_title.Product','sk','',1617277860,1617277860),('object_add_dialog_custom_title.Product','sv','',1617277860,1617277860),('object_add_dialog_custom_title.Product','sv_FI','',1617277860,1617277860),('object_add_dialog_custom_title.Product','th','',1617277860,1617277860),('object_add_dialog_custom_title.Product','tr','',1617277860,1617277860),('object_add_dialog_custom_title.Product','uk','',1617277860,1617277860),('object_add_dialog_custom_title.Product','zh_Hans','',1617277860,1617277860),('product Engine','cs','',1617277894,1617277894),('product Engine','de','',1617277894,1617277894),('product Engine','en','',1617277894,1617277894),('product Engine','es','',1617277894,1617277894),('product Engine','fa','',1617277894,1617277894),('product Engine','fr','',1617277894,1617277894),('product Engine','hu','',1617277894,1617277894),('product Engine','it','',1617277894,1617277894),('product Engine','ja','',1617277894,1617277894),('product Engine','nl','',1617277894,1617277894),('product Engine','pl','',1617277894,1617277894),('product Engine','pt_BR','',1617277894,1617277894),('product Engine','ru','',1617277894,1617277894),('product Engine','sk','',1617277894,1617277894),('product Engine','sv','',1617277894,1617277894),('product Engine','sv_FI','',1617277894,1617277894),('product Engine','th','',1617277894,1617277894),('product Engine','tr','',1617277894,1617277894),('product Engine','uk','',1617277894,1617277894),('product Engine','zh_Hans','',1617277894,1617277894),('productImages','cs','',1617277900,1617277900),('productImages','de','',1617277900,1617277900),('productImages','en','',1617277900,1617277900),('productImages','es','',1617277900,1617277900),('productImages','fa','',1617277900,1617277900),('productImages','fr','',1617277900,1617277900),('productImages','hu','',1617277900,1617277900),('productImages','it','',1617277900,1617277900),('productImages','ja','',1617277900,1617277900),('productImages','nl','',1617277900,1617277900),('productImages','pl','',1617277900,1617277900),('productImages','pt_BR','',1617277900,1617277900),('productImages','ru','',1617277900,1617277900),('productImages','sk','',1617277900,1617277900),('productImages','sv','',1617277900,1617277900),('productImages','sv_FI','',1617277900,1617277900),('productImages','th','',1617277900,1617277900),('productImages','tr','',1617277900,1617277900),('productImages','uk','',1617277900,1617277900),('productImages','zh_Hans','',1617277900,1617277900),('ton','cs','',1617270888,1617270888),('ton','de','',1617270888,1617270888),('ton','en','',1617270888,1617270888),('ton','es','',1617270888,1617270888),('ton','fa','',1617270888,1617270888),('ton','fr','',1617270888,1617270888),('ton','hu','',1617270888,1617270888),('ton','it','',1617270888,1617270888),('ton','ja','',1617270888,1617270888),('ton','nl','',1617270888,1617270888),('ton','pl','',1617270888,1617270888),('ton','pt_BR','',1617270888,1617270888),('ton','ru','',1617270888,1617270888),('ton','sk','',1617270888,1617270888),('ton','sv','',1617270888,1617270888),('ton','sv_FI','',1617270888,1617270888),('ton','th','',1617270888,1617270888),('ton','tr','',1617270888,1617270888),('ton','uk','',1617270888,1617270888),('ton','zh_Hans','',1617270888,1617270888),('tons','cs','',1617270861,1617270861),('tons','de','',1617270861,1617270861),('tons','en','',1617270861,1617270861),('tons','es','',1617270861,1617270861),('tons','fa','',1617270861,1617270861),('tons','fr','',1617270861,1617270861),('tons','hu','',1617270861,1617270861),('tons','it','',1617270861,1617270861),('tons','ja','',1617270861,1617270861),('tons','nl','',1617270861,1617270861),('tons','pl','',1617270861,1617270861),('tons','pt_BR','',1617270861,1617270861),('tons','ru','',1617270861,1617270861),('tons','sk','',1617270861,1617270861),('tons','sv','',1617270861,1617270861),('tons','sv_FI','',1617270861,1617270861),('tons','th','',1617270861,1617270861),('tons','tr','',1617270861,1617270861),('tons','uk','',1617270861,1617270861),('tons','zh_Hans','',1617270861,1617270861),('true','cs','',1617269990,1617269990),('true','de','',1617269990,1617269990),('true','en','',1617269990,1617269990),('true','es','',1617269990,1617269990),('true','fa','',1617269990,1617269990),('true','fr','',1617269990,1617269990),('true','hu','',1617269990,1617269990),('true','it','',1617269990,1617269990),('true','ja','',1617269990,1617269990),('true','nl','',1617269990,1617269990),('true','pl','',1617269990,1617269990),('true','pt_BR','',1617269990,1617269990),('true','ru','',1617269990,1617269990),('true','sk','',1617269990,1617269990),('true','sv','',1617269990,1617269990),('true','sv_FI','',1617269990,1617269990),('true','th','',1617269990,1617269990),('true','tr','',1617269990,1617269990),('true','uk','',1617269990,1617269990),('true','zh_Hans','',1617269990,1617269990),('up','cs','',1617270168,1617270168),('up','de','',1617270168,1617270168),('up','en','',1617270168,1617270168),('up','es','',1617270168,1617270168),('up','fa','',1617270168,1617270168),('up','fr','',1617270168,1617270168),('up','hu','',1617270168,1617270168),('up','it','',1617270168,1617270168),('up','ja','',1617270168,1617270168),('up','nl','',1617270168,1617270168),('up','pl','',1617270168,1617270168),('up','pt_BR','',1617270168,1617270168),('up','ru','',1617270168,1617270168),('up','sk','',1617270168,1617270168),('up','sv','',1617270168,1617270168),('up','sv_FI','',1617270168,1617270168),('up','th','',1617270168,1617270168),('up','tr','',1617270168,1617270168),('up','uk','',1617270168,1617270168),('up','zh_Hans','',1617270168,1617270168);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_locks` (
  `id` int NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint unsigned DEFAULT '0',
  `active` tinyint unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` text,
  `apiKey` varchar(255) DEFAULT NULL,
  `twoFactorAuthentication` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  `websiteTranslationLanguagesEdit` longtext,
  `websiteTranslationLanguagesView` longtext,
  `lastLogin` int unsigned DEFAULT NULL,
  `keyBindings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin3','$2y$10$8UsPlhDEubuG9CWtuu29CetQyPAjZuJfdAQ1hb5nEj6muu/m5Gvly',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,0,'','',NULL,'null',NULL,'','','',1617262539,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('admin_translations',''),('application_logging',''),('asset_metadata',''),('assets',''),('classes',''),('clear_cache',''),('clear_fullpage_cache',''),('clear_temp_files',''),('dashboards',''),('document_types',''),('documents',''),('emails',''),('gdpr_data_extractor',''),('glossary',''),('http_errors',''),('notes_events',''),('notifications',''),('notifications_send',''),('objects',''),('piwik_reports',''),('piwik_settings',''),('plugins',''),('predefined_properties',''),('qr_codes',''),('recyclebin',''),('redirects',''),('reports',''),('reports_config',''),('robots.txt',''),('routes',''),('seemode',''),('seo_document_editor',''),('share_configurations',''),('system_settings',''),('tag_snippet_management',''),('tags_assignment',''),('tags_configuration',''),('tags_search',''),('targeting',''),('thumbnails',''),('translations',''),('users',''),('web2print_settings',''),('website_settings',''),('workflow_details','');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` int unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`,`itemId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `note` text,
  `stackTrace` text,
  `date` int unsigned DEFAULT NULL,
  `public` tinyint unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint unsigned DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  `binaryFileHash` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `binaryFileId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype_cid` (`ctype`,`cid`),
  KEY `date` (`date`),
  KEY `binaryFileHash` (`binaryFileHash`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,5,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617277727,0,1,1,NULL,NULL),(2,3,'asset',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617277815,0,1,1,'d520b8b4c0869f41dbddc906541915901f87811181fc85d19a814cc6d6f5e25f32208392881fd8a960a18911ba42b57c822ef27cdab58a8457fda4b022933f02',NULL),(3,5,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617277833,0,1,2,NULL,NULL),(4,6,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617277859,0,1,1,NULL,NULL),(5,7,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617291708,0,1,1,NULL,NULL),(6,8,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617291777,0,1,1,NULL,NULL),(7,8,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617291929,0,1,2,NULL,NULL),(8,4,'asset',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617292005,0,1,1,'b45dd7206ef04ef7de68978022fa854e7a99530dfc695c072f4afca4564c4ea7d2d03eee9f06b3060dfe113ac4e5f3acc0b0d6e5456bb2d93e01fd28c8399a9a',NULL),(9,7,'object',2,'','#0 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/automobile_final/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/automobile_final/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/automobile_final/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/automobile_final/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617292111,0,1,2,NULL,NULL);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `object_1`
--

/*!50001 DROP VIEW IF EXISTS `object_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`raghav_pim`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_1` AS select `object_query_1`.`oo_id` AS `oo_id`,`object_query_1`.`oo_classId` AS `oo_classId`,`object_query_1`.`oo_className` AS `oo_className`,`object_query_1`.`brandName` AS `brandName`,`object_query_1`.`brandDescription` AS `brandDescription`,`object_query_1`.`brandLogo` AS `brandLogo`,`object_query_1`.`brandCreatedAt` AS `brandCreatedAt`,`object_query_1`.`brandUpdatedAt` AS `brandUpdatedAt`,`object_query_1`.`isBrandActive` AS `isBrandActive`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_1` join `objects` on((`objects`.`o_id` = `object_query_1`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_2`
--

/*!50001 DROP VIEW IF EXISTS `object_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`raghav_pim`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_2` AS select `object_query_2`.`oo_id` AS `oo_id`,`object_query_2`.`oo_classId` AS `oo_classId`,`object_query_2`.`oo_className` AS `oo_className`,`object_query_2`.`categoryName` AS `categoryName`,`object_query_2`.`categoryDescription` AS `categoryDescription`,`object_query_2`.`categoryCreatedAt` AS `categoryCreatedAt`,`object_query_2`.`categoryUpdatedAt` AS `categoryUpdatedAt`,`object_query_2`.`isCategoryActive` AS `isCategoryActive`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_2` join `objects` on((`objects`.`o_id` = `object_query_2`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_3`
--

/*!50001 DROP VIEW IF EXISTS `object_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`raghav_pim`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_3` AS select `object_query_3`.`oo_id` AS `oo_id`,`object_query_3`.`oo_classId` AS `oo_classId`,`object_query_3`.`oo_className` AS `oo_className`,`object_query_3`.`productSKU` AS `productSKU`,`object_query_3`.`productName` AS `productName`,`object_query_3`.`productDescription` AS `productDescription`,`object_query_3`.`productPrice__value` AS `productPrice__value`,`object_query_3`.`productPrice__unit` AS `productPrice__unit`,`object_query_3`.`productColour` AS `productColour`,`object_query_3`.`productLaunchDate` AS `productLaunchDate`,`object_query_3`.`airbagCount` AS `airbagCount`,`object_query_3`.`productEngine` AS `productEngine`,`object_query_3`.`productLength__value` AS `productLength__value`,`object_query_3`.`productLength__unit` AS `productLength__unit`,`object_query_3`.`productCreatedAt` AS `productCreatedAt`,`object_query_3`.`productUpdatedAt` AS `productUpdatedAt`,`object_query_3`.`isProductActive` AS `isProductActive`,`object_query_3`.`productBrand` AS `productBrand`,`object_query_3`.`productCategory__id` AS `productCategory__id`,`object_query_3`.`productCategory__type` AS `productCategory__type`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_3` join `objects` on((`objects`.`o_id` = `object_query_3`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-01 21:45:41
