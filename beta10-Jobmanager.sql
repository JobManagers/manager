/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.28.155
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : 192.168.28.155
 Source Database       : dubbo_demo

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : utf-8

 Date: 06/16/2017 01:20:06 AM
*/

SET NAMES utf-8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actid` varchar(50) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `rid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `action`
-- ----------------------------
BEGIN;
INSERT INTO `action` VALUES ('emp:add', '员工添加', 'emp'), ('emp:delete', '员工删除', 'emp'), ('emp:edit', '员工编辑', 'emp'), ('emp:list', '员工列表', 'emp'), ('shift_plan_manager:add', '排班方案添加', 'shift_plan_manager'), ('shift_plan_manager:delete', '排班方案删除', 'shift_plan_manager'), ('shift_plan_manager:edit', '排班方案编辑', 'shift_plan_manager'), ('shift_plan_manager:list', '排班方案列表', 'shift_plan_manager'), ('shift_table_manager:add', '排班表添加', 'shift_table_manager'), ('shift_table_manager:delete', '排班表删除', 'shift_table_manager'), ('shift_table_manager:edit', '排班表编辑', 'shift_table_manager'), ('shift_table_manager:list', '排班表添加', 'shift_table_manager'), ('team:add', '小组添加', 'team'), ('team:delete', '小组删除', 'team'), ('team:edit', '小组编辑', 'team'), ('team:list', '小组列表', 'team');
COMMIT;

