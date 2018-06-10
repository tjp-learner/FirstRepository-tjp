/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : studentscore

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-12-30 13:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Cno` int(11) NOT NULL,
  `Cname` varchar(60) NOT NULL,
  `Ccredit` int(11) NOT NULL,
  `Credit_hours` int(11) NOT NULL,
  `Crequirement` varchar(50) NOT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '微观经济学', '3', '48', '必修');
INSERT INTO `course` VALUES ('2', '微积分', '2', '32', '选修');
INSERT INTO `course` VALUES ('3', '高等数学', '5', '64', '必修');
INSERT INTO `course` VALUES ('4', '数据结构', '3', '48', '必修');
INSERT INTO `course` VALUES ('5', '数据库', '3', '56', '必修');
INSERT INTO `course` VALUES ('6', '英语口语', '2', '32', '选修');
INSERT INTO `course` VALUES ('7', '数字逻辑', '3', '48', '必修');
INSERT INTO `course` VALUES ('8', '制图', '4', '56', '必修');
INSERT INTO `course` VALUES ('9', '大学物理', '3', '56', '必修');
INSERT INTO `course` VALUES ('10', '结构力学', '3', '48', '必修');
INSERT INTO `course` VALUES ('11', '项目管理', '3', '56', '必修');
INSERT INTO `course` VALUES ('12', '金融经济学', '2', '32', '选修');
INSERT INTO `course` VALUES ('13', '管理学', '3', '48', '必修');
INSERT INTO `course` VALUES ('14', '财务报表', '3', '48', '必修');
INSERT INTO `course` VALUES ('15', '货币金融学', '4', '56', '必修');
INSERT INTO `course` VALUES ('16', '证券投资', '3', '32', '选修');
INSERT INTO `course` VALUES ('17', '保险', '3', '48', '必修');
INSERT INTO `course` VALUES ('18', '马克思主义基本原理', '3', '48', '必修');
INSERT INTO `course` VALUES ('19', '就业指导', '2', '32', '选修');
INSERT INTO `course` VALUES ('20', '线性代数', '3', '56', '必修');
INSERT INTO `course` VALUES ('21', '概率论与数理统计', '3', '48', '必修');
INSERT INTO `course` VALUES ('22', '计算机基础', '3', '32', '必修');
INSERT INTO `course` VALUES ('23', '复变函数与积分变换', '2', '48', '必修');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `Sno` int(11) NOT NULL,
  `Cno` int(11) NOT NULL,
  `Grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`),
  KEY `Score_key2` (`Cno`),
  CONSTRAINT `Score_key1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `Score_key2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('2015101', '1', '90');
INSERT INTO `score` VALUES ('2015101', '3', '85');
INSERT INTO `score` VALUES ('2015101', '12', '86');
INSERT INTO `score` VALUES ('2015101', '14', '88');
INSERT INTO `score` VALUES ('2015101', '17', '90');
INSERT INTO `score` VALUES ('2015101', '18', '93');
INSERT INTO `score` VALUES ('2015101', '22', '91');
INSERT INTO `score` VALUES ('2015102', '1', '95');
INSERT INTO `score` VALUES ('2015102', '2', '98');
INSERT INTO `score` VALUES ('2015102', '6', '87');
INSERT INTO `score` VALUES ('2015102', '13', '96');
INSERT INTO `score` VALUES ('2015102', '16', '81');
INSERT INTO `score` VALUES ('2015102', '22', '90');
INSERT INTO `score` VALUES ('2015103', '1', '85');
INSERT INTO `score` VALUES ('2015103', '6', '80');
INSERT INTO `score` VALUES ('2015103', '15', '90');
INSERT INTO `score` VALUES ('2015103', '18', '90');
INSERT INTO `score` VALUES ('2015103', '19', '88');
INSERT INTO `score` VALUES ('2015104', '1', '89');
INSERT INTO `score` VALUES ('2015104', '12', '90');
INSERT INTO `score` VALUES ('2015201', '3', '87');
INSERT INTO `score` VALUES ('2015201', '4', '95');
INSERT INTO `score` VALUES ('2015201', '5', '89');
INSERT INTO `score` VALUES ('2015201', '20', '89');
INSERT INTO `score` VALUES ('2015201', '21', '97');
INSERT INTO `score` VALUES ('2015201', '22', '93');
INSERT INTO `score` VALUES ('2015202', '5', '90');
INSERT INTO `score` VALUES ('2015202', '7', '84');
INSERT INTO `score` VALUES ('2015202', '20', '93');
INSERT INTO `score` VALUES ('2015301', '7', '95');
INSERT INTO `score` VALUES ('2015301', '9', '91');
INSERT INTO `score` VALUES ('2015301', '23', '84');
INSERT INTO `score` VALUES ('2015302', '4', '88');
INSERT INTO `score` VALUES ('2015303', '9', '83');
INSERT INTO `score` VALUES ('2015401', '1', '81');
INSERT INTO `score` VALUES ('2015401', '13', '91');
INSERT INTO `score` VALUES ('2015402', '13', '80');
INSERT INTO `score` VALUES ('2015403', '2', '95');
INSERT INTO `score` VALUES ('2015501', '8', '87');
INSERT INTO `score` VALUES ('2015501', '9', '85');
INSERT INTO `score` VALUES ('2015501', '10', '88');
INSERT INTO `score` VALUES ('2015502', '10', '89');
INSERT INTO `score` VALUES ('2015502', '11', '90');
INSERT INTO `score` VALUES ('2015503', '8', '79');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Sno` int(11) NOT NULL,
  `Sname` varchar(50) NOT NULL,
  `Ssex` char(4) NOT NULL,
  `Sage` int(11) DEFAULT NULL,
  `Sdept` varchar(10) NOT NULL,
  `Semail` varchar(50) DEFAULT NULL,
  `Sphone` varchar(20) DEFAULT NULL,
  `Spasswd` varchar(50) NOT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2015101', '林丽', '女', '18', '金融', '123456@qq.com', '15711111111', '111111');
