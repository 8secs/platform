-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: platform_bbdd
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'192.168.33.1','2017-03-25 08:54:00','2017-03-25 08:54:00'),(2,1,'192.168.33.1','2017-03-25 09:23:37','2017-03-25 09:23:37');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners',NULL,'2017-03-25 08:53:22','2017-03-25 08:53:22','owners','Default group for website owners.',0),(3,'Connect Group','{\"media.manage_media\":\"1\",\"backend.manage_preferences\":\"1\",\"system.access_logs\":\"1\",\"system.manage_mail_settings\":\"1\",\"system.manage_mail_templates\":\"1\",\"istheweb.ispdf.manage_layouts\":\"1\",\"istheweb.ispdf.manage_templates\":\"1\",\"istheweb.connect.subscribers\":\"1\",\"istheweb.connect.events\":\"1\",\"istheweb.connect.contacts\":\"1\",\"istheweb.connect.inboxes\":\"1\",\"istheweb.iscorporate.access_projects\":\"1\",\"istheweb.iscorporate.access_employees\":\"1\",\"istheweb.iscorporate.access_clients\":\"1\",\"istheweb.iscorporate.access_budgets\":\"1\",\"istheweb.iscorporate.access_invoices\":\"1\",\"istheweb.iscorporate.access_providers\":\"1\",\"istheweb.iscorporate.create_projects\":\"1\",\"istheweb.iscorporate.delete_projects\":\"1\",\"istheweb.iscorporate.access_project_types\":\"1\",\"istheweb.iscorporate.access_options\":\"1\",\"istheweb.iscorporate.access_issues\":\"1\",\"istheweb.iscorporate.access_other_issues\":\"1\",\"istheweb.iscorporate.access_issue_types\":\"1\",\"istheweb.iscorporate.access_issue_statuses\":\"1\",\"istheweb.iscorporate.access_reports\":\"1\"}','2017-03-27 18:03:01','2017-03-27 18:03:01','connect','Default connect group',0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` VALUES (1,1,'backend','hints','hidden','{\"translation_messages_hint\":1}'),(2,1,'backend','backend','preferences','{\"locale\":\"es\",\"fallback_locale\":\"en\",\"timezone\":\"Europe\\/Madrid\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"4\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":\"1\"}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'192.168.33.1',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Person','admin','admin@domain.tld','$2y$10$HSRLAsOLU9xTypb1YKPlE.ugra8OeI/OR7kgz/vGsHs97v4cEV6D2',NULL,'$2y$10$24BJf5uByDI0PvFXHA9aKufnr1YY8jZpO9RoNg3gCd.PTHOkZoaX6',NULL,'',1,NULL,'2017-03-25 09:23:36','2017-03-25 08:53:22','2017-03-25 09:23:36',1),(2,'Andrés','Rangel Torres','arangel','soporte@istheweb.com','$2y$10$1OXAwRFrvlcrTDE6mGVx.eGXKB/4vqVrcCXeUjVwXUdwyX2T07nTK',NULL,NULL,NULL,'',1,NULL,NULL,'2017-03-26 12:35:42','2017-03-26 12:35:42',1),(3,'Andrés','Rangel Torres','aconnect','arangeltorres@gmail.com','$2y$10$HYYK.lqomL0Xxt213JHU3eZAU6HCvX/zVeTgiZmL4CBcNwuOhP/LK',NULL,NULL,NULL,'',1,NULL,NULL,'2017-03-26 12:35:42','2017-03-26 12:35:42',0);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1),(3,3);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `old_content` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_calendars`
--

DROP TABLE IF EXISTS `istheweb_connect_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_calendars`
--

LOCK TABLES `istheweb_connect_calendars` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_companies`
--

DROP TABLE IF EXISTS `istheweb_connect_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_facebook` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_twitter` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_linkedin` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_gplus` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_companies`
--

LOCK TABLES `istheweb_connect_companies` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_contacts`
--

DROP TABLE IF EXISTS `istheweb_connect_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_facebook` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_twitter` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_linkedin` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sn_gplus` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `istheweb_connect_contacts_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_contacts`
--

LOCK TABLES `istheweb_connect_contacts` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_events`
--

DROP TABLE IF EXISTS `istheweb_connect_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `calendar_id` int(10) unsigned DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `organizer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `istheweb_connect_events_calendar_id_index` (`calendar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_events`
--

LOCK TABLES `istheweb_connect_events` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_inboxes`
--

DROP TABLE IF EXISTS `istheweb_connect_inboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_inboxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_inboxes`
--

LOCK TABLES `istheweb_connect_inboxes` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_inboxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_inboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_connect_subscribers`
--

DROP TABLE IF EXISTS `istheweb_connect_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_connect_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `statistics` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_connect_subscribers`
--

LOCK TABLES `istheweb_connect_subscribers` WRITE;
/*!40000 ALTER TABLE `istheweb_connect_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_connect_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_budgets`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_budgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `motivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones_entrega` text COLLATE utf8_unicode_ci,
  `motivo_no_aceptacion` text COLLATE utf8_unicode_ci,
  `is_project_created` tinyint(4) NOT NULL DEFAULT '0',
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_budgets`
--

LOCK TABLES `istheweb_iscorporate_budgets` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_clients`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL,
  `actividad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sucursal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuenta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_clients`
--

LOCK TABLES `istheweb_iscorporate_clients` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_employees`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_employees`
--

LOCK TABLES `istheweb_iscorporate_employees` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_employees` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_employees` VALUES (1,3,'2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_invoices`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `budget_id` int(10) unsigned NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `vto_date` date DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `payment_type` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_pdf` tinyint(4) NOT NULL DEFAULT '0',
  `client_sent` tinyint(4) NOT NULL DEFAULT '0',
  `taxable_base` double(8,2) NOT NULL,
  `tax` int(11) NOT NULL,
  `total` double(8,2) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_iscorporate_invoices_invoice_number_unique` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_invoices`
--

LOCK TABLES `istheweb_iscorporate_invoices` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_issue_messages`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_issue_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_issue_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `messageable_id` int(11) NOT NULL,
  `messageable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reply` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `istheweb_iscorporate_issue_messages_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_issue_messages`
--

LOCK TABLES `istheweb_iscorporate_issue_messages` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_issue_statuses`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_issue_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_issue_statuses`
--

LOCK TABLES `istheweb_iscorporate_issue_statuses` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_statuses` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_issue_statuses` VALUES (1,'Nuevo',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,'En progreso',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(3,'Solucionado',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(4,'Pregunta',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_issue_types`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_issue_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_issue_types`
--

LOCK TABLES `istheweb_iscorporate_issue_types` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_types` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_issue_types` VALUES (1,'Normal Issue','Report normal issue errors.',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,'Urgent issues','Report urgent issue errors.',1,NULL,'2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_issue_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_issues`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  `type_id` tinyint(3) unsigned NOT NULL,
  `name_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `istheweb_iscorporate_issues_client_id_index` (`client_id`),
  KEY `istheweb_iscorporate_issues_resource_id_index` (`resource_id`),
  KEY `istheweb_iscorporate_issues_creator_id_index` (`creator_id`),
  KEY `istheweb_iscorporate_issues_status_id_index` (`status_id`),
  KEY `istheweb_iscorporate_issues_type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_issues`
--

LOCK TABLES `istheweb_iscorporate_issues` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_option_values`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_option_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_iscorporate_option_values_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_option_values`
--

LOCK TABLES `istheweb_iscorporate_option_values` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_option_values` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_option_values` VALUES (1,1,'logo_graphic_design','Logo',150.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,1,'dossier_graphic_design','Dossier Corporativo',350.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(3,2,'page_web_design','Página web',700.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(4,2,'personal_web_design','Página personal',700.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(5,2,'corporate_web_design','Página corporativa',1500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(6,2,'portal_web_design','Portal',2500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(7,4,'basic_ecommerce','Tienda online básica',900.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(8,4,'avanced_ecommerce','Tienda online avanzada',1500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(9,4,'premium_ecommerce','Tienda online premium',2500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(10,2,'blog_web_design','Blog',500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(11,3,'posicionamiento_seo','Posicionamiento',200.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(12,3,'buscadores_seo','Buscadores',200.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(13,6,'basico_social_media','Plan Social Media Básico',350.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(14,6,'medio_social_media','Plan Social Media Medio',450.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(15,6,'avanzado_social_media','Plan Social Media Avanzado',650.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(16,6,'total_social_media','Plan Social Media Total',750.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(17,6,'otro_social_media','Otros',450.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(18,7,'dominio_mantenimiento','Dominio',10.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(19,7,'alojamiento_mantenimiento','Alojamiento',200.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(20,7,'soporte_mantenimiento','Soporte',150.00,'2017-03-27 18:23:01','2017-03-27 18:23:01'),(21,8,'project_personalized','Proyecto personalizado',500.00,'2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_pivots`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_pivots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_pivots` (
  `employee_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `project_option_id` int(10) unsigned DEFAULT NULL,
  `project_type_id` int(10) unsigned DEFAULT NULL,
  `option_value_id` int(10) unsigned DEFAULT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `budget_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  KEY `istheweb_iscorporate_pivots_employee_id_index` (`employee_id`),
  KEY `istheweb_iscorporate_pivots_role_id_index` (`role_id`),
  KEY `istheweb_iscorporate_pivots_project_id_index` (`project_id`),
  KEY `istheweb_iscorporate_pivots_project_option_id_index` (`project_option_id`),
  KEY `istheweb_iscorporate_pivots_project_type_id_index` (`project_type_id`),
  KEY `istheweb_iscorporate_pivots_option_value_id_index` (`option_value_id`),
  KEY `istheweb_iscorporate_pivots_variant_id_index` (`variant_id`),
  KEY `istheweb_iscorporate_pivots_budget_id_index` (`budget_id`),
  KEY `istheweb_iscorporate_pivots_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_pivots`
--

LOCK TABLES `istheweb_iscorporate_pivots` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_pivots` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_pivots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_project_options`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_project_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_project_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_iscorporate_project_options_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_project_options`
--

LOCK TABLES `istheweb_iscorporate_project_options` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_project_options` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_project_options` VALUES (1,'graphic_design','Diseño Gráfico','2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,'web_design','Diseño Web','2017-03-27 18:23:01','2017-03-27 18:23:01'),(3,'seo','Posicionamiento','2017-03-27 18:23:01','2017-03-27 18:23:01'),(4,'ecommerce','Tienda online','2017-03-27 18:23:01','2017-03-27 18:23:01'),(5,'back_office','Intranet','2017-03-27 18:23:01','2017-03-27 18:23:01'),(6,'social_media','Social Media','2017-03-27 18:23:01','2017-03-27 18:23:01'),(7,'maintenance','Mantenimiento','2017-03-27 18:23:01','2017-03-27 18:23:01'),(8,'personalized','Personalizado','2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_project_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_project_types`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_project_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) NOT NULL DEFAULT '0',
  `nest_right` int(11) NOT NULL DEFAULT '0',
  `nest_depth` int(11) NOT NULL DEFAULT '0',
  `published_at` date NOT NULL DEFAULT '2017-03-27',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_iscorporate_project_types_slug_unique` (`slug`),
  KEY `istheweb_iscorporate_project_types_name_index` (`name`),
  KEY `istheweb_iscorporate_project_types_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_project_types`
--

LOCK TABLES `istheweb_iscorporate_project_types` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_project_types` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_project_types` VALUES (1,'Actualizaciones','actualizaciones',NULL,NULL,1,2,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,'Diseño web','diseño web',NULL,NULL,3,4,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(3,'Formación','formación',NULL,NULL,5,6,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(4,'Diseño Gráfico','diseño gráfico',NULL,NULL,7,8,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(5,'Posicionamiento','posicionamiento',NULL,NULL,9,10,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(6,'Tienda Online','tienda online',NULL,NULL,11,12,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(7,'Social Media','social media',NULL,NULL,13,14,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(8,'Intranet','intranet',NULL,NULL,15,16,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(9,'Mantenimiento','mantenimiento',NULL,NULL,17,18,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01'),(10,'Personalizado','personalizado',NULL,NULL,19,20,0,'2017-03-27','2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_projects`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `now` int(11) NOT NULL DEFAULT '1',
  `comment` longtext COLLATE utf8_unicode_ci,
  `project_description` longtext COLLATE utf8_unicode_ci,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8_unicode_ci,
  `available_on` datetime NOT NULL,
  `available_until` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_iscorporate_projects_code_unique` (`code`),
  UNIQUE KEY `istheweb_iscorporate_projects_slug_unique` (`slug`),
  KEY `istheweb_iscorporate_projects_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_projects`
--

LOCK TABLES `istheweb_iscorporate_projects` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_providers`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_providers`
--

LOCK TABLES `istheweb_iscorporate_providers` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_reports`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variant_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `hours` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_reports`
--

LOCK TABLES `istheweb_iscorporate_reports` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_roles`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_roles`
--

LOCK TABLES `istheweb_iscorporate_roles` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_roles` DISABLE KEYS */;
INSERT INTO `istheweb_iscorporate_roles` VALUES (1,'Diseño gráfico','Encargado de los servicios de diseño gráfico','2017-03-27 18:23:01','2017-03-27 18:23:01'),(2,'Diseño web','Encargado de los servicios de diseño web','2017-03-27 18:23:01','2017-03-27 18:23:01'),(3,'SEO Manager','Encargado de los servicios SEO','2017-03-27 18:23:01','2017-03-27 18:23:01'),(4,'Desarrollador','Encargado de los servicios de técnicos','2017-03-27 18:23:01','2017-03-27 18:23:01'),(5,'Gerente','Gerente de la empresa','2017-03-27 18:23:01','2017-03-27 18:23:01'),(6,'Administración','Administración de la empresa','2017-03-27 18:23:01','2017-03-27 18:23:01');
/*!40000 ALTER TABLE `istheweb_iscorporate_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_iscorporate_variants`
--

DROP TABLE IF EXISTS `istheweb_iscorporate_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_iscorporate_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `projectable_id` int(11) NOT NULL,
  `projectable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `available_on` datetime DEFAULT NULL,
  `available_until` datetime DEFAULT NULL,
  `plazo` int(11) NOT NULL,
  `horas` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  `urls` longtext COLLATE utf8_unicode_ci,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `pricing_calculator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pricing_configuration` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_iscorporate_variants`
--

LOCK TABLES `istheweb_iscorporate_variants` WRITE;
/*!40000 ALTER TABLE `istheweb_iscorporate_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `istheweb_iscorporate_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_ispdf_layouts`
--

DROP TABLE IF EXISTS `istheweb_ispdf_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_ispdf_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_ispdf_layouts_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_ispdf_layouts`
--

LOCK TABLES `istheweb_ispdf_layouts` WRITE;
/*!40000 ALTER TABLE `istheweb_ispdf_layouts` DISABLE KEYS */;
INSERT INTO `istheweb_ispdf_layouts` VALUES (1,'iscorporate-budgets','IsCorporate Budgets','<html>\\r\\n    <head>\\r\\n        <style type=\"text/css\" media=\"screen\">\\r\\n            {{ css|raw }}\\r\\n        </style>\\r\\n    </head>\\r\\n    <body style=\"background: url({{ background_img }}) top left no-repeat;\">\\r\\n        <div class=\"header\">\\r\\n            <p class=\"left\"></p>\\r\\n            <p class=\"right\">\\r\\n                <strong>{{ company.name }}</strong><br>\\r\\n                <strong>{{ company.url}}</strong><br>\\r\\n            </p>\\r\\n        </div>\\r\\n        <div class=\"footer\">\\r\\n        </div>\\r\\n        {{ content_html|raw }}\\r\\n    </body>\\r\\n</html>','@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Regular.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-weight: bold;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Bold.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-style: italic;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Italic.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-style: italic;\r\n    font-weight: bold;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-BoldItalic.ttf\\\');\r\n}\r\n\r\n@page {\r\n    margin: 0;\r\n    padding: 0;\r\n}\r\n\r\nbody {\r\n    font-family: \\\'Open Sans\\\', sans-serif;\r\n    font-size: 14px;\r\n}\r\n\r\n.header {\r\n    position: fixed;\r\n    top: 3%;\r\n    left: 30%;\r\n}\r\n\r\n.header .left {\r\n    color: #373430;\r\n    font-size: .9em;\r\n    text-transform: uppercase;\r\n    width: 60%;\r\n    display: inline-block;\r\n}\r\n\r\n.header .right {\r\n    font-size: .7em;\r\n    color: #545554;\r\n    line-height: 1em;\r\n    text-align: right;\r\n    display: inline-block;\r\n    width: 30%;\r\n    padding-top: 1%;\r\n}\r\n\r\n.footer {\r\n    position: fixed;\r\n    bottom: 0;\r\n    left: 5%;\r\n    height: 12%;\r\n    font-size: .7em;\r\n    color: #545554;\r\n    line-height: 1em;\r\n}\r\n\r\n.footer .left {\r\n    display: inline-block;\r\n    width: 25%;\r\n}\r\n\r\n.footer .right {\r\n    display: inline-block;\r\n    width: 30%;\r\n    padding-top: 7%;\r\n}\r\n\r\n.content {\r\n    margin: 12% 0 0 10%;\r\n}\r\n\r\n.small-txt {\r\n    font-size: .7em;\r\n}\r\n\r\n.company-info {\r\n    display: inline-block;\r\n    width: 55%;\r\n    line-height: 1.1em;\r\n    font-size: 1.1em;\r\n}\r\n\r\n.customer-info {\r\n    display: inline-block;\r\n    width: 45%;\r\n    font-size: .9em;\r\n    height: 10%;\r\n}\r\n\r\n.summary {\r\n    margin: 10% 0 5% 0;\r\n    border-collapse: collapse;\r\n    width: 90%;\r\n}\r\n\r\n.summary th {\r\n    background-color: #BEBEBE;\r\n    border: 1px solid #000;\r\n    padding: 5px;\r\n}\r\n\r\n.summary td {\r\n    padding: 5px 10px;\r\n    border-right: 1px solid #000;\r\n}\r\n\r\n.summary .col-1 {\r\n    width: 15%;\r\n    text-align: center;\r\n    border-left: 1px solid #000;\r\n}\r\n\r\n.summary .col-2 {\r\n    width: 50%;\r\n}\r\n\r\n.summary .col-3 {\r\n    width: 15%;\r\n    text-align: right;\r\n}\r\n\r\n.summary .col-4 {\r\n    width: 20%;\r\n    text-align: right;\r\n}\r\n\r\n.summary .bt {\r\n    border-top: 1px solid #000;\r\n}\r\n\r\n.summary .sum-price .col-4 {\r\n    border-top: 1px solid #000;\r\n    border-bottom: 1px solid #000;\r\n}','2017-03-26 10:10:12','2017-03-26 10:10:12'),(2,'iscorporate-invoices','IsCorporate Invoices','<html>\\r\\n    <head>\\r\\n        <style type=\"text/css\" media=\"screen\">\\r\\n            {{ css|raw }}\\r\\n        </style>\\r\\n    </head>\\r\\n    <body style=\"background: url({{ background_img }}) top left no-repeat;\">\\r\\n        <div class=\"header\">\\r\\n            <p class=\"left\"></p>\\r\\n            <p class=\"right\">\\r\\n                <strong>{{ company.name }}</strong><br>\\r\\n                <strong>{{ company.url}}</strong><br>\\r\\n            </p>\\r\\n        </div>\\r\\n        <div class=\"footer\">\\r\\n        </div>\\r\\n        {{ content_html|raw }}\\r\\n    </body>\\r\\n</html>','@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Regular.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-weight: bold;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Bold.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-style: italic;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-Italic.ttf\\\');\r\n}\r\n\r\n@font-face {\r\n    font-family: \\\'Open Sans\\\';\r\n    font-style: italic;\r\n    font-weight: bold;\r\n    src: url(\\\'plugins/renatio/dynamicpdf/assets/fonts/OpenSans-BoldItalic.ttf\\\');\r\n}\r\n\r\n@page {\r\n    margin: 0;\r\n    padding: 0;\r\n}\r\n\r\nbody {\r\n    font-family: \\\'Open Sans\\\', sans-serif;\r\n    font-size: 14px;\r\n}\r\n\r\n.header {\r\n    position: fixed;\r\n    top: 3%;\r\n    left: 30%;\r\n}\r\n\r\n.header .left {\r\n    color: #373430;\r\n    font-size: .9em;\r\n    text-transform: uppercase;\r\n    width: 60%;\r\n    display: inline-block;\r\n}\r\n\r\n.header .right {\r\n    font-size: .7em;\r\n    color: #545554;\r\n    line-height: 1em;\r\n    text-align: right;\r\n    display: inline-block;\r\n    width: 30%;\r\n    padding-top: 1%;\r\n}\r\n\r\n.footer {\r\n    position: fixed;\r\n    bottom: 0;\r\n    left: 5%;\r\n    height: 12%;\r\n    font-size: .7em;\r\n    color: #545554;\r\n    line-height: 1em;\r\n}\r\n\r\n.footer .left {\r\n    display: inline-block;\r\n    width: 25%;\r\n}\r\n\r\n.footer .right {\r\n    display: inline-block;\r\n    width: 30%;\r\n    padding-top: 7%;\r\n}\r\n\r\n.content {\r\n    margin: 12% 0 0 10%;\r\n}\r\n\r\n.small-txt {\r\n    font-size: .7em;\r\n}\r\n\r\n.company-info {\r\n    display: inline-block;\r\n    width: 55%;\r\n    line-height: 1.1em;\r\n    font-size: 1.1em;\r\n}\r\n\r\n.customer-info {\r\n    display: inline-block;\r\n    width: 45%;\r\n    font-size: .9em;\r\n    height: 10%;\r\n}\r\n\r\n.summary {\r\n    margin: 10% 0 5% 0;\r\n    border-collapse: collapse;\r\n    width: 90%;\r\n}\r\n\r\n.summary th {\r\n    background-color: #BEBEBE;\r\n    border: 1px solid #000;\r\n    padding: 5px;\r\n}\r\n\r\n.summary td {\r\n    padding: 5px 10px;\r\n    border-right: 1px solid #000;\r\n}\r\n\r\n.summary .col-1 {\r\n    width: 15%;\r\n    text-align: center;\r\n    border-left: 1px solid #000;\r\n}\r\n\r\n.summary .col-2 {\r\n    width: 50%;\r\n}\r\n\r\n.summary .col-3 {\r\n    width: 15%;\r\n    text-align: right;\r\n}\r\n\r\n.summary .col-4 {\r\n    width: 20%;\r\n    text-align: right;\r\n}\r\n\r\n.summary .bt {\r\n    border-top: 1px solid #000;\r\n}\r\n\r\n.summary .sum-price .col-4 {\r\n    border-top: 1px solid #000;\r\n    border-bottom: 1px solid #000;\r\n}','2017-03-26 10:10:12','2017-03-26 10:10:12');
/*!40000 ALTER TABLE `istheweb_ispdf_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_ispdf_templates`
--

DROP TABLE IF EXISTS `istheweb_ispdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_ispdf_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_ispdf_templates_code_unique` (`code`),
  KEY `istheweb_ispdf_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_ispdf_templates`
--

LOCK TABLES `istheweb_ispdf_templates` WRITE;
/*!40000 ALTER TABLE `istheweb_ispdf_templates` DISABLE KEYS */;
INSERT INTO `istheweb_ispdf_templates` VALUES (1,1,'budget-template','Budget Template','','<div class=\"content\">\r\n    <p class=\"small-txt\">{{ address }}</p>\r\n    \r\n    <p><strong>Nº de Pedido: {{ pdfNumber }}</strong><br><strong>Fecha: {{ \\\'now\\\'|date(\\\'d-m-Y\\\') }}</strong></p>\r\n\r\n    <p class=\"company-info\">\r\n        <strong>{{ company.name }}</strong><br>\r\n        <strong>{{ company.address }} </strong><br>\r\n        <strong>{{ company.zip_code }} {{ company.city }} {{ company.country }}</strong><br>\r\n        <strong>CIF: B90270711</strong>\r\n    </p>\r\n\r\n    <p class=\"customer-info\" >\r\n            <strong>CLIENTE</strong>: {{ cif }}<br>\r\n        {{ billingAddress|raw }}<br>\r\n        <strong>Dirección de envío</strong><br>\r\n        {{ shippingAddress|raw }}\r\n\r\n    </p>\r\n    \r\n    <table class=\"summary\">\r\n        <tr>\r\n            <th>Cantidad</th>\r\n            <th>Concepto</th>\r\n            <th>Precio</th>\r\n            <th>Neto</th>\r\n        </tr>\r\n        {% for item in items %}\r\n        <tr>\r\n            <td class=\"col-1\">{{ item.qty }}</td>\r\n            <td class=\"col-2\">{{ item.name }}</td>\r\n            <td class=\"col-3\">{{ item.price }} &euro;</td>\r\n            <td class=\"col-4\">{{ item.price }} &euro;</td>\r\n        </tr>\r\n        {% endfor %}\r\n\r\n        \r\n        <tr class=\"sum-price\">\r\n            <td colspan=\"3\" class=\"col-3 bt\">Subtotal</td>\r\n            <td class=\"col-4\">{{ subtotal }} &euro;</td>\r\n        </tr>\r\n        <tr class=\"sum-price\">\r\n            <td colspan=\"3\" class=\"col-3\"><strong>Total</strong></td>\r\n            <td class=\"col-4\">{{ total }} &euro;</td>\r\n        </tr>\r\n    </table>\r\n    <p><strong>Política de devoluciones</strong></p>\r\n\r\n    <p><small>Nuestra política de devolución es muy sencilla. <br>Podrás devolver cualquier artículo comprado en www.dxbwatch.es por las siguientes causas:</small></p>\r\n        <ul>\r\n            <li>Si el artículo presenta defectos de fabricación.</li>\r\n            <li>Si existe equivocación en el artículo enviado.</li>\r\n        </ul>\r\n        <p><small>En ambos casos el producto debe ser devuelto con todos sus accesorios y en el mismo estado en el que se entregó.<br>\r\n        En la recepción de mercancía errónea o dañada se aplicará el cambio físico de la misma solo si ésta fue reportada durante las primeras 72 horas posteriores a su entrega, en ningún caso se procederá a la devolución del importe abonado por el cliente, excepto si la reposición del producto no podemos hacerla en un plazo máximo de 7 días hábiles desde la recepción del producto devuelto.<br>\r\n        Para cualquier devolución deberás contactar con nuestro departamento de atención al cliente a través de correo electrónico mandando un email a: info@dxbwatch.es</small> </p>\r\n</div>','2017-03-26 10:10:12','2017-03-26 10:12:30'),(2,1,'invoice-template','Invoice Template','','<div class=\"content\">\r\n    <p class=\"small-txt\">{{ address }}</p>\r\n    \r\n    <p><strong>Nº de Pedido: {{ pdfNumber }}</strong><br><strong>Fecha: {{ \\\'now\\\'|date(\\\'d-m-Y\\\') }}</strong></p>\r\n\r\n    <p class=\"company-info\">\r\n        <strong>{{ company.name }}</strong><br>\r\n        <strong>{{ company.address }} </strong><br>\r\n        <strong>{{ company.zip_code }} {{ company.city }} {{ company.country }}</strong><br>\r\n        <strong>CIF: B90270711</strong>\r\n    </p>\r\n\r\n    <p class=\"customer-info\" >\r\n            <strong>CLIENTE</strong>: {{ cif }}<br>\r\n        {{ billingAddress|raw }}<br>\r\n        <strong>Dirección de envío</strong><br>\r\n        {{ shippingAddress|raw }}\r\n\r\n    </p>\r\n    \r\n    <table class=\"summary\">\r\n        <tr>\r\n            <th>Cantidad</th>\r\n            <th>Concepto</th>\r\n            <th>Precio</th>\r\n            <th>Neto</th>\r\n        </tr>\r\n        {% for item in items %}\r\n        <tr>\r\n            <td class=\"col-1\">{{ item.qty }}</td>\r\n            <td class=\"col-2\">{{ item.name }}</td>\r\n            <td class=\"col-3\">{{ item.price }} &euro;</td>\r\n            <td class=\"col-4\">{{ item.price }} &euro;</td>\r\n        </tr>\r\n        {% endfor %}\r\n\r\n        \r\n        <tr class=\"sum-price\">\r\n            <td colspan=\"3\" class=\"col-3 bt\">Subtotal</td>\r\n            <td class=\"col-4\">{{ subtotal }} &euro;</td>\r\n        </tr>\r\n        <tr class=\"sum-price\">\r\n            <td colspan=\"3\" class=\"col-3\"><strong>Total</strong></td>\r\n            <td class=\"col-4\">{{ total }} &euro;</td>\r\n        </tr>\r\n    </table>\r\n    <p><strong>Política de devoluciones</strong></p>\r\n\r\n    <p><small>Nuestra política de devolución es muy sencilla. <br>Podrás devolver cualquier artículo comprado en www.dxbwatch.es por las siguientes causas:</small></p>\r\n        <ul>\r\n            <li>Si el artículo presenta defectos de fabricación.</li>\r\n            <li>Si existe equivocación en el artículo enviado.</li>\r\n        </ul>\r\n        <p><small>En ambos casos el producto debe ser devuelto con todos sus accesorios y en el mismo estado en el que se entregó.<br>\r\n        En la recepción de mercancía errónea o dañada se aplicará el cambio físico de la misma solo si ésta fue reportada durante las primeras 72 horas posteriores a su entrega, en ningún caso se procederá a la devolución del importe abonado por el cliente, excepto si la reposición del producto no podemos hacerla en un plazo máximo de 7 días hábiles desde la recepción del producto devuelto.<br>\r\n        Para cualquier devolución deberás contactar con nuestro departamento de atención al cliente a través de correo electrónico mandando un email a: info@dxbwatch.es</small> </p>\r\n</div>','2017-03-27 18:36:44','2017-03-27 18:36:44');
/*!40000 ALTER TABLE `istheweb_ispdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_addresses`
--

DROP TABLE IF EXISTS `istheweb_shop_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `address_1` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_2` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_addresses`
--

LOCK TABLES `istheweb_shop_addresses` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_addresses` DISABLE KEYS */;
INSERT INTO `istheweb_shop_addresses` VALUES (1,1,210,445,'Calle Bernardo Caballero de Carpio, 28',NULL,'Espartinas','41807','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_adjustments`
--

DROP TABLE IF EXISTS `istheweb_shop_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderable_id` int(10) unsigned NOT NULL,
  `orderable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `is_neutral` tinyint(4) NOT NULL DEFAULT '0',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_adjustments`
--

LOCK TABLES `istheweb_shop_adjustments` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_adjustments` DISABLE KEYS */;
INSERT INTO `istheweb_shop_adjustments` VALUES (1,1,'Istheweb\\Shop\\Models\\OrderItem','tax','ES - Ropa - 21%',5418,0,0,'2017-04-09 07:23:52','2017-04-09 11:43:29'),(3,1,'Istheweb\\Shop\\Models\\Order','shipment','Seur - ES',1416,0,0,'2017-04-09 08:19:22','2017-04-10 16:49:42'),(4,2,'Istheweb\\Shop\\Models\\OrderItem','tax','ES - Ropa - 21%',2625,0,0,'2017-04-09 08:20:43','2017-04-09 08:20:43'),(176,8,'Istheweb\\Shop\\Models\\OrderItem','tax','ES - Ropa - 21%',2709,0,0,'2017-04-10 16:49:42','2017-04-10 16:49:42'),(183,1,'Istheweb\\Shop\\Models\\Order','tax','ES - Ropa - 21%',5418,0,0,'2017-04-10 16:55:05','2017-04-10 16:55:05'),(184,1,'Istheweb\\Shop\\Models\\Order','tax','ES - Ropa - 21%',2625,0,0,'2017-04-10 16:55:05','2017-04-10 16:55:05'),(185,1,'Istheweb\\Shop\\Models\\Order','tax','ES - Ropa - 21%',2709,0,0,'2017-04-10 16:55:05','2017-04-10 16:55:05');
/*!40000 ALTER TABLE `istheweb_shop_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_attribute_values`
--

DROP TABLE IF EXISTS `istheweb_shop_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `text_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double(8,2) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_attribute_values`
--

LOCK TABLES `istheweb_shop_attribute_values` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_attribute_values` DISABLE KEYS */;
INSERT INTO `istheweb_shop_attribute_values` VALUES (1,1,2,'Emidio Tucci',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,1,1,'Otoño / Invierno 2017',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(3,1,3,'65 % Algodón 28 % Poliéster 7 % Nailon',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_attributes`
--

DROP TABLE IF EXISTS `istheweb_shop_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storage_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_attributes`
--

LOCK TABLES `istheweb_shop_attributes` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_attributes` DISABLE KEYS */;
INSERT INTO `istheweb_shop_attributes` VALUES (1,'coleccion','Colección','','','a:0:{}','2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,'marca','Marca','','','a:0:{}','2017-04-08 10:35:02','2017-04-08 10:35:02'),(3,'composicion','Composición','','','a:0:{}','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_categories`
--

DROP TABLE IF EXISTS `istheweb_shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) NOT NULL DEFAULT '0',
  `nest_right` int(11) NOT NULL DEFAULT '0',
  `nest_depth` int(11) NOT NULL DEFAULT '0',
  `published_at` date NOT NULL DEFAULT '2017-04-08',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_categories_slug_unique` (`slug`),
  KEY `istheweb_shop_categories_name_index` (`name`),
  KEY `istheweb_shop_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_categories`
--

LOCK TABLES `istheweb_shop_categories` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_categories` DISABLE KEYS */;
INSERT INTO `istheweb_shop_categories` VALUES (1,'Moda y Accesorios','moda-y-accesorios','',NULL,1,2,0,'2017-04-08','2017-04-08 10:35:01','2017-04-08 10:35:01'),(2,'Hombre','hombre','',NULL,3,4,0,'2017-04-08','2017-04-08 10:35:01','2017-04-08 10:35:01'),(3,'Mujer','mujer','',NULL,5,6,0,'2017-04-08','2017-04-08 10:35:01','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_currencies`
--

DROP TABLE IF EXISTS `istheweb_shop_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code_num` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `sign` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(3) unsigned NOT NULL,
  `decimals` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,2) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_currencies`
--

LOCK TABLES `istheweb_shop_currencies` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_currencies` DISABLE KEYS */;
INSERT INTO `istheweb_shop_currencies` VALUES (1,'Euro','EUR','978','€',2,1,1.00,1,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,'Dollar','USD','840','$',1,1,1.00,1,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_customers`
--

DROP TABLE IF EXISTS `istheweb_shop_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `phone` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cif` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_customers`
--

LOCK TABLES `istheweb_shop_customers` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_customers` DISABLE KEYS */;
INSERT INTO `istheweb_shop_customers` VALUES (1,1,'955712646','647583630',NULL,'123456789F','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_option_values`
--

DROP TABLE IF EXISTS `istheweb_shop_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_option_values_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_option_values`
--

LOCK TABLES `istheweb_shop_option_values` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_option_values` DISABLE KEYS */;
INSERT INTO `istheweb_shop_option_values` VALUES (1,1,'size_s','S','2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,1,'size_m','M','2017-04-08 10:35:02','2017-04-08 10:35:02'),(3,1,'size_l','L','2017-04-08 10:35:02','2017-04-08 10:35:02'),(4,1,'size_xl','XL','2017-04-08 10:35:02','2017-04-08 10:35:02'),(5,1,'size_xxl','XXL','2017-04-08 10:35:02','2017-04-08 10:35:02'),(6,2,'color_white','Blanco','2017-04-08 10:35:02','2017-04-08 10:35:02'),(7,2,'color_black','Negro','2017-04-08 10:35:02','2017-04-08 10:35:02'),(8,2,'color_blue','Azul','2017-04-08 10:35:02','2017-04-08 10:35:02'),(9,2,'color_red','Rojo','2017-04-08 10:35:02','2017-04-08 10:35:02'),(10,2,'color_yellow','Amarillo','2017-04-08 10:35:02','2017-04-08 10:35:02'),(11,3,'46','46','2017-04-08 10:35:02','2017-04-08 10:35:02'),(12,3,'48','48','2017-04-08 10:35:02','2017-04-08 10:35:02'),(13,3,'50','50','2017-04-08 10:35:02','2017-04-08 10:35:02'),(14,3,'52','52','2017-04-08 10:35:02','2017-04-08 10:35:02'),(15,3,'54','54','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_options`
--

DROP TABLE IF EXISTS `istheweb_shop_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_options_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_options`
--

LOCK TABLES `istheweb_shop_options` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_options` DISABLE KEYS */;
INSERT INTO `istheweb_shop_options` VALUES (1,'t-shirt-size','Talla camisetas','2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,'color','Color','2017-04-08 10:35:02','2017-04-08 10:35:02'),(3,'tallas-ropa-hombre','Talla ropa hombre','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_order_items`
--

DROP TABLE IF EXISTS `istheweb_shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `productable_id` int(10) unsigned NOT NULL,
  `productable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `unit_total` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `adjustments_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_order_items`
--

LOCK TABLES `istheweb_shop_order_items` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_order_items` DISABLE KEYS */;
INSERT INTO `istheweb_shop_order_items` VALUES (1,1,2,'Istheweb\\Shop\\Models\\Variant',2,129.00,258.00,258.00,NULL,'2017-04-09 07:23:52','2017-04-10 16:55:05'),(2,1,2,'Istheweb\\Shop\\Models\\Product',1,125.00,125.00,125.00,NULL,'2017-04-09 08:20:43','2017-04-09 15:44:39'),(8,1,4,'Istheweb\\Shop\\Models\\Variant',1,129.00,129.00,129.00,NULL,'2017-04-10 16:49:42','2017-04-10 16:49:42');
/*!40000 ALTER TABLE `istheweb_shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_order_statuses`
--

DROP TABLE IF EXISTS `istheweb_shop_order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_order_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(4) DEFAULT '0',
  `attach_invoice` tinyint(4) DEFAULT '0',
  `email_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_order_statuses`
--

LOCK TABLES `istheweb_shop_order_statuses` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_order_statuses` DISABLE KEYS */;
INSERT INTO `istheweb_shop_order_statuses` VALUES (1,'Nuevo Pedido - Reembolso','cash','#f1c40f',1,0,'istheweb.shop::mail.orderconfirm','2017-04-08 10:35:01','2017-04-08 10:35:01'),(2,'Nuevo Pedido - Paypal','paypal','#f1c40f',1,0,'istheweb.shop::mail.orderconfirm','2017-04-08 10:35:01','2017-04-08 10:35:01'),(3,'Pago Cancelado','cancel','#c0392b',0,0,'istheweb.shop::mail.orderconfirm','2017-04-08 10:35:01','2017-04-08 10:35:01'),(4,'Pago Recibido','approved','#8e44ad',1,1,'istheweb.shop::mail.orderconfirm','2017-04-08 10:35:01','2017-04-08 10:35:01'),(5,'Pedido Enviado','sent','#27ae60',1,0,'istheweb.shop::order.order_send','2017-04-08 10:35:01','2017-04-08 10:35:01'),(6,'Pedido Entregado','delivered','#95a5a6',1,0,'istheweb.shop::order.order_delivered','2017-04-08 10:35:01','2017-04-08 10:35:01'),(7,'Nuevo Pedido - Administración','admin','#34495e',0,0,'istheweb.shop::order.order-received','2017-04-08 10:35:01','2017-04-08 10:35:01'),(8,'Nuevo Pedido - Tpv','tpv','#f39c12',1,0,'istheweb.shop::order.order-received','2017-04-08 10:35:01','2017-04-08 10:35:01'),(9,'Nuevo Pedido - Stripe','stripe','#2ecc71',1,0,'istheweb.shop::order.order-received','2017-04-08 10:35:01','2017-04-08 10:35:01');
/*!40000 ALTER TABLE `istheweb_shop_order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_orders`
--

DROP TABLE IF EXISTS `istheweb_shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_status_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `shipping_address_id` int(10) unsigned NOT NULL,
  `billing_address_id` int(10) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `shipping` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `adjustments_total` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_orders_reference_unique` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_orders`
--

LOCK TABLES `istheweb_shop_orders` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_orders` DISABLE KEYS */;
INSERT INTO `istheweb_shop_orders` VALUES (1,1,1,1,1,'20000000','cash',107.52,14.16,512.00,633.68,12168,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:45:33','2017-04-10 16:55:05');
/*!40000 ALTER TABLE `istheweb_shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_pivots`
--

DROP TABLE IF EXISTS `istheweb_shop_pivots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_pivots` (
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `option_id` int(10) unsigned DEFAULT NULL,
  `option_value_id` int(10) unsigned DEFAULT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `zone_id` int(10) unsigned DEFAULT NULL,
  KEY `istheweb_shop_pivots_product_id_index` (`product_id`),
  KEY `istheweb_shop_pivots_category_id_index` (`category_id`),
  KEY `istheweb_shop_pivots_option_id_index` (`option_id`),
  KEY `istheweb_shop_pivots_option_value_id_index` (`option_value_id`),
  KEY `istheweb_shop_pivots_variant_id_index` (`variant_id`),
  KEY `istheweb_shop_pivots_country_id_index` (`country_id`),
  KEY `istheweb_shop_pivots_state_id_index` (`state_id`),
  KEY `istheweb_shop_pivots_zone_id_index` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_pivots`
--

LOCK TABLES `istheweb_shop_pivots` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_pivots` DISABLE KEYS */;
INSERT INTO `istheweb_shop_pivots` VALUES (NULL,NULL,NULL,NULL,NULL,210,NULL,1),(NULL,NULL,NULL,NULL,NULL,210,NULL,1),(1,1,NULL,NULL,NULL,NULL,NULL,NULL),(1,2,NULL,NULL,NULL,NULL,NULL,NULL),(1,NULL,2,NULL,NULL,NULL,NULL,NULL),(1,NULL,3,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,10,2,NULL,NULL,NULL),(NULL,NULL,NULL,14,2,NULL,NULL,NULL),(NULL,NULL,NULL,10,3,NULL,NULL,NULL),(NULL,NULL,NULL,15,3,NULL,NULL,NULL),(NULL,NULL,NULL,10,4,NULL,NULL,NULL),(NULL,NULL,NULL,16,4,NULL,NULL,NULL),(NULL,NULL,NULL,10,5,NULL,NULL,NULL),(NULL,NULL,NULL,17,5,NULL,NULL,NULL),(2,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `istheweb_shop_pivots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_products`
--

DROP TABLE IF EXISTS `istheweb_shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `shipping_category_id` int(10) unsigned DEFAULT NULL,
  `product_type` int(11) NOT NULL DEFAULT '1',
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8_unicode_ci,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `wholesaler_price` decimal(13,2) DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `on_hold` int(11) NOT NULL DEFAULT '0',
  `on_hand` int(11) NOT NULL DEFAULT '0',
  `tracked` tinyint(4) NOT NULL DEFAULT '0',
  `available_on` datetime DEFAULT NULL,
  `available_until` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_products_code_unique` (`code`),
  UNIQUE KEY `istheweb_shop_products_slug_unique` (`slug`),
  KEY `istheweb_shop_products_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_products`
--

LOCK TABLES `istheweb_shop_products` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_products` DISABLE KEYS */;
INSERT INTO `istheweb_shop_products` VALUES (1,'000000001','Parka de hombre','parka-de-hombre',1,1,2,'<p>Parka de color verder, con cierre de cremallera y automáticos, más una trabilla en el cuello.</p>','<p>Parka con cierre de cremallera y automáticos, más una trabilla en el cuello. Lleva capucha extraíble mediante cremallera y dispone de cuatro bolsillos delanteros y uno en la manga izquierda. En su interior lleva un cordón en la cintura, para ajustar.</p>','','<p>Parka con cierre de cremallera y automáticos, más una trabilla en el cuello. Lleva capucha extraíble mediante cremallera y dispone de cuatro bolsillos delanteros y uno en la manga izquierda. En su interior lleva un cordón en la cintura, para ajustar.</','<p>Parka de color verder, con cierre de cremallera y automáticos, más una trabilla en el cuello.</p>',NULL,NULL,NULL,NULL,NULL,20.25,125.00,0,50,1,'2017-02-03 07:50:08',NULL,1,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,'000000002','Producto simple','producto-simple',1,1,1,'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium qu','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>','','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </p>','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>',NULL,NULL,NULL,NULL,NULL,40.45,175.00,0,50,1,'2017-02-03 07:50:08',NULL,1,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_shipment_items`
--

DROP TABLE IF EXISTS `istheweb_shop_shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipment_id` int(10) unsigned NOT NULL,
  `shippable_id` int(10) unsigned NOT NULL,
  `shippable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ready',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_shipment_items`
--

LOCK TABLES `istheweb_shop_shipment_items` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_shipment_items` DISABLE KEYS */;
INSERT INTO `istheweb_shop_shipment_items` VALUES (50,1,2,'Istheweb\\Shop\\Models\\Variant','ready','2017-04-10 16:49:42','2017-04-10 16:49:42'),(51,1,2,'Istheweb\\Shop\\Models\\Product','ready','2017-04-10 16:49:42','2017-04-10 16:49:42'),(52,1,4,'Istheweb\\Shop\\Models\\Variant','ready','2017-04-10 16:49:42','2017-04-10 16:49:42');
/*!40000 ALTER TABLE `istheweb_shop_shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_shipments`
--

DROP TABLE IF EXISTS `istheweb_shop_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `shipping_method_id` int(10) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ready',
  `tracking` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_shipments`
--

LOCK TABLES `istheweb_shop_shipments` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_shipments` DISABLE KEYS */;
INSERT INTO `istheweb_shop_shipments` VALUES (1,1,2,'ready',NULL,'2017-04-09 08:19:22','2017-04-09 13:26:17');
/*!40000 ALTER TABLE `istheweb_shop_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_shipping_categories`
--

DROP TABLE IF EXISTS `istheweb_shop_shipping_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_shipping_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_shipping_categories_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_shipping_categories`
--

LOCK TABLES `istheweb_shop_shipping_categories` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_shipping_categories` DISABLE KEYS */;
INSERT INTO `istheweb_shop_shipping_categories` VALUES (1,'spanish_shipping','Envios nacionales ES','Grupo de envio para las provincias de España','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_shipping_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_shipping_methods`
--

DROP TABLE IF EXISTS `istheweb_shop_shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_shipping_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_category_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `calculator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `amount` decimal(13,2) NOT NULL,
  `category_requirement` int(11) NOT NULL DEFAULT '1',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_shipping_methods_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_shipping_methods`
--

LOCK TABLES `istheweb_shop_shipping_methods` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_shipping_methods` DISABLE KEYS */;
INSERT INTO `istheweb_shop_shipping_methods` VALUES (1,1,1,1,'ups_spain','UPS - ES','Envio UPS a las provincias de la Península Ibérica','flat_rate',3.24,1,1,0,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,1,1,1,'seur_spain','Seur - ES','Grupo de impuestos aplicado a la ropa','per_unit_rate',3.54,1,1,1,'2017-04-08 10:35:02','2017-04-09 09:54:31');
/*!40000 ALTER TABLE `istheweb_shop_shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_tax_categories`
--

DROP TABLE IF EXISTS `istheweb_shop_tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_tax_categories`
--

LOCK TABLES `istheweb_shop_tax_categories` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_tax_categories` DISABLE KEYS */;
INSERT INTO `istheweb_shop_tax_categories` VALUES (1,'clothing','Ropa','Grupo de impuestos aplicado a la ropa','2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_tax_rates`
--

DROP TABLE IF EXISTS `istheweb_shop_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(13,2) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_tax_rates`
--

LOCK TABLES `istheweb_shop_tax_rates` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_tax_rates` DISABLE KEYS */;
INSERT INTO `istheweb_shop_tax_rates` VALUES (1,1,1,'ES - Ropa - 21%','P',21.00,1,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_variants`
--

DROP TABLE IF EXISTS `istheweb_shop_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `availableOn` datetime DEFAULT NULL,
  `availableUntil` datetime DEFAULT NULL,
  `on_hold` int(11) NOT NULL DEFAULT '0',
  `on_hand` int(11) NOT NULL DEFAULT '0',
  `tracked` tinyint(4) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL,
  `pricing_calculator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pricing_configuration` longtext COLLATE utf8_unicode_ci,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `istheweb_shop_variants_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_variants`
--

LOCK TABLES `istheweb_shop_variants` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_variants` DISABLE KEYS */;
INSERT INTO `istheweb_shop_variants` VALUES (1,1,'51324994','Parka de hombre - Verde - 48','2017-02-02 08:09:46',NULL,0,10,1,129,'',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(2,1,'51324995','Parka de hombre - Verde - 50','2017-02-02 08:09:46',NULL,0,10,1,129,'',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(3,1,'51324996','Parka de hombre - Verde - 52','2017-02-02 08:09:46',NULL,0,10,1,129,'',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02'),(4,1,'51324997','Parka de hombre - Verde - 54','2017-02-02 08:09:46',NULL,0,10,1,129,'',NULL,NULL,NULL,NULL,NULL,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istheweb_shop_zones`
--

DROP TABLE IF EXISTS `istheweb_shop_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istheweb_shop_zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istheweb_shop_zones`
--

LOCK TABLES `istheweb_shop_zones` WRITE;
/*!40000 ALTER TABLE `istheweb_shop_zones` DISABLE KEYS */;
INSERT INTO `istheweb_shop_zones` VALUES (1,'España','Zona de las provincias de España exceptuando las islas, Ceuta y Melilla',1,'2017-04-08 10:35:02','2017-04-08 10:35:02');
/*!40000 ALTER TABLE `istheweb_shop_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Deferred_Bindings',1),('2013_10_01_000002_Db_System_Files',1),('2013_10_01_000003_Db_System_Plugin_Versions',1),('2013_10_01_000004_Db_System_Plugin_History',1),('2013_10_01_000005_Db_System_Settings',1),('2013_10_01_000006_Db_System_Parameters',1),('2013_10_01_000007_Db_System_Add_Disabled_Flag',1),('2013_10_01_000008_Db_System_Mail_Templates',1),('2013_10_01_000009_Db_System_Mail_Layouts',1),('2014_10_01_000010_Db_Jobs',1),('2014_10_01_000011_Db_System_Event_Logs',1),('2014_10_01_000012_Db_System_Request_Logs',1),('2014_10_01_000013_Db_System_Sessions',1),('2015_10_01_000014_Db_System_Mail_Layout_Rename',1),('2015_10_01_000015_Db_System_Add_Frozen_Flag',1),('2015_10_01_000016_Db_Cache',1),('2015_10_01_000017_Db_System_Revisions',1),('2015_10_01_000018_Db_FailedJobs',1),('2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),('2016_10_01_000020_Db_System_Timestamp_Fix',1),('2013_10_01_000001_Db_Backend_Users',2),('2013_10_01_000002_Db_Backend_User_Groups',2),('2013_10_01_000003_Db_Backend_Users_Groups',2),('2013_10_01_000004_Db_Backend_User_Throttle',2),('2014_01_04_000005_Db_Backend_User_Preferences',2),('2014_10_01_000006_Db_Backend_Access_Log',2),('2014_10_01_000007_Db_Backend_Add_Description_Field',2),('2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),('2016_10_01_000009_Db_Backend_Timestamp_Fix',2),('2014_10_01_000001_Db_Cms_Theme_Data',3),('2016_10_01_000002_Db_Cms_Timestamp_Fix',3),('2017_10_01_000003_Db_Cms_Theme_Logs',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_categories`
--

LOCK TABLES `rainlab_blog_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_categories` DISABLE KEYS */;
INSERT INTO `rainlab_blog_categories` VALUES (1,'Uncategorized','uncategorized',NULL,NULL,NULL,1,2,0,'2017-03-25 08:57:53','2017-03-25 08:57:53');
/*!40000 ALTER TABLE `rainlab_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts`
--

DROP TABLE IF EXISTS `rainlab_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_html` longtext COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts`
--

LOCK TABLES `rainlab_blog_posts` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts` DISABLE KEYS */;
INSERT INTO `rainlab_blog_posts` VALUES (1,NULL,'First blog post','first-blog-post','The first ever blog post is here. It might be a good idea to update this post with some more relevant content.','This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*','<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>','2017-03-25 08:57:53',1,'2017-03-25 08:57:53','2017-03-25 08:57:53');
/*!40000 ALTER TABLE `rainlab_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts_categories`
--

LOCK TABLES `rainlab_blog_posts_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_forum_channels`
--

DROP TABLE IF EXISTS `rainlab_forum_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_forum_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `count_topics` int(11) NOT NULL DEFAULT '0',
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_moderated` tinyint(1) NOT NULL DEFAULT '0',
  `embed_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rainlab_forum_channels_slug_unique` (`slug`),
  KEY `rainlab_forum_channels_parent_id_index` (`parent_id`),
  KEY `rainlab_forum_channels_embed_code_index` (`embed_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_forum_channels`
--

LOCK TABLES `rainlab_forum_channels` WRITE;
/*!40000 ALTER TABLE `rainlab_forum_channels` DISABLE KEYS */;
INSERT INTO `rainlab_forum_channels` VALUES (1,NULL,'Channel Orange','channel-orange','A root level forum channel',1,12,0,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(2,1,'Autumn Leaves','autumn-leaves','Disccusion about the season of falling leaves.',2,9,1,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(3,2,'September','september','The start of the fall season.',3,4,2,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(4,2,'October','october','The middle of the fall season.',5,6,2,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(5,2,'November','november','The end of the fall season.',7,8,2,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(6,1,'Summer Breeze','summer-breeze','Disccusion about the wind at the ocean.',10,11,1,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(7,NULL,'Channel Green','channel-green','A root level forum channel',13,18,0,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(8,7,'Winter Snow','winter-snow','Disccusion about the frosty snow flakes.',14,15,1,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL),(9,7,'Spring Trees','spring-trees','Disccusion about the blooming gardens.',16,17,1,0,0,'2017-03-25 09:06:18','2017-03-25 09:06:18',0,0,NULL);
/*!40000 ALTER TABLE `rainlab_forum_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_forum_members`
--

DROP TABLE IF EXISTS `rainlab_forum_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_forum_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `count_topics` int(11) NOT NULL DEFAULT '0',
  `last_active_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_moderator` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_members_user_id_index` (`user_id`),
  KEY `rainlab_forum_members_count_posts_index` (`count_posts`),
  KEY `rainlab_forum_members_count_topics_index` (`count_topics`),
  KEY `rainlab_forum_members_last_active_at_index` (`last_active_at`),
  KEY `rainlab_forum_members_is_moderator_index` (`is_moderator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_forum_members`
--

LOCK TABLES `rainlab_forum_members` WRITE;
/*!40000 ALTER TABLE `rainlab_forum_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_forum_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_forum_posts`
--

DROP TABLE IF EXISTS `rainlab_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_forum_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `edit_user_id` int(11) DEFAULT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_forum_posts_topic_id_index` (`topic_id`),
  KEY `rainlab_forum_posts_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_forum_posts`
--

LOCK TABLES `rainlab_forum_posts` WRITE;
/*!40000 ALTER TABLE `rainlab_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_forum_topic_followers`
--

DROP TABLE IF EXISTS `rainlab_forum_topic_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_forum_topic_followers` (
  `topic_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_forum_topic_followers`
--

LOCK TABLES `rainlab_forum_topic_followers` WRITE;
/*!40000 ALTER TABLE `rainlab_forum_topic_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_forum_topic_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_forum_topics`
--

DROP TABLE IF EXISTS `rainlab_forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_forum_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `start_member_id` int(11) DEFAULT NULL,
  `last_post_id` int(11) DEFAULT NULL,
  `last_post_member_id` int(11) DEFAULT NULL,
  `last_post_at` datetime DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `count_posts` int(11) NOT NULL DEFAULT '0',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `embed_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rainlab_forum_topics_slug_unique` (`slug`),
  KEY `sticky_post_time` (`is_sticky`,`last_post_at`),
  KEY `rainlab_forum_topics_channel_id_index` (`channel_id`),
  KEY `rainlab_forum_topics_start_member_id_index` (`start_member_id`),
  KEY `rainlab_forum_topics_last_post_at_index` (`last_post_at`),
  KEY `rainlab_forum_topics_is_private_index` (`is_private`),
  KEY `rainlab_forum_topics_is_locked_index` (`is_locked`),
  KEY `rainlab_forum_topics_count_posts_index` (`count_posts`),
  KEY `rainlab_forum_topics_count_views_index` (`count_views`),
  KEY `rainlab_forum_topics_embed_code_index` (`embed_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_forum_topics`
--

LOCK TABLES `rainlab_forum_topics` WRITE;
/*!40000 ALTER TABLE `rainlab_forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_location_countries`
--

DROP TABLE IF EXISTS `rainlab_location_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_location_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_location_countries_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_location_countries`
--

LOCK TABLES `rainlab_location_countries` WRITE;
/*!40000 ALTER TABLE `rainlab_location_countries` DISABLE KEYS */;
INSERT INTO `rainlab_location_countries` VALUES (1,1,'Australia','AU',1),(2,1,'Canada','CA',1),(3,1,'United Kingdom','GB',1),(4,1,'United States','US',1),(5,0,'Afghanistan','AF',0),(6,0,'Aland Islands ','AX',0),(7,0,'Albania','AL',0),(8,0,'Algeria','DZ',0),(9,0,'American Samoa','AS',0),(10,0,'Andorra','AD',0),(11,0,'Angola','AO',0),(12,0,'Anguilla','AI',0),(13,0,'Antarctica','AQ',0),(14,0,'Antigua and Barbuda','AG',0),(15,0,'Argentina','AR',0),(16,0,'Armenia','AM',0),(17,0,'Aruba','AW',0),(18,0,'Austria','AT',0),(19,0,'Azerbaijan','AZ',0),(20,0,'Bahamas','BS',0),(21,0,'Bahrain','BH',0),(22,0,'Bangladesh','BD',0),(23,0,'Barbados','BB',0),(24,0,'Belarus','BY',0),(25,0,'Belgium','BE',0),(26,0,'Belize','BZ',0),(27,0,'Benin','BJ',0),(28,0,'Bermuda','BM',0),(29,0,'Bhutan','BT',0),(30,0,'Bolivia, Plurinational State of','BO',0),(31,0,'Bonaire, Sint Eustatius and Saba','BQ',0),(32,0,'Bosnia and Herzegovina','BA',0),(33,0,'Botswana','BW',0),(34,0,'Bouvet Island','BV',0),(35,0,'Brazil','BR',0),(36,0,'British Indian Ocean Territory','IO',0),(37,0,'Brunei Darussalam','BN',0),(38,0,'Bulgaria','BG',0),(39,0,'Burkina Faso','BF',0),(40,0,'Burundi','BI',0),(41,0,'Cambodia','KH',0),(42,0,'Cameroon','CM',0),(43,0,'Cape Verde','CV',0),(44,0,'Cayman Islands','KY',0),(45,0,'Central African Republic','CF',0),(46,0,'Chad','TD',0),(47,0,'Chile','CL',0),(48,0,'China','CN',0),(49,0,'Christmas Island','CX',0),(50,0,'Cocos (Keeling) Islands','CC',0),(51,0,'Colombia','CO',0),(52,0,'Comoros','KM',0),(53,0,'Congo','CG',0),(54,0,'Congo, the Democratic Republic of the','CD',0),(55,0,'Cook Islands','CK',0),(56,0,'Costa Rica','CR',0),(57,0,'Cote d\'Ivoire','CI',0),(58,0,'Croatia','HR',0),(59,0,'Cuba','CU',0),(60,0,'Curaçao','CW',0),(61,0,'Cyprus','CY',0),(62,0,'Czech Republic','CZ',0),(63,0,'Denmark','DK',0),(64,0,'Djibouti','DJ',0),(65,0,'Dominica','DM',0),(66,0,'Dominican Republic','DO',0),(67,0,'Ecuador','EC',0),(68,0,'Egypt','EG',0),(69,0,'El Salvador','SV',0),(70,0,'Equatorial Guinea','GQ',0),(71,0,'Eritrea','ER',0),(72,0,'Estonia','EE',0),(73,0,'Ethiopia','ET',0),(74,0,'Falkland Islands (Malvinas)','FK',0),(75,0,'Faroe Islands','FO',0),(76,0,'Finland','FI',0),(77,0,'Fiji','FJ',0),(78,1,'France','FR',0),(79,0,'French Guiana','GF',0),(80,0,'French Polynesia','PF',0),(81,0,'French Southern Territories','TF',0),(82,0,'Gabon','GA',0),(83,0,'Gambia','GM',0),(84,0,'Georgia','GE',0),(85,0,'Germany','DE',0),(86,0,'Ghana','GH',0),(87,0,'Gibraltar','GI',0),(88,0,'Greece','GR',0),(89,0,'Greenland','GL',0),(90,0,'Grenada','GD',0),(91,0,'Guadeloupe','GP',0),(92,0,'Guam','GU',0),(93,0,'Guatemala','GT',0),(94,0,'Guernsey','GG',0),(95,0,'Guinea','GN',0),(96,0,'Guinea-Bissau','GW',0),(97,0,'Guyana','GY',0),(98,0,'Haiti','HT',0),(99,0,'Heard Island and McDonald Islands','HM',0),(100,0,'Holy See (Vatican City State)','VA',0),(101,0,'Honduras','HN',0),(102,0,'Hong Kong','HK',0),(103,1,'Hungary','HU',0),(104,0,'Iceland','IS',0),(105,1,'India','IN',0),(106,0,'Indonesia','ID',0),(107,0,'Iran, Islamic Republic of','IR',0),(108,0,'Iraq','IQ',0),(109,1,'Ireland','IE',0),(110,0,'Isle of Man','IM',0),(111,0,'Israel','IL',0),(112,0,'Italy','IT',0),(113,0,'Jamaica','JM',0),(114,0,'Japan','JP',0),(115,0,'Jersey','JE',0),(116,0,'Jordan','JO',0),(117,0,'Kazakhstan','KZ',0),(118,0,'Kenya','KE',0),(119,0,'Kiribati','KI',0),(120,0,'Korea, Democratic People\'s Republic of','KP',0),(121,0,'Korea, Republic of','KR',0),(122,0,'Kuwait','KW',0),(123,0,'Kyrgyzstan','KG',0),(124,0,'Lao People\'s Democratic Republic','LA',0),(125,0,'Latvia','LV',0),(126,0,'Lebanon','LB',0),(127,0,'Lesotho','LS',0),(128,0,'Liberia','LR',0),(129,0,'Libyan Arab Jamahiriya','LY',0),(130,0,'Liechtenstein','LI',0),(131,0,'Lithuania','LT',0),(132,0,'Luxembourg','LU',0),(133,0,'Macao','MO',0),(134,0,'Macedonia','MK',0),(135,0,'Madagascar','MG',0),(136,0,'Malawi','MW',0),(137,0,'Malaysia','MY',0),(138,0,'Maldives','MV',0),(139,0,'Mali','ML',0),(140,0,'Malta','MT',0),(141,0,'Marshall Islands','MH',0),(142,0,'Martinique','MQ',0),(143,0,'Mauritania','MR',0),(144,0,'Mauritius','MU',0),(145,0,'Mayotte','YT',0),(146,0,'Mexico','MX',0),(147,0,'Micronesia, Federated States of','FM',0),(148,0,'Moldova, Republic of','MD',0),(149,0,'Monaco','MC',0),(150,0,'Mongolia','MN',0),(151,0,'Montenegro','ME',0),(152,0,'Montserrat','MS',0),(153,0,'Morocco','MA',0),(154,0,'Mozambique','MZ',0),(155,0,'Myanmar','MM',0),(156,0,'Namibia','NA',0),(157,0,'Nauru','NR',0),(158,0,'Nepal','NP',0),(159,1,'Netherlands','NL',0),(160,0,'New Caledonia','NC',0),(161,1,'New Zealand','NZ',0),(162,0,'Nicaragua','NI',0),(163,0,'Niger','NE',0),(164,0,'Nigeria','NG',0),(165,0,'Niue','NU',0),(166,0,'Norfolk Island','NF',0),(167,0,'Northern Mariana Islands','MP',0),(168,0,'Norway','NO',0),(169,0,'Oman','OM',0),(170,0,'Pakistan','PK',0),(171,0,'Palau','PW',0),(172,0,'Palestine','PS',0),(173,0,'Panama','PA',0),(174,0,'Papua New Guinea','PG',0),(175,0,'Paraguay','PY',0),(176,0,'Peru','PE',0),(177,0,'Philippines','PH',0),(178,0,'Pitcairn','PN',0),(179,0,'Poland','PL',0),(180,0,'Portugal','PT',0),(181,0,'Puerto Rico','PR',0),(182,0,'Qatar','QA',0),(183,0,'Reunion','RE',0),(184,1,'Romania','RO',0),(185,0,'Russian Federation','RU',0),(186,0,'Rwanda','RW',0),(187,0,'Saint Barthélemy','BL',0),(188,0,'Saint Helena','SH',0),(189,0,'Saint Kitts and Nevis','KN',0),(190,0,'Saint Lucia','LC',0),(191,0,'Saint Martin (French part)','MF',0),(192,0,'Saint Pierre and Miquelon','PM',0),(193,0,'Saint Vincent and the Grenadines','VC',0),(194,0,'Samoa','WS',0),(195,0,'San Marino','SM',0),(196,0,'Sao Tome and Principe','ST',0),(197,0,'Saudi Arabia','SA',0),(198,0,'Senegal','SN',0),(199,0,'Serbia','RS',0),(200,0,'Seychelles','SC',0),(201,0,'Sierra Leone','SL',0),(202,0,'Singapore','SG',0),(203,0,'Sint Maarten (Dutch part)','SX',0),(204,0,'Slovakia','SK',0),(205,0,'Slovenia','SI',0),(206,0,'Solomon Islands','SB',0),(207,0,'Somalia','SO',0),(208,0,'South Africa','ZA',0),(209,0,'South Georgia and the South Sandwich Islands','GS',0),(210,1,'Spain','ES',1),(211,0,'Sri Lanka','LK',0),(212,0,'Sudan','SD',0),(213,0,'Suriname','SR',0),(214,0,'Svalbard and Jan Mayen','SJ',0),(215,0,'Swaziland','SZ',0),(216,0,'Sweden','SE',0),(217,0,'Switzerland','CH',0),(218,0,'Syrian Arab Republic','SY',0),(219,0,'Taiwan, Province of China','TW',0),(220,0,'Tajikistan','TJ',0),(221,0,'Tanzania, United Republic of','TZ',0),(222,0,'Thailand','TH',0),(223,0,'Timor-Leste','TL',0),(224,0,'Togo','TG',0),(225,0,'Tokelau','TK',0),(226,0,'Tonga','TO',0),(227,0,'Trinidad and Tobago','TT',0),(228,0,'Tunisia','TN',0),(229,0,'Turkey','TR',0),(230,0,'Turkmenistan','TM',0),(231,0,'Turks and Caicos Islands','TC',0),(232,0,'Tuvalu','TV',0),(233,0,'Uganda','UG',0),(234,0,'Ukraine','UA',0),(235,0,'United Arab Emirates','AE',0),(236,0,'United States Minor Outlying Islands','UM',0),(237,0,'Uruguay','UY',0),(238,0,'Uzbekistan','UZ',0),(239,0,'Vanuatu','VU',0),(240,0,'Venezuela, Bolivarian Republic of','VE',0),(241,0,'Viet Nam','VN',0),(242,0,'Virgin Islands, British','VG',0),(243,0,'Virgin Islands, U.S.','VI',0),(244,0,'Wallis and Futuna','WF',0),(245,0,'Western Sahara','EH',0),(246,0,'Yemen','YE',0),(247,0,'Zambia','ZM',0),(248,0,'Zimbabwe','ZW',0);
/*!40000 ALTER TABLE `rainlab_location_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_location_states`
--

DROP TABLE IF EXISTS `rainlab_location_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_location_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_location_states_country_id_index` (`country_id`),
  KEY `rainlab_location_states_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_location_states`
--

LOCK TABLES `rainlab_location_states` WRITE;
/*!40000 ALTER TABLE `rainlab_location_states` DISABLE KEYS */;
INSERT INTO `rainlab_location_states` VALUES (1,4,'Alabama','AL'),(2,4,'Alaska','AK'),(3,4,'American Samoa','AS'),(4,4,'Arizona','AZ'),(5,4,'Arkansas','AR'),(6,4,'California','CA'),(7,4,'Colorado','CO'),(8,4,'Connecticut','CT'),(9,4,'Delaware','DE'),(10,4,'Dist. of Columbia','DC'),(11,4,'Florida','FL'),(12,4,'Georgia','GA'),(13,4,'Guam','GU'),(14,4,'Hawaii','HI'),(15,4,'Idaho','ID'),(16,4,'Illinois','IL'),(17,4,'Indiana','IN'),(18,4,'Iowa','IA'),(19,4,'Kansas','KS'),(20,4,'Kentucky','KY'),(21,4,'Louisiana','LA'),(22,4,'Maine','ME'),(23,4,'Maryland','MD'),(24,4,'Marshall Islands','MH'),(25,4,'Massachusetts','MA'),(26,4,'Michigan','MI'),(27,4,'Micronesia','FM'),(28,4,'Minnesota','MN'),(29,4,'Mississippi','MS'),(30,4,'Missouri','MO'),(31,4,'Montana','MT'),(32,4,'Nebraska','NE'),(33,4,'Nevada','NV'),(34,4,'New Hampshire','NH'),(35,4,'New Jersey','NJ'),(36,4,'New Mexico','NM'),(37,4,'New York','NY'),(38,4,'North Carolina','NC'),(39,4,'North Dakota','ND'),(40,4,'Northern Marianas','MP'),(41,4,'Ohio','OH'),(42,4,'Oklahoma','OK'),(43,4,'Oregon','OR'),(44,4,'Palau','PW'),(45,4,'Pennsylvania','PA'),(46,4,'Puerto Rico','PR'),(47,4,'Rhode Island','RI'),(48,4,'South Carolina','SC'),(49,4,'South Dakota','SD'),(50,4,'Tennessee','TN'),(51,4,'Texas','TX'),(52,4,'Utah','UT'),(53,4,'Vermont','VT'),(54,4,'Virginia','VA'),(55,4,'Virgin Islands','VI'),(56,4,'Washington','WA'),(57,4,'West Virginia','WV'),(58,4,'Wisconsin','WI'),(59,4,'Wyoming','WY'),(60,35,'Acre','AC'),(61,35,'Alagoas','AL'),(62,35,'Amapá','AP'),(63,35,'Amazonas','AM'),(64,35,'Bahia','BA'),(65,35,'Ceará','CE'),(66,35,'Distrito Federal','DF'),(67,35,'Espírito Santo','ES'),(68,35,'Goiás','GO'),(69,35,'Maranhão','MA'),(70,35,'Mato Grosso','MT'),(71,35,'Mato Grosso do Sul','MS'),(72,35,'Minas Gerais','MG'),(73,35,'Pará','PA'),(74,35,'Paraíba','PB'),(75,35,'Paraná','PR'),(76,35,'Pernambuco','PE'),(77,35,'Piauí','PI'),(78,35,'Rio de Janeiro','RJ'),(79,35,'Rio Grande do Norte','RN'),(80,35,'Rio Grande do Sul','RS'),(81,35,'Rondônia','RO'),(82,35,'Roraima','RR'),(83,35,'Santa Catarina','SC'),(84,35,'São Paulo','SP'),(85,35,'Sergipe','SE'),(86,35,'Tocantins','TO'),(87,2,'Alberta','AB'),(88,2,'British Columbia','BC'),(89,2,'Manitoba','MB'),(90,2,'New Brunswick','NB'),(91,2,'Newfoundland and Labrador','NL'),(92,2,'Northwest Territories','NT'),(93,2,'Nova Scotia','NS'),(94,2,'Nunavut','NU'),(95,2,'Ontario','ON'),(96,2,'Prince Edward Island','PE'),(97,2,'Quebec','QC'),(98,2,'Saskatchewan','SK'),(99,2,'Yukon','YT'),(100,1,'New South Wales','NSW'),(101,1,'Queensland','QLD'),(102,1,'South Australia','SA'),(103,1,'Tasmania','TAS'),(104,1,'Victoria','VIC'),(105,1,'Western Australia','WA'),(106,1,'Northern Territory','NT'),(107,1,'Australian Capital Territory','ACT'),(108,85,'Baden-Württemberg','BW'),(109,85,'Bavaria','BY'),(110,85,'Berlin','BE'),(111,85,'Brandenburg','BB'),(112,85,'Bremen','HB'),(113,85,'Hamburg','HH'),(114,85,'Hesse','HE'),(115,85,'Mecklenburg-Vorpommern','MV'),(116,85,'Lower Saxony','NI'),(117,85,'North Rhine-Westphalia','NW'),(118,85,'Rhineland-Palatinate','RP'),(119,85,'Saarland','SL'),(120,85,'Saxony','SN'),(121,85,'Saxony-Anhalt','ST'),(122,85,'Schleswig-Holstein','SH'),(123,85,'Thuringia','TH'),(124,72,'Harju','HA'),(125,72,'Hiiu','HI'),(126,72,'Ida-Viru','IV'),(127,72,'Jõgeva','JR'),(128,72,'Järva','JN'),(129,72,'Lääne','LN'),(130,72,'Lääne-Viru','LV'),(131,72,'Põlva','PL'),(132,72,'Pärnu','PR'),(133,72,'Rapla','RA'),(134,72,'Saare','SA'),(135,72,'Tartu','TA'),(136,72,'Valga','VG'),(137,72,'Viljandi','VD'),(138,72,'Võru','VR'),(139,109,'Dublin','D'),(140,109,'Wicklow','WW'),(141,109,'Wexford','WX'),(142,109,'Carlow','CW'),(143,109,'Kildare','KE'),(144,109,'Meath','MH'),(145,109,'Louth','LH'),(146,109,'Monaghan','MN'),(147,109,'Cavan','CN'),(148,109,'Longford','LD'),(149,109,'Westmeath','WH'),(150,109,'Offaly','OY'),(151,109,'Laois','LS'),(152,109,'Kilkenny','KK'),(153,109,'Waterford','WD'),(154,109,'Cork','C'),(155,109,'Kerry','KY'),(156,109,'Limerick','LK'),(157,109,'North Tipperary','TN'),(158,109,'South Tipperary','TS'),(159,109,'Clare','CE'),(160,109,'Galway','G'),(161,109,'Mayo','MO'),(162,109,'Roscommon','RN'),(163,109,'Sligo','SO'),(164,109,'Leitrim','LM'),(165,109,'Donegal','DL'),(166,159,'Drenthe','DR'),(167,159,'Flevoland','FL'),(168,159,'Friesland','FR'),(169,159,'Gelderland','GE'),(170,159,'Groningen','GR'),(171,159,'Limburg','LI'),(172,159,'Noord-Brabant','NB'),(173,159,'Noord-Holland','NH'),(174,159,'Overijssel','OV'),(175,159,'Utrecht','UT'),(176,159,'Zeeland','ZE'),(177,159,'Zuid-Holland','ZH'),(178,3,'Aberdeenshire','ABE'),(179,3,'Anglesey','ALY'),(180,3,'Angus','ANG'),(181,3,'Argyll','ARG'),(182,3,'Ayrshire','AYR'),(183,3,'Banffshire','BAN'),(184,3,'Bedfordshire','BED'),(185,3,'Berkshire','BER'),(186,3,'Berwickshire','BWS'),(187,3,'Brecknockshire','BRE'),(188,3,'Buckinghamshire','BUC'),(189,3,'Bute','BUT'),(190,3,'Caernarfonshire','CAE'),(191,3,'Caithness','CAI'),(192,3,'Cambridgeshire','CAM'),(193,3,'Cardiganshire','CAR'),(194,3,'Carmarthenshire','CMS'),(195,3,'Cheshire','CHE'),(196,3,'Clackmannanshire','CLA'),(197,3,'Cleveland','CLE'),(198,3,'Cornwall','COR'),(199,3,'Cromartyshire','CRO'),(200,3,'Cumberland','CBR'),(201,3,'Cumbria','CUM'),(202,3,'Denbighshire','DEN'),(203,3,'Derbyshire','DER'),(204,3,'Devon','DEV'),(205,3,'Dorset','DOR'),(206,3,'Dumbartonshire','DBS'),(207,3,'Dumfriesshire','DUM'),(208,3,'Durham','DUR'),(209,3,'East Lothian','ELO'),(210,3,'Essex','ESS'),(211,3,'Flintshire','FLI'),(212,3,'Fife','FIF'),(213,3,'Glamorgan','GLA'),(214,3,'Gloucestershire','GLO'),(215,3,'Hampshire','HAM'),(216,3,'Herefordshire','HER'),(217,3,'Hertfordshire','HTF'),(218,3,'Huntingdonshire','HUN'),(219,3,'Inverness','INV'),(220,3,'Kent','KEN'),(221,3,'Kincardineshire','KCD'),(222,3,'Kinross-shire','KIN'),(223,3,'Kirkcudbrightshire','KIR'),(224,3,'Lanarkshire','LKS'),(225,3,'Lancashire','LAN'),(226,3,'Leicestershire','LEI'),(227,3,'Lincolnshire','LIN'),(228,3,'London','LON'),(229,3,'Manchester','MAN'),(230,3,'Merionethshire','MER'),(231,3,'Merseyside','MSY'),(232,3,'Middlesex','MDX'),(233,3,'Midlands','MID'),(234,3,'Midlothian','MLT'),(235,3,'Monmouthshire','MON'),(236,3,'Montgomeryshire','MGY'),(237,3,'Moray','MOR'),(238,3,'Nairnshire','NAI'),(239,3,'Norfolk','NOR'),(240,3,'Northamptonshire','NMP'),(241,3,'Northumberland','NUM'),(242,3,'Nottinghamshire','NOT'),(243,3,'Orkney','ORK'),(244,3,'Oxfordshire','OXF'),(245,3,'Peebleshire','PEE'),(246,3,'Pembrokeshire','PEM'),(247,3,'Perthshire','PER'),(248,3,'Radnorshire','RAD'),(249,3,'Renfrewshire','REN'),(250,3,'Ross & Cromarty','ROS'),(251,3,'Roxburghshire','ROX'),(252,3,'Rutland','RUT'),(253,3,'Selkirkshire','SEL'),(254,3,'Shetland','SHE'),(255,3,'Shropshire','SHR'),(256,3,'Somerset','SOM'),(257,3,'Staffordshire','STA'),(258,3,'Stirlingshire','STI'),(259,3,'Suffolk','SUF'),(260,3,'Surrey','SUR'),(261,3,'Sussex','SUS'),(262,3,'Sutherland','SUT'),(263,3,'Tyne & Wear','TYN'),(264,3,'Warwickshire','WAR'),(265,3,'West Lothian','WLO'),(266,3,'Westmorland','WES'),(267,3,'Wigtownshire','WIG'),(268,3,'Wiltshire','WIL'),(269,3,'Worcestershire','WOR'),(270,3,'Yorkshire','YOR'),(271,184,'Alba','AB'),(272,184,'Arad','AR'),(273,184,'Arges','AG'),(274,184,'Bacău','BC'),(275,184,'Bihor','BH'),(276,184,'Bistrita - Nasaud Bistrita','BN'),(277,184,'Botosani','BT'),(278,184,'Brasov','BV'),(279,184,'Braila','BR'),(280,184,'Bucuresti','B'),(281,184,'Buzau','BZ'),(282,184,'Caras - Severin','CS'),(283,184,'Calarasi','CL'),(284,184,'Cluj','CJ'),(285,184,'Constanta','CT'),(286,184,'Covasna Sfantu Gheorghe','CV'),(287,184,'Dambovita','DB'),(288,184,'Dolj','DJ'),(289,184,'Galati','GL'),(290,184,'Giurgiu','GR'),(291,184,'Gorj','GJ'),(292,184,'Harghita','HR'),(293,184,'Hunedoara','HD'),(294,184,'Ialomita','IL'),(295,184,'Iasi','IS'),(296,184,'Ilfov','IF'),(297,184,'Maramures','MM'),(298,184,'Mehedinti','MH'),(299,184,'Mures','MS'),(300,184,'Neamt','NT'),(301,184,'Olt','OT'),(302,184,'Prahova Ploiesti','PH'),(303,184,'Satu Mare','SM'),(304,184,'Salaj','SJ'),(305,184,'Sibiu','SB'),(306,184,'Suceava','SV'),(307,184,'Teleorman','TR'),(308,184,'Timis','TM'),(309,184,'Tulcea','TL'),(310,184,'Vaslui','VS'),(311,184,'Valcea','VL'),(312,184,'Vrancea','VN'),(313,103,'Budapest','BUD'),(314,103,'Baranya','BAR'),(315,103,'Bács-Kiskun','BKM'),(316,103,'Békés','BEK'),(317,103,'Borsod-Abaúj-Zemplén','BAZ'),(318,103,'Csongrád','CSO'),(319,103,'Fejér','FEJ'),(320,103,'Győr-Moson-Sopron','GMS'),(321,103,'Hajdú-Bihar','HBM'),(322,103,'Heves','HEV'),(323,103,'Jász-Nagykun-Szolnok','JNS'),(324,103,'Komárom-Esztergom','KEM'),(325,103,'Nógrád','NOG'),(326,103,'Pest','PES'),(327,103,'Somogy','SOM'),(328,103,'Szabolcs-Szatmár-Bereg','SSB'),(329,103,'Tolna','TOL'),(330,103,'Vas','VAS'),(331,103,'Veszprém','VES'),(332,103,'Zala','ZAL'),(333,105,'Andhra Pradesh','AP'),(334,105,'Arunachal Pradesh','AR'),(335,105,'Assam','AS'),(336,105,'Bihar','BR'),(337,105,'Chhattisgarh','CT'),(338,105,'Goa','GA'),(339,105,'Gujarat','GJ'),(340,105,'Haryana','HR'),(341,105,'Himachal Pradesh','HP'),(342,105,'Jammu and Kashmir','JK'),(343,105,'Jharkhand','JH'),(344,105,'Karnataka','KA'),(345,105,'Kerala','KL'),(346,105,'Madhya Pradesh','MP'),(347,105,'Maharashtra','MH'),(348,105,'Manipur','MN'),(349,105,'Meghalaya','ML'),(350,105,'Mizoram','MZ'),(351,105,'Nagaland','NL'),(352,105,'Odisha','OR'),(353,105,'Punjab','PB'),(354,105,'Rajasthan','RJ'),(355,105,'Sikkim','SK'),(356,105,'Tamil Nadu','TN'),(357,105,'Telangana','TG'),(358,105,'Tripura','TR'),(359,105,'Uttarakhand','UT'),(360,105,'Uttar Pradesh','UP'),(361,105,'West Bengal','WB'),(362,105,'Andaman and Nicobar Islands','AN'),(363,105,'Chandigarh','CH'),(364,105,'Dadra and Nagar Haveli','DN'),(365,105,'Daman and Diu','DD'),(366,105,'Delhi','DL'),(367,105,'Lakshadweep','LD'),(368,105,'Puducherry','PY'),(369,78,'Auvergne-Rhône-Alpes','ARA'),(370,78,'Bourgogne-Franche-Comté','BFC'),(371,78,'Bretagne','BZH'),(372,78,'Centre–Val-de-Loire','CVL'),(373,78,'Corse','COR'),(374,78,'Guadeloupe','GP'),(375,78,'Guyane','GF'),(376,78,'Grand-Est','GE'),(377,78,'Hauts-de-France','HF'),(378,78,'Île-de-France','IDF'),(379,78,'Martinique','MQ'),(380,78,'Mayotte','YT'),(381,78,'Normandie','NOR'),(382,78,'Pays-de-la-Loire','PL'),(383,78,'Nouvelle-Aquitaine','NA'),(384,78,'Occitanie','OCC'),(385,78,'Provence-Alpes-Côte-d\'Azur','PACA'),(386,78,'Réunion','RE'),(387,161,'Northland','NTL'),(388,161,'Auckland','AUK'),(389,161,'Waikato','WKO'),(390,161,'Bay of Plenty','BOP'),(391,161,'Gisborne','GIS'),(392,161,'Hawke\'s Bay','HKB'),(393,161,'Taranaki','TKI'),(394,161,'Manawatu-Wanganui','MWT'),(395,161,'Wellington','WGN'),(396,161,'Tasman','TAS'),(397,161,'Nelson','NSN'),(398,161,'Marlborough','MBH'),(399,161,'West Coast','WTC'),(400,161,'Canterbury','CAN'),(401,161,'Otago Otago','OTA'),(402,161,'Southland','STL'),(403,210,'La Coru&ntilde;a','CA'),(404,210,'&Aacute;lava','AL'),(405,210,'Albacete','AB'),(406,210,'Alicante','AC'),(407,210,'Almeria','AM'),(408,210,'Asturias','AS'),(409,210,'&Aacute;vila','AV'),(410,210,'Badajoz','BJ'),(411,210,'Baleares','IB'),(412,210,'Barcelona','BA'),(413,210,'Burgos','BU'),(414,210,'C&aacute;ceres','CC'),(415,210,'C&aacute;diz','CZ'),(416,210,'Cantabria','CT'),(417,210,'Castell&oacute;n','CL'),(418,210,'Ceuta','CE'),(419,210,'Ciudad Real','CR'),(420,210,'C&oacute;rdoba','CD'),(421,210,'Cuenca','CU'),(422,210,'Girona','GI'),(423,210,'Granada','GD'),(424,210,'Guadalajara','GJ'),(425,210,'Guip&uacute;zcoa','GP'),(426,210,'Huelva','HL'),(427,210,'Huesca','HS'),(428,210,'Ja&eacute;n','JN'),(429,210,'La Rioja','RJ'),(430,210,'Las Palmas','PM'),(431,210,'Leon','LE'),(432,210,'Lleida','LL'),(433,210,'Lugo','LG'),(434,210,'Madrid','MD'),(435,210,'Malaga','MA'),(436,210,'Melilla','ML'),(437,210,'Murcia','MU'),(438,210,'Navarra','NV'),(439,210,'Ourense','OU'),(440,210,'Palencia','PL'),(441,210,'Pontevedra','PO'),(442,210,'Salamanca','SL'),(443,210,'Santa Cruz de Tenerife','SC'),(444,210,'Segovia','SG'),(445,210,'Sevilla','SV'),(446,210,'Soria','SO'),(447,210,'Tarragona','TA'),(448,210,'Teruel','TE'),(449,210,'Toledo','TO'),(450,210,'Valencia','VC'),(451,210,'Valladolid','VD'),(452,210,'Vizcaya','VZ'),(453,210,'Zamora','ZM'),(454,210,'Zaragoza','ZR');
/*!40000 ALTER TABLE `rainlab_location_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_attributes`
--

DROP TABLE IF EXISTS `rainlab_translate_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_attributes`
--

LOCK TABLES `rainlab_translate_attributes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_attributes` DISABLE KEYS */;
INSERT INTO `rainlab_translate_attributes` VALUES (1,'en','2','Istheweb\\Shop\\Models\\Category','{\"name\":\"\",\"slug\":\"\",\"description\":\"\"}'),(2,'en','3','Istheweb\\Shop\\Models\\Category','{\"name\":\"\",\"slug\":\"\",\"description\":\"\"}'),(3,'en','1','Istheweb\\Shop\\Models\\ShippingMethod','{\"name\":\"\",\"description\":\"\"}'),(4,'en','2','Istheweb\\Shop\\Models\\ShippingMethod','{\"name\":\"\",\"description\":\"\"}');
/*!40000 ALTER TABLE `rainlab_translate_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_indexes`
--

DROP TABLE IF EXISTS `rainlab_translate_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_indexes`
--

LOCK TABLES `rainlab_translate_indexes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_locales`
--

DROP TABLE IF EXISTS `rainlab_translate_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_locales_code_index` (`code`),
  KEY `rainlab_translate_locales_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_locales`
--

LOCK TABLES `rainlab_translate_locales` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_locales` DISABLE KEYS */;
INSERT INTO `rainlab_translate_locales` VALUES (1,'en','English',0,1),(2,'es','Español',1,1);
/*!40000 ALTER TABLE `rainlab_translate_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_messages`
--

DROP TABLE IF EXISTS `rainlab_translate_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_messages_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_messages`
--

LOCK TABLES `rainlab_translate_messages` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_user_mail_blockers`
--

DROP TABLE IF EXISTS `rainlab_user_mail_blockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_user_mail_blockers`
--

LOCK TABLES `rainlab_user_mail_blockers` WRITE;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_user_mail_blockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','exception \'ErrorException\' with message \'Trying to get property of non-object\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:172\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(172): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'/var/www/public...\', 172, Array)\n#1 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(110): istheweb\\shop\\behaviors\\OrderModel->getShippingMethod()\n#2 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(82): istheweb\\shop\\behaviors\\OrderModel->addAdjustment()\n#3 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(119): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#4 [internal function]: istheweb\\shop\\behaviors\\OrderModel->addAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#5 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#6 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'addAdjustment\', Array)\n#7 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(109): October\\Rain\\Database\\Model->__call(\'addAdjustment\', Array)\n#8 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(109): Istheweb\\Shop\\Models\\Order->addAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(74): istheweb\\shop\\behaviors\\OrderItemModel->addAdjustment()\n#10 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#11 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#12 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#15 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#16 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#17 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#23 /var/www/public/modules/backend/behaviors/RelationController.php(1021): October\\Rain\\Database\\Model->save(NULL, \'OTIBM3cZCFnvOB4...\')\n#24 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageCreate(\'1\')\n#25 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#26 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#27 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#28 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageCreate(\'1\')\n#29 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#30 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#31 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#32 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#33 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#35 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#37 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#71 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#75 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#76 {main}',NULL,'2017-04-09 07:23:52','2017-04-09 07:23:52'),(2,'error','exception \'ErrorException\' with message \'Undefined variable: method\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:166\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(166): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined varia...\', \'/var/www/public...\', 166, Array)\n#1 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(110): istheweb\\shop\\behaviors\\OrderModel->getShippingMethod()\n#2 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(82): istheweb\\shop\\behaviors\\OrderModel->addAdjustment()\n#3 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(135): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#4 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#5 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#6 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#7 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#8 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#10 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#11 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#12 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#15 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#16 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#17 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#23 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'V6oORRCVPAqTrk8...\')\n#24 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#25 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#26 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#27 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#28 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#29 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#30 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#31 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#32 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#33 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#35 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#37 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#71 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#75 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#76 {main}',NULL,'2017-04-09 08:07:44','2017-04-09 08:07:44'),(3,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Maximum execution time of 30 seconds exceeded\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php:514\nStack trace:\n#0 {main}',NULL,'2017-04-09 08:09:23','2017-04-09 08:09:23'),(4,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Maximum execution time of 30 seconds exceeded\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Support/Arr.php:186\nStack trace:\n#0 {main}',NULL,'2017-04-09 08:16:06','2017-04-09 08:16:06'),(5,'info','Warning: List column type \"relation\" for class \"Istheweb\\Shop\\Models\\ShippingMethod\" is not valid.',NULL,'2017-04-09 09:53:54','2017-04-09 09:53:54'),(6,'info','Warning: List column type \"relation\" for class \"Istheweb\\Shop\\Models\\ShippingMethod\" is not valid.',NULL,'2017-04-09 09:53:54','2017-04-09 09:53:54'),(7,'error','exception \'ErrorException\' with message \'Object of class October\\Rain\\Database\\Builder could not be converted to int\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:177\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(177): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Object of class...\', \'/var/www/public...\', 177, Array)\n#1 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(67): istheweb\\shop\\behaviors\\OrderModel->formatAdjustemnt(Object(October\\Rain\\Database\\Builder))\n#2 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(90): istheweb\\shop\\behaviors\\OrderModel->updateTotals()\n#3 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(137): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#4 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#5 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#6 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#7 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#8 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#10 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#11 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#12 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#15 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#16 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#17 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#23 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'G3R3k7PlAmHVE6N...\')\n#24 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#25 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#26 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#27 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#28 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#29 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#30 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#31 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#32 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#33 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#35 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#37 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#71 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#75 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#76 {main}',NULL,'2017-04-09 09:58:50','2017-04-09 09:58:50'),(8,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'syntax error, unexpected \'$this\' (T_VARIABLE)\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:84\nStack trace:\n#0 {main}',NULL,'2017-04-09 10:08:41','2017-04-09 10:08:41'),(9,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Call to a member function count() on null\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:84\nStack trace:\n#0 {main}',NULL,'2017-04-09 10:14:28','2017-04-09 10:14:28'),(10,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'syntax error, unexpected \';\'\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:84\nStack trace:\n#0 {main}',NULL,'2017-04-09 10:15:04','2017-04-09 10:15:04'),(11,'error','exception \'BadMethodCallException\' with message \'Call to undefined method October\\Rain\\Database\\QueryBuilder::shipment_items()\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php:2123\nStack trace:\n#0 [internal function]: Illuminate\\Database\\Query\\Builder->__call(\'shipment_items\', Array)\n#1 [internal function]: October\\Rain\\Database\\QueryBuilder->shipment_items()\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1015): call_user_func_array(Array, Array)\n#3 /var/www/public/vendor/october/rain/src/Database/Builder.php(188): Illuminate\\Database\\Eloquent\\Builder->__call(\'shipment_items\', Array)\n#4 [internal function]: October\\Rain\\Database\\Builder->__call(\'shipment_items\', Array)\n#5 [internal function]: October\\Rain\\Database\\Builder->shipment_items()\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3444): call_user_func_array(Array, Array)\n#7 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(383): Illuminate\\Database\\Eloquent\\Model->__call(\'shipment_items\', Array)\n#8 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'shipment_items\', Array)\n#9 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(545): October\\Rain\\Database\\Model->__call(\'shipment_items\', Array)\n#10 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(545): Istheweb\\Shop\\Models\\Shipment->shipment_items()\n#11 [internal function]: Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}()\n#12 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Relations/Relation.php(171): call_user_func(Object(Closure))\n#13 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(546): Illuminate\\Database\\Eloquent\\Relations\\Relation::noConstraints(Object(Closure))\n#14 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(517): Illuminate\\Database\\Eloquent\\Builder->getRelation(\'shipment_items\')\n#15 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(497): Illuminate\\Database\\Eloquent\\Builder->loadRelation(Array, \'shipment_items\', Object(Closure))\n#16 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(240): Illuminate\\Database\\Eloquent\\Builder->eagerLoadRelations(Array)\n#17 /var/www/public/plugins/istheweb/shop/models/Shipment.php(117): Illuminate\\Database\\Eloquent\\Builder->get()\n#18 [internal function]: Istheweb\\Shop\\Models\\Shipment->scopeShipmentWithItems(Object(October\\Rain\\Database\\Builder))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(901): call_user_func_array(Array, Array)\n#20 /var/www/public/vendor/october/rain/src/Database/Builder.php(185): Illuminate\\Database\\Eloquent\\Builder->callScope(\'scopeShipmentWi...\', Array)\n#21 [internal function]: October\\Rain\\Database\\Builder->__call(\'shipmentWithIte...\', Array)\n#22 [internal function]: October\\Rain\\Database\\Builder->shipmentWithItems()\n#23 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3444): call_user_func_array(Array, Array)\n#24 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(383): Illuminate\\Database\\Eloquent\\Model->__call(\'shipmentWithIte...\', Array)\n#25 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'shipmentWithIte...\', Array)\n#26 [internal function]: October\\Rain\\Database\\Model->__call(\'shipmentWithIte...\', Array)\n#27 [internal function]: Istheweb\\Shop\\Models\\Shipment->shipmentWithItems()\n#28 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3458): call_user_func_array(Array, Array)\n#29 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(85): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'shipmentWithIte...\', Array)\n#30 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(85): Istheweb\\Shop\\Models\\Shipment::shipmentWithItems()\n#31 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(140): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#32 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#33 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#34 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#35 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#36 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#37 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#38 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#39 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#40 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#41 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#42 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#43 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#44 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#49 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#50 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#51 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'ipCIkfpNOdi5lCr...\')\n#52 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#53 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#54 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#55 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#56 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#57 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#58 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#59 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#60 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#61 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#65 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#67 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#74 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#76 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#79 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#81 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#82 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#83 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#84 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#85 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#86 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#87 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#88 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#89 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#90 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#91 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#92 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#93 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#94 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#95 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#96 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#97 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#98 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#99 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#100 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#101 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#102 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#103 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#104 {main}',NULL,'2017-04-09 10:37:25','2017-04-09 10:37:25'),(12,'error','exception \'ErrorException\' with message \'Undefined property: October\\Rain\\Database\\Collection::$shipping_items\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:86\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(86): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/var/www/public...\', 86, Array)\n#1 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(140): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#2 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#3 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#4 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#5 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#6 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#7 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#8 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#9 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#10 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#11 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#12 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#13 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#14 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#15 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#16 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#17 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#19 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#20 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#21 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'bjUkXGDfRhhcAdQ...\')\n#22 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#23 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#24 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#25 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#26 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#27 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#28 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#29 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#30 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#31 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#32 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#33 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#35 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#69 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#73 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#74 {main}',NULL,'2017-04-09 10:41:04','2017-04-09 10:41:04'),(13,'error','exception \'ErrorException\' with message \'Object of class October\\Rain\\Database\\Builder could not be converted to int\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:179\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(179): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Object of class...\', \'/var/www/public...\', 179, Array)\n#1 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(67): istheweb\\shop\\behaviors\\OrderModel->formatAdjustemnt(Object(October\\Rain\\Database\\Builder))\n#2 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(91): istheweb\\shop\\behaviors\\OrderModel->updateTotals()\n#3 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(139): istheweb\\shop\\behaviors\\OrderModel->checkAdjustments()\n#4 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#5 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#6 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#7 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#8 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#10 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#11 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#12 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#15 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#16 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#17 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#23 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'rB1AFfvwragAMQ3...\')\n#24 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#25 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#26 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#27 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#28 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#29 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#30 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#31 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#32 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#33 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#35 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#37 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#71 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#75 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#76 {main}',NULL,'2017-04-09 10:49:25','2017-04-09 10:49:25'),(14,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'syntax error, unexpected \'}\'\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php:146\nStack trace:\n#0 {main}',NULL,'2017-04-09 15:04:15','2017-04-09 15:04:15'),(15,'error','exception \'BadMethodCallException\' with message \'Call to undefined method October\\Rain\\Database\\QueryBuilder::getTaxRate()\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php:2123\nStack trace:\n#0 [internal function]: Illuminate\\Database\\Query\\Builder->__call(\'getTaxRate\', Array)\n#1 [internal function]: October\\Rain\\Database\\QueryBuilder->getTaxRate()\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1015): call_user_func_array(Array, Array)\n#3 /var/www/public/vendor/october/rain/src/Database/Builder.php(188): Illuminate\\Database\\Eloquent\\Builder->__call(\'getTaxRate\', Array)\n#4 [internal function]: October\\Rain\\Database\\Builder->__call(\'getTaxRate\', Array)\n#5 [internal function]: October\\Rain\\Database\\Builder->getTaxRate()\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3444): call_user_func_array(Array, Array)\n#7 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(383): Illuminate\\Database\\Eloquent\\Model->__call(\'getTaxRate\', Array)\n#8 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'getTaxRate\', Array)\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(145): October\\Rain\\Database\\Model->__call(\'getTaxRate\', Array)\n#10 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(145): Istheweb\\Shop\\Models\\OrderItem->getTaxRate()\n#11 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#12 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#13 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#15 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#16 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#17 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#18 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#19 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#20 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#21 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#23 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#26 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#27 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#28 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#29 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#30 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'boi5vyLRD4uhztX...\')\n#31 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#32 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#33 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#34 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#35 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#36 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#37 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#38 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#39 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#40 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#44 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#61 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#73 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#76 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#77 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#78 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#81 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#82 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#83 {main}',NULL,'2017-04-09 15:09:40','2017-04-09 15:09:40'),(16,'error','exception \'BadMethodCallException\' with message \'Call to undefined method October\\Rain\\Database\\QueryBuilder::fist()\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php:2123\nStack trace:\n#0 [internal function]: Illuminate\\Database\\Query\\Builder->__call(\'fist\', Array)\n#1 [internal function]: October\\Rain\\Database\\QueryBuilder->fist()\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1015): call_user_func_array(Array, Array)\n#3 /var/www/public/vendor/october/rain/src/Database/Builder.php(188): Illuminate\\Database\\Eloquent\\Builder->__call(\'fist\', Array)\n#4 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(138): October\\Rain\\Database\\Builder->__call(\'fist\', Array)\n#5 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(138): October\\Rain\\Database\\Builder->fist()\n#6 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#7 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#8 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#10 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#11 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#12 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#13 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#14 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#15 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#16 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#17 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#18 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#21 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#22 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#23 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#24 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#25 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'maCpzvWPjOefyJt...\')\n#26 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#27 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#28 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#29 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#30 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#31 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#32 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#33 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#34 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#35 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#37 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#39 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#71 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#73 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#76 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#77 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#78 {main}',NULL,'2017-04-09 15:39:58','2017-04-09 15:39:58'),(17,'error','exception \'PDOException\' with message \'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'orderable\' in \'where clause\'\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:319\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(319): PDO->prepare(\'select * from `...\')\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(659): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection), \'select * from `...\', Array)\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(324): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1431): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#5 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1408): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(110): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(80): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#8 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(477): October\\Rain\\Database\\QueryBuilder->get(Array)\n#9 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(234): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#10 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(206): Illuminate\\Database\\Eloquent\\Builder->get(Array)\n#11 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(138): Illuminate\\Database\\Eloquent\\Builder->first()\n#12 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#13 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#14 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#15 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#16 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#17 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#18 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#19 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#20 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#21 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#22 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#23 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#24 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#26 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#27 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#28 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#29 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#30 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#31 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'CauaM6IxthjlXGE...\')\n#32 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#33 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#34 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#35 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#36 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#37 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#38 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#39 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#40 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#41 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#45 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#62 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#71 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#74 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#76 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#79 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#81 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#82 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#83 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#84 {main}\n\nNext exception \'Illuminate\\Database\\QueryException\' with message \'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'orderable\' in \'where clause\' (SQL: select * from `istheweb_shop_adjustments` where `orderable` = {\"id\":1,\"order_id\":1,\"productable_id\":2,\"productable_type\":\"Istheweb\\Shop\\Models\\Variant\",\"quantity\":2,\"unit_price\":\"129.00\",\"unit_total\":\"258.00\",\"total\":\"258.00\",\"adjustments_total\":null,\"created_at\":\"2017-04-09 07:23:52\",\"updated_at\":\"2017-04-09 15:41:07\"} limit 1)\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:666\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(324): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1431): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1408): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(110): Illuminate\\Database\\Query\\Builder->get(Array)\n#5 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(80): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(477): October\\Rain\\Database\\QueryBuilder->get(Array)\n#7 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(234): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#8 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(206): Illuminate\\Database\\Eloquent\\Builder->get(Array)\n#9 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(138): Illuminate\\Database\\Eloquent\\Builder->first()\n#10 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#11 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#12 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(121): Istheweb\\Shop\\Models\\Order->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#15 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(76): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#16 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#17 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#18 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#19 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#20 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#22 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#23 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#26 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#27 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#28 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#29 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'CauaM6IxthjlXGE...\')\n#30 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#31 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#32 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#33 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#34 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#35 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#36 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#37 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#38 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#39 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#43 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#75 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#76 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#77 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#79 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#81 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#82 {main}',NULL,'2017-04-09 15:41:07','2017-04-09 15:41:07'),(18,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Call to a member function delete() on null\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php:128\nStack trace:\n#0 {main}',NULL,'2017-04-09 16:23:30','2017-04-09 16:23:30'),(19,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Class \'istheweb\\shop\\behaviors\\OrderItem\' not found\' in /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php:127\nStack trace:\n#0 {main}',NULL,'2017-04-09 16:25:28','2017-04-09 16:25:28'),(20,'error','exception \'Symfony\\Component\\Debug\\Exception\\FatalErrorException\' with message \'Maximum execution time of 30 seconds exceeded\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Support/Arr.php:186\nStack trace:\n#0 {main}',NULL,'2017-04-09 16:40:06','2017-04-09 16:40:06'),(21,'info','Warning: List column type \"relation\" for class \"Istheweb\\Shop\\Models\\ShippingMethod\" is not valid.',NULL,'2017-04-09 17:31:47','2017-04-09 17:31:47'),(22,'info','Warning: List column type \"relation\" for class \"Istheweb\\Shop\\Models\\ShippingMethod\" is not valid.',NULL,'2017-04-09 17:31:47','2017-04-09 17:31:47'),(23,'error','exception \'ErrorException\' with message \'Trying to get property of non-object\' in /var/www/public/plugins/istheweb/shop/models/Adjustment.php:35\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/models/Adjustment.php(35): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'/var/www/public...\', 35, Array)\n#1 [internal function]: Istheweb\\Shop\\Models\\Adjustment->scopeFindByTaxOrderable(Object(October\\Rain\\Database\\Builder), NULL)\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(901): call_user_func_array(Array, Array)\n#3 /var/www/public/vendor/october/rain/src/Database/Builder.php(185): Illuminate\\Database\\Eloquent\\Builder->callScope(\'scopeFindByTaxO...\', Array)\n#4 [internal function]: October\\Rain\\Database\\Builder->__call(\'findByTaxOrdera...\', Array)\n#5 [internal function]: October\\Rain\\Database\\Builder->findByTaxOrderable(NULL)\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3444): call_user_func_array(Array, Array)\n#7 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(383): Illuminate\\Database\\Eloquent\\Model->__call(\'findByTaxOrdera...\', Array)\n#8 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'findByTaxOrdera...\', Array)\n#9 [internal function]: October\\Rain\\Database\\Model->__call(\'findByTaxOrdera...\', Array)\n#10 [internal function]: Istheweb\\Shop\\Models\\Adjustment->findByTaxOrderable(NULL)\n#11 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3458): call_user_func_array(Array, Array)\n#12 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(130): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'findByTaxOrdera...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(130): Istheweb\\Shop\\Models\\Adjustment::findByTaxOrderable(NULL)\n#14 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->removeAdjustment()\n#15 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#16 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'removeAdjustmen...\', Array)\n#17 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(71): October\\Rain\\Database\\Model->__call(\'removeAdjustmen...\', Array)\n#18 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(71): Istheweb\\Shop\\Models\\OrderItem->removeAdjustment()\n#19 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterDelete()\n#20 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#21 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#22 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.delete...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#23 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1106): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'deleted\', false)\n#24 /var/www/public/modules/backend/behaviors/RelationController.php(1095): Illuminate\\Database\\Eloquent\\Model->delete()\n#25 /var/www/public/modules/backend/behaviors/RelationController.php(930): Backend\\Behaviors\\RelationController->onRelationManageDelete()\n#26 [internal function]: Backend\\Behaviors\\RelationController->onRelationButtonDelete(\'1\')\n#27 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#28 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationButto...\', Array)\n#29 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationButto...\', Array)\n#30 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationButtonDelete(\'1\')\n#31 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#32 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationButto...\')\n#33 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#34 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#35 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#37 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#38 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#39 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#71 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#73 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#76 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#77 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#78 {main}',NULL,'2017-04-09 17:52:08','2017-04-09 17:52:08'),(24,'error','exception \'ErrorException\' with message \'Trying to get property of non-object\' in /var/www/public/plugins/istheweb/shop/models/OrderItem.php:76\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(76): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'/var/www/public...\', 76, Array)\n#1 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterDelete()\n#2 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#4 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.delete...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#5 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1106): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'deleted\', false)\n#6 /var/www/public/modules/backend/behaviors/RelationController.php(1095): Illuminate\\Database\\Eloquent\\Model->delete()\n#7 /var/www/public/modules/backend/behaviors/RelationController.php(930): Backend\\Behaviors\\RelationController->onRelationManageDelete()\n#8 [internal function]: Backend\\Behaviors\\RelationController->onRelationButtonDelete(\'1\')\n#9 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#10 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationButto...\', Array)\n#11 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationButto...\', Array)\n#12 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationButtonDelete(\'1\')\n#13 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#14 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationButto...\')\n#15 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#16 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#18 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#19 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#21 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#27 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#28 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#29 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#36 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#37 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#55 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#59 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#60 {main}',NULL,'2017-04-09 18:05:18','2017-04-09 18:05:18'),(25,'error','exception \'PDOException\' with message \'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'order\' in \'where clause\'\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:319\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(319): PDO->prepare(\'select * from `...\')\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(659): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection), \'select * from `...\', Array)\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(324): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1431): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#5 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1408): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(110): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(80): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#8 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(477): October\\Rain\\Database\\QueryBuilder->get(Array)\n#9 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(234): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#10 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(137): Illuminate\\Database\\Eloquent\\Builder->get()\n#11 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(\'tax\')\n#12 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#13 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#14 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(123): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#15 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(123): Istheweb\\Shop\\Models\\Order->updateAdjustment(\'tax\')\n#16 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(78): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#17 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#18 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#19 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#20 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#21 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#22 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#23 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#26 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#27 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#28 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#29 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#30 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'c7InfMBxvJ5s2VZ...\')\n#31 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#32 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#33 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#34 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#35 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#36 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#37 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#38 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#39 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#40 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#44 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#61 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#73 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#76 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#77 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#78 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#81 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#82 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#83 {main}\n\nNext exception \'Illuminate\\Database\\QueryException\' with message \'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'order\' in \'where clause\' (SQL: select * from `istheweb_shop_order_items` where `order` = 1)\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:666\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(324): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1431): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1408): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(110): Illuminate\\Database\\Query\\Builder->get(Array)\n#5 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(80): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(477): October\\Rain\\Database\\QueryBuilder->get(Array)\n#7 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(234): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#8 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(137): Illuminate\\Database\\Eloquent\\Builder->get()\n#9 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(\'tax\')\n#10 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#11 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#12 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(123): October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#13 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(123): Istheweb\\Shop\\Models\\Order->updateAdjustment(\'tax\')\n#14 /var/www/public/plugins/istheweb/shop/behaviors/OrderItemModel.php(78): istheweb\\shop\\behaviors\\OrderItemModel->updateAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#15 [internal function]: istheweb\\shop\\behaviors\\OrderItemModel->checkAdjustement()\n#16 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#17 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'checkAdjustemen...\', Array)\n#18 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): October\\Rain\\Database\\Model->__call(\'checkAdjustemen...\', Array)\n#19 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(66): Istheweb\\Shop\\Models\\OrderItem->checkAdjustement()\n#20 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterSave()\n#21 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#22 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#23 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.saved:...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1485): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'saved\', false)\n#25 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1456): Illuminate\\Database\\Eloquent\\Model->finishSave(Array)\n#26 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#27 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#28 /var/www/public/modules/backend/behaviors/RelationController.php(1067): October\\Rain\\Database\\Model->save(NULL, \'c7InfMBxvJ5s2VZ...\')\n#29 [internal function]: Backend\\Behaviors\\RelationController->onRelationManageUpdate(\'1\')\n#30 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#31 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationManag...\', Array)\n#32 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationManag...\', Array)\n#33 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationManageUpdate(\'1\')\n#34 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#35 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationManag...\')\n#36 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#37 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#38 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#39 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#40 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#41 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#42 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#51 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#56 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#59 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#71 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#74 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#76 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#79 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#80 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#81 {main}',NULL,'2017-04-09 18:15:00','2017-04-09 18:15:00'),(26,'error','exception \'PDOException\' with message \'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'orderable_id\' cannot be null\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:390\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(390): PDOStatement->execute(Array)\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(659): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection), \'insert into `is...\', Array)\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `is...\', Array, Object(Closure))\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(391): Illuminate\\Database\\Connection->run(\'insert into `is...\', Array, Object(Closure))\n#4 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(347): Illuminate\\Database\\Connection->statement(\'insert into `is...\', Array)\n#5 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Processors/Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `is...\', Array)\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1843): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(October\\Rain\\Database\\QueryBuilder), \'insert into `is...\', Array, \'id\')\n#7 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(260): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#8 [internal function]: October\\Rain\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#9 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1015): call_user_func_array(Array, Array)\n#10 /var/www/public/vendor/october/rain/src/Database/Builder.php(188): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1592): October\\Rain\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1592): October\\Rain\\Database\\Builder->insertGetId(Array, \'id\')\n#13 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1561): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(October\\Rain\\Database\\Builder), Array)\n#14 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1452): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(October\\Rain\\Database\\Builder), Array)\n#15 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#16 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#17 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(114): October\\Rain\\Database\\Model->save()\n#18 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(146): istheweb\\shop\\behaviors\\OrderModel->addAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#19 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(\'tax\')\n#20 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#21 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#22 [internal function]: October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#23 [internal function]: Istheweb\\Shop\\Models\\Order->updateAdjustment(\'tax\')\n#24 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3458): call_user_func_array(Array, Array)\n#25 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(76): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'updateAdjustmen...\', Array)\n#26 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(76): Istheweb\\Shop\\Models\\Order::updateAdjustment(\'tax\')\n#27 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterDelete()\n#28 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#29 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#30 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.delete...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#31 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1106): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'deleted\', false)\n#32 /var/www/public/modules/backend/behaviors/RelationController.php(1095): Illuminate\\Database\\Eloquent\\Model->delete()\n#33 /var/www/public/modules/backend/behaviors/RelationController.php(930): Backend\\Behaviors\\RelationController->onRelationManageDelete()\n#34 [internal function]: Backend\\Behaviors\\RelationController->onRelationButtonDelete(\'1\')\n#35 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#36 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationButto...\', Array)\n#37 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationButto...\', Array)\n#38 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationButtonDelete(\'1\')\n#39 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#40 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationButto...\')\n#41 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#42 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#43 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#45 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#47 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#54 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#58 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#62 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#64 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#65 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#67 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#68 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#73 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#74 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#76 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#77 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#81 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#82 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#83 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#84 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#85 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#86 {main}\n\nNext exception \'Illuminate\\Database\\QueryException\' with message \'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'orderable_id\' cannot be null (SQL: insert into `istheweb_shop_adjustments` (`orderable_id`, `orderable_type`, `type`, `amount`, `name`, `is_neutral`, `is_locked`, `updated_at`, `created_at`) values (, Istheweb\\Shop\\Models\\Order, tax, 5418, ES - Ropa - 21%, 0, 0, 2017-04-10 16:36:26, 2017-04-10 16:36:26))\' in /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php:666\nStack trace:\n#0 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(622): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `is...\', Array, Object(Closure))\n#1 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(391): Illuminate\\Database\\Connection->run(\'insert into `is...\', Array, Object(Closure))\n#2 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Connection.php(347): Illuminate\\Database\\Connection->statement(\'insert into `is...\', Array)\n#3 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Processors/Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `is...\', Array)\n#4 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(1843): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(October\\Rain\\Database\\QueryBuilder), \'insert into `is...\', Array, \'id\')\n#5 /var/www/public/vendor/october/rain/src/Database/QueryBuilder.php(260): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#6 [internal function]: October\\Rain\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#7 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1015): call_user_func_array(Array, Array)\n#8 /var/www/public/vendor/october/rain/src/Database/Builder.php(188): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#9 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1592): October\\Rain\\Database\\Builder->__call(\'insertGetId\', Array)\n#10 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1592): October\\Rain\\Database\\Builder->insertGetId(Array, \'id\')\n#11 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1561): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(October\\Rain\\Database\\Builder), Array)\n#12 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1452): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(October\\Rain\\Database\\Builder), Array)\n#13 /var/www/public/vendor/october/rain/src/Database/Model.php(1137): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#14 /var/www/public/vendor/october/rain/src/Database/Model.php(1170): October\\Rain\\Database\\Model->saveInternal(Array)\n#15 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(114): October\\Rain\\Database\\Model->save()\n#16 /var/www/public/plugins/istheweb/shop/behaviors/OrderModel.php(146): istheweb\\shop\\behaviors\\OrderModel->addAdjustment(Object(Istheweb\\Shop\\Models\\Adjustment))\n#17 [internal function]: istheweb\\shop\\behaviors\\OrderModel->updateAdjustment(\'tax\')\n#18 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#19 /var/www/public/vendor/october/rain/src/Database/Model.php(516): October\\Rain\\Database\\Model->extendableCall(\'updateAdjustmen...\', Array)\n#20 [internal function]: October\\Rain\\Database\\Model->__call(\'updateAdjustmen...\', Array)\n#21 [internal function]: Istheweb\\Shop\\Models\\Order->updateAdjustment(\'tax\')\n#22 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(3458): call_user_func_array(Array, Array)\n#23 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(76): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'updateAdjustmen...\', Array)\n#24 /var/www/public/plugins/istheweb/shop/models/OrderItem.php(76): Istheweb\\Shop\\Models\\Order::updateAdjustment(\'tax\')\n#25 /var/www/public/vendor/october/rain/src/Database/Model.php(275): Istheweb\\Shop\\Models\\OrderItem->afterDelete()\n#26 [internal function]: October\\Rain\\Database\\Model->October\\Rain\\Database\\{closure}(Object(Istheweb\\Shop\\Models\\OrderItem))\n#27 /var/www/public/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(221): call_user_func_array(Object(Closure), Array)\n#28 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1650): Illuminate\\Events\\Dispatcher->fire(\'eloquent.delete...\', Object(Istheweb\\Shop\\Models\\OrderItem))\n#29 /var/www/public/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1106): Illuminate\\Database\\Eloquent\\Model->fireModelEvent(\'deleted\', false)\n#30 /var/www/public/modules/backend/behaviors/RelationController.php(1095): Illuminate\\Database\\Eloquent\\Model->delete()\n#31 /var/www/public/modules/backend/behaviors/RelationController.php(930): Backend\\Behaviors\\RelationController->onRelationManageDelete()\n#32 [internal function]: Backend\\Behaviors\\RelationController->onRelationButtonDelete(\'1\')\n#33 /var/www/public/vendor/october/rain/src/Extension/ExtendableTrait.php(369): call_user_func_array(Array, Array)\n#34 /var/www/public/vendor/october/rain/src/Extension/Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'onRelationButto...\', Array)\n#35 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'onRelationButto...\', Array)\n#36 [internal function]: Istheweb\\Shop\\Controllers\\Orders->onRelationButtonDelete(\'1\')\n#37 /var/www/public/modules/backend/classes/Controller.php(540): call_user_func_array(Array, Array)\n#38 /var/www/public/modules/backend/classes/Controller.php(423): Backend\\Classes\\Controller->runAjaxHandler(\'onRelationButto...\')\n#39 /var/www/public/modules/backend/classes/Controller.php(233): Backend\\Classes\\Controller->execAjaxHandlers()\n#40 /var/www/public/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'update\', Array)\n#41 [internal function]: Backend\\Classes\\BackendController->run(\'istheweb/shop/o...\')\n#42 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#43 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#44 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#45 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#51 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#52 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#53 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#54 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#58 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#60 /var/www/public/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#61 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#62 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#63 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#64 /var/www/public/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#66 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#67 /var/www/public/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#70 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#71 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#72 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#73 /var/www/public/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#74 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#75 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#76 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#78 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#79 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#80 /var/www/public/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#81 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#82 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#83 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#84 {main}',NULL,'2017-04-10 16:36:27','2017-04-10 16:36:27'),(27,'error','exception \'ErrorException\' with message \'Invalid argument supplied for foreach()\' in /var/www/public/plugins/istheweb/shop/Plugin.php:424\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/Plugin.php(424): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Invalid argumen...\', \'/var/www/public...\', 424, Array)\n#1 /var/www/public/plugins/istheweb/shop/Plugin.php(358): Istheweb\\Shop\\Plugin->bootPackages()\n#2 /var/www/public/modules/system/classes/PluginManager.php(269): Istheweb\\Shop\\Plugin->boot()\n#3 /var/www/public/modules/system/classes/PluginManager.php(251): System\\Classes\\PluginManager->bootPlugin(Object(Istheweb\\Shop\\Plugin))\n#4 /var/www/public/modules/system/ServiceProvider.php(87): System\\Classes\\PluginManager->bootAll()\n#5 [internal function]: System\\ServiceProvider->boot()\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Container/Container.php(507): call_user_func_array(Array, Array)\n#7 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(734): Illuminate\\Container\\Container->call(Array)\n#8 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(717): Illuminate\\Foundation\\Application->bootProvider(Object(System\\ServiceProvider))\n#9 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(System\\ServiceProvider), 23)\n#10 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(718): array_walk(Array, Object(Closure))\n#11 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#12 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(203): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(October\\Rain\\Foundation\\Application))\n#13 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(222): Illuminate\\Foundation\\Application->bootstrapWith(Array)\n#14 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(117): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#15 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#16 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#17 {main}',NULL,'2017-04-11 13:52:25','2017-04-11 13:52:25'),(28,'error','exception \'ErrorException\' with message \'Invalid argument supplied for foreach()\' in /var/www/public/plugins/istheweb/shop/Plugin.php:424\nStack trace:\n#0 /var/www/public/plugins/istheweb/shop/Plugin.php(424): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Invalid argumen...\', \'/var/www/public...\', 424, Array)\n#1 /var/www/public/plugins/istheweb/shop/Plugin.php(358): Istheweb\\Shop\\Plugin->bootPackages()\n#2 /var/www/public/modules/system/classes/PluginManager.php(269): Istheweb\\Shop\\Plugin->boot()\n#3 /var/www/public/modules/system/classes/PluginManager.php(251): System\\Classes\\PluginManager->bootPlugin(Object(Istheweb\\Shop\\Plugin))\n#4 /var/www/public/modules/system/ServiceProvider.php(87): System\\Classes\\PluginManager->bootAll()\n#5 [internal function]: System\\ServiceProvider->boot()\n#6 /var/www/public/vendor/laravel/framework/src/Illuminate/Container/Container.php(507): call_user_func_array(Array, Array)\n#7 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(734): Illuminate\\Container\\Container->call(Array)\n#8 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(717): Illuminate\\Foundation\\Application->bootProvider(Object(System\\ServiceProvider))\n#9 [internal function]: Illuminate\\Foundation\\Application->Illuminate\\Foundation\\{closure}(Object(System\\ServiceProvider), 23)\n#10 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(718): array_walk(Array, Object(Closure))\n#11 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/BootProviders.php(17): Illuminate\\Foundation\\Application->boot()\n#12 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(203): Illuminate\\Foundation\\Bootstrap\\BootProviders->bootstrap(Object(October\\Rain\\Foundation\\Application))\n#13 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(222): Illuminate\\Foundation\\Application->bootstrapWith(Array)\n#14 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(117): Illuminate\\Foundation\\Http\\Kernel->bootstrap()\n#15 /var/www/public/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#16 /var/www/public/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#17 {main}',NULL,'2017-04-11 13:52:28','2017-04-11 13:52:28');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
INSERT INTO `system_files` VALUES (1,'58d77b6a34823799750727.png','logo.png',8162,'image/png',NULL,NULL,'logo','1','Backend\\Models\\BrandSetting',1,1,'2017-03-26 08:27:22','2017-03-26 08:28:27');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default','default','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>','{{ content|raw }}','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2017-03-25 08:53:22','2017-03-25 08:53:22'),(2,'System','system','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2017-03-25 08:53:22','2017-03-25 08:53:22');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','update','retry','1492240929'),(3,'system','core','hash','\"835c2b2cb3b362c2d9d99abe946f0bc6\"'),(4,'system','core','build','\"414\"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2563 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (2,'RainLab.User','script','1.0.1','create_users_table.php','2017-03-25 08:56:49'),(3,'RainLab.User','script','1.0.1','create_throttle_table.php','2017-03-25 08:56:49'),(4,'RainLab.User','comment','1.0.1','Initialize plugin.','2017-03-25 08:56:49'),(5,'RainLab.User','comment','1.0.2','Seed tables.','2017-03-25 08:56:49'),(6,'RainLab.User','comment','1.0.3','Translated hard-coded text to language strings.','2017-03-25 08:56:49'),(7,'RainLab.User','comment','1.0.4','Improvements to user-interface for Location manager.','2017-03-25 08:56:49'),(8,'RainLab.User','comment','1.0.5','Added contact details for users.','2017-03-25 08:56:49'),(9,'RainLab.User','script','1.0.6','create_mail_blockers_table.php','2017-03-25 08:56:49'),(10,'RainLab.User','comment','1.0.6','Added Mail Blocker utility so users can block specific mail templates.','2017-03-25 08:56:49'),(11,'RainLab.User','comment','1.0.7','Add back-end Settings page.','2017-03-25 08:56:49'),(12,'RainLab.User','comment','1.0.8','Updated the Settings page.','2017-03-25 08:56:49'),(13,'RainLab.User','comment','1.0.9','Adds new welcome mail message for users and administrators.','2017-03-25 08:56:49'),(14,'RainLab.User','comment','1.0.10','Adds administrator-only activation mode.','2017-03-25 08:56:49'),(15,'RainLab.User','script','1.0.11','users_add_login_column.php','2017-03-25 08:56:50'),(16,'RainLab.User','comment','1.0.11','Users now have an optional login field that defaults to the email field.','2017-03-25 08:56:50'),(17,'RainLab.User','script','1.0.12','users_rename_login_to_username.php','2017-03-25 08:56:50'),(18,'RainLab.User','comment','1.0.12','Create a dedicated setting for choosing the login mode.','2017-03-25 08:56:50'),(19,'RainLab.User','comment','1.0.13','Minor fix to the Account sign in logic.','2017-03-25 08:56:50'),(20,'RainLab.User','comment','1.0.14','Minor improvements to the code.','2017-03-25 08:56:50'),(21,'RainLab.User','script','1.0.15','users_add_surname.php','2017-03-25 08:56:50'),(22,'RainLab.User','comment','1.0.15','Adds last name column to users table (surname).','2017-03-25 08:56:50'),(23,'RainLab.User','comment','1.0.16','Require permissions for settings page too.','2017-03-25 08:56:50'),(24,'RainLab.User','comment','1.1.0','!!! Profile fields and Locations have been removed.','2017-03-25 08:56:50'),(25,'RainLab.User','script','1.1.1','create_user_groups_table.php','2017-03-25 08:56:50'),(26,'RainLab.User','script','1.1.1','seed_user_groups_table.php','2017-03-25 08:56:50'),(27,'RainLab.User','comment','1.1.1','Users can now be added to groups.','2017-03-25 08:56:50'),(28,'RainLab.User','comment','1.1.2','A raw URL can now be passed as the redirect property in the Account component.','2017-03-25 08:56:50'),(29,'RainLab.User','comment','1.1.3','Adds a super user flag to the users table, reserved for future use.','2017-03-25 08:56:50'),(30,'RainLab.User','comment','1.1.4','User list can be filtered by the group they belong to.','2017-03-25 08:56:50'),(31,'RainLab.User','comment','1.1.5','Adds a new permission to hide the User settings menu item.','2017-03-25 08:56:50'),(32,'RainLab.User','script','1.2.0','users_add_deleted_at.php','2017-03-25 08:56:50'),(33,'RainLab.User','comment','1.2.0','Users can now deactivate their own accounts.','2017-03-25 08:56:50'),(34,'RainLab.User','comment','1.2.1','New feature for checking if a user is recently active/online.','2017-03-25 08:56:50'),(35,'RainLab.User','comment','1.2.2','Add bulk action button to user list.','2017-03-25 08:56:50'),(36,'RainLab.User','comment','1.2.3','Included some descriptive paragraphs in the Reset Password component markup.','2017-03-25 08:56:50'),(37,'RainLab.User','comment','1.2.4','Added a checkbox for blocking all mail sent to the user.','2017-03-25 08:56:50'),(38,'RainLab.User','script','1.2.5','update_timestamp_nullable.php','2017-03-25 08:56:50'),(39,'RainLab.User','comment','1.2.5','Database maintenance. Updated all timestamp columns to be nullable.','2017-03-25 08:56:50'),(40,'RainLab.User','script','1.2.6','users_add_last_seen.php','2017-03-25 08:56:50'),(41,'RainLab.User','comment','1.2.6','Add a dedicated last seen column for users.','2017-03-25 08:56:50'),(42,'RainLab.User','comment','1.2.7','Minor fix to user timestamp attributes.','2017-03-25 08:56:50'),(43,'RainLab.User','comment','1.2.8','Add date range filter to users list. Introduced a logout event.','2017-03-25 08:56:50'),(44,'RainLab.User','comment','1.2.9','Add invitation mail for new accounts created in the back-end.','2017-03-25 08:56:50'),(45,'RainLab.User','script','1.3.0','users_add_guest_flag.php','2017-03-25 08:56:50'),(46,'RainLab.User','script','1.3.0','users_add_superuser_flag.php','2017-03-25 08:56:50'),(47,'RainLab.User','comment','1.3.0','Introduced guest user accounts.','2017-03-25 08:56:50'),(48,'RainLab.User','comment','1.3.1','User notification variables can now be extended.','2017-03-25 08:56:50'),(49,'RainLab.User','comment','1.3.2','Minor fix to the Auth::register method.','2017-03-25 08:56:50'),(50,'RainLab.User','comment','1.3.3','Allow prevention of concurrent user sessions via the user settings.','2017-03-25 08:56:50'),(51,'RainLab.User','comment','1.3.4','Added force secure protocol property to the account component.','2017-03-25 08:56:50'),(52,'RainLab.Location','comment','1.0.1','Initialize plugin.','2017-03-25 08:57:12'),(53,'RainLab.Location','script','1.0.2','create_states_table.php','2017-03-25 08:57:12'),(54,'RainLab.Location','script','1.0.2','create_countries_table.php','2017-03-25 08:57:13'),(55,'RainLab.Location','comment','1.0.2','Create database tables.','2017-03-25 08:57:13'),(56,'RainLab.Location','script','1.0.3','seed_all_tables.php','2017-03-25 08:57:15'),(57,'RainLab.Location','comment','1.0.3','Add seed data for countries and states.','2017-03-25 08:57:15'),(58,'RainLab.Location','comment','1.0.4','Satisfy the new Google API key requirement.','2017-03-25 08:57:15'),(59,'RainLab.Location','script','1.0.5','add_country_pinned_flag.php','2017-03-25 08:57:15'),(60,'RainLab.Location','comment','1.0.5','Countries can now be pinned to make them appear at the top of the list.','2017-03-25 08:57:15'),(61,'RainLab.Location','comment','1.0.6','Added support for defining a default country and state.','2017-03-25 08:57:15'),(62,'RainLab.Location','comment','1.0.7','Added basic geocoding method to the Country model.','2017-03-25 08:57:15'),(63,'RainLab.Blog','script','1.0.1','create_posts_table.php','2017-03-25 08:57:53'),(64,'RainLab.Blog','script','1.0.1','create_categories_table.php','2017-03-25 08:57:53'),(65,'RainLab.Blog','script','1.0.1','seed_all_tables.php','2017-03-25 08:57:53'),(66,'RainLab.Blog','comment','1.0.1','Initialize plugin.','2017-03-25 08:57:53'),(67,'RainLab.Blog','comment','1.0.2','Added the processed HTML content column to the posts table.','2017-03-25 08:57:53'),(68,'RainLab.Blog','comment','1.0.3','Category component has been merged with Posts component.','2017-03-25 08:57:53'),(69,'RainLab.Blog','comment','1.0.4','Improvements to the Posts list management UI.','2017-03-25 08:57:53'),(70,'RainLab.Blog','comment','1.0.5','Removes the Author column from blog post list.','2017-03-25 08:57:53'),(71,'RainLab.Blog','comment','1.0.6','Featured images now appear in the Post component.','2017-03-25 08:57:53'),(72,'RainLab.Blog','comment','1.0.7','Added support for the Static Pages menus.','2017-03-25 08:57:53'),(73,'RainLab.Blog','comment','1.0.8','Added total posts to category list.','2017-03-25 08:57:53'),(74,'RainLab.Blog','comment','1.0.9','Added support for the Sitemap plugin.','2017-03-25 08:57:53'),(75,'RainLab.Blog','comment','1.0.10','Added permission to prevent users from seeing posts they did not create.','2017-03-25 08:57:53'),(76,'RainLab.Blog','comment','1.0.11','Deprecate \"idParam\" component property in favour of \"slug\" property.','2017-03-25 08:57:53'),(77,'RainLab.Blog','comment','1.0.12','Fixes issue where images cannot be uploaded caused by latest Markdown library.','2017-03-25 08:57:53'),(78,'RainLab.Blog','comment','1.0.13','Fixes problem with providing pages to Sitemap and Pages plugins.','2017-03-25 08:57:53'),(79,'RainLab.Blog','comment','1.0.14','Add support for CSRF protection feature added to core.','2017-03-25 08:57:53'),(80,'RainLab.Blog','comment','1.1.0','Replaced the Post editor with the new core Markdown editor.','2017-03-25 08:57:53'),(81,'RainLab.Blog','comment','1.1.1','Posts can now be imported and exported.','2017-03-25 08:57:53'),(82,'RainLab.Blog','comment','1.1.2','Posts are no longer visible if the published date has not passed.','2017-03-25 08:57:53'),(83,'RainLab.Blog','comment','1.1.3','Added a New Post shortcut button to the blog menu.','2017-03-25 08:57:53'),(84,'RainLab.Blog','script','1.2.0','categories_add_nested_fields.php','2017-03-25 08:57:53'),(85,'RainLab.Blog','comment','1.2.0','Categories now support nesting.','2017-03-25 08:57:53'),(86,'RainLab.Blog','comment','1.2.1','Post slugs now must be unique.','2017-03-25 08:57:53'),(87,'RainLab.Blog','comment','1.2.2','Fixes issue on new installs.','2017-03-25 08:57:53'),(88,'RainLab.Blog','comment','1.2.3','Minor user interface update.','2017-03-25 08:57:53'),(89,'RainLab.Blog','script','1.2.4','update_timestamp_nullable.php','2017-03-25 08:57:53'),(90,'RainLab.Blog','comment','1.2.4','Database maintenance. Updated all timestamp columns to be nullable.','2017-03-25 08:57:53'),(91,'RainLab.Blog','comment','1.2.5','Added translation support for blog posts.','2017-03-25 08:57:53'),(92,'RainLab.Blog','comment','1.2.6','The published field can now supply a time with the date.','2017-03-25 08:57:53'),(93,'RainLab.Blog','comment','1.2.7','Introduced a new RSS feed component.','2017-03-25 08:57:53'),(94,'RainLab.Blog','comment','1.2.8','Fixes issue with translated `content_html` attribute on blog posts.','2017-03-25 08:57:53'),(95,'RainLab.Blog','comment','1.2.9','Added translation support for blog categories.','2017-03-25 08:57:53'),(96,'RainLab.Blog','comment','1.2.10','Added translation support for post slugs.','2017-03-25 08:57:53'),(97,'RainLab.Blog','comment','1.2.11','Fixes bug where excerpt is not translated.','2017-03-25 08:57:53'),(98,'RainLab.Blog','comment','1.2.12','Description field added to category form.','2017-03-25 08:57:53'),(99,'RainLab.Blog','comment','1.2.13','Improved support for Static Pages menus, added a blog post and all blog posts.','2017-03-25 08:57:53'),(100,'RainLab.Blog','comment','1.2.14','Added post exception property to the post list component, useful for showing related posts.','2017-03-25 08:57:53'),(101,'RainLab.Translate','script','1.0.1','create_messages_table.php','2017-03-25 08:58:34'),(102,'RainLab.Translate','script','1.0.1','create_attributes_table.php','2017-03-25 08:58:34'),(103,'RainLab.Translate','script','1.0.1','create_locales_table.php','2017-03-25 08:58:34'),(104,'RainLab.Translate','script','1.0.1','seed_all_tables.php','2017-03-25 08:58:34'),(105,'RainLab.Translate','comment','1.0.1','First version of Translate','2017-03-25 08:58:34'),(106,'RainLab.Translate','comment','1.0.2','Languages and Messages can now be deleted.','2017-03-25 08:58:34'),(107,'RainLab.Translate','comment','1.0.3','Minor updates for latest October release.','2017-03-25 08:58:34'),(108,'RainLab.Translate','comment','1.0.4','Locale cache will clear when updating a language.','2017-03-25 08:58:34'),(109,'RainLab.Translate','comment','1.0.5','Add Spanish language and fix plugin config.','2017-03-25 08:58:34'),(110,'RainLab.Translate','comment','1.0.6','Minor improvements to the code.','2017-03-25 08:58:34'),(111,'RainLab.Translate','comment','1.0.7','Fixes major bug where translations are skipped entirely!','2017-03-25 08:58:34'),(112,'RainLab.Translate','comment','1.0.8','Minor bug fixes.','2017-03-25 08:58:34'),(113,'RainLab.Translate','comment','1.0.9','Fixes an issue where newly created models lose their translated values.','2017-03-25 08:58:34'),(114,'RainLab.Translate','comment','1.0.10','Minor fix for latest build.','2017-03-25 08:58:34'),(115,'RainLab.Translate','comment','1.0.11','Fix multilingual rich editor when used in stretch mode.','2017-03-25 08:58:34'),(116,'RainLab.Translate','comment','1.1.0','Introduce compatibility with RainLab.Pages plugin.','2017-03-25 08:58:34'),(117,'RainLab.Translate','comment','1.1.1','Minor UI fix to the language picker.','2017-03-25 08:58:34'),(118,'RainLab.Translate','comment','1.1.2','Add support for translating Static Content files.','2017-03-25 08:58:34'),(119,'RainLab.Translate','comment','1.1.3','Improved support for the multilingual rich editor.','2017-03-25 08:58:34'),(120,'RainLab.Translate','comment','1.1.4','Adds new multilingual markdown editor.','2017-03-25 08:58:34'),(121,'RainLab.Translate','comment','1.1.5','Minor update to the multilingual control API.','2017-03-25 08:58:34'),(122,'RainLab.Translate','comment','1.1.6','Minor improvements in the message editor.','2017-03-25 08:58:34'),(123,'RainLab.Translate','comment','1.1.7','Fixes bug not showing content when first loading multilingual textarea controls.','2017-03-25 08:58:34'),(124,'RainLab.Translate','comment','1.2.0','CMS pages now support translating the URL.','2017-03-25 08:58:34'),(125,'RainLab.Translate','comment','1.2.1','Minor update in the rich editor and code editor language control position.','2017-03-25 08:58:34'),(126,'RainLab.Translate','comment','1.2.2','Static Pages now support translating the URL.','2017-03-25 08:58:34'),(127,'RainLab.Translate','comment','1.2.3','Fixes Rich Editor when inserting a page link.','2017-03-25 08:58:34'),(128,'RainLab.Translate','script','1.2.4','create_indexes_table.php','2017-03-25 08:58:34'),(129,'RainLab.Translate','comment','1.2.4','Translatable attributes can now be declared as indexes.','2017-03-25 08:58:34'),(130,'RainLab.Translate','comment','1.2.5','Adds new multilingual repeater form widget.','2017-03-25 08:58:34'),(131,'RainLab.Translate','comment','1.2.6','Fixes repeater usage with static pages plugin.','2017-03-25 08:58:34'),(132,'RainLab.Translate','comment','1.2.7','Fixes placeholder usage with static pages plugin.','2017-03-25 08:58:34'),(133,'RainLab.Translate','comment','1.2.8','Improvements to code for latest October build compatibility.','2017-03-25 08:58:34'),(134,'RainLab.Translate','comment','1.2.9','Fixes context for translated strings when used with Static Pages.','2017-03-25 08:58:34'),(135,'RainLab.Translate','comment','1.2.10','Minor UI fix to the multilingual repeater.','2017-03-25 08:58:34'),(136,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2017-03-25 09:03:21'),(137,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2017-03-25 09:03:21'),(138,'RainLab.Pages','comment','1.0.3','Implemented menus.','2017-03-25 09:03:21'),(139,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2017-03-25 09:03:21'),(140,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2017-03-25 09:03:21'),(141,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2017-03-25 09:03:21'),(142,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2017-03-25 09:03:21'),(143,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2017-03-25 09:03:21'),(144,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2017-03-25 09:03:21'),(145,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2017-03-25 09:03:21'),(146,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2017-03-25 09:03:21'),(147,'RainLab.Pages','comment','1.0.12','Implement Media Manager support.','2017-03-25 09:03:21'),(148,'RainLab.Pages','script','1.1.0','snippets_rename_viewbag_properties.php','2017-03-25 09:03:22'),(149,'RainLab.Pages','comment','1.1.0','Adds meta title and description to pages. Adds |staticPage filter.','2017-03-25 09:03:22'),(150,'RainLab.Pages','comment','1.1.1','Add support for Syntax Fields.','2017-03-25 09:03:22'),(151,'RainLab.Pages','comment','1.1.2','Static Breadcrumbs component now respects the hide from navigation setting.','2017-03-25 09:03:22'),(152,'RainLab.Pages','comment','1.1.3','Minor back-end styling fix.','2017-03-25 09:03:22'),(153,'RainLab.Pages','comment','1.1.4','Minor fix to the StaticPage component API.','2017-03-25 09:03:22'),(154,'RainLab.Pages','comment','1.1.5','Fixes bug when using syntax fields.','2017-03-25 09:03:22'),(155,'RainLab.Pages','comment','1.1.6','Minor styling fix to the back-end UI.','2017-03-25 09:03:22'),(156,'RainLab.Pages','comment','1.1.7','Improved menu item form to include CSS class, open in a new window and hidden flag.','2017-03-25 09:03:22'),(157,'RainLab.Pages','comment','1.1.8','Improved the output of snippet partials when saved.','2017-03-25 09:03:22'),(158,'RainLab.Pages','comment','1.1.9','Minor update to snippet inspector internal API.','2017-03-25 09:03:22'),(159,'RainLab.Pages','comment','1.1.10','Fixes a bug where selecting a layout causes permanent unsaved changes.','2017-03-25 09:03:22'),(160,'RainLab.Pages','comment','1.1.11','Add support for repeater syntax field.','2017-03-25 09:03:22'),(161,'RainLab.Pages','comment','1.2.0','Added support for translations, UI updates.','2017-03-25 09:03:22'),(162,'RainLab.Pages','comment','1.2.1','Use nice titles when listing the content files.','2017-03-25 09:03:22'),(163,'RainLab.Pages','comment','1.2.2','Minor styling update.','2017-03-25 09:03:22'),(164,'RainLab.Pages','comment','1.2.3','Snippets can now be moved by dragging them.','2017-03-25 09:03:22'),(165,'RainLab.Pages','comment','1.2.4','Fixes a bug where the cursor is misplaced when editing text files.','2017-03-25 09:03:22'),(166,'RainLab.Pages','comment','1.2.5','Fixes a bug where the parent page is lost upon changing a page layout.','2017-03-25 09:03:22'),(167,'RainLab.Pages','comment','1.2.6','Shared view variables are now passed to static pages.','2017-03-25 09:03:22'),(168,'RainLab.Pages','comment','1.2.7','Fixes issue with duplicating properties when adding multiple snippets on the same page.','2017-03-25 09:03:22'),(169,'RainLab.Pages','comment','1.2.8','Fixes a bug where creating a content block without extension doesn\'t save the contents to file.','2017-03-25 09:03:22'),(170,'RainLab.Pages','comment','1.2.9','Add conditional support for translating page URLs.','2017-03-25 09:03:22'),(171,'RainLab.Pages','comment','1.2.10','Streamline generation of URLs to use the new Cms::url helper.','2017-03-25 09:03:22'),(172,'RainLab.Pages','comment','1.2.11','Implements repeater usage with translate plugin.','2017-03-25 09:03:22'),(173,'RainLab.Pages','comment','1.2.12','Fixes minor issue when using snippets and switching the application locale.','2017-03-25 09:03:22'),(174,'RainLab.Pages','comment','1.2.13','Fixes bug when AJAX is used on a page that does not yet exist.','2017-03-25 09:03:22'),(175,'RainLab.GoogleAnalytics','comment','1.0.1','Initialize plugin','2017-03-25 09:05:49'),(176,'RainLab.GoogleAnalytics','comment','1.0.2','Fixed a minor bug in the Top Pages widget','2017-03-25 09:05:49'),(177,'RainLab.GoogleAnalytics','comment','1.0.3','Minor improvements to the code','2017-03-25 09:05:49'),(178,'RainLab.GoogleAnalytics','comment','1.0.4','Fixes a bug where the certificate upload fails','2017-03-25 09:05:49'),(179,'RainLab.GoogleAnalytics','comment','1.0.5','Minor fix to support the updated Google Analytics library','2017-03-25 09:05:49'),(180,'RainLab.GoogleAnalytics','comment','1.0.6','Fixes dashboard widget using latest Google Analytics library','2017-03-25 09:05:49'),(181,'RainLab.GoogleAnalytics','comment','1.0.7','Removes Client ID from settings because the workflow no longer needs it','2017-03-25 09:05:49'),(182,'RainLab.GoogleAnalytics','comment','1.1.0','!!! Updated to the latest Google API library','2017-03-25 09:05:49'),(183,'RainLab.GoogleAnalytics','comment','1.2.0','Update Guzzle library to version 6.0','2017-03-25 09:05:49'),(184,'RainLab.GoogleAnalytics','comment','1.2.1','Update the plugin compatibility with RC8 Google API client','2017-03-25 09:05:49'),(185,'RainLab.Forum','script','1.0.1','create_channels_table.php','2017-03-25 09:06:18'),(186,'RainLab.Forum','script','1.0.1','create_posts_table.php','2017-03-25 09:06:18'),(187,'RainLab.Forum','script','1.0.1','create_topics_table.php','2017-03-25 09:06:18'),(188,'RainLab.Forum','script','1.0.1','create_members_table.php','2017-03-25 09:06:18'),(189,'RainLab.Forum','script','1.0.1','seed_all_tables.php','2017-03-25 09:06:18'),(190,'RainLab.Forum','comment','1.0.1','First version of Forum','2017-03-25 09:06:18'),(191,'RainLab.Forum','script','1.0.2','create_topic_watches_table.php','2017-03-25 09:06:18'),(192,'RainLab.Forum','comment','1.0.2','Add unread flags to topics','2017-03-25 09:06:18'),(193,'RainLab.Forum','script','1.0.3','members_add_mod_and_ban.php','2017-03-25 09:06:18'),(194,'RainLab.Forum','comment','1.0.3','Users can now be made moderators or be banned','2017-03-25 09:06:18'),(195,'RainLab.Forum','script','1.0.4','channels_add_hidden_and_moderated.php','2017-03-25 09:06:18'),(196,'RainLab.Forum','comment','1.0.4','Channels can now be hidden or moderated','2017-03-25 09:06:18'),(197,'RainLab.Forum','script','1.0.5','add_embed_code.php','2017-03-25 09:06:18'),(198,'RainLab.Forum','comment','1.0.5','Introduced topic and channel embedding','2017-03-25 09:06:18'),(199,'RainLab.Forum','script','1.0.6','create_channel_watches_table.php','2017-03-25 09:06:18'),(200,'RainLab.Forum','comment','1.0.6','Add unread flags to channels','2017-03-25 09:06:18'),(201,'RainLab.Forum','script','1.0.7','create_topic_followers_table.php','2017-03-25 09:06:19'),(202,'RainLab.Forum','comment','1.0.7','Forum members can now follow topics','2017-03-25 09:06:19'),(203,'RainLab.Forum','comment','1.0.8','Added Channel name to the Topics component view','2017-03-25 09:06:19'),(204,'RainLab.Forum','comment','1.0.9','Updated the Settings page','2017-03-25 09:06:19'),(205,'RainLab.Forum','comment','1.0.10','Users can now report spammers who can be banned by moderators.','2017-03-25 09:06:19'),(206,'RainLab.Forum','comment','1.0.11','Users can now quote other posts.','2017-03-25 09:06:19'),(207,'RainLab.Forum','comment','1.0.12','Improve support for CDN asset hosting.','2017-03-25 09:06:19'),(208,'RainLab.Forum','comment','1.0.13','Fixes a bug where channels cannot be selected in the Embed component inspector.','2017-03-25 09:06:19'),(209,'RainLab.Forum','comment','1.0.14','Improve the pagination code used in the component default markup.','2017-03-25 09:06:19'),(210,'RainLab.Forum','comment','1.0.15','When a User is deleted, their Member profile and posts is also deleted.','2017-03-25 09:06:19'),(211,'RainLab.Forum','comment','1.0.16','Posting topics is now throttled allowing 3 new topics every 15 minutes.','2017-03-25 09:06:19'),(212,'RainLab.Forum','comment','1.0.17','Update channel reorder page to new system reordering feature.','2017-03-25 09:06:19'),(213,'RainLab.Forum','comment','1.0.18','Minor fix to embed topic component.','2017-03-25 09:06:19'),(214,'RainLab.Forum','script','1.0.19','update_timestamp_nullable.php','2017-03-25 09:06:19'),(215,'RainLab.Forum','comment','1.0.19','Database maintenance. Updated all timestamp columns to be nullable.','2017-03-25 09:06:19'),(216,'RainLab.Forum','script','1.1.0','drop_watches_tables.php','2017-03-25 09:06:19'),(217,'RainLab.Forum','comment','1.1.0','Major performance enhancements','2017-03-25 09:06:19'),(218,'RainLab.Forum','comment','1.1.1','Fixes bug throwing error when a forum topic has no posts.','2017-03-25 09:06:19'),(219,'October.Drivers','comment','1.0.1','First version of Drivers','2017-03-25 09:08:03'),(220,'October.Drivers','comment','1.0.2','Update Guzzle library to version 5.0','2017-03-25 09:08:03'),(221,'October.Drivers','comment','1.1.0','Update AWS library to version 3.0','2017-03-25 09:08:03'),(222,'October.Drivers','comment','1.1.1','Update Guzzle library to version 6.0','2017-03-25 09:08:03'),(223,'Istheweb.IsPdf','comment','1.0.1','First version of IsPdf','2017-03-25 09:48:34'),(224,'Istheweb.IsPdf','script','1.0.2','create_layouts_table.php','2017-03-25 09:48:34'),(225,'Istheweb.IsPdf','script','1.0.2','create_templates_table.php','2017-03-25 09:48:34'),(226,'Istheweb.IsPdf','comment','1.0.2','Create models','2017-03-25 09:48:34'),(1028,'Istheweb.Connect','comment','1.0.1','First version of Connect','2017-03-26 11:08:36'),(1029,'Istheweb.Connect','script','1.0.2','create_calendars_table.php','2017-03-26 11:08:36'),(1030,'Istheweb.Connect','script','1.0.2','create_companies_table.php','2017-03-26 11:08:36'),(1031,'Istheweb.Connect','script','1.0.2','create_contacts_table.php','2017-03-26 11:08:36'),(1032,'Istheweb.Connect','script','1.0.2','create_events_table.php','2017-03-26 11:08:36'),(1033,'Istheweb.Connect','script','1.0.2','create_inboxes_table.php','2017-03-26 11:08:36'),(1034,'Istheweb.Connect','script','1.0.2','create_subscribers_table.php','2017-03-26 11:08:36'),(1035,'Istheweb.Connect','script','1.0.2','seed_tables.php','2017-03-26 11:08:37'),(1036,'Istheweb.Connect','comment','1.0.2','Create Tables','2017-03-26 11:08:37'),(1991,'Istheweb.IsCorporate','comment','1.0.1','First version of IsCorporate','2017-03-27 18:23:00'),(1992,'Istheweb.IsCorporate','script','1.0.2','create_employees_table.php','2017-03-27 18:23:00'),(1993,'Istheweb.IsCorporate','script','1.0.2','create_roles_table.php','2017-03-27 18:23:00'),(1994,'Istheweb.IsCorporate','script','1.0.2','create_clients_table.php','2017-03-27 18:23:00'),(1995,'Istheweb.IsCorporate','script','1.0.2','create_providers_table.php','2017-03-27 18:23:00'),(1996,'Istheweb.IsCorporate','script','1.0.2','create_budgets_table.php','2017-03-27 18:23:00'),(1997,'Istheweb.IsCorporate','script','1.0.2','create_option_values_table.php','2017-03-27 18:23:00'),(1998,'Istheweb.IsCorporate','script','1.0.2','create_project_types_table.php','2017-03-27 18:23:00'),(1999,'Istheweb.IsCorporate','script','1.0.2','create_project_options_table.php','2017-03-27 18:23:00'),(2000,'Istheweb.IsCorporate','script','1.0.2','create_projects_table.php','2017-03-27 18:23:00'),(2001,'Istheweb.IsCorporate','script','1.0.2','create_variants_table.php','2017-03-27 18:23:00'),(2002,'Istheweb.IsCorporate','script','1.0.2','create_issues_table.php','2017-03-27 18:23:00'),(2003,'Istheweb.IsCorporate','script','1.0.2','create_issue_messages_table.php','2017-03-27 18:23:00'),(2004,'Istheweb.IsCorporate','script','1.0.2','create_issue_statuses_table.php','2017-03-27 18:23:00'),(2005,'Istheweb.IsCorporate','script','1.0.2','create_issue_types_table.php','2017-03-27 18:23:00'),(2006,'Istheweb.IsCorporate','script','1.0.2','create_reports_table.php','2017-03-27 18:23:00'),(2007,'Istheweb.IsCorporate','script','1.0.2','create_invoices_table.php','2017-03-27 18:23:00'),(2008,'Istheweb.IsCorporate','script','1.0.2','create_pivots_table.php','2017-03-27 18:23:01'),(2009,'Istheweb.IsCorporate','script','1.0.2','seed_tables.php','2017-03-27 18:23:02'),(2010,'Istheweb.IsCorporate','comment','1.0.2','Create Models','2017-03-27 18:23:02'),(2079,'RainLab.Blog','comment','1.2.15','Back-end navigation sort order updated.','2017-04-01 07:36:53'),(2080,'RainLab.Blog','comment','1.2.16','Added `nextPost` and `previousPost` to the blog post component.','2017-04-01 07:36:53'),(2081,'RainLab.Pages','comment','1.2.14','Add theme logging support for changes made to menus.','2017-04-01 07:36:53'),(2082,'RainLab.Pages','comment','1.2.15','Back-end navigation sort order updated.','2017-04-01 07:36:53'),(2083,'October.Demo','comment','1.0.1','First version of Demo','2017-04-01 07:36:54'),(2400,'RainLab.Pages','comment','1.2.16','Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).','2017-04-07 15:36:42'),(2535,'Istheweb.Shop','comment','1.0.1','First version of isShop','2017-04-08 10:35:00'),(2536,'Istheweb.Shop','script','1.0.2','create_addresses_table.php','2017-04-08 10:35:00'),(2537,'Istheweb.Shop','script','1.0.2','create_adjustments_table.php','2017-04-08 10:35:00'),(2538,'Istheweb.Shop','script','1.0.2','create_attribute_values_table.php','2017-04-08 10:35:00'),(2539,'Istheweb.Shop','script','1.0.2','create_attributes_table.php','2017-04-08 10:35:00'),(2540,'Istheweb.Shop','script','1.0.2','create_categories_table.php','2017-04-08 10:35:01'),(2541,'Istheweb.Shop','script','1.0.2','create_currencies_table.php','2017-04-08 10:35:01'),(2542,'Istheweb.Shop','script','1.0.2','create_customers_table.php','2017-04-08 10:35:01'),(2543,'Istheweb.Shop','script','1.0.2','create_option_values_table.php','2017-04-08 10:35:01'),(2544,'Istheweb.Shop','script','1.0.2','create_options_table.php','2017-04-08 10:35:01'),(2545,'Istheweb.Shop','script','1.0.2','create_order_items_table.php','2017-04-08 10:35:01'),(2546,'Istheweb.Shop','script','1.0.2','create_order_statuses_table.php','2017-04-08 10:35:01'),(2547,'Istheweb.Shop','script','1.0.2','create_orders_table.php','2017-04-08 10:35:01'),(2548,'Istheweb.Shop','script','1.0.2','create_pivots_table.php','2017-04-08 10:35:01'),(2549,'Istheweb.Shop','script','1.0.2','create_products_table.php','2017-04-08 10:35:01'),(2550,'Istheweb.Shop','script','1.0.2','create_shipping_categories_table.php','2017-04-08 10:35:01'),(2551,'Istheweb.Shop','script','1.0.2','create_shipping_methods_table.php','2017-04-08 10:35:01'),(2552,'Istheweb.Shop','script','1.0.2','create_shipment_items_table.php','2017-04-08 10:35:01'),(2553,'Istheweb.Shop','script','1.0.2','create_shipments_table.php','2017-04-08 10:35:01'),(2554,'Istheweb.Shop','script','1.0.2','create_tax_categories_table.php','2017-04-08 10:35:01'),(2555,'Istheweb.Shop','script','1.0.2','create_tax_rates_table.php','2017-04-08 10:35:01'),(2556,'Istheweb.Shop','script','1.0.2','create_variants_table.php','2017-04-08 10:35:01'),(2557,'Istheweb.Shop','script','1.0.2','create_zones_table.php','2017-04-08 10:35:01'),(2558,'Istheweb.Shop','script','1.0.2','seed_order_statuses_table.php','2017-04-08 10:35:01'),(2559,'Istheweb.Shop','script','1.0.2','seed_spain_states_table.php','2017-04-08 10:35:01'),(2560,'Istheweb.Shop','script','1.0.2','seed_tables.php','2017-04-08 10:35:02'),(2561,'Istheweb.Shop','comment','1.0.2','Create Product Module Tables','2017-04-08 10:35:02'),(2562,'RainLab.Translate','comment','1.2.11','Fixes translation not working with partials loaded via AJAX','2017-04-10 16:11:37');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (2,'RainLab.User','1.3.4','2017-03-25 08:56:50',0,0),(3,'RainLab.Location','1.0.7','2017-03-25 08:57:15',0,0),(4,'RainLab.Blog','1.2.16','2017-04-01 07:36:53',0,0),(5,'RainLab.Translate','1.2.11','2017-04-10 16:11:37',0,0),(6,'RainLab.Pages','1.2.16','2017-04-07 15:36:42',0,0),(7,'RainLab.GoogleAnalytics','1.2.1','2017-03-25 09:05:49',0,0),(8,'RainLab.Forum','1.1.1','2017-03-25 09:06:19',0,0),(9,'October.Drivers','1.1.1','2017-03-25 09:08:03',0,0),(10,'Istheweb.IsPdf','1.0.2','2017-03-25 09:48:34',0,0),(50,'Istheweb.Connect','1.0.2','2017-03-26 11:08:37',0,0),(104,'Istheweb.IsCorporate','1.0.2','2017-03-27 18:23:02',0,0),(108,'October.Demo','1.0.1','2017-04-01 07:36:54',0,0),(129,'Istheweb.Shop','1.0.2','2017-04-08 10:35:02',0,0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
INSERT INTO `system_request_logs` VALUES (1,404,'http://192.168.33.10/favicon.ico','[\"http:\\/\\/192.168.33.10\\/backend\\/backend\\/auth\\/signin\"]',5,'2017-03-25 08:53:53','2017-03-28 17:20:41');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'backend_brand_settings','{\"app_name\":\"IsTheWeb Platform\",\"app_tagline\":\"Tu empresa en la Red\",\"primary_color\":\"#34495e\",\"secondary_color\":\"#e67e22\",\"accent_color\":\"#3498db\",\"menu_mode\":\"inline\",\"custom_css\":\"\"}'),(2,'istheweb_system_shop_settings','{\"name\":\"Isthweb Shop\",\"owner\":\"Andr\\u00e9s Rangel\",\"invoiceTemplates\":\"invoice-template\",\"default_customer_pass\":\"12345\",\"checkoutSteps\":\"2\",\"country\":\"1\",\"state\":\"445\",\"currency\":\"1\",\"locale\":\"2\",\"length\":\"centimeter\",\"weight\":\"kilogram\",\"tax\":\"1\",\"cash\":\"1\",\"cash_fee\":\"6\",\"paypal\":\"1\",\"paypal_client_id\":\"AfrxRYym-GH9DgpQlo42ZONvFLtQNXU48H7EmJmX-5mXrweN59xAVav2YgBe8o6DBdpB7VPemd3Fl5Ub\",\"paypal_secret_id\":\"EE5J5rxPySdBBt6DpER5tJF7Qw4LLNhrjNWbX1ezHGTa80lvkoHCj_73ZMWXTh9NLjCQa70SRFppq96x\",\"paypal_url_ok\":\"http:\\/\\/istheweb.com\\/shop\\/checkout\\/?success=true\",\"paypal_url_ko\":\"http:\\/\\/istheweb.com\\/shop\\/checkout\\/?success=false\",\"paypal_fee\":\"2\",\"tpv\":\"0\",\"tpv_fuc\":\"\",\"tpv_terminal\":\"\",\"tpv_url_ok\":\"\",\"tpv_url_ko\":\"\",\"tpv_signature\":\"\",\"tpv_fee\":\"\",\"stripe\":\"1\",\"stripe_api_id\":\"sk_test_oYCrozeSUArnP7bQuwXBelRs\",\"stripe_publishable_key\":\"pk_test_z8YEe39Hldwsz5ANW3uHCD4R\",\"stripe_fee\":\"2\",\"social\":[],\"order_reference\":\"2000000\",\"opening-times\":\"\",\"comments\":\"\"}'),(3,'istheweb_system_company_settings','{\"name\":\"Istheweb\",\"slogan\":\"Simplemente la red\",\"address\":\"\",\"phone\":\"\",\"email\":\"soporte@istheweb.com\",\"company_name_nid\":\"XTR\",\"company_nid\":\"\",\"social\":[],\"is_year_invoice\":\"1\",\"reset_year_invoice\":\"1\",\"invoice_number\":\"20000000\",\"legal_invoice_text\":\"\",\"footer_invoice_text\":\"\",\"position_year_number\":\"before\",\"website\":\"http:\\/\\/istheweb.com\"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_groups_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'Guest','guest','Default group for guest users.','2017-03-25 08:56:50','2017-03-25 08:56:50'),(2,'Registered','registered','Default group for registered users.','2017-03-25 08:56:50','2017-03-25 08:56:50'),(3,'Clients','clients','Default group for client users.','2017-03-26 11:14:11','2017-03-26 11:14:11');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_throttle`
--

DROP TABLE IF EXISTS `user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_throttle`
--

LOCK TABLES `user_throttle` WRITE;
/*!40000 ALTER TABLE `user_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_login_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Andrés','arangeltorres@gmail.com','$2y$10$bBVCrho4yuEVkaaa9Yr1tufYFfNPEd1Uy91p.MfyGq6LCksFjW35u',NULL,NULL,NULL,NULL,1,'2017-03-27 18:49:31',NULL,'2017-03-27 18:49:31','2017-03-27 18:49:31','arangeltorres@gmail.com','Torres',NULL,NULL,0,0),(2,'Pedro','arangel.apps@gmail.com','$2y$10$blzvKaGw1SGY5KT65fzIOOhewKWoiWC54XF9aAdtjcBXa611oJf4y',NULL,NULL,NULL,NULL,1,'2017-03-27 19:16:35',NULL,'2017-03-27 19:16:35','2017-03-27 19:16:35','arangel.apps@gmail.com','Martínez',NULL,NULL,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,3),(2,3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  7:28:45
