DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `account_cd` varchar(4) NOT NULL,
  `account_name` varchar(45) NOT NULL,
  `account_no` varchar(45) DEFAULT NULL,
  `account_bank` varchar(45) DEFAULT NULL,
  `desc_txt` varchar(100) DEFAULT NULL,
  `ifsc_cd` varchar(45) DEFAULT NULL,
  `account_balance` decimal(10,2) DEFAULT NULL,
  `created` datetime NOT NULL,
  `active` varchar(1) DEFAULT 'Y',
  PRIMARY KEY (`account_cd`),
  UNIQUE KEY `account_name_UNIQUE` (`account_name`)
);
INSERT INTO `accounts` VALUES ('CINH','Cash in hand',NULL,NULL,'Cash in hand',NULL,216.80,'2019-04-01 00:00:00','Y'),
('FDRL','Federal Savings(4320694)','13800100019122','Federal Bank Palarivattom','Metro Pillar No. 529, 35/37A Main Road, Ernakulam','FDRL0001380',100.00,'2020-08-11 20:47:26','Y');

DROP TABLE IF EXISTS `appartment_types`;
CREATE TABLE `appartment_types` (
  `appartment_type_cd` varchar(3) NOT NULL,
  `square_ft` int NOT NULL,
  `no_of_bedroom` int NOT NULL,
  PRIMARY KEY (`appartment_type_cd`)
);

INSERT INTO `appartment_types` VALUES ('A',1000,3),('B',1000,3),('C',1000,3),('CMN',1,1),('D',1000,2),('E',1000,2),('F',1000,2),('G',1000,2),('H',1000,2);

DROP TABLE IF EXISTS `appartments`;
CREATE TABLE `appartments` (
  `appartment_cd` varchar(3) NOT NULL,
  `appartment_type_cd` varchar(3) DEFAULT NULL,
  `floor` int DEFAULT NULL,
  PRIMARY KEY (`appartment_cd`),
  KEY `appart_type_fk_idx` (`appartment_type_cd`),
  CONSTRAINT `appartment_aptype_fk` FOREIGN KEY (`appartment_type_cd`) REFERENCES `appartment_types` (`appartment_type_cd`)
);
INSERT INTO `appartments` VALUES ('10A','A',10),('10B','B',10),('10C','C',10),('10D','D',10),
('10E','E',10),('10F','F',10),('10G','G',10),('10H','H',10),('11A','A',11),('11B','B',11),
('11C','C',11),('11D','D',11),('11E','E',11),('11F','F',11),('11G','G',11),('11H','H',11),
('1A','A',1),('1B','B',1),('1C','C',1),('1D','D',1),('1E','E',1),('1F','F',1),('1G','G',1),
('1H','H',1),('2A','A',2),('2B','B',2),('2C','C',2),('2D','D',2),('2E','E',2),('2F','F',2),
('2G','G',2),('2H','H',2),('3A','A',3),('3B','B',3),('3C','C',3),('3D','D',3),('3E','E',3),
('3F','F',3),('3G','G',3),('3H','H',3),('4A','A',4),('4B','B',4),('4C','C',4),('4D','D',4),
('4E','E',4),('4F','F',4),('4G','G',4),('4H','H',4),('5A','A',5),('5B','B',5),('5C','C',5),
('5D','D',5),('5E','E',5),('5F','F',5),('5G','G',5),('5H','H',5),('6A','A',6),('6B','B',6),
('6C','C',6),('6D','D',6),('6E','E',6),('6F','F',6),('6G','G',6),('6H','H',6),('7A','A',7),
('7B','B',7),('7C','C',7),('7D','D',7),('7E','E',7),('7F','F',7),('7G','G',7),('7H','H',7),
('8A','A',8),('8B','B',8),('8C','C',8),('8D','D',8),('8E','E',8),('8F','F',8),('8G','G',8),
('8H','H',8),('9A','A',9),('9B','B',9),('9C','C',9),('9D','D',9),('9E','E',9),('9F','F',9),
('9G','G',9),('9H','H',9),('CMN','CMN',0);

CREATE TABLE `financial_year` (
  `year` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `current_year` char(1) NOT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`year`)
);
INSERT INTO `financial_year` VALUES (2018,'2018-04-01 00:00:00','2019-03-31 00:00:00','N','2020-06-09 20:10:16','2020-06-09 20:10:16','N'),
(2019,'2019-04-01 00:00:00','2020-03-31 00:00:00','N','2020-06-09 19:34:06','2020-06-09 20:04:22','Y'),
(2020,'2020-04-01 00:00:00','2021-03-31 00:00:00','Y','2020-06-09 19:35:43','2020-06-09 20:04:22','Y');

CREATE TABLE `menus` (
  `menu_cd` varchar(4) NOT NULL,
  `menu_name` varchar(45) NOT NULL,
  PRIMARY KEY (`menu_cd`)
);

INSERT INTO `menus` VALUES ('ACNT','Accounts'),('IHSE','inhouse'),('RPTS','Reports'),('STNG','Settings');

CREATE TABLE `occupant_appartments` (
  `occupant_id` int NOT NULL,
  `appartment_cd` varchar(3) NOT NULL,
  PRIMARY KEY (`occupant_id`,`appartment_cd`),
  KEY `occ_app_app_fk_idx` (`appartment_cd`),
  CONSTRAINT `occ_app_app_fk` FOREIGN KEY (`appartment_cd`) REFERENCES `appartments` (`appartment_cd`)
);
INSERT INTO `occupant_appartments` VALUES (89,'10A'),(90,'10B'),(91,'10C'),(92,'10D'),(93,'10E'),
(94,'10F'),(95,'10G'),(96,'10H'),(97,'11A'),(98,'11B'),(99,'11C'),(99,'11D'),(101,'11E'),(102,'11F'),
(103,'11G'),(104,'11H'),(4,'1A'),(3,'1B'),(20,'1C'),(21,'1D'),(22,'1E'),(23,'1F'),(24,'1G'),(25,'1H'),
(26,'2A'),(27,'2B'),(28,'2C'),(29,'2D'),(30,'2E'),(31,'2F'),(32,'2G'),(33,'2H'),(34,'3A'),(35,'3B'),
(36,'3C'),(37,'3D'),(38,'3E'),(39,'3F'),(40,'3G'),(41,'3H'),(42,'4A'),(43,'4B'),(44,'4C'),(2,'4D'),
(45,'4E'),(46,'4F'),(47,'4G'),(48,'4H'),(49,'5A'),(50,'5B'),(51,'5C'),(52,'5D'),(53,'5E'),(54,'5F'),
(55,'5G'),(56,'5H'),(57,'6A'),(58,'6B'),(59,'6C'),(60,'6D'),(61,'6E'),(62,'6F'),(63,'6G'),(64,'6H'),
(65,'7A'),(66,'7B'),(67,'7C'),(68,'7D'),(69,'7E'),(70,'7F'),(71,'7G'),(72,'7H'),(73,'8A'),(74,'8B'),
(75,'8C'),(76,'8D'),(101,'8E'),(78,'8F'),(79,'8G'),(80,'8H'),(81,'9A'),(82,'9B'),(83,'9C'),(84,'9D'),
(85,'9E'),(86,'9F'),(87,'9G'),(88,'9H');

