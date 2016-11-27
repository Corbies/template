/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2016-11-27 20:39:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(64) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seq` tinyint(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_catagory` char(1) DEFAULT NULL COMMENT '是否作为分类菜单  Y , N',
  `is_delete` tinyint(1) NOT NULL COMMENT '软删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('17', '#', 'yifu', '衣服', '0', null, 'Y', '0', '2016-11-27 12:38:33', null, '2016-11-27 12:38:33', null, '衣服分类');
