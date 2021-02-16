-- MySQL dump 10.13  Distrib 5.7.32, for osx10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(36) NOT NULL,
  `email` char(255) NOT NULL,
  `username` varchar(64) NOT NULL,
  `encrypted_password` char(40) NOT NULL,
  `user_status` enum('Inactive','Active') NOT NULL DEFAULT 'Inactive',
  `birthday` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email_un` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'faa72ef9-6576-11eb-9caa-0242ac110002','fulano@domain.com','fulano','qweqwewq','Inactive',NULL,'2021-02-02 16:52:05','2021-02-02 16:52:05',NULL),(2,'bf2bfb6e-6577-11eb-9caa-0242ac110002','carlos_210@aol.es','Carlos','dc7cb5bb5f72851b9192860a76674eda94668877','Active',NULL,'2021-02-02 16:57:34','2021-02-02 16:57:34',NULL),(3,'c246b090-6577-11eb-9caa-0242ac110002','deleted731@gmail.com','Deleted','ad87109bfff0765f4dd8cf4943b04d16a4070fea','Inactive','1980-09-11','2021-02-02 16:57:39','2021-02-02 16:57:39','2020-02-29 19:38:19'),(4,'c2a24ece-6577-11eb-9caa-0242ac110002','pedro475@aol.com','Pedro','8be1a65e23b102d9d498b405ad2be9854e07e87b','Active','1980-07-23','2021-02-02 16:57:40','2021-02-02 16:57:40',NULL),(5,'c2cf7f4b-6577-11eb-9caa-0242ac110002','jaimito_51@aol.es','Jaimito','bab6fade5e0f8c6c44ec4f5ed12a4000b33b4caf','Active',NULL,'2021-02-02 16:57:40','2021-02-02 16:57:40',NULL),(6,'c2f5ee34-6577-11eb-9caa-0242ac110002','deleted_37@aol.es','Deleted','ad87109bfff0765f4dd8cf4943b04d16a4070fea','Inactive',NULL,'2021-02-02 16:57:41','2021-02-02 16:57:41','2020-02-01 16:09:34'),(7,'c314085a-6577-11eb-9caa-0242ac110002','mengano936@me.com','Mengano','22447ff3f0ab2bdc8d6c44a6f1a84864b0ab9322','Active',NULL,'2021-02-02 16:57:41','2021-02-02 16:57:41',NULL),(8,'c3354a3c-6577-11eb-9caa-0242ac110002','carlos_692@aol.es','Carlos','0a1c366179a06364c867693ac1cf23c9b92c6b46','Active',NULL,'2021-02-02 16:57:41','2021-02-02 16:57:41',NULL),(9,'c353bec1-6577-11eb-9caa-0242ac110002','juan513@gmail.com','Juan','9293d2107f9b9e8a9e6802b7b7bd084ced35c81f','Active','1980-01-06','2021-02-02 16:57:41','2021-02-02 16:57:41',NULL),(10,'c370ed73-6577-11eb-9caa-0242ac110002','mengano_378@gmail.es','Mengano','32d9949d0c75cb413ab31d44b58148ee19dc3116','Active',NULL,'2021-02-02 16:57:41','2021-02-02 16:57:41',NULL),(11,'c38ce246-6577-11eb-9caa-0242ac110002','juan_481@hotmail.es','Juan','b1a839caaefe15bba145696cb13f72d520e3a8f1','Active','1980-05-24','2021-02-02 16:57:42','2021-02-02 16:57:42',NULL),(12,'c3a93e39-6577-11eb-9caa-0242ac110002','deleted595@gmail.es','Deleted','ad87109bfff0765f4dd8cf4943b04d16a4070fea','Inactive',NULL,'2021-02-02 16:57:42','2021-02-02 16:57:42','2020-12-08 22:12:49'),(13,'c3c78a9d-6577-11eb-9caa-0242ac110002','pedro_87@aol.es','Pedro','006ddcbda2ee9a7f54cf681562f6aa830ae33963','Active',NULL,'2021-02-02 16:57:42','2021-02-02 16:57:42',NULL),(14,'c3e800ca-6577-11eb-9caa-0242ac110002','carlos_389@icloud.com','Carlos','bc5c17672bd8fbb0d62236b6d0ab5b6c7910c097','Active',NULL,'2021-02-02 16:57:42','2021-02-02 16:57:42',NULL),(15,'c403850b-6577-11eb-9caa-0242ac110002','jaimito_639@icloud.com','Jaimito','931a8d5825be48d8c15a0f6ae199026cc74da22b','Active','1980-10-11','2021-02-02 16:57:42','2021-02-02 16:57:42',NULL),(16,'c420b39a-6577-11eb-9caa-0242ac110002','zutano_980@me.com','Zutano','becabde7f7d38a0dafad02110fcfa5e2f7fa4c67','Active','1980-05-24','2021-02-02 16:57:43','2021-02-02 16:57:43',NULL),(17,'c43cc7a2-6577-11eb-9caa-0242ac110002','juan_128@aol.es','Juan','0461c3c04a7d556bc7f877463bee136c6688b6c1','Active',NULL,'2021-02-02 16:57:43','2021-02-02 16:57:43',NULL),(18,'c4580114-6577-11eb-9caa-0242ac110002','cristina_468@aol.es','Cristina','10da4218ec480494cb98d138141d385daa59f297','Active',NULL,'2021-02-02 16:57:43','2021-02-02 16:57:43',NULL),(19,'c475788d-6577-11eb-9caa-0242ac110002','fulano_521@icloud.com','Fulano','9e42c209f26d5ccf542eae38a55ceb399d55f3ac','Active','1980-12-19','2021-02-02 16:57:43','2021-02-02 16:57:43',NULL),(20,'cac9d7aa-6577-11eb-9caa-0242ac110002','juan463@hotmail.es','Juan','2f9e3a60626f29486208392d34d4319726be2493','Active',NULL,'2021-02-02 16:57:54','2021-02-02 16:57:54',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16 16:26:07