-- ----------------------------
--  Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `eid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `avatar` varchar(20) DEFAULT '' COMMENT '员工头像',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别,1:男,0女',
  `phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `id_card` varchar(20) DEFAULT '' COMMENT '身份证编号',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `hire_date` date DEFAULT NULL COMMENT '入职日期',
  `dimission_date` date DEFAULT NULL COMMENT '离职日期',
  `education_degree` varchar(10) DEFAULT '' COMMENT '文化程度',
  `create_id` bigint(32) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(32) DEFAULT '' COMMENT '最后修改人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `team_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属小组id',
  `last_update_no` int(11) DEFAULT '0' COMMENT '最后修改次数',
  `state` tinyint(1) DEFAULT '1' COMMENT '员工状态(1正常,2离职,-1删除)',
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
--  Records of `employee_info`
-- ----------------------------
BEGIN;
INSERT INTO `employee_info` VALUES ('1', '侯博文', '', '1', '110', '001', '1994-01-01', '2017-01-01', null, '小学一年级', null, '', null, null, '1', '0', '1', '110@qq.com'), ('2', '杨乃华', '', '1', '120', '002', '1993-01-01', '2017-01-01', null, '小学二年级', null, '', null, null, '1', '0', '1', '120@qq.com'), ('3', '武春阳', '', '1', '130', '003', '1992-01-01', '2017-01-01', null, '小学三年级', null, '', null, null, '2', '0', '1', '130@qq.com'), ('4', '伊双双', '', '1', '140', '004', '1991-01-01', '2017-01-01', null, '小学四年级', null, '', null, null, '2', '0', '1', '140@qq.com'), ('5', '王振济', '', '1', '150', '005', '1990-01-01', '2017-01-01', null, '小学五年级', null, '', null, null, '3', '0', '1', '160@qq.com'), ('6', '路人1', '', '0', '160', '006', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '4', '0', '1', '170@qq.com'), ('7', '路人2', '', '0', '170', '007', '2000-10-01', '2017-01-01', null, '幼儿园', null, '', null, null, '5', '0', '1', '180@qq.com'), ('8', '路人3', '', '0', '180', '008', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '5', '0', '1', '190@qq.com'), ('9', '路人4', '', '0', '190', '009', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '4', '0', '1', '200@qq.com'), ('10', '路人5', '', '0', '200', '010', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '5', '0', '1', '210@qq.com'), ('11', '路人6', '', '0', '300', '011', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '8', '0', '1', '220@qq.com'), ('12', '路人7', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '9', '0', '1', '230@qq.com'), ('13', '路人8', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('14', '路人9', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('15', '路人10', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('16', '路人11', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('17', '路人17', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('18', '路人13', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('19', '路人14', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('20', '路人15', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com'), ('21', '路人16', '', '0', '400', '012', '2000-01-01', '2017-01-01', null, '幼儿园', null, '', null, null, '0', '0', '1', '230@qq.com');
COMMIT;

-- ----------------------------
--  Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mid` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `eid` bigint(20) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `member`
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES ('admin', '2E866BF58289E01583AD418F486A69DF', '12', '0'), ('superadmin', '2E866BF58289E01583AD418F486A69DF', '13', '0'), ('user1', '2E866BF58289E01583AD418F486A69DF', '1', '0'), ('user10', '2E866BF58289E01583AD418F486A69DF', '10', '0'), ('user11', '2E866BF58289E01583AD418F486A69DF', '11', '0'), ('user2', '2E866BF58289E01583AD418F486A69DF', '2', '1'), ('user3', '2E866BF58289E01583AD418F486A69DF', '3', '1'), ('user4', '2E866BF58289E01583AD418F486A69DF', '4', '1'), ('user5', '2E866BF58289E01583AD418F486A69DF', '5', '1'), ('user6', '2E866BF58289E01583AD418F486A69DF', '6', '1'), ('user7', '2E866BF58289E01583AD418F486A69DF', '7', '1'), ('user8', '2E866BF58289E01583AD418F486A69DF', '8', '1'), ('user9', '2E866BF58289E01583AD418F486A69DF', '9', '1');
COMMIT;

-- ----------------------------
--  Table structure for `member_role`
-- ----------------------------
DROP TABLE IF EXISTS `member_role`;
CREATE TABLE `member_role` (
  `mid` varchar(50) NOT NULL,
  `rid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `member_role`
-- ----------------------------
BEGIN;
INSERT INTO `member_role` VALUES ('admin', 'shift_table_manager'), ('admin', 'shift_plan_manager'), ('superadmin', 'emp'), ('superadmin', 'team'), ('superadmin', 'team'), ('superadmin', 'shift_table_manager'), ('superadmin', 'shift_plan_manager'), ('user1', 'shift_table_manager'), ('user1', 'shift_table_manager'), ('user2', 'shift_table_manager'), ('user3', 'shift_table_manager'), ('user', null), ('user', null), ('user5', 'shift_table_manager'), ('admin', 'emp'), ('admin', 'team');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('emp', '员工管理'), ('shift_plan_manager', '排班方案管理'), ('shift_table_manager', '排班表管理'), ('team', '小组管理');
COMMIT;

-- ----------------------------
--  Table structure for `shift_plan_base`
-- ----------------------------
DROP TABLE IF EXISTS `shift_plan_base`;
CREATE TABLE `shift_plan_base` (
  `shift_plan_base_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_name` varchar(32) NOT NULL COMMENT '方案名称',
  `plan_description` varchar(160) DEFAULT NULL COMMENT '描述',
  `create_id` bigint(20) NOT NULL COMMENT '创建人ID/评论人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_update_user_id` bigint(20) NOT NULL COMMENT '最后一次修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `last_update_no` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次修改次数',
  `server_station_code` varchar(32) NOT NULL DEFAULT '' COMMENT '服务站编码',
  `biz_zhy_code` varchar(20) DEFAULT NULL COMMENT '企业编码',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1:有效，-1:删除',
  PRIMARY KEY (`shift_plan_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班方案基本表';

-- ----------------------------
--  Table structure for `shift_plan_detail`
-- ----------------------------
DROP TABLE IF EXISTS `shift_plan_detail`;
CREATE TABLE `shift_plan_detail` (
  `shift_plan_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shift_plan_base_id` bigint(20) NOT NULL COMMENT '方案基本表主键',
  `detail_name` varchar(16) NOT NULL COMMENT '班次名称',
  `start_time` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `days` int(11) NOT NULL COMMENT '连续天数',
  `exc_order` int(11) NOT NULL COMMENT '执行顺序',
  PRIMARY KEY (`shift_plan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班方案详细表';

-- ----------------------------
--  Table structure for `shift_table_base`
-- ----------------------------
DROP TABLE IF EXISTS `shift_table_base`;
CREATE TABLE `shift_table_base` (
  `shift_table_base_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(32) NOT NULL COMMENT '排班表名称',
  `shift_plan_base_id` bigint(20) NOT NULL COMMENT '排班方案主键',
  `start_date` datetime NOT NULL COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `create_id` bigint(20) NOT NULL COMMENT '创建人ID/评论人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_update_user_id` bigint(20) DEFAULT NULL COMMENT '最后一次修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `last_update_no` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次修改次数',
  `server_station_code` varchar(32) NOT NULL DEFAULT '' COMMENT '服务站编码',
  `biz_zhy_code` varchar(20) DEFAULT NULL COMMENT '企业编码',
  `shift_type` tinyint(4) NOT NULL COMMENT '排班类型：1组员排班，2小组排班',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态,1:有效，-1:删除',
  PRIMARY KEY (`shift_table_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班表主表';

-- ----------------------------
--  Table structure for `shift_table_detail`
-- ----------------------------
DROP TABLE IF EXISTS `shift_table_detail`;
CREATE TABLE `shift_table_detail` (
  `shift_table_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shift_table_base_id` bigint(20) NOT NULL COMMENT '排班表主表 主键',
  `employee_id` bigint(20) DEFAULT NULL COMMENT '组员ID',
  `employee_name` varchar(20) DEFAULT NULL COMMENT '组员姓名',
  `team_id` bigint(20) DEFAULT NULL COMMENT '小组ID',
  `team_name` varchar(32) DEFAULT NULL COMMENT '组名',
  `shift_data` varchar(1024) NOT NULL COMMENT '某个人或组的JSON数据：{"shiftData":[{"day":1,"shiftName":"中"},{"day":2,"shiftName":"中"},...]}',
  `duty_days` int(11) NOT NULL COMMENT '当班天数',
  `shift_order` int(11) NOT NULL COMMENT '用于排序',
  PRIMARY KEY (`shift_table_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班表子表';

-- ----------------------------
--  Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '所属小组id,主键',
  `name` varchar(20) NOT NULL COMMENT '组名',
  `leader_id` bigint(20) NOT NULL COMMENT '组长,员工ID',
  `create_id` bigint(32) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(32) DEFAULT '' COMMENT '最后修改人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `eid` bigint(20) DEFAULT '0' COMMENT '员工ID',
  `last_update_no` int(11) DEFAULT '0' COMMENT '最后修改次数',
  `state` tinyint(1) DEFAULT '1' COMMENT '员工状态(1正常,-1删除)',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='小组表';

-- ----------------------------
--  Records of `team`
-- ----------------------------
BEGIN;
INSERT INTO `team` VALUES ('1', '开发1组', '1', null, '', null, null, '1', '0', '1'), ('2', '开发2组', '2', null, '', null, null, '2', '0', '1'), ('3', '开发3组', '3', null, '', null, null, '3', '0', '1'), ('4', '开发4组', '4', null, '', null, null, '4', '0', '1'), ('5', '护理1组', '5', null, '', null, null, '5', '0', '1'), ('6', '护理2组', '6', null, '', null, null, '6', '0', '1'), ('7', '护理3组', '7', null, '', null, null, '7', '0', '1'), ('8', '护理4组', '8', null, '', null, null, '8', '0', '1'), ('9', '后勤1组', '9', null, '', null, null, '9', '0', '1'), ('10', '后勤2组', '10', null, '', null, null, '10', '0', '1'), ('11', '后勤3组', '11', null, '', null, null, '11', '0', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