CREATE TABLE `occupant_details` (
  `occupant_dtl_id` int NOT NULL AUTO_INCREMENT,
  `occupant_id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `relationship` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`occupant_dtl_id`),
  KEY `occ_app_occ_fk` (`occupant_id`),
  CONSTRAINT `occ_app_occ_fk` FOREIGN KEY (`occupant_id`) REFERENCES `occupants` (`occupant_id`),
  CONSTRAINT `occupant_dtl_occu_fk` FOREIGN KEY (`occupant_id`) REFERENCES `occupants` (`occupant_id`)
);
INSERT INTO `occupant_details` VALUES (1,2,'Jesintha','WIFE',NULL),(2,2,'Deon','SON',NULL);

CREATE TABLE `occupants` (
  `occupant_id` int NOT NULL AUTO_INCREMENT,
  `occupantcy_type` varchar(10) NOT NULL,
  `from_dt` date NOT NULL,
  `to_dt` date DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `landline_no` varchar(20) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alter_email` varchar(100) DEFAULT NULL,
  `whatsapp_enabled` varchar(1) NOT NULL,
  `permenant_address` varchar(200) DEFAULT NULL,
  `present_address` varchar(200) DEFAULT NULL,
  `identity_no` varchar(20) DEFAULT NULL,
  `identity_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`occupant_id`)
);
INSERT INTO `occupants` VALUES (1,'COMMON','2019-04-01',NULL,'Common',NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,NULL),
(2,'OWNER','2020-09-14',NULL,'Dixon Antony','','+919846911986','dixonantony@gmail.com','dixonantony@gmail.com','Y',NULL,NULL,'',''),
(3,'OWNER','2020-09-14',NULL,'JOHN THOMAS','+914682263051','+966555046422','johnpu5@gmail.com','johnsonpth@gmail.com','Y',NULL,NULL,NULL,NULL),
(4,'OWNER','2020-09-14',NULL,'PRAVEEN KUMAR P','','+918277363919','praveenk_p@rediffmail.com','','Y',NULL,NULL,'',''),
(20,'OWNER','2020-09-14',NULL,'KRISHNAN UNNI T','','9447290873','wariyarandwariyar@gmail.com','','Y',NULL,NULL,NULL,NULL),
(21,'OWNER','2020-09-14',NULL,'ABRAHAM C MATHEW','','9746983149','abcm2k8@gmail.com','','Y',NULL,NULL,NULL,NULL),
(22,'OWNER','2020-09-14',NULL,'T K RAGHAVAN','','9846204246','sajesh@stallionindia.com','','Y',NULL,NULL,NULL,NULL),
(23,'OWNER','2020-09-14',NULL,'K N RAJEE','','9446572656','vasukiprakash31@gmail.com','','Y',NULL,NULL,NULL,NULL),
(24,'OWNER','2020-09-14',NULL,'AJANTHA PRASATH','','8129053515','ajantaprasad@ymail.com','','Y',NULL,NULL,NULL,NULL),
(25,'OWNER','2020-09-14',NULL,'ANIL KUMAR P','','9445862862','anilkumarp.2868@gmail.com','','Y',NULL,NULL,NULL,NULL),
(26,'OWNER','2020-09-14',NULL,'LILLY YOHANNAN','4842534365','9846318480','lillyyohannan@gmail.com','','Y',NULL,NULL,NULL,NULL),
(27,'OWNER','2020-09-14',NULL,'SHANMUKHA DAS','4842537792','7994267679','','','Y',NULL,NULL,NULL,NULL),
(28,'OWNER','2020-09-14',NULL,'Dr VIJYA GOPAL','4792445303','9847041280','','','N',NULL,NULL,NULL,NULL),
(29,'OWNER','2020-09-14',NULL,'NOUSHAD C','','96899354909','naushadkkm@gmail.com','','Y',NULL,NULL,NULL,NULL),
(30,'OWNER','2020-09-14',NULL,'FEIDA SEN','','9562610933','feidasen@gmail.com','','Y',NULL,NULL,NULL,NULL),
(31,'OWNER','2020-09-14',NULL,'CHINNAMMA FRANCIS','7736753989',' 8089839692','joseph.ben30@gmail.com','','Y',NULL,NULL,NULL,NULL),
(32,'OWNER','2020-09-14',NULL,'Dr K K JOHN','4842368164','8547532393','drkkjohn2017@gmail.com','','Y',NULL,NULL,NULL,NULL),
(33,'OWNER','2020-09-14',NULL,'MADHU S NAIR','','9895765834','madhusankunny@gmail.com','','Y',NULL,NULL,NULL,NULL),
(34,'OWNER','2020-09-14',NULL,'C P PHILIPOSE','9744148245','00966565655347','mathewphilipose97@gmail.com','','Y',NULL,NULL,NULL,NULL),
(35,'OWNER','2020-09-14',NULL,'Dr PRAKAS ABRAHAM','4842806653','9497018588','prab54@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(36,'OWNER','2020-09-14',NULL,'A K MATHEW','4842340501','9447158009','adipuzha.k@gmail.com','','Y',NULL,NULL,NULL,NULL),
(37,'OWNER','2020-09-14',NULL,'SANKARAN UNNI','','9742643330','unnis28@gmail.com','','Y',NULL,NULL,NULL,NULL),
(38,'OWNER','2020-09-14',NULL,'JOSE V ABRAHAM','','9892034136','v.a.mathews19759@gmail.com','','N',NULL,NULL,NULL,NULL),
(39,'OWNER','2020-09-14',NULL,'K I THOMAS','','96892164446','thomaskuttikat@gmail.com','','Y',NULL,NULL,NULL,NULL),
(40,'OWNER','2020-09-14',NULL,'M C MADHU','','9895567656','mail.reena2010@gmail.com','','Y',NULL,NULL,NULL,NULL),
(41,'OWNER','2020-09-14',NULL,'ANAND KUMAR S K','','9847939338','anandyamuna@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(42,'OWNER','2020-09-14',NULL,'PREMALATHA MENON','4842328897','9846569451','prema.vappala@gmail.com','','Y',NULL,NULL,NULL,NULL),
(43,'OWNER','2020-09-14',NULL,'T R SRIDHAR','9444382419','9442289627','subbuh@gmail.com','','Y',NULL,NULL,NULL,NULL),
(44,'OWNER','2020-09-14',NULL,'DHINACHANDRAN','4842478887','9847416522','alwayetrimurti@gmail.com','','Y',NULL,NULL,NULL,NULL),
(45,'OWNER','2020-09-14',NULL,'MONCY P ABRAHAM','9495503203','00971504554758','moncy_abraham@emarat.ae','','Y',NULL,NULL,NULL,NULL),
(46,'OWNER','2020-09-14',NULL,'K K ALEXANDER','','9387095642','kkalexander1@gmail.com','','N',NULL,NULL,NULL,NULL),
(47,'OWNER','2020-09-14',NULL,'SUNNY C J','','9446539172','tcr@federalbank.co.in','','Y',NULL,NULL,NULL,NULL),
(48,'OWNER','2020-09-14',NULL,'MANOJ K','4842603647','8017523189','harimanoj@rediffmail.com','','Y',NULL,NULL,NULL,NULL),
(49,'OWNER','2020-09-14',NULL,'SAJI S NAIR','9446520682',' 9495347892','saji.sujilee@gmail.com','','Y',NULL,NULL,NULL,NULL),
(50,'OWNER','2020-09-14',NULL,'S SALEE','8891152061','9167932624','ss@sbi.co.in','','Y',NULL,NULL,NULL,NULL),
(51,'OWNER','2020-09-14',NULL,'J A PADMANABHAN','','491736309281','padmanabhja@rediffmail.com','','Y',NULL,NULL,NULL,NULL),
(52,'OWNER','2020-09-14',NULL,'MAHESWARI UNNI M','','9895875910','maheswariunni65@gmail.com','','Y',NULL,NULL,NULL,NULL),
(53,'OWNER','2020-09-14',NULL,'PRABHA NITHIN NAIR','','9846950003','nair.nithin@gmail.com','','Y',NULL,NULL,NULL,NULL),
(54,'OWNER','2020-09-14',NULL,'DIVYA K','4842809420','9447959548','kdivyatcc@gmail.com','','Y',NULL,NULL,NULL,NULL),
(55,'OWNER','2020-09-14',NULL,'K M JACOB','','8281080347','','','Y',NULL,NULL,NULL,NULL),
(56,'OWNER','2020-09-14',NULL,'C M JOSE','4842972004','9745635202','josecm@ymail.com','','Y',NULL,NULL,NULL,NULL),
(57,'OWNER','2020-09-14',NULL,'THOMAS VARGHESE P','4842336291','9995401569','marthom2005@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(58,'OWNER','2020-09-14',NULL,'JYOTHESWARI UNNI M','','9447134848','adv.s.radhakrishnan@gmail.com','','Y',NULL,NULL,NULL,NULL),
(59,'OWNER','2020-09-14',NULL,'ELIZABATH KURIAN','4842343884','9447034388','vinodkurian11@gmail.com','','Y',NULL,NULL,NULL,NULL),
(60,'OWNER','2020-09-14',NULL,'M P SUJITH','','9847435014','mpsujit@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(61,'OWNER','2020-09-14',NULL,'P R NAIR','','9895052844','indiranair@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(62,'OWNER','2020-09-14',NULL,'JOSE KUZHIPPILLY','4862222175','9447067292','jameskunnumel@gmail.com','','Y',NULL,NULL,NULL,NULL),
(63,'OWNER','2020-09-14',NULL,'PADMA KUMAR M','','8586009979','padmakumar.mnair@gmail.com','','Y',NULL,NULL,NULL,NULL),
(64,'OWNER','2020-09-14',NULL,'JANCY ANTONEY','','9446539172','sunnycj9163@gmail.com','','Y',NULL,NULL,NULL,NULL),
(65,'OWNER','2020-09-14',NULL,'RADHAKRISHNAN','','9447134848','adv.s.radhakrishnan@gmail.com','','Y',NULL,NULL,NULL,NULL),
(66,'OWNER','2020-09-14',NULL,'RAJESWARIUNNI M','4842334848','9447134848','adv.s.radhakrishnan@gmail.com','','Y',NULL,NULL,NULL,NULL),
(67,'OWNER','2020-09-14',NULL,'A N LAXMAN','','9846085779','geethalaxman9@gmail.com','','Y',NULL,NULL,NULL,NULL),
(68,'OWNER','2020-09-14',NULL,'C V BALASANKAR','4844010233','9847188887','cvbalasankar@yahoo.co.in','','Y',NULL,NULL,NULL,NULL),
(69,'OWNER','2020-09-14',NULL,'LIZ THOMAS','4842339952','9495735732','liljo3937@gmail.com','','N',NULL,NULL,NULL,NULL),
(70,'OWNER','2020-09-14',NULL,'REJITH KUMAR E T','','9447188524','rejithet@gmail.com','','Y',NULL,NULL,NULL,NULL),
(71,'OWNER','2020-09-14',NULL,'G VISWANATHAN','4842540992','','pkg.kutty@gmail.com','','N',NULL,NULL,NULL,NULL),
(72,'OWNER','2020-09-14',NULL,'Lt Col K G RAMACHANDRAN','4844853338','9947338338','rkg.ambadi@gmail.com','','Y',NULL,NULL,NULL,NULL),
(73,'OWNER','2020-09-14',NULL,'MARY JOY','','8593944825','anitha.joy79@gmail.com','','Y',NULL,NULL,NULL,NULL),
(74,'OWNER','2020-09-14',NULL,'SANOOP S','','8138911737','sanoopsadanandank@gmail.com','','Y',NULL,NULL,NULL,NULL),
(75,'OWNER','2020-09-14',NULL,'V K ANISH','8921174124',' 8289893436','anishvkunjumon@gmail.com','','Y',NULL,NULL,NULL,NULL),
(76,'OWNER','2020-09-14',NULL,'JOB KATTITHARA','4842334773','9526846166','francisjobdce@rediffmail.com','','Y',NULL,NULL,NULL,NULL),
(78,'OWNER','2020-09-14',NULL,'BALAKRISHNA PANIKER','','9446479439','thoppilpanicker@gmail.com','','Y',NULL,NULL,NULL,NULL),
(79,'OWNER','2020-09-14',NULL,'PRASAD K PAUL','','9072334254','prasadkpaul@gmail.com','','Y',NULL,NULL,NULL,NULL),
(80,'OWNER','2020-09-14',NULL,'AMITH RAJ','','9947882007','amith2007@gmail.com','','Y',NULL,NULL,NULL,NULL),
(81,'OWNER','2020-09-14',NULL,'HEMANTH P NARAYANAN','','9847435014','narayananhemanth@gmail.com','','Y',NULL,NULL,NULL,NULL),
(82,'OWNER','2020-09-14',NULL,'SUDHISH KUMAR K V','','447865665631','sudhishmosc@gmail.com','','Y',NULL,NULL,NULL,NULL),
(83,'OWNER','2020-09-14',NULL,'HARIKUMARAN NAIR','','9605156095','kumardxb7@gmail.com','','Y',NULL,NULL,NULL,NULL),
(84,'OWNER','2020-09-14',NULL,'VALSALA C PILLAI','4842343195','9176674804','krpillaianugraha@gmail.com','','Y',NULL,NULL,NULL,NULL),
(85,'OWNER','2020-09-14',NULL,'VISWANATHA SHENOY','4842556329','9895034653','mailtorrt@gmail.com','','N',NULL,NULL,NULL,NULL),
(86,'OWNER','2020-09-14',NULL,'SYAMALA VARMA','4842442934','','','','N',NULL,NULL,NULL,NULL),
(87,'OWNER','2020-09-14',NULL,'CAPT ANIL RAMAN','','9482561354','gayatreeanil@gmail.com','','Y',NULL,NULL,NULL,NULL),
(88,'OWNER','2020-09-14',NULL,'MANOHARA VARMA','','8589040019','varmasree53@gmail.com','','Y',NULL,NULL,NULL,NULL),
(89,'OWNER','2020-09-14',NULL,'T M ELDHO','9446477978',' 9497679402','tmeldo@gmail.com','ct.jose6@gmail.com','Y',NULL,NULL,NULL,NULL),
(90,'OWNER','2020-09-14',NULL,'B SABU','4842340123','9447727772','sabusindhuram@gmail.com','','Y',NULL,NULL,NULL,NULL),
(91,'OWNER','2020-09-14',NULL,'K RADHAKRISHNA PILLAI','4842343195','9176674804','krpillaianugraha@gmail.com','','Y',NULL,NULL,NULL,NULL),
(92,'OWNER','2020-09-14',NULL,'ANTONY KOTTACKAL','','9819635675','anto.kot@gmail.com','','Y',NULL,NULL,NULL,NULL),
(93,'OWNER','2020-09-14',NULL,'RATHNAM RAMESH','','9447327458','ashukuttyarukutty@gmail.com','','Y',NULL,NULL,NULL,NULL),
(94,'OWNER','2020-09-14',NULL,'SUSY THOMAS','','971505404224','aniyans@gmail.com','','Y',NULL,NULL,NULL,NULL),
(95,'OWNER','2020-09-14',NULL,'KIRAN DIVAKAR','','9387045342','divakar.kiran@gmail.com','','Y',NULL,NULL,NULL,NULL),
(96,'OWNER','2020-09-14',NULL,'HARIDHASAN M R','','9846066400','haridhasan.mr@gmail.com','','Y',NULL,NULL,NULL,NULL),
(97,'OWNER','2020-09-14',NULL,'REMA SREEKUMAR','2228079133','9820139726','sreekumar1954@hotmail.com','','Y',NULL,NULL,NULL,NULL),
(98,'OWNER','2020-09-14',NULL,'JAYARAJ R K','9846404099',' +971503120900','jayarajchathanath@gmail.com','','Y',NULL,NULL,NULL,NULL),
(99,'OWNER','2020-09-14',NULL,'Dr K NARAYANAN','+917012562539','+919747550353','ragendu02@gmail.com','','Y',NULL,NULL,NULL,NULL),
(101,'OWNER','2020-09-14',NULL,'','','','','','N',NULL,NULL,NULL,NULL),
(102,'OWNER','2020-09-14',NULL,'T J GOPINATH','','9388600962','tjgopi@gmail.com','','Y',NULL,NULL,NULL,NULL),
(103,'OWNER','2020-09-14',NULL,'P D JEEVAN','','9387178448','jithagopi1@gmail.com','','Y',NULL,NULL,NULL,NULL),
(104,'OWNER','2020-09-14',NULL,'GEETHA MAHADEVAN','','8089001080','kmkkmd@gmail.com','','Y',NULL,NULL,NULL,NULL);

CREATE TABLE `owner_dtls` (
  `SlNo` int DEFAULT NULL,
  `FlatNo` text,
  `Name` text,
  `LandLineNo` text,
  `MobileNo` text,
  `AlterEmailId` text,
  `EmailId` text,
  `Whatsapp` text
);

INSERT INTO `owner_dtls` VALUES (1,'1A','PRAVEEN KUMAR P','','8277363919','','praveenk_p@rediffmail.com','YES'),
(2,'1B','JOHN THOMAS','4682263051','+966555046422','johnsonpth@gmail.com','johnpu5@gmail.com','YES'),
(3,'1C','KRISHNAN UNNI T','','9447290873','','wariyarandwariyar@gmail.com','YES'),
(4,'1D','ABRAHAM C MATHEW','','9746983149','','abcm2k8@gmail.com','YES'),
(5,'1E','T K RAGHAVAN','','9846204246','','sajesh@stallionindia.com','YES'),
(6,'1F','K N RAJEE','','9446572656','','vasukiprakash31@gmail.com','YES'),
(7,'1G','AJANTHA PRASATH','','8129053515','','ajantaprasad@ymail.com','YES'),
(8,'1H','ANIL KUMAR P','','9445862862','','anilkumarp.2868@gmail.com','YES'),
(9,'2A','LILLY YOHANNAN','4842534365','9846318480','','lillyyohannan@gmail.com','YES'),
(10,'2B','SHANMUKHA DAS','4842537792','7994267679','','','YES'),
(11,'2C','Dr VIJYA GOPAL','4792445303','9847041280','','',''),
(12,'2D','NOUSHAD C','','96899354909','','naushadkkm@gmail.com','YES'),
(13,'2E','FEIDA SEN','','9562610933','','feidasen@gmail.com','YES'),
(14,'2F','CHINNAMMA FRANCIS','7736753989',' 8089839692','','joseph.ben30@gmail.com','YES'),
(15,'2G','Dr K K JOHN','4842368164','8547532393','','drkkjohn2017@gmail.com','YES'),
(16,'2H','MADHU S NAIR','','9895765834','','madhusankunny@gmail.com','YES'),
(17,'3A','C P PHILIPOSE','9744148245','00966565655347','','mathewphilipose97@gmail.com','YES'),
(18,'3B','Dr PRAKAS ABRAHAM','4842806653','9497018588','','prab54@hotmail.com','YES'),
(19,'3C','A K MATHEW','4842340501','9447158009','','adipuzha.k@gmail.com','YES'),
(20,'3D','SANKARAN UNNI','','9742643330','','unnis28@gmail.com','YES'),
(21,'3E','JOSE V ABRAHAM','','9892034136','','v.a.mathews19759@gmail.com',''),
(22,'3F','K I THOMAS','','96892164446','','thomaskuttikat@gmail.com','YES'),
(23,'3G','M C MADHU','','9895567656','','mail.reena2010@gmail.com','YES'),
(24,'3H','ANAND KUMAR S K','','9847939338','','anandyamuna@hotmail.com','YES'),
(25,'4A','PREMALATHA MENON','4842328897','9846569451','','prema.vappala@gmail.com','YES'),
(26,'4B','T R SRIDHAR','9444382419','9442289627','','subbuh@gmail.com','YES'),
(27,'4C','DHINACHANDRAN','4842478887','9847416522','','alwayetrimurti@gmail.com','YES'),
(28,'4D','DIXON P A','','9846911986','','dixonantony@gmail.com','YES'),
(29,'4E','MONCY P ABRAHAM','9495503203','00971504554758','','moncy_abraham@emarat.ae','YES'),
(30,'4F','K K ALEXANDER','','9387095642','','kkalexander1@gmail.com',''),
(31,'4G','SUNNY C J','','9446539172','','tcr@federalbank.co.in','YES'),
(32,'4H','MANOJ K','4842603647','8017523189','','harimanoj@rediffmail.com','YES'),
(33,'5A','SAJI S NAIR','9446520682',' 9495347892','','saji.sujilee@gmail.com','YES'),
(34,'5B','S SALEE','8891152061','9167932624','','ss@sbi.co.in','YES'),
(35,'5C','J A PADMANABHAN','','491736309281','','padmanabhja@rediffmail.com','YES'),
(36,'5D','MAHESWARI UNNI M','','9895875910','','maheswariunni65@gmail.com','YES'),
(37,'5E','PRABHA NITHIN NAIR','','9846950003','','nair.nithin@gmail.com','YES'),
(38,'5F','DIVYA K','4842809420','9447959548','','kdivyatcc@gmail.com','YES'),
(39,'5G','K M JACOB','','8281080347','','','YES'),
(40,'5H','C M JOSE','4842972004','9745635202','','josecm@ymail.com','YES'),
(41,'6A','THOMAS VARGHESE P','4842336291','9995401569','','marthom2005@hotmail.com','YES'),
(42,'6B','JYOTHESWARI UNNI M','','9447134848','','adv.s.radhakrishnan@gmail.com','YES'),
(43,'6C','ELIZABATH KURIAN','4842343884','9447034388','','vinodkurian11@gmail.com','YES'),
(44,'6D','M P SUJITH','','9847435014','','mpsujit@hotmail.com','YES'),
(45,'6E','P R NAIR','','9895052844','','indiranair@hotmail.com','YES'),
(46,'6F','JOSE KUZHIPPILLY','4862222175','9447067292','','jameskunnumel@gmail.com','YES'),
(47,'6G','PADMA KUMAR M','','8586009979','','padmakumar.mnair@gmail.com','YES'),
(48,'6H','JANCY ANTONEY','','9446539172','','sunnycj9163@gmail.com','YES'),
(49,'7A','RADHAKRISHNAN','','9447134848','','adv.s.radhakrishnan@gmail.com','YES'),
(50,'7B','RAJESWARIUNNI M','4842334848','9447134848','','adv.s.radhakrishnan@gmail.com','YES'),
(51,'7C','A N LAXMAN','','9846085779','','geethalaxman9@gmail.com','YES'),
(52,'7D','C V BALASANKAR','4844010233','9847188887','','cvbalasankar@yahoo.co.in','YES'),
(53,'7E','LIZ THOMAS','4842339952','9495735732','','liljo3937@gmail.com',''),
(54,'7F','REJITH KUMAR E T','','9447188524','','rejithet@gmail.com','YES'),
(55,'7G','G VISWANATHAN','4842540992','','','pkg.kutty@gmail.com',''),
(56,'7H','Lt Col K G RAMACHANDRAN','4844853338','9947338338','','rkg.ambadi@gmail.com','YES'),
(57,'8A','MARY JOY','','8593944825','','anitha.joy79@gmail.com','YES'),
(58,'8B','SANOOP S','','8138911737','','sanoopsadanandank@gmail.com','YES'),
(59,'8C','V K ANISH','8921174124',' 8289893436','','anishvkunjumon@gmail.com','YES'),
(60,'8D','JOB KATTITHARA','4842334773','9526846166','','francisjobdce@rediffmail.com','YES'),
(61,'8E','','','','','',''),
(62,'8F','BALAKRISHNA PANIKER','','9446479439','','thoppilpanicker@gmail.com','YES'),
(63,'8G','PRASAD K PAUL','','9072334254','','prasadkpaul@gmail.com','YES'),
(64,'8H','AMITH RAJ','','9947882007','','amith2007@gmail.com','YES'),
(65,'9A','HEMANTH P NARAYANAN','','9847435014','','narayananhemanth@gmail.com','YES'),
(66,'9B','SUDHISH KUMAR K V','','447865665631','','sudhishmosc@gmail.com','YES'),
(67,'9C','HARIKUMARAN NAIR','','9605156095','','kumardxb7@gmail.com','YES'),
(68,'9D','VALSALA C PILLAI','4842343195','9176674804','','krpillaianugraha@gmail.com','YES'),
(69,'9E','VISWANATHA SHENOY','4842556329','9895034653','','mailtorrt@gmail.com',''),
(70,'9F','SYAMALA VARMA','4842442934','','','',''),
(71,'9G','CAPT ANIL RAMAN','','9482561354','','gayatreeanil@gmail.com','YES'),
(72,'9H','MANOHARA VARMA','','8589040019','','varmasree53@gmail.com','YES'),
(73,'10A','T M ELDHO','9446477978',' 9497679402','ct.jose6@gmail.com','tmeldo@gmail.com','YES'),
(74,'10B','B SABU','4842340123','9447727772','','sabusindhuram@gmail.com','YES'),
(75,'10C','K RADHAKRISHNA PILLAI','4842343195','9176674804','','krpillaianugraha@gmail.com','YES'),
(76,'10D','ANTONY KOTTACKAL','','9819635675','','anto.kot@gmail.com','YES'),
(77,'10E','RATHNAM RAMESH','','9447327458','','ashukuttyarukutty@gmail.com','YES'),
(78,'10F','SUSY THOMAS','','971505404224','','aniyans@gmail.com','YES'),
(79,'10G','KIRAN DIVAKAR','','9387045342','','divakar.kiran@gmail.com','YES'),
(80,'10H','HARIDHASAN M R','','9846066400','','haridhasan.mr@gmail.com','YES'),
(81,'11A','REMA SREEKUMAR','2228079133','9820139726','','sreekumar1954@hotmail.com','YES'),
(82,'11B','JAYARAJ R K','9846404099',' +971503120900','','jayarajchathanath@gmail.com','YES'),
(83,'11C','Dr K NARAYANAN','','9747550353','','ragendu02@gmail.com','YES'),
(84,'11D','Dr K NARAYANAN','','7012562539','','ragendu02@gmail.com','YES'),
(85,'11E','','','','','',''),
(86,'11F','T J GOPINATH','','9388600962','','tjgopi@gmail.com','YES'),
(87,'11G','P D JEEVAN','','9387178448','','jithagopi1@gmail.com','YES'),
(88,'11H','GEETHA MAHADEVAN','','8089001080','','kmkkmd@gmail.com','YES');

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `code` varchar(3) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
);

INSERT INTO `payment_type` VALUES ('CHQ','Cheque'),('CRD','Card'),('CSH','Cash'),('NBK','Net Banking');

DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_cd` varchar(4) NOT NULL,
  `sub_menu_cd` varchar(4) NOT NULL,
  `enable_view` varchar(1) DEFAULT NULL,
  `enable_save` varchar(1) DEFAULT NULL,
  `enable_delete` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`role_cd`,`sub_menu_cd`),
  KEY `role_menu_smenu_fk_idx` (`sub_menu_cd`),
  CONSTRAINT `role_menu_role_fk` FOREIGN KEY (`role_cd`) REFERENCES `roles` (`role_cd`),
  CONSTRAINT `role_menu_smenu_fk` FOREIGN KEY (`sub_menu_cd`) REFERENCES `sub_menus` (`sub_menu_cd`)
);
INSERT INTO `role_menu` VALUES ('ADMN','ACTS','Y','Y','Y'),('ADMN','DEXP','Y','Y','Y'),
('ADMN','ROLS','Y','Y','Y'),('ADMN','TCTY','Y','Y','Y'),('ADMN','TSMT','Y','Y','Y'),
('ADMN','TSUM','Y','Y','Y'),('ADMN','USRS','Y','Y','Y'),('CMBR','ACTS','Y','N','N'),
('CMBR','DEXP','Y','N','N'),('CMBR','ROLS','Y','N','N'),('CMBR','TCTY','Y','N','N'),
('CMBR','TSMT','Y','N','N'),('CMBR','TSUM','Y','N','N'),('CMBR','USRS','Y','N','N'),
('GEST','ACTS','Y','N','N'),('GEST','DEXP','Y','N','N'),('GEST','TCTY','Y','N','N'),
('GEST','TSMT','Y','N','N'),('GEST','TSUM','Y','N','N'),('GEST','USRS','Y','N','N'),
('SCTY','ACTS','Y','Y','Y'),('SCTY','DEXP','Y','Y','Y'),('SCTY','ROLS','Y','Y','Y'),
('SCTY','TCTY','Y','Y','Y'),('SCTY','TSMT','Y','Y','Y'),('SCTY','TSUM','Y','Y','Y'),
('SCTY','USRS','Y','Y','Y');

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_cd` varchar(4) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_cd`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
);

