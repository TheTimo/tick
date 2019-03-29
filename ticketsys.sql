/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ticketsys

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-20 16:35:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ti_cartticket
-- ----------------------------
DROP TABLE IF EXISTS `ti_cartticket`;
CREATE TABLE `ti_cartticket` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `startStation` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endStation` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `trainidparam` varchar(255) DEFAULT NULL,
  `ticketnum` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_cartticket
-- ----------------------------
INSERT INTO `ti_cartticket` VALUES ('1', '5', '耿锐', '湛江站', '7：00', '广州站', '12：00', '1A', '1', '120');
INSERT INTO `ti_cartticket` VALUES ('3', '6', '耿锐', '湛江站', '7：00', '广州站', '12：00', '1A', '1', '120');
INSERT INTO `ti_cartticket` VALUES ('4', '15', '李四', '上海站', '8：00', '北京站', '18：00', '2A', '1', '120');

-- ----------------------------
-- Table structure for ti_line
-- ----------------------------
DROP TABLE IF EXISTS `ti_line`;
CREATE TABLE `ti_line` (
  `lineid` int(11) NOT NULL AUTO_INCREMENT,
  `startplace` varchar(255) DEFAULT NULL,
  `endplace` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_line
-- ----------------------------

-- ----------------------------
-- Table structure for ti_linemanage
-- ----------------------------
DROP TABLE IF EXISTS `ti_linemanage`;
CREATE TABLE `ti_linemanage` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路编号',
  `trainCode` varchar(255) DEFAULT NULL COMMENT '车次代码',
  `stationName` varchar(255) DEFAULT NULL COMMENT '车站名',
  `startTime` varchar(255) DEFAULT NULL COMMENT '始发时间',
  `endTime` varchar(255) DEFAULT NULL COMMENT '终到时间',
  `distance` varchar(255) DEFAULT NULL COMMENT '里程',
  `stayTime` varchar(255) DEFAULT NULL COMMENT '停留时间',
  `totalTime` varchar(255) DEFAULT NULL COMMENT '历时',
  `stationOrder` varchar(255) DEFAULT NULL COMMENT '车站序号',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_linemanage
-- ----------------------------
INSERT INTO `ti_linemanage` VALUES ('1', '1', '湛江站', '7：00', '12：00', '120', '2', '6', 'A13');
INSERT INTO `ti_linemanage` VALUES ('125', null, '湛江站', null, null, null, null, null, null);
INSERT INTO `ti_linemanage` VALUES ('126', null, '湛江站', null, null, null, null, null, null);
INSERT INTO `ti_linemanage` VALUES ('127', null, null, null, null, null, null, null, null);
INSERT INTO `ti_linemanage` VALUES ('124', '1', '湛江站', null, null, null, null, null, null);
INSERT INTO `ti_linemanage` VALUES ('4', '1', '广州站', '不是法国', '帮扶是', '120', '2', '45', '部分施工');

-- ----------------------------
-- Table structure for ti_manager
-- ----------------------------
DROP TABLE IF EXISTS `ti_manager`;
CREATE TABLE `ti_manager` (
  `manager_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_manager
-- ----------------------------
INSERT INTO `ti_manager` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for ti_station
-- ----------------------------
DROP TABLE IF EXISTS `ti_station`;
CREATE TABLE `ti_station` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stationName` varchar(255) DEFAULT NULL,
  `stationEnglish` varchar(255) DEFAULT NULL,
  `belongTo` varchar(255) DEFAULT NULL,
  `stationRank` varchar(255) DEFAULT NULL COMMENT '一，二，三，四，五等站',
  `administrativeArea` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_station
-- ----------------------------
INSERT INTO `ti_station` VALUES ('1', '广州站', 'GZ', '广东铁路局', '一等站', '广东行政区域', '广州天河区');
INSERT INTO `ti_station` VALUES ('2', '湛江站', 'ZJ', '广东铁路局', '三等站', '广东行政区域', '广东湛江');
INSERT INTO `ti_station` VALUES ('3', '青浦站', 'QP', '上海铁路局', '一等站', '上海行政区域', '上海青浦');
INSERT INTO `ti_station` VALUES ('4', '松江站', 'SJ', '上海铁路局', '二等站', '上海行政区域', '上海松江');
INSERT INTO `ti_station` VALUES ('7', '广州站', null, null, null, null, null);
INSERT INTO `ti_station` VALUES ('10', '湛江站', 'ZJ123', '广东铁路局', '二等站', '广东行政区域', '广东湛江');
INSERT INTO `ti_station` VALUES ('16', '广州站', 'Z456', '发v年发', '是方法', '还没回过', '买的钢化膜');

-- ----------------------------
-- Table structure for ti_train
-- ----------------------------
DROP TABLE IF EXISTS `ti_train`;
CREATE TABLE `ti_train` (
  `trainid` int(255) NOT NULL AUTO_INCREMENT,
  `startStation` varchar(255) DEFAULT NULL,
  `endStation` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL COMMENT '路程',
  `noTicket` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '直达特快、特快、普快、普客',
  `classification` varchar(255) DEFAULT NULL COMMENT '车辆车体分类，如新空调等',
  PRIMARY KEY (`trainid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_train
