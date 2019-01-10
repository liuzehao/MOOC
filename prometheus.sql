/*
SQLyog Ultimate v10.42 
MySQL - 5.5.28 : Database - prometheus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prometheus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `prometheus`;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`id`,`client_name`,`version`,`profile`,`context_name`) values (1,'鞍山东来','v2.2.0','anshandonglai','carpo'),(2,'沈阳方正','v2.3.0','fangzheng','carpo'),(3,'金朝上海','v2.2.8','jinchaosh','carpo_jinchaosh'),(4,'金朝河北','v2.2.8','jinchaohb','carpo_jinchaohb'),(5,'辽滨','v2.1.14','liaobin','carpo'),(6,'辽滨财务(对外的账)','v2.1.14','carpoliaobin','carpo_liaobin'),(7,'文峰','v2.1.14','wenfeng','carpo_wenfeng'),(8,'先进','v2.1.12','xianjin','carpo'),(9,'杨哈吉','v2.2.9','yanghaji','carpo'),(10,'映山红','v2.1.16','yingshanhong','carpo_ysh'),(11,'佑润','v2.2.0','yourun','carpo'),(12,'众友','v2.1.9','zhongyou','carpo');

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `college_id` int(11) NOT NULL COMMENT '学院号',
  `college_name` varchar(50) DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `college` */

insert  into `college`(`college_id`,`college_name`) values (1,'计算机学院'),(2,'经济管理学院'),(3,'物理与电子工程学院'),(4,'地理旅游学院'),(5,'企划学院');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `course_name` varchar(20) DEFAULT NULL COMMENT '课程名',
  `tree_id` int(11) DEFAULT NULL COMMENT '对应树节点',
  `course_state` int(11) DEFAULT NULL COMMENT '课程状态',
  `total_section` int(11) DEFAULT NULL COMMENT '课程总共的小结数',
  `course_image` varchar(200) DEFAULT NULL COMMENT '课程图片url',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`course_id`,`course_name`,`tree_id`,`course_state`,`total_section`,`course_image`) values (1,'C语言',NULL,0,100,'img/study/course/C.jpg'),(2,'JAVA',NULL,0,100,'img/study/course/JAVA.jpg'),(3,'python',NULL,0,100,'img/study/course/python.jpg'),(4,'javascript',NULL,0,100,'img/study/course/JS.jpg'),(5,'数据结构',NULL,NULL,22,'img/study/course/C.jpg');

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

/*Table structure for table `exercise` */

DROP TABLE IF EXISTS `exercise`;

CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL COMMENT '题目id',
  `exercise_type` varchar(20) DEFAULT NULL COMMENT '题目类型',
  `exercise_attribute` varchar(20) DEFAULT NULL COMMENT '题目属性',
  `tree_id` int(11) DEFAULT NULL COMMENT '题目对应知识点id',
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exercise` */

insert  into `exercise`(`exercise_id`,`exercise_type`,`exercise_attribute`,`tree_id`) values (1,'choice','',1);

/*Table structure for table `exercise_choice` */

DROP TABLE IF EXISTS `exercise_choice`;

CREATE TABLE `exercise_choice` (
  `exercise_id` int(11) NOT NULL COMMENT '选择题题目id',
  `exercise_describe` varchar(200) DEFAULT NULL COMMENT '题描述',
  `exercise_answer` varchar(20) DEFAULT NULL COMMENT '题目答案',
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exercise_choice` */

/*Table structure for table `profession` */

DROP TABLE IF EXISTS `profession`;

