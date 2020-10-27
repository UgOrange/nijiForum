-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: rm-wz9yxho9eg3x33hpono.mysql.rds.aliyuncs.com    Database: project
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '55e64ca5-d4b0-11e9-99e8-00163e165495:1-1874993';

--
-- Current Database: `project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `project`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add appendix',7,'add_appendix'),(20,'Can change appendix',7,'change_appendix'),(21,'Can delete appendix',7,'delete_appendix'),(22,'Can add node',8,'add_node'),(23,'Can change node',8,'change_node'),(24,'Can delete node',8,'delete_node'),(25,'Can add node group',9,'add_nodegroup'),(26,'Can change node group',9,'change_nodegroup'),(27,'Can delete node group',9,'delete_nodegroup'),(28,'Can add notification',10,'add_notification'),(29,'Can change notification',10,'change_notification'),(30,'Can delete notification',10,'delete_notification'),(31,'Can add post',11,'add_post'),(32,'Can change post',11,'change_post'),(33,'Can delete post',11,'delete_post'),(34,'Can add topic',12,'add_topic'),(35,'Can change topic',12,'change_topic'),(36,'Can delete topic',12,'delete_topic'),(37,'Can add forum avatar',13,'add_forumavatar'),(38,'Can change forum avatar',13,'change_forumavatar'),(39,'Can delete forum avatar',13,'delete_forumavatar'),(40,'Can add announcement',14,'add_announcement'),(41,'Can change announcement',14,'change_announcement'),(42,'Can delete announcement',14,'delete_announcement'),(43,'Can add email code',15,'add_emailcode'),(44,'Can change email code',15,'change_emailcode'),(45,'Can delete email code',15,'delete_emailcode');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$RiU44z2BCnwu$kl0a3Uj1miFu1kxDYalVXP1EWnhBiqwTHD98PRGJaoE=','2020-02-13 13:07:50.144384',0,'111111','','','zeng32@qq.com',0,1,'2020-02-02 08:21:02.263018'),(2,'pbkdf2_sha256$36000$HXw385MRPaWp$9McbJrZoa7v0uJS4mhyJLXDLmug1AN7T/nJlMUCPI6M=','2020-02-18 11:07:11.944713',1,'admin','','','zeng2232@qq.com',1,1,'2020-02-02 10:05:07.971928'),(3,'pbkdf2_sha256$36000$u8Bh8ochJm3J$y0yqa7yN+SFyrGVjkqdHE3vMgGGNyJOgE/oW+nQtZio=','2020-02-08 09:04:36.924839',0,'333333','','','333333@qq.com',0,1,'2020-02-08 09:04:36.839837'),(9,'pbkdf2_sha256$36000$geMrGGsh3h8z$2+W4OAiHW0D1BSkbz2qo9sDkq3F5yB5rOahtTvyJdM0=','2020-02-18 04:03:49.479796',0,'vim1','','','sy742705903@gmail.com',0,1,'2020-02-16 17:02:23.252597'),(10,'pbkdf2_sha256$36000$EV30hmSvEuDG$N1JXReeUMdTpXeQ6t1HG3zNNEZVuFMas5Qla8Fo24DA=','2020-02-18 14:49:33.851275',1,'lch','','','asdf@hjkl.com',1,1,'2020-02-17 17:01:20.179637');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-02 10:06:47.533488','2','出租',1,'[{\"added\": {}}]',8,2),(2,'2020-02-02 10:07:39.120466','3','二手交易',1,'[{\"added\": {}}]',8,2),(3,'2020-02-02 10:08:42.484410','1','测试的求租信息的标题',2,'[{\"changed\": {\"fields\": [\"title\", \"content_raw\"]}}]',12,2),(4,'2020-02-07 17:46:54.072977','1','论坛建立庆祝',1,'[{\"added\": {}}]',14,2),(5,'2020-02-07 18:24:39.891562','1','111',1,'[{\"added\": {}}]',14,2),(6,'2020-02-07 18:32:08.304012','2','这是一条公告',1,'[{\"added\": {}}]',14,2),(7,'2020-02-10 09:16:03.032087','4','test image',2,'[{\"changed\": {\"fields\": [\"cover_img\"]}}]',12,2),(8,'2020-02-10 10:00:03.760967','8','1212',2,'[{\"changed\": {\"fields\": [\"cover_img\"]}}]',12,2),(9,'2020-02-10 10:14:17.125379','11','111111111111111111',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',12,2),(10,'2020-02-10 10:17:28.374009','12','qwqw',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',12,2),(11,'2020-02-10 10:34:24.973892','10','5',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',12,2),(12,'2020-02-10 10:34:53.642966','9','4',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',12,2),(13,'2020-02-10 10:36:06.969267','9','4',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',12,2),(14,'2020-02-10 11:33:58.221335','2','这是一条公告',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,2),(15,'2020-02-10 11:38:29.745480','2','这是一条公告',2,'[]',14,2),(16,'2020-02-10 11:38:50.694424','1','111',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,2),(17,'2020-02-10 11:41:41.248788','1','111',3,'',14,2),(18,'2020-02-10 11:55:49.751753','3','test',1,'[{\"added\": {}}]',14,2),(19,'2020-02-10 11:56:15.321285','4','testtest',1,'[{\"added\": {}}]',14,2),(20,'2020-02-10 12:01:41.055792','13','2',2,'[{\"changed\": {\"fields\": [\"append_file\"]}}]',12,2),(21,'2020-02-12 06:31:07.162216','2','这是一条公告',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',14,2),(22,'2020-02-12 06:49:50.405222','2','这是一条公告',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',14,2),(23,'2020-02-15 06:49:12.418242','24','多格式图片上传',3,'',12,2),(24,'2020-02-15 13:01:11.514250','5','短发短发的短发短发短发短发短发短发的',1,'[{\"added\": {}}]',14,2),(25,'2020-02-16 09:00:51.615060','5','短发短发的短发短发短发短发短发短发的',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',14,2),(26,'2020-02-16 09:08:56.111751','5','短发短发的短发短发短发短发短发短发的',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',14,2),(27,'2020-02-16 09:43:46.145562','5','短发短发的短发短发短发短发短发短发的',2,'[{\"changed\": {\"fields\": [\"content_rendered\"]}}]',14,2),(28,'2020-02-16 09:45:13.793696','4','testtest',2,'[{\"changed\": {\"fields\": [\"content_rendered\"]}}]',14,2),(29,'2020-02-16 09:45:16.383292','4','testtest',2,'[]',14,2),(30,'2020-02-16 09:45:23.112695','3','test',2,'[{\"changed\": {\"fields\": [\"content_rendered\"]}}]',14,2),(31,'2020-02-16 09:45:32.340786','2','这是一条公告',2,'[{\"changed\": {\"fields\": [\"content_rendered\"]}}]',14,2),(32,'2020-02-17 17:14:33.974890','6','lch',1,'[{\"added\": {}}]',14,10),(33,'2020-02-18 14:35:52.577713','36','mkv',3,'',12,10),(34,'2020-02-18 14:35:59.231706','35','mkv',3,'',12,10),(35,'2020-02-18 14:40:08.317670','37','mkv',3,'',12,10);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'niji','announcement'),(7,'niji','appendix'),(15,'niji','emailcode'),(13,'niji','forumavatar'),(8,'niji','node'),(9,'niji','nodegroup'),(10,'niji','notification'),(11,'niji','post'),(12,'niji','topic'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-02 08:20:01.980013'),(2,'auth','0001_initial','2020-02-02 08:20:02.459829'),(3,'admin','0001_initial','2020-02-02 08:20:02.564769'),(4,'admin','0002_logentry_remove_auto_add','2020-02-02 08:20:02.577771'),(5,'contenttypes','0002_remove_content_type_name','2020-02-02 08:20:02.649429'),(6,'auth','0002_alter_permission_name_max_length','2020-02-02 08:20:02.691769'),(7,'auth','0003_alter_user_email_max_length','2020-02-02 08:20:02.709793'),(8,'auth','0004_alter_user_username_opts','2020-02-02 08:20:02.722268'),(9,'auth','0005_alter_user_last_login_null','2020-02-02 08:20:02.763768'),(10,'auth','0006_require_contenttypes_0002','2020-02-02 08:20:02.769270'),(11,'auth','0007_alter_validators_add_error_messages','2020-02-02 08:20:02.786268'),(12,'auth','0008_alter_user_username_max_length','2020-02-02 08:20:02.829278'),(13,'niji','0001_initial','2020-02-02 08:20:03.698768'),(14,'niji','0002_auto_20160126_1209','2020-02-02 08:20:03.789269'),(15,'niji','0003_forumavatar','2020-02-02 08:20:03.866660'),(16,'niji','0004_auto_20160628_0609','2020-02-02 08:20:03.911355'),(17,'niji','0005_topic_closed','2020-02-02 08:20:04.003345'),(18,'sessions','0001_initial','2020-02-02 08:20:04.044844'),(19,'niji','0006_auto_20200208_0116','2020-02-07 17:16:59.984831'),(20,'niji','0007_auto_20200208_0118','2020-02-07 17:18:12.619448'),(21,'niji','0008_auto_20200208_0133','2020-02-07 17:33:10.966666'),(22,'niji','0009_auto_20200208_0140','2020-02-07 17:40:34.341487'),(23,'niji','0010_announcement','2020-02-07 17:45:41.818476'),(24,'niji','0011_announcement_user','2020-02-07 18:22:20.659623'),(25,'niji','0012_auto_20200208_0219','2020-02-07 18:22:20.724559'),(26,'niji','0013_announcement_pub_date','2020-02-07 18:27:56.214203'),(27,'niji','0014_announcement_view_count','2020-02-07 18:30:03.708044'),(28,'niji','0015_remove_topic_brief','2020-02-08 04:10:04.752820'),(29,'niji','0016_auto_20200208_1819','2020-02-08 10:19:25.978631'),(30,'niji','0017_auto_20200208_1925','2020-02-08 11:25:30.131194'),(31,'niji','0018_auto_20200210_1813','2020-02-10 10:13:14.976149'),(32,'niji','0002_announcement_image','2020-02-10 11:33:37.697952'),(33,'niji','0003_topic_append_file','2020-02-10 12:00:18.822876'),(34,'niji','0004_auto_20200212_1355','2020-02-12 05:55:47.092738'),(35,'niji','0005_auto_20200212_1410','2020-02-12 06:10:16.803091'),(36,'niji','0006_auto_20200212_1510','2020-02-12 07:10:31.450352'),(37,'niji','0007_auto_20200216_1737','2020-02-16 09:37:37.827147');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0fmu649smd3iljuoqm0ofjapjjuojx9c','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-27 13:01:53.401383'),('2j4lt4h0lrmu4a8292si4ks7h9veyovb','YmU3NDY4MjAzNjNjNGYzZjU2N2FiYmI4NWY1MzA4Njg2NTVmMzA3OTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTMxOTIwODg5MWM4MjNhYjQxZmIzYzhhZGFmODhkNmRlODNkYzBhZiIsInNpbXBsZXVpXzIwMjAwMjE4Ijp0cnVlfQ==','2020-03-03 13:41:29.783840'),('2jyol34agg75nogm3t2pp18em8nifu1f','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-26 04:32:41.437102'),('3e7x169ttnoostnsbijhwh70ej00oggn','ODRkOGYxMDU0OWFjNmI1OWFmMzQxMDljZTI5YjUzZjgxNWJiMDBmNTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGZlMmUxMGI5NmUzYjM0ZGYwYmVkZWMyYWUxZWU1ZGY4MmY4NDYxIn0=','2020-03-03 04:03:49.630436'),('3mhktvbn2jiq7788oqfr7lx1skwqchoy','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-16 10:38:15.195246'),('6wu0xyokakcy6dygaltt9in1yh884ecm','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-27 11:38:46.837948'),('7upcdesfpq09z7xjozoa71t7v3o5a9n3','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-24 07:30:31.707270'),('9mi2w3s4yob09i0mltnoord0dgoewo5t','NDUyZTVjZGQ1OGJjMmRhOGRlY2Q0OGM3YWIzNzlhYjgyYmFlNmRmODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIiwic2ltcGxldWlfMjAyMDAyMTgiOnRydWV9','2020-03-03 11:08:13.843710'),('g7qgyxx5ri8akaxf6csca678xfanzd06','Njc0ZmY1YzRjNGY5ODg5MDcyYWE4YWNiOTUyZDZiOGQ5OTcwZGQ5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTMxOTIwODg5MWM4MjNhYjQxZmIzYzhhZGFmODhkNmRlODNkYzBhZiJ9','2020-03-03 14:49:34.029813'),('k0prveupvbzk0ac18hmwr5hbh9yp1g4k','MGY4NmVhNDY0NzA4YWYyMzIxZThiNjU0YjIzZGY5NDQ4NzI5YTBhMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIn0=','2020-02-27 11:12:20.143780'),('mho4c2qo0ilisgaxbqki2ctff1qk1wm9','NDMyNTUyZjBmMDFjZDY3ZjQxMjBkMjk5MzZjNDg4YTk5MTk5MDY5NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIiwic2ltcGxldWlfMjAyMDAyMTYiOnRydWV9','2020-03-01 08:59:41.671020'),('o49vy2juun40y1nornj7uypccp8isqla','NDMyNTUyZjBmMDFjZDY3ZjQxMjBkMjk5MzZjNDg4YTk5MTk5MDY5NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIiwic2ltcGxldWlfMjAyMDAyMTYiOnRydWV9','2020-03-01 12:39:21.223621'),('spienywx83rqiqqxr56mmwp5foz5utga','ODRkOGYxMDU0OWFjNmI1OWFmMzQxMDljZTI5YjUzZjgxNWJiMDBmNTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGZlMmUxMGI5NmUzYjM0ZGYwYmVkZWMyYWUxZWU1ZGY4MmY4NDYxIn0=','2020-03-01 17:02:24.329339'),('u8kndmu68abu20mq7du5ahxis75zvru1','NDMyNTUyZjBmMDFjZDY3ZjQxMjBkMjk5MzZjNDg4YTk5MTk5MDY5NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2N2I0MjY1YjgzYWVjYzRiZDc3YTcxNWUzYjkzZTk5Zjk0NDg4ZjVmIiwic2ltcGxldWlfMjAyMDAyMTYiOnRydWV9','2020-03-01 10:57:57.549930');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_announcement`
--

