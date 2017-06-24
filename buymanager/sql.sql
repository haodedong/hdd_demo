/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : 采购信息管理

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-15 10:01:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('root', '1234');
INSERT INTO `admin` VALUES ('haodedong', '51784');
INSERT INTO `admin` VALUES ('1', '1');

-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `se_num` int(255) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `buyer_id` int(255) DEFAULT NULL,
  `supp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `prod_id` (`prod_id`),
  KEY `supp_id` (`supp_id`),
  CONSTRAINT `buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supp_id` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `se_num` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` char(8) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('77', '71', '好好', '女', '56');
INSERT INTO `buyer` VALUES ('78', '33', '粉色', '男', '34');
INSERT INTO `buyer` VALUES ('79', '36', '刘天养', '男', '33');
INSERT INTO `buyer` VALUES ('80', '85', '呃呃呃', '男', '33');
INSERT INTO `buyer` VALUES ('81', '84', 'gg', null, '33');
INSERT INTO `buyer` VALUES ('82', '56', '急急急', '男', '44');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `se_num` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `weigt` double(255,0) DEFAULT NULL,
  `supp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supid` (`supp_id`),
  CONSTRAINT `supid` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `se_num` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('3', '102', '新浪', '哈哈哈', '24232423434');
INSERT INTO `supplier` VALUES ('4', '234', '网易', '恩恩2', '535534553');
INSERT INTO `supplier` VALUES ('8', '2424', 'erte', 'et', '34535345');
INSERT INTO `supplier` VALUES ('15', null, null, null, null);
INSERT INTO `supplier` VALUES ('16', null, null, null, null);
INSERT INTO `supplier` VALUES ('17', null, null, null, null);
INSERT INTO `supplier` VALUES ('18', null, null, null, null);
INSERT INTO `supplier` VALUES ('19', null, null, null, null);
INSERT INTO `supplier` VALUES ('20', null, null, null, null);
INSERT INTO `supplier` VALUES ('21', null, null, null, null);
INSERT INTO `supplier` VALUES ('22', null, null, null, null);

-- ----------------------------
-- View structure for select_product
-- ----------------------------
DROP VIEW IF EXISTS `select_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `select_product` AS select `p`.`id` AS `id`,`p`.`se_num` AS `se_num`,`p`.`name` AS `name`,`p`.`type` AS `type`,`p`.`weigt` AS `weigt`,`s`.`address` AS `address` from (`product` `p` join `supplier` `s`) where (`p`.`supp_id` = `s`.`id`) ;

-- ----------------------------
-- Event structure for e
-- ----------------------------
DROP EVENT IF EXISTS `e`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `e` ON SCHEDULE AT '2017-03-26 15:03:20' ON COMPLETION NOT PRESERVE ENABLE DO DELETE from buyer where id=20
;;
DELIMITER ;