INSERT INTO `roles` VALUES ('ADMN','admin','Super User'),
('CMBR','Commitee Member','Management commitee member'),
('GEST','Guest','Role given for demo'),('SCTY','Secretary','Secretary');

DROP TABLE IF EXISTS `sub_menus`;
CREATE TABLE `sub_menus` (
  `sub_menu_cd` varchar(4) NOT NULL,
  `menu_cd` varchar(4) NOT NULL,
  `sub_menu_name` varchar(45) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  PRIMARY KEY (`sub_menu_cd`),
  KEY `submenu_menu_fk_idx` (`menu_cd`),
  CONSTRAINT `submenu_menu_fk` FOREIGN KEY (`menu_cd`) REFERENCES `menus` (`menu_cd`)
);

INSERT INTO `sub_menus` VALUES ('ACTS','STNG','Accounts','list-accounts'),
('DEXP','ACNT','Daily Expense','daily-expense/:expenseid'),
('OCPT','IHSE','Occupants','list-occupants'),
('ROLS','STNG','Roles','list-roles'),
('TCTY','STNG','Transaction Category','list-trans-category'),
('TSMT','RPTS','Transactions Statement','transactions-report'),
('TSUM','RPTS','Transactions Summary','trans-summary-report'),
('USRS','STNG','Users','list-users');

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_desc` varchar(200) NOT NULL,
  `trans_sub_cat_cd` varchar(4) NOT NULL,
  `credit_debit` varchar(3) NOT NULL,
  `transaction_ref_no` varchar(45) DEFAULT NULL,
  `account_cd` varchar(4) NOT NULL,
  `payment_type` varchar(3) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `username` varchar(45) NOT NULL,
  `voucher_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `trans_sub_cat_fk_idx` (`trans_sub_cat_cd`),
  KEY `trans_account_fk_idx` (`account_cd`),
  KEY `trans_user_fk_idx` (`username`),
  CONSTRAINT `trans_account_fk` FOREIGN KEY (`account_cd`) REFERENCES `accounts` (`account_cd`),
  CONSTRAINT `trans_trans_sub_cat_fk` FOREIGN KEY (`trans_sub_cat_cd`) REFERENCES `transaction_sub_category` (`trans_sub_cat_cd`),
  CONSTRAINT `trans_user_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);
INSERT INTO `transaction` VALUES (5,'Ramesh','WSTD','CDT','cash','CINH','CSH',9000.00,'2020-04-03 00:00:00','2020-08-30 12:36:44','2020-09-02 22:50:01','admin','1'),(6,'Generator','DESL','CDT','cash','CINH','CSH',4177.20,'2020-04-03 00:00:00','2020-08-30 12:43:52','2020-09-02 22:51:26','admin','3'),(7,'Radhakrishnan','CLNM','CDT','cash','CINH','CSH',800.00,'2020-04-03 00:00:00','2020-08-30 12:45:38','2020-09-02 22:50:45','admin','2'),(8,'Auto charge-diesel','TRVE','CDT','cash','CINH','CSH',100.00,'2020-04-03 00:00:00','2020-08-30 12:48:02','2020-09-02 22:52:10','admin','4'),(9,'Suresh','CTKR','CDT','cash','CINH','CSH',7567.00,'2020-04-03 00:00:00','2020-08-30 12:50:00','2020-09-02 23:17:47','admin','5'),(10,' Pushpa ','SWPR','CDT','cash','CINH','CSH',9334.00,'2020-04-03 00:00:00','2020-08-30 13:41:51','2020-09-02 23:18:14','admin','6'),(11,'Radhakrishnan','GNDM','CDT','cash','CINH','CSH',500.00,'2020-04-09 00:00:00','2020-08-30 13:44:22','2020-09-02 23:18:48','admin','7'),(12,'Water tanker-2 loads','WATR','CDT','cash','CINH','CSH',2000.00,'2020-04-09 00:00:00','2020-08-30 13:45:48','2020-09-02 23:19:12','admin','8'),(13,'Dettol','CONS','CDT','cash','CINH','CSH',160.00,'2020-04-19 00:00:00','2020-08-30 13:46:37','2020-09-03 19:31:43','admin','9'),(14,'Herbicide 1 litre','GNDM','CDT','cash','CINH','CSH',400.00,'2020-04-24 00:00:00','2020-08-30 13:49:18','2020-09-02 23:20:11','admin','10'),(15,'Radhakrishnan','CLNM','CDT','cash','CINH','CSH',500.00,'2020-04-24 00:00:00','2020-08-30 13:51:35','2020-09-02 23:20:45','admin','11'),(16,'Account print prabha sales','PRST','CDT','cash','CINH','CSH',411.00,'2020-04-28 00:00:00','2020-08-30 13:58:14','2020-09-02 23:21:11','admin','12'),(17,'Radhakrishnan','CLNM','CDT','cash','CINH','CSH',500.00,'2020-05-02 00:00:00','2020-08-30 16:05:57','2020-09-02 23:23:11','admin','15'),(18,'Security incentive may april','SCTY','CDT','cash','CINH','CSH',2000.00,'2020-05-02 00:00:00','2020-08-30 18:01:15','2020-09-02 23:23:30','admin','16'),(19,'Drinking water 10 bottles','CONS','CDT','cash','CINH','CSH',500.00,'2020-05-05 00:00:00','2020-08-30 18:02:50','2020-09-02 23:23:51','admin','17'),(20,'Green age herbicides 1ltr','GNDM','CDT','cash','CINH','CSH',650.00,'2020-05-05 00:00:00','2020-08-30 18:04:56','2020-09-02 23:21:52','admin','18'),(21,'Ramesh','WSTD','CDT','cash','CINH','CSH',9000.00,'2020-05-06 00:00:00','2020-08-30 18:06:20','2020-09-02 23:24:13','admin','19'),(22,'Radhakrishnan','CLNM','CDT','cash','CINH','CSH',500.00,'2020-05-06 00:00:00','2020-08-30 18:07:43','2020-09-02 23:25:16','admin','20'),(23,'Sink wash','REPM','CDT','cash','CINH','CSH',1500.00,'2020-05-07 00:00:00','2020-08-30 18:32:08','2020-09-02 23:25:37','admin','21'),(24,'Foot valve','REPM','CDT','cash','CINH','CSH',1800.00,'2020-05-08 00:00:00','2020-08-30 18:35:31','2020-09-02 23:25:53','admin','22'),(25,'Phenol 1 liter','CLNM','CDT','cash','CINH','CSH',50.00,'2020-05-09 00:00:00','2020-08-30 18:37:02','2020-09-02 23:26:16','admin','23'),(26,'Glass holder APK sink','REPM','CDT','cash','CINH','CSH',140.00,'2020-05-09 00:00:00','2020-08-30 18:39:11','2020-09-02 23:26:36','admin','24'),(27,'Sewage cleaning','REPM','CDT','cash','CINH','CSH',3532.00,'2020-05-09 00:00:00','2020-08-30 18:40:40','2020-09-02 23:27:02','admin','25'),(28,'Lutham ET','REPM','CDT','cash','CINH','CSH',4000.00,'2020-05-09 00:00:00','2020-08-30 18:42:36','2020-09-02 23:27:24','admin','26'),(29,'Anthoppan scaffolding','REPM','CDT','cash','CINH','CSH',8000.00,'2020-05-09 00:00:00','2020-08-30 18:43:56','2020-09-02 23:27:41','admin','27'),(30,'Antony- Roof mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-09 00:00:00','2020-08-30 18:47:05','2020-09-02 23:28:18','admin','28'),(31,'Antony Roof mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-11 00:00:00','2020-08-30 18:48:21','2020-09-02 23:28:37','admin','29'),(32,'KWA water bill','WATR','CDT','cash','CINH','CSH',12319.00,'2020-05-13 00:00:00','2020-08-30 18:49:35','2020-09-02 23:29:02','admin','29'),(33,'Ground','GNDM','CDT','cash','CINH','CSH',200.00,'2020-05-13 00:00:00','2020-08-30 18:51:54','2020-09-02 23:29:23','admin','30'),(34,'Spring Waste room','REPM','CDT','cash','CINH','CSH',30.00,'2020-05-13 00:00:00','2020-08-30 19:15:10','2020-09-02 23:29:59','admin','31'),(35,'Antony mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-12 00:00:00','2020-08-30 19:16:26','2020-09-02 23:22:33','admin','32'),(36,'Antony Mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-13 00:00:00','2020-08-30 19:17:28','2020-09-02 23:30:25','admin','33'),(37,'Antony Mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-14 00:00:00','2020-08-30 19:18:18','2020-09-02 23:31:02','admin','34'),(38,'John Ground clearing','GNDM','CDT','cash','CINH','CSH',800.00,'2020-05-15 00:00:00','2020-08-30 19:20:12','2020-09-02 23:31:40','admin','36'),(39,'Antony Mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-15 00:00:00','2020-08-30 19:21:36','2020-09-02 23:32:10','admin','35'),(40,'David Ground clearing','GNDM','CDT','cash','CINH','CSH',800.00,'2020-05-15 00:00:00','2020-08-30 19:35:18','2020-09-02 23:32:41','admin','37'),(41,'Ramesh G Ground clearing','GNDM','CDT','cash','CINH','CSH',800.00,'2020-05-15 00:00:00','2020-08-30 19:36:34','2020-09-02 23:33:12','admin','38'),(42,'Antony Mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-16 00:00:00','2020-08-30 19:37:39','2020-09-02 23:51:40','admin','39'),(43,'Lunch/snacks  for labours','CONS','CDT','cash','CINH','CSH',510.00,'2020-05-16 00:00:00','2020-08-30 19:39:07','2020-09-03 19:35:28','admin','40'),(44,'Broom','CLNM','CDT','cash','CINH','CSH',90.00,'2020-05-16 00:00:00','2020-08-30 19:40:03','2020-09-03 19:35:51','admin','41'),(45,'Antony mirror','REPM','CDT','cash','CINH','CSH',5000.00,'2020-05-18 00:00:00','2020-08-30 19:41:19','2020-09-02 23:45:44','admin','43'),(46,'Auto charge','TRVE','CDT','cash','CINH','CSH',50.00,'2020-05-18 00:00:00','2020-08-30 19:42:48','2020-09-02 23:52:00','admin','44'),(47,'Electricity bill','ELEC','CDT','cash','CINH','CSH',460.00,'2020-05-20 00:00:00','2020-08-30 19:43:53','2020-09-03 19:36:29','admin','45'),(48,'Drinking water','CONS','CDT','cash','CINH','CSH',450.00,'2020-05-26 00:00:00','2020-08-30 19:46:33','2020-09-02 23:44:47','admin','46'),(49,'Broom ,Handwash','CLNM','CDT','cash','CINH','CSH',174.00,'2020-05-26 00:00:00','2020-08-30 19:47:56','2020-09-02 23:52:52','admin','47'),(50,'Varghees','REPM','CDT','cash','CINH','CSH',2000.00,'2020-05-26 00:00:00','2020-08-30 19:48:49','2020-09-02 23:52:12','admin','48'),(51,'Santizer-Rejith','PRST','CDT','cash','CINH','CSH',1797.00,'2020-05-27 00:00:00','2020-08-30 19:50:58','2020-09-03 19:37:20','admin','49'),(52,'Joji cleaning','GNDM','CDT','cash','CINH','CSH',800.00,'2020-05-29 00:00:00','2020-08-30 19:51:56','2020-09-02 23:42:43','admin','50'),(53,'Santizer','PRST','CDT','cash','CINH','CSH',375.00,'2020-05-29 00:00:00','2020-08-30 19:52:51','2020-09-02 23:42:33','admin','51'),(54,'Dhanapal cleaning','GNDM','CDT','cash','CINH','CSH',100.00,'2020-05-29 00:00:00','2020-08-30 19:53:44','2020-09-02 23:42:24','admin','52'),(55,'74H Battery','ELEL','CDT','cash','CINH','CSH',750.00,'2020-05-30 00:00:00','2020-08-31 08:26:59','2020-09-02 23:42:15','admin','53'),(56,'Manu ten','PRST','CDT','cash','CINH','CSH',25.00,'2020-05-30 00:00:00','2020-08-31 08:28:06','2020-09-02 23:42:03','admin','54'),(57,'Suresh','CTKR','CDT','cash','CINH','CSH',3792.00,'2020-05-30 00:00:00','2020-08-31 08:28:59','2020-09-02 23:41:52','admin','55'),(58,'Ramesh','WSTD','CDT','cash','CINH','CSH',9000.00,'2020-05-30 00:00:00','2020-08-31 08:30:05','2020-09-02 23:41:42','admin','56'),(59,'Jerry','REPM','CDT','cash','CINH','CSH',200.00,'2020-05-30 00:00:00','2020-08-31 08:31:04','2020-09-02 23:41:32','admin','57'),(60,'Jerry','REPM','CDT','cash','CINH','CSH',2500.00,'2020-05-30 00:00:00','2020-08-31 08:31:57','2020-09-02 23:41:20','admin','58'),(61,'Joji','GNDM','CDT','cash','CINH','CSH',800.00,'2020-05-30 00:00:00','2020-08-31 08:32:50','2020-09-02 23:41:05','admin','59'),(62,'Dettol','CONS','CDT','cash','CINH','CSH',160.00,'2020-06-01 00:00:00','2020-08-31 08:39:49','2020-09-02 23:40:42','admin','60'),(63,'Pens','PRST','CDT','cash','CINH','CSH',20.00,'2020-06-01 00:00:00','2020-08-31 08:40:53','2020-09-02 23:40:33','admin','61'),(64,'Joji cleaning','GNDM','CDT','cash','CINH','CSH',800.00,'2020-06-02 00:00:00','2020-08-31 08:41:51','2020-09-02 23:40:23','admin','62'),(65,'BSNL bill','PSTE','CDT','BSNL','CINH','CSH',1140.00,'2020-06-03 00:00:00','2020-08-31 08:43:15','2020-09-02 23:40:15','admin','63'),(66,'Drinking water -2','CONS','CDT','cash','CINH','CSH',100.00,'2020-06-03 00:00:00','2020-08-31 08:44:05','2020-09-03 19:39:00','admin','64'),(67,'Joji cleaning','GNDM','CDT','cash','CINH','CSH',800.00,'2020-06-03 00:00:00','2020-08-31 08:44:57','2020-09-03 19:38:42','admin','65'),(68,'Cement etc drainage','REPM','CDT','cash','CINH','CSH',1680.00,'2020-06-04 00:00:00','2020-08-31 08:46:19','2020-09-02 23:38:40','admin','66'),(69,'Printout','PRST','CDT','cash','CINH','CSH',39.00,'2020-06-04 00:00:00','2020-08-31 08:47:11','2020-09-02 23:38:30','admin','67'),(70,'Oil can','PRST','CDT','cash','CINH','CSH',90.00,'2020-06-04 00:00:00','2020-08-31 08:48:03','2020-09-02 23:38:22','admin','68'),(71,'Food security','MSLN','CDT','cash','CINH','CSH',2650.00,'2020-06-04 00:00:00','2020-08-31 08:49:04','2020-09-02 23:38:14','admin','69'),(72,'Vargheese','REPM','CDT','cash','CINH','CSH',661.00,'2020-06-06 00:00:00','2020-08-31 08:49:59','2020-09-02 23:37:53','admin','70'),(73,'Sanitizer 5 liter','PRST','CDT','cash','CINH','CSH',1711.00,'2020-06-06 00:00:00','2020-08-31 08:50:56','2020-09-02 23:37:44','admin','71'),(74,'Broom/mop etc','CLNM','CDT','cash','CINH','CSH',505.00,'2020-06-08 00:00:00','2020-08-31 08:51:53','2020-09-02 23:37:32','admin','72'),(75,'Cloth/Collin etc','CLNM','CDT','cash','CINH','CSH',738.00,'2020-06-11 00:00:00','2020-08-31 11:00:01','2020-09-02 23:37:23','admin','73'),(76,'Book /calculation','PRST','CDT','cash','CINH','CSH',600.00,'2020-06-12 00:00:00','2020-08-31 11:01:33','2020-09-02 23:37:14','admin','74'),(77,'Engine -D Generator','DESL','CDT','cash','CINH','CSH',4890.00,'2020-06-12 00:00:00','2020-08-31 11:02:57','2020-09-02 23:37:03','admin','75'),(78,'Auto','TRVE','CDT','cash','CINH','CSH',70.00,'2020-06-12 00:00:00','2020-08-31 11:38:14','2020-09-02 23:36:52','admin','76'),(79,'Raghavan','GNDM','CDT','cash','CINH','CSH',200.00,'2020-06-12 00:00:00','2020-08-31 11:39:36','2020-09-02 23:36:43','admin','77'),(80,'DE repair','REPM','CDT','cash','CINH','CSH',545.00,'2020-06-12 00:00:00','2020-08-31 11:41:01','2020-09-02 23:36:35','admin','78'),(81,'Jeyroom','REPM','CDT','cash','CINH','CSH',1600.00,'2020-06-12 00:00:00','2020-08-31 11:42:32','2020-09-02 23:36:24','admin','79'),(82,'Soap dish','PRST','CDT','cash','CINH','CSH',65.00,'2020-06-13 00:00:00','2020-08-31 11:43:37','2020-09-02 23:36:15','admin','80'),(83,'Cement','REPM','CDT','cash','CINH','CSH',100.00,'2020-06-16 00:00:00','2020-08-31 11:44:48','2020-09-02 23:36:06','admin','81'),(84,'Texa','CLNM','CDT','cash','CINH','CSH',40.00,'2020-06-16 00:00:00','2020-08-31 11:45:34','2020-09-02 23:35:56','admin','82'),(85,'Join Damage','REPM','CDT','cash','CINH','CSH',2500.00,'2020-06-16 00:00:00','2020-08-31 11:47:21','2020-09-02 23:35:46','admin','83'),(86,'Handwash','CONS','CDT','cash','CINH','CSH',70.00,'2020-06-18 00:00:00','2020-08-31 11:48:39','2020-09-02 23:35:36','admin','84'),(87,'Balcony filter','REPM','CDT','cash','CINH','CSH',1030.00,'2020-06-18 00:00:00','2020-08-31 11:50:15','2020-09-02 23:35:26','admin','85'),(88,'POC Pipe','REPM','CDT','cash','CINH','CSH',390.00,'2020-06-19 00:00:00','2020-08-31 11:51:51','2020-09-02 23:35:15','admin','86'),(89,'Notice sabu','PRST','CDT','cash','CINH','CSH',2000.00,'2020-06-20 00:00:00','2020-08-31 11:53:05','2020-09-02 23:34:55','admin','87'),(90,'Varghese plumber','REPM','CDT','cash','CINH','CSH',300.00,'2020-06-20 00:00:00','2020-08-31 11:54:15','2020-09-02 23:34:43','admin','88'),(91,'Annu sweeper advance','SWPR','CDT','cash','CINH','CSH',500.00,'2020-06-23 00:00:00','2020-08-31 11:55:30','2020-09-02 23:34:31','admin','89'),(92,'Drinking water ','CONS','CDT','cash','CINH','CSH',300.00,'2020-06-25 00:00:00','2020-08-31 11:56:38','2020-09-02 23:34:17','admin','90'),(93,'Jerry','REPM','CDT','cash','CINH','CSH',500.00,'2020-06-27 00:00:00','2020-08-31 12:14:29','2020-09-02 23:34:04','admin','91'),(94,'Suresh','CTKR','CDT','cash','CINH','CSH',13000.00,'2020-06-27 00:00:00','2020-08-31 12:15:27','2020-09-02 23:43:15','admin','93'),(95,'Annie paul Leave advance 500','SWPR','CDT','cash','CINH','CSH',6500.00,'2020-06-27 00:00:00','2020-08-31 12:17:37','2020-09-03 19:42:50','admin','94'),(96,'Dhanapal','WSTD','CDT','cash','CINH','CSH',9000.00,'2020-06-27 00:00:00','2020-08-31 12:18:31','2020-09-02 23:43:37','admin','95'),(97,'Rappai food','MSLN','CDT','cash','CINH','CSH',4300.00,'2020-06-27 00:00:00','2020-08-31 12:19:20','2020-09-03 19:43:11','admin','96'),(98,'Photostat','PRST','CDT','cash','CINH','CSH',80.00,'2020-06-27 00:00:00','2020-08-31 12:21:17','2020-09-02 23:43:46','admin','97'),(99,'9W LED','ELEL','CDT','cash','CINH','CSH',200.00,'2020-06-27 00:00:00','2020-08-31 12:27:07','2020-09-03 19:42:21','admin','98'),(100,'Notice board','PRST','CDT','cash','CINH','CSH',2604.00,'2020-07-01 00:00:00','2020-08-31 12:32:43','2020-09-02 23:43:59','admin','99'),(101,'Joji','GNDM','CDT','cash','CINH','CSH',1000.00,'2020-07-01 00:00:00','2020-08-31 12:33:27','2020-09-03 19:44:41','admin','100'),(102,'Sanitizer machine','REPM','CDT','cash','CINH','CSH',3500.00,'2020-07-03 00:00:00','2020-08-31 12:34:21','2020-09-02 23:44:10','admin','101'),(103,'Flex,Gum','PRST','CDT','cash','CINH','CSH',615.00,'2020-07-08 00:00:00','2020-08-31 12:35:17','2020-09-02 23:45:16','admin','102'),(104,'Water','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-09 00:00:00','2020-08-31 12:36:17','2020-09-02 23:46:10','admin','103'),(105,'Joji','GNDM','CDT','cash','CINH','CSH',800.00,'2020-07-10 00:00:00','2020-08-31 12:37:07','2020-09-02 23:50:56','admin','104'),(106,'Fevicol','PRST','CDT','cash','CINH','CSH',65.00,'2020-07-10 00:00:00','2020-08-31 12:39:21','2020-09-02 23:47:33','admin','105'),(107,'Water bottles','CONS','CDT','cash','CINH','CSH',250.00,'2020-07-11 00:00:00','2020-08-31 12:40:32','2020-09-02 23:47:21','admin','106'),(108,'Water lorry','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-13 00:00:00','2020-08-31 12:41:29','2020-09-02 23:47:09','admin','107'),(109,'Handwash','PRST','CDT','cash','CINH','CSH',597.00,'2020-07-14 00:00:00','2020-08-31 12:43:05','2020-09-02 23:46:58','admin','108'),(110,'Joji -sewage','REPM','CDT','cash','CINH','CSH',2500.00,'2020-07-14 00:00:00','2020-08-31 12:44:04','2020-09-02 23:50:39','admin','109'),(111,'Salt-snails 5 packet','CONS','CDT','cash','CINH','CSH',60.00,'2020-07-17 00:00:00','2020-08-31 12:45:10','2020-09-03 19:45:40','admin','110'),(112,'DTP','PRST','CDT','cash','CINH','CSH',437.00,'2020-07-17 00:00:00','2020-08-31 12:46:04','2020-09-03 19:46:13','admin','111'),(113,'Rappai Incentive','SCTY','CDT','cash','CINH','CSH',2000.00,'2020-07-22 00:00:00','2020-08-31 13:09:02','2020-09-02 23:50:24','admin','112'),(114,'Water tanker','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-22 00:00:00','2020-08-31 13:10:03','2020-09-02 23:39:18','admin','113'),(115,'Water tanker','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-22 00:00:00','2020-08-31 13:11:21','2020-09-02 23:39:52','admin','114'),(116,'Water Tanker','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-24 00:00:00','2020-08-31 13:12:23','2020-09-02 23:49:39','admin','115'),(117,'KWA  bill 2 months','WATR','CDT','cash','CINH','CSH',24700.00,'2020-07-24 00:00:00','2020-08-31 13:13:30','2020-09-02 23:47:53','admin','116'),(118,'Jerry','REPM','CDT','cash','CINH','CSH',200.00,'2020-07-25 00:00:00','2020-09-02 15:48:26','2020-09-02 23:48:08','admin','117'),(119,'Sanitizer','PRST','CDT','cash','CINH','CSH',1800.00,'2020-07-25 00:00:00','2020-09-02 15:49:42','2020-09-02 23:48:19','admin','118'),(120,'Water Tanker','WATR','CDT','cash','CINH','CSH',1000.00,'2020-07-25 00:00:00','2020-09-02 15:50:29','2020-09-02 23:48:28','admin','119'),(121,'Jerry','REPM','CDT','cash','CINH','CSH',350.00,'2020-07-28 00:00:00','2020-09-02 15:51:14','2020-09-02 23:48:45','admin','120'),(122,'Gloves-Sweeper','PRST','CDT','cash','CINH','CSH',150.00,'2020-07-30 00:00:00','2020-09-02 15:52:21','2020-09-02 23:49:01','admin','121'),(123,'Photocopy','PRST','CDT','cash','CINH','CSH',165.00,'2020-07-30 00:00:00','2020-09-02 15:53:58','2020-09-02 23:49:11','admin','122'),(124,'Water bill','CONS','CDT','cash','CINH','CSH',250.00,'2020-07-30 00:00:00','2020-09-02 15:54:40','2020-09-02 23:49:19','admin','123'),(125,'Cloth','PRST','CDT','cash','CINH','CSH',460.00,'2020-07-30 00:00:00','2020-09-02 15:55:38','2020-09-02 23:49:27','admin','124'),(126,'Prabhanan','WSTD','CDT','cash','CINH','CSH',9000.00,'2020-07-31 00:00:00','2020-09-02 15:57:19','2020-09-03 19:47:30','admin','125'),(127,'Annie','SWPR','CDT','cash','CINH','CSH',10000.00,'2020-07-31 00:00:00','2020-09-02 15:58:13','2020-09-02 23:49:58','admin','126'),(128,'Suresh','CTKR','CDT','cash','CINH','CSH',12567.00,'2020-07-31 00:00:00','2020-09-02 15:59:03','2020-09-02 23:50:09','admin','127'),(129,'Rappai','SCTY','CDT','cash','CINH','CSH',2000.00,'2020-07-31 00:00:00','2020-09-02 15:59:46','2020-09-03 19:48:09','admin','128'),(134,'','AUDT','CDT','cash','CINH','CSH',5001.00,'2020-09-03 20:53:34','2020-09-03 20:54:26','2020-09-03 21:12:16','admin','500'),(135,'','AUDT','CDT','wqreqr','CINH','CSH',500.00,'2020-09-03 20:58:25','2020-09-03 20:59:08','2020-09-03 20:59:08','admin','500'),(136,'','AUDT','CDT','cash','CINH','CSH',500.00,'2020-09-03 21:01:48','2020-09-03 21:02:10','2020-09-03 21:02:10','admin','500'),(137,'','AUDT','CDT','cash','CINH','CSH',500.00,'2020-09-03 21:04:02','2020-09-03 21:04:20','2020-09-03 21:04:20','admin','500'),(138,'','CLNM','CDT','cash','CINH','CSH',500.00,'2020-09-03 21:12:28','2020-09-03 21:13:47','2020-09-03 21:13:47','admin','500'),(139,'','AUDT','CDT','cash','CINH','CSH',500.00,'2020-09-03 21:14:18','2020-09-03 21:14:37','2020-09-03 21:14:37','admin','500');
DROP TABLE IF EXISTS `transaction_category`;
CREATE TABLE `transaction_category` (
  `category_cd` varchar(4) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_desc` varchar(100) DEFAULT NULL,
  `transaction_type_cd` varchar(3) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`category_cd`),
  KEY `trans_type_fk_idx` (`transaction_type_cd`),
  CONSTRAINT `trans_type_fk` FOREIGN KEY (`transaction_type_cd`) REFERENCES `transaction_types` (`transaction_type_cd`)
);
INSERT INTO `transaction_category` VALUES ('AUDT','Audit Fees','Audit Fees bill','EXP',0.00),('CLNM','Cleaning Material','Cleaning Material bill','EXP',0.00),('CONS','Consumables','Consumables bills','EXP',0.00),('DESL','Diesel','Diesel bill','EXP',0.00),('DPCT','Depreciation','Depreciation bill\n','EXP',0.00),('ELEC','Electricity','Electricity bill','EXP',0.00),('ELEL','Electricals','Electricals bill','EXP',0.00),('GNDM','Ground Maintenance','Ground Maintenance bill','EXP',0.00),('INSU','Insurance','Insurance bill','EXP',0.00),('LEGL','Legal Expense','Legal Expense bill','EXP',0.00),('MSLN','Miscellaneous','Miscellaneous bill','EXP',0.00),('PRST','Printing and Stationary','Printing and Stationary bill','EXP',0.00),('PSTE','Postage and Telephone','Postage and Telephone bill','EXP',0.00),('RATX','Rates and Taxes','Rates and Taxes bill','EXP',0.00),('REPM','Repairs and Maintenance','Repairs and Maintenance bill','EXP',0.00),('SLRY','Salary','Salary for employees','EXP',100.00),('TRVE','Travelling','Travelling bill','EXP',0.00),('WATR','Water ','Water bill','EXP',0.00);
DROP TABLE IF EXISTS `transaction_sub_category`;

