/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-12-07 23:44:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_button
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `button_id` varchar(64) NOT NULL COMMENT '按钮编号',
  `button_name` varchar(30) NOT NULL COMMENT '按钮名称',
  `button_content` varchar(50) NOT NULL COMMENT '按钮标签内容',
  `is_delete` tinyint(1) NOT NULL COMMENT '软删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_button
-- ----------------------------
INSERT INTO `sys_button` VALUES ('1', '1', '添加', '', '0', '2016-05-21 23:18:31', null, '2016-05-21 23:18:33', null, null);
INSERT INTO `sys_button` VALUES ('2', '2', '删除', '', '0', '2016-05-21 23:18:50', null, '2016-05-21 23:18:52', null, null);
INSERT INTO `sys_button` VALUES ('3', '3', '编辑', '', '0', '2016-05-21 23:19:07', null, '2016-05-21 23:19:09', null, null);
INSERT INTO `sys_button` VALUES ('4', '5', '查看', '', '0', '2016-05-21 23:19:19', null, '2016-05-21 23:19:22', null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('17', '#', 'dict', '数据字典', '0', null, 'Y', '0', '2016-11-27 12:38:33', null, '2016-11-27 12:38:33', null, '');
INSERT INTO `sys_dict` VALUES ('26', '17', 'test', '测试', '0', null, 'Y', '0', '2016-11-30 13:35:52', null, '2016-11-30 13:35:52', null, null);
INSERT INTO `sys_dict` VALUES ('27', '17', 'sex', '性别', '0', null, 'Y', '0', '2016-11-30 13:40:10', null, '2016-11-30 13:40:10', null, null);
INSERT INTO `sys_dict` VALUES ('28', '27', 'nanxing', '男性', '0', null, 'N', '0', '2016-11-30 13:42:16', null, '2016-12-04 12:24:54', null, null);
INSERT INTO `sys_dict` VALUES ('29', '27', 'nvxing', '女性', '0', null, 'N', '0', '2016-12-04 12:24:11', null, '2016-12-04 12:24:11', null, null);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_log_id` varchar(64) NOT NULL,
  `login_account` varchar(30) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_delete` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('392', '1480160151304', 'admin', '2016-11-26 10:08:06', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-26 10:08:06', null, '2016-11-26 10:08:06', null, null);
INSERT INTO `sys_login_log` VALUES ('393', '1480178279468', 'admin', '2016-11-26 15:10:14', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-26 15:10:14', null, '2016-11-26 15:10:14', null, null);
INSERT INTO `sys_login_log` VALUES ('394', '1480221334337', 'admin', '2016-11-27 03:07:49', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 03:07:49', null, '2016-11-27 03:07:49', null, null);
INSERT INTO `sys_login_log` VALUES ('395', '1480223541085', 'admin', '2016-11-27 03:44:36', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 03:44:36', null, '2016-11-27 03:44:36', null, null);
INSERT INTO `sys_login_log` VALUES ('396', '1480224044316', 'admin', '2016-11-27 03:52:59', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 03:52:59', null, '2016-11-27 03:52:59', null, null);
INSERT INTO `sys_login_log` VALUES ('397', '1480224272839', 'admin', '2016-11-27 03:56:48', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 03:56:48', null, '2016-11-27 03:56:48', null, null);
INSERT INTO `sys_login_log` VALUES ('398', '1480225087540', 'admin', '2016-11-27 04:10:22', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 04:10:22', null, '2016-11-27 04:10:22', null, null);
INSERT INTO `sys_login_log` VALUES ('399', '1480226321126', 'admin', '2016-11-27 04:30:56', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 04:30:56', null, '2016-11-27 04:30:56', null, null);
INSERT INTO `sys_login_log` VALUES ('400', '1480226996330', 'admin', '2016-11-27 04:42:11', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 04:42:11', null, '2016-11-27 04:42:11', null, null);
INSERT INTO `sys_login_log` VALUES ('401', '1480233593654', 'admin', '2016-11-27 06:32:09', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 06:32:09', null, '2016-11-27 06:32:09', null, null);
INSERT INTO `sys_login_log` VALUES ('402', '1480234373874', 'admin', '2016-11-27 06:45:09', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 06:45:09', null, '2016-11-27 06:45:09', null, null);
INSERT INTO `sys_login_log` VALUES ('403', '1480235272031', 'admin', '2016-11-27 07:00:07', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 07:00:07', null, '2016-11-27 07:00:07', null, null);
INSERT INTO `sys_login_log` VALUES ('404', '1480239417017', 'admin', '2016-11-27 08:09:12', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 08:09:12', null, '2016-11-27 08:09:12', null, null);
INSERT INTO `sys_login_log` VALUES ('405', '1480239523587', 'admin', '2016-11-27 08:10:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 08:10:59', null, '2016-11-27 08:10:59', null, null);
INSERT INTO `sys_login_log` VALUES ('406', '1480240092748', 'admin', '2016-11-27 08:20:28', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 08:20:28', null, '2016-11-27 08:20:28', null, null);
INSERT INTO `sys_login_log` VALUES ('407', '1480240218133', 'admin', '2016-11-27 08:22:33', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 08:22:33', null, '2016-11-27 08:22:33', null, null);
INSERT INTO `sys_login_log` VALUES ('408', '1480249550298', 'admin', '2016-11-27 10:58:05', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 10:58:05', null, '2016-11-27 10:58:05', null, null);
INSERT INTO `sys_login_log` VALUES ('409', '1480250642098', 'admin', '2016-11-27 11:16:17', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 11:16:17', null, '2016-11-27 11:16:17', null, null);
INSERT INTO `sys_login_log` VALUES ('410', '1480251216980', 'admin', '2016-11-27 11:25:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 11:25:52', null, '2016-11-27 11:25:52', null, null);
INSERT INTO `sys_login_log` VALUES ('411', '1480252661005', 'admin', '2016-11-27 11:49:56', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 11:49:56', null, '2016-11-27 11:49:56', null, null);
INSERT INTO `sys_login_log` VALUES ('412', '1480252869442', 'admin', '2016-11-27 11:53:24', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 11:53:24', null, '2016-11-27 11:53:24', null, null);
INSERT INTO `sys_login_log` VALUES ('413', '1480253343351', 'admin', '2016-11-27 12:01:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:01:18', null, '2016-11-27 12:01:18', null, null);
INSERT INTO `sys_login_log` VALUES ('414', '1480254085927', 'admin', '2016-11-27 12:13:41', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:13:41', null, '2016-11-27 12:13:41', null, null);
INSERT INTO `sys_login_log` VALUES ('415', '1480254549168', 'admin', '2016-11-27 12:21:24', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:21:24', null, '2016-11-27 12:21:24', null, null);
INSERT INTO `sys_login_log` VALUES ('416', '1480254803925', 'admin', '2016-11-27 12:25:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:25:39', null, '2016-11-27 12:25:39', null, null);
INSERT INTO `sys_login_log` VALUES ('417', '1480254877246', 'admin', '2016-11-27 12:26:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:26:52', null, '2016-11-27 12:26:52', null, null);
INSERT INTO `sys_login_log` VALUES ('418', '1480255344391', 'admin', '2016-11-27 12:34:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:34:39', null, '2016-11-27 12:34:39', null, null);
INSERT INTO `sys_login_log` VALUES ('419', '1480256663090', 'admin', '2016-11-27 12:56:38', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 12:56:38', null, '2016-11-27 12:56:38', null, null);
INSERT INTO `sys_login_log` VALUES ('420', '1480257995917', 'admin', '2016-11-27 13:18:50', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 13:18:50', null, '2016-11-27 13:18:50', null, null);
INSERT INTO `sys_login_log` VALUES ('421', '1480258137570', 'admin', '2016-11-27 13:21:12', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-27 13:21:12', null, '2016-11-27 13:21:12', null, null);
INSERT INTO `sys_login_log` VALUES ('422', '1480428719295', 'admin', '2016-11-29 12:44:14', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 12:44:14', null, '2016-11-29 12:44:14', null, null);
INSERT INTO `sys_login_log` VALUES ('423', '1480431800087', 'admin', '2016-11-29 13:35:34', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 13:35:35', null, '2016-11-29 13:35:35', null, null);
INSERT INTO `sys_login_log` VALUES ('424', '1480433748590', 'admin', '2016-11-29 14:08:03', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:08:03', null, '2016-11-29 14:08:03', null, null);
INSERT INTO `sys_login_log` VALUES ('425', '1480433993865', 'admin', '2016-11-29 14:12:08', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:12:08', null, '2016-11-29 14:12:08', null, null);
INSERT INTO `sys_login_log` VALUES ('426', '1480434120866', 'admin', '2016-11-29 14:14:15', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:14:15', null, '2016-11-29 14:14:15', null, null);
INSERT INTO `sys_login_log` VALUES ('427', '1480434272731', 'admin', '2016-11-29 14:16:47', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:16:47', null, '2016-11-29 14:16:47', null, null);
INSERT INTO `sys_login_log` VALUES ('428', '1480435111199', 'admin', '2016-11-29 14:30:46', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:30:46', null, '2016-11-29 14:30:46', null, null);
INSERT INTO `sys_login_log` VALUES ('429', '1480435119305', 'admin', '2016-11-29 14:30:54', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:30:54', null, '2016-11-29 14:30:54', null, null);
INSERT INTO `sys_login_log` VALUES ('430', '1480435560840', 'admin', '2016-11-29 14:38:15', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:38:15', null, '2016-11-29 14:38:15', null, null);
INSERT INTO `sys_login_log` VALUES ('431', '1480436021466', 'admin', '2016-11-29 14:45:56', '127.0.0.1', '登录成功', '0', '2016-11-29 14:45:56', null, '2016-11-29 14:45:56', null, null);
INSERT INTO `sys_login_log` VALUES ('432', '1480436185085', 'admin', '2016-11-29 14:48:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:48:40', null, '2016-11-29 14:48:40', null, null);
INSERT INTO `sys_login_log` VALUES ('433', '1480436297837', 'admin', '2016-11-29 14:50:32', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-29 14:50:32', null, '2016-11-29 14:50:32', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('434', '1480436300956', 'admin', '2016-11-29 14:50:35', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:50:35', null, '2016-11-29 14:50:35', null, null);
INSERT INTO `sys_login_log` VALUES ('435', '1480436373829', 'admin', '2016-11-29 14:51:48', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-29 14:51:48', null, '2016-11-29 14:51:48', null, null);
INSERT INTO `sys_login_log` VALUES ('436', '1480514401280', 'admin', '2016-11-30 12:32:16', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 12:32:16', null, '2016-11-30 12:32:16', null, null);
INSERT INTO `sys_login_log` VALUES ('437', '1480515762441', 'admin', '2016-11-30 12:54:57', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 12:54:57', null, '2016-11-30 12:54:57', null, null);
INSERT INTO `sys_login_log` VALUES ('438', '1480515812535', 'admin', '2016-11-30 12:55:47', '127.0.0.1', '登录成功', '0', '2016-11-30 12:55:47', null, '2016-11-30 12:55:47', null, null);
INSERT INTO `sys_login_log` VALUES ('439', '1480515999866', 'admin', '2016-11-30 12:58:54', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 12:58:54', null, '2016-11-30 12:58:54', null, null);
INSERT INTO `sys_login_log` VALUES ('440', '1480516392890', 'admin', '2016-11-30 13:05:27', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:05:27', null, '2016-11-30 13:05:27', null, null);
INSERT INTO `sys_login_log` VALUES ('441', '1480516485976', 'admin', '2016-11-30 13:07:00', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:07:00', null, '2016-11-30 13:07:00', null, null);
INSERT INTO `sys_login_log` VALUES ('442', '1480516666555', 'admin', '2016-11-30 13:10:01', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:10:01', null, '2016-11-30 13:10:01', null, null);
INSERT INTO `sys_login_log` VALUES ('443', '1480517155103', 'admin', '2016-11-30 13:18:10', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:18:10', null, '2016-11-30 13:18:10', null, null);
INSERT INTO `sys_login_log` VALUES ('444', '1480517232858', 'admin', '2016-11-30 13:19:27', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:19:27', null, '2016-11-30 13:19:27', null, null);
INSERT INTO `sys_login_log` VALUES ('445', '1480517403055', 'admin', '2016-11-30 13:22:17', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:22:17', null, '2016-11-30 13:22:17', null, null);
INSERT INTO `sys_login_log` VALUES ('446', '1480517481491', 'admin', '2016-11-30 13:23:36', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:23:36', null, '2016-11-30 13:23:36', null, null);
INSERT INTO `sys_login_log` VALUES ('447', '1480517775653', 'admin', '2016-11-30 13:28:30', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:28:30', null, '2016-11-30 13:28:30', null, null);
INSERT INTO `sys_login_log` VALUES ('448', '1480517818217', 'admin', '2016-11-30 13:29:13', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:29:13', null, '2016-11-30 13:29:13', null, null);
INSERT INTO `sys_login_log` VALUES ('449', '1480517957865', 'admin', '2016-11-30 13:31:32', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:31:32', null, '2016-11-30 13:31:32', null, null);
INSERT INTO `sys_login_log` VALUES ('450', '1480518067752', 'admin', '2016-11-30 13:33:22', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:33:22', null, '2016-11-30 13:33:22', null, null);
INSERT INTO `sys_login_log` VALUES ('451', '1480518163374', 'admin', '2016-11-30 13:34:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:34:58', null, '2016-11-30 13:34:58', null, null);
INSERT INTO `sys_login_log` VALUES ('452', '1480518769477', 'admin', '2016-11-30 13:45:04', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 13:45:04', null, '2016-11-30 13:45:04', null, null);
INSERT INTO `sys_login_log` VALUES ('453', '1480521595017', 'admin', '2016-11-30 14:32:09', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:32:09', null, '2016-11-30 14:32:09', null, null);
INSERT INTO `sys_login_log` VALUES ('454', '1480521750616', 'admin', '2016-11-30 14:34:45', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:34:45', null, '2016-11-30 14:34:45', null, null);
INSERT INTO `sys_login_log` VALUES ('455', '1480521941232', 'admin', '2016-11-30 14:37:56', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:37:56', null, '2016-11-30 14:37:56', null, null);
INSERT INTO `sys_login_log` VALUES ('456', '1480522137317', 'admin', '2016-11-30 14:41:12', '127.0.0.1', '登录成功', '0', '2016-11-30 14:41:12', null, '2016-11-30 14:41:12', null, null);
INSERT INTO `sys_login_log` VALUES ('457', '1480522468759', 'admin', '2016-11-30 14:46:43', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:46:43', null, '2016-11-30 14:46:43', null, null);
INSERT INTO `sys_login_log` VALUES ('458', '1480522489140', 'admin', '2016-11-30 14:47:04', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:47:04', null, '2016-11-30 14:47:04', null, null);
INSERT INTO `sys_login_log` VALUES ('459', '1480522585818', 'admin', '2016-11-30 14:48:40', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:48:40', null, '2016-11-30 14:48:40', null, null);
INSERT INTO `sys_login_log` VALUES ('460', '1480522863397', 'admin', '2016-11-30 14:53:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:53:18', null, '2016-11-30 14:53:18', null, null);
INSERT INTO `sys_login_log` VALUES ('461', '1480522966255', 'admin', '2016-11-30 14:55:01', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-30 14:55:01', null, '2016-11-30 14:55:01', null, null);
INSERT INTO `sys_login_log` VALUES ('462', '1480600109958', 'admin', '2016-12-01 12:20:44', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-01 12:20:44', null, '2016-12-01 12:20:44', null, null);
INSERT INTO `sys_login_log` VALUES ('463', '1480600448977', 'admin', '2016-12-01 12:26:23', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-01 12:26:23', null, '2016-12-01 12:26:23', null, null);
INSERT INTO `sys_login_log` VALUES ('464', '1480600519590', 'admin', '2016-12-01 12:27:34', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-01 12:27:34', null, '2016-12-01 12:27:34', null, null);
INSERT INTO `sys_login_log` VALUES ('465', '1480600594118', 'admin', '2016-12-01 12:28:49', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-01 12:28:49', null, '2016-12-01 12:28:49', null, null);
INSERT INTO `sys_login_log` VALUES ('466', '1480602567848', 'admin', '2016-12-01 13:01:42', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-01 13:01:42', null, '2016-12-01 13:01:42', null, null);
INSERT INTO `sys_login_log` VALUES ('467', '1480684334292', 'admin', '2016-12-02 11:44:29', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 11:44:29', null, '2016-12-02 11:44:29', null, null);
INSERT INTO `sys_login_log` VALUES ('468', '1480685137939', 'admin', '2016-12-02 11:57:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 11:57:52', null, '2016-12-02 11:57:52', null, null);
INSERT INTO `sys_login_log` VALUES ('469', '1480685696804', 'admin', '2016-12-02 12:07:11', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 12:07:11', null, '2016-12-02 12:07:11', null, null);
INSERT INTO `sys_login_log` VALUES ('470', '1480685794140', 'admin', '2016-12-02 12:08:49', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 12:08:49', null, '2016-12-02 12:08:49', null, null);
INSERT INTO `sys_login_log` VALUES ('471', '1480685977371', 'admin', '2016-12-02 12:11:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 12:11:52', null, '2016-12-02 12:11:52', null, null);
INSERT INTO `sys_login_log` VALUES ('472', '1480686037454', 'admin', '2016-12-02 12:12:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 12:12:52', null, '2016-12-02 12:12:52', null, null);
INSERT INTO `sys_login_log` VALUES ('473', '1480687670098', 'admin', '2016-12-02 12:40:05', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 12:40:05', null, '2016-12-02 12:40:05', null, null);
INSERT INTO `sys_login_log` VALUES ('474', '1480691089107', 'admin', '2016-12-02 13:37:04', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 13:37:04', null, '2016-12-02 13:37:04', null, null);
INSERT INTO `sys_login_log` VALUES ('475', '1480691412121', 'admin', '2016-12-02 13:42:27', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 13:42:27', null, '2016-12-02 13:42:27', null, null);
INSERT INTO `sys_login_log` VALUES ('476', '1480691602925', 'admin', '2016-12-02 13:45:37', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 13:45:37', null, '2016-12-02 13:45:37', null, null);
INSERT INTO `sys_login_log` VALUES ('477', '1480691690186', 'admin', '2016-12-02 13:47:05', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 13:47:05', null, '2016-12-02 13:47:05', null, null);
INSERT INTO `sys_login_log` VALUES ('478', '1480692053956', 'admin', '2016-12-02 13:53:08', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 13:53:08', null, '2016-12-02 13:53:08', null, null);
INSERT INTO `sys_login_log` VALUES ('479', '1480692676845', 'admin', '2016-12-02 14:03:31', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 14:03:31', null, '2016-12-02 14:03:31', null, null);
INSERT INTO `sys_login_log` VALUES ('480', '1480692869141', 'admin', '2016-12-02 14:06:44', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-02 14:06:44', null, '2016-12-02 14:06:44', null, null);
INSERT INTO `sys_login_log` VALUES ('481', '1480858658493', 'admin', '2016-12-04 12:09:53', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:09:53', null, '2016-12-04 12:09:53', null, null);
INSERT INTO `sys_login_log` VALUES ('482', '1480858949066', 'admin', '2016-12-04 12:14:43', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:14:43', null, '2016-12-04 12:14:43', null, null);
INSERT INTO `sys_login_log` VALUES ('483', '1480859094217', 'admin', '2016-12-04 12:17:09', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:17:09', null, '2016-12-04 12:17:09', null, null);
INSERT INTO `sys_login_log` VALUES ('484', '1480859355390', 'admin', '2016-12-04 12:21:30', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:21:30', null, '2016-12-04 12:21:30', null, null);
INSERT INTO `sys_login_log` VALUES ('485', '1480859424053', 'admin', '2016-12-04 12:22:38', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:22:38', null, '2016-12-04 12:22:38', null, null);
INSERT INTO `sys_login_log` VALUES ('486', '1480859437000', 'admin', '2016-12-04 12:22:51', '127.0.0.1', '登录成功', '0', '2016-12-04 12:22:51', null, '2016-12-04 12:22:51', null, null);
INSERT INTO `sys_login_log` VALUES ('487', '1480859490506', 'admin', '2016-12-04 12:23:45', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 12:23:45', null, '2016-12-04 12:23:45', null, null);
INSERT INTO `sys_login_log` VALUES ('488', '1480862855118', 'admin', '2016-12-04 13:19:50', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 13:19:50', null, '2016-12-04 13:19:50', null, null);
INSERT INTO `sys_login_log` VALUES ('489', '1480862862976', 'admin', '2016-12-04 13:19:57', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 13:19:57', null, '2016-12-04 13:19:57', null, null);
INSERT INTO `sys_login_log` VALUES ('490', '1480863580407', 'admin', '2016-12-04 13:31:55', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 13:31:55', null, '2016-12-04 13:31:55', null, null);
INSERT INTO `sys_login_log` VALUES ('491', '1480863722954', 'admin', '2016-12-04 13:34:17', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 13:34:17', null, '2016-12-04 13:34:17', null, null);
INSERT INTO `sys_login_log` VALUES ('492', '1480863876114', 'admin', '2016-12-04 13:36:51', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-04 13:36:51', null, '2016-12-04 13:36:51', null, null);
INSERT INTO `sys_login_log` VALUES ('493', '1480947016244', 'admin', '2016-12-05 12:42:31', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 12:42:31', null, '2016-12-05 12:42:31', null, null);
INSERT INTO `sys_login_log` VALUES ('494', '1480949353478', 'admin', '2016-12-05 13:21:28', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:21:28', null, '2016-12-05 13:21:28', null, null);
INSERT INTO `sys_login_log` VALUES ('495', '1480949457000', 'admin', '2016-12-05 13:23:11', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:23:11', null, '2016-12-05 13:23:11', null, null);
INSERT INTO `sys_login_log` VALUES ('496', '1480949585182', 'admin', '2016-12-05 13:25:20', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:25:20', null, '2016-12-05 13:25:20', null, null);
INSERT INTO `sys_login_log` VALUES ('497', '1480949670264', 'admin', '2016-12-05 13:26:45', '127.0.0.1', '登录成功', '0', '2016-12-05 13:26:45', null, '2016-12-05 13:26:45', null, null);
INSERT INTO `sys_login_log` VALUES ('498', '1480949908370', 'admin', '2016-12-05 13:30:43', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:30:43', null, '2016-12-05 13:30:43', null, null);
INSERT INTO `sys_login_log` VALUES ('499', '1480949983417', 'admin', '2016-12-05 13:31:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:31:58', null, '2016-12-05 13:31:58', null, null);
INSERT INTO `sys_login_log` VALUES ('500', '1480950050362', 'admin', '2016-12-05 13:33:05', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:33:05', null, '2016-12-05 13:33:05', null, null);
INSERT INTO `sys_login_log` VALUES ('501', '1480950233731', 'admin', '2016-12-05 13:36:08', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:36:08', null, '2016-12-05 13:36:08', null, null);
INSERT INTO `sys_login_log` VALUES ('502', '1480950340702', 'admin', '2016-12-05 13:37:55', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:37:55', null, '2016-12-05 13:37:55', null, null);
INSERT INTO `sys_login_log` VALUES ('503', '1480950831873', 'admin', '2016-12-05 13:46:06', '127.0.0.1', '登录成功', '0', '2016-12-05 13:46:06', null, '2016-12-05 13:46:06', null, null);
INSERT INTO `sys_login_log` VALUES ('504', '1480950985024', 'admin', '2016-12-05 13:48:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:48:39', null, '2016-12-05 13:48:39', null, null);
INSERT INTO `sys_login_log` VALUES ('505', '1480951087600', 'admin', '2016-12-05 13:50:22', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:50:22', null, '2016-12-05 13:50:22', null, null);
INSERT INTO `sys_login_log` VALUES ('506', '1480951223135', 'admin', '2016-12-05 13:52:38', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:52:38', null, '2016-12-05 13:52:38', null, null);
INSERT INTO `sys_login_log` VALUES ('507', '1480951313647', 'admin', '2016-12-05 13:54:08', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-05 13:54:08', null, '2016-12-05 13:54:08', null, null);
INSERT INTO `sys_login_log` VALUES ('508', '1481039954794', 'admin', '2016-12-06 14:31:29', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:31:29', null, '2016-12-06 14:31:29', null, null);
INSERT INTO `sys_login_log` VALUES ('509', '1481040096692', 'admin', '2016-12-06 14:33:51', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:33:51', null, '2016-12-06 14:33:51', null, null);
INSERT INTO `sys_login_log` VALUES ('510', '1481040130952', 'admin', '2016-12-06 14:34:25', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:34:25', null, '2016-12-06 14:34:25', null, null);
INSERT INTO `sys_login_log` VALUES ('511', '1481040276038', 'admin', '2016-12-06 14:36:50', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:36:50', null, '2016-12-06 14:36:50', null, null);
INSERT INTO `sys_login_log` VALUES ('512', '1481040573535', 'admin', '2016-12-06 14:41:48', '127.0.0.1', '登录成功', '0', '2016-12-06 14:41:48', null, '2016-12-06 14:41:48', null, null);
INSERT INTO `sys_login_log` VALUES ('513', '1481040585083', 'admin', '2016-12-06 14:41:59', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:41:59', null, '2016-12-06 14:41:59', null, null);
INSERT INTO `sys_login_log` VALUES ('514', '1481040652471', 'admin', '2016-12-06 14:43:07', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:43:07', null, '2016-12-06 14:43:07', null, null);
INSERT INTO `sys_login_log` VALUES ('515', '1481040737822', 'admin', '2016-12-06 14:44:32', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:44:32', null, '2016-12-06 14:44:32', null, null);
INSERT INTO `sys_login_log` VALUES ('516', '1481040846577', 'admin', '2016-12-06 14:46:21', '127.0.0.1', '登录成功', '0', '2016-12-06 14:46:21', null, '2016-12-06 14:46:21', null, null);
INSERT INTO `sys_login_log` VALUES ('517', '1481041023529', 'admin', '2016-12-06 14:49:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:49:18', null, '2016-12-06 14:49:18', null, null);
INSERT INTO `sys_login_log` VALUES ('518', '1481041196283', 'admin', '2016-12-06 14:52:11', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:52:11', null, '2016-12-06 14:52:11', null, null);
INSERT INTO `sys_login_log` VALUES ('519', '1481041388181', 'admin', '2016-12-06 14:55:23', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:55:23', null, '2016-12-06 14:55:23', null, null);
INSERT INTO `sys_login_log` VALUES ('520', '1481041543453', 'admin', '2016-12-06 14:57:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 14:57:58', null, '2016-12-06 14:57:58', null, null);
INSERT INTO `sys_login_log` VALUES ('521', '1481041668193', 'admin', '2016-12-06 15:00:03', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 15:00:03', null, '2016-12-06 15:00:03', null, null);
INSERT INTO `sys_login_log` VALUES ('522', '1481041716784', 'admin', '2016-12-06 15:00:51', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 15:00:51', null, '2016-12-06 15:00:51', null, null);
INSERT INTO `sys_login_log` VALUES ('523', '1481041833121', 'admin', '2016-12-06 15:02:48', '127.0.0.1', '登录成功', '0', '2016-12-06 15:02:48', null, '2016-12-06 15:02:48', null, null);
INSERT INTO `sys_login_log` VALUES ('524', '1481041907930', 'admin', '2016-12-06 15:04:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 15:04:02', null, '2016-12-06 15:04:02', null, null);
INSERT INTO `sys_login_log` VALUES ('525', '1481042340462', 'admin', '2016-12-06 15:11:15', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 15:11:15', null, '2016-12-06 15:11:15', null, null);
INSERT INTO `sys_login_log` VALUES ('526', '1481042498233', 'admin', '2016-12-06 15:13:53', '127.0.0.1', '登录成功', '0', '2016-12-06 15:13:53', null, '2016-12-06 15:13:53', null, null);
INSERT INTO `sys_login_log` VALUES ('527', '1481042549451', 'admin', '2016-12-06 15:14:44', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-06 15:14:44', null, '2016-12-06 15:14:44', null, null);
INSERT INTO `sys_login_log` VALUES ('528', '1481122849925', 'admin', '2016-12-07 13:33:04', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 13:33:04', null, '2016-12-07 13:33:04', null, null);
INSERT INTO `sys_login_log` VALUES ('529', '1481122978644', 'admin', '2016-12-07 13:35:13', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 13:35:13', null, '2016-12-07 13:35:13', null, null);
INSERT INTO `sys_login_log` VALUES ('530', '1481123337488', 'admin', '2016-12-07 13:41:12', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 13:41:12', null, '2016-12-07 13:41:12', null, null);
INSERT INTO `sys_login_log` VALUES ('531', '1481124362636', 'admin', '2016-12-07 13:58:17', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 13:58:17', null, '2016-12-07 13:58:17', null, null);
INSERT INTO `sys_login_log` VALUES ('532', '1481124638035', 'admin', '2016-12-07 14:02:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 14:02:52', null, '2016-12-07 14:02:52', null, null);
INSERT INTO `sys_login_log` VALUES ('533', '1481127189695', 'admin', '2016-12-07 14:45:24', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 14:45:24', null, '2016-12-07 14:45:24', null, null);
INSERT INTO `sys_login_log` VALUES ('534', '1481127707622', 'admin', '2016-12-07 14:54:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 14:54:02', null, '2016-12-07 14:54:02', null, null);
INSERT INTO `sys_login_log` VALUES ('553', '1481130666965', 'admin', '2016-12-07 15:43:21', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-12-07 15:43:21', null, '2016-12-07 15:43:21', null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(64) NOT NULL COMMENT '资源编号',
  `name` varchar(30) NOT NULL COMMENT '菜单名称',
  `url` varchar(30) DEFAULT NULL COMMENT '菜单url',
  `type` int(1) DEFAULT NULL COMMENT '菜单类型(0为一级菜单,2为二级菜单,3为按钮)',
  `icon` varchar(30) DEFAULT '' COMMENT '菜单图标',
  `is_show` int(1) NOT NULL COMMENT '是否显示(1为是，0为不是)',
  `seq` int(1) DEFAULT NULL COMMENT '菜单顺序',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '上级菜单ID',
  `parent_name` varchar(20) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '软删除标识',
  `create_by` varchar(64) DEFAULT '0' COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '0' COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_res_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '1', '系统管理', null, '0', 'icon-desktop', '1', '1', '#', null, '0', '0', '2016-05-16 17:10:44', '0', '2016-06-02 21:01:12', null);
INSERT INTO `sys_menu` VALUES ('2', '2', '用户管理', '/user/listPage', '0', 'icon-user', '1', '2', '1', '基础管理', '0', '0', '2016-05-06 14:34:37', '0', '2016-06-02 22:44:56', '用户管理');
INSERT INTO `sys_menu` VALUES ('3', '3', '角色管理', '/role/listPage', '0', 'icon-magnet', '1', '3', '1', '基础管理', '0', '0', '2016-05-06 14:35:24', '0', '2016-05-17 14:14:34', '角色管理');
INSERT INTO `sys_menu` VALUES ('4', '4', '菜单管理', '/menu/listPage', '0', 'icon-sitemap', '1', '4', '1', '基础管理', '0', '0', '2016-05-06 14:35:51', '0', '2016-05-15 21:23:15', '菜单管理');
INSERT INTO `sys_menu` VALUES ('19', '5', '日志管理', null, '0', 'icon-credit-card', '1', '5', '#', null, '0', null, '2016-05-22 11:17:51', null, '2016-06-02 23:09:38', null);
INSERT INTO `sys_menu` VALUES ('26', '12', '添加', '/user/add', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-02 21:00:09', null, '2016-06-02 21:00:09', '添加用户');
INSERT INTO `sys_menu` VALUES ('27', '13', '修改', '/user/edit', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-02 22:39:47', null, '2016-06-02 22:39:47', '编辑用户');
INSERT INTO `sys_menu` VALUES ('29', '14', '添加', '/role/add', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-09 00:04:16', null, '2016-06-09 00:04:16', '');
INSERT INTO `sys_menu` VALUES ('31', '16', '分配权限', '/roleRes/save', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 12:11:55', null, '2016-06-26 12:11:55', '保存分配的权限');
INSERT INTO `sys_menu` VALUES ('32', '17', '添加', '/menu/add', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:51:06', null, '2016-06-26 15:51:06', '添加资源');
INSERT INTO `sys_menu` VALUES ('33', '18', '修改', '/menu/edit', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:52:13', null, '2016-06-26 15:52:13', '修改资源');
INSERT INTO `sys_menu` VALUES ('34', '19', '删除', '/menu/delete', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:53:14', null, '2016-06-26 15:53:14', '删除资源');
INSERT INTO `sys_menu` VALUES ('35', '20', '删除', '/user/delete', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-26 15:56:07', null, '2016-06-26 15:56:07', '删除用户');
INSERT INTO `sys_menu` VALUES ('36', '21', '修改', '/role/edit', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 15:56:54', null, '2016-06-26 15:56:54', '修改角色');
INSERT INTO `sys_menu` VALUES ('37', '22', '删除', '/role/delete', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 15:57:14', null, '2016-06-26 15:57:14', '删除角色');
INSERT INTO `sys_menu` VALUES ('38', '23', '登录日志', '/loginLog/listPage', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:07:57', null, '2016-06-26 16:07:57', '登录日志');
INSERT INTO `sys_menu` VALUES ('39', '24', '操作日志', '/webLog/list', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:11:30', null, '2016-06-26 16:11:30', null);
INSERT INTO `sys_menu` VALUES ('41', '1478700606660', '字典管理', '/dict/list', '0', 'icon-screenshot', '1', null, '1', '系统管理', '0', null, '2016-11-09 12:42:21', null, '2016-11-09 12:42:21', '字典管理');
INSERT INTO `sys_menu` VALUES ('42', '1480978838674', '角色分配', '/user/addRoles', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-13 06:14:31', null, '2016-11-13 06:14:31', '给用户分配角色');
INSERT INTO `sys_menu` VALUES ('43', '1479219411962', '查询', '/user/list', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-15 12:49:06', null, '2016-11-15 12:49:06', null);
INSERT INTO `sys_menu` VALUES ('44', '1479219651971', '重置密码', '/user/resetPwd', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-15 12:53:06', null, '2016-11-15 12:53:06', '重置密码');
INSERT INTO `sys_menu` VALUES ('45', '1479219802326', '查询', '/role/list', '1', null, '1', null, '3', '角色管理', '0', null, '2016-11-15 12:55:37', null, '2016-11-15 12:55:37', '角色查询');
INSERT INTO `sys_menu` VALUES ('46', '1479220072000', '查询', '/loginLog/list', '1', null, '1', null, '23', '登录日志', '0', null, '2016-11-15 13:00:06', null, '2016-11-15 13:00:06', '日志查询');
INSERT INTO `sys_menu` VALUES ('47', '1479220099932', '删除', '/loginLog/delete', '1', null, '1', null, '23', '登录日志', '0', null, '2016-11-15 13:00:34', null, '2016-11-15 13:00:34', '日志删除');
INSERT INTO `sys_menu` VALUES ('48', '1479220122402', '查询', '/menu/list', '1', null, '1', null, '4', '菜单管理', '0', null, '2016-11-15 13:00:57', null, '2016-11-15 13:00:57', '菜单查询');
INSERT INTO `sys_menu` VALUES ('53', '1480136216606', '测试', '/user/test', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-26 03:29:11', null, '2016-11-26 03:29:11', null);
INSERT INTO `sys_menu` VALUES ('54', '1480224173523', '添加', '/dic/add', '1', null, '1', null, '1478700606660', '字典管理', '0', null, '2016-11-27 03:55:08', null, '2016-11-27 03:55:08', '添加');
INSERT INTO `sys_menu` VALUES ('55', '1480224199655', '修改', '/dic/edit', '1', null, '1', null, '1478700606660', '字典管理', '0', null, '2016-11-27 03:55:35', null, '2016-11-27 03:55:35', '修改');
INSERT INTO `sys_menu` VALUES ('56', '1480254855433', '删除', '/dic/delete', '1', null, '1', null, '1478700606660', '字典管理', '0', null, '2016-11-27 12:26:30', null, '2016-11-27 12:26:30', null);

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` int(11) NOT NULL,
  `param_id` varchar(64) NOT NULL COMMENT '参数编号',
  `name` varchar(30) NOT NULL COMMENT '参数名称',
  `value` varchar(100) NOT NULL COMMENT '参数值',
  `is_delete` int(1) NOT NULL COMMENT '删除软标识(0为未删除，1为删除)',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_param
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `sign` varchar(30) NOT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT '0' COMMENT '更新人',
  `remark` varchar(256) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sign` (`sign`),
  KEY `idx_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '超级管理员', 'admin', '0', '2016-04-15 11:21:00', '0', '2016-11-08 14:33:53', '0', '超级管理员');
INSERT INTO `sys_role` VALUES ('30', '1478540596277', '测试', 'test', '0', '2016-11-07 16:15:31', null, '2016-12-06 15:11:21', null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '资源编号',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '软删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT '0' COMMENT '更新人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`,`role_id`,`menu_id`),
  KEY `idx_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('742', '1478540596277', '1', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('743', '1478540596277', '2', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('744', '1478540596277', '13', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('745', '1478540596277', '4', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('746', '1478540596277', '18', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('961', '1', '22', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('962', '1', '12', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('963', '1', '23', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('964', '1', '1479220072000', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('965', '1', '13', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('966', '1', '24', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('967', '1', '14', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('968', '1', '16', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('969', '1', '1480224173523', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('970', '1', '1479220122402', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('971', '1', '1479219411962', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('972', '1', '1478700606660', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('973', '1', '1', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('974', '1', '2', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('975', '1', '3', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('976', '1', '4', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('977', '1', '5', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('978', '1', '1480254855433', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('979', '1', '1480978838674', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('980', '1', '20', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('981', '1', '1479219651971', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('982', '1', '1479219802326', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);
INSERT INTO `sys_role_menu` VALUES ('983', '1', '21', '0', '2016-11-27 12:26:44', null, '2016-11-27 12:26:44', null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `account` varchar(30) NOT NULL COMMENT '用户帐号',
  `true_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `birth` datetime DEFAULT NULL COMMENT '出生日期',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号码',
  `error_count` int(2) NOT NULL DEFAULT '0' COMMENT '当天登录错误次数',
  `is_lock` int(1) NOT NULL DEFAULT '0' COMMENT '用户是否锁定',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(30) DEFAULT NULL COMMENT '用户登录IP地址',
  `is_delete` tinyint(1) NOT NULL COMMENT '软删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_idx` (`user_id`),
  UNIQUE KEY `account_idx` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '刘国庆', '24b81da6640d91def35d33c7940a16c7e0631ff99d3060a491694866f1063fcc', '2016-04-15 11:23:23', null, '751185330@qq.com', '13428281893', '0', '0', '2016-12-07 15:43:21', '0:0:0:0:0:0:0:1', '0', '2016-04-15 11:23:38', null, '2016-05-12 17:28:04', null, null);
INSERT INTO `sys_user` VALUES ('62', '1479919417862', 'test', '测试人员', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, '751185330@qq.com', '13428281893', '0', '1', '2016-11-26 02:11:11', '0:0:0:0:0:0:0:1', '0', '2016-11-23 15:15:52', null, '2016-11-23 15:15:52', null, null);
INSERT INTO `sys_user` VALUES ('63', '1481041210833', 'gg', 'gg', '5334925b0262f6c18fde3147b127b49432a7f9a1d4118b19f995ac20a2bea077', null, null, 'goqeng@gmail.com', '18218676908', '0', '0', null, null, '0', '2016-12-06 14:52:25', null, '2016-12-06 14:52:25', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '软删除标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT '0' COMMENT '更新人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '0', '2016-04-15 14:48:11', '0', '2016-04-15 14:48:13', '0', null);
INSERT INTO `sys_user_role` VALUES ('73', '1479919417862', '1478540596277', '0', '2016-11-26 02:11:05', null, '2016-11-26 02:11:05', null, null);

-- ----------------------------
-- Table structure for sys_web_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_web_log`;
CREATE TABLE `sys_web_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_log_id` varchar(255) NOT NULL,
  `login_account` varchar(64) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_desc` varchar(100) DEFAULT NULL,
  `method_args` varchar(255) DEFAULT NULL,
  `operate_time` datetime NOT NULL,
  `operate_ip` varchar(64) NOT NULL,
  `status` varchar(4) DEFAULT NULL,
  `is_delete` int(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_web_log
-- ----------------------------
INSERT INTO `sys_web_log` VALUES ('38', '1481042553185', 'admin', 'list', '查询用户列表', '[com.lew.jlight.mybatis.ParamFilter@66005b90]', '2016-12-06 15:14:48', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-06 15:14:48', null, '2016-12-06 15:14:48', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('39', '1481042558060', 'admin', 'list', '查询角色列表', '[com.lew.jlight.mybatis.ParamFilter@57711e5c]', '2016-12-06 15:14:52', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-06 15:14:52', null, '2016-12-06 15:14:52', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('40', '1481042576756', 'admin', 'detail', '查询字典详细', '[26]', '2016-12-06 15:15:11', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-06 15:15:11', null, '2016-12-06 15:15:11', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('41', '1481042582224', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@28d1b93e]', '2016-12-06 15:15:17', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-06 15:15:17', null, '2016-12-06 15:15:17', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('42', '1481123446950', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@28f61329]', '2016-12-07 13:43:01', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 13:43:01', null, '2016-12-07 13:43:01', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('43', '1481124640739', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@2ea97e09]', '2016-12-07 14:02:55', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 14:02:55', null, '2016-12-07 14:02:55', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('44', '1481127967426', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@266cc97]', '2016-12-07 14:58:22', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 14:58:22', null, '2016-12-07 14:58:22', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('45', '1481128538446', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@7f0fc356]', '2016-12-07 15:07:53', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:07:53', null, '2016-12-07 15:07:53', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('46', '1481128926175', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@1f8b55a5]', '2016-12-07 15:14:21', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:14:21', null, '2016-12-07 15:14:21', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('47', '1481129141246', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@3cd21ca6]', '2016-12-07 15:17:56', '127.0.0.1', '成功', '0', '2016-12-07 15:17:56', null, '2016-12-07 15:17:56', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('48', '1481129411800', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@7ab901f8]', '2016-12-07 15:22:26', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:22:26', null, '2016-12-07 15:22:26', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('49', '1481129617244', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@3c3638db]', '2016-12-07 15:25:52', '127.0.0.1', '成功', '0', '2016-12-07 15:25:52', null, '2016-12-07 15:25:52', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('50', '1481130413510', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@223f80cd]', '2016-12-07 15:39:08', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:08', null, '2016-12-07 15:39:08', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('51', '1481130417386', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@3dab15b7]', '2016-12-07 15:39:12', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:12', null, '2016-12-07 15:39:12', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('52', '1481130419277', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@78feb27c]', '2016-12-07 15:39:14', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:14', null, '2016-12-07 15:39:14', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('53', '1481130420822', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@1324afe4]', '2016-12-07 15:39:15', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:15', null, '2016-12-07 15:39:15', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('54', '1481130421380', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@5b13ecc1]', '2016-12-07 15:39:16', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:16', null, '2016-12-07 15:39:16', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('55', '1481130421986', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@2ecbcf1d]', '2016-12-07 15:39:16', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:16', null, '2016-12-07 15:39:16', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('56', '1481130422615', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@752d4ad6]', '2016-12-07 15:39:17', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:17', null, '2016-12-07 15:39:17', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('57', '1481130430725', 'admin', 'list', '查询用户列表', '[com.lew.jlight.mybatis.ParamFilter@2a99bbcc]', '2016-12-07 15:39:25', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:25', null, '2016-12-07 15:39:25', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('58', '1481130431785', 'admin', 'list', '查询角色列表', '[com.lew.jlight.mybatis.ParamFilter@bc9547]', '2016-12-07 15:39:26', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:26', null, '2016-12-07 15:39:26', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('59', '1481130435419', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@6c5b09c3]', '2016-12-07 15:39:30', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:39:30', null, '2016-12-07 15:39:30', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('60', '1481130495172', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@529b4ffa]', '2016-12-07 15:40:30', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:40:30', null, '2016-12-07 15:40:30', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('61', '1481130497479', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@4f6d9fcb]', '2016-12-07 15:40:32', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:40:32', null, '2016-12-07 15:40:32', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('62', '1481130516661', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@fbb985c]', '2016-12-07 15:40:51', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:40:51', null, '2016-12-07 15:40:51', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('63', '1481130561498', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@634f6544]', '2016-12-07 15:41:36', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:41:36', null, '2016-12-07 15:41:36', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('64', '1481130569596', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@7a1128fe]', '2016-12-07 15:41:44', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:41:44', null, '2016-12-07 15:41:44', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('65', '1481130623803', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@64d5eb72]', '2016-12-07 15:42:38', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:42:38', null, '2016-12-07 15:42:38', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('66', '1481130669197', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@2a76bb4a]', '2016-12-07 15:43:24', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:43:24', null, '2016-12-07 15:43:24', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('67', '1481130672142', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@27ea05d9]', '2016-12-07 15:43:27', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:43:27', null, '2016-12-07 15:43:27', null, '操作成功');
INSERT INTO `sys_web_log` VALUES ('68', '1481130674913', 'admin', 'list', '查询登录日志列表', '[com.lew.jlight.mybatis.ParamFilter@749c5b0e]', '2016-12-07 15:43:29', '0:0:0:0:0:0:0:1', '成功', '0', '2016-12-07 15:43:29', null, '2016-12-07 15:43:29', null, '操作成功');
