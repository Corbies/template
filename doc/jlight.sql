/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-11-12 14:43:44
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('35', '1478928998642', 'admin', '2016-11-12 04:08:53', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:08:53', null, '2016-11-12 04:08:53', null, null);
INSERT INTO `sys_login_log` VALUES ('36', '1478929228037', 'admin', '2016-11-12 04:12:42', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:12:42', null, '2016-11-12 04:12:42', null, null);
INSERT INTO `sys_login_log` VALUES ('37', '1478930792631', 'admin', '2016-11-12 04:38:47', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:38:47', null, '2016-11-12 04:38:47', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '1', '系统管理', null, '0', '', '1', '1', '#', null, '0', '0', '2016-05-16 17:10:44', '0', '2016-06-02 21:01:12', null);
INSERT INTO `sys_menu` VALUES ('2', '2', '用户管理', '/user/list', '0', '', '1', '2', '1', '基础管理', '0', '0', '2016-05-06 14:34:37', '0', '2016-06-02 22:44:56', '用户管理');
INSERT INTO `sys_menu` VALUES ('3', '3', '角色管理', '/role/list', '0', '', '1', '3', '1', '基础管理', '0', '0', '2016-05-06 14:35:24', '0', '2016-05-17 14:14:34', '角色管理');
INSERT INTO `sys_menu` VALUES ('4', '4', '菜单管理', '/menu/list', '0', '', '1', '4', '1', '基础管理', '0', '0', '2016-05-06 14:35:51', '0', '2016-05-15 21:23:15', '菜单管理');
INSERT INTO `sys_menu` VALUES ('19', '5', '日志管理', null, '0', null, '1', '5', '#', null, '0', null, '2016-05-22 11:17:51', null, '2016-06-02 23:09:38', null);
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
INSERT INTO `sys_menu` VALUES ('38', '23', '登录日志', '/loginLog/list', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:07:57', null, '2016-06-26 16:07:57', '登录日志');
INSERT INTO `sys_menu` VALUES ('39', '24', '操作日志', '/log/operate', '0', null, '1', null, '5', '监控管理', '0', null, '2016-06-26 16:11:30', null, '2016-06-26 16:11:30', null);
INSERT INTO `sys_menu` VALUES ('41', '1478700606660', '字典管理', '/dict/list', '0', null, '1', null, '1', '系统管理', '0', null, '2016-11-09 12:42:21', null, '2016-11-09 12:42:21', '字典管理');

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_log`;
CREATE TABLE `sys_operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_log_id` varchar(255) NOT NULL,
  `login_account` varchar(64) NOT NULL,
  `method` varchar(64) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('668', '1', '22', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('669', '1', '12', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('670', '1', '23', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('671', '1', '13', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('672', '1', '24', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('673', '1', '14', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('674', '1', '15', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('675', '1', '16', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('676', '1', '17', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('677', '1', '18', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('678', '1', '19', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('679', '1', '1478624721762', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('680', '1', '1', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('681', '1', '2', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('682', '1', '3', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('683', '1', '4', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('684', '1', '5', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('685', '1', '20', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('686', '1', '21', '0', '2016-11-08 15:37:49', null, '2016-11-08 15:37:49', null, null);
INSERT INTO `sys_role_menu` VALUES ('687', '1478540596277', '22', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('688', '1478540596277', '1', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('689', '1478540596277', '12', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('690', '1478540596277', '2', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('691', '1478540596277', '13', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('692', '1478540596277', '3', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('693', '1478540596277', '14', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('694', '1478540596277', '15', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('695', '1478540596277', '16', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);
INSERT INTO `sys_role_menu` VALUES ('696', '1478540596277', '21', '0', '2016-11-09 12:41:23', null, '2016-11-09 12:41:23', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '刘国庆', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2016-04-15 11:23:23', null, '751185330@qq.com', '13428281893', '0', '0', '2016-11-12 04:38:47', '0:0:0:0:0:0:0:1', '0', '2016-04-15 11:23:38', null, '2016-05-12 17:28:04', null, null);
INSERT INTO `sys_user` VALUES ('58', '1478540488141', 'test', '测试', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, '751185330@qq.com', '13428281893', '3', '1', '2016-11-09 12:41:30', '127.0.0.1', '0', '2016-11-07 16:13:46', null, '2016-11-07 16:13:46', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '0', '2016-04-15 14:48:11', '0', '2016-04-15 14:48:13', '0', null);
INSERT INTO `sys_user_role` VALUES ('70', '1478540488141', '1478540596277', '0', '2016-11-07 16:15:52', null, '2016-11-07 16:15:52', null, null);

-- ----------------------------
-- Table structure for tfw_dict
-- ----------------------------
DROP TABLE IF EXISTS `tfw_dict`;
CREATE TABLE `tfw_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tfw_dict
-- ----------------------------
INSERT INTO `tfw_dict` VALUES ('1', '101', '0', '0', '性别', null, '0');
INSERT INTO `tfw_dict` VALUES ('2', '101', '1', '1', '男', null, '1');
INSERT INTO `tfw_dict` VALUES ('3', '101', '2', '1', '女', null, '0');
INSERT INTO `tfw_dict` VALUES ('5', '901', '0', '0', '账号状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('6', '901', '1', '5', '启用', null, '0');
INSERT INTO `tfw_dict` VALUES ('7', '901', '2', '5', '冻结', null, '0');
INSERT INTO `tfw_dict` VALUES ('8', '901', '3', '5', '待审核', null, '0');
INSERT INTO `tfw_dict` VALUES ('9', '901', '4', '5', '审核拒绝', null, '0');
INSERT INTO `tfw_dict` VALUES ('10', '901', '5', '5', '已删除', null, '0');
INSERT INTO `tfw_dict` VALUES ('11', '902', '0', '0', '状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('12', '902', '1', '11', '启用', null, '0');
INSERT INTO `tfw_dict` VALUES ('13', '902', '2', '11', '禁用', null, '0');
INSERT INTO `tfw_dict` VALUES ('14', '102', '0', '0', '公告类型', null, '0');
INSERT INTO `tfw_dict` VALUES ('15', '102', '10', '14', '通知公告', null, '0');
INSERT INTO `tfw_dict` VALUES ('16', '102', '9', '14', '发布计划', null, '0');
INSERT INTO `tfw_dict` VALUES ('17', '903', '0', '0', '审核状态', null, '0');
INSERT INTO `tfw_dict` VALUES ('18', '903', '1', '17', '待审核', null, '0');
INSERT INTO `tfw_dict` VALUES ('19', '903', '2', '17', '审核拒绝', null, '0');
INSERT INTO `tfw_dict` VALUES ('20', '903', '3', '17', '审核通过', null, '0');
INSERT INTO `tfw_dict` VALUES ('41', '102', '6', '16', '测试', null, '0');
INSERT INTO `tfw_dict` VALUES ('44', '102', '1', '14', '发布测试', null, '0');
INSERT INTO `tfw_dict` VALUES ('45', '102', '2', '16', '测试222', null, '1');
