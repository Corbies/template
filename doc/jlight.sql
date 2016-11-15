/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-11-15 21:04:47
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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('142', '1479218902534', 'admin', '2016-11-15 12:40:37', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-15 12:40:37', null, '2016-11-15 12:40:37', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('143', '1479218911901', 'admin', '2016-11-15 12:40:46', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:40:46', null, '2016-11-15 12:40:46', null, null);
INSERT INTO `sys_login_log` VALUES ('144', '1479219155757', 'admin', '2016-11-15 12:44:50', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:44:50', null, '2016-11-15 12:44:50', null, null);
INSERT INTO `sys_login_log` VALUES ('145', '1479219208760', 'admin', '2016-11-15 12:45:43', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:45:43', null, '2016-11-15 12:45:43', null, null);
INSERT INTO `sys_login_log` VALUES ('146', '1479219440874', 'admin', '2016-11-15 12:49:35', '127.0.0.1', '登录成功', '0', '2016-11-15 12:49:35', null, '2016-11-15 12:49:35', null, null);
INSERT INTO `sys_login_log` VALUES ('147', '1479219489422', 'admin', '2016-11-15 12:50:24', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:50:24', null, '2016-11-15 12:50:24', null, null);
INSERT INTO `sys_login_log` VALUES ('148', '1479219527601', 'admin', '2016-11-15 12:51:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:51:02', null, '2016-11-15 12:51:02', null, null);
INSERT INTO `sys_login_log` VALUES ('149', '1479219546507', 'admin', '2016-11-15 12:51:21', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:51:21', null, '2016-11-15 12:51:21', null, null);
INSERT INTO `sys_login_log` VALUES ('150', '1479219618870', 'admin', '2016-11-15 12:52:33', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:52:33', null, '2016-11-15 12:52:33', null, null);
INSERT INTO `sys_login_log` VALUES ('151', '1479219697182', 'admin', '2016-11-15 12:53:52', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:53:52', null, '2016-11-15 12:53:52', null, null);
INSERT INTO `sys_login_log` VALUES ('152', '1479219738102', 'admin', '2016-11-15 12:54:33', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:54:33', null, '2016-11-15 12:54:33', null, null);
INSERT INTO `sys_login_log` VALUES ('153', '1479219775132', 'admin', '2016-11-15 12:55:10', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:55:10', null, '2016-11-15 12:55:10', null, null);
INSERT INTO `sys_login_log` VALUES ('154', '1479219917297', 'admin', '2016-11-15 12:57:32', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:57:32', null, '2016-11-15 12:57:32', null, null);
INSERT INTO `sys_login_log` VALUES ('155', '1479219940390', 'admin', '2016-11-15 12:57:55', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 12:57:55', null, '2016-11-15 12:57:55', null, null);
INSERT INTO `sys_login_log` VALUES ('156', '1479220185985', 'admin', '2016-11-15 13:02:00', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 13:02:00', null, '2016-11-15 13:02:00', null, null);
INSERT INTO `sys_login_log` VALUES ('157', '1479220263219', 'admin', '2016-11-15 13:03:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 13:03:18', null, '2016-11-15 13:03:18', null, null);
INSERT INTO `sys_login_log` VALUES ('158', '1479220282538', 'admin', '2016-11-15 13:03:37', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 13:03:37', null, '2016-11-15 13:03:37', null, null);
INSERT INTO `sys_login_log` VALUES ('159', '1479220327388', 'admin', '2016-11-15 13:04:22', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-15 13:04:22', null, '2016-11-15 13:04:22', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '1', '系统管理', null, '0', '', '1', '1', '#', null, '0', '0', '2016-05-16 17:10:44', '0', '2016-06-02 21:01:12', null);
INSERT INTO `sys_menu` VALUES ('2', '2', '用户管理', '/user/listPage', '0', '', '1', '2', '1', '基础管理', '0', '0', '2016-05-06 14:34:37', '0', '2016-06-02 22:44:56', '用户管理');
INSERT INTO `sys_menu` VALUES ('3', '3', '角色管理', '/role/listPage', '0', '', '1', '3', '1', '基础管理', '0', '0', '2016-05-06 14:35:24', '0', '2016-05-17 14:14:34', '角色管理');
INSERT INTO `sys_menu` VALUES ('4', '4', '菜单管理', '/menu/listPage', '0', '', '1', '4', '1', '基础管理', '0', '0', '2016-05-06 14:35:51', '0', '2016-05-15 21:23:15', '菜单管理');
INSERT INTO `sys_menu` VALUES ('19', '5', '日志管理', null, '0', null, '1', '5', '#', null, '0', null, '2016-05-22 11:17:51', null, '2016-06-02 23:09:38', null);
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
INSERT INTO `sys_menu` VALUES ('39', '24', '操作日志', '/operateLog/list', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:11:30', null, '2016-06-26 16:11:30', null);
INSERT INTO `sys_menu` VALUES ('41', '1478700606660', '字典管理', '/dict/list', '0', null, '1', null, '1', '系统管理', '0', null, '2016-11-09 12:42:21', null, '2016-11-09 12:42:21', '字典管理');
INSERT INTO `sys_menu` VALUES ('42', '1480978838674', '角色分配', '/user/addRoles', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-13 06:14:31', null, '2016-11-13 06:14:31', '给用户分配角色');
INSERT INTO `sys_menu` VALUES ('43', '1479219411962', '查询', '/user/list', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-15 12:49:06', null, '2016-11-15 12:49:06', null);
INSERT INTO `sys_menu` VALUES ('44', '1479219651971', '重置密码', '/user/resetPwd', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-15 12:53:06', null, '2016-11-15 12:53:06', '重置密码');
INSERT INTO `sys_menu` VALUES ('45', '1479219802326', '查询', '/role/list', '1', null, '1', null, '3', '角色管理', '0', null, '2016-11-15 12:55:37', null, '2016-11-15 12:55:37', '角色查询');
INSERT INTO `sys_menu` VALUES ('46', '1479220072000', '查询', '/loginLog/list', '1', null, '1', null, '23', '登录日志', '0', null, '2016-11-15 13:00:06', null, '2016-11-15 13:00:06', '日志查询');
INSERT INTO `sys_menu` VALUES ('47', '1479220099932', '删除', '/loginLog/delete', '1', null, '1', null, '23', '登录日志', '0', null, '2016-11-15 13:00:34', null, '2016-11-15 13:00:34', '日志删除');
INSERT INTO `sys_menu` VALUES ('48', '1479220122402', '查询', '/menu/list', '1', null, '1', null, '4', '菜单管理', '0', null, '2016-11-15 13:00:57', null, '2016-11-15 13:00:57', '菜单查询');

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_log`;
CREATE TABLE `sys_operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_log_id` varchar(255) NOT NULL,
  `login_account` varchar(64) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_args` varchar(255) DEFAULT NULL,
  `operate_time` datetime NOT NULL,
  `operate_ip` varchar(64) NOT NULL,
  `is_delete` int(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_operate_log
-- ----------------------------

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
INSERT INTO `sys_role` VALUES ('30', '1478540596277', '测试', 'test', '0', '2016-11-07 16:15:31', null, '2016-11-07 16:15:31', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=917 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('742', '1478540596277', '1', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('743', '1478540596277', '2', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('744', '1478540596277', '13', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('745', '1478540596277', '4', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('746', '1478540596277', '18', '0', '2016-11-13 13:04:28', null, '2016-11-13 13:04:28', null, null);
INSERT INTO `sys_role_menu` VALUES ('897', '1', '22', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('898', '1', '12', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('899', '1', '23', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('900', '1', '1479220072000', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('901', '1', '13', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('902', '1', '24', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('903', '1', '14', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('904', '1', '16', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('905', '1', '1479220122402', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('906', '1', '1479219411962', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('907', '1', '1', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('908', '1', '2', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('909', '1', '3', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('910', '1', '4', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('911', '1', '5', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('912', '1', '1480978838674', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('913', '1', '20', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('914', '1', '1479219651971', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('915', '1', '1479219802326', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);
INSERT INTO `sys_role_menu` VALUES ('916', '1', '21', '0', '2016-11-15 13:04:15', null, '2016-11-15 13:04:15', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '刘国庆', '24b81da6640d91def35d33c7940a16c7e0631ff99d3060a491694866f1063fcc', '2016-04-15 11:23:23', null, '751185330@qq.com', '13428281893', '0', '0', '2016-11-15 13:04:22', '0:0:0:0:0:0:0:1', '0', '2016-04-15 11:23:38', null, '2016-05-12 17:28:04', null, null);
INSERT INTO `sys_user` VALUES ('59', '1480752439327', 'jason', '黎扬贵', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, '134288282082@qq.com', '13428282082', '2', '0', '2016-11-12 04:25:42', '0:0:0:0:0:0:0:1', '0', '2016-11-10 15:21:12', null, '2016-11-10 15:21:12', null, '黎扬贵');
INSERT INTO `sys_user` VALUES ('60', '1480974674253', 'liyg', '黎扬贵', '75a2a3e2abb929ed8d22ce3de907bbbfb3834ef22c3d39d54a88c7cc3e55715f', null, null, '18316986707@163.com', '18316986707', '0', '0', '2016-11-13 06:30:46', '0:0:0:0:0:0:0:1', '0', '2016-11-13 05:05:07', null, '2016-11-13 05:05:07', null, '黎扬贵');
INSERT INTO `sys_user` VALUES ('61', '1479043051565', 'test', '测试', 'ee4262f7c5811a146473482249ad288ae6689d4ac6824fe3bdab445d98a4b796', null, null, 'goqeng@gmail.com', '18218676908', '0', '0', '2016-11-15 12:39:50', '0:0:0:0:0:0:0:1', '0', '2016-11-13 11:49:46', null, '2016-11-13 11:49:46', null, null);

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
INSERT INTO `sys_user_role` VALUES ('71', '1480752439327', '1478540596277', '0', '2016-11-10 15:21:33', null, '2016-11-10 15:21:33', null, null);
INSERT INTO `sys_user_role` VALUES ('72', '1480974674253', '1478540596277', '0', '2016-11-13 05:05:33', null, '2016-11-13 05:05:33', null, null);
INSERT INTO `sys_user_role` VALUES ('73', '1479043051565', '1478540596277', '0', '2016-11-13 11:50:17', null, '2016-11-13 11:50:17', null, null);
