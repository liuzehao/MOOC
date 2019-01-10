/*
SQLyog Ultimate v10.42 
MySQL - 5.5.28 : Database - thallo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `acl_permission` */

DROP TABLE IF EXISTS `acl_permission`;

CREATE TABLE `acl_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_token` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perm_token` (`perm_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acl_permission` */

/*Table structure for table `acl_role_permission` */

DROP TABLE IF EXISTS `acl_role_permission`;

CREATE TABLE `acl_role_permission` (
  `role_id` varchar(36) DEFAULT NULL,
  `perm_id` varchar(36) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL,
  `perm_token` varchar(100) NOT NULL,
  UNIQUE KEY `role_name_perm_token` (`role_name`,`perm_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acl_role_permission` */

/*Table structure for table `acl_user_permission` */

DROP TABLE IF EXISTS `acl_user_permission`;

CREATE TABLE `acl_user_permission` (
  `user_id` varchar(100) NOT NULL,
  `perm_token` varchar(100) NOT NULL,
  UNIQUE KEY `user_id_perm_token` (`user_id`,`perm_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acl_user_permission` */

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `version` varchar(50) DEFAULT NULL COMMENT '客户版本',
  `profile` varchar(50) DEFAULT NULL COMMENT 'maven profile',
  `context_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`id`,`client_name`,`version`,`profile`,`context_name`) values (1,'鞍山东来','v2.2.0','anshandonglai','carpo'),(2,'沈阳方正','v2.3.0','fangzheng','carpo'),(3,'金朝上海','v2.2.8','jinchaosh','carpo_jinchaosh'),(4,'金朝河北','v2.2.8','jinchaohb','carpo_jinchaohb'),(5,'辽滨','v2.1.14','liaobin','carpo'),(6,'辽滨财务(对外的账)','v2.1.14','carpoliaobin','carpo_liaobin'),(7,'文峰','v2.1.14','wenfeng','carpo_wenfeng'),(8,'先进','v2.1.12','xianjin','carpo'),(9,'杨哈吉','v2.2.9','yanghaji','carpo'),(10,'映山红','v2.1.16','yingshanhong','carpo_ysh'),(11,'佑润','v2.2.0','yourun','carpo'),(12,'众友','v2.1.9','zhongyou','carpo');

/*Table structure for table `dict_globalparam` */

DROP TABLE IF EXISTS `dict_globalparam`;

CREATE TABLE `dict_globalparam` (
  `param_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名称',
  `param_value` varchar(500) NOT NULL DEFAULT '' COMMENT '参数值',
  `param_description` varchar(200) DEFAULT '' COMMENT '参数说明',
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公共参数表';

/*Data for the table `dict_globalparam` */

insert  into `dict_globalparam`(`param_name`,`param_value`,`param_description`) values ('current_version','v2.3.0','当前系统的最新版本');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_description` varchar(200) DEFAULT NULL COMMENT '角色介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_name`,`user_name`,`password`) values (1,'admin','admin','21232F297A57A5A743894A0E4A801FC3');

/*Table structure for table `update_log` */

DROP TABLE IF EXISTS `update_log`;

CREATE TABLE `update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_ip` varchar(50) DEFAULT NULL COMMENT '请求ip',
  `operate_time` varchar(50) DEFAULT NULL COMMENT '操作时间',
  `operate_type` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `client_id` varchar(50) DEFAULT NULL COMMENT '客户id',
  `original_version` varchar(50) DEFAULT NULL COMMENT '原版本',
  `target_version` varchar(50) DEFAULT NULL COMMENT '目标版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `update_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
