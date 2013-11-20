-- MySQL dump 10.13  Distrib 5.5.29, for osx10.6 (i386)
--
-- Host: localhost    Database: base
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0'),(2,'Structure_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','3.3.13'),(3,'Vl_entry_url_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.3');
/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Channel','submit_entry',0),(2,'Channel','filemanager_endpoint',0),(3,'Channel','smiley_pop',0),(4,'Channel','combo_loader',0),(5,'Member','registration_form',0),(6,'Member','register_member',0),(7,'Member','activate_member',0),(8,'Member','member_login',0),(9,'Member','member_logout',0),(10,'Member','send_reset_token',0),(11,'Member','process_reset_password',0),(12,'Member','send_member_email',0),(13,'Member','update_un_pw',0),(14,'Member','member_search',0),(15,'Member','member_delete',0),(16,'Rte','get_js',0),(17,'Structure','ajax_move_set_data',0),(18,'Zoo_flexible_admin','ajax_preview',0),(19,'Zoo_flexible_admin','ajax_load_tree',0),(20,'Zoo_flexible_admin','ajax_load_settings',0),(21,'Zoo_flexible_admin','ajax_save_tree',0),(22,'Zoo_flexible_admin','ajax_remove_tree',0),(23,'Zoo_flexible_admin','ajax_copy_tree',0),(24,'Ce_cache','break_cache',0),(25,'Ce_cache_mcp','ajax_get_level',0),(26,'Ce_cache_mcp','ajax_delete',0),(27,'Channel_images','channel_images_router',0),(28,'Channel_images','locked_image_url',0),(29,'Channel_images','simple_image_url',0),(30,'Assets_mcp','upload_file',0),(31,'Assets_mcp','get_files_view_by_folders',0),(32,'Assets_mcp','get_props',0),(33,'Assets_mcp','save_props',0),(34,'Assets_mcp','get_ordered_files_view',0),(35,'Assets_mcp','get_session_id',0),(36,'Assets_mcp','start_index',0),(37,'Assets_mcp','perform_index',0),(38,'Assets_mcp','finish_index',0),(39,'Assets_mcp','get_s3_buckets',0),(40,'Assets_mcp','get_gc_buckets',0),(41,'Assets_mcp','get_rs_containers',0),(42,'Assets_mcp','move_folder',0),(43,'Assets_mcp','rename_folder',0),(44,'Assets_mcp','create_folder',0),(45,'Assets_mcp','delete_folder',0),(46,'Assets_mcp','view_file',0),(47,'Assets_mcp','move_file',0),(48,'Assets_mcp','delete_file',0),(49,'Assets_mcp','view_thumbnail',0),(50,'Assets_mcp','build_sheet',0),(51,'Assets_mcp','get_selected_files',0);
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_files`
--

DROP TABLE IF EXISTS `exp_assets_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned NOT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` int(10) unsigned DEFAULT NULL,
  `alt_text` tinytext,
  `caption` tinytext,
  `author` tinytext,
  `desc` text,
  `location` tinytext,
  `keywords` text,
  `date_modified` int(10) unsigned DEFAULT NULL,
  `kind` varchar(5) DEFAULT NULL,
  `width` int(2) DEFAULT NULL,
  `height` int(2) DEFAULT NULL,
  `size` int(3) DEFAULT NULL,
  `search_keywords` text,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `unq_folder_id__file_name` (`folder_id`,`file_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_folders`
--

DROP TABLE IF EXISTS `exp_assets_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_folders` (
  `folder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `folder_name` varchar(255) NOT NULL,
  `full_path` varchar(255) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__parent_id__folder_name` (`source_type`,`source_id`,`filedir_id`,`parent_id`,`folder_name`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__full_path` (`source_type`,`source_id`,`filedir_id`,`full_path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_index_data`
--

DROP TABLE IF EXISTS `exp_assets_index_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_index_data` (
  `session_id` char(36) DEFAULT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `offset` int(10) unsigned DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `type` enum('file','folder') DEFAULT NULL,
  `record_id` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `unq__session_id__source_type__source_id__offset` (`session_id`,`source_type`,`source_id`,`offset`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_index_data`
--

LOCK TABLES `exp_assets_index_data` WRITE;
/*!40000 ALTER TABLE `exp_assets_index_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_index_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_rackspace_access`
--

DROP TABLE IF EXISTS `exp_assets_rackspace_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_rackspace_access` (
  `connection_key` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `storage_url` varchar(255) NOT NULL,
  `cdn_url` varchar(255) NOT NULL,
  PRIMARY KEY (`connection_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_rackspace_access`
--

LOCK TABLES `exp_assets_rackspace_access` WRITE;
/*!40000 ALTER TABLE `exp_assets_rackspace_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_rackspace_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_selections`
--

DROP TABLE IF EXISTS `exp_assets_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_selections` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `col_id` int(6) unsigned DEFAULT NULL,
  `row_id` int(10) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `sort_order` int(4) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  KEY `file_id` (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `col_id` (`col_id`),
  KEY `row_id` (`row_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_selections`
--

LOCK TABLES `exp_assets_selections` WRITE;
/*!40000 ALTER TABLE `exp_assets_selections` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_sources`
--

DROP TABLE IF EXISTS `exp_assets_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 's3',
  `name` varchar(255) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_sources`
--

LOCK TABLES `exp_assets_sources` WRITE;
/*!40000 ALTER TABLE `exp_assets_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ce_cache_breaking`
--

DROP TABLE IF EXISTS `exp_ce_cache_breaking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_ce_cache_breaking` (
  `channel_id` int(10) unsigned NOT NULL,
  `tags` text,
  `items` text,
  `refresh_time` int(1) unsigned DEFAULT NULL,
  `refresh` varchar(1) DEFAULT 'n',
  PRIMARY KEY (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ce_cache_breaking`
--

LOCK TABLES `exp_ce_cache_breaking` WRITE;
/*!40000 ALTER TABLE `exp_ce_cache_breaking` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ce_cache_breaking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ce_cache_db_driver`
--

DROP TABLE IF EXISTS `exp_ce_cache_db_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_ce_cache_db_driver` (
  `id` varchar(250) NOT NULL,
  `ttl` int(10) NOT NULL DEFAULT '360',
  `made` int(10) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ce_cache_db_driver`
--

LOCK TABLES `exp_ce_cache_db_driver` WRITE;
/*!40000 ALTER TABLE `exp_ce_cache_db_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ce_cache_db_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ce_cache_tagged_items`
--

DROP TABLE IF EXISTS `exp_ce_cache_tagged_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_ce_cache_tagged_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(250) NOT NULL,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ce_cache_tagged_items`
--

LOCK TABLES `exp_ce_cache_tagged_items` WRITE;
/*!40000 ALTER TABLE `exp_ce_cache_tagged_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ce_cache_tagged_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_form_settings`
--

DROP TABLE IF EXISTS `exp_channel_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_form_settings`
--

LOCK TABLES `exp_channel_form_settings` WRITE;
/*!40000 ALTER TABLE `exp_channel_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_images`
--

DROP TABLE IF EXISTS `exp_channel_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_images` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` tinyint(3) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `field_id` mediumint(8) unsigned DEFAULT '0',
  `channel_id` tinyint(3) unsigned DEFAULT '0',
  `member_id` int(10) unsigned DEFAULT '0',
  `is_draft` tinyint(3) unsigned DEFAULT '0',
  `link_image_id` int(10) unsigned DEFAULT '0',
  `link_entry_id` int(10) unsigned DEFAULT '0',
  `link_channel_id` int(10) unsigned DEFAULT '0',
  `link_field_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) unsigned DEFAULT '0',
  `cover` tinyint(1) unsigned DEFAULT '0',
  `image_order` smallint(5) unsigned DEFAULT '1',
  `filename` varchar(250) DEFAULT '',
  `extension` varchar(20) DEFAULT '',
  `filesize` int(10) unsigned DEFAULT '0',
  `mime` varchar(20) DEFAULT '',
  `width` smallint(6) DEFAULT '0',
  `height` smallint(6) DEFAULT '0',
  `title` varchar(250) DEFAULT '',
  `url_title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `category` varchar(250) DEFAULT '',
  `cifield_1` varchar(250) DEFAULT '',
  `cifield_2` varchar(250) DEFAULT '',
  `cifield_3` varchar(250) DEFAULT '',
  `cifield_4` varchar(250) DEFAULT '',
  `cifield_5` varchar(250) DEFAULT '',
  `sizes_metadata` varchar(250) DEFAULT '',
  `iptc` text,
  `exif` text,
  `xmp` text,
  PRIMARY KEY (`image_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_images`
--

LOCK TABLES `exp_channel_images` WRITE;
/*!40000 ALTER TABLE `exp_channel_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_content_types`
--

DROP TABLE IF EXISTS `exp_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_content_types`
--

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;
INSERT INTO `exp_content_types` VALUES (1,'grid'),(2,'channel');
/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'brian','127.0.0.1',1384885999,'Logged in'),(2,1,1,'brian','127.0.0.1',1384889808,'Logged in'),(3,1,1,'brian','127.0.0.1',1384897716,'Logged out'),(4,1,1,'brian','127.0.0.1',1384900172,'Logged in'),(5,1,1,'brian','127.0.0.1',1384906051,'Logged out');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_search_index`
--

LOCK TABLES `exp_cp_search_index` WRITE;
/*!40000 ALTER TABLE `exp_cp_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_cp_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y'),(3,'Structure_ext','entry_submission_redirect','entry_submission_redirect','',10,'3.3.13','y'),(4,'Structure_ext','cp_member_login','cp_member_login','',10,'3.3.13','y'),(5,'Structure_ext','sessions_start','sessions_start','',10,'3.3.13','y'),(6,'Structure_ext','channel_module_create_pagination','channel_module_create_pagination','',9,'3.3.13','y'),(7,'Structure_ext','wygwam_config','wygwam_config','',10,'3.3.13','y'),(8,'Structure_ext','core_template_route','core_template_route','',10,'3.3.13','y'),(9,'Structure_ext','entry_submission_end','entry_submission_end','',10,'3.3.13','y'),(10,'Structure_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','',10,'3.3.13','y'),(11,'Structure_ext','template_post_parse','template_post_parse','',10,'3.3.13','y'),(12,'Low_variables_ext','sessions_end','sessions_end','a:0:{}',2,'2.4.0','y'),(13,'Low_variables_ext','template_fetch_template','template_fetch_template','a:0:{}',2,'2.4.0','y'),(14,'Zoo_flexible_admin_ext','cp_css_end','cp_css_end','',1,'1.79','y'),(15,'Zoo_flexible_admin_ext','cp_js_end','cp_js_end','',1,'1.79','y'),(16,'Zoo_flexible_admin_ext','sessions_end','sessions_end','',1,'1.79','y'),(17,'Ce_cache_ext','submitted','entry_submission_end','a:0:{}',9,'1.10.1','y'),(18,'Ce_cache_ext','safecracker_submitted','safecracker_submit_entry_end','a:0:{}',9,'1.10.1','y'),(19,'Ce_cache_ext','deleted','delete_entries_start','a:0:{}',9,'1.10.1','y'),(20,'Ce_cache_ext','multi_updated','update_multi_entries_loop','a:0:{}',9,'1.10.1','y'),(21,'Ce_cache_ext','template_pre_parse','template_fetch_template','a:0:{}',9,'1.10.1','y'),(22,'Ce_cache_ext','comment_inserted','insert_comment_end','a:0:{}',9,'1.10.1','y'),(23,'Channel_images_ext','wygwam_config','wygwam_config','a:0:{}',100,'5.4.9','y'),(24,'Channel_images_ext','wygwam_before_display','wygwam_before_display','a:0:{}',100,'5.4.9','y'),(25,'Channel_images_ext','wygwam_before_save','wygwam_before_save','a:0:{}',100,'5.4.9','y'),(26,'Channel_images_ext','wygwam_before_replace','wygwam_before_replace','a:0:{}',100,'5.4.9','y'),(27,'Channel_images_ext','editor_before_display','editor_before_display','a:0:{}',100,'5.4.9','y'),(28,'Channel_images_ext','editor_before_save','editor_before_save','a:0:{}',100,'5.4.9','y'),(29,'Channel_images_ext','editor_before_replace','editor_before_replace','a:0:{}',100,'5.4.9','y'),(30,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.2.2','y'),(31,'Assets_ext','file_after_save','file_after_save','',9,'2.2.2','y'),(32,'Assets_ext','files_after_delete','files_after_delete','',8,'2.2.2','y'),(33,'Vl_entry_url_ext','dummy','entry_submission_absolute_end','a:0:{}',10,'1.3','y'),(34,'Freebie_ext','Freebie_ext','sessions_start','a:7:{s:9:\"to_ignore\";s:21:\"success|error|preview\";s:13:\"ignore_beyond\";s:0:\"\";s:14:\"break_category\";s:2:\"no\";s:14:\"remove_numbers\";s:2:\"no\";s:12:\"always_parse\";s:0:\"\";s:23:\"always_parse_pagination\";s:2:\"no\";s:13:\"cache_cleared\";s:3:\"yes\";}',10,'0.2.2','y'),(35,'Republic_structure_tweaks_ext','cp_js_end','cp_js_end','',10,'1.1.2','y'),(36,'Stash_ext','template_fetch_template','template_fetch_template','',10,'2.4.6','y'),(37,'Stash_ext','template_post_parse','template_post_parse','',10,'2.4.6','y'),(38,'Dg_structure_search_ext','cp_js_end','cp_js_end','',10,'0.2.1','y'),(39,'Superfish_admin_ext','cp_menu_array','cp_menu_array','a:0:{}',10,'0.1','y');
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'grid','1.0','YTowOnt9','n'),(7,'multi_select','1.0','YTowOnt9','n'),(8,'checkboxes','1.0','YTowOnt9','n'),(9,'radio','1.0','YTowOnt9','n'),(10,'relationship','1.0','YTowOnt9','n'),(11,'rte','1.0','YTowOnt9','n'),(12,'structure','3.3.13','YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9','n'),(13,'low_variables','2.4.0','YTowOnt9','n'),(14,'channel_images','5.4.9','YTowOnt9','n'),(15,'assets','2.2.2','YTowOnt9','y'),(16,'wygwam','3.2.2','YTowOnt9','y'),(17,'fieldpack_checkboxes','2.1.1','YTowOnt9','n'),(18,'fieldpack_dropdown','2.1.1','YTowOnt9','n'),(19,'fieldpack_list','2.1.1','YTowOnt9','n'),(20,'fieldpack_multiselect','2.1.1','YTowOnt9','n'),(21,'fieldpack_pill','2.1.1','YTowOnt9','n'),(22,'fieldpack_radio_buttons','2.1.1','YTowOnt9','n'),(23,'fieldpack_switch','2.1.1','YTowOnt9','n');
/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_categories`
--

LOCK TABLES `exp_file_categories` WRITE;
/*!40000 ALTER TABLE `exp_file_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_watermarks`
--

LOCK TABLES `exp_file_watermarks` WRITE;
/*!40000 ALTER TABLE `exp_file_watermarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_watermarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_grid_columns`
--

DROP TABLE IF EXISTS `exp_grid_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_grid_columns`
--

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_low_variable_groups`
--

DROP TABLE IF EXISTS `exp_low_variable_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_low_variable_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL DEFAULT '1',
  `group_label` varchar(100) NOT NULL DEFAULT '',
  `group_notes` text NOT NULL,
  `group_order` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_low_variable_groups`
--

LOCK TABLES `exp_low_variable_groups` WRITE;
/*!40000 ALTER TABLE `exp_low_variable_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_low_variable_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_low_variables`
--

DROP TABLE IF EXISTS `exp_low_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_low_variables` (
  `variable_id` int(6) unsigned NOT NULL,
  `group_id` int(6) unsigned NOT NULL DEFAULT '0',
  `variable_label` varchar(100) NOT NULL DEFAULT '',
  `variable_notes` text NOT NULL,
  `variable_type` varchar(50) NOT NULL DEFAULT 'low_textarea',
  `variable_settings` text NOT NULL,
  `variable_order` int(4) unsigned NOT NULL DEFAULT '0',
  `early_parsing` char(1) NOT NULL DEFAULT 'n',
  `is_hidden` char(1) NOT NULL DEFAULT 'n',
  `save_as_file` char(1) NOT NULL DEFAULT 'n',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_low_variables`
--

LOCK TABLES `exp_low_variables` WRITE;
/*!40000 ALTER TABLE `exp_low_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_low_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_homepage`
--

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` VALUES (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0);
/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'brian','Brian','fb8b34bf87b6f801605a2b1d23b0231e0ab338ac3b0b34a706db0f9cf1ec630addeb47e7fab843b0ce07994668e3c952c3e0a1f3a75ddd0c68486e590116e019','yQT^Juxd_o{h\"}e%3\"jamkQc&wp#c=r(NO5uq\"S+*YCpg3\'\'%E0@%jrIU&ETZ\"BOibvV)o^n)wlD<eyN55lxz9}#k)evb1P`{c,z_-?4}GC4-<#$g`.\"haqw].<0C{nV','615d2f3328b9026ed2931baf4622cb53320400dc','e81f1145ab3096f493d3b7ccb2a93e9355d63aae',NULL,'brianwhitton@me.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1384880532,1384885999,1384906051,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/New_York','us',NULL,NULL,NULL,NULL,'28',NULL,'18','',NULL,'n',0,'y',0);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  `settings` text,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Jquery','1.0','n','n',NULL),(2,'Channel','2.0.1','n','n',NULL),(3,'Member','2.1','n','n',NULL),(4,'Stats','2.0','n','n',NULL),(5,'Rte','1.0.1','y','n',NULL),(6,'Structure','3.3.13','y','y',NULL),(7,'Low_variables','2.4.0','y','n',NULL),(8,'Zoo_flexible_admin','1.79','y','n',NULL),(9,'Ce_cache','1.10.1','y','n',NULL),(10,'Channel_images','5.4.9','y','n',NULL),(11,'Assets','2.2.2','y','n',NULL),(12,'Wygwam','3.2.2','y','n',NULL),(13,'Reelocate','1.3','y','n',NULL),(14,'Stash','2.4.6','n','n',NULL);
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_remember_me`
--

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_tools`
--

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;
INSERT INTO `exp_rte_tools` VALUES (1,'Blockquote','Blockquote_rte','y'),(2,'Bold','Bold_rte','y'),(3,'Headings','Headings_rte','y'),(4,'Image','Image_rte','y'),(5,'Italic','Italic_rte','y'),(6,'Link','Link_rte','y'),(7,'Ordered List','Ordered_list_rte','y'),(8,'Underline','Underline_rte','y'),(9,'Unordered List','Unordered_list_rte','y'),(10,'View Source','View_source_rte','y'),(11,'Channel_images','Channel_images_rte','y');
/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_toolsets`
--

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;
INSERT INTO `exp_rte_toolsets` VALUES (1,0,'Default','3|2|5|1|9|7|6|4|10','y');
/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  `used` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1,1384880869,'0','e332bcfee9e9c774c76d311017af860143caac5b',0),(2,1384885154,'0','36a44699eb05d3d8ffcc5346cdc9ddcacfe4d7e5',0),(3,1384885767,'0','fe842524b4649920ebc16ae209a188e287a96689',0),(4,1384885996,'0','344475fe8b397cd918c5f6e6a956125b029d753d',0),(5,1384885996,'0','d3f2310fbef64187fd48ada01004be510d58342d',0),(6,1384885996,'0','7e6afd05bdbc2a85e533fd040cfe4a963179f761',1),(7,1384885999,'0','acd4d7b182c5db79ea0357bd4a529efa74a5d251',0),(8,1384885999,'49c28988bef2d8e224380a80a11c6099ba87bf74','fc41d7832c0b696c309b1df77fd42ae018dce6f4',0),(9,1384886006,'49c28988bef2d8e224380a80a11c6099ba87bf74','584428375a64d629068052424e93d4d8096a65b6',0),(10,1384886006,'49c28988bef2d8e224380a80a11c6099ba87bf74','346fb11b0228f55f73d822f471723989266633c0',0),(11,1384886009,'49c28988bef2d8e224380a80a11c6099ba87bf74','bb171750242ae961b63c9c05bf1eda7733bf60d5',0),(12,1384887845,'49c28988bef2d8e224380a80a11c6099ba87bf74','69372151b1d110a2a1937ed9cf378d0060d5a0f5',0),(13,1384889803,'49c28988bef2d8e224380a80a11c6099ba87bf74','a26542a5b89ab8f1de792a73ed9ec098a0a9ccb0',0),(14,1384889805,'0','200ea9306223f91c3862fb0c65952096c493a234',0),(15,1384889805,'0','7ec88ebf398360d9a7929e9589658af8f8f705c1',0),(16,1384889805,'0','5a485d365c48a1d49308e7328bada6b764376765',1),(17,1384889808,'0','07df41c4aa3f7a539f3d038cda48401cbc20bcf5',0),(18,1384889808,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','8c7a870a21931e9bb3f11d417efad8f29f8ff8d4',0),(19,1384889820,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4bf4f9cf885e071990a697e4e16a115609ffa53c',0),(20,1384889828,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','754d68759ece50222fd8c8330aa570a10702beb0',1),(21,1384889846,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','38e63a9e59af2306c9fec86496c4f525f7a556c6',0),(22,1384889846,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','151a048dc67644c8ec2ed8e8193dcbc4c46721c5',0),(23,1384889862,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','6ee4443f3eb79017f74dc119d9cad4ba88eddf57',1),(24,1384889872,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','ebb7b053384aa8e52f68574fd36bcd9b03a4edc4',0),(25,1384889872,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','0e7e95a146551211e4d26279749f5c8ed00a43f2',0),(26,1384889875,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','96ac52a2d7120aafbd16e9c24a440304fae28cb8',0),(27,1384889890,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','554e4f37e1e11178a056b29978754d6cab48899d',1),(28,1384889891,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','362f82ae8394fd95f354682117e6e7f01cb828cd',0),(29,1384889893,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','313e954b94ca101b2ad182cedd1e412a63389b1e',0),(30,1384889893,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','530739be41d12fd1fb19ecb0677d0fa25915673c',0),(31,1384889903,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','293401f7ca5ae3d9615c8cd2ae93af0fecd57bea',0),(32,1384889912,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','f821ffd13aee710ca6aff49f4f28c07256d5ca5d',0),(33,1384889936,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','9079ca01cf59470f95b72415ddd74b7ba8fa2e1b',1),(34,1384889939,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','126b45917d173076325935faaf94494a44ff349d',0),(35,1384889939,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','b000d93b2e9bdc8666196285662a4327d5ae417c',0),(36,1384890448,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','d56dca8061ee6b527b0e096000a19fd24cd0f33b',0),(37,1384890451,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','23231c5f89c8f50c1cb0e918f5e2f91675e7b5a1',0),(38,1384890451,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4ab73895f034cfc221050f809ffe481554d6373c',1),(39,1384890478,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','6a1e2311789b1208d1bb7a9718aa8fb43213405a',0),(40,1384890479,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','a27582d70f750f323eeaff737b99d33657aa40ad',0),(41,1384890583,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','bf44d0a1867d3394fa16a10c7201cd2c0400718e',0),(42,1384890586,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','023833ab5d9d085e1e52f948bbcced925e94a54f',0),(43,1384890586,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','62afecd8bf0444628489c80b6b3600f5ac062591',1),(44,1384890590,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4947d1d40c3caa4ffc37d6fd7dc90a121a0436fe',0),(45,1384890590,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','440c3c4206f5fa71fc5cf6c86cc7331e9570559a',0),(46,1384890605,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','a5101eb496fe4da94ad9cd6e350cce40182f40dd',0),(47,1384890611,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','cce71d7e4547db48ab6d5b1c18c7152c29bd822a',0),(48,1384890619,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','831deaef01556b7fbc74758e91438c85a3f3766a',0),(49,1384890622,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','fa78c0a8426ff8ee812d24a3f9a6982f2d1e12ce',1),(50,1384890673,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','dc876e0464f888aa7419951528073ac5b013c0dc',0),(51,1384890673,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','5ce2a2eaef567f8e99aa6e1dbbb940de00a00f3c',1),(52,1384890787,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','8a2c8c21666e73d6e6096c17396a6afaea5fe17c',0),(53,1384890787,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','997d3e28c20853c6e3d5479821b5c9f0f0f4f7f1',0),(54,1384890869,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4e39f4ffce08bb141013a350fdb75fcf3b056705',0),(55,1384890875,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','0a4fa3c6c5c4a7d21a65eb1db66d74083a6834ac',0),(56,1384890879,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','c9ad1317f53a3718260de6f81d30b386850fccda',1),(57,1384890883,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','d131a66ef0604d12859fd5f96712ab10a4ad8f2b',0),(58,1384890883,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','295e8fdbbcade49a67555a139b03fc0491f4d5fd',0),(59,1384890892,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','059dd03a4b3adf782273cf813909e2545695160e',0),(60,1384890975,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','566e53287f6f4d7e00a2b42efe980429db2e2da8',0),(61,1384890978,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','69cdd290a131e98592d09be61ed8feac87675449',0),(62,1384890989,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','d52838b5a95dba03ec1b22d40fa636c416b5a35d',0),(63,1384890995,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','e326118bb2903090c38d915e29ca727aa2e3be78',0),(64,1384892210,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','0a3fc3240a09d3d763840e8a2613bc962d4cda84',0),(65,1384892220,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','88788bb094c593df0927b1ed4c066cca5b5de01b',0),(66,1384892222,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','edd144b96988b62e91a3ed76e29686c534030276',0),(67,1384892315,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','b2e6b83db4561ddb4831146a8a6438a7caa2acc4',0),(68,1384892318,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','ebf21096ead19e391b199fcbb168c3e90c31ecbc',0),(69,1384892318,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','fe1ca3f2c495b21905676a585d1bdc3fbad3f868',1),(70,1384892320,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','6b87f188ea16ae6d85b045551998b8acc6685216',0),(71,1384892320,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','5f069b1cd0f3858d9c1c4074a91a104775938f85',0),(72,1384892599,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','e7aac2370ae6922691bba168c37a52c74b275b02',0),(73,1384892602,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','416927be18c9210d3cdf3f46c3d9419a30c65eb2',0),(74,1384892602,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','a2e25f00da29c49928d4af285730b924efeda890',1),(75,1384892604,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','b7bfc3910add6fb8ceb69c60653c67febcd84d2b',0),(76,1384892604,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','35c628dd67d942025ce61cad2d65e4edc91022d2',0),(77,1384892607,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','c874c44c940485f2d1b26a6876d70bc3b084278e',0),(78,1384892609,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4627f82d406b7118fd6d523bc460ac16705ad6bc',0),(79,1384892872,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','f27e7892579c456566112cefd1707918c4bd7959',0),(80,1384892887,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','42eec3dcd041d9f6b88fe93522125cae1499b885',0),(81,1384892935,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','bbd8a9fd753f879555b0e657bba3682462ac708c',0),(82,1384892944,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','715672796bcae577c91157d03ce3eccd459e5131',0),(83,1384892947,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','11ae12d6e6d7c6eb842017412b4e0d2677ffd309',0),(84,1384892955,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','cd99c8a98fbb50c30a637a764a562be07447148c',0),(85,1384893317,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','f5b9bfe15e3b265f635ead3ed4929e18f699af6d',0),(86,1384893320,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','5639d91fa830dd7bf240064350d4b3bb156a0dd6',0),(87,1384893320,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','0d7182e3678f9427518abbeb5c718a7f7a5a4e26',1),(88,1384893323,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','ec02db0a2d9855d72d1c2f1e0a76d5e943519834',0),(89,1384893323,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','b19f268d3140eb89914fdbb29ec179431bef3321',0),(90,1384893335,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','6879ed5b4d2e48a36889606d5bc91e8ad90d93ae',0),(91,1384893336,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','4d7db1ec5fe70abde0fd061a3bca3d82b11a70cc',0),(92,1384893337,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','2585999a3a4818ea4dbd2383268f36ea8c9d881d',1),(93,1384893338,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','678b22f65aa11f16525b851f2bbeb67ed3797e24',0),(94,1384893338,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','f9b2494f74c9fdd721712fee74cc56ea068b9b75',0),(95,1384893340,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','c5537871e80cfbe9c62908fbb272d6bddb600e62',0),(96,1384893353,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','31ceccd3bf124f7b6019514c59590382572185eb',0),(97,1384893354,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','0f525a571a7e205f71a211f7a22837087c7a5a74',0),(98,1384893361,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','d3622db76a371a69a74abaacae91321af7f18cce',1),(99,1384893361,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','c8e63c3bdb2a65766a8a52da0e91a018b12786af',0),(100,1384893361,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','e7fe61f0e4c9c9bcd89da352aef7293d3a0fc1f3',0),(101,1384893367,'c6f741b19dd3f0c04f6aeb374259fc83f8708d84','5aa2a0de0454d8fc2ce7e59475aca46ced65cf64',0),(102,1384893563,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','877eca4a37ab598515dc4a59e05e4e94ed8ba456',0),(103,1384893565,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','e3cebc883b64e7c67409fc0cac10743574490095',0),(104,1384893565,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','a496e7a5dd5113d764a9aee503c5a001b639fe62',1),(105,1384893567,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','3aef0937cb0b02da27b997fbce6be03fdf6078bc',0),(106,1384893568,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','2af22b3df1a7099f67fd94b2199c295d4babb5cb',0),(107,1384893809,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','c8e990211578b87189cd1e2773330a1825ced8b1',0),(108,1384893811,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','a8f110a834addc0c1cde05c50faad1586e6aa613',0),(109,1384893811,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','cc01572c4eddd93245f7234aacd875101ab68b73',1),(110,1384893813,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','bea60dfb4cd3119c57b3eeb2bf598202f1a5cdb6',0),(111,1384893813,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','c20a57e8c625e74a4e2c2920fa2292e1c9b65305',0),(112,1384893819,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','1547548c3bc99dba2decfbb648f866abddefc0a0',1),(113,1384893819,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','83e221b3e91e471158ae1fbe3b55fa0c308dddb0',0),(114,1384893823,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','41398eb93c7b8a51f4dda02c196d408b0f457d42',0),(115,1384894032,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','37f3305b58ed40f1f7219a1ef0bd6130df77ce3a',0),(116,1384894036,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','72cf0393168c3b549f613623257e860faddb8e19',0),(117,1384894036,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','f52fbe9b7e4e9d8d781d27af3360e07cd130bc92',0),(118,1384894062,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','80c04c34b856f375758a7e9b36e308090bbf9182',0),(119,1384894085,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','d32fb983a7b3f859ec4618024555e9eea33b655c',0),(120,1384894085,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','684251e7fa5b3771a1d9e3159062b290784a1cfc',1),(121,1384894087,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','9a89eebcf1769e49c1a4d825e44a3c07ce6a8876',0),(122,1384894087,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','608335a6d41860d1a6342f4ba06f2dc34d9ac477',0),(123,1384894107,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','aa35b22ef3c0722ce7ad8f066f16ca2c326a84ce',0),(124,1384894447,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','b732a378cfb4919613f24f283af87681ec73a850',0),(125,1384894449,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','b8bd322c683244e4fe143fe353a0d146c36c8df9',0),(126,1384894449,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','08556259b43efc623b3824fa764856acc4eb2ac3',1),(127,1384894451,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','a645a78adafffc7b31ee556be9b5ab3b370111b3',0),(128,1384894451,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','5bebd48ea6fb136641465720398776cf04a159bd',0),(129,1384894578,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','112d02ffd5abc6a5e01595d31a5936a7ffe7afba',0),(130,1384894581,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','835142de1d9f8aa4a33bd86238cf429060e38f7d',0),(131,1384894581,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','37b8eb89e72504bedc795fb607eeebedb67cf17b',0),(132,1384894741,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','55b9f8114b81712268fc53ed4c1fbfc39933f333',0),(133,1384894743,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','71cd9375c9f4c01a44723e7b3a2852605a7833d6',0),(134,1384894743,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','186b7b408b652f8d1363382764ea26802acb27a6',1),(135,1384894746,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','343c0ace9a434c36727c47d0930e79e0d439b0d7',0),(136,1384894746,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','63a63c75c206157d4db9579d342c83ac67584e10',0),(137,1384894879,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','1bcae2df9b32454315e3445e8b02d8ae27458553',0),(138,1384894881,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','1b9e4c1bd2bec4680f81ed99b656e0b1b160504e',0),(139,1384894881,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','58bc8f956a9fee71ee8893917571a28c3af23f8a',0),(140,1384894975,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','1defd5e02e2a4dc915986f73dc0c945f1af07732',0),(141,1384894977,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','f2b745c032c3681df5a2289d4983e734aa42f9bf',0),(142,1384894978,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','a83f06028de38c55bc3566e2012239f0e5817c88',0),(143,1384895063,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','d1d93e3d6b5b75bfb082d47b52db863669c19a3d',0),(144,1384895198,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','e9088259d84ffc7ffde629e3edde9e4327a88a3a',0),(145,1384895200,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','282b3eba366605a6f2677d275cacdbfbfd24bdec',0),(146,1384895200,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','0c783685a5543f736cda85ce4efabae000e5f932',0),(147,1384895201,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','86e209ae7149bf1c10998b90419fc5e5b2ea2cbb',0),(148,1384895202,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','67ba377b84e63acd829a2176f051b588863735b9',0),(149,1384895203,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','b3847185d625522ef79b1c310ebc5e6aabbe3811',0),(150,1384895203,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','82c677e1812828b12e290327c4f8b0ba4992431a',0),(151,1384895204,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','a2b913c8d33bfecb2b031dd0e702f02766168b57',0),(152,1384895204,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','26044e797e14d619d93d48959112e21d65c4bf86',0),(153,1384895205,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','2f0c8a96e090e984564bcc020c5ddd7e8cc2f119',0),(154,1384895205,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','0486a322b30fbbc394631917873f4a182cea6cd3',0),(155,1384895206,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','c3ea848a642cb656d4e26d2ad570c9e4c440c316',0),(156,1384895206,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','563632f5b8fd2005443dda6ba9d45b400c0959da',0),(157,1384895207,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','151d200b10b2eb9c9cecaabb778083af0651c1bd',0),(158,1384895207,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','61a2bf21dc1c9835c064f3e84e38e321b3d653bf',0),(159,1384895250,'a1ca009207ca6ce330b2cc9f7b533294efed42c5','d32287b869eecfe7095ad54269c38279a5d33a1d',0),(160,1384897716,'180f49c0d1e5db539d863e9545e8ca8bf23d19b1','ae2aa219bac9489c6d7cde69c2ff6b881703a584',0),(161,1384897717,'0','4d65400f0d5109221bf30c7d317dc188f7f03d1b',0),(162,1384897731,'0','0688e118e9100447a11091f3f0a2540307836dd8',0),(163,1384897731,'0','833768573824495f877d78bab081ef5f95692381',1),(164,1384900172,'0','b67805e643fb68cdea75809fb3af3d30b9c35132',0),(165,1384900173,'6b691630902953ba2c213acfb7dbce38ba415f0b','fc3b2083af4fbcdc0cd59835856f20895abbd964',0),(166,1384900177,'6b691630902953ba2c213acfb7dbce38ba415f0b','2013d9674241bbb0a995c358ed44bf4f1a25b503',0),(167,1384900253,'6b691630902953ba2c213acfb7dbce38ba415f0b','de71c9d3a52fb6d383e30849d77482737d6c5742',0),(168,1384900414,'6b691630902953ba2c213acfb7dbce38ba415f0b','7442c824fb7bcddf5907ef94301f3d55003cff18',0),(169,1384900431,'6b691630902953ba2c213acfb7dbce38ba415f0b','87a089160e10680b76968e872158f6648bbfdf9e',0),(170,1384900434,'6b691630902953ba2c213acfb7dbce38ba415f0b','d91d8b9c56a8fb5a3d889da67710fc17fcd140ce',0),(171,1384900511,'6b691630902953ba2c213acfb7dbce38ba415f0b','584a01a4d10ad44de26d2662ffc87ecdf68bc385',0),(172,1384900640,'6b691630902953ba2c213acfb7dbce38ba415f0b','c628ea3a30b5bef9f0ccadef0df9f18c43a344e2',0),(173,1384901078,'6b691630902953ba2c213acfb7dbce38ba415f0b','41012818bc527afed5bff1222d07d17d388b68e9',0),(174,1384901090,'6b691630902953ba2c213acfb7dbce38ba415f0b','7998eb0ea1005b935f745ce9b5d1df746d51c186',0),(175,1384901092,'6b691630902953ba2c213acfb7dbce38ba415f0b','b73fb17f95f258cb0520c0a0ed74453555656cf2',0),(176,1384901111,'6b691630902953ba2c213acfb7dbce38ba415f0b','7974d84ae6c568c702a398838ec857d1b3887802',0),(177,1384901115,'6b691630902953ba2c213acfb7dbce38ba415f0b','abc0ea36232e3703dede402bd0cedb17b5b03e66',1),(178,1384901117,'6b691630902953ba2c213acfb7dbce38ba415f0b','154e0c5457fc12e0b30f23791075357a437f747f',0),(179,1384901120,'6b691630902953ba2c213acfb7dbce38ba415f0b','5ef9915a166b5c1de34b0d63417ec63b7111bbcc',1),(180,1384901128,'6b691630902953ba2c213acfb7dbce38ba415f0b','3c5c14c4bfd225f9e51dcac39d5b40474fef5e64',0),(181,1384901128,'6b691630902953ba2c213acfb7dbce38ba415f0b','cd63cfc29fe3b375f461785101897df7e02055b3',0),(182,1384901130,'6b691630902953ba2c213acfb7dbce38ba415f0b','8a58e64d4f5c9ada06927402841fc4de021707b7',0),(183,1384901469,'6b691630902953ba2c213acfb7dbce38ba415f0b','6b38e5886c9544f45421a05bb747d2dce814191d',0),(184,1384901470,'6b691630902953ba2c213acfb7dbce38ba415f0b','bc1fc3123e976a40c2e08ecdc73dbc23cd10ebc4',0),(185,1384901471,'6b691630902953ba2c213acfb7dbce38ba415f0b','5973caf702c7fb5262a57e71c07e71a663d1d50e',0),(186,1384901480,'6b691630902953ba2c213acfb7dbce38ba415f0b','dc8be4ff77be6f539fa079d7666dd85445c3eae1',0),(187,1384901505,'6b691630902953ba2c213acfb7dbce38ba415f0b','dc99fe4c66d607e47dd237fe3cf5f492922b2837',0),(188,1384901700,'6b691630902953ba2c213acfb7dbce38ba415f0b','347a0d9e665bd63e408df1b5441c4b2b35e55f71',0),(189,1384901702,'6b691630902953ba2c213acfb7dbce38ba415f0b','2aca544e0d23feb8bd4a5cc6a224163c235dc0b5',0),(190,1384902698,'6b691630902953ba2c213acfb7dbce38ba415f0b','34e5933ec0a97866eab0d0d35715f09121032d67',0),(191,1384902703,'6b691630902953ba2c213acfb7dbce38ba415f0b','e8ed7167f7c3d3e2eae5caaaf64128b7224ef63a',0),(192,1384902750,'6b691630902953ba2c213acfb7dbce38ba415f0b','8d5b07d79d14cc20e1c2a8feb5ae080a045d917e',0),(193,1384902755,'6b691630902953ba2c213acfb7dbce38ba415f0b','2a4d9896b5a09fc2cbd41b4c601299d925f0dbaa',0),(194,1384902761,'6b691630902953ba2c213acfb7dbce38ba415f0b','4c939c4c4272e837819f0b3d67c8075674c174ab',0),(195,1384902769,'6b691630902953ba2c213acfb7dbce38ba415f0b','e3dd49671e6ab1c95eb3b3c6e65bf1a464af7581',0),(196,1384902775,'6b691630902953ba2c213acfb7dbce38ba415f0b','4b303180f9cedf6eac005e67c8cbc95291ad20fa',0),(197,1384902779,'6b691630902953ba2c213acfb7dbce38ba415f0b','8e1084c71ea9fc3a567b0487dd4871d17dee8cc4',0),(198,1384902781,'6b691630902953ba2c213acfb7dbce38ba415f0b','597028c48f965d0b7f30723025101e848c7dfb1b',1),(199,1384902784,'6b691630902953ba2c213acfb7dbce38ba415f0b','7da5c9f6feaff9f4c03264c89fc34e3b7e8cc877',0),(200,1384902784,'6b691630902953ba2c213acfb7dbce38ba415f0b','fd67db04d66dd73c05ec219e5fbf7ca984595dcc',0),(201,1384902786,'6b691630902953ba2c213acfb7dbce38ba415f0b','55aa8d1e27ec2e8dcf9e0bc8ea31f40e9e59b2d8',0),(202,1384902787,'6b691630902953ba2c213acfb7dbce38ba415f0b','9b25312d6385a02d358e0cbb97bc93568fe9c7d0',1),(203,1384902789,'6b691630902953ba2c213acfb7dbce38ba415f0b','e2f816337ee444fc43dd5c85ebb3ab9bfa7e8e9f',0),(204,1384902789,'6b691630902953ba2c213acfb7dbce38ba415f0b','cbea9265bbe92bbc09ea08f68eb2b124c0843c65',0),(205,1384902794,'6b691630902953ba2c213acfb7dbce38ba415f0b','3bccbfb01c3cca4d9522c02054571ae25ae74e75',0),(206,1384902797,'6b691630902953ba2c213acfb7dbce38ba415f0b','89e580028cdc87e7b2a7f4820f92d3415ca22fdd',0),(207,1384902800,'6b691630902953ba2c213acfb7dbce38ba415f0b','23cc33effadf08e2e3118fb2fd743651287b1948',0),(208,1384902804,'6b691630902953ba2c213acfb7dbce38ba415f0b','704d37a57fc0d7c9cf5ffde982be966599ab3202',0),(209,1384906051,'364a424443b6452d80af8cf8b69e2c9128356a4e','2e51ca4e1a58833f7f5c70604f79b6eb5cfc0074',0),(210,1384906052,'0','e6cae343e08d0343cea1dd4174bd88399cdc72c4',0),(211,1384906066,'0','61efbf12e3abc5c3db039bbe4ea7863e6851688e',0),(212,1384906066,'0','e2760f339a8c8eeb43cc116884e547d21b37745c',0),(213,1384911994,'0','4d2bd8d63c1a04aeae5a34bc3840cb219ae6bfd4',0);
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` longtext,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'Base','default_site',NULL,'YTo4ODp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MTQ6Imh0dHA6Ly9lZS5kZXYvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjIxOiJodHRwOi8vZWUuZGV2L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoxODoiYndoaXR0b25AZ21haWwuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czozMDoiaHR0cDovL2VlLmRldi9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6NjU6Ii9MaWJyYXJ5L1dlYlNlcnZlci9Eb2N1bWVudHMvZWUtdGVtcGxhdGUvd2Vicm9vdC9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE2OiJBbWVyaWNhL05ld19Zb3JrIjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjEyOiJzZWN1cmVfZm9ybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjI5OiJodHRwOi8vZWUuZGV2L2ltYWdlcy9zbWlsZXlzLyI7czoxOToicmVjb3VudF9iYXRjaF90b3RhbCI7czo0OiIxMDAwIjtzOjE3OiJuZXdfdmVyc2lvbl9jaGVjayI7czoxOiJ5IjtzOjE3OiJlbmFibGVfdGhyb3R0bGluZyI7czoxOiJuIjtzOjE3OiJiYW5pc2hfbWFza2VkX2lwcyI7czoxOiJ5IjtzOjE0OiJtYXhfcGFnZV9sb2FkcyI7czoyOiIxMCI7czoxMzoidGltZV9pbnRlcnZhbCI7czoxOiI4IjtzOjEyOiJsb2Nrb3V0X3RpbWUiO3M6MjoiMzAiO3M6MTU6ImJhbmlzaG1lbnRfdHlwZSI7czo3OiJtZXNzYWdlIjtzOjE0OiJiYW5pc2htZW50X3VybCI7czowOiIiO3M6MTg6ImJhbmlzaG1lbnRfbWVzc2FnZSI7czo1MDoiWW91IGhhdmUgZXhjZWVkZWQgdGhlIGFsbG93ZWQgcGFnZSBsb2FkIGZyZXF1ZW5jeS4iO3M6MTc6ImVuYWJsZV9zZWFyY2hfbG9nIjtzOjE6InkiO3M6MTk6Im1heF9sb2dnZWRfc2VhcmNoZXMiO3M6MzoiNTAwIjtzOjE3OiJ0aGVtZV9mb2xkZXJfcGF0aCI7czo1NjoiL0xpYnJhcnkvV2ViU2VydmVyL0RvY3VtZW50cy9lZS10ZW1wbGF0ZS93ZWJyb290L3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjt9','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6Mjk6Imh0dHA6Ly9lZS5kZXYvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo2NDoiL0xpYnJhcnkvV2ViU2VydmVyL0RvY3VtZW50cy9lZS10ZW1wbGF0ZS93ZWJyb290L2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czozNToiaHR0cDovL2VlLmRldi9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6NzA6Ii9MaWJyYXJ5L1dlYlNlcnZlci9Eb2N1bWVudHMvZWUtdGVtcGxhdGUvd2Vicm9vdC9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToieSI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo0MzoiaHR0cDovL2VlLmRldi9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjc4OiIvTGlicmFyeS9XZWJTZXJ2ZXIvRG9jdW1lbnRzL2VlLXRlbXBsYXRlL3dlYnJvb3QvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo3MToiL0xpYnJhcnkvV2ViU2VydmVyL0RvY3VtZW50cy9lZS10ZW1wbGF0ZS93ZWJyb290L2ltYWdlcy9wbV9hdHRhY2htZW50cy8iO3M6MjM6InBydl9tc2dfbWF4X2F0dGFjaG1lbnRzIjtzOjE6IjMiO3M6MjI6InBydl9tc2dfYXR0YWNoX21heHNpemUiO3M6MzoiMjUwIjtzOjIwOiJwcnZfbXNnX2F0dGFjaF90b3RhbCI7czozOiIxMDAiO3M6MTk6InBydl9tc2dfaHRtbF9mb3JtYXQiO3M6NDoic2FmZSI7czoxODoicHJ2X21zZ19hdXRvX2xpbmtzIjtzOjE6InkiO3M6MTc6InBydl9tc2dfbWF4X2NoYXJzIjtzOjQ6IjYwMDAiO3M6MTk6Im1lbWJlcmxpc3Rfb3JkZXJfYnkiO3M6MTE6InRvdGFsX3Bvc3RzIjtzOjIxOiJtZW1iZXJsaXN0X3NvcnRfb3JkZXIiO3M6NDoiZGVzYyI7czoyMDoibWVtYmVybGlzdF9yb3dfbGltaXQiO3M6MjoiMjAiO30=','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo2NjoiL0xpYnJhcnkvV2ViU2VydmVyL0RvY3VtZW50cy9lZS10ZW1wbGF0ZS93ZWJyb290L2Fzc2V0cy90ZW1wbGF0ZXMvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToyOntzOjU4OiIvTGlicmFyeS9XZWJTZXJ2ZXIvRG9jdW1lbnRzL2VlLXRlbXBsYXRlL3dlYnJvb3QvaW5kZXgucGhwIjtzOjMyOiI5MjM3NzZhYjI4YmY5Y2Q5NmJlMTQ5MGFkZDFhOGZjNSI7czo3OiJlbWFpbGVkIjthOjA6e319','YToxOntpOjE7YToxOntzOjM6InVybCI7czoxNDoiaHR0cDovL2VlLmRldi8iO319');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(9,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(10,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(11,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(12,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(13,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),(14,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(15,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stash`
--

DROP TABLE IF EXISTS `exp_stash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `session_id` varchar(40) DEFAULT NULL,
  `bundle_id` int(11) unsigned NOT NULL DEFAULT '1',
  `key_name` varchar(255) NOT NULL,
  `key_label` varchar(255) DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `parameters` mediumtext,
  PRIMARY KEY (`id`),
  KEY `bundle_id` (`bundle_id`),
  KEY `key_session` (`key_name`,`session_id`),
  KEY `key_name` (`key_name`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `exp_stash_fk` FOREIGN KEY (`bundle_id`) REFERENCES `exp_stash_bundles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stash`
--

LOCK TABLES `exp_stash` WRITE;
/*!40000 ALTER TABLE `exp_stash` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_stash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stash_bundles`
--

DROP TABLE IF EXISTS `exp_stash_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stash_bundles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_name` varchar(255) NOT NULL,
  `bundle_label` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bundle` (`bundle_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stash_bundles`
--

LOCK TABLES `exp_stash_bundles` WRITE;
/*!40000 ALTER TABLE `exp_stash_bundles` DISABLE KEYS */;
INSERT INTO `exp_stash_bundles` VALUES (1,'default','Default',1),(2,'templates','Templates',1),(3,'static','Static',1);
/*!40000 ALTER TABLE `exp_stash_bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,1,1,'Brian',1,0,0,0,1384880532,0,0,1384902703,2,1384889875,1385485669);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_groups`
--

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` VALUES (1,1,'Statuses');
/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure`
--

DROP TABLE IF EXISTS `exp_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `listing_cid` int(6) unsigned NOT NULL DEFAULT '0',
  `lft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rgt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) NOT NULL,
  `hidden` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure`
--

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;
INSERT INTO `exp_structure` VALUES (0,0,0,0,0,1,2,'root','n');
/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_channels`
--

DROP TABLE IF EXISTS `exp_structure_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_channels`
--

LOCK TABLES `exp_structure_channels` WRITE;
/*!40000 ALTER TABLE `exp_structure_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_structure_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_listings`
--

DROP TABLE IF EXISTS `exp_structure_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(75) NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_listings`
--

LOCK TABLES `exp_structure_listings` WRITE;
/*!40000 ALTER TABLE `exp_structure_listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_structure_listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_members`
--

DROP TABLE IF EXISTS `exp_structure_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_members`
--

LOCK TABLES `exp_structure_members` WRITE;
/*!40000 ALTER TABLE `exp_structure_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_structure_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_settings`
--

DROP TABLE IF EXISTS `exp_structure_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_settings`
--

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;
INSERT INTO `exp_structure_settings` VALUES (1,0,'action_ajax_move','17'),(2,0,'module_id','6'),(3,1,'show_picker','y'),(4,1,'show_view_page','y'),(5,1,'show_global_add_page','y'),(6,1,'hide_hidden_templates','y'),(7,1,'redirect_on_login','n'),(8,1,'redirect_on_publish','n'),(9,1,'add_trailing_slash','y');
/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (2,1,'viewModels',2,'y');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (2,1,2,'index','y','webpage','Hello world\n',NULL,1384902775,1,'n',0,'','n','n','o',0);
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_wygwam_configs`
--

DROP TABLE IF EXISTS `exp_wygwam_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_wygwam_configs`
--

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;
INSERT INTO `exp_wygwam_configs` VALUES (1,'Basic','YTo3OntzOjc6InRvb2xiYXIiO2E6ODp7aTowO3M6NDoiQm9sZCI7aToxO3M6NjoiSXRhbGljIjtpOjI7czo5OiJVbmRlcmxpbmUiO2k6MztzOjEyOiJOdW1iZXJlZExpc3QiO2k6NDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NTtzOjQ6IkxpbmsiO2k6NjtzOjY6IlVubGluayI7aTo3O3M6NjoiQW5jaG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czo5OiJwYXJzZV9jc3MiO2I6MDtzOjEzOiJyZXN0cmljdF9odG1sIjtzOjE6InkiO3M6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),(2,'Full','YTo3OntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6MzoiQ3V0IjtpOjI7czo0OiJDb3B5IjtpOjM7czo1OiJQYXN0ZSI7aTo0O3M6OToiUGFzdGVUZXh0IjtpOjU7czoxMzoiUGFzdGVGcm9tV29yZCI7aTo2O3M6NDoiVW5kbyI7aTo3O3M6NDoiUmVkbyI7aTo4O3M6NToiU2NheXQiO2k6OTtzOjQ6IkJvbGQiO2k6MTA7czo2OiJJdGFsaWMiO2k6MTE7czo2OiJTdHJpa2UiO2k6MTI7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjEzO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxNDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTU7czo3OiJPdXRkZW50IjtpOjE2O3M6NjoiSW5kZW50IjtpOjE3O3M6MTA6IkJsb2NrcXVvdGUiO2k6MTg7czo0OiJMaW5rIjtpOjE5O3M6NjoiVW5saW5rIjtpOjIwO3M6NjoiQW5jaG9yIjtpOjIxO3M6NToiSW1hZ2UiO2k6MjI7czo1OiJUYWJsZSI7aToyMztzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyNDtzOjExOiJTcGVjaWFsQ2hhciI7aToyNTtzOjg6IlJlYWRNb3JlIjtpOjI2O3M6NjoiU3R5bGVzIjtpOjI3O3M6NjoiRm9ybWF0IjtpOjI4O3M6ODoiTWF4aW1pemUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjk6InBhcnNlX2NzcyI7YjowO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7czoxMDoidXBsb2FkX2RpciI7czowOiIiO30=');
/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_zoo_flexible_admin_menus`
--

DROP TABLE IF EXISTS `exp_zoo_flexible_admin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_zoo_flexible_admin_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT NULL,
  `group_id` int(4) DEFAULT NULL,
  `nav` text,
  `autopopulate` tinyint(1) DEFAULT NULL,
  `hide_sidebar` tinyint(1) DEFAULT NULL,
  `startpage` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_zoo_flexible_admin_menus`
--

LOCK TABLES `exp_zoo_flexible_admin_menus` WRITE;
/*!40000 ALTER TABLE `exp_zoo_flexible_admin_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_zoo_flexible_admin_menus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-19 21:04:29