CREATE TABLE `profession` (
  `profession_id` int(11) NOT NULL COMMENT '专业编号',
  `profession_name` varchar(50) DEFAULT NULL COMMENT '专业名称',
  `college_id` int(11) NOT NULL COMMENT '学院号',
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profession` */

insert  into `profession`(`profession_id`,`profession_name`,`college_id`) values (1,'网络工程',1),(2,'软件工程',1),(3,'计算机科学与技术',1),(4,'金融',2),(5,'电子信息科学与技术',3),(6,'自动化',3),(7,'物理',3);

/*Table structure for table `research_room` */

DROP TABLE IF EXISTS `research_room`;

CREATE TABLE `research_room` (
  `research_room_id` int(11) NOT NULL COMMENT '教研室号',
  `research_room_name` varchar(50) DEFAULT NULL COMMENT '教研室名称',
  `college_id` int(11) DEFAULT NULL COMMENT '学院号',
  PRIMARY KEY (`research_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `research_room` */

insert  into `research_room`(`research_room_id`,`research_room_name`,`college_id`) values (1,'计算机',1),(2,'网络',1),(3,'经济学',2),(4,'电子教研室',3),(5,'软件工程',1),(6,'企划教研室',5);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL COMMENT '学号',
  `student_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `college_id` int(11) DEFAULT NULL COMMENT '学院号',
  `profession_id` int(11) DEFAULT NULL COMMENT '专业编号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `student_nike_name` varchar(20) DEFAULT NULL COMMENT '学生昵称',
  `student_image` varchar(200) DEFAULT NULL COMMENT '头像链接',
  `last_study_url` varchar(200) DEFAULT NULL COMMENT '上次学习url记录',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`student_id`,`student_name`,`college_id`,`profession_id`,`email`,`student_nike_name`,`student_image`,`last_study_url`) values (123,'我是另一个你猜',2,3,'123@qq.com',NULL,NULL,NULL),(12345,'你猜',3,2,'你猜@你猜.com',NULL,NULL,NULL),(56789,'小红',1,1,'123566@qq.com',NULL,NULL,NULL),(123456,'小明',1,1,'123@163.com',NULL,NULL,NULL);

/*Table structure for table `student_course` */

DROP TABLE IF EXISTS `student_course`;

CREATE TABLE `student_course` (
  `student_id` int(11) NOT NULL COMMENT '学生学号',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `course_attribute` int(11) DEFAULT NULL COMMENT '课程属性:必修，选修',
  `course_time` varchar(200) DEFAULT NULL COMMENT '课程总学习时间',
  `study_section_num` int(11) DEFAULT NULL COMMENT '学生学习了的小节数',
  `total_score` varchar(200) DEFAULT NULL COMMENT '课程学习总积分',
  `study_progress_rate` varchar(11) DEFAULT NULL COMMENT '课程学习进度',
  `logout_time` char(16) DEFAULT NULL COMMENT '登出时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student_course` */

insert  into `student_course`(`student_id`,`course_id`,`course_attribute`,`course_time`,`study_section_num`,`total_score`,`study_progress_rate`,`logout_time`) values (12345,1,NULL,'2300000',NULL,'-888','22',NULL),(12345,2,NULL,'2300000',NULL,'-888','22',NULL),(12345,3,NULL,'5000000',NULL,'-888','33',NULL),(12345,4,NULL,'1000000',NULL,'-888','88',NULL),(123,2,NULL,'220000',NULL,'-888','33','2015.1.31 10:58'),(123,4,NULL,'55000',NULL,'-888','99','2015.1.20 11:28'),(123,5,NULL,'3605628',NULL,'255','55','2015.1.30  9:35'),(12345,5,NULL,'44000000',NULL,'-888','66',NULL);

/*Table structure for table `student_state` */

DROP TABLE IF EXISTS `student_state`;

CREATE TABLE `student_state` (
  `student_id` int(11) DEFAULT NULL COMMENT '学号',
  `course_id` int(11) DEFAULT NULL COMMENT '课程号',
  `tree_id` varchar(20) DEFAULT NULL COMMENT '课程在树中的节点',
  `icon` varchar(50) DEFAULT NULL COMMENT '状态图标',
  `flag` int(11) DEFAULT NULL COMMENT '是否学完标记',
  `enable` int(11) DEFAULT NULL COMMENT '是否启用该节点',
  `exercise_right_num` int(11) DEFAULT NULL COMMENT '题目正确数',
  `exercise_right_rate` varchar(11) DEFAULT NULL COMMENT '题目正确率',
  `course_attribute` int(11) DEFAULT NULL COMMENT '课程属性：必修，选修'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student_state` */

insert  into `student_state`(`student_id`,`course_id`,`tree_id`,`icon`,`flag`,`enable`,`exercise_right_num`,`exercise_right_rate`,`course_attribute`) values (123,5,'1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-1-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-2-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-2-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-1-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-1-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-2-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-3-2-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-4','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-4-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-4-1-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-4-1-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,5,'1-4-2','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-4-2-1','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-4-2-2','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-5','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-5-1','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-6','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,5,'1-7','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(12345,5,'1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(12345,5,'1-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(12345,5,'1-2','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(12345,5,'1-2-1','../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png',1,NULL,NULL,NULL,NULL),(123,2,'3','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL),(123,4,'4','../js/zTree3.5/css/zTreeStyle/img/diy/lock.png',0,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` tinyint(1) NOT NULL COMMENT '角色ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_description` varchar(50) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_description`) values (0,'管理员','admin'),(1,'教师','teacher'),(2,'学生','student');

/*Table structure for table `sys_tree` */

DROP TABLE IF EXISTS `sys_tree`;

CREATE TABLE `sys_tree` (
  `tree_id` varchar(10) NOT NULL COMMENT '菜单ID',
  `parent_id` varchar(10) NOT NULL DEFAULT '' COMMENT '菜单父ID',
  `title` varchar(100) DEFAULT '' COMMENT '菜单标题',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(100) DEFAULT '' COMMENT '菜单URL',
  `state` int(11) DEFAULT '0' COMMENT '课程审核状态',
  `exercise_id` int(11) DEFAULT NULL COMMENT '题目id号',
  `root_id` varchar(10) NOT NULL DEFAULT '0' COMMENT '根节点（对应课程id）',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_tree` */

insert  into `sys_tree`(`tree_id`,`parent_id`,`title`,`name`,`url`,`state`,`exercise_id`,`root_id`,`num`) values ('1','-1','第一章 绪论','第一章 绪论','../picturelib/course/datastructure/chapter1/1/1.jpg',1,NULL,'5',0),('1-1','1','1.1 数据结构在程序设计中的作用','1.1 数据结构在…','../picturelib/course/datastructure/chapter1/1.1/1.jpg',1,NULL,'5',1),('1-1-1','1-1','1.1 数据结构在程序设计中的作用(2)','第二页','../picturelib/course/datastructure/chapter1/1.1/2.jpg',1,NULL,'5',2),('1-2','1','1.2 本书讨论的主要内容','1.2 本书讨论的…','../picturelib/course/datastructure/chapter1/1.2/1.jpg',1,NULL,'5',3),('1-2-1','1-2','1.2 本书讨论的主要内容(2)','第二页','../picturelib/course/datastructure/chapter1/1.2/2.jpg',1,NULL,'5',4),('1-2-2','1-2','1.2 本书讨论的主要内容(3)','第三页','../picturelib/course/datastructure/chapter1/1.2/3.jpg',1,NULL,'5',5),('1-3','1','1.3 数据结构的基本概念','1.3 数据结构的…','../picturelib/course/datastructure/chapter1/1.3.1/1.jpg',1,NULL,'5',6),('1-3-1','1-3','1.3.1 数据结构','1.3.1 数据结构','../picturelib/course/datastructure/chapter1/1.3.1/1.jpg',0,NULL,'5',7),('1-3-1-1','1-3-1','1.3.1 数据结构(2)','第二页','../picturelib/course/datastructure/chapter1/1.3.1/2.jpg',0,NULL,'5',8),('1-3-1-2','1-3-1','1.3.1 数据结构(3)','第三页','../picturelib/course/datastructure/chapter1/1.3.1/3.jpg',0,NULL,'5',9),('1-3-2','1-3','1.3.2 抽象数据类型','1.3.2 抽象数…','../picturelib/course/datastructure/chapter1/1.3.2/1.jpg',0,NULL,'5',10),('1-3-2-1','1-3-2','1.3.1 数据结构(2)','第二页','../picturelib/course/datastructure/chapter1/1.3.2/2.jpg',0,NULL,'5',11),('1-3-2-2','1-3-2','1.3.1 数据结构(3)','第三页','../picturelib/course/datastructure/chapter1/1.3.2/3.jpg',0,NULL,'5',12),('1-4','1','1.4 算法及算法分析','1.4 算法及算法…','../picturelib/course/datastructure/chapter1/1.4.1/1.jpg',0,NULL,'5',13),('1-4-1','1-4','1.4.1 算法及其描述方法','1.4.1 算法及…','../picturelib/course/datastructure/chapter1/1.4.1/1.jpg',0,NULL,'5',14),('1-4-1-1','1-4-1','1.4.1 算法及其描述方法(2)','第二页','../picturelib/course/datastructure/chapter1/1.4.1/2.jpg',0,NULL,'5',15),('1-4-1-2','1-4-1','1.4.1 算法及其描述方法(3)','第三页','../picturelib/course/datastructure/chapter1/1.4.1/3.jpg',0,NULL,'5',16),('1-4-2','1-4','1.4.2 算法分析','1.4.2 算法分析','../picturelib/course/datastructure/chapter1/1.4.2/1.jpg',0,NULL,'5',17),('1-4-2-1','1-4-2','1.4.2 算法分析(2)','第二页','../picturelib/course/datastructure/chapter1/1.4.2/2.jpg',0,NULL,'5',18),('1-4-2-2','1-4-2','1.4.2 算法分析(3)','第三页','../picturelib/course/datastructure/chapter1/1.4.2/3.jpg',0,NULL,'5',19),('1-5','1','思想火花--好算法是反复努力和重新修正的结果','思想火花--好算法…','../picturelib/course/datastructure/chapter1/Sparksofthought1/1.jpg',0,NULL,'5',20),('1-5-1','1-5','第二页','第二页','../picturelib/course/datastructure/chapter1/Sparksofthought1/1.jpg',0,NULL,'5',21),('1-6','1','习题 1','习题 1','',0,NULL,'5',22),('1-7','1','思考题 1','思考题 1','',0,NULL,'5',23),('2','-1','第二章 线性表','第二章 线性表','',0,NULL,'5',24),('2-1','2','2.1 线性表的逻辑机构','2.1 线性表的逻…','',0,NULL,'5',25),('2-1-1','2-1','2.1.1 线性表的定义','2.1.1 线性表…','',0,NULL,'5',26),('2-1-2','2-1','2.1.2 线性表的抽象数据类型定义','2.1.2 线性表…','',0,NULL,'5',27),('2-2','2','2.2 线性表的顺序存储结构及实现','2.2 线性表的顺…','',0,NULL,'5',28),('2-2-1','2-2','2.2.1 线性表的书序存储结构--顺序表','2.2.1 线性表…','',0,NULL,'5',29),('2-2-2','2-2','2.2.2 顺序表的实现','2.2.2 顺序表…','',0,NULL,'5',30),('2-3','2','2.3 线性表的链接存储结构及实现','2.3 线性表的链…','',0,NULL,'5',31),('2-3-1','2-3','2.3.1 单链表','2.3.1 单链表','',0,NULL,'5',32),('2-3-2','2-3','2.3.2 循环链表','2.3.2 循环链表','',0,NULL,'5',33),('2-3-3','2-3','2.3.3 双链表','2.3.3 双链表','',0,NULL,'5',34),('2-4','2','2.4 顺序表和链表的比较','2.4 顺序表和链…','',0,NULL,'5',35),('2-4-1','2-4','2.4.1 时间性能比较','2.4.1 时间性…','',0,NULL,'5',36),('2-4-2','2-4','2.4.2 空间性能比较','2.4.2 空间性…','',0,NULL,'5',37),('2-5','2','2.5 线性表的其它存储方法','2.5 线性表的其…','',0,NULL,'5',38),('2-5-1','2-5','2.5.1 静态链表','2.5.1 静态链表','',0,NULL,'5',39),('2-5-2','2-5','2.5.2 间接寻址','2.5.2 间接寻址','',0,NULL,'5',40),('2-6','2','2.6 应用举例','2.6 应用举例','',0,NULL,'5',41),('2-6-1','2-6','2.6.1 顺序表的应用举例--大整数求和','2.6.1 顺序表…','',0,NULL,'5',42),('2-6-2','2-6','2.6.2 单链表的应用举例--一元多项式求和','2.6.2 单链表…','',0,NULL,'5',43),('2-7','2','思想火花--好程序要能识别和处理各种输入','思想火花--好程序…','',0,NULL,'5',44),('2-8','2','习题 2','习题 2','',0,NULL,'5',45),('2-9','2','思考题 2','思考题 2','',0,NULL,'5',46),('3','-1','饿了','sb','',0,NULL,'2',47),('4','-1','困了','fuck','',0,NULL,'4',48);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(50) DEFAULT NULL COMMENT '账号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `role_id` tinyint(1) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_name`,`password`,`user_name`,`role_id`) values (1,'admin','21232F297A57A5A743894A0E4A801FC3','管理员',0),(2,'weixuda','8F22033696037393440AEF2A5CAD6B54','老师',1),(3,'cuicui','202CB962AC59075B964B07152D234B70','学生',2),(4,'student','CD73502828457D15655BBD7A63FB0BC8','学生',2),(5,'12345','827CCB0EEA8A706C4C34A16891F84E7B','学生',2),(6,'123','202CB962AC59075B964B07152D234B70','学生',2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL COMMENT '职工号',
  `teacher_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `college_id` varchar(50) DEFAULT NULL COMMENT '学院号',
  `research_room_id` varchar(50) DEFAULT NULL COMMENT '教研室号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`teacher_id`,`teacher_name`,`college_id`,`research_room_id`,`email`,`telephone`) values (222,'你猜','4','4','123@qq.com','123');

/*Table structure for table `teacher_course` */

DROP TABLE IF EXISTS `teacher_course`;

CREATE TABLE `teacher_course` (
  `teacher_id` int(11) NOT NULL COMMENT '教师工号',
  `course_id` int(11) NOT NULL COMMENT '课程id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher_course` */

insert  into `teacher_course`(`teacher_id`,`course_id`) values (222,1);

/*Table structure for table `tree_exercise` */

DROP TABLE IF EXISTS `tree_exercise`;

CREATE TABLE `tree_exercise` (
  `tree_id` int(11) NOT NULL COMMENT '课程节点id',
  `exercise_id` int(11) NOT NULL COMMENT '练习题目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tree_exercise` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `update_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