DROP TABLE IF EXISTS `niji_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `view_count` int(11) NOT NULL,
  `content_raw` longtext NOT NULL,
  `content_rendered` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `niji_announcement_user_id_d808b652_fk_auth_user_id` (`user_id`) USING BTREE,
  KEY `niji_announcement_pub_date_8e1f41e7` (`pub_date`) USING BTREE,
  CONSTRAINT `niji_announcement_user_id_d808b652_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_announcement`
--

LOCK TABLES `niji_announcement` WRITE;
/*!40000 ALTER TABLE `niji_announcement` DISABLE KEYS */;
INSERT INTO `niji_announcement` VALUES (2,2,'这是一条公告','2020-02-07 18:32:08.304012',46,'这是一条公告','这是一条公告'),(3,2,'test','2020-02-10 11:55:49.750792',1,'test','test'),(4,2,'testtest','2020-02-10 11:56:15.320280',2,'testtest','testtest'),(5,2,'短发短发的短发短发短发短发短发短发的','2020-02-15 13:01:11.475403',10,'\n\n\n\r\n	新公告\r\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/cf1f58ee-50a0-11ea-b25b-54ee75ae943b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	新公告\r\n</p>'),(6,10,'lch','2020-02-17 17:14:33.902680',97000002,'alert(2)','<script>alert(2)</script>');
/*!40000 ALTER TABLE `niji_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_appendix`
--

DROP TABLE IF EXISTS `niji_appendix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_appendix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_date` datetime(6) NOT NULL,
  `content_raw` longtext NOT NULL,
  `content_rendered` longtext NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `niji_appendix_topic_id_89816738_fk_niji_topic_id` (`topic_id`) USING BTREE,
  CONSTRAINT `niji_appendix_topic_id_89816738_fk_niji_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `niji_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_appendix`
