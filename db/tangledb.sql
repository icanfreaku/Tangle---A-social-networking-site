/*
SQLyog Community v8.4 RC2
MySQL - 5.0.15-nt : Database - tangledb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tangledb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tangledb`;

/*Table structure for table `frequest` */

DROP TABLE IF EXISTS `frequest`;

CREATE TABLE `frequest` (
  `userid` int(11) default NULL,
  `fid` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `frequest` */

insert  into `frequest`(`userid`,`fid`) values (11,16),(20,14),(10,11);

/*Table structure for table `group_relation` */

DROP TABLE IF EXISTS `group_relation`;

CREATE TABLE `group_relation` (
  `userid` int(11) default NULL,
  `group_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `group_relation` */

insert  into `group_relation`(`userid`,`group_id`) values (15,6),(16,6);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(25) default NULL,
  `created_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_by` int(11) default NULL,
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

insert  into `groups`(`group_id`,`group_name`,`created_time`,`created_by`) values (1,'bestFriends','2015-01-24 17:18:26',13),(2,'classmates','2015-01-24 17:24:03',13),(3,'FRIENDS','2015-01-25 14:06:11',12),(4,'rockerss','2015-01-25 14:06:28',10),(5,'yolos','2015-01-25 14:11:41',10),(6,'devotees','2015-01-25 15:02:27',15);

/*Table structure for table `grp_messages` */

DROP TABLE IF EXISTS `grp_messages`;

CREATE TABLE `grp_messages` (
  `fromid` int(11) default NULL,
  `toid` int(11) default NULL,
  `message` varchar(25) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `fname` varchar(25) default NULL,
  `lname` varchar(25) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grp_messages` */

insert  into `grp_messages`(`fromid`,`toid`,`message`,`time`,`fname`,`lname`) values (15,6,'hey guyss','2015-01-25 15:41:49','tang','fan'),(16,6,'what are you doing tang?','2015-01-27 15:41:34','Ariane','Grande'),(16,6,'add friends to group','2015-01-27 15:41:40','Ariane','Grande'),(15,6,'yeah ill do!','2015-01-27 15:47:29','tang','fan');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `fromid` int(11) default NULL,
  `toid` int(11) default NULL,
  `msg` varchar(285) default NULL,
  `dtime` varchar(100) default NULL,
  `time` timestamp NULL default CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `messages` */

insert  into `messages`(`fromid`,`toid`,`msg`,`dtime`,`time`) values (10,13,'hey','0000-00-00 00:00:00',NULL),(10,11,'ekeek','0000-00-00 00:00:00',NULL),(13,10,'okay','0000-00-00 00:00:00',NULL),(11,12,'fdf','0000-00-00 00:00:00',NULL),(13,11,'hey testing','0000-00-00 00:00:00',NULL),(13,11,'are you there?','0000-00-00 00:00:00',NULL),(11,13,'hey whatsup?','0000-00-00 00:00:00',NULL),(13,11,'im fine dude!','0000-00-00 00:00:00',NULL),(13,11,'okay ok','0000-00-00 00:00:00',NULL),(13,11,'what else?','0000-00-00 00:00:00',NULL),(13,11,'Godd!! it works','0000-00-00 00:00:00',NULL),(13,11,'So whta?','0000-00-00 00:00:00',NULL),(13,11,'im checking','0000-00-00 00:00:00',NULL),(13,10,'Im again cecking','0000-00-00 00:00:00',NULL),(13,11,'Dono','0000-00-00 00:00:00',NULL),(13,10,'wow yar','0000-00-00 00:00:00',NULL),(13,10,'are you kidding me? :O','0000-00-00 00:00:00',NULL),(13,11,'i cant believe it','0000-00-00 00:00:00',NULL),(13,10,'hey','0000-00-00 00:00:00',NULL),(13,11,'mess','0000-00-00 00:00:00',NULL),(16,15,'Hey tang! Angel here','0000-00-00 00:00:00',NULL),(15,16,'Sarala!!! how are you? ','0000-00-00 00:00:00',NULL),(15,16,'ok bye','0000-00-00 00:00:00',NULL),(11,13,'hello','0000-00-00 00:00:00',NULL),(11,13,'heiii','0000-00-00 00:00:00',NULL),(11,13,'er','0000-00-00 00:00:00',NULL),(13,11,'what','0000-00-00 00:00:00',NULL),(13,11,'exec','Mon Dec 29 11:01:22 IST 2014','2013-12-29 11:07:04'),(13,11,'cn','Mon Dec 29 11:03:50 IST 2014','2014-12-28 12:13:04'),(13,11,'c','Mon Dec 29 11:07:04 IST 2014','2014-12-29 11:07:04'),(13,11,'yo',NULL,'2014-12-29 11:10:41'),(13,11,'final',NULL,'2014-12-29 11:14:43'),(13,11,'im all about the bass! no treble!',NULL,'2014-12-30 18:17:24'),(10,13,'whats this?',NULL,'2014-12-30 19:34:01'),(10,13,'im testing this',NULL,'2015-01-08 00:46:22'),(10,12,'hey!',NULL,'2015-01-08 00:46:33'),(10,12,'glad that you are on tangle :)',NULL,'2015-01-08 00:46:49'),(11,12,'what?',NULL,'2015-01-08 10:45:33'),(11,13,'when are we meeting?',NULL,'2015-01-08 10:45:59'),(11,13,'where are you?',NULL,'2015-01-08 10:46:08'),(15,16,'bleh!',NULL,'2015-01-08 11:36:26'),(10,13,'heylo!!',NULL,'2015-01-08 14:31:18'),(10,13,'heyyyy',NULL,'2015-01-08 14:31:27'),(10,12,'hey!',NULL,'2015-01-08 14:45:25'),(15,12,'hey! welcome to tangle',NULL,'2015-01-21 09:39:53'),(10,13,'hyy',NULL,'2015-01-21 15:39:36');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL auto_increment,
  `subject` varchar(45) default NULL,
  `post` text,
  `created_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `userid` int(10) default NULL,
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

insert  into `posts`(`post_id`,`subject`,`post`,`created_time`,`userid`) values (1,'Intresting facts Des b','fsdasdlarhdncvf dsdsldkj','2015-01-20 21:13:21',15),(2,'Intresting facts Des b','What is common knowledge?\r\nCommon knowledge is information that is widely available. If you saw the same fact repeate.','2015-01-21 07:40:41',10),(3,'Intresting facts Des b','What is common knowledge?\r\nCommon knowledge is information that is widely available. If you saw the same fact repeate.','2015-01-21 07:50:09',10),(4,'What is plagiarism?','In your writing, you must give credit whenever you use information that you found in a source, unless it is common knowledge (see below). Always give your source for','2015-01-21 08:10:28',16),(8,'What is plagiarism','In your writing you must give credit whenever you use information that you found in a sourceIn your writing, you must give credit whenever you use information that','2015-01-21 08:12:38',16),(9,'This webpage is not available','Sometimes, plagiarism is obvious. Copying a lab report from another student and buying a research paper over the Internet are clear examples of plagiarism. But plagiarism can also be accidental. Following these tips will help you avoid accidental plagiarism','2015-01-21 08:16:01',12),(10,'Intresting facts Des b','Intresting facts Des brises d ondulaient lherbe verte. Le lac bleu tincelait. PrÃ¨s du lac, une mawsa','2015-01-21 08:18:12',10),(11,'im making a new post e','this is a post that im testing jdjdskmdsdsdsaa\r\ndsdasdasdasd\r\ndsaadaddaw','2015-01-21 08:20:01',12),(12,'Reasons for bug','1 The software doesnâ??t do something that the product specification says it should do.\r\n2 The software does something that the product specification says it shouldnâ??t do.\r\n3 The software does something that the product specification doesnâ??t mention.\r\n4 The software doesnâ??t do something that the product specification doesnâ??t mention but\r\nshould.\r\n5 The software is difficult to understand, hard to use, slow, or â?? in the testers eyes - will be\r\nviewed by the end user as just plain not right.','2015-01-21 13:53:46',15),(14,'Error Handling','Failure in dealing with errors are common, and include failure to anticipate the\r\npossibility of errors and protect against them, failure to notice error conditions, and the\r\nfailure to deal with a detected errors in a reasonable way. Many programs correctly detect\r\nerrors but then branch into untested error recovery routines.','2015-01-21 14:59:36',10),(15,'groups function enabled','yohoooo...it works..','2015-01-27 15:52:48',16);

/*Table structure for table `relation` */

DROP TABLE IF EXISTS `relation`;

CREATE TABLE `relation` (
  `userid` int(11) default NULL,
  `fid` int(11) default NULL,
  `last_activity` timestamp NULL default CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `relation` */

insert  into `relation`(`userid`,`fid`,`last_activity`) values (13,10,'2015-01-21 15:39:36'),(10,13,'2015-01-21 15:39:36'),(11,13,'2015-01-08 10:46:08'),(13,11,'2015-01-08 10:46:08'),(15,16,'2015-01-08 11:36:26'),(16,15,'2015-01-08 11:36:27'),(12,16,'0000-00-00 00:00:00'),(16,12,'2014-12-29 11:12:39'),(14,16,'0000-00-00 00:00:00'),(16,14,'2014-12-29 11:12:39'),(10,12,'2015-01-08 14:45:25'),(12,10,'2015-01-08 14:45:25'),(10,15,'2015-01-08 10:40:12'),(15,10,'2015-01-08 10:40:12'),(12,15,'2015-01-21 09:39:54'),(15,12,'2015-01-21 09:39:54'),(11,12,'2015-01-08 10:45:33'),(12,11,'2015-01-08 10:45:33');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL auto_increment,
  `fname` varchar(25) default NULL,
  `lname` varchar(25) default NULL,
  `emailid` varchar(25) default NULL,
  `password` varchar(25) default NULL,
  `gender` varchar(10) default NULL,
  `age` int(5) default NULL,
  `dob` date default NULL,
  `dp` varchar(100) default 'images/default-avatar.jpg',
  `about_me` varchar(350) default NULL,
  `education` varchar(100) default NULL,
  `relationship` varchar(50) default NULL,
  `other_profiles` varchar(100) default NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userid`,`fname`,`lname`,`emailid`,`password`,`gender`,`age`,`dob`,`dp`,`about_me`,`education`,`relationship`,`other_profiles`) values (10,'test','user','test@sample.com','pass','Male',12,'1984-01-02','images/dp/10.jpg','im a homely girl',NULL,NULL,NULL),(11,'sumo','res','res@fd.com','pass','Female',12,'1990-05-01','images/dp/11.jpg',NULL,'dsd','dsd',NULL),(12,'foole','reqw','lollipop@gaga.com','wer','Male',78,'1994-02-22','images/default-avatar.jpg',NULL,NULL,NULL,NULL),(13,'Luke','dhan','deadnight@me.com','poss','null',23,'1988-11-30','images/dp/13.jpg','im a homely girl and i love pets.',NULL,NULL,NULL),(14,'sarala','guy','qwerty@red.com','uio','Female',27,'1988-11-24','images/default-avatar.jpg',NULL,NULL,NULL,NULL),(15,'tang','fan','tangfan@gm.com','yuup','Male',32,'1979-02-04','images/dp/15.jpg',NULL,'B.Com (hons) at St.Xaviers','Married',NULL),(16,'Ariane','Grande','yup@re.com','pass','Female',45,'1979-02-04','images/dp/16.jpg',NULL,NULL,NULL,NULL),(17,'slurpy','burppy','popop@gaga.com','port','Male',29,'1979-02-04','images/default-avatar.jpg','Lorem ipsum dolor sit amet, consectetuer \r\nadipiscing elit. Aenean commodo ligula eget \r\ndolor. Aenean massa. Cum sociis natoque \r\npenatibus et magnis dis parturient montes, \r\nnascetur ridiculus mus. Donec quam felis, \r\nultricies nec, pellentesque eu, pretium quis, \r\nsem. Nulla consequat massa quis enim. Donec ','Bsc computer science','Single','facebook.com/sumitha.unicorn'),(18,'sample','person','samp@edu.com','pass','Female',29,'1994-02-22','images/default-avatar.jpg',NULL,NULL,NULL,NULL),(19,'sky','scrapper','sky@scrape.com','1234','Male',34,'1972-02-04','images/default-avatar.jpg',NULL,NULL,NULL,NULL),(20,'gaya','thri','gayathri@s.com','gaya','Female',19,'1995-03-27','images/dp/20.jpg','nee oru lusu','3','vetti naye','sumitha'),(21,'sumitha','dhanasekaran','icanfreaku@hotmail.com','pass','Female',23,'1994-02-22','images/default-avatar.jpg',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