CREATE TABLE `transaction_sub_category` (
  `trans_sub_cat_cd` varchar(4) NOT NULL,
  `trans_sub_cat_name` varchar(45) NOT NULL,
  `trans_sub_cat_desc` varchar(100) DEFAULT NULL,
  `category_cd` varchar(4) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`trans_sub_cat_cd`),
  KEY `trans_sub_cat_fk_idx` (`category_cd`),
  CONSTRAINT `trans_sub_cat_fk` FOREIGN KEY (`category_cd`) REFERENCES `transaction_category` (`category_cd`)
);

INSERT INTO `transaction_sub_category` VALUES ('AUDT','Audit Fees bill','Audit Fees bill','AUDT',0.00),('CLNM','Cleaning Material  bill','Cleaning Material  bill','CLNM',0.00),('CONS','Consumables bills','Consumables bills','CONS',0.00),('CTKR','Care Taker','Salary for Care taker','SLRY',0.00),('DESL','Diesel bill','Diesel bill','DESL',0.00),('DPCT','Depreciation bill','Depreciation bill','DPCT',0.00),('ELEC','Electricity bill','Electricity bill','ELEC',0.00),('ELEL','Electricals bill','Electricals bill','ELEL',0.00),('GNDM','Ground Maintenance bill','Ground Maintenance bill','GNDM',0.00),('INSU','Insurance bill','Insurance bill','INSU',0.00),('LEGL','Legal Expense bill','Legal Expense bill','LEGL',0.00),('MSLN','Miscellaneous bill','Miscellaneous bill','MSLN',0.00),('PRST','Printing and stationary','Printing and stationary bill','PRST',0.00),('PSTE','Postage and Telephone bill','Postage and Telephone bil','PSTE',0.00),('RATX','Rates and Taxes','Rates and Taxes bill','RATX',0.00),('REPM','Repairs and Maintenance bill','Repairs and Maintenance bill','REPM',0.00),('SCTY','Security','Salary for security','SLRY',0.00),('SWPR','Sweeper','Salary for Sweeper','SLRY',0.00),('TRVE','Travelling','Travelling bill','TRVE',0.00),('WATR','Water bill','Water bill','WATR',0.00),('WSTD','Waste Drop','Salary for waste drop','SLRY',0.00);

