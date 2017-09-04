/*
Navicat MySQL Data Transfer

Source Server         : course
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : course_manage

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-04 08:58:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cNum` varchar(10) NOT NULL,
  `cName` varchar(20) NOT NULL,
  `credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`cNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('01014125', '微积分(1)', '6');
INSERT INTO `course` VALUES ('08305013', '编译原理', '5');
INSERT INTO `course` VALUES ('08305014', '数据库原理(1)', '4');
INSERT INTO `course` VALUES ('08305015', '数据库原理(2)', '4');
INSERT INTO `course` VALUES ('08305016', '软件工程', '3');
INSERT INTO `course` VALUES ('08306099', 'Java程序设计(实践)', '4');
INSERT INTO `course` VALUES ('08306120', 'Java EE开发技术', '4');

-- ----------------------------
-- Table structure for course_file
-- ----------------------------
DROP TABLE IF EXISTS `course_file`;
CREATE TABLE `course_file` (
  `file_id` bigint(20) NOT NULL,
  `open_id` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_file
-- ----------------------------
INSERT INTO `course_file` VALUES ('1', '5');
INSERT INTO `course_file` VALUES ('2', '5');
INSERT INTO `course_file` VALUES ('3', '1');
INSERT INTO `course_file` VALUES ('4', '1');
INSERT INTO `course_file` VALUES ('5', '8');
INSERT INTO `course_file` VALUES ('6', '8');
INSERT INTO `course_file` VALUES ('7', '3');
INSERT INTO `course_file` VALUES ('8', '3');
INSERT INTO `course_file` VALUES ('9', '12');
INSERT INTO `course_file` VALUES ('10', '12');
INSERT INTO `course_file` VALUES ('14', '13');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `owner_num` varchar(10) DEFAULT NULL,
  `file_date` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '第1次上机实验题-2017-3-29.pdf', 'D:\\file\\10000001\\第1次上机实验题-2017-3-29.pdf', '10000001', '2017-05-30 12:46:23');
INSERT INTO `file` VALUES ('2', '第2次上机实验题-2017-4-5.pdf', 'D:\\file\\10000001\\第2次上机实验题-2017-4-5.pdf', '10000001', '2017-05-30 12:46:27');
INSERT INTO `file` VALUES ('3', '第1章+引论.pptx', 'D:\\file\\10000002\\第1章+引论.pptx', '10000002', '2017-05-30 12:46:45');
INSERT INTO `file` VALUES ('4', '第2章+文法和语言.pptx', 'D:\\file\\10000002\\第2章+文法和语言.pptx', '10000002', '2017-05-30 12:46:49');
INSERT INTO `file` VALUES ('5', '第1章+软件工程学概述.pdf', 'D:\\file\\10000002\\第1章+软件工程学概述.pdf', '10000002', '2017-05-30 12:47:07');
INSERT INTO `file` VALUES ('6', '第2章+可行性研究.pdf', 'D:\\file\\10000002\\第2章+可行性研究.pdf', '10000002', '2017-05-30 12:47:10');
INSERT INTO `file` VALUES ('7', '第五章+关系数据理论.ppt', 'D:\\file\\10000003\\第五章+关系数据理论.ppt', '10000003', '2017-05-30 12:47:34');
INSERT INTO `file` VALUES ('8', '第1周研讨、实验.docx', 'D:\\file\\10000003\\第1周研讨、实验.docx', '10000003', '2017-05-30 12:47:42');
INSERT INTO `file` VALUES ('9', '第一章+数据库发展史.pptx', 'D:\\file\\10000003\\第一章+数据库发展史.pptx', '10000003', '2017-05-30 12:48:01');
INSERT INTO `file` VALUES ('10', '第三章%2b关系运算.pptx', 'D:\\file\\10000003\\第三章%2b关系运算.pptx', '10000003', '2017-05-30 12:48:07');
INSERT INTO `file` VALUES ('14', '第4章 结构化查询语言SQL.ppt', 'D:\\file\\10000005\\第4章 结构化查询语言SQL.ppt', '10000005', '2017-05-30 12:52:26');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `title` varchar(255) NOT NULL,
  `open_id` bigint(20) NOT NULL,
  `content` text,
  `out_time` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`title`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('第一次作业', '2', '完成课后习题', '2017-05-30 17:26:39', '2017-05-31 00:00:00');
INSERT INTO `homework` VALUES ('第九周作业', '1', '抄书100遍', '2017-05-30 20:21:53', '2017-06-01 00:00:00');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_from` varchar(10) DEFAULT NULL,
  `num_to` varchar(10) DEFAULT NULL,
  `open_id` bigint(20) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for named_record
-- ----------------------------
DROP TABLE IF EXISTS `named_record`;
CREATE TABLE `named_record` (
  `named_id` bigint(20) NOT NULL,
  `snum` varchar(255) NOT NULL,
  PRIMARY KEY (`named_id`,`snum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of named_record
-- ----------------------------
INSERT INTO `named_record` VALUES ('25', '12121105');
INSERT INTO `named_record` VALUES ('27', '13121103');
INSERT INTO `named_record` VALUES ('28', '13121104');
INSERT INTO `named_record` VALUES ('29', '13121104');
INSERT INTO `named_record` VALUES ('30', '13121104');

-- ----------------------------
-- Table structure for named_time
-- ----------------------------
DROP TABLE IF EXISTS `named_time`;
CREATE TABLE `named_time` (
  `named_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tnum` varchar(255) DEFAULT NULL,
  `open_id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`named_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of named_time
-- ----------------------------
INSERT INTO `named_time` VALUES ('23', '10000002', '1', '2017-05-30 20:20:13');
INSERT INTO `named_time` VALUES ('24', '10000002', '14', '2017-08-28 13:54:50');
INSERT INTO `named_time` VALUES ('25', '10000002', '14', '2017-08-28 13:54:55');
INSERT INTO `named_time` VALUES ('26', '10000002', '14', '2017-08-28 13:55:01');
INSERT INTO `named_time` VALUES ('27', '10000002', '14', '2017-08-28 13:55:06');
INSERT INTO `named_time` VALUES ('28', '10000002', '14', '2017-08-28 13:55:08');
INSERT INTO `named_time` VALUES ('29', '10000002', '14', '2017-08-28 13:55:11');
INSERT INTO `named_time` VALUES ('30', '10000002', '14', '2017-08-28 13:55:16');

-- ----------------------------
-- Table structure for open
-- ----------------------------
DROP TABLE IF EXISTS `open`;
CREATE TABLE `open` (
  `open_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cNum` varchar(10) NOT NULL,
  `tNum` varchar(10) NOT NULL,
  `cTerm` int(10) DEFAULT NULL,
  `cTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`open_id`),
  KEY `cNum` (`cNum`),
  KEY `tNum` (`tNum`),
  CONSTRAINT `cNum` FOREIGN KEY (`cNum`) REFERENCES `course` (`cNum`),
  CONSTRAINT `tNum` FOREIGN KEY (`tNum`) REFERENCES `teacher` (`tNum`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='cTime 三5-6\r\ncTerm 2017-2018秋';

-- ----------------------------
-- Records of open
-- ----------------------------
INSERT INTO `open` VALUES ('1', '08305013', '10000002', '20171', '二7-9 四7-8 研讨 四9-10 学院机房上机');
INSERT INTO `open` VALUES ('2', '08305013', '10000004', '20171', '二7-9 四7-8 研讨 四9-10 学院机房上机');
INSERT INTO `open` VALUES ('3', '08305015', '10000003', '20171', '三1-2 五1-2 研讨 五3-4 学院机房上机');
INSERT INTO `open` VALUES ('4', '08305015', '10000005', '20171', '三1-2 五1-2 研讨 五3-4 学院机房上机');
INSERT INTO `open` VALUES ('5', '08306120', '10000001', '20171', '	一11-13 三9-10 学院机房上机');
INSERT INTO `open` VALUES ('6', '08306120', '10000007', '20171', '	一11-13 三9-10 学院机房上机');
INSERT INTO `open` VALUES ('7', '08305013', '10000006', '20171', '二7-9 四7-8 学院机房上机 四9-10研讨');
INSERT INTO `open` VALUES ('8', '08305016', '10000002', '20164', '一1-2 一3-4 学院机房上机 四3-4 研讨');
INSERT INTO `open` VALUES ('9', '08305016', '10000004', '20164', '一7-8 一9-10 学院机房上机 四7-8 研讨');
INSERT INTO `open` VALUES ('10', '08306099', '10000001', '20164', '一11-13 四5-6 学院机房上机');
INSERT INTO `open` VALUES ('11', '08306099', '10000007', '20164', '一11-13 四5-6 学院机房上机');
INSERT INTO `open` VALUES ('12', '08305014', '10000003', '20164', '三1-2 三3-4 学院机房上机 五1-2 研讨');
INSERT INTO `open` VALUES ('13', '08305014', '10000005', '20164', '三1-2 三3-4 学院机房上机 五1-2 研讨');
INSERT INTO `open` VALUES ('14', '08305013', '10000002', '20161', '二7-9 四7-8 研讨 四9-10 学院机房上机');
INSERT INTO `open` VALUES ('15', '08305014', '10000003', '20154', '二7-9 四7-8 研讨 四9-10 学院机房上机');
INSERT INTO `open` VALUES ('16', '08305013', '10000002', '20151', '二7-9 四7-8 研讨 四9-10 学院机房上机');
INSERT INTO `open` VALUES ('18', '01014125', '10000008', '20163', '	一1-2 三1-2 五1-2');
INSERT INTO `open` VALUES ('19', '01014125', '10000008', '20153', '一1-2 三1-2 五1-2');
INSERT INTO `open` VALUES ('24', '01014125', '10002937', '20163', '一1-2 三1-2 五1-2');

-- ----------------------------
-- Table structure for select
-- ----------------------------
DROP TABLE IF EXISTS `select`;
CREATE TABLE `select` (
  `open_id` bigint(20) NOT NULL,
  `sNum` varchar(10) NOT NULL,
  `grade` int(3) DEFAULT NULL,
  PRIMARY KEY (`open_id`,`sNum`),
  KEY `sNum` (`sNum`),
  CONSTRAINT `open_id` FOREIGN KEY (`open_id`) REFERENCES `open` (`open_id`),
  CONSTRAINT `sNum` FOREIGN KEY (`sNum`) REFERENCES `student` (`sNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of select
-- ----------------------------
INSERT INTO `select` VALUES ('1', '14120926', '84');
INSERT INTO `select` VALUES ('1', '14121980', '84');
INSERT INTO `select` VALUES ('2', '14121034', '80');
INSERT INTO `select` VALUES ('3', '14120926', '79');
INSERT INTO `select` VALUES ('3', '14121980', '74');
INSERT INTO `select` VALUES ('4', '14122158', '75');
INSERT INTO `select` VALUES ('5', '14120926', '84');
INSERT INTO `select` VALUES ('5', '14121980', '85');
INSERT INTO `select` VALUES ('6', '14121034', '86');
INSERT INTO `select` VALUES ('6', '14122145', '80');
INSERT INTO `select` VALUES ('8', '14120926', '89');
INSERT INTO `select` VALUES ('9', '14121980', '85');
INSERT INTO `select` VALUES ('9', '14122145', '79');
INSERT INTO `select` VALUES ('10', '14120926', '87');
INSERT INTO `select` VALUES ('10', '14121980', '88');
INSERT INTO `select` VALUES ('10', '14122145', '60');
INSERT INTO `select` VALUES ('11', '14122158', '70');
INSERT INTO `select` VALUES ('12', '14120926', '84');
INSERT INTO `select` VALUES ('12', '14121980', '85');
INSERT INTO `select` VALUES ('13', '14121034', '82');
INSERT INTO `select` VALUES ('13', '14122145', '80');
INSERT INTO `select` VALUES ('13', '14122158', '70');
INSERT INTO `select` VALUES ('14', '12121105', '75');
INSERT INTO `select` VALUES ('14', '13121101', '10');
INSERT INTO `select` VALUES ('14', '13121102', '80');
INSERT INTO `select` VALUES ('14', '13121103', '88');
INSERT INTO `select` VALUES ('14', '13121104', '78');
INSERT INTO `select` VALUES ('16', '12121105', '77');
INSERT INTO `select` VALUES ('18', '13121101', '60');
INSERT INTO `select` VALUES ('19', '13121103', '89');
INSERT INTO `select` VALUES ('19', '13121104', '90');
INSERT INTO `select` VALUES ('24', '12121105', '78');
INSERT INTO `select` VALUES ('24', '13121101', '43');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sNum` varchar(10) CHARACTER SET utf8 NOT NULL,
  `sName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sSex` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sBirthplace` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sPhone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `pwd` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sDept` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `gpa` double(10,3) DEFAULT '0.000',
  PRIMARY KEY (`sNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('12121105', '刘成刚', '男', '上海', '18015872567', '123', '计算机工程与科学学院', '0.000');
INSERT INTO `student` VALUES ('13121101', '李明', '男', '上海', '13613005486', '123', '通信与信息工程学院', '37.667');
INSERT INTO `student` VALUES ('13121102', '刘晓明', '男', '安徽', '18913457890', '123', '计算机工程与科学学院', '80.000');
INSERT INTO `student` VALUES ('13121103', '张颖', '女', '江苏', '18826490423', '123', '计算机工程与科学学院', '0.000');
INSERT INTO `student` VALUES ('13121104', '刘晶晶', '女', '上海', '13331934111', '123', '计算机工程与科学学院', '0.000');
INSERT INTO `student` VALUES ('14120000', '测试者', '男', '上海', '10000', '123456', '无', '4.000');
INSERT INTO `student` VALUES ('14120926', '徐轶玮', '女', '上海', '110', '14120926', '计算机工程与科学学院', '3.700');
INSERT INTO `student` VALUES ('14121034', '李屯', '女', '上海', '111', '14121034', '计算机工程与科学学院', '3.200');
INSERT INTO `student` VALUES ('14121980', '江泓', '女', '上海', '112', '14121980', '计算机工程与科学学院', '3.500');
INSERT INTO `student` VALUES ('14122145', '朱琪', '男', '上海', '120', '14122145', '计算机工程与科学学院', '3.300');
INSERT INTO `student` VALUES ('14122158', '符政峰', '男', '广西', '119', '14122158', '计算机工程与科学学院', '3.000');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tNum` varchar(10) NOT NULL,
  `tName` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `tSex` varchar(5) DEFAULT NULL,
  `tDegree` varchar(20) DEFAULT NULL,
  `tDept` varchar(20) DEFAULT NULL,
  `tTitle` varchar(20) DEFAULT NULL,
  `tInfo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10000001', '邹国兵', '10000001', '男', '	博士', '计算机工程与科学学院', '副教授', '邹国兵，博士，副教授，博士生副导师，硕士生导师。2012年毕业于同济大学，获计算机应用技术专业博士学位。2009年10月-2011年10月，曾作为国家公派留学人员，在美国华盛顿大学（Washington University in St. Louis）计算机科学与工程系，从事两年科研学习工作。2012年8月起，进入上海大学计算机工程与科学学院从事科研与教学工作，组建了服务计算与数据挖掘实验室。');
INSERT INTO `teacher` VALUES ('10000002', '袁世忠', '10000002', '男', '博士', '计算机工程与科学学院', '副教授', '袁世忠，博士，副教授。1989年4月毕业于上海工业大学（现为上海大学）计算机工程系，获计算机应用硕士学位，并留校从事科研和教学工作；2000年5月晋升为副教授；2011年9月获日本会津大学计算机科学与工程博士学位。主要研究领域为软件工程，计算机网络和安全，医疗信息系统。参与了我国第一个全部自主研发的阿达语言编译系统的研发，主持了上海市科技结合生产重点工业项目“东海实时监测工具软件”的研发以及多项上海市教委基金项目和企业合作研发项目。');
INSERT INTO `teacher` VALUES ('10000003', '郑宇', '10000003', '女', '博士', '计算机工程与科学学院', '讲师', '无');
INSERT INTO `teacher` VALUES ('10000004', '滕中梅', '10000004', '女', '硕士', '计算机工程与科学学院', '讲师', '无');
INSERT INTO `teacher` VALUES ('10000005', '宋安平', '10000005', '男', '博士', '计算机工程与科学学院', '副教授', '宋安平（apsong@shu.edu.cn），男，讲师，工学博士。本科毕业留校后，一直在上海大学计算机学院工作，主要从事教学、科研等方面工作，研究方向为医学图像处理及算法、生物信息学、数据库应用和并行计算等。主要进行对大型数据库管理系统中数据挖掘、分析和处理等工作，尤其对数据库中图像数据的建立和处理，三维医学图像相似性方面开展了一定的研究工作，先后主持和参与国家及上海市多项科研项目，发表论文20多篇，主编教材一本，协助指导研究生6名，2009年获得上海大学本科教学比赛一等奖。');
INSERT INTO `teacher` VALUES ('10000006', '沈俊', '10000006', '男', '硕士', '计算机工程与科学学院', '讲师', '1989年毕业于上海科技大学计算机科学系。毕业后留校工作至今，主要从事计算机科学的科研和教学工作。\r\n在科研工作方面，主要从事数据库和知识库、软件工程、人工智能、信息管理系统及决策支持系统等方面的研究。先后承担或参加的项目有：国防科工委“七.五”军用共性软件项目《决策支持系统生成器》；国防科工委“八.五”军用人工智能预研项目《智能决策支持系统生成器》；《上海信息城》项目；上海市电话号簿公司的《利用Framemaker实现号簿排版的可行性研究》和《易派彩色号簿排版系统》。\r\n在教学工作方面，承担过多门课程的辅导和主讲。主要课程有：《数据结构》、《编译原理》等。');
INSERT INTO `teacher` VALUES ('10000007', '宋波', '10000007', '男', '硕士', '计算机工程与科学学院', '讲师', '教学理念：\r\n    反对死记硬背，提倡快乐学习。通过灵活多样的各种方法激发学生兴趣，使学生尽可能在课堂内循序渐进地吸收掌握知识，并达到学以致用的目的。\r\n    以“授人以鱼不如授人以渔”为理念，引导培养学生良好的学习习惯和学习能力为主要教学追求和目的，主张大学教育以引领学生学习为主，而不仅仅是知识点的讲述。\r\n\r\n主要研究方向：\r\n    网络多媒体、虚拟仪器、.NET应用开发、面向对象程序设计、JavaEE开发、计算机图形学等。');
INSERT INTO `teacher` VALUES ('10000008', '吕巍', '10000008', '女', '博士', '理学院', '讲师', '无');
INSERT INTO `teacher` VALUES ('10002937', '何龙敏', '10002937', '男', '博士', '理学院', '副教授', '曾开设高等数学、概率论与数理统计、应用统计、线性代数、运筹学和经济数学等课程及毕业设计指导；教学中认真负责，能根据教材因人施教且形成自己的教学模式,努力做学生的良师益友；\r\n在国内外已发表论文23篇。');
DROP TRIGGER IF EXISTS `calc_gpa1`;
DELIMITER ;;
CREATE TRIGGER `calc_gpa1` AFTER INSERT ON `select` FOR EACH ROW update student set gpa=(
select AVG(grade) from `select` where sNum=NEW.sNum
)where sNum=NEW.sNum
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calc_gpa2`;
DELIMITER ;;
CREATE TRIGGER `calc_gpa2` AFTER UPDATE ON `select` FOR EACH ROW update student set gpa=(
select AVG(grade) from `select` where sNum=NEW.sNum
)where sNum=NEW.sNum
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calc_gpa3`;
DELIMITER ;;
CREATE TRIGGER `calc_gpa3` AFTER DELETE ON `select` FOR EACH ROW update student set gpa=(
select AVG(grade) from `select` where sNum=OLD.sNum
)where sNum=OLD.sNum
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
