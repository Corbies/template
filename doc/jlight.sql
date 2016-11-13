/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : jlight

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2016-11-13 14:40:16
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('29', '1478793717465', 'test', '2016-11-10 14:34:13', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-10 14:34:16', null, '2016-11-10 14:34:16', null, '帐号已被锁定');
INSERT INTO `sys_login_log` VALUES ('30', '1478793721955', 'test', '2016-11-10 14:34:16', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 14:34:16', null, '2016-11-10 14:34:16', null, null);
INSERT INTO `sys_login_log` VALUES ('31', '1478793740355', 'admin', '2016-11-10 14:34:35', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 14:34:35', null, '2016-11-10 14:34:35', null, null);
INSERT INTO `sys_login_log` VALUES ('32', '1480750434802', 'admin', '2016-11-10 14:47:47', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 14:47:47', null, '2016-11-10 14:47:47', null, null);
INSERT INTO `sys_login_log` VALUES ('33', '1480751652961', 'admin', '2016-11-10 15:08:05', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:08:05', null, '2016-11-10 15:08:05', null, null);
INSERT INTO `sys_login_log` VALUES ('34', '1480752223684', 'admin', '2016-11-10 15:17:36', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:17:36', null, '2016-11-10 15:17:36', null, null);
INSERT INTO `sys_login_log` VALUES ('35', '1480752484999', 'jason', '2016-11-10 15:21:57', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:21:57', null, '2016-11-10 15:21:57', null, null);
INSERT INTO `sys_login_log` VALUES ('36', '1480752908619', 'admin', '2016-11-10 15:29:01', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:29:01', null, '2016-11-10 15:29:01', null, null);
INSERT INTO `sys_login_log` VALUES ('37', '1480752925602', 'jason', '2016-11-10 15:29:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:29:18', null, '2016-11-10 15:29:18', null, null);
INSERT INTO `sys_login_log` VALUES ('38', '1480753535909', 'admin', '2016-11-10 15:39:28', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:39:28', null, '2016-11-10 15:39:28', null, null);
INSERT INTO `sys_login_log` VALUES ('39', '1480753542501', 'jason', '2016-11-10 15:39:35', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:39:35', null, '2016-11-10 15:39:35', null, null);
INSERT INTO `sys_login_log` VALUES ('40', '1480753816309', 'jason', '2016-11-10 15:44:09', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-10 15:44:09', null, '2016-11-10 15:44:09', null, null);
INSERT INTO `sys_login_log` VALUES ('41', '1480884261048', 'admin', '2016-11-12 03:58:13', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 03:58:13', null, '2016-11-12 03:58:13', null, null);
INSERT INTO `sys_login_log` VALUES ('42', '1480884802812', 'jason', '2016-11-12 04:07:15', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:07:15', null, '2016-11-12 04:07:15', null, null);
INSERT INTO `sys_login_log` VALUES ('43', '1480885519480', 'jason', '2016-11-12 04:19:12', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:19:12', null, '2016-11-12 04:19:12', null, null);
INSERT INTO `sys_login_log` VALUES ('44', '1480885915918', 'jason', '2016-11-12 04:25:48', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 04:25:48', null, '2016-11-12 04:25:48', null, null);
INSERT INTO `sys_login_log` VALUES ('45', '1480898034517', 'jason', '2016-11-12 07:47:47', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-12 07:47:47', null, '2016-11-12 07:47:47', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('46', '1480898034799', 'jason', '2016-11-12 07:47:47', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 07:47:47', null, '2016-11-12 07:47:47', null, null);
INSERT INTO `sys_login_log` VALUES ('47', '1480898145836', 'jason', '2016-11-12 07:49:38', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-12 07:49:38', null, '2016-11-12 07:49:38', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('48', '1480898146063', 'jason', '2016-11-12 07:49:38', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-12 07:49:38', null, '2016-11-12 07:49:38', null, null);
INSERT INTO `sys_login_log` VALUES ('49', '1480970433582', 'admin', '2016-11-13 03:54:26', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 03:54:26', null, '2016-11-13 03:54:26', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('50', '1480970434071', 'admin', '2016-11-13 03:54:26', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 03:54:26', null, '2016-11-13 03:54:26', null, null);
INSERT INTO `sys_login_log` VALUES ('51', '1480973496730', 'admin', '2016-11-13 04:45:29', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:45:29', null, '2016-11-13 04:45:29', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('52', '1480973497019', 'admin', '2016-11-13 04:45:29', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:45:29', null, '2016-11-13 04:45:29', null, null);
INSERT INTO `sys_login_log` VALUES ('53', '1480973540982', 'admin', '2016-11-13 04:46:13', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:46:13', null, '2016-11-13 04:46:13', null, null);
INSERT INTO `sys_login_log` VALUES ('54', '1480974166328', 'admin', '2016-11-13 04:56:39', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:56:39', null, '2016-11-13 04:56:39', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('55', '1480974166609', 'admin', '2016-11-13 04:56:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:56:39', null, '2016-11-13 04:56:39', null, null);
INSERT INTO `sys_login_log` VALUES ('56', '1480974173800', 'admin', '2016-11-13 04:56:46', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:56:46', null, '2016-11-13 04:56:46', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('57', '1480974174006', 'admin', '2016-11-13 04:56:46', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:56:46', null, '2016-11-13 04:56:46', null, null);
INSERT INTO `sys_login_log` VALUES ('58', '1480974180042', 'admin', '2016-11-13 04:56:52', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:56:52', null, '2016-11-13 04:56:52', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('59', '1480974180246', 'admin', '2016-11-13 04:56:53', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:56:53', null, '2016-11-13 04:56:53', null, null);
INSERT INTO `sys_login_log` VALUES ('60', '1480974184795', 'admin', '2016-11-13 04:56:57', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:56:57', null, '2016-11-13 04:56:57', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('61', '1480974184989', 'admin', '2016-11-13 04:56:57', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:56:57', null, '2016-11-13 04:56:57', null, null);
INSERT INTO `sys_login_log` VALUES ('62', '1480974189182', 'admin', '2016-11-13 04:57:01', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:57:01', null, '2016-11-13 04:57:01', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('63', '1480974189388', 'admin', '2016-11-13 04:57:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:57:02', null, '2016-11-13 04:57:02', null, null);
INSERT INTO `sys_login_log` VALUES ('64', '1480974194359', 'admin', '2016-11-13 04:57:07', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:57:07', null, '2016-11-13 04:57:07', null, '登录失败次数过多');
INSERT INTO `sys_login_log` VALUES ('65', '1480974194572', 'admin', '2016-11-13 04:57:07', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:57:07', null, '2016-11-13 04:57:07', null, null);
INSERT INTO `sys_login_log` VALUES ('66', '1480974227406', 'admin', '2016-11-13 04:57:40', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 04:57:40', null, '2016-11-13 04:57:40', null, '登录失败次数过多');
INSERT INTO `sys_login_log` VALUES ('67', '1480974227600', 'admin', '2016-11-13 04:57:40', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 04:57:40', null, '2016-11-13 04:57:40', null, null);
INSERT INTO `sys_login_log` VALUES ('68', '1480974618676', 'admin', '2016-11-13 05:04:11', '0:0:0:0:0:0:0:1', '登录失败', '0', '2016-11-13 05:04:11', null, '2016-11-13 05:04:11', null, '帐号或者密码错误');
INSERT INTO `sys_login_log` VALUES ('69', '1480974618940', 'admin', '2016-11-13 05:04:11', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:04:11', null, '2016-11-13 05:04:11', null, null);
INSERT INTO `sys_login_log` VALUES ('70', '1480974629570', 'admin', '2016-11-13 05:04:22', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:04:22', null, '2016-11-13 05:04:22', null, null);
INSERT INTO `sys_login_log` VALUES ('71', '1480974750361', 'liyg', '2016-11-13 05:06:23', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:06:23', null, '2016-11-13 05:06:23', null, null);
INSERT INTO `sys_login_log` VALUES ('72', '1480974924299', 'liyg', '2016-11-13 05:09:17', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:09:17', null, '2016-11-13 05:09:17', null, null);
INSERT INTO `sys_login_log` VALUES ('73', '1480975750084', 'liyg', '2016-11-13 05:23:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:23:02', null, '2016-11-13 05:23:02', null, null);
INSERT INTO `sys_login_log` VALUES ('74', '1480975842468', 'admin', '2016-11-13 05:24:35', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:24:35', null, '2016-11-13 05:24:35', null, null);
INSERT INTO `sys_login_log` VALUES ('75', '1480975985258', 'liyg', '2016-11-13 05:26:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:26:58', null, '2016-11-13 05:26:58', null, null);
INSERT INTO `sys_login_log` VALUES ('76', '1480976105626', 'liyg', '2016-11-13 05:28:58', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:28:58', null, '2016-11-13 05:28:58', null, null);
INSERT INTO `sys_login_log` VALUES ('77', '1480976506326', 'admin', '2016-11-13 05:35:39', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:35:39', null, '2016-11-13 05:35:39', null, null);
INSERT INTO `sys_login_log` VALUES ('78', '1480976552204', 'liyg', '2016-11-13 05:36:24', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 05:36:24', null, '2016-11-13 05:36:24', null, null);
INSERT INTO `sys_login_log` VALUES ('79', '1480978026920', 'admin', '2016-11-13 06:00:59', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:00:59', null, '2016-11-13 06:00:59', null, null);
INSERT INTO `sys_login_log` VALUES ('80', '1480978068388', 'liyg', '2016-11-13 06:01:41', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:01:41', null, '2016-11-13 06:01:41', null, null);
INSERT INTO `sys_login_log` VALUES ('81', '1480978635157', 'admin', '2016-11-13 06:11:07', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:11:07', null, '2016-11-13 06:11:07', null, null);
INSERT INTO `sys_login_log` VALUES ('82', '1480978645458', 'liyg', '2016-11-13 06:11:18', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:11:18', null, '2016-11-13 06:11:18', null, null);
INSERT INTO `sys_login_log` VALUES ('83', '1480978792266', 'admin', '2016-11-13 06:13:45', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:13:45', null, '2016-11-13 06:13:45', null, null);
INSERT INTO `sys_login_log` VALUES ('84', '1480978917904', 'admin', '2016-11-13 06:15:50', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:15:50', null, '2016-11-13 06:15:50', null, null);
INSERT INTO `sys_login_log` VALUES ('85', '1480978930055', 'liyg', '2016-11-13 06:16:02', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:16:02', null, '2016-11-13 06:16:02', null, null);
INSERT INTO `sys_login_log` VALUES ('86', '1480978950358', 'admin', '2016-11-13 06:16:23', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:16:23', null, '2016-11-13 06:16:23', null, null);
INSERT INTO `sys_login_log` VALUES ('87', '1480979024682', 'liyg', '2016-11-13 06:17:37', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:17:37', null, '2016-11-13 06:17:37', null, null);
INSERT INTO `sys_login_log` VALUES ('88', '1480979790599', 'admin', '2016-11-13 06:30:23', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:30:23', null, '2016-11-13 06:30:23', null, null);
INSERT INTO `sys_login_log` VALUES ('89', '1480979814088', 'liyg', '2016-11-13 06:30:46', '0:0:0:0:0:0:0:1', '登录成功', '0', '2016-11-13 06:30:46', null, '2016-11-13 06:30:46', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='资源表';

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
INSERT INTO `sys_menu` VALUES ('42', '1480978838674', '角色分配', '/user/addRoles', '1', null, '1', null, '2', '用户管理', '0', null, '2016-11-13 06:14:31', null, '2016-11-13 06:14:31', '给用户分配角色');

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
) ENGINE=InnoDB AUTO_INCREMENT=735 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('707', '1478540596277', '1', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('708', '1478540596277', '2', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('709', '1478540596277', '13', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('710', '1478540596277', '3', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('711', '1478540596277', '14', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('712', '1478540596277', '15', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('713', '1478540596277', '4', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('714', '1478540596277', '18', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('715', '1478540596277', '21', '0', '2016-11-13 06:01:25', null, '2016-11-13 06:01:25', null, null);
INSERT INTO `sys_role_menu` VALUES ('716', '1', '22', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('717', '1', '12', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('718', '1', '23', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('719', '1', '13', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('720', '1', '24', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('721', '1', '14', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('722', '1', '15', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('723', '1', '16', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('724', '1', '17', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('725', '1', '18', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('726', '1', '19', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('727', '1', '1', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('728', '1', '2', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('729', '1', '3', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('730', '1', '4', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('731', '1', '5', '0', '2016-11-13 06:14:55', null, '2016-11-13 06:14:55', null, null);
INSERT INTO `sys_role_menu` VALUES ('732', '1', '1480978838674', '0', '2016-11-13 06:14:56', null, '2016-11-13 06:14:56', null, null);
INSERT INTO `sys_role_menu` VALUES ('733', '1', '20', '0', '2016-11-13 06:14:56', null, '2016-11-13 06:14:56', null, null);
INSERT INTO `sys_role_menu` VALUES ('734', '1', '21', '0', '2016-11-13 06:14:56', null, '2016-11-13 06:14:56', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '刘国庆', '24b81da6640d91def35d33c7940a16c7e0631ff99d3060a491694866f1063fcc', '2016-04-15 11:23:23', null, '751185330@qq.com', '13428281893', '0', '0', '2016-11-13 06:30:22', '0:0:0:0:0:0:0:1', '0', '2016-04-15 11:23:38', null, '2016-05-12 17:28:04', null, null);
INSERT INTO `sys_user` VALUES ('58', '1478540488141', 'test', '测试', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, '751185330@qq.com', '13428281893', '3', '1', '2016-11-09 12:41:30', '127.0.0.1', '0', '2016-11-07 16:13:46', null, '2016-11-07 16:13:46', null, null);
INSERT INTO `sys_user` VALUES ('59', '1480752439327', 'jason', '黎扬贵', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, '134288282082@qq.com', '13428282082', '2', '0', '2016-11-12 04:25:42', '0:0:0:0:0:0:0:1', '0', '2016-11-10 15:21:12', null, '2016-11-10 15:21:12', null, '黎扬贵');
INSERT INTO `sys_user` VALUES ('60', '1480974674253', 'liyg', '黎扬贵', '75a2a3e2abb929ed8d22ce3de907bbbfb3834ef22c3d39d54a88c7cc3e55715f', null, null, '18316986707@163.com', '18316986707', '0', '0', '2016-11-13 06:30:46', '0:0:0:0:0:0:0:1', '0', '2016-11-13 05:05:07', null, '2016-11-13 05:05:07', null, '黎扬贵');

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '0', '2016-04-15 14:48:11', '0', '2016-04-15 14:48:13', '0', null);
INSERT INTO `sys_user_role` VALUES ('70', '1478540488141', '1478540596277', '0', '2016-11-07 16:15:52', null, '2016-11-07 16:15:52', null, null);
INSERT INTO `sys_user_role` VALUES ('71', '1480752439327', '1478540596277', '0', '2016-11-10 15:21:33', null, '2016-11-10 15:21:33', null, null);
INSERT INTO `sys_user_role` VALUES ('72', '1480974674253', '1478540596277', '0', '2016-11-13 05:05:33', null, '2016-11-13 05:05:33', null, null);