DROP TABLE IF EXISTS `transaction_types`;
CREATE TABLE `transaction_types` (
  `transaction_type` varchar(10) NOT NULL,
  `transaction_type_cd` varchar(3) NOT NULL,
  PRIMARY KEY (`transaction_type_cd`)
);

INSERT INTO `transaction_types` VALUES ('Asset','AST'),('Expense','EXP'),('Income','INC');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(450) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mob_no` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `occupant_id` int DEFAULT NULL,
  `role_cd` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `users_role_fk_idx` (`role_cd`),
  KEY `users_occupant_fk_idx` (`occupant_id`),
  CONSTRAINT `users_occupant_fk` FOREIGN KEY (`occupant_id`) REFERENCES `occupants` (`occupant_id`),
  CONSTRAINT `users_role_fk` FOREIGN KEY (`role_cd`) REFERENCES `roles` (`role_cd`)
);

INSERT INTO `users` VALUES (106,'admin','$2a$10$eO16iu4/NhHy2H.RG.S73Os5.fOWo6mSGkHOFYk9i8MK7/eexxpd6','Admin',NULL,NULL,NULL,'2020-06-06 21:51:18','2020-09-14 14:11:54',1,'ADMN'),
(108,'dixon','$2a$10$dKbVU7r93W.4Okk6vu/MXe6kTwqFM6T3vETRYsY0ZQ3a29oKYMEb2','Dixon',NULL,NULL,NULL,'2020-06-06 21:55:16','2020-09-14 15:42:26',2,'CMBR'),
(111,'guest','$2a$10$VMgZh7SFK2x4ZO1C91OequAYgZBzIaYSAkmbdDh04Gottfsx2uVM2','','','','','2020-09-14 20:15:48','2020-09-14 20:15:48',1,'GEST');