--

LOCK TABLES `niji_appendix` WRITE;
/*!40000 ALTER TABLE `niji_appendix` DISABLE KEYS */;
INSERT INTO `niji_appendix` VALUES (1,'2020-02-02 09:45:43.307064','append content','<p>append content</p>\n',1);
/*!40000 ALTER TABLE `niji_appendix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_emailcode`
--

DROP TABLE IF EXISTS `niji_emailcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_emailcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_emailcode`
--

LOCK TABLES `niji_emailcode` WRITE;
/*!40000 ALTER TABLE `niji_emailcode` DISABLE KEYS */;
INSERT INTO `niji_emailcode` VALUES (7,486669,0,'');
/*!40000 ALTER TABLE `niji_emailcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_forumavatar`
--

DROP TABLE IF EXISTS `niji_forumavatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_forumavatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_gravatar` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `niji_forumavatar_user_id_be1b2a26_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_forumavatar`
--

LOCK TABLES `niji_forumavatar` WRITE;
/*!40000 ALTER TABLE `niji_forumavatar` DISABLE KEYS */;
INSERT INTO `niji_forumavatar` VALUES (1,0,'uploads/forum/avatars/2_2VhyGer.png',2);
/*!40000 ALTER TABLE `niji_forumavatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_node`
--

DROP TABLE IF EXISTS `niji_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_node`
--

LOCK TABLES `niji_node` WRITE;
/*!40000 ALTER TABLE `niji_node` DISABLE KEYS */;
INSERT INTO `niji_node` VALUES (1,'求租','寻找租房信息'),(2,'出租','出租房屋信息'),(3,'二手交易','二手交易系列');
/*!40000 ALTER TABLE `niji_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_nodegroup`
--

DROP TABLE IF EXISTS `niji_nodegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_nodegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_nodegroup`
--

LOCK TABLES `niji_nodegroup` WRITE;
/*!40000 ALTER TABLE `niji_nodegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `niji_nodegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_nodegroup_node`
--

DROP TABLE IF EXISTS `niji_nodegroup_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_nodegroup_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodegroup_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `niji_nodegroup_node_nodegroup_id_node_id_0d1827f3_uniq` (`nodegroup_id`,`node_id`) USING BTREE,
  KEY `niji_nodegroup_node_node_id_3f2214dc_fk_niji_node_id` (`node_id`) USING BTREE,
  CONSTRAINT `niji_nodegroup_node_node_id_3f2214dc_fk_niji_node_id` FOREIGN KEY (`node_id`) REFERENCES `niji_node` (`id`),
  CONSTRAINT `niji_nodegroup_node_nodegroup_id_67b6bcb0_fk_niji_nodegroup_id` FOREIGN KEY (`nodegroup_id`) REFERENCES `niji_nodegroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_nodegroup_node`
--

LOCK TABLES `niji_nodegroup_node` WRITE;
/*!40000 ALTER TABLE `niji_nodegroup_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `niji_nodegroup_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_notification`
--

DROP TABLE IF EXISTS `niji_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read` tinyint(1) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `niji_notification_post_id_6310a30a_fk_niji_post_id` (`post_id`) USING BTREE,
  KEY `niji_notification_sender_id_478c49f4_fk_auth_user_id` (`sender_id`) USING BTREE,
  KEY `niji_notification_to_id_6c1a5de1_fk_auth_user_id` (`to_id`) USING BTREE,
  KEY `niji_notification_topic_id_b9ac3d6c_fk_niji_topic_id` (`topic_id`) USING BTREE,
  CONSTRAINT `niji_notification_post_id_6310a30a_fk_niji_post_id` FOREIGN KEY (`post_id`) REFERENCES `niji_post` (`id`),
  CONSTRAINT `niji_notification_sender_id_478c49f4_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `niji_notification_to_id_6c1a5de1_fk_auth_user_id` FOREIGN KEY (`to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `niji_notification_topic_id_b9ac3d6c_fk_niji_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `niji_topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_notification`
--

LOCK TABLES `niji_notification` WRITE;
/*!40000 ALTER TABLE `niji_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `niji_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_post`
--

DROP TABLE IF EXISTS `niji_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_raw` longtext NOT NULL,
  `content_rendered` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `niji_post_topic_id_13244248_fk_niji_topic_id` (`topic_id`) USING BTREE,
  KEY `niji_post_user_id_ba8addfe_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `niji_post_topic_id_13244248_fk_niji_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `niji_topic` (`id`),
  CONSTRAINT `niji_post_user_id_ba8addfe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_post`
--

LOCK TABLES `niji_post` WRITE;
/*!40000 ALTER TABLE `niji_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `niji_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niji_topic`
--

DROP TABLE IF EXISTS `niji_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niji_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `content_raw` longtext NOT NULL,
  `content_rendered` longtext NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `last_replied` datetime(6) NOT NULL,
  `order` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `node_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `append_file` varchar(100) NOT NULL,
  `append_video` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `niji_topic_pub_date_9463c471` (`pub_date`) USING BTREE,
  KEY `niji_topic_last_replied_04f626af` (`last_replied`) USING BTREE,
  KEY `niji_topic_node_id_635167a4_fk_niji_node_id` (`node_id`) USING BTREE,
  KEY `niji_topic_user_id_2436348c_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `niji_topic_node_id_635167a4_fk_niji_node_id` FOREIGN KEY (`node_id`) REFERENCES `niji_node` (`id`),
  CONSTRAINT `niji_topic_user_id_2436348c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niji_topic`
--

LOCK TABLES `niji_topic` WRITE;
/*!40000 ALTER TABLE `niji_topic` DISABLE KEYS */;
INSERT INTO `niji_topic` VALUES (1,'测试的求租信息的标题','测试的求租信息的内容。','<p>测试的求租信息的内容。</p>\n',45,0,'2020-02-02 08:23:02.568775','2020-02-02 08:23:02.568775',10,0,1,1,0,'','',NULL),(2,'北京求租房','求在北京租房','<p>求在北京租房</p>\n',11,0,'2020-02-02 09:47:09.975740','2020-02-02 09:47:09.975740',10,0,1,1,0,'','',NULL),(3,'一个二手交易信息的标题','一个二手交易信息的内容','<p>一个二手交易信息的内容</p>\n',7,0,'2020-02-02 10:10:03.161593','2020-02-02 10:10:03.161593',10,0,3,2,0,'','',NULL),(4,'test image','test image','<p>test image</p>\n',35,0,'2020-02-10 08:22:18.664816','2020-02-10 08:22:18.664816',10,0,2,2,0,'','',NULL),(5,'1','1','<p>1</p>\n',3,0,'2020-02-10 09:08:20.140564','2020-02-10 09:08:20.140564',10,0,1,2,0,'','',NULL),(6,'1111','1111','<p>1111</p>\n',1,0,'2020-02-10 09:31:07.266692','2020-02-10 09:31:07.266692',10,0,2,2,0,'','',NULL),(7,'11111','111111','<p>111111</p>\n',1,0,'2020-02-10 09:38:07.195994','2020-02-10 09:38:07.195994',10,0,3,2,0,'','',NULL),(8,'1212','1212','<p>1212</p>\n',2,0,'2020-02-10 09:41:54.409173','2020-02-10 09:41:54.409668',10,0,1,2,0,'','',NULL),(9,'4','4','<p>4</p>\n',1,0,'2020-02-10 09:43:42.451410','2020-02-10 09:43:42.451410',10,0,1,2,0,'uploads/forum/covers/QQ图片20200112205937_rzGZXXM.jpg','',NULL),(10,'5','5','<p>5</p>\n',7,0,'2020-02-10 09:44:47.117273','2020-02-10 09:44:47.117273',10,0,1,2,0,'uploads/forum/covers/QQ图片20200112205937.jpg','',NULL),(11,'111111111111111111','111111111111111111111111','<p>111111111111111111111111</p>\n',6,0,'2020-02-10 10:01:01.708174','2020-02-10 10:01:01.708174',10,0,1,2,0,'uploads/forum/covers/zw.jpg','',NULL),(12,'qwqw','qwqw','<p>qwqw</p>\n',4,0,'2020-02-10 10:13:50.604500','2020-02-10 10:13:50.604500',10,0,1,2,0,'uploads/forum/covers/5.jpg','',NULL),(13,'2','22','<p>22</p>\n',1,0,'2020-02-10 10:40:45.435902','2020-02-10 10:40:45.436913',10,0,1,2,0,'uploads/forum/covers/QQ图片20200112205937_BTsxEQB.jpg','uploads/forum/files/index.html',NULL),(14,'前期','前期','<p>前期</p>\n',1,0,'2020-02-10 12:14:09.194132','2020-02-10 12:14:09.194132',10,0,1,2,0,'uploads/forum/covers/QQ图片20200112205937_l6fWiRh.jpg','',NULL),(15,'file test','file test','<p>file test</p>\n',9,0,'2020-02-10 12:14:46.734137','2020-02-10 12:14:46.734137',10,0,3,2,0,'uploads/forum/covers/QQ图片20200112205937_Xl3Xbue.jpg','uploads/forum/files/招商银行劳务费对账单.xls',NULL),(16,'111','11111111','<p>11111111</p>\n',2,0,'2020-02-10 12:18:49.436312','2020-02-10 12:18:49.436312',10,0,1,2,0,'','',NULL),(17,'123','','<p>\r\n	<img src=\"/media/kindeditor/2020/2/dc63a0ba-4d66-11ea-9011-54ee75ae943b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	12312313211321231\r\n</p>',2,0,'2020-02-12 07:11:31.935941','2020-02-12 07:11:31.935941',10,0,1,2,0,'','uploads/forum/files/校园卡简笔画.jpg',NULL),(18,'test','','<p>\r\n	test\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/375aa61e-4d67-11ea-9dce-54ee75ae943b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	test\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/3f8f54cc-4d67-11ea-a877-54ee75ae943b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	test\r\n</p>',1,0,'2020-02-12 07:14:30.853886','2020-02-12 07:14:30.853886',10,0,3,2,0,'','uploads/forum/files/2.jpg',NULL),(19,'111','','<img src=\"/media/kindeditor/2020/2/8792b476-4d68-11ea-a205-54ee75ae943b.jpg\" alt=\"\" />',2,0,'2020-02-12 07:23:20.310513','2020-02-12 07:23:20.310513',10,0,1,2,0,'','',NULL),(20,'1111111','','<p>\r\n	<img src=\"/media/kindeditor/2020/2/6cf52d76-4e55-11ea-be8b-680715f09d07.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	qwer4tyuiop\r\n</p>',1,0,'2020-02-13 11:40:32.518552','2020-02-13 11:40:32.519052',10,0,3,2,0,'','',NULL),(21,'222','\n\n\n\r\n	sdfdsafsdafsa\r\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/01080d7a-4e56-11ea-b34c-680715f09d07.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	sdfdsafsdafsa\r\n</p>',7,0,'2020-02-13 11:43:16.897547','2020-02-13 11:43:16.897547',10,0,3,2,0,'','',NULL),(22,'阿撒撒撒','','',2,0,'2020-02-13 13:09:56.757603','2020-02-13 13:09:56.757676',10,1,1,2,1,'','',NULL),(23,'大图多图尝试','\n\n\n\r\n	上面这张图大小为4M\r\n\n\n\n\n\n\n\n\r\n	第二张是2M大小\r\n\n\n\n\n\n\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/641d77aa-4fbc-11ea-972e-0242ac110003.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	上面这张图大小为4M\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/7fdaa7a6-4fbc-11ea-a9ae-0242ac110003.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	第二张是2M大小\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',7,0,'2020-02-15 06:29:50.820706','2020-02-15 06:29:50.820767',10,0,3,1,0,'','',NULL),(25,'大图片尝试','\n\n\n\r\n	上面这张照片约4M\r\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/a7e75cd8-4fbe-11ea-94b6-0242ac110004.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	上面这张照片约4M\r\n</p>',4,0,'2020-02-15 06:45:10.633797','2020-02-15 06:45:10.633870',10,0,3,1,0,'','',NULL),(26,'多图及多格式尝试','\n\n\n\r\n	上面这张图为JPG格式，约4M\r\n\n\r\n	下面这张图为jpg格式，约4M\r\n\n\n\n\n\r\n	下面这张图为png格式，1.44M\r\n\n\n\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/d5950ec8-4fbe-11ea-bb2c-0242ac110004.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	上面这张图为JPG格式，约4M\r\n</p>\r\n<p>\r\n	下面这张图为jpg格式，约4M\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/ed27710c-4fbe-11ea-af2b-0242ac110004.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	下面这张图为png格式，1.44M\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/16614f5c-4fbf-11ea-935a-0242ac110004.png\" alt=\"\" />\r\n</p>',12,0,'2020-02-15 06:47:55.131296','2020-02-15 06:47:55.131378',10,0,3,1,0,'','',NULL),(27,'短发短发短发','\r\n	二二二\r\n\n\n\n\n\n\n\n\n\n\n\r\n	风格复古风\r\n\n\n\n\n\n\n','<p>\r\n	二二二\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/5c1c4442-4ff2-11ea-afc3-0242ac110004.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	风格复古风\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/media/kindeditor/2020/2/87d87ff6-4ff2-11ea-8ea2-0242ac110004.PNG\" alt=\"\" />\r\n</p>',6,0,'2020-02-15 12:56:12.688606','2020-02-15 12:56:12.688680',10,0,2,2,0,'','',NULL),(28,'短发短发的','发呆发呆发呆发呆','<img src=\"/media/kindeditor/2020/2/b59739dc-4ff2-11ea-80f9-0242ac110004.PNG\" alt=\"\" /><img src=\"/media/kindeditor/2020/2/b6332b44-4ff2-11ea-95be-0242ac110004.JPG\" alt=\"\" /><img src=\"/media/kindeditor/2020/2/bc7c7e56-4ff2-11ea-bf12-0242ac110004.PNG\" alt=\"\" />发呆发呆发呆发呆',9,0,'2020-02-15 12:57:52.545171','2020-02-15 12:57:52.545238',10,0,2,2,0,'','',NULL),(29,'testtest','\n\n\n\r\n	testtest\r\n','<p>\r\n	<img src=\"/media/kindeditor/2020/2/5bee74de-509b-11ea-a30d-54ee75ae943b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	testtest\r\n</p>',2,0,'2020-02-16 09:04:50.259940','2020-02-16 09:04:50.259940',10,0,1,2,0,'','',NULL),(30,'新提交','new','new',4,0,'2020-02-16 10:08:00.777539','2020-02-16 10:08:00.777539',10,0,3,2,0,'','',NULL),(31,'jnj','1515','1515',1,0,'2020-02-17 04:51:09.514063','2020-02-17 04:51:09.514143',10,0,2,9,0,'','uploads/forum/files/deepin.com.qq.im.desktop',NULL),(32,'<script>alert(\"a\");<script>','<script>alert(\"a\");<script>','&lt;script&gt;alert(\"a\");&lt;script&gt;',6,0,'2020-02-17 04:52:09.443743','2020-02-17 04:52:09.443839',10,0,2,9,0,'','uploads/forum/files/Screenshot_20200214_035648.png',NULL),(33,'<script>alert(\"a\");<script>  <script>alert(\"a\");<script>','<script>alert(\"a\");<script>\r\n\r\n<script>alert(\"a\");<script>','<p>&lt;script&gt;alert(\"a\");&lt;script&gt;</p>\n<p>&lt;script&gt;alert(\"a\");&lt;script&gt;</p>\n',2,0,'2020-02-17 17:15:37.931582','2020-02-17 17:15:37.931658',10,0,2,10,0,'','',NULL),(34,'123视频','213123','213123',7,0,'2020-02-18 14:17:39.222402','2020-02-18 14:17:39.222481',10,0,1,10,0,'','uploads/forum/files/deepin.com.qq.im.desktop','uploads/forum/files/蔣雪兒_-_愛河_動態歌詞版MV.mp4'),(38,'彩虹','answer','answer',2,0,'2020-02-18 14:50:04.140641','2020-02-18 14:50:04.140701',10,0,1,10,0,'','','uploads/forum/files/out.mp4'),(39,'test video','test vedio','test vedio',2,0,'2020-02-18 14:56:21.204842','2020-02-18 14:56:21.204902',10,0,1,2,0,'','','uploads/forum/files/1927ebe7726da4437e6f6666eab65879.mp4');
/*!40000 ALTER TABLE `niji_topic` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-19 10:27:00