INSERT INTO `student` VALUES ('2015102', '刘昊然', '男', '19', '金融', null, '13778928888', '111111');
INSERT INTO `student` VALUES ('2015103', '潘丽华', '女', '18', '金融', '176458@qq.com', '18723332333', '111111');
INSERT INTO `student` VALUES ('2015104', '王浩然', '男', '20', '金融', '567487@qq.com', null, '111111');
INSERT INTO `student` VALUES ('2015201', '李铭', '男', '19', '计算机', '231456@qq.com', '13755555555', '111111');
INSERT INTO `student` VALUES ('2015202', '刘晨', '女', '19', '计算机', null, '13788888888', '111111');
INSERT INTO `student` VALUES ('2015203', '张黎明', '男', '19', '计算机', '256361@qq.com', null, '111111');
INSERT INTO `student` VALUES ('2015204', '张金奎', '男', '20', '计算机', null, '17765563333', '111111');
INSERT INTO `student` VALUES ('2015205', '朱小林', '女', '19', '计算机', '177456@qq.com', '18745467666', '111111');
INSERT INTO `student` VALUES ('2015301', '王丽梅', '女', '19', '通信工程', '746387@qq.com', '17771838881', '111111');
INSERT INTO `student` VALUES ('2015302', '梅金天', '男', '20', '通信工程', null, null, '111111');
INSERT INTO `student` VALUES ('2015303', '苏豫名', '男', '21', '通信工程', null, '15797711111', '111111');
INSERT INTO `student` VALUES ('2015304', '苏雅丽', '女', '20', '通信工程', '912345@qq.com', null, '111111');
INSERT INTO `student` VALUES ('2015305', '舒新易', '男', '19', '通信工程', null, null, '111111');
INSERT INTO `student` VALUES ('2015401', '王立敏', '女', '20', '国际贸易', null, null, '111111');
INSERT INTO `student` VALUES ('2015402', '娜美', '女', '18', '国际贸易', null, null, '111111');
INSERT INTO `student` VALUES ('2015403', '罗丽丽', '女', '19', '国际贸易', null, '13725261111', '111111');
INSERT INTO `student` VALUES ('2015501', '张明', '男', '20', '土木工程', '351711@qq.com', null, '111111');
INSERT INTO `student` VALUES ('2015502', '陈皓皓', '男', '18', '土木工程', null, '18719011102', '111111');
INSERT INTO `student` VALUES ('2015503', '杨娜娜', '女', '19', '土木工程', '123808@qq.com', '18757575197', '111111');
INSERT INTO `student` VALUES ('2015504', '孙楠', '女', '20', '土木工程', null, null, '111111');
INSERT INTO `student` VALUES ('2015505', '孙浩杰', '男', '18', '土木工程', '145637@qq.com', null, '111111');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Tno` int(11) NOT NULL,
  `Tname` varchar(50) NOT NULL,
  `Tsex` char(4) NOT NULL,
  `Tage` int(11) DEFAULT NULL,
  `Ttitle` varchar(50) NOT NULL,
  `Temail` varchar(50) DEFAULT NULL,
  `Tphone` varchar(20) DEFAULT NULL,
  `Tpasswd` varchar(50) NOT NULL,
  PRIMARY KEY (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2001', '郭杰', '男', '36', '讲师', '634561@qq.com', '18987831233', '222222');
INSERT INTO `teacher` VALUES ('2002', '王阳名', '男', '40', '副教授', '656867@qq.com', null, '222222');
INSERT INTO `teacher` VALUES ('2003', '何舒先', '男', '37', '讲师', '793451@qq.com', '17832932983', '222222');
INSERT INTO `teacher` VALUES ('2004', '刘凯', '男', '45', '教授', '567487@qq.com', null, '222222');
INSERT INTO `teacher` VALUES ('2005', '邓方凯', '男', '30', '讲师', '464292@qq.com', '17782892891', '222222');
INSERT INTO `teacher` VALUES ('2006', '赵晶晶', '女', '34', '讲师', '763943@qq.com', null, '222222');
INSERT INTO `teacher` VALUES ('2007', '赵玲丽', '女', '47', '教授', '783823@qq.com', null, '222222');
INSERT INTO `teacher` VALUES ('2008', '将豪杰', '男', '40', '副教授', null, '17728819345', '222222');
INSERT INTO `teacher` VALUES ('2009', '舒容敏', '男', '42', '副教授', '891091@qq.com', '13782892109', '222222');
INSERT INTO `teacher` VALUES ('2010', '王凯歌', '女', '45', '教授', '345672@qq.com ', '16723238282', '222222');

-- ----------------------------
-- Table structure for `teaching`
-- ----------------------------
DROP TABLE IF EXISTS `teaching`;
CREATE TABLE `teaching` (
  `Tno` int(11) NOT NULL,
  `Cno` int(11) NOT NULL,
  `T_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Tno`,`Cno`),
  KEY `T_fkey2` (`Cno`),
  CONSTRAINT `T_fkey1` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`),
  CONSTRAINT `T_fkey2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teaching
-- ----------------------------
INSERT INTO `teaching` VALUES ('2001', '1', '教31栋301');
INSERT INTO `teaching` VALUES ('2001', '12', '教31栋307');
INSERT INTO `teaching` VALUES ('2001', '15', '教31栋405');
INSERT INTO `teaching` VALUES ('2002', '2', '教31栋205');
INSERT INTO `teaching` VALUES ('2002', '11', '教31栋105');
INSERT INTO `teaching` VALUES ('2002', '14', '教31栋105');
INSERT INTO `teaching` VALUES ('2002', '17', '教31栋201');
INSERT INTO `teaching` VALUES ('2003', '3', '教14栋111');
INSERT INTO `teaching` VALUES ('2003', '21', '教14栋105');
INSERT INTO `teaching` VALUES ('2003', '23', '教10栋304');
INSERT INTO `teaching` VALUES ('2004', '4', '教10栋107');
INSERT INTO `teaching` VALUES ('2004', '22', '教5栋204');
INSERT INTO `teaching` VALUES ('2005', '5', '教10栋202');
INSERT INTO `teaching` VALUES ('2005', '16', '教31栋411');
INSERT INTO `teaching` VALUES ('2006', '6', '教6栋402');
INSERT INTO `teaching` VALUES ('2006', '19', '教31栋403');
INSERT INTO `teaching` VALUES ('2007', '7', '教14栋108');
INSERT INTO `teaching` VALUES ('2007', '18', '教14栋207');
INSERT INTO `teaching` VALUES ('2008', '8', '教14栋303');
INSERT INTO `teaching` VALUES ('2008', '10', '教10栋307');
INSERT INTO `teaching` VALUES ('2009', '9', '教14栋211');
INSERT INTO `teaching` VALUES ('2009', '20', '教14栋204');
INSERT INTO `teaching` VALUES ('2010', '13', '教31栋204');

-- ----------------------------
-- Table structure for `teaching_evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `teaching_evaluation`;
CREATE TABLE `teaching_evaluation` (
  `Sno` int(11) NOT NULL,
  `Tno` int(11) NOT NULL,
  `Cno` int(11) NOT NULL,
  `E_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Tno`,`Cno`),
  KEY `Teaching_key2` (`Tno`),
  KEY `Teaching_key3` (`Cno`),
  CONSTRAINT `Teaching_key1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `Teaching_key2` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`),
  CONSTRAINT `Teaching_key3` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teaching_evaluation
