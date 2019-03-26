-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: school
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `user_id` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '主键id',
  `user_name` varchar(36) NOT NULL,
  `user_password` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户密码\n',
  `study_id` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '学号',
  `teacher_id` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '教师id',
  `user_sex` varchar(2) DEFAULT NULL COMMENT '0男1女',
  `user_kjh` varchar(32) DEFAULT NULL COMMENT '考级号',
  `school` varchar(200) DEFAULT NULL COMMENT '学校',
  `user_zy` varchar(100) DEFAULT NULL COMMENT '专业',
  `user_date` varchar(100) DEFAULT NULL COMMENT '入学时间',
  `user_cc` varchar(200) DEFAULT NULL COMMENT '层次 是 直接本科还是专升本',
  `zt` varchar(2) DEFAULT NULL COMMENT '0在读 1退学 ',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号\n',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号\n',
  `address` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `two_phone` varchar(30) DEFAULT NULL COMMENT '第二联系人电话',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `sfzk` varchar(2) DEFAULT NULL COMMENT '0自考1统考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` (`user_id`, `user_name`, `user_password`, `study_id`, `teacher_id`, `user_sex`, `user_kjh`, `school`, `user_zy`, `user_date`, `user_cc`, `zt`, `phone`, `email`, `qq`, `address`, `two_phone`, `idcard`, `sfzk`) VALUES ('1','周凯旋','1111','20191','','0','20191','张家口','计算机','2014-9-1','本科','0','15030610683','906874259@qq.com','906874259','河北','15127650628','131082199506291014',NULL);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-26 23:16:18
