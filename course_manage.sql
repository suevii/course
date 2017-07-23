/*
Navicat MySQL Data Transfer

Source Server         : 我的连接
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : course_manage

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-30 12:55:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cnum` varchar(10) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('08305013', '编译原理');
INSERT INTO `course` VALUES ('08305014', '数据库原理(1)');
INSERT INTO `course` VALUES ('08305015', '数据库原理(2)');
INSERT INTO `course` VALUES ('08305016', '软件工程');
INSERT INTO `course` VALUES ('08306099', 'Java程序设计(实践)');
INSERT INTO `course` VALUES ('08306120', 'Java EE开发技术');

-- ----------------------------
-- Table structure for `course_file`
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
-- Table structure for `file`
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
-- Table structure for `mail`
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
-- Table structure for `open`
-- ----------------------------
DROP TABLE IF EXISTS `open`;
CREATE TABLE `open` (
  `open_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cnum` varchar(10) DEFAULT NULL,
  `tnum` varchar(10) DEFAULT NULL,
  `term` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of open
-- ----------------------------
INSERT INTO `open` VALUES ('1', '08305013', '10000002', '20171');
INSERT INTO `open` VALUES ('2', '08305013', '10000004', '20171');
INSERT INTO `open` VALUES ('3', '08305015', '10000003', '20171');
INSERT INTO `open` VALUES ('4', '08305015', '10000005', '20171');
INSERT INTO `open` VALUES ('5', '08306120', '10000001', '20171');
INSERT INTO `open` VALUES ('6', '08306120', '10000007', '20171');
INSERT INTO `open` VALUES ('7', '08305013', '10000006', '20171');
INSERT INTO `open` VALUES ('8', '08305016', '10000002', '20164');
INSERT INTO `open` VALUES ('9', '08305016', '10000004', '20164');
INSERT INTO `open` VALUES ('10', '08306099', '10000001', '20164');
INSERT INTO `open` VALUES ('11', '08306099', '10000007', '20164');
INSERT INTO `open` VALUES ('12', '08305014', '10000003', '20164');
INSERT INTO `open` VALUES ('13', '08305014', '10000005', '20164');

-- ----------------------------
-- Table structure for `select`
-- ----------------------------
DROP TABLE IF EXISTS `select`;
CREATE TABLE `select` (
  `open_id` varchar(10) NOT NULL,
  `snum` varchar(10) NOT NULL,
  `cnum` varchar(10) DEFAULT NULL,
  `tnum` varchar(10) DEFAULT NULL,
  `term` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`open_id`,`snum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of select
-- ----------------------------
INSERT INTO `select` VALUES ('1', '14120926', null, null, null);
INSERT INTO `select` VALUES ('1', '14121980', null, null, null);
INSERT INTO `select` VALUES ('10', '14120926', null, null, null);
INSERT INTO `select` VALUES ('10', '14121980', null, null, null);
INSERT INTO `select` VALUES ('11', '14120000', null, null, null);
INSERT INTO `select` VALUES ('12', '14120926', null, null, null);
INSERT INTO `select` VALUES ('12', '14121980', null, null, null);
INSERT INTO `select` VALUES ('13', '14120000', null, null, null);
INSERT INTO `select` VALUES ('2', '14120000', null, null, null);
INSERT INTO `select` VALUES ('3', '14120926', null, null, null);
INSERT INTO `select` VALUES ('3', '14121980', null, null, null);
INSERT INTO `select` VALUES ('4', '14120000', null, null, null);
INSERT INTO `select` VALUES ('5', '14120926', null, null, null);
INSERT INTO `select` VALUES ('5', '14121980', null, null, null);
INSERT INTO `select` VALUES ('6', '14120000', null, null, null);
INSERT INTO `select` VALUES ('8', '14120926', null, null, null);
INSERT INTO `select` VALUES ('9', '14121980', null, null, null);

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `snum` varchar(10) CHARACTER SET utf8 NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `pwd` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`snum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('14120926', '徐轶玮', '14120926');
INSERT INTO `student` VALUES ('14121034', '李屯', '14121034');
INSERT INTO `student` VALUES ('14121980', '江泓', '14121980');
INSERT INTO `student` VALUES ('14122145', '朱琪', '14122145');
INSERT INTO `student` VALUES ('14122158', '符政峰', '14122158');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tnum` varchar(10) NOT NULL,
  `tname` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10000001', '邹国兵', '10000001');
INSERT INTO `teacher` VALUES ('10000002', '袁世忠', '10000002');
INSERT INTO `teacher` VALUES ('10000003', '郑宇', '10000003');
INSERT INTO `teacher` VALUES ('10000004', '滕中梅', '10000004');
INSERT INTO `teacher` VALUES ('10000005', '宋安平', '10000005');
INSERT INTO `teacher` VALUES ('10000006', '沈俊', '10000006');
INSERT INTO `teacher` VALUES ('10000007', '宋波', '10000007');