-- ----------------------------
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2001', '1', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2001', '12', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2002', '14', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2002', '17', '90');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2003', '3', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2004', '22', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015101', '2007', '18', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2001', '1', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2002', '2', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2004', '22', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2005', '16', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2006', '6', '89');
INSERT INTO `teaching_evaluation` VALUES ('2015102', '2010', '13', '96');
INSERT INTO `teaching_evaluation` VALUES ('2015103', '2001', '1', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015103', '2001', '15', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015103', '2006', '6', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015103', '2006', '19', '96');
INSERT INTO `teaching_evaluation` VALUES ('2015103', '2007', '18', '97');
INSERT INTO `teaching_evaluation` VALUES ('2015104', '2001', '1', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015104', '2001', '12', '91');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2003', '3', '90');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2003', '21', '90');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2004', '4', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2004', '22', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2005', '5', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015201', '2009', '20', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015202', '2005', '5', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015202', '2007', '7', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015202', '2009', '20', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015301', '2003', '23', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015301', '2007', '7', '91');
INSERT INTO `teaching_evaluation` VALUES ('2015301', '2009', '9', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015302', '2004', '4', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015303', '2009', '9', '96');
INSERT INTO `teaching_evaluation` VALUES ('2015401', '2001', '1', '96');
INSERT INTO `teaching_evaluation` VALUES ('2015401', '2010', '13', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015402', '2010', '13', '92');
INSERT INTO `teaching_evaluation` VALUES ('2015403', '2002', '2', '96');
INSERT INTO `teaching_evaluation` VALUES ('2015501', '2008', '8', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015501', '2008', '10', '93');
INSERT INTO `teaching_evaluation` VALUES ('2015501', '2009', '9', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015502', '2002', '11', '95');
INSERT INTO `teaching_evaluation` VALUES ('2015502', '2008', '10', '94');
INSERT INTO `teaching_evaluation` VALUES ('2015503', '2008', '8', '94');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2015101', '111111');
INSERT INTO `user` VALUES ('2015102', '111111');
INSERT INTO `user` VALUES ('2015103', '111111');
INSERT INTO `user` VALUES ('2015104', '111111');
INSERT INTO `user` VALUES ('2015201', '111111');
INSERT INTO `user` VALUES ('2015202', '111111');
INSERT INTO `user` VALUES ('2015203', '111111');
INSERT INTO `user` VALUES ('2015204', '111111');
INSERT INTO `user` VALUES ('2015205', '111111');
INSERT INTO `user` VALUES ('2015301', '111111');
INSERT INTO `user` VALUES ('2015302', '111111');
INSERT INTO `user` VALUES ('2015303', '111111');
INSERT INTO `user` VALUES ('2015304', '111111');
INSERT INTO `user` VALUES ('2015305', '111111');
INSERT INTO `user` VALUES ('2015401', '111111');
INSERT INTO `user` VALUES ('2015402', '111111');
INSERT INTO `user` VALUES ('2015403', '111111');
INSERT INTO `user` VALUES ('2015501', '111111');
INSERT INTO `user` VALUES ('2015502', '111111');
INSERT INTO `user` VALUES ('2015503', '111111');
INSERT INTO `user` VALUES ('2001', '222222');
INSERT INTO `user` VALUES ('2002', '222222');
INSERT INTO `user` VALUES ('2003', '222222');
INSERT INTO `user` VALUES ('2004', '222222');
INSERT INTO `user` VALUES ('2005', '222222');
INSERT INTO `user` VALUES ('2006', '222222');
INSERT INTO `user` VALUES ('2007', '222222');
INSERT INTO `user` VALUES ('2008', '222222');
INSERT INTO `user` VALUES ('2009', '222222');
INSERT INTO `user` VALUES ('2010', '222222');
