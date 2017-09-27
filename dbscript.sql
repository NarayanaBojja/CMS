
CREATE DATABASE `hostel` /*!40100 DEFAULT CHARACTER SET utf8 */;


DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `name` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `message` varchar(100) NOT NULL,
  `time_stamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sregister` (
  `name` varchar(25) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