-- ----------------------------
INSERT INTO `ti_train` VALUES ('1', '湛江站', '广州站', '7：00', '12：00', '50', '260', '52', '特快', '新空调');
INSERT INTO `ti_train` VALUES ('2', '上海站', '北京站', '8：00', '18：00', '12', '1000', '24', '特快', '无');
INSERT INTO `ti_train` VALUES ('3', null, null, null, null, null, null, null, null, null);
INSERT INTO `ti_train` VALUES ('4', '北京站', null, null, null, '12', null, '58', '', null);
INSERT INTO `ti_train` VALUES ('7', '山海', '代表', '你的风格你', '你发到你', '年度规划', '你果然', '发给你', '年度规划', '那个妇女');
INSERT INTO `ti_train` VALUES ('9', '古', '体会', ' 后台', ' 复合弓', ' 发过火', '无法', '而我', '仍无法', ' 服务');

-- ----------------------------
-- Table structure for ti_traingroup
-- ----------------------------
DROP TABLE IF EXISTS `ti_traingroup`;
CREATE TABLE `ti_traingroup` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '列车编组编号',
  `gCode` varchar(255) DEFAULT NULL COMMENT '车次代码',
  `gBox` varchar(255) DEFAULT NULL COMMENT '车厢号',
  `gboxType` varchar(255) DEFAULT NULL COMMENT '硬座、软座、硬卧上、硬卧中、硬卧下等',
  `gchairNum` varchar(255) DEFAULT NULL COMMENT '车厢座席数量',
  `gchairType` varchar(255) DEFAULT NULL COMMENT '车厢类型 有硬座车、软座车、硬卧车、软卧车、餐车等',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_traingroup
-- ----------------------------
INSERT INTO `ti_traingroup` VALUES ('1', '1', '20', '硬座', '25', '硬座车');
INSERT INTO `ti_traingroup` VALUES ('2', '1', '21', '软座', '12', '软座车');
INSERT INTO `ti_traingroup` VALUES ('6', '1', null, null, null, null);
INSERT INTO `ti_traingroup` VALUES ('7', '1', null, null, null, null);
INSERT INTO `ti_traingroup` VALUES ('8', '2', null, null, null, null);
INSERT INTO `ti_traingroup` VALUES ('10', '2', '222', '软座', '12', '软座车');
INSERT INTO `ti_traingroup` VALUES ('3', '1', '222', '软座', '12', '软座车');

-- ----------------------------
-- Table structure for ti_user
-- ----------------------------
DROP TABLE IF EXISTS `ti_user`;
CREATE TABLE `ti_user` (
  `userid` int(20) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `provice` varchar(255) DEFAULT NULL,
  `citty` varchar(255) DEFAULT NULL,
  `cardtype` int(10) DEFAULT NULL COMMENT '1二代身份证2港澳通行证3台湾通行证4护照',
  `cardnum` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `travellertype` int(255) DEFAULT NULL COMMENT '1成人2儿童3学生4残疾军人、伤残人民警察',
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ti_user
-- ----------------------------
INSERT INTO `ti_user` VALUES ('5', 'linger', '123', '耿锐', '1', '山东省', '日照市', '1', '123456789111111111', '1995-10-20', '1', '你好');
INSERT INTO `ti_user` VALUES ('6', 'linger', '1234', '耿锐', '1', '云南省', '玉溪市', '1', '13465123', '1995-10-20', '1', '你好');
INSERT INTO `ti_user` VALUES ('14', '张三461345', null, '老张', '1', '天津市', '河西区', '2', '123456123', '1598-2-4', '2', '这场比赛的');
INSERT INTO `ti_user` VALUES ('15', 'lishi', '852', '李四', '2', '江西省', '南昌市', '1', '456789123', '1995-05-06 00:00:00', '1', '');
INSERT INTO `ti_user` VALUES ('16', null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `ti_user` VALUES ('17', 'hzphzp', 'hzp123', 'hzphzp', '1', '湖南省', '郴州市', '1', '123456789111111111', '2000-10-10 00:00:00', '3', '十大');
INSERT INTO `ti_user` VALUES ('18', 'hzph123', null, 'hzphzp', '1', '广西壮族', '河池市', '1', '12324', '254', '3', 'sdf');
