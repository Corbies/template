/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-11-05 10:48:13
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '1', '系统管理', null, '0', '', '1', '1', '0', null, '0', '0', '2016-05-16 17:10:44', '0', '2016-06-02 21:01:12', null);
INSERT INTO `sys_menu` VALUES ('2', '2', '用户管理', '/user/list', '0', '', '1', '2', '1', '基础管理', '0', '0', '2016-05-06 14:34:37', '0', '2016-06-02 22:44:56', '用户管理');
INSERT INTO `sys_menu` VALUES ('3', '3', '角色管理', '/role/list', '0', '', '1', '3', '1', '基础管理', '0', '0', '2016-05-06 14:35:24', '0', '2016-05-17 14:14:34', '角色管理');
INSERT INTO `sys_menu` VALUES ('4', '4', '菜单管理', '/menu/list', '0', '', '1', '4', '1', '基础管理', '0', '0', '2016-05-06 14:35:51', '0', '2016-05-15 21:23:15', '菜单管理');
INSERT INTO `sys_menu` VALUES ('19', '5', '监控管理', null, '0', null, '1', '5', '0', null, '0', null, '2016-05-22 11:17:51', null, '2016-06-02 23:09:38', null);
INSERT INTO `sys_menu` VALUES ('26', '12', '添加', '/user/add', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-02 21:00:09', null, '2016-06-02 21:00:09', '添加用户');
INSERT INTO `sys_menu` VALUES ('27', '13', '修改', '/user/edit', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-02 22:39:47', null, '2016-06-02 22:39:47', '编辑用户');
INSERT INTO `sys_menu` VALUES ('29', '14', '添加', '/role/add', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-09 00:04:16', null, '2016-06-09 00:04:16', '');
INSERT INTO `sys_menu` VALUES ('30', '15', '权限列表', '/menu/listTree', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 12:11:17', null, '2016-06-26 12:11:17', '获取权限树');
INSERT INTO `sys_menu` VALUES ('31', '16', '分配权限', '/roleRes/save', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 12:11:55', null, '2016-06-26 12:11:55', '保存分配的权限');
INSERT INTO `sys_menu` VALUES ('32', '17', '添加', '/menu/add', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:51:06', null, '2016-06-26 15:51:06', '添加资源');
INSERT INTO `sys_menu` VALUES ('33', '18', '修改', '/menu/edit', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:52:13', null, '2016-06-26 15:52:13', '修改资源');
INSERT INTO `sys_menu` VALUES ('34', '19', '删除', '/menu/delete', '1', null, '1', null, '4', '资源管理', '0', null, '2016-06-26 15:53:14', null, '2016-06-26 15:53:14', '删除资源');
INSERT INTO `sys_menu` VALUES ('35', '20', '删除', '/user/delete', '1', null, '1', null, '2', '用户管理', '0', null, '2016-06-26 15:56:07', null, '2016-06-26 15:56:07', '删除用户');
INSERT INTO `sys_menu` VALUES ('36', '21', '修改', '/role/edit', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 15:56:54', null, '2016-06-26 15:56:54', '修改角色');
INSERT INTO `sys_menu` VALUES ('37', '22', '删除', '/role/delete', '1', null, '1', null, '3', '角色管理', '0', null, '2016-06-26 15:57:14', null, '2016-06-26 15:57:14', '删除角色');
INSERT INTO `sys_menu` VALUES ('38', '23', '登录日志', '/log/list', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:07:57', null, '2016-06-26 16:07:57', '登录日志');
INSERT INTO `sys_menu` VALUES ('39', '24', '操作日志', '/log/operate', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:11:30', null, '2016-06-26 16:11:30', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '超级管理员', 'admin', '0', '2016-04-15 11:21:00', '0', '2016-06-01 16:06:00', '0', '系统超级管理员');
INSERT INTO `sys_role` VALUES ('18', '2', '普通用户', 'member', '0', '2016-06-01 16:06:28', null, '2016-06-07 20:46:15', null, null);
INSERT INTO `sys_role` VALUES ('19', '3', '开发一', 'dev_1', '0', '2016-10-22 10:52:10', null, '2016-10-22 10:52:10', null, null);
INSERT INTO `sys_role` VALUES ('20', '4', '开发2', '开发_2', '0', '2016-10-22 10:52:21', null, '2016-10-22 10:52:21', null, null);
INSERT INTO `sys_role` VALUES ('21', '5', '开发3', '开发_3', '0', '2016-10-22 10:52:33', null, '2016-10-22 10:52:33', null, null);
INSERT INTO `sys_role` VALUES ('22', '6', '4', '4', '0', '2016-10-22 11:47:34', null, '2016-10-22 11:47:34', null, null);
INSERT INTO `sys_role` VALUES ('23', '7', '5', '5', '0', '2016-10-22 11:47:39', null, '2016-10-22 11:47:39', null, null);
INSERT INTO `sys_role` VALUES ('24', '8', '6', '6', '0', '2016-10-22 11:47:43', null, '2016-10-22 11:47:43', null, null);
INSERT INTO `sys_role` VALUES ('25', '9', '7', '7', '0', '2016-10-22 11:47:48', null, '2016-10-22 11:47:48', null, null);
INSERT INTO `sys_role` VALUES ('26', '10', '8', '8', '0', '2016-10-22 11:47:52', null, '2016-10-22 11:47:52', null, null);
INSERT INTO `sys_role` VALUES ('27', '11', '9', '9', '0', '2016-10-22 11:47:56', null, '2016-10-22 11:47:56', null, null);
INSERT INTO `sys_role` VALUES ('28', '12', '10', '10', '0', '2016-10-22 11:48:02', null, '2016-10-22 11:48:02', null, null);
INSERT INTO `sys_role` VALUES ('29', '13', '11', '11', '0', '2016-10-22 11:48:06', null, '2016-10-22 11:48:06', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('428', '2', '13', '0', '2016-06-08 23:55:36', null, '2016-06-08 23:55:36', null, null);
INSERT INTO `sys_role_menu` VALUES ('429', '2', '2', '0', '2016-06-08 23:55:36', null, '2016-06-08 23:55:36', null, null);
INSERT INTO `sys_role_menu` VALUES ('430', '2', '1', '0', '2016-06-08 23:55:37', null, '2016-06-08 23:55:37', null, null);
INSERT INTO `sys_role_menu` VALUES ('431', '2', '12', '0', '2016-06-08 23:55:37', null, '2016-06-08 23:55:37', null, null);
INSERT INTO `sys_role_menu` VALUES ('432', '2', '2', '0', '2016-06-08 23:55:37', null, '2016-06-08 23:55:37', null, null);
INSERT INTO `sys_role_menu` VALUES ('639', '1', '19', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('640', '1', '22', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('641', '1', '17', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('642', '1', '23', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('643', '1', '18', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('644', '1', '24', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('645', '1', '15', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('646', '1', '16', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('647', '1', '13', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('648', '1', '14', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('649', '1', '12', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('650', '1', '21', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('651', '1', '3', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('652', '1', '20', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('653', '1', '2', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('654', '1', '1', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('655', '1', '5', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);
INSERT INTO `sys_role_menu` VALUES ('656', '1', '4', '0', '2016-06-26 16:16:18', null, '2016-06-26 16:16:18', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '刘国庆', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2016-04-15 11:23:23', null, '751185330@qq.com', '13428281893', '0', '0', '2016-11-05 10:21:46', '127.0.0.1', '0', '2016-04-15 11:23:38', null, '2016-05-12 17:28:04', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '0', '2016-04-15 14:48:11', '0', '2016-04-15 14:48:13', '0', null);
INSERT INTO `sys_user_role` VALUES ('44', '2', '2', '0', '2016-06-09 21:53:21', null, '2016-06-09 21:53:21', null, null);
SET FOREIGN_KEY_CHECKS=1;
