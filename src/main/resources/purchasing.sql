/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : purchasing

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2014-12-01 17:35:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(15) NOT NULL,
  PRIMARY KEY (`departmentId`),
  UNIQUE KEY `departmentName` (`departmentName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '安全技术部');
INSERT INTO `department` VALUES ('9', '客户服务部');
INSERT INTO `department` VALUES ('4', '工程管理部');
INSERT INTO `department` VALUES ('5', '市场经营部');
INSERT INTO `department` VALUES ('8', '招标采购部');
INSERT INTO `department` VALUES ('6', '生产运行部');
INSERT INTO `department` VALUES ('7', '经营班子');
INSERT INTO `department` VALUES ('2', '综合管理部');
INSERT INTO `department` VALUES ('3', '财务管理部');

-- ----------------------------
-- Table structure for dp
-- ----------------------------
DROP TABLE IF EXISTS `dp`;
CREATE TABLE `dp` (
  `dpId` int(11) NOT NULL AUTO_INCREMENT,
  `applyDate` datetime DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `ceaNum` varchar(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `demandDate` date DEFAULT NULL,
  `project` varchar(20) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `applyUser` varchar(10) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `demandType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dpId`),
  KEY `FKC8CD42BD75C` (`applyUser`),
  KEY `FKC8C20A887FC` (`department`),
  CONSTRAINT `FKC8C20A887FC` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `FKC8CD42BD75C` FOREIGN KEY (`applyUser`) REFERENCES `person` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp
-- ----------------------------
INSERT INTO `dp` VALUES ('1', '2014-08-30 22:00:10', '20140830220010jQueryAutocomplete.rar', 'CEA-1', null, '2014-09-06', '测试1', '测试1-客服', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('2', '2014-08-30 22:01:29', null, '', '同意 Mr.Wang 2014/8/30<br/>同意 Mis.Li 2014/8/30', '2014-09-10', '测试2', '测试2-安技', '3', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('3', '2014-08-30 22:02:05', null, '', '不同意 Mr.Wang 2014/8/30', '2014-09-06', '测试3', '测试3-工程', '4', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('10', '2014-09-09 09:02:12', null, '', null, '2014-09-18', 'd', 'd', '0', 'admin', '1', '市政类工程');
INSERT INTO `dp` VALUES ('11', '2014-09-09 09:07:02', null, '', '同意 Mr.Wang 2014/9/18<br/>同意 Mis.Li 2014/9/18', '2014-09-13', 'e', 'ee', '3', 'admin', '1', '市政类工程');
INSERT INTO `dp` VALUES ('13', '2014-09-09 15:25:31', null, '', null, '2014-09-10', '龙江小区', '', '0', 'admin', '4', '工商小区工程');
INSERT INTO `dp` VALUES ('14', '2014-09-29 14:44:02', null, '', null, '2014-09-29', 'dddd', '', '0', 'admin', '1', '市政类工程');
INSERT INTO `dp` VALUES ('15', '2014-12-01 11:23:59', null, '', null, '2014-12-10', '测试邮件', '测试邮件', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('16', '2014-12-01 11:25:30', null, '', null, '2014-12-04', '测试邮件2', '测试邮件2', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('17', '2014-12-01 11:30:45', null, '', null, '2014-12-09', '测试邮件3', '测试邮件3', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('18', '2014-12-01 11:35:16', null, '', null, '2014-12-18', '测试邮件4', '测试邮件4', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('19', '2014-12-01 11:43:24', null, '', null, '2014-12-03', '邮件测试', '邮件测试', '0', 'staff', '1', '其它类');
INSERT INTO `dp` VALUES ('20', '2014-12-01 14:09:17', null, '', null, '2014-12-10', '邮件测试22', '邮件测试', '0', 'staff', '1', '其它类');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `materialId` varchar(20) NOT NULL,
  `materialName` varchar(50) DEFAULT NULL,
  `materialType` varchar(50) NOT NULL,
  `materialUnit` varchar(10) NOT NULL,
  `standard` varchar(50) NOT NULL,
  PRIMARY KEY (`materialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('100201004645', '四氢噻吩', '', '千克', '');
INSERT INTO `material` VALUES ('110101002828', '燃气热水器', 'BRW-6011FEM;JSQ22-H', '台', '12T;11L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002836', '燃气热水器', 'BRW-6024FEM;JSQ48-J', '台', '12T;24L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002842', '燃气热水器', 'BRW-6116FFM;JSG32-A', '台', '12T;16L;白色;恒温非防冻;强排平衡');
INSERT INTO `material` VALUES ('110101002846', '燃气热水器', 'BRW-6218FEM(C);JSQ31-CK', '台', '12T;18L;白色;冷凝恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002848', '燃气热水循环装置', 'BRC-6001;RCD-XH', '台', '白色;非防冻;热水循环装置');
INSERT INTO `material` VALUES ('110101002852', '燃气热水器', 'BRW-6211FEMG;JSQ22-K', '台', '12T;11L;彩钢金;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002856', '燃气热水器', 'BRW-6213FEMG;JSQ26-K', '台', '12T;13L;彩钢金;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002860', '燃气热水器', 'BRW-6216FEMG;JSQ32-K', '台', '12T;16L;彩钢金;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002862', '燃气热水器', 'BRW-6311FEM;JSQ22-2H', '台', '12T;11L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002863', '燃气热水器', 'BRW-6316FEM;JSQ32-2H', '台', '12T;16L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002866', '燃气热水器', 'BSW-3010FEM;JSQ21-L', '台', '12T;10L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002887', '燃气热水器', 'BSW-3208FF;JSQ16-B', '台', '12T;8L;白色;非恒温非防冻;强排平衡');
INSERT INTO `material` VALUES ('110101002904', '燃气热水器', 'BNW-9011FEM;JSQ22-D', '台', '12T;11L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002907', '燃气热水器', 'BNW-9013FEM;JSQ26-D', '台', '12T;13L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002909', '燃气热水器', 'BNW-9016FEM;JSQ33-D', '台', '12T;16L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002912', '燃气热水器', 'BNW-9116FEM(W);JSW33-A', '台', '12T;16L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002913', '燃气热水器', 'BNW-9108FE;JSQ16-B', '台', '12T;8L;白色;非恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002914', '燃气热水器', 'BNW-9108FE-1;JSQ16-B', '台', '12T;8L;白色;非恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002916', '燃气热水器', 'BNW-9110FE;JSQ20-B', '台', '12T;10L;白色;非恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002917', '燃气热水器', 'BNW-9110FE-1;JSQ20-B', '台', '12T;10L;白色;非恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002919', '燃气热水器', 'BNW-9213FEM(C);JSQ23-N2C', '台', '12T;13L;白色;冷凝恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002921', '燃气热水器', 'BNW-9216FEM(C);JSQ28-N2C', '台', '12T;16L;白色;冷凝恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002923', '燃气热水器', 'BNW-9218FEM(C);JSQ33-N2C', '台', '12T;18L;白色;冷凝恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002927', '燃气热水器', 'BNW-9213FEM;JSQ25-N2', '台', '12T;13L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101002929', '燃气热水器', 'BNW-9216FEM;JSQ31-N2', '台', '12T;16L;白色;恒温非防冻;强排');
INSERT INTO `material` VALUES ('110101806698', '紫荆室内水量伺服器热水器', 'BNW-9211FEM', '台', '11T');
INSERT INTO `material` VALUES ('110101808126', '平衡式热水器', 'BKW-18008FF', '台', '');
INSERT INTO `material` VALUES ('110102002946', '嵌入式灶具', 'BRB-4030N(S);JZT-2HNX', '台', '12T;不锈钢;双眼;左右3.7KW;直出');
INSERT INTO `material` VALUES ('110102002958', '嵌入式灶具', 'BRB-4052(S);JZT-2WAX', '台', '12T;不锈钢;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102002964', '嵌入式灶具', 'BRB-4110(S);JZT-WAX', '台', '12T;不锈钢;单眼;4.0kW;直出');
INSERT INTO `material` VALUES ('110102002965', '嵌入式灶具', 'BRB-4060N(C);JZT-2FNG', '台', '12T;微晶玻璃;双眼;左3.6kW右4.0kW;直出');
INSERT INTO `material` VALUES ('110102002966', '嵌入式灶具', 'BRB-4040(S);JZT-2WB', '台', '12T;不锈钢;双眼;左右3.8kW;直出');
INSERT INTO `material` VALUES ('110102002971', '嵌入式灶具', 'BSB-1030(P);JZT-A07', '台', '12T;喷砂;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102002979', '嵌入式灶具', 'BSB-1052(S);JZT-A10', '台', '12T;不锈钢;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102002981', '嵌入式灶具', 'BSB-1053(S);JZT-B01', '台', '12T;不锈钢;三眼;左右4.0中1.2KW;直出');
INSERT INTO `material` VALUES ('110102002983', '嵌入式灶具', 'BSB-1031(S);JZT-C02', '台', '12T;不锈钢;双眼;左右4.0kW;直出');
INSERT INTO `material` VALUES ('110102002993', '嵌入式灶具', 'BWB-1220(S);JZT-WB02', '台', '12T;不锈钢;双眼;左右4.2KW;直出');
INSERT INTO `material` VALUES ('110102003001', '嵌入式灶具', 'BWB-1211A(S);JZT-WB01AC1', '台', '12T;不锈钢;双眼;左右4.3KW;直出');
INSERT INTO `material` VALUES ('110102003004', '嵌入式灶具', 'BWB-1230B(S);JZT-WB03B', '台', '12T;不锈钢;双眼;左右4.2KW;直出');
INSERT INTO `material` VALUES ('110102003005', '嵌入式灶具', 'BWB-1230B(S);JZR-WB03B', '台', '5R;不锈钢;双眼;左右4.2KW;直出');
INSERT INTO `material` VALUES ('110102003006', '嵌入式灶具', 'BWB-1230B(G);JZT-WB03B-G', '台', '12T;钢化玻璃;双眼;左右4.2KW;直出');
INSERT INTO `material` VALUES ('110102003007', '嵌入式灶具', 'BWB-1250(S);JZT-WB05', '台', '12T;不锈钢;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102003009', '嵌入式灶具', 'BWB-1250(S);JZR-WB05', '台', '7R;不锈钢;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102003010', '嵌入式灶具', 'BWB-1250(G);JZT-WB05-G', '台', '12T;钢化玻璃;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102003014', '嵌入式灶具', 'BWB-1270(S);JZT-WB07', '台', '12T;不锈钢;双眼;左右4.0kW;直出');
INSERT INTO `material` VALUES ('110102003015', '嵌入式灶具', 'BWB-1271(S);JZT-WB07-1', '台', '12T;不锈钢;双眼;左右4.0KW;直出');
INSERT INTO `material` VALUES ('110102003016', '嵌入式灶具', 'BWB-1280(S);JZT-WB08', '台', '12T;不锈钢;双眼;左右4.2kW;直出');
INSERT INTO `material` VALUES ('110102003017', '嵌入式灶具', 'BWB-1260B-LT(G);JZT-WB06B-T(G)', '台', '12T;钢化玻璃;双眼;左右4.2kW;联动定时');
INSERT INTO `material` VALUES ('110102800025', '紫荆单眼台式灶', 'BWH-1321（SL）', '台', '12T');
INSERT INTO `material` VALUES ('110103003029', '台式燃气灶', 'BRH-5031(SL);JZT-2MYX', '台', '12T;不锈钢;双眼;左右4.2kW;左向');
INSERT INTO `material` VALUES ('110103003033', '台式燃气灶', 'BRH-5130(SL);JZT-1MYX', '台', '12T;不锈钢;单眼;4.2kW;左向');
INSERT INTO `material` VALUES ('110103003039', '台式燃气灶', 'BWH-1310(SL);JZT-WH01', '台', '12T;不锈钢;双眼;左右4.5kW;左向');
INSERT INTO `material` VALUES ('110103003041', '台式燃气灶', 'BWH-1320(SL);JZT-WH02', '台', '12T;不锈钢;双眼;左3.3kW右4.5kW;左向');
INSERT INTO `material` VALUES ('110103003049', '台式燃气灶', 'BWH-1321(SL);JZT-WH03', '台', '12T;不锈钢;单眼;4.5kW;左向');
INSERT INTO `material` VALUES ('110104003058', '吸油烟机', 'BRRH-8008(S);CXW-220-8008', '台', '欧式;不锈钢;220W+2×1.5W;触摸');
INSERT INTO `material` VALUES ('110104003064', '吸油烟机', 'BSRH-7004(S);CXW-160-52', '台', '欧式;不锈钢;160W+2*1W;触摸');
INSERT INTO `material` VALUES ('110104003068', '吸油烟机', 'BWRH-16002-L(G);CXW-200-16002;', '台', '侧吸式;玻璃;200W+2*2W;触摸联动');
INSERT INTO `material` VALUES ('110104003069', '吸油烟机', 'BWRH-16002(G);CXW-200-16002', '台', '侧吸式;玻璃;200W+2*2W;触摸');
INSERT INTO `material` VALUES ('110104003070', '吸油烟机', 'BTRH-16007(G);CXW-200-16007', '台', '欧式;玻璃;200W+2*15W;机械');
INSERT INTO `material` VALUES ('110104003071', '吸油烟机', 'BWRH-16005(S);CXW-200-16005', '台', '侧吸式;不锈钢;200W+2*2W;机械');
INSERT INTO `material` VALUES ('110104003072', '吸油烟机', 'BTRH-16001(S);CXW-200-16001', '台', '欧式;不锈钢;200W+2*2W;触摸');
INSERT INTO `material` VALUES ('110105003073', '食具消毒柜', 'BRD-8011;ZTD90Q', '台', '紫外+臭氧;玻璃;二星级;90L');
INSERT INTO `material` VALUES ('110105003074', '食具消毒柜', 'BRD-8012;ZTD90Q', '台', '紫外+臭氧;玻璃;二星级;90L');
INSERT INTO `material` VALUES ('110105003075', '食具消毒柜', 'BSD-7011;ZLD100A', '台', '紫外+臭氧;玻璃+不锈钢;二星级;100L');
INSERT INTO `material` VALUES ('110105003076', '食具消毒柜', 'BSD-7012;ZTD90A', '台', '紫外+臭氧;不锈钢;二星级;90L');
INSERT INTO `material` VALUES ('110107005692', '空壳机', 'BNW-9016FEM', '台', '16升；强排；恒温3段火力数显');
INSERT INTO `material` VALUES ('110107005695', '空壳机', 'BNW-9110FE', '台', '10升；强排；三段切换');
INSERT INTO `material` VALUES ('110107005719', '空壳机', 'BRW-6011FEM', '台', '11升；强排；恒温数显');
INSERT INTO `material` VALUES ('110107005722', '空壳机', 'BRW-6024FEM', '台', '24升；强排；恒温数显');
INSERT INTO `material` VALUES ('110107005724', '空壳机', 'BRW-6216/8FEM(CX)(带显示)', '台', '16升；18升；强排；恒温冷凝式；带显示');
INSERT INTO `material` VALUES ('110107005726', '空壳机', 'BRW-6211/3/6FEMG', '台', '11升；13升；16升；彩钢金；强排；恒温');
INSERT INTO `material` VALUES ('110107800058', '空壳机', 'BRW-6311FEM', '台', '11升');
INSERT INTO `material` VALUES ('110107800061', '空壳机', 'BNW-9116FEM', '台', '16升');
INSERT INTO `material` VALUES ('110107800071', '空壳机', 'BRW-6011FEM', '台', '11升');
INSERT INTO `material` VALUES ('110107806642', '紫荆13升冷凝热水器（空壳机）', '', '台', 'BNW-9213FEM（C）');
INSERT INTO `material` VALUES ('110107806643', '紫荆13升强排热水器（空壳机）', '', '台', 'BNW-9213FEM');
INSERT INTO `material` VALUES ('110107806650', '港华紫荆空壳机', '11升室内水量伺服器热水器', '台', 'BNW-9211FEM');
INSERT INTO `material` VALUES ('110107806752', '港华紫荆空壳机', '10升室内三段切换', '台', 'BNW-9110FE-1');
INSERT INTO `material` VALUES ('110107807932', '空壳机', 'BNW-9108FE-1', '台', '12T；18L；白色；恒温非防冻；强排');
INSERT INTO `material` VALUES ('110107808074', '空壳机', '', '台', 'BNW-9116FEM(W)');
INSERT INTO `material` VALUES ('110201804877', '港华紫荆热水器空壳机', '', '台', 'BSW-3010FEM(空壳机)');
INSERT INTO `material` VALUES ('110201804887', '港华紫荆热水器空壳机', '', '台', 'BRW-6216FEM（C）（空壳机）');
INSERT INTO `material` VALUES ('110201807967', '内环齿盖', '（樱花BSB-1052（S））', '个', 'Y92-0161');
INSERT INTO `material` VALUES ('110201807968', '外环齿盖', '（樱花BSB-1052（S））', '个', 'Y92-0162');
INSERT INTO `material` VALUES ('110201807970', '点火器', '（热水器BSB-1052S）', '个', 'Y92-0232');
INSERT INTO `material` VALUES ('110201807971', '感应针', '（热水器SCH10E73）', '个', 'Y21-1120');
INSERT INTO `material` VALUES ('110201807972', '主控基板', '（热水器BSRH-7004S）', '个', 'Y91-0416');
INSERT INTO `material` VALUES ('110201807973', '点火器', '（热水器BSW-3108FE）', '个', 'Y55-0244');
INSERT INTO `material` VALUES ('110301804891', '万和数显平面方角四季型平衡式热水器', '', '台', 'JSG16-8B-8(12T)');
INSERT INTO `material` VALUES ('110301804908', '万家乐8升LCD蓝屏平衡式热水器', '', '台', 'JSG16-8P2(12T)');
INSERT INTO `material` VALUES ('110301804916', '万家乐强排式热水器', '', '台', 'JSQ16-8L2(12T)');
INSERT INTO `material` VALUES ('110301804930', '万家乐8升强排热水器', '', '台', 'JSQ16-8P2（12T）');
INSERT INTO `material` VALUES ('110301804941', '万家乐10升强排太空银恒温热水器', '', '台', 'JSQ20-10JP（12T）');
INSERT INTO `material` VALUES ('110301804945', '康宝强排式热水器', '', '台', 'JSQ16-A（07B）（12T）');
INSERT INTO `material` VALUES ('110301806599', '万和四季型强排式燃气热水器', 'JSQ16-8B-9', '台', 'Q8B超薄亚光');
INSERT INTO `material` VALUES ('110301807651', '康宝平衡式热水器', 'JSG12-88X', '台', '');
INSERT INTO `material` VALUES ('110301807655', '康宝强排式热水器', 'JSQ20-90X', '台', '');
INSERT INTO `material` VALUES ('110301807656', '康宝平衡式热水器', 'JSG16-88X', '台', '');
INSERT INTO `material` VALUES ('110301807657', '康宝强排式热水器', 'JSQ20-93FX', '台', '');
INSERT INTO `material` VALUES ('110301807659', '康宝平衡式热水器', 'JSG20-88X', '台', '');
INSERT INTO `material` VALUES ('110301807660', '康宝强排式热水器', 'JSQ12-A（07B）', '台', '');
INSERT INTO `material` VALUES ('110301807676', '康宝强排式热水器', 'JSQ16-90X', '台', '');
INSERT INTO `material` VALUES ('110301807795', '康宝平衡式热水器', 'JSG20-87FX', '台', '');
INSERT INTO `material` VALUES ('110301807966', '康宝强排式热水器', 'JSQ16-07B', '台', '');
INSERT INTO `material` VALUES ('110301807969', '康宝强排式热水器', 'JSQ21-90FLX', '台', '');
INSERT INTO `material` VALUES ('110301808103', '康宝强排式热水器', 'JSQ24-93FX', '台', '');
INSERT INTO `material` VALUES ('110302804974', '万和双眼嵌入式燃气灶', '', '台', 'C3-12T-B12X');
INSERT INTO `material` VALUES ('110302804991', '万家乐嵌入式炉', '', '台', 'JZT-QM19（12T）');
INSERT INTO `material` VALUES ('110302807652', '康宝嵌入式炉具', 'JZT-H240-K25B', '台', '');
INSERT INTO `material` VALUES ('110302807653', '康宝嵌入式炉具', 'JZT-Q240-A90', '台', '');
INSERT INTO `material` VALUES ('110302807671', '康宝嵌入式炉具', 'JZT-Q140-A92', '台', '');
INSERT INTO `material` VALUES ('110302807672', '康宝嵌入式炉具', 'JZT-Q240-A86（II）', '台', '');
INSERT INTO `material` VALUES ('110302807674', '康宝嵌入式炉具', 'JZT-Q240-C90', '台', '');
INSERT INTO `material` VALUES ('110302807793', '康宝嵌入式灶', 'JZY-Q248-A93', '台', '');
INSERT INTO `material` VALUES ('110302808102', '康宝嵌入式灶', 'JZY-Q240-A96', '台', '');
INSERT INTO `material` VALUES ('110303807658', '康宝台式灶具', 'JZT-H140-K11', '台', '');
INSERT INTO `material` VALUES ('110303807792', '康宝台式灶', 'JZT-H240-K25A', '台', '');
INSERT INTO `material` VALUES ('110304805025', '万和钢化玻璃近吸式烟机', '', '台', 'CXW-200-J02C');
INSERT INTO `material` VALUES ('110304807964', '康宝吸油烟机', 'CXW-220-A33', '台', '');
INSERT INTO `material` VALUES ('110305805047', '万家乐消毒柜', '', '台', 'ZTD90-A4G（A）');
INSERT INTO `material` VALUES ('110305805048', '万家乐嵌入式消毒柜', '', '台', 'YTD100-W2');
INSERT INTO `material` VALUES ('110305805061', '康宝嵌入式消毒柜', '', '台', 'ZTP108E-11T（1）');
INSERT INTO `material` VALUES ('110305805064', '康宝嵌入式消毒柜', '', '台', 'ZTP108E-5A');
INSERT INTO `material` VALUES ('110305805066', '康宝消毒柜', '', '台', 'ZTP80E-5E');
INSERT INTO `material` VALUES ('110305807965', '康宝消毒柜', 'ZTP108E-11P（1）', '台', '');
INSERT INTO `material` VALUES ('110401800125', '林内遥控器', '', '个', '');
INSERT INTO `material` VALUES ('110401805089', '平衡燃气热水器拉伸铝管（创尔特）', '', '条', 'D90*50*1000(mm)');
INSERT INTO `material` VALUES ('110401805090', '不锈钢烟管弯头(平衡式热水器)（紫荆专用）', '', '个', 'D100*60*(mm)');
INSERT INTO `material` VALUES ('110401805091', '不锈钢烟管(平衡式热水器)（紫荆专用）', '', '条', 'D90*50*500(mm)');
INSERT INTO `material` VALUES ('110401805092', '不锈钢烟管弯头(平衡式热水器)（紫荆专用）', '', '个', 'D90*50(mm)');
INSERT INTO `material` VALUES ('110401805093', '不锈钢烟管', '', '条', 'D60*500mm');
INSERT INTO `material` VALUES ('110401805094', '不锈钢烟管', '', '条', 'D50*500mm');
INSERT INTO `material` VALUES ('110401805095', '不锈钢烟管', '', '条', 'D90*60*500mm');
INSERT INTO `material` VALUES ('110401805096', '热水器烟管管夹', '', '个', '');
INSERT INTO `material` VALUES ('110401805097', '可拉伸铝管（配不锈钢接头）', '', '根', 'Ф60*1000(mm)');
INSERT INTO `material` VALUES ('110401805098', '可拉申铝管（配不锈钢接头）', '', '根', 'Ф50*1000(mm)');
INSERT INTO `material` VALUES ('110401805099', '可拉申铝管（配不锈钢接头）', '', '根', 'Ф90*1000(mm)');
INSERT INTO `material` VALUES ('110401805100', '炉头防风罩', '', '个', '');
INSERT INTO `material` VALUES ('111', '111', '111', '111', '111');
INSERT INTO `material` VALUES ('120101004847', '无缝钢管', '20#;GB/T8163', '米', 'D22*3');
INSERT INTO `material` VALUES ('120101004849', '无缝钢管', '20#;GB/T8163', '米', 'D32*3.5');
INSERT INTO `material` VALUES ('120101004853', '无缝钢管', '20#;GB/T8163', '米', 'D45*3.5');
INSERT INTO `material` VALUES ('120101004855', '无缝钢管', '20#;GB/T8163', '米', 'D57*3.5');
INSERT INTO `material` VALUES ('120101004856', '无缝钢管', '20#;GB/T8163', '米', 'D76*4');
INSERT INTO `material` VALUES ('120101004858', '无缝钢管', '20#;GB/T8163', '米', 'D89*4.5');
INSERT INTO `material` VALUES ('120101004861', '无缝钢管', '20#;GB/T8163', '米', 'D219*6');
INSERT INTO `material` VALUES ('120101004863', '无缝钢管', '20#;GB/T8163', '米', 'D159*6');
INSERT INTO `material` VALUES ('120101004869', '无缝钢管', '20#;GB/T8163', '米', 'D57*4');
INSERT INTO `material` VALUES ('120101004870', '无缝钢管', '20#;GB/T8163', '米', 'D32*3');
INSERT INTO `material` VALUES ('120101006037', '无缝钢管', '20#;GB/T8163', '米', 'D108*4.5');
INSERT INTO `material` VALUES ('120101006042', '无缝钢管', '20#;GB/T8163', '米', 'D273*7');
INSERT INTO `material` VALUES ('120101006043', '无缝钢管', '20#;GB/T8163', '米', 'D325*9');
INSERT INTO `material` VALUES ('120101006192', '无缝钢管', 'L245;GB/T9711/PSL1', '米', 'D108*4.5');
INSERT INTO `material` VALUES ('120101006195', '无缝钢管', 'L245;GB/T9711/PSL1', '米', 'D159*5');
INSERT INTO `material` VALUES ('120101006197', '无缝钢管', 'L245;GB/T9711/PSL1', '米', 'D219*6');
INSERT INTO `material` VALUES ('120101805104', '无缝钢管', '20#，不防腐', '米', 'D57?');
INSERT INTO `material` VALUES ('120101805106', '无缝钢管', '20#，不防腐', '米', 'D108?.5');
INSERT INTO `material` VALUES ('120101805108', '无缝钢管', '20#，不防腐', '米', 'D219?');
INSERT INTO `material` VALUES ('120101807626', '无缝钢管', 'L245;GB/T9711', '米', 'D325*8');
INSERT INTO `material` VALUES ('120203805112', '螺旋钢管', 'L245，GB/T9711/PLS2;3PE;加强', '米', 'D406.4?.1');
INSERT INTO `material` VALUES ('120303004834', '直缝钢管', 'HFW;Q235B;GB/T9711/PLS1;3PE;加强', '米', 'D325*8');
INSERT INTO `material` VALUES ('120303007481', '直缝钢管', 'HFW;L245;GB/T9711/PSL1;3PE;加强', '米', 'D406.4*7.9');
INSERT INTO `material` VALUES ('120303800164', '直缝钢管', 'HFW;Q235B;GB/T9711/PLS1;3PE;加强', '米', 'Φ323.9×8');
INSERT INTO `material` VALUES ('120303800168', '直缝钢管', 'HFW;Q235B;GB/T9711/PLS1;3PE;加强', '米', 'Φ159×5');
INSERT INTO `material` VALUES ('120303805113', '直缝钢管', 'GB/T9711/PLS2;3PE;加强', '米', 'L245 D273.1?');
INSERT INTO `material` VALUES ('120303805114', '直缝钢管', 'GB/T9711/PLS2;3PE;加强', '米', 'L245 D273?.1');
INSERT INTO `material` VALUES ('120303805117', '直缝钢管', 'GB/T9711/PLS2;3PE;加强', '米', 'L245 D406.4?.1');
INSERT INTO `material` VALUES ('120303805119', '直缝钢管', 'GB/T9711/PLS2;3PE;加强', '米', 'L245 D426.4?.1');
INSERT INTO `material` VALUES ('120303806033', '直缝钢管', 'Q235B;GB/T9711/PSL1;3PE;加强', '米', 'D219.1*6加强防腐');
INSERT INTO `material` VALUES ('120303807370', '直缝钢管', 'Q235B;GB/T9711/PLS1;3PE;加强', '米', 'D273.1*6');
INSERT INTO `material` VALUES ('120401000006', 'PE管', 'PE80;SDR11;黑', '米', 'De90');
INSERT INTO `material` VALUES ('120401000011', 'PE管', 'PE80;SDR11;黑', '米', 'De250');
INSERT INTO `material` VALUES ('120401000012', 'PE管', 'PE80;SDR11;黑', '米', 'De315');
INSERT INTO `material` VALUES ('120403000044', 'PE管', 'PE100;SDR11;橙', '米', 'De40');
INSERT INTO `material` VALUES ('120403000046', 'PE管', 'PE100;SDR11;橙', '米', 'De63');
INSERT INTO `material` VALUES ('120403000047', 'PE管', 'PE100;SDR11;橙', '米', 'De90');
INSERT INTO `material` VALUES ('120403000048', 'PE管', 'PE100;SDR11;橙', '米', 'De110');
INSERT INTO `material` VALUES ('120403000049', 'PE管', 'PE100;SDR11;橙', '米', 'De160');
INSERT INTO `material` VALUES ('120403000051', 'PE管', 'PE100;SDR11;橙', '米', 'De200');
INSERT INTO `material` VALUES ('120403000052', 'PE管', 'PE100;SDR11;橙', '米', 'De250');
INSERT INTO `material` VALUES ('120403000053', 'PE管', 'PE100;SDR11;橙', '米', 'De315');
INSERT INTO `material` VALUES ('120404000026', 'PE管', 'PE100;SDR17.6;橙', '米', 'De160');
INSERT INTO `material` VALUES ('120404000028', 'PE管', 'PE100;SDR17.6;橙', '米', 'De200');
INSERT INTO `material` VALUES ('120404000029', 'PE管', 'PE100;SDR17.6;橙', '米', 'De250');
INSERT INTO `material` VALUES ('120404000030', 'PE管', 'PE100;SDR17.6;橙', '米', 'De315');
INSERT INTO `material` VALUES ('120404000032', 'PE管', 'PE100;SDR17.6;橙', '米', 'De400');
INSERT INTO `material` VALUES ('120501004531', '镀锌钢管', '普通;Q235B;500G', '米', 'DN20*2.8');
INSERT INTO `material` VALUES ('120501004623', '镀锌钢管', '普通;Q235B;350G', '米', 'DN20*2.8');
INSERT INTO `material` VALUES ('120501005538', '镀锌钢管', '普通;Q235B;500G', '米', 'DN15*2.8');
INSERT INTO `material` VALUES ('120501005539', '镀锌钢管', '普通;Q235B;500G', '米', 'DN25*3.2');
INSERT INTO `material` VALUES ('120501005541', '镀锌钢管', '普通;Q235B;500G', '米', 'DN40*3.5');
INSERT INTO `material` VALUES ('120501005542', '镀锌钢管', '普通;Q235B;500G', '米', 'DN50*3.8');
INSERT INTO `material` VALUES ('120501005543', '镀锌钢管', '普通;Q235B;500G', '米', 'DN65*4.0');
INSERT INTO `material` VALUES ('120501005545', '镀锌钢管', '普通;Q235B;500G', '米', 'DN100*4.0');
INSERT INTO `material` VALUES ('120501805121', '镀锌管', '普通;Q235B;350G', '米', 'DN20×2.75');
INSERT INTO `material` VALUES ('120502004628', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN20*2.8');
INSERT INTO `material` VALUES ('120502005618', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN15*2.8');
INSERT INTO `material` VALUES ('120502005619', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN25*3.2');
INSERT INTO `material` VALUES ('120502005621', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN40*3.5');
INSERT INTO `material` VALUES ('120502005622', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN50*3.8');
INSERT INTO `material` VALUES ('120502005623', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN65*4.0');
INSERT INTO `material` VALUES ('120502005624', '预涂覆环氧镀锌钢管', '普通;Q235B;500G', '米', 'DN80*4.0');
INSERT INTO `material` VALUES ('120502005659', '预涂覆环氧镀锌钢管', '加厚;Q235B;500G', '米', 'DN25*4.0');
INSERT INTO `material` VALUES ('120502005661', '预涂覆环氧镀锌钢管', '加厚;Q235B;500G', '米', 'DN40*4.5');
INSERT INTO `material` VALUES ('120502005662', '预涂覆环氧镀锌钢管', '加厚;Q235B;500G', '米', 'DN50*4.5');
INSERT INTO `material` VALUES ('120502005663', '预涂覆环氧镀锌钢管', '加厚;Q235B;500G', '米', 'DN65*4.5');
INSERT INTO `material` VALUES ('120503004665', '非燃气用镀锌钢管', '', '米', 'DN65');
INSERT INTO `material` VALUES ('120503004667', '非燃气用镀锌钢管', '', '米', 'DN100');
INSERT INTO `material` VALUES ('120503803032', '镀锌管（薄壁非燃气用）', '', '米', 'DN150×3.25');
INSERT INTO `material` VALUES ('120503803033', '镀锌管（薄壁非燃气用）', '', '米', 'DN200×3.50');
INSERT INTO `material` VALUES ('120503805124', '镀锌管（无防腐涂层）', 'Q235', '米', 'DN150×3.25(套管)');
INSERT INTO `material` VALUES ('120503805125', '镀锌管（无防腐涂层）', 'Q235', '米', 'DN200×3.5(套管)');
INSERT INTO `material` VALUES ('120503805126', '镀锌管（无防腐涂层）', 'Q235', '米', 'DN250×4.5(套管)');
INSERT INTO `material` VALUES ('120503805127', '镀锌管（无防腐涂层）', 'Q235', '米', 'DN300×5(套管)');
INSERT INTO `material` VALUES ('120602007921', '不锈钢无缝钢管', 'GB/T14976;sch40;304', '米', 'D57');
INSERT INTO `material` VALUES ('120602803053', '不锈钢无缝钢管', '', '米', 'D32*3');
INSERT INTO `material` VALUES ('120602806561', '不锈钢管', '', '米', 'D18*3.0');
INSERT INTO `material` VALUES ('120602807612', '不锈钢无缝钢管', '', '米', 'D38×3  Ocr18Ni9');
INSERT INTO `material` VALUES ('120602807613', '不锈钢无缝钢管', '', '米', 'D108×4 Ocr18Ni9');
INSERT INTO `material` VALUES ('120701000928', '台式灶具波纹管', 'RLB-ZH-CS-10', '根', '500MM');
INSERT INTO `material` VALUES ('120701005959', '台式灶具波纹管', 'RLB-ZH-C-10', '根', '1500mm');
INSERT INTO `material` VALUES ('120701800250', '金属波纹管(一螺一插)', 'RLB-ZH-CS-10', '条', '500mm');
INSERT INTO `material` VALUES ('120701800253', '金属波纹管(一螺一插)', 'RLB-ZH-CS-10', '条', '1000mm');
INSERT INTO `material` VALUES ('120701803076', '埋墙用不锈钢柔性波纹管', '', '米', 'DN15');
INSERT INTO `material` VALUES ('120701803077', '埋墙用不锈钢柔性波纹管', '', '米', 'DN20');
INSERT INTO `material` VALUES ('120701805128', '不锈钢金属软管', '', '条', 'PN25 DN25 L=1000mm');
INSERT INTO `material` VALUES ('120701805130', '不锈钢金属软管', '', '条', 'PN25 DN40 L=1000mm');
INSERT INTO `material` VALUES ('120701805153', '定长波纹管(日立)', '', '条', '15A  L=1000mm');
INSERT INTO `material` VALUES ('120701805154', '燃气专用不锈钢波纹管(两端插入式)', '', '条', 'RLB-ZH-C-10*500');
INSERT INTO `material` VALUES ('120701805155', '燃气专用不锈钢波纹管(两端插入式)', '', '条', 'RLB-ZH-C-10X1000');
INSERT INTO `material` VALUES ('120701805156', '燃气专用不锈钢波纹管（两端插入式）', '', '条', 'RLB-ZH-C-10*1500');
INSERT INTO `material` VALUES ('120701805157', '燃气专用不锈钢波纹管（插入+螺纹式）', '', '条', 'RLB-ZH-CS-10*1500');
INSERT INTO `material` VALUES ('120701805158', '燃气专用不锈钢波纹管(晨光)', '', '条', 'RQ-10-SG1/2  L=300mm');
INSERT INTO `material` VALUES ('120701805159', '燃气专用不锈钢波纹管(晨光)', '', '条', 'RQ-10-SG1/2  L=500mm');
INSERT INTO `material` VALUES ('120701805160', '燃气专用不锈钢波纹管(晨光)', '', '条', 'RQ-10-SG3/4 L=300mm');
INSERT INTO `material` VALUES ('120701805161', '燃气专用不锈钢波纹管(晨光)', '', '条', 'RQ-08-SG1/2-C9.5  L=1000mm');
INSERT INTO `material` VALUES ('120701805162', '燃气专用不锈钢波纹管（两端插入式）', '', '条', 'RLB-ZH-C-10*2000');
INSERT INTO `material` VALUES ('120701807103', '不锈钢连接软管(水）', '', '条', 'DN15/500mm');
INSERT INTO `material` VALUES ('120703803078', '镀锌防护内角', '', '个', 'DN15');
INSERT INTO `material` VALUES ('120703805165', '不锈钢三通(埋墙管专用)', '', '个', 'DN15');
INSERT INTO `material` VALUES ('120703805166', '不锈钢三通(埋墙管专用)', '', '个', 'DN20');
INSERT INTO `material` VALUES ('120703805167', '不锈钢内丝接头组件(埋墙管专用)', '', '个', 'DN15');
INSERT INTO `material` VALUES ('120703805168', '不锈钢内丝接头组件(埋墙管专用)', '', '个', 'DN20');
INSERT INTO `material` VALUES ('120703805169', '不锈钢外丝接头组件(埋墙管专用)', '', '个', 'DN15');
INSERT INTO `material` VALUES ('120703805170', '不锈钢外丝接头组件(埋墙管专用)', '', '个', 'DN20');
INSERT INTO `material` VALUES ('120904805171', 'PE子管(PVC套管)', '', '米', 'D32/28mm(300米/卷)');
INSERT INTO `material` VALUES ('120904805172', 'PVC线管', '', '米', 'D20mm');
INSERT INTO `material` VALUES ('120907807373', '塑料水管', '', '米', 'Ф20mm');
INSERT INTO `material` VALUES ('120907807508', '帆布胶喉', '', '条', '38mm*6m');
INSERT INTO `material` VALUES ('120907807509', '帆布胶喉', '', '条', '64mm*6m');
INSERT INTO `material` VALUES ('130101001223', '钢制法兰', '20#;PN1.6', '个', 'DN25');
INSERT INTO `material` VALUES ('130101001225', '钢制法兰', '20#;PN1.6', '个', 'DN40');
INSERT INTO `material` VALUES ('130101001226', '钢制法兰', '20#;PN1.6', '个', 'DN50');
INSERT INTO `material` VALUES ('130101001227', '钢制法兰', '20#;PN1.6', '个', 'DN65');
INSERT INTO `material` VALUES ('130101001228', '钢制法兰', '20#;PN1.6', '个', 'DN80');
INSERT INTO `material` VALUES ('130101001229', '钢制法兰', '20#;PN1.6', '个', 'DN100');
INSERT INTO `material` VALUES ('130101001231', '钢制法兰', '20#;PN1.6', '个', 'DN150');
INSERT INTO `material` VALUES ('130101001232', '钢制法兰', '20#;PN1.6', '个', 'DN200');
INSERT INTO `material` VALUES ('130101001233', '钢制法兰', '20#;PN1.6', '个', 'DN250');
INSERT INTO `material` VALUES ('130101001234', '钢制法兰', '20#;PN1.6', '个', 'DN300');
INSERT INTO `material` VALUES ('130101001245', '钢制法兰盖', '20#;PN1.6', '个', 'DN50');
INSERT INTO `material` VALUES ('130101001247', '钢制法兰盖', '20#;PN1.6', '个', 'DN80');
INSERT INTO `material` VALUES ('130101001248', '钢制法兰盖', '20#;PN1.6', '个', 'DN100');
INSERT INTO `material` VALUES ('130101001250', '钢制法兰盖', '20#;PN1.6', '个', 'DN150');
INSERT INTO `material` VALUES ('130101001252', '钢制法兰盖', '20#;PN1.6', '个', 'DN250');
INSERT INTO `material` VALUES ('130101001253', '钢制法兰盖', '20#;PN1.6', '个', 'DN300');
INSERT INTO `material` VALUES ('130101001263', '无缝等径三通', '20#;PN1.6', '个', 'D57*3.5');
INSERT INTO `material` VALUES ('130101001265', '无缝等径三通', '20#;PN1.6', '个', 'D76*4.5');
INSERT INTO `material` VALUES ('130101001266', '无缝等径三通', '20#;PN1.6', '个', 'D89*4.5');
INSERT INTO `material` VALUES ('130101001267', '无缝等径三通', '20#;PN1.6', '个', 'D108*4.5');
INSERT INTO `material` VALUES ('130101001285', '无缝异径三通', '20#;PN1.6', '个', 'D108*89*4.5');
INSERT INTO `material` VALUES ('130101001295', '无缝异径三通', '20#;PN1.6', '个', 'D426*325*10');
INSERT INTO `material` VALUES ('130101001359', '无缝弯头45°', '20#;PN1.6', '个', 'D426*10');
INSERT INTO `material` VALUES ('130101001367', '无缝弯头90°', '20#;PN1.6', '个', 'D57*3.5');
INSERT INTO `material` VALUES ('130101001370', '无缝弯头90°', '20#;PN1.6', '个', 'D89*4.5');
INSERT INTO `material` VALUES ('130101001371', '钢制90°弯头', '20#;PN1.6', '个', 'D108*4.5');
INSERT INTO `material` VALUES ('130101001375', '无缝弯头90°', '20#;PN1.6', '个', 'D273*8');
INSERT INTO `material` VALUES ('130101004554', '无缝弯头90°', '20#;PN1.6', '个', 'D219*7');
INSERT INTO `material` VALUES ('130101004576', '无缝同心异径管', '20#;PN1.6', '个', 'D57*32*3.5*3');
INSERT INTO `material` VALUES ('130101004601', '无缝弯头90°', '20#;PN1.6', '个', 'D32*3');
INSERT INTO `material` VALUES ('130101800315', '钢制法兰', '20#;GB/T9119;PN25', '个', 'DN65');
INSERT INTO `material` VALUES ('130101800363', '法兰盖', '20#;GB/T9119PN25', '个', 'DN150');
INSERT INTO `material` VALUES ('130101800398', '无缝异径三通', '20#', '个', 'Φ325*159*8');
INSERT INTO `material` VALUES ('130101800419', '无缝等径三通', '20#', '个', 'Φ325*8');
INSERT INTO `material` VALUES ('130101800447', '无缝弯头90°', '20#', '个', 'Φ325*8');
INSERT INTO `material` VALUES ('130101800449', '无缝弯头90°', '20#', '个', 'Φ159*5');
INSERT INTO `material` VALUES ('130101800454', '无缝弯头90°', '20#', '个', 'Φ76*4.0');
INSERT INTO `material` VALUES ('130101803104', '法兰盖', 'class150', '片', 'DN80');
INSERT INTO `material` VALUES ('130101803152', '无缝弯头90°', '20﹟', '个', 'D219*6    1.5D');
INSERT INTO `material` VALUES ('130101803215', '无缝等径三通', '20﹟', '个', 'D159*6');
INSERT INTO `material` VALUES ('130101805179', '无缝弯头45°', '', '个', '20# D159×6');
INSERT INTO `material` VALUES ('130101805180', '无缝弯头90°', '', '个', '20# D38×3.5');
INSERT INTO `material` VALUES ('130101805181', '无缝弯头90°', '', '个', '20# D45×3.5');
INSERT INTO `material` VALUES ('130101805183', '无缝弯头90°', '', '个', '20# D273×7');
INSERT INTO `material` VALUES ('130101805185', '无缝弯头90°', '', '个', 'L245 D406×7.1（R=1.5D）');
INSERT INTO `material` VALUES ('130101805187', '无缝等径三通', '', '个', '20# D45×3.5');
INSERT INTO `material` VALUES ('130101805188', '无缝等径三通', '', '个', '20# D159×6');
INSERT INTO `material` VALUES ('130101805190', '无缝等径三通', '', '个', '20# D219×8');
INSERT INTO `material` VALUES ('130101805201', '无缝异径三通', '', '个', '20# D159×108×6');
INSERT INTO `material` VALUES ('130101805202', '无缝异径三通', '', '个', '20# D219×108×6');
INSERT INTO `material` VALUES ('130101805207', '无缝异径三通', '', '个', 'L245 D406.4×159×7.1');
INSERT INTO `material` VALUES ('130101805208', '无缝异径三通', '', '个', 'l245 D406.4×219×7.1');
INSERT INTO `material` VALUES ('130101805209', '无缝异径三通', '', '个', 'L245 D406.4×273×7.1');
INSERT INTO `material` VALUES ('130101805214', '无缝大小头', '', '个', '20# D76×57×4');
INSERT INTO `material` VALUES ('130101805215', '无缝大小头', '', '个', '20# D89×32×4');
INSERT INTO `material` VALUES ('130101805216', '无缝大小头', '', '个', '20# D89×45×4.5');
INSERT INTO `material` VALUES ('130101805217', '无缝大小头', '', '个', '20# D89×57×4.5');
INSERT INTO `material` VALUES ('130101805223', '无缝大小头', '', '个', '20# D159×89×6');
INSERT INTO `material` VALUES ('130101805224', '无缝大小头', '', '个', '20# D159×108×6');
INSERT INTO `material` VALUES ('130101805231', '钢法兰', '20#;PN1.6', '个', 'DN80');
INSERT INTO `material` VALUES ('130101805238', '钢法兰', '20#;PN2.5', '块', 'PN25 DN200');
INSERT INTO `material` VALUES ('130101805239', '钢制管帽/封头', '20#', '个', 'D57×3.5');
INSERT INTO `material` VALUES ('130101805251', '钢牙咀', '20#', '个', 'D22(1/2″)');
INSERT INTO `material` VALUES ('130101806055', '无缝同心异径管', '20#;PN1.6', '个', 'D325×219×8（9）');
INSERT INTO `material` VALUES ('130101806673', '无缝弯头90°', '20#', '个', 'D426×8');
INSERT INTO `material` VALUES ('130101806676', '无缝大小头', '20#', '个', 'D426X406');
INSERT INTO `material` VALUES ('130101806787', '无缝异径三通', '', '个', 'D426*108');
INSERT INTO `material` VALUES ('130101806915', '平焊法兰', '20#', '片', 'PN16 D300');
INSERT INTO `material` VALUES ('130101806919', '无缝大小头', '20#', '个', 'D325*273*8');
INSERT INTO `material` VALUES ('130101806929', '无缝弯头90°', '20#PN1.6', '个', 'D323.9*7.9');
INSERT INTO `material` VALUES ('130101807603', '无缝异径三通', '20#', '个', 'D325*219*8/6');
INSERT INTO `material` VALUES ('130101807607', '无缝异径三通', '20#', '个', 'D159*76*6/4');
INSERT INTO `material` VALUES ('130101807608', '无缝异径三通', '', '个', 'D76*57*6/4');
INSERT INTO `material` VALUES ('130101807609', '无缝异径三通', '', '个', 'D108*57*4');
INSERT INTO `material` VALUES ('130101807614', '无缝异径三通', '', '个', 'D159*57*6/4');
INSERT INTO `material` VALUES ('130201000096', '电熔套筒', 'PE100;SDR11;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130201000098', '电熔套筒', 'PE100;SDR11;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130201000100', '电熔套筒', 'PE100;SDR11;黑', '个', 'De250');
INSERT INTO `material` VALUES ('130201000101', '电熔套筒', 'PE100;SDR11;黑', '个', 'De315');
INSERT INTO `material` VALUES ('130201000103', '电熔套筒', 'PE100;SDR11;黑', '个', 'De400');
INSERT INTO `material` VALUES ('130201000113', '电熔等径三通', 'PE80;SDR11;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130201000114', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De32');
INSERT INTO `material` VALUES ('130201000115', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De40');
INSERT INTO `material` VALUES ('130201000116', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De50');
INSERT INTO `material` VALUES ('130201000117', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130201000118', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130201000119', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130201000121', '电熔等径三通', 'PE100;SDR11;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130201000134', '电熔异径三通', 'PE80;SDR11;黑', '个', 'De160/90');
INSERT INTO `material` VALUES ('130201000145', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De63/40');
INSERT INTO `material` VALUES ('130201000148', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De90/63');
INSERT INTO `material` VALUES ('130201000151', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De110/63');
INSERT INTO `material` VALUES ('130201000152', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De160/40');
INSERT INTO `material` VALUES ('130201000154', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De160/63');
INSERT INTO `material` VALUES ('130201000155', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De160/90');
INSERT INTO `material` VALUES ('130201000156', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De160/110');
INSERT INTO `material` VALUES ('130201000157', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De200/40');
INSERT INTO `material` VALUES ('130201000174', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De32');
INSERT INTO `material` VALUES ('130201000175', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De40');
INSERT INTO `material` VALUES ('130201000177', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130201000178', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130201000179', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130201000180', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130201000181', '电熔90°弯头', 'PE100;SDR11;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130201000186', '电熔45°弯头', 'PE80;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130201000196', '电熔45°弯头', 'PE100;SDR11;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130201000219', '电熔变径', 'PE100;SDR11;黑', '个', 'De40/32');
INSERT INTO `material` VALUES ('130201000220', '电熔变径', 'PE100;SDR11;黑', '个', 'De50/32');
INSERT INTO `material` VALUES ('130201000221', '电熔变径', 'PE100;SDR11;黑', '个', 'De50/40');
INSERT INTO `material` VALUES ('130201000223', '电熔变径', 'PE100;SDR11;黑', '个', 'De63/40');
INSERT INTO `material` VALUES ('130201000224', '电熔变径', 'PE100;SDR11;黑', '个', 'De63/50');
INSERT INTO `material` VALUES ('130201000226', '电熔变径', 'PE100;SDR11;黑', '个', 'De90/63');
INSERT INTO `material` VALUES ('130201000227', '电熔变径', 'PE100;SDR11;黑', '个', 'De110/63');
INSERT INTO `material` VALUES ('130201000228', '电熔变径', 'PE100;SDR11;黑', '个', 'De110/90');
INSERT INTO `material` VALUES ('130201000230', '电熔变径', 'PE100;SDR11;黑', '个', 'De160/90');
INSERT INTO `material` VALUES ('130201000231', '电熔变径', 'PE100;SDR11;黑', '个', 'De160/110');
INSERT INTO `material` VALUES ('130201000235', '电熔端帽', 'PE100;SDR11;黑', '个', 'De32');
INSERT INTO `material` VALUES ('130201000236', '电熔端帽', 'PE100;SDR11;黑', '个', 'De40');
INSERT INTO `material` VALUES ('130201000238', '电熔端帽', 'PE100;SDR11;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130201000239', '电熔端帽', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130201000240', '电熔端帽', 'PE100;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130201000241', '电熔端帽', 'PE100;SDR11;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130201000245', '电熔鞍型直通', 'PE100;SDR11;黑', '个', 'De110/63');
INSERT INTO `material` VALUES ('130201000246', '电熔鞍型直通', 'PE100;SDR11;黑', '个', 'De160/63');
INSERT INTO `material` VALUES ('130201000247', '电熔鞍型直通', 'PE100;SDR11;黑', '个', 'De200/63');
INSERT INTO `material` VALUES ('130201000249', '电熔鞍型直通', 'PE100;SDR11;黑', '个', 'De315/63');
INSERT INTO `material` VALUES ('130201000254', '电熔鞍型直通', 'PE100;SDR11;黑', '个', 'De250/90');
INSERT INTO `material` VALUES ('130201000270', '电熔鞍型三通', 'PE100;SDR11;黑', '个', 'De200/63');
INSERT INTO `material` VALUES ('130201004807', '电熔异径三通', 'PE100;SDR11', '个', 'De110/90');
INSERT INTO `material` VALUES ('130201005731', '常开型电磁阀', '直动式;铸钢;法兰;PN1.6;6bar', '个', 'DN40');
INSERT INTO `material` VALUES ('130201800557', '电熔套筒', 'PE100;SDR11;橙', '个', 'De90');
INSERT INTO `material` VALUES ('130201800558', '电熔套筒', 'PE100;SDR11;橙', '个', 'De63');
INSERT INTO `material` VALUES ('130201800563', '电熔套筒', 'PE100;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130201800566', '电熔套筒', 'PE100;SDR11;黑', '个', 'De40');
INSERT INTO `material` VALUES ('130201800583', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De110/90');
INSERT INTO `material` VALUES ('130201800587', '电熔异径三通', 'PE100;SDR11;黑', '个', 'De90/40');
INSERT INTO `material` VALUES ('130201800604', '电熔90°弯头', 'PE80;SDR17.6;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130201800618', '电熔套筒', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130201800619', '电熔套筒', 'PE100;SDR11;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130201803365', 'PE电熔异径三通PE100 SDR11', '', '个', 'Φ160×63黑色');
INSERT INTO `material` VALUES ('130201805282', '电熔鞍型旁通', '', '个', 'PE80 SDR11 D250×63');
INSERT INTO `material` VALUES ('130201805283', '电熔鞍型旁通', '', '个', 'PE80 SDR11 D315×63');
INSERT INTO `material` VALUES ('130201805284', 'PE100电熔套筒', '', '个', 'PE100 SDR11 D32');
INSERT INTO `material` VALUES ('130201805285', 'PE100电熔套筒', '', '个', 'PE100 SDR11 D40');
INSERT INTO `material` VALUES ('130201805286', 'PE100电熔套筒', '', '个', 'PE100 SDR11 D63');
INSERT INTO `material` VALUES ('130201805287', 'PE100电熔套筒', '', '个', 'PE100 SDR11 D90');
INSERT INTO `material` VALUES ('130201805288', 'PE100电熔套筒', '', '个', 'PE100 SDR11 D110');
INSERT INTO `material` VALUES ('130201805289', 'PE100电熔变径三通', '', '个', 'PE100 SDR11 D90×90×40');
INSERT INTO `material` VALUES ('130201805291', 'PE100电熔变径三通', '', '个', 'PE100 SDR11 D110×110×40');
INSERT INTO `material` VALUES ('130201805292', 'PE100电熔变径三通', '', '个', 'PE100 SDR11 D110×110×90');
INSERT INTO `material` VALUES ('130201805296', 'PE100电熔鞍形旁通', '', '个', 'PE100 SDR11 D90×63');
INSERT INTO `material` VALUES ('130201805298', 'PE100电熔鞍形旁通', '', '个', 'PE100 SDR11 D110×63');
INSERT INTO `material` VALUES ('130201805300', 'PE100电熔鞍形旁通', '', '个', 'PE100 SDR11 D160×63');
INSERT INTO `material` VALUES ('130201805302', 'PE100电熔鞍形旁通', '', '个', 'PE100 SDR11 D200×63');
INSERT INTO `material` VALUES ('130201805304', 'PE100电熔鞍形旁通', '', '个', 'PE100 SDR11 D250×63');
INSERT INTO `material` VALUES ('130202000316', '注塑等径三通', 'PE100;SDR17.6;黑', '个', 'De250');
INSERT INTO `material` VALUES ('130202000317', '注塑等径三通', 'PE100;SDR17.6;黑', '个', 'De315');
INSERT INTO `material` VALUES ('130202000335', '注塑异径三通', 'PE80;SDR11;黑', '个', 'De160/90');
INSERT INTO `material` VALUES ('130202000379', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De160/90');
INSERT INTO `material` VALUES ('130202000380', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De160/110');
INSERT INTO `material` VALUES ('130202000388', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De200/63');
INSERT INTO `material` VALUES ('130202000391', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De200/110');
INSERT INTO `material` VALUES ('130202000393', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De200/160');
INSERT INTO `material` VALUES ('130202000403', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De250/63');
INSERT INTO `material` VALUES ('130202000405', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De250/90');
INSERT INTO `material` VALUES ('130202000406', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De250/110');
INSERT INTO `material` VALUES ('130202000408', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De250/160');
INSERT INTO `material` VALUES ('130202000410', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De250/200');
INSERT INTO `material` VALUES ('130202000415', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De315/160');
INSERT INTO `material` VALUES ('130202000419', '注塑异径三通', 'PE100;SDR17.6;黑', '个', 'De315/250');
INSERT INTO `material` VALUES ('130202000426', '注塑90°弯头', 'PE80;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130202000427', '注塑90°弯头', 'PE80;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130202000444', '注塑90°弯头', 'PE100;SDR11;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130202000453', '注塑90°弯头', 'PE100;SDR17.6;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130202000455', '注塑90°弯头', 'PE100;SDR17.6;黑', '个', 'De250');
INSERT INTO `material` VALUES ('130202000456', '注塑90°弯头', 'PE100;SDR17.6;黑', '个', 'De315');
INSERT INTO `material` VALUES ('130202000481', '注塑45°弯头', 'PE100;SDR17.6;黑', '个', 'De250');
INSERT INTO `material` VALUES ('130202000518', '注塑变径', 'PE80;SDR11;黑', '个', 'De110/50');
INSERT INTO `material` VALUES ('130202000527', '注塑变径', 'PE80;SDR11;黑', '个', 'De160/110');
INSERT INTO `material` VALUES ('130202000609', '注塑变径', 'PE100;SDR17.6;黑', '个', 'De200/160');
INSERT INTO `material` VALUES ('130202000613', '注塑变径', 'PE100;SDR17.6;黑', '个', 'De250/110');
INSERT INTO `material` VALUES ('130202000614', '注塑变径', 'PE100;SDR17.6;黑', '个', 'De250/160');
INSERT INTO `material` VALUES ('130202000616', '注塑变径', 'PE100;SDR17.6;黑', '个', 'De250/200');
INSERT INTO `material` VALUES ('130202000621', '注塑变径', 'PE100;SDR17.6;黑', '个', 'De315/250');
INSERT INTO `material` VALUES ('130202000633', '注塑端帽', 'PE80;SDR11;黑', '个', 'De40');
INSERT INTO `material` VALUES ('130202000637', '注塑端帽', 'PE80;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130202000638', '注塑端帽', 'PE80;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130202000653', '注塑端帽', 'PE100;SDR11;黑', '个', 'De63');
INSERT INTO `material` VALUES ('130202000671', '注塑端帽', 'PE100;SDR17.6;黑', '个', 'De160');
INSERT INTO `material` VALUES ('130202000673', '注塑端帽', 'PE100;SDR17.6;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130202000675', '注塑端帽', 'PE100;SDR17.6;黑', '个', 'De250');
INSERT INTO `material` VALUES ('130202000677', '注塑端帽', 'PE100;SDR17.6;黑', '个', 'De315');
INSERT INTO `material` VALUES ('130202000703', '注塑法兰接头', 'PE80;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130202000720', '注塑法兰接头', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130202000739', '注塑法兰接头', 'PE100;SDR17.6;黑', '个', 'De200');
INSERT INTO `material` VALUES ('130202800623', '注塑端帽', 'PE100;SDR11;黑', '个', 'De110');
INSERT INTO `material` VALUES ('130202800624', '注塑端帽', 'PE100;SDR11;黑', '个', 'De90');
INSERT INTO `material` VALUES ('130204000822', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De32/D34');
INSERT INTO `material` VALUES ('130204000825', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De40/D34');
INSERT INTO `material` VALUES ('130204000834', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De63/D57');
INSERT INTO `material` VALUES ('130204000836', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De90/D89');
INSERT INTO `material` VALUES ('130204000837', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De110/D108');
INSERT INTO `material` VALUES ('130204000839', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De160/D159');
INSERT INTO `material` VALUES ('130204000841', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De200/D219');
INSERT INTO `material` VALUES ('130204000844', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De315/D325');
INSERT INTO `material` VALUES ('130204000846', '直管焊接式钢塑转换', 'PE80;SDR11;FBE;普通;黑', '个', 'De400/D426');
INSERT INTO `material` VALUES ('130204805306', '钢管式钢塑转换', '', '个', 'De250×D219');
INSERT INTO `material` VALUES ('130205001066', '防腐法兰片', 'FBE;加强;PN1.6', '个', 'De315');
INSERT INTO `material` VALUES ('130205001068', '防腐法兰片', 'FBE;加强;PN1.6', '个', 'De400');
INSERT INTO `material` VALUES ('130205001072', '防腐法兰片', 'FBE;普通;PN1.0', '个', 'De90');
INSERT INTO `material` VALUES ('130301001489', '镀锌内丝', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001490', '镀锌内丝', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001491', '镀锌内丝', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001493', '镀锌内丝', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001494', '镀锌内丝', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001500', '镀锌异径内丝', '普通', '个', 'DN20*DN15');
INSERT INTO `material` VALUES ('130301001501', '镀锌异径内丝', '普通', '个', 'DN25*DN15');
INSERT INTO `material` VALUES ('130301001502', '镀锌异径内丝', '普通', '个', 'DN25*DN20');
INSERT INTO `material` VALUES ('130301001508', '镀锌异径内丝', '普通', '个', 'DN40*DN25');
INSERT INTO `material` VALUES ('130301001514', '镀锌异径内丝', '普通', '个', 'DN50*DN40');
INSERT INTO `material` VALUES ('130301001537', '镀锌内外丝接头', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001548', '镀锌六角外丝', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001549', '镀锌六角外丝', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001550', '镀锌六角外丝', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001552', '镀锌六角外丝', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001553', '镀锌六角外丝', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001559', '镀锌补芯', '普通', '个', 'DN20*DN15');
INSERT INTO `material` VALUES ('130301001560', '镀锌补芯', '普通', '个', 'DN25*DN15');
INSERT INTO `material` VALUES ('130301001596', '镀锌三通', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001597', '镀锌三通', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001598', '镀锌三通', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001600', '镀锌三通', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001601', '镀锌三通', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001607', '镀锌异径三通', '普通', '个', 'DN20*DN15');
INSERT INTO `material` VALUES ('130301001608', '镀锌异径三通', '普通', '个', 'DN25*DN15');
INSERT INTO `material` VALUES ('130301001615', '镀锌异径三通', '普通', '个', 'DN40*DN25');
INSERT INTO `material` VALUES ('130301001618', '镀锌异径三通', '普通', '个', 'DN50*DN20');
INSERT INTO `material` VALUES ('130301001619', '镀锌异径三通', '普通', '个', 'DN50*DN25');
INSERT INTO `material` VALUES ('130301001656', '镀锌异径四通', '普通', '个', 'DN25*DN15');
INSERT INTO `material` VALUES ('130301001661', '镀锌异径四通', '普通', '个', 'DN40*DN15');
INSERT INTO `material` VALUES ('130301001665', '镀锌异径四通', '普通', '个', 'DN50*DN15');
INSERT INTO `material` VALUES ('130301001692', '镀锌管堵', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001693', '镀锌管堵', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001694', '镀锌管堵', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001696', '镀锌管堵', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001697', '镀锌管堵', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001714', '镀锌90°弯头', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001715', '镀锌90°弯头', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001716', '镀锌90°弯头', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001718', '镀锌90°弯头', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001719', '镀锌90°弯头', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001725', '镀锌90°异径弯头', '普通', '个', 'DN20*DN15');
INSERT INTO `material` VALUES ('130301001773', '镀锌内外丝弯头', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001774', '镀锌内外丝弯头', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001775', '镀锌内外丝弯头', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001777', '镀锌内外丝弯头', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001778', '镀锌内外丝弯头', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301001850', '镀锌铜芯活接', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130301001851', '镀锌铜芯活接', '普通', '个', 'DN20');
INSERT INTO `material` VALUES ('130301001852', '镀锌铜芯活接', '普通', '个', 'DN25');
INSERT INTO `material` VALUES ('130301001854', '镀锌铜芯活接', '普通', '个', 'DN40');
INSERT INTO `material` VALUES ('130301001855', '镀锌铜芯活接', '普通', '个', 'DN50');
INSERT INTO `material` VALUES ('130301805309', '镀锌防护平面弯头', '普通', '个', 'DN15');
INSERT INTO `material` VALUES ('130401807730', '不锈钢等径直通', '', '个', '');
INSERT INTO `material` VALUES ('130403803406', '不锈钢弯头Ocr18Ni9', '', '个', '90°3D φ57×3.5');
INSERT INTO `material` VALUES ('130403803407', '不锈钢弯头Ocr18Ni9', '', '个', '90°3D φ32×3');
INSERT INTO `material` VALUES ('130403803413', '等径三通Ocr18Ni9', '', '个', 'φ57×3.5');
INSERT INTO `material` VALUES ('130403803511', '不锈钢异径三通', '0CR18NI9', '个', 'D57*3.5/D32*3');
INSERT INTO `material` VALUES ('130403803535', '不锈钢法兰', 'PN1.6', '个', 'DN50');
INSERT INTO `material` VALUES ('130403803536', '不锈钢法兰', 'PN1.6', '个', 'DN100 RF');
INSERT INTO `material` VALUES ('130403803537', '不锈钢法兰', 'PN1.6', '个', 'DN150');
INSERT INTO `material` VALUES ('130403806952', '不锈钢盲板（304不锈钢）', '', '块', 'DN40 PN16');
INSERT INTO `material` VALUES ('130403807160', '不锈钢盲板（304）', '', '块', 'DN25 PN16');
INSERT INTO `material` VALUES ('130403807169', '不锈钢盲板（304）', '', '块', 'DN150 PN16');
INSERT INTO `material` VALUES ('130403807172', '不锈钢盲板（304）', '', '块', 'DN250 PN16');
INSERT INTO `material` VALUES ('130403807173', '不锈钢盲板（304）', '', '块', 'DN100 PN16');
INSERT INTO `material` VALUES ('130403807174', '不锈钢盲板（304）', '', '块', 'DN65 PN16');
INSERT INTO `material` VALUES ('130403807179', '不锈钢盲板（304）', '', '块', 'DN80 PN16');
INSERT INTO `material` VALUES ('130403807180', '不锈钢盲板（304不锈钢）', '', '块', 'DN50 PN16');
INSERT INTO `material` VALUES ('130403807181', '不锈钢盲板（304）', '', '块', 'DN200 PN16');
INSERT INTO `material` VALUES ('130403807186', '不锈钢盲板（304）', '', '块', 'DN32 PN16');
INSERT INTO `material` VALUES ('130403807282', '不锈钢同心异径管', '', '个', 'Φ108×Φ76');
INSERT INTO `material` VALUES ('130403807597', '不锈钢等径三通', 'Ocr18Ni9', '个', 'D108×108×4.5');
INSERT INTO `material` VALUES ('130403807598', '不锈钢异径三通', 'Ocr18Ni9', '个', 'D108×18×4.5/3');
INSERT INTO `material` VALUES ('130403807599', '不锈钢异径三通', 'Ocr18Ni9', '个', 'D57×38×3.5/3');
INSERT INTO `material` VALUES ('130403807606', '不锈异径三通', 'Ocr18Ni9', '个', 'D108×32×4.5/3');
INSERT INTO `material` VALUES ('130403807611', '不锈钢异径三通', 'Ocr18Ni9', '个', 'D108×57×4.5/3');
INSERT INTO `material` VALUES ('130403807617', '不锈钢 90°弯头', 'Ocr18Ni9', '个', 'D108×4.5 3D');
INSERT INTO `material` VALUES ('130403807618', '不锈钢90°弯头', 'Ocr18Ni9', '个', 'D38×3   3D');
INSERT INTO `material` VALUES ('130501805311', '铜内牙急轮', '', '个', 'DN15（1/2\"）');
INSERT INTO `material` VALUES ('130501805312', '铜外牙曲', '', '个', 'DN15（1/2\"）');
INSERT INTO `material` VALUES ('130501805313', '安全阀铜接头', '', '个', '1/2″');
INSERT INTO `material` VALUES ('130501805314', '压力表铜接头', '', '个', '1/2″');
INSERT INTO `material` VALUES ('130501807510', '铜三通', '', '个', 'DN15');
INSERT INTO `material` VALUES ('130502806707', '紫铜三通', '', '个', 'DN8');
INSERT INTO `material` VALUES ('140101001131', '丹麦AVK闸阀', '球铁;法兰连接;软密封;PN1.6', '个', 'DN100');
INSERT INTO `material` VALUES ('140101001133', '丹麦AVK闸阀', '球铁;法兰连接;软密封;PN1.6', '个', 'DN200');
INSERT INTO `material` VALUES ('140101001139', '丹麦AVK闸阀', '球铁;PE连接;软密封;PN1.0', '个', 'DN90');
INSERT INTO `material` VALUES ('140101001140', '丹麦AVK闸阀', '球铁;PE连接;软密封;PN1.0', '个', 'DN110');
INSERT INTO `material` VALUES ('140101001141', '丹麦AVK闸阀', '球铁;PE连接;软密封;PN1.0', '个', 'DN160');
INSERT INTO `material` VALUES ('140101001142', '丹麦AVK闸阀', '球铁;PE连接;软密封;PN1.0', '个', 'DN200');
INSERT INTO `material` VALUES ('140101001143', '丹麦AVK闸阀', '球铁;PE连接;软密封;PN1.0', '个', 'DN250');
INSERT INTO `material` VALUES ('140101001147', '丹麦AVK闸阀', '铸钢;焊接连接;软密封;PN1.6', '个', 'DN100');
INSERT INTO `material` VALUES ('140101001148', '丹麦AVK闸阀', '铸钢;焊接连接;软密封;PN1.6', '个', 'DN150');
INSERT INTO `material` VALUES ('140101805315', '对焊直埋密封闸阀(方圆)', '', '个', 'FYZ67F-16C  DN250(加强级防腐)');
INSERT INTO `material` VALUES ('140101806631', '埋地平板闸阀', 'PEAMZ67FM-16CP', '台', 'De63 PE连接');
INSERT INTO `material` VALUES ('140101806640', '开关铭牌', '', '个', '');
INSERT INTO `material` VALUES ('140101806786', '丹麦AVK闸阀', '铸钢；焊接连接；软密封；PN1.6', '个', 'DN400');
INSERT INTO `material` VALUES ('140101806847', '埋地平板闸阀', 'PE连接De110', '台', 'PEAMZ67FM-16CP DN100');
INSERT INTO `material` VALUES ('140101806848', '埋地平板闸阀', 'PE连接De90', '台', 'PEAMZ67FM-16CP  DN80');
INSERT INTO `material` VALUES ('140101808308', '顺宁舒克铸钢埋地闸阀', 'TRZ67W-16C 2F(ZM)', '台', 'DN80');
INSERT INTO `material` VALUES ('140101808309', '顺宁舒克铸钢埋地闸阀', 'TRZ67W-16C 2F(ZM)', '台', 'DN100');
INSERT INTO `material` VALUES ('140103003109', 'PE球阀', 'PE100;SDR11', '个', 'De63');
INSERT INTO `material` VALUES ('140103003116', 'PE球阀', 'PE100;SDR11;单放散', '个', 'De63');
INSERT INTO `material` VALUES ('140103003117', 'PE球阀', 'PE100;SDR11;单放散', '个', 'De90');
INSERT INTO `material` VALUES ('140104004817', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd15');
INSERT INTO `material` VALUES ('140104004818', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd20');
INSERT INTO `material` VALUES ('140104004819', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd25');
INSERT INTO `material` VALUES ('140104004821', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd40');
INSERT INTO `material` VALUES ('140104004822', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd50');
INSERT INTO `material` VALUES ('140104004823', '普通内螺纹铜球阀', '志清Q11F-16TB2', '个', 'd65');
INSERT INTO `material` VALUES ('140104007688', '普通内外螺纹铜球阀', '志清Q2/11F-25TF2.I', '个', 'd15');
INSERT INTO `material` VALUES ('140104800857', '螺纹铜球阀', 'KITZ', '个', 'SZA1/4”');
INSERT INTO `material` VALUES ('140104805316', '黄铜内直嘴球阀', '', '个', 'Q11F-16TAZ 15C');
INSERT INTO `material` VALUES ('140104805317', '黄铜外直嘴球阀', '', '个', 'Q21F-16TAZ 15C');
INSERT INTO `material` VALUES ('140105803580', '高压球阀', '', '个', 'DN20 PN315');
INSERT INTO `material` VALUES ('140105805318', 'MHA高压球阀', '', '个', 'BKH-DN13-1/2NPT-1128 PN500');
INSERT INTO `material` VALUES ('140106001170', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN20');
INSERT INTO `material` VALUES ('140106001171', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN25');
INSERT INTO `material` VALUES ('140106001173', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN40');
INSERT INTO `material` VALUES ('140106001174', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN50');
INSERT INTO `material` VALUES ('140106001175', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN65');
INSERT INTO `material` VALUES ('140106001176', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN80');
INSERT INTO `material` VALUES ('140106001177', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN100');
INSERT INTO `material` VALUES ('140106001179', '法兰浮动球阀', 'Q41F-16C;加强级防腐;两片式', '个', 'DN150');
INSERT INTO `material` VALUES ('140106003981', '法兰浮动球阀', 'Q41F-16C;普通表面处理;两片式', '个', 'DN50');
INSERT INTO `material` VALUES ('140106003983', '法兰浮动球阀', 'Q41F-16C;普通表面处理;两片式', '个', 'DN80');
INSERT INTO `material` VALUES ('140106005844', '法兰浮动球阀', 'Q341F-16C;普通表面处理;两片式', '个', 'DN100');
INSERT INTO `material` VALUES ('140106005845', '法兰浮动球阀', 'Q341F-16C;普通表面处理;两片式', '个', 'DN150');
INSERT INTO `material` VALUES ('140106805321', '铸钢法兰球阀', '', '个', 'Q41F-25C  DN20');
INSERT INTO `material` VALUES ('140106805322', '铸钢法兰球阀', '', '个', 'Q41F-25C  DN25');
INSERT INTO `material` VALUES ('140106805323', '铸钢法兰球阀', '', '个', 'Q41F-25C  DN40');
INSERT INTO `material` VALUES ('140106806993', '法兰球阀', 'Q341F-16C 加强级防腐', '台', 'DN150');
INSERT INTO `material` VALUES ('140106807099', '法兰浮动球阀', 'Q41F-25C；普通表面处理;两片式', '个', 'DN50');
INSERT INTO `material` VALUES ('140106807100', '法兰浮动球阀', 'Q347F-150LB', '个', 'DN200');
INSERT INTO `material` VALUES ('140106807102', '法兰浮动球阀', 'Q347F-150LB', '个', 'DN80');
INSERT INTO `material` VALUES ('140107004031', '法兰固定球阀', 'Q347F-16F;加强级防腐;两片式', '个', 'DN250');
INSERT INTO `material` VALUES ('140107004032', '法兰固定球阀', 'Q347F-16F;加强级防腐;两片式', '个', 'DN300');
INSERT INTO `material` VALUES ('140109805324', '焊接球阀', '', '个', 'Q61/11F-16C DN25');
INSERT INTO `material` VALUES ('140109806615', '不绣钢焊接球阀', 'PN25', '个', 'DN15');
INSERT INTO `material` VALUES ('140109806616', '不锈钢焊接球阀', 'PN25', '个', 'DN80');
INSERT INTO `material` VALUES ('140111805325', '丝扣截止阀(日本KITZ)', '', '个', '1/2\"');
INSERT INTO `material` VALUES ('140111807104', '不锈钢低温长轴截止阀', 'DJ-50D', '个', 'DN50');
INSERT INTO `material` VALUES ('140111807601', '低温长轴截止阀', 'DJ-100A', '个', 'DN100 PN1.6');
INSERT INTO `material` VALUES ('140111807602', '低温长轴截止阀', 'DJ-50D', '个', 'DN50 PN1.6');
INSERT INTO `material` VALUES ('140111807604', '低温长轴截止阀', 'DJ-15D', '个', 'DN15 PN1.6');
INSERT INTO `material` VALUES ('140111807615', '低温长轴截止阀', 'DJ-25D', '个', 'DN25 PN1.6');
INSERT INTO `material` VALUES ('140111808093', '低温长轴截止阀', 'DJ-40D', '个', 'DN40');
INSERT INTO `material` VALUES ('140112005818', '常开型电磁阀', '直动式;压铸铝;法兰连接;PN1.6;6bar', '个', 'DN25');
INSERT INTO `material` VALUES ('140112807061', '电磁阀', 'HSEB-25', '个', 'AC220V');
INSERT INTO `material` VALUES ('140112807062', '电磁阀', 'SMC50-VF3-5T', '个', '');
INSERT INTO `material` VALUES ('140113806614', '安全阀', 'A61F-320P', '个', 'DN15');
INSERT INTO `material` VALUES ('140113807605', '安全阀', 'A42F-16C', '个', 'DN50');
INSERT INTO `material` VALUES ('140113807610', '低温安全阀', 'DA-25', '个', 'DN25 PN1.6');
INSERT INTO `material` VALUES ('140114805332', '日本KITZ碟阀', '', '个', 'DJP16 DN100');
INSERT INTO `material` VALUES ('140114807478', '蝶阀', '', '个', 'BF32/C/16-DN80');
INSERT INTO `material` VALUES ('140115807021', '法兰止回阀', '', '个', 'PN16 DN40');
INSERT INTO `material` VALUES ('140115807096', '不锈钢低温止回阀', 'DH-50B', '个', 'DN50');
INSERT INTO `material` VALUES ('140116805333', '低温紧急切断阀TH/FC', '', '个', 'DJQ-50-50mm');
INSERT INTO `material` VALUES ('140116805334', '低温紧急切断阀TH/FC', '', '个', 'DJQ-50B-50mm');
INSERT INTO `material` VALUES ('140116805335', '低温紧急切断阀TH/FC', '', '个', 'DJQ-65-65mm');
INSERT INTO `material` VALUES ('140116805339', '伊藤液相自动切换阀', '', '个', 'LAX-20B');
INSERT INTO `material` VALUES ('140117807024', '枪阀密封座（库克）', 'KK-330', '只', '');
INSERT INTO `material` VALUES ('140117807133', '气动开关', 'V45K2-15', '个', '');
INSERT INTO `material` VALUES ('140201805345', '先锋智能基表(丹东)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140201805346', '先锋智能IC卡（不含基表）', '', '个', 'G4');
INSERT INTO `material` VALUES ('140201805347', '浙江金卡智能基表(丹东)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140201805348', '浙江金卡智能IC卡(不含基表)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140201805349', '工商用皮膜表(丹东)', '', '个', 'G25');
INSERT INTO `material` VALUES ('140201805350', '蓝焰IC卡燃气表(丹东)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140201805351', '蓝焰IC卡燃气表（丹东）', '', '个', 'G4');
INSERT INTO `material` VALUES ('140201805352', '山城IC卡燃气表(山城)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140201805355', '浙江金卡工业表远传监控系统', '', '个', '一对一');
INSERT INTO `material` VALUES ('140201805359', '先锋智能IC卡(不含基表)', '', '台', 'G2.5');
INSERT INTO `material` VALUES ('140201805360', '先锋IC卡智能分体燃气表(丹东)', '', '台', 'ICRB-CG-G25');
INSERT INTO `material` VALUES ('140301800981', '克罗姆Krom皮膜表', '德国', '个', 'BK-G25');
INSERT INTO `material` VALUES ('140301800982', '克罗姆Krom皮膜表', '德国', '个', 'BK-G16');
INSERT INTO `material` VALUES ('140301800983', '克罗姆Krom皮膜表', '德国', '个', 'BK-G10');
INSERT INTO `material` VALUES ('140301800984', '克罗姆Krom皮膜表', '德国', '个', 'BK-G6');
INSERT INTO `material` VALUES ('140301800988', '克罗姆Krom有线直读表', '', '个', 'BK-G2.5(直读表)');
INSERT INTO `material` VALUES ('140301800991', '克罗姆Krom家用表', '', '个', 'BK-G2.5');
INSERT INTO `material` VALUES ('140301805361', '家用皮膜表(丹东)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140301805362', '家用皮膜表(丹东)', '', '个', 'G4');
INSERT INTO `material` VALUES ('140301805363', '家用皮膜表(克罗姆)', '', '个', 'BK-G1.6');
INSERT INTO `material` VALUES ('140301805364', '家用皮膜表(山城)', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140301807782', '克罗姆Krom无线直读表', '', '个', 'BK-G2.5');
INSERT INTO `material` VALUES ('140303805365', 'IC卡(燃气充值卡)', '', '张', '先锋');
INSERT INTO `material` VALUES ('140303805366', 'IC卡（燃气充值卡）', '', '张', '金卡');
INSERT INTO `material` VALUES ('140303805369', '丹东表防水面罩（民用型）', '', '个', 'G2.5');
INSERT INTO `material` VALUES ('140303805370', '燃气表接头', '', '付', 'G2.5');
INSERT INTO `material` VALUES ('140303805373', '表接头密封垫', '', '付', 'G2.5');
INSERT INTO `material` VALUES ('140401002137', '涡轮流量计', '天信;TBQJ;铝合金;国产', '台', 'DN100;20-400;精度1.0;PN1.6');
INSERT INTO `material` VALUES ('140401002355', '涡轮流量计', '埃尔斯特;TRZ2;球墨铸铁;组装', '台', 'DN100;13-250;精度1.0;PN1.6');
INSERT INTO `material` VALUES ('140401002362', '涡轮流量计', '埃尔斯特;TRZ2;球墨铸铁;组装', '台', 'DN200;130-2500;精度1.0;PN1.6');
INSERT INTO `material` VALUES ('140401002464', '涡轮流量计', '埃尔斯特;SM-RI-X;钢;进口', '台', 'DN250;130-2500;精度1.0;PN1.6');
INSERT INTO `material` VALUES ('140402002109', '腰轮流量计', '德莱赛;2M175;铝合金;组装', '台', 'DN50;0.45-57;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002110', '腰轮流量计', '德莱赛;3M175;铝合金;组装', '台', 'DN50;0.61-85;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002111', '腰轮流量计', '德莱赛;5M175;铝合金;组装', '台', 'DN80;0.66-142;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002112', '腰轮流量计', '德莱赛;7M175;铝合金;组装', '台', 'DN80;1.74-200;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002113', '腰轮流量计', '德莱赛;11M175;铝合金;组装', '台', 'DN100;1.37-310;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002114', '腰轮流量计', '德莱赛;16M175;铝合金;组装', '台', 'DN100;2.02-450;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140402002115', '腰轮流量计', '德莱赛;23M232;铝合金;组装', '台', 'DN100;2.34-650;精度1.0;PN1.2');
INSERT INTO `material` VALUES ('140406002497', '温度压力修正仪', 'EK220;国产', '台', '埃尔斯特');
INSERT INTO `material` VALUES ('140406002499', '温度压力修正仪', 'EK260;国产', '台', '埃尔斯特');
INSERT INTO `material` VALUES ('140406003231', '温度压力修正仪', 'CFCM-I', '台', '天信');
INSERT INTO `material` VALUES ('140406805404', '涡轮流量计润滑油(天信)', '', '瓶', 'C5(200ml/瓶）');
INSERT INTO `material` VALUES ('140406805405', '腰轮流量计润滑油(天信)', '', '瓶', 'T15(200ml/瓶）');
INSERT INTO `material` VALUES ('140406805953', '电池', '电池 标靶式流量计用', '个', '标靶式流量计用');
INSERT INTO `material` VALUES ('140406807057', '中频模块', 'HF3', '块', '');
INSERT INTO `material` VALUES ('140406807781', '电池盒组件', '', '条', '流量计使用');
INSERT INTO `material` VALUES ('140501801025', '低低压调压器', '英国Jeavons', '台', 'J42');
INSERT INTO `material` VALUES ('140501805410', '户内两用中低调压器(长青)', '', '个', 'RTZ-41/20D (LPG/NG)');
INSERT INTO `material` VALUES ('140501805411', '户内低低调压器(长青)', '', '个', 'RTZ-21/20 (NG)直角式');
INSERT INTO `material` VALUES ('140501805412', '户内中低压调压器(长青)', '', '个', 'RTZ-41/20D (NG)');
INSERT INTO `material` VALUES ('140501805413', '户内两用低低调压器(长青)', '', '个', 'RTZ-21/20D (LPG/NG)');
INSERT INTO `material` VALUES ('140501805415', '户内中低调压器(志清)', '', '个', 'RTZ21/15 (LPG)');
INSERT INTO `material` VALUES ('140501807431', '户内中低调压器', '', '个', 'RTZ-40/20（NG）');
INSERT INTO `material` VALUES ('140501807488', '户内中低调压器（长青）', '', '个', 'RTZ-41/20E（LPG）');
INSERT INTO `material` VALUES ('140502004908', '单体调压器', '英国JEAVONS;J48;2.5kpa', '台', 'DN25');
INSERT INTO `material` VALUES ('140502004911', '单体调压器', '美国REGO;LV5503 B8', '台', 'DN20');
INSERT INTO `material` VALUES ('140502801032', '单嘴减压阀', '浙江先锋', '台', 'JYT-0.6');
INSERT INTO `material` VALUES ('140502801039', '中低调压器', '意大利Tartarini', '台', 'B/249');
INSERT INTO `material` VALUES ('140502801040', '中低调压器', '意大利Tartarini', '台', 'R70');
INSERT INTO `material` VALUES ('140502801054', '中低压调压器', '美国AMCO，1883', '台', 'DN50');
INSERT INTO `material` VALUES ('140502801055', '中低压调压器', '', '台', 'DN50');
INSERT INTO `material` VALUES ('140502805416', '二级调压器', '', '个', 'LV4403-B6（21kg/hr）');
INSERT INTO `material` VALUES ('140502805417', '二级调压器', '', '个', 'B42');
INSERT INTO `material` VALUES ('140502805419', '中低调压器(JEON)', '', '个', 'RTZ-31/25FQ(P1：0.02-0.4MPa,P2：1-5KPa）');
INSERT INTO `material` VALUES ('140502805420', '中低调压器（JEON）', '', '个', 'RTZ-50FQ(P1：0.02-0.4MPa,P2：1-5/5-10.10-15KPa）');
INSERT INTO `material` VALUES ('140502805421', '低低调压器(JEAVONS)', '', '个', 'J48 DN40');
INSERT INTO `material` VALUES ('140502805422', '低低调压器(JEAVONS)', '', '个', 'J48 DN50');
INSERT INTO `material` VALUES ('140502805424', '二级调压器', '', '台', 'R622-DFF');
INSERT INTO `material` VALUES ('140502805425', '二级调压器', '', '台', 'R522-DFF');
INSERT INTO `material` VALUES ('140502805426', '二级调压器', '', '台', 'R-25');
INSERT INTO `material` VALUES ('140502806973', '调压器', '意大利Tartarini', '个', '25MBN（AP）');
INSERT INTO `material` VALUES ('140502807587', '调压器', '', '个', 'J48 DN25');
INSERT INTO `material` VALUES ('140502807809', '久安调压器', '', '个', 'RTZ-FQ25');
INSERT INTO `material` VALUES ('140502807810', '久安调压器', '', '个', 'RTZ-FQ40');
INSERT INTO `material` VALUES ('140503805427', '天然气调压箱(飞奥)', '', '台', 'RJS50(40)(1+0)/(P1=0.1-0.4MPa,P2=1.8-16KPa)');
INSERT INTO `material` VALUES ('140503805428', '调压箱(本生)', '', '台', 'HRS-25-1B-25/25(J)(1+1)');
INSERT INTO `material` VALUES ('140503805429', '调压箱(本生)', '', '台', 'HRS-25-1SB-25/25(T) P1=0.2-0.4Mpa P2=2.1Kpa');
INSERT INTO `material` VALUES ('140503805430', '楼栋调压箱（本生）', '', '台', 'RX100/0.4A-ZD P1：0.07～0.4MPa；P2:2.4～15KPa');
INSERT INTO `material` VALUES ('140503805431', '中低楼栋调压箱(本生)', '', '台', '');
INSERT INTO `material` VALUES ('140503805433', '中低压楼栋调压箱（久安）', '', '台', 'RTZ-80Q（50FQ P1=0.07MPa-0.4MPa,P2=2.4KPa-100KPa）');
INSERT INTO `material` VALUES ('140503805434', '中低压楼栋调压箱(久安)', '', '台', 'RB25/DN25');
INSERT INTO `material` VALUES ('140503805437', '中低压楼栋调压箱(久安)', '', '台', 'RB80/DN40');
INSERT INTO `material` VALUES ('140504801062', '调压箱（含箱内组件)', '', '套', 'RX25/0.4A-FE25');
INSERT INTO `material` VALUES ('140504801063', '调压箱（含箱内组件)', '', '套', 'RX50/0.4A-FES50');
INSERT INTO `material` VALUES ('140504801064', '调压箱（含箱内组件）', '', '套', 'RX200/0.4A-B/249');
INSERT INTO `material` VALUES ('140504801065', '调压箱（含箱内组件）', '', '套', 'RX75/0.4A-FEX1');
INSERT INTO `material` VALUES ('140505803897', '华亮本生调压柜', '', '个', 'RX600/0.4C-ZD(Dival600）');
INSERT INTO `material` VALUES ('140505805442', '置换调压撬(本生)', '', '台', '');
INSERT INTO `material` VALUES ('140506004892', '非标准区域/工商业调压箱', '', '台', '600.0');
INSERT INTO `material` VALUES ('140506805450', '中中调压柜(不带计量)', '', '台', 'RX-200A/(P1：0.2-0.4MPa,P2：70KPa)');
INSERT INTO `material` VALUES ('140508803901', '弹簧', '', '个', '25-30bar');
INSERT INTO `material` VALUES ('140510803903', '不锈钢表箱', '', '个', '350×350×190');
INSERT INTO `material` VALUES ('140510805406', '不锈钢调压器箱', '', '个', '400×220×450mm');
INSERT INTO `material` VALUES ('140510805407', '不锈钢调压器箱', '', '个', '420×220×450');
INSERT INTO `material` VALUES ('140510805408', '不锈钢煤气表箱', '', '个', '350×350×190');
INSERT INTO `material` VALUES ('140510805409', '不锈钢表箱（陈村碧桂花城）', '', '个', '400*300*200');
INSERT INTO `material` VALUES ('140510806935', '不锈钢箱', '自定义', '个', '自定义');
INSERT INTO `material` VALUES ('140602001423', '热收缩套', '普通级', '套', 'D273-500');
INSERT INTO `material` VALUES ('140602001427', '热收缩套', '普通级', '套', 'D406-500');
INSERT INTO `material` VALUES ('140602001428', '热收缩套', '普通级', '套', 'D426-500');
INSERT INTO `material` VALUES ('140602805451', '热收缩套/穿越专用（达胜）', '', '套', 'D325');
INSERT INTO `material` VALUES ('140602805455', '穿越套(达胜)', '', '套', 'D406');
INSERT INTO `material` VALUES ('140603001463', '热收缩缠绕带', '加强级', '平方', 'W150');
INSERT INTO `material` VALUES ('140603803917', '加强级聚乙烯胶粘带', '', '平方', '(100mm)');
INSERT INTO `material` VALUES ('140605805456', '3PE/S加强级防腐(螺旋钢管)', '', '米', 'D406.4×7.1　　　　　　　');
INSERT INTO `material` VALUES ('140605805457', '3PE/S加强级防腐(L245直缝钢管)', '', '米', 'D406.4×7.1');
INSERT INTO `material` VALUES ('140605805458', '直缝钢管', 'HFW,L360,GB/T97 11/PSL1;3PE加强', '米', 'D406.4*7.9');
INSERT INTO `material` VALUES ('140606005772', '牛油防腐胶带', '统称码', '平方', '');
INSERT INTO `material` VALUES ('140606005773', '牛油带配套保护带', '统称码', '平方', '');
INSERT INTO `material` VALUES ('140606005774', '牛油带配套腻子', '统称码', '千克', '');
INSERT INTO `material` VALUES ('140606005776', 'PVC防腐胶带', '统称码', '卷', '2吋');
INSERT INTO `material` VALUES ('140606805458', '环氧煤沥青涂料', '', '千克', 'HLP-8');
INSERT INTO `material` VALUES ('140801801144', '点对点报警器', 'JB-WX-DZI01（11）', '台', '深圳东震');
INSERT INTO `material` VALUES ('140801805473', '特安可燃气体报警装置(带风控,防爆功能,配备用电池)', '', '台', 'JB-QT-TON90A(四路)');
INSERT INTO `material` VALUES ('140801805474', '特安可燃气体报警装置(带风控,防爆功能,配备用电池)', '', '台', 'JB-QT-TON90A(五路)');
INSERT INTO `material` VALUES ('140801805476', '防爆智能静电接地报警器', '', '台', '');
INSERT INTO `material` VALUES ('140801805478', '家用报警器(安业牌)', '', '台', 'XBF-01型');
INSERT INTO `material` VALUES ('140801806467', '可燃气体报警探测器', '', '台', 'ES2000T');
INSERT INTO `material` VALUES ('140802008242', '燃气检漏仪（手持式）', 'SS TKX-A(Sensit)', '台', '美国杰恩');
INSERT INTO `material` VALUES ('140802805479', '可燃性气体测漏仪', '', '台', 'GMI');
INSERT INTO `material` VALUES ('140802805480', '高灵敏度燃气检漏仪', '', '台', 'SS-TKX(有防爆认证)');
INSERT INTO `material` VALUES ('140802805481', '经济型燃气检漏仪', '', '台', 'SS-TKX-A');
INSERT INTO `material` VALUES ('140802805490', '便携式探测器（氨气）', '', '台', 'TC-B03');
INSERT INTO `material` VALUES ('140802805491', '便携式可燃气体检测器', '', '台', 'ESP210');
INSERT INTO `material` VALUES ('140802807199', '便携式气体报警器充电器', '', '个', '深圳特安EP200-1专用');
INSERT INTO `material` VALUES ('140802807201', '便携式气体报警器电池', '', '块', '深圳特安EP200-1专用');
INSERT INTO `material` VALUES ('140804004608', '膜盒压力表', '0-2.5mpa;2.5级', '个', 'YE100');
INSERT INTO `material` VALUES ('140804005970', '一般压力表', '0-0.6Mpa;1.6级;铁壳', '个', 'Y-100');
INSERT INTO `material` VALUES ('140804005971', '一般压力表', '0-0.16Mpa;1.6级;铁壳', '个', 'Y-100');
INSERT INTO `material` VALUES ('140804801158', '压力表', '', '个', 'Y100-10Kpa');
INSERT INTO `material` VALUES ('140804803930', '压力表', '', '块', 'Y-100 1.6级  0-4MPa');
INSERT INTO `material` VALUES ('140804803931', '压力表', '', '块', 'Y100   0-0.6MPa');
INSERT INTO `material` VALUES ('140804803933', '不锈钢压力表', '', '块', 'Y100 0-1.6MPa');
INSERT INTO `material` VALUES ('140804805492', 'U型压力计软管', '', '米', '');
INSERT INTO `material` VALUES ('140804805493', '普通压力表', '', '个', 'Y100  0～10KPa');
INSERT INTO `material` VALUES ('140804805494', '普通压力表', '', '个', 'Y100  0～25KPa');
INSERT INTO `material` VALUES ('140804805495', '普通压力表', '', '个', 'Y100 0～0.25MPa');
INSERT INTO `material` VALUES ('140804805496', '普通压力表', '', '个', 'Y100 0～1.6MPa');
INSERT INTO `material` VALUES ('140804805499', '抗震压力表', '', '个', 'Y100 0-40Mpa');
INSERT INTO `material` VALUES ('140804805502', '高精度压力表', '', '个', 'Y150 0～0.25MPa((0.4级)');
INSERT INTO `material` VALUES ('140804805503', '高精度压力表', '', '个', 'Y150 0～0.6MPa(0.4级)');
INSERT INTO `material` VALUES ('140804805505', '国产微压表', '', '个', 'Y80  0～10000Pa');
INSERT INTO `material` VALUES ('140804805506', '不锈钢U型压力计/水柱表', '', '个', 'L=500mm');
INSERT INTO `material` VALUES ('140804805509', '不锈钢U型压力计/水柱表', '', '个', 'L=600mm');
INSERT INTO `material` VALUES ('140804805510', '普通U型压力计/水柱表', '', '个', 'L=500mm');
INSERT INTO `material` VALUES ('140804805512', '普通U型压力计/水柱表', '', '个', 'L=1000mm');
INSERT INTO `material` VALUES ('140804805513', '不锈钢压力表', '', '个', 'Y100 0～40Mpa');
INSERT INTO `material` VALUES ('140804805514', '不锈钢压力表', '', '个', 'Y100 0～1.6Mpa');
INSERT INTO `material` VALUES ('140804805517', '氮气表', '', '个', 'YQD-07型');
INSERT INTO `material` VALUES ('140804805518', '输血管', '', '米', 'D12');
INSERT INTO `material` VALUES ('140804806269', '压力表 Y-100', '', '块', '0-0.6MPa');
INSERT INTO `material` VALUES ('140804806600', '温度变送器', 'W4052HP2L1K2A02Z1C1E1M1D5F13L02A', '台', '深圳特安');
INSERT INTO `material` VALUES ('140804807070', '不锈钢压力表', '', '个', 'YN100 0-10MPa');
INSERT INTO `material` VALUES ('140804807135', '温度变送器', 'W4052HP1L1K2A02Z1C2E1M1S1D5W2F13L03A', '台', '温度范围-20~80度');
INSERT INTO `material` VALUES ('140804807137', '压力变送器', 'T350TGP37D1C53E1K2F1M1', '台', '量程0~1000KPA');
INSERT INTO `material` VALUES ('140804807349', '压力表', '', '个', 'Y100 0-20KPa');
INSERT INTO `material` VALUES ('140804807513', '不锈钢耐震压力表', '', '个', 'Y60 0-0.6Mpa');
INSERT INTO `material` VALUES ('140804807518', '不锈钢耐震压力表', '', '个', 'Y60 0-1.0Mpa');
INSERT INTO `material` VALUES ('140804807530', '不锈钢双金属温度计', 'WSS-311', '个', '0-200度');
INSERT INTO `material` VALUES ('140805801179', '万用表', '', '个', 'MF470');
INSERT INTO `material` VALUES ('140901801208', '本生筒式燃气过滤器', '', '台', 'FT-100/100');
INSERT INTO `material` VALUES ('140901801216', '天信Y型过滤器', '', '台', 'QYQ-100A');
INSERT INTO `material` VALUES ('140901801217', '天信Y型过滤器', '', '台', 'QYQ-80A');
INSERT INTO `material` VALUES ('140901801218', '天信Y型过滤器', '', '台', 'QYQ-50A');
INSERT INTO `material` VALUES ('140901801223', '志清铸钢法兰过滤器', '不锈钢过滤网200目', '台', 'G41W-16C DN80');
INSERT INTO `material` VALUES ('140901801224', '志清铸钢法兰过滤器', '不锈钢过滤网200目', '台', 'G41W-16C  DN50');
INSERT INTO `material` VALUES ('140901805526', '铸钢法兰过滤器', '', '个', 'G41W-16C DN25');
INSERT INTO `material` VALUES ('140901805527', '铸钢法兰过滤器', '', '个', 'G41W-16C DN40');
INSERT INTO `material` VALUES ('140901805528', '铸钢法兰过滤器', '', '个', 'G41W-16C DN50');
INSERT INTO `material` VALUES ('140901805530', '铸钢法兰过滤器', '', '个', 'G41W-16C DN80');
INSERT INTO `material` VALUES ('140901805535', '涡轮表过滤器(筒型)', '', '个', 'DN250');
INSERT INTO `material` VALUES ('140901805537', '过滤器滤芯', '', '个', 'HFA 4.0C G4.0B（飞奥筒型过滤器）');
INSERT INTO `material` VALUES ('140901806544', '志清铸钢法兰过滤器', '不锈钢过滤网200目', '个', 'G41W-25C,DN80');
INSERT INTO `material` VALUES ('140901807355', '过滤器滤芯', '飞奥筒型过滤器', '个', 'HFA1.5C G1.5B');
INSERT INTO `material` VALUES ('140902805541', '不锈钢波纹补偿器', '', '条', 'DN250');
INSERT INTO `material` VALUES ('141001001124', '警示带', '通用型', '米', 'W200');
INSERT INTO `material` VALUES ('141001004564', '单股铜包钢示踪线', '铜包钢;30%;单线', '米', '2.6mm×1');
INSERT INTO `material` VALUES ('141001801246', '玻璃钢标志桩（直线）', '', '个', 'Φ100mm*800mm');
INSERT INTO `material` VALUES ('141001801263', '不锈钢标志牌（45°）', '', '个', 'V');
INSERT INTO `material` VALUES ('141001801264', '不锈钢标志牌（三通）', '', '个', 'T');
INSERT INTO `material` VALUES ('141001801265', '不锈钢标志牌（末端）', '', '个', 'O');
INSERT INTO `material` VALUES ('141001801266', '不锈钢标志牌（直线）', '', '个', 'I');
INSERT INTO `material` VALUES ('141001801268', '不锈钢标志牌（直角）', '', '个', 'L');
INSERT INTO `material` VALUES ('141001801277', '警示带', '', '卷', '');
INSERT INTO `material` VALUES ('141001805543', '燃气管线标志牌', '', '块', '120×80mm(90°弯头方向)');
INSERT INTO `material` VALUES ('141001805545', '燃气管线标志牌', '', '块', '120×80mm(三通方向)');
INSERT INTO `material` VALUES ('141001805546', '燃气管线标志牌', '', '块', '120×80mm(直管线方向)');
INSERT INTO `material` VALUES ('141001805547', '燃气管线标志牌', '', '块', '120×80mm(管线终点符)');
INSERT INTO `material` VALUES ('141001805550', '水泥标志桩(直管线方向)', '', '条', '100×100×900mm');
INSERT INTO `material` VALUES ('141001805551', '水泥标志桩(90°弯头方向)', '', '条', '100×100×900mm');
INSERT INTO `material` VALUES ('141001805552', '水泥标志桩(三通方向)', '', '条', '100×100×900mm');
INSERT INTO `material` VALUES ('141001805553', '水泥标志桩(管线终点符)', '', '条', '100×100×900mm');
INSERT INTO `material` VALUES ('141001805554', '水泥标志桩(直管线方向)', '', '条', '120×120×450mm');
INSERT INTO `material` VALUES ('141001805555', '水泥标志桩(90°弯头方向)', '', '条', '120×120×450mm');
INSERT INTO `material` VALUES ('141001805556', '水泥标志桩(三通方向)', '', '条', '120×120×450mm');
INSERT INTO `material` VALUES ('141001805559', '水泥保护板', '', '块', '800×300×40mm');
INSERT INTO `material` VALUES ('141001805560', '钢纤维混凝土阀门检查井盖', '', '套', '850×450');
INSERT INTO `material` VALUES ('141001805561', '钢纤维混凝土阀门检查井盖', '', '套', '650×350');
INSERT INTO `material` VALUES ('141001805562', '水泥阀门井盖', '', '套', '460(500)×460(500)');
INSERT INTO `material` VALUES ('141001805563', 'PE阀门井盖', '', '套', '适用于≤D160PE球阀');
INSERT INTO `material` VALUES ('141002005777', 'PE保护盖板', '', '米', '200*3');
INSERT INTO `material` VALUES ('141002005778', 'PE保护盖板', '', '米', '300*3');
INSERT INTO `material` VALUES ('141002005780', 'PE保护盖板', '', '米', '500*3');
INSERT INTO `material` VALUES ('141003005804', '缠绕式垫片', 'D;1222;PN16', '片', 'DN200');
INSERT INTO `material` VALUES ('141003005806', '缠绕式垫片', 'D;1222;PN16', '片', 'DN100');
INSERT INTO `material` VALUES ('141003005883', '聚四氟垫片', '', '片', 'DN200');
INSERT INTO `material` VALUES ('141003005884', '聚四氟垫片', '', '片', 'DN150');
INSERT INTO `material` VALUES ('141003005885', '聚四氟垫片', '', '片', 'DN100');
INSERT INTO `material` VALUES ('141003005886', '聚四氟垫片', '', '片', 'DN80');
INSERT INTO `material` VALUES ('141003005887', '聚四氟垫片', '', '片', 'DN65');
INSERT INTO `material` VALUES ('141003005888', '聚四氟垫片', '', '片', 'DN50');
INSERT INTO `material` VALUES ('141003005889', '聚四氟垫片', '', '片', 'DN40');
INSERT INTO `material` VALUES ('141003005890', '聚四氟垫片', '', '片', 'DN32');
INSERT INTO `material` VALUES ('141003005891', '聚四氟垫片', '', '片', 'DN25');
INSERT INTO `material` VALUES ('141003005954', '生料带', '统称码', '卷', '');
INSERT INTO `material` VALUES ('141003804166', '不锈钢螺栓螺母', '流量调节阀配件', '套', 'M20*100');
INSERT INTO `material` VALUES ('141003805564', '六角头螺丝（配螺母及垫片）', '', '套', 'M6×16');
INSERT INTO `material` VALUES ('141003805565', '六角头螺丝（配螺母及垫片）', '', '套', 'M12×60');
INSERT INTO `material` VALUES ('141003805570', '六角头螺丝（配螺母及垫片）', '', '套', 'M16×50');
INSERT INTO `material` VALUES ('141003805572', '六角头螺丝（配螺母及垫片）', '', '套', 'M16×60');
INSERT INTO `material` VALUES ('141003805573', '六角头螺丝（配螺母及垫片）', '', '套', 'M16×70');
INSERT INTO `material` VALUES ('141003805577', '六角头螺丝（配螺母及垫片）', '', '套', 'M16×110');
INSERT INTO `material` VALUES ('141003805582', '六角头螺丝（配螺母及垫片）', '', '套', 'M18×70');
INSERT INTO `material` VALUES ('141003805584', '六角头螺丝（配螺母及垫片）', '', '套', 'M18×110');
INSERT INTO `material` VALUES ('141003805588', '六角头螺丝（配螺母及垫片）', '', '套', 'M20×90');
INSERT INTO `material` VALUES ('141003805596', '六角头螺丝（配螺母及垫片）', '', '套', 'M22×90');
INSERT INTO `material` VALUES ('141003805597', '六角头螺丝（配螺母及垫片）', '', '套', 'M22×100');
INSERT INTO `material` VALUES ('141003805598', '六角头螺丝（配螺母及垫片）', '', '套', 'M22×110');
INSERT INTO `material` VALUES ('141003805599', '六角头螺丝（配螺母及垫片）', '', '套', 'M22×120');
INSERT INTO `material` VALUES ('141003805606', '六角头螺丝（配螺母及垫片）', '', '套', 'M27×120');
INSERT INTO `material` VALUES ('141003805623', '拉爆螺丝', '', '套', 'M6×60');
INSERT INTO `material` VALUES ('141003805624', '拉爆螺丝', '', '套', 'M10×80');
INSERT INTO `material` VALUES ('141003805625', '开槽沉头自攻螺丝', '', '套', 'M4×25  （500粒/盒）');
INSERT INTO `material` VALUES ('141003805626', '胶粒', '', '套', '500粒/盒');
INSERT INTO `material` VALUES ('141003805627', '8.8级六角碳钢螺栓', '', '套', 'M16*120');
INSERT INTO `material` VALUES ('141003805628', '聚四氟乙烯垫片', '', '片', 'DN15');
INSERT INTO `material` VALUES ('141003805630', '聚四氟乙烯垫片', '', '片', 'DN250');
INSERT INTO `material` VALUES ('141003805631', '聚四氟乙烯垫片', '', '片', 'DN300');
INSERT INTO `material` VALUES ('141003805633', '聚四氟乙烯垫片', '', '片', 'DN350');
INSERT INTO `material` VALUES ('141003805634', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN10');
INSERT INTO `material` VALUES ('141003805637', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN25');
INSERT INTO `material` VALUES ('141003805638', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN32');
INSERT INTO `material` VALUES ('141003805639', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN40');
INSERT INTO `material` VALUES ('141003805640', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN50');
INSERT INTO `material` VALUES ('141003805642', '聚四氟乙烯垫片(LNG低温)', '', '片', 'DN80');
INSERT INTO `material` VALUES ('141003805650', '高压石棉板', '', '卷', '2mm');
INSERT INTO `material` VALUES ('141003806729', '不锈钢拉爆螺丝', '', '套', 'M8*70');
INSERT INTO `material` VALUES ('141003806906', '不锈钢螺丝', '304不锈钢，含螺丝+螺母+垫片', '套', 'M12*80');
INSERT INTO `material` VALUES ('141003807205', '不锈钢六角头螺丝', '304.0', '套', 'M12*45');
INSERT INTO `material` VALUES ('141003807206', '不锈钢六角头螺丝', '304.0', '套', '12*50mm');
INSERT INTO `material` VALUES ('141003807207', '不锈钢六角头螺丝', '304.0', '套', 'M14*40');
INSERT INTO `material` VALUES ('141003807208', '不锈钢螺栓', '304.0', '套', 'M12*60');
INSERT INTO `material` VALUES ('141003807209', '不锈钢螺栓', '304.0', '套', 'M14*60');
INSERT INTO `material` VALUES ('141003807210', '不锈钢螺栓', '', '套', 'M16*100');
INSERT INTO `material` VALUES ('141003807219', '不锈钢螺栓', '', '套', 'M16*90');
INSERT INTO `material` VALUES ('141003807222', '不锈钢螺栓', '', '套', 'M20*110');
INSERT INTO `material` VALUES ('141003807223', '不锈钢六角螺丝', '', '个', 'M10*40');
INSERT INTO `material` VALUES ('141003807225', '不锈钢六角头螺丝', '304.0', '套', 'M14*90');
INSERT INTO `material` VALUES ('141003807226', '不锈钢螺栓', '', '套', 'M14*70');
INSERT INTO `material` VALUES ('141003807232', '不锈钢螺栓', '', '套', 'M20*120');
INSERT INTO `material` VALUES ('141003807447', '聚四氟乙烯垫片', '', '片', 'DN125');
INSERT INTO `material` VALUES ('141003807511', '拉爆螺丝', '', '套', 'M6*80mm');
INSERT INTO `material` VALUES ('141003807516', '拉爆螺丝', '', '套', 'M8*80mm');
INSERT INTO `material` VALUES ('141003807519', '拉爆螺丝', '', '套', 'M12*80mm');
INSERT INTO `material` VALUES ('141004801494', '铝箔纸', '', '张', '');
INSERT INTO `material` VALUES ('141004801539', '不锈钢短码', '', '个', 'DN15');
INSERT INTO `material` VALUES ('141004805651', '不锈钢离墙码', '', '个', 'D22(1/2″)');
INSERT INTO `material` VALUES ('141004805652', '不锈钢Y型码', '', '个', 'D22(1/2″)');
INSERT INTO `material` VALUES ('141004805653', '不锈钢Y型码', '', '个', 'D22(1/2″)-加长型');
INSERT INTO `material` VALUES ('141004805654', '不锈钢槽型码', '', '个', 'D25(3/4″)×50mm');
INSERT INTO `material` VALUES ('141004805655', '不锈钢槽型码', '', '个', 'D32(1″)×50mm');
INSERT INTO `material` VALUES ('141004805656', '不锈钢槽型码', '', '个', 'D45(1 1/2″)×50mm');
INSERT INTO `material` VALUES ('141004805657', '不锈钢槽型码', '', '个', 'D45(1 1/2″)×80mm');
INSERT INTO `material` VALUES ('141004805658', '不锈钢槽型码', '', '个', 'D57(2″)×50mm');
INSERT INTO `material` VALUES ('141004805659', '不锈钢槽型码', '', '个', 'D76(2 1/2″)×50mm');
INSERT INTO `material` VALUES ('141004805660', '不锈钢槽型码', '', '个', 'D76(2 1/2″)×80mm');
INSERT INTO `material` VALUES ('141004805661', '不锈钢槽型码', '', '个', 'D89(3″)×50mm');
INSERT INTO `material` VALUES ('141004805662', '不锈钢槽型码', '', '个', 'D89(3″)×80mm');
INSERT INTO `material` VALUES ('141004805663', '不锈钢喉夹', '', '个', 'D9～16mm');
INSERT INTO `material` VALUES ('141004805664', 'U型码', '', '个', 'D45');
INSERT INTO `material` VALUES ('141004805665', 'U型码', '', '个', 'D76');
INSERT INTO `material` VALUES ('141004805666', 'U型码', '', '个', 'D89');
INSERT INTO `material` VALUES ('141004805667', 'U型码', '', '个', 'D159');
INSERT INTO `material` VALUES ('141004805668', '波纹管管卡', '', '个', 'DN15');
INSERT INTO `material` VALUES ('141004805734', '冲咀', '', '个', '');
INSERT INTO `material` VALUES ('141004806476', 'U型码', '', '个', 'D57');
INSERT INTO `material` VALUES ('141004806477', 'U型码', '', '个', 'D108');
INSERT INTO `material` VALUES ('141004806837', '保温棉', '', '条', '');
INSERT INTO `material` VALUES ('141004807150', '不锈钢加长码', '135*20*2/304不锈钢', '个', 'DN15');
INSERT INTO `material` VALUES ('150106007984', '橡胶板', '', '平方', '');
INSERT INTO `material` VALUES ('150106801601', '对讲机', '', '个', '双优18瓦');
INSERT INTO `material` VALUES ('150106801716', '插座', '', '个', '10A');
INSERT INTO `material` VALUES ('150106801747', '电线', '', '米', 'BVR*2.5mm2');
INSERT INTO `material` VALUES ('150106801748', '电线', '', '米', 'BVR*1.5mm2');
INSERT INTO `material` VALUES ('150106801774', '电线', '', '米', 'BVV2.5');
INSERT INTO `material` VALUES ('150106804367', '节能灯泡', '', '支', '18W(三U管)');
INSERT INTO `material` VALUES ('150106805670', '电控制箱', '', '个', '600×500×200');
INSERT INTO `material` VALUES ('150106805671', '四芯电缆', '', '米', '4×1.5mm2');
INSERT INTO `material` VALUES ('150106805672', '电缆', '', '米', '3×4mm2');
INSERT INTO `material` VALUES ('150106805673', 'YH焊缆', '', '米', '25mm2');
INSERT INTO `material` VALUES ('150106805675', '便携式强光防爆应急工作灯', '', '个', 'IW5100GF');
INSERT INTO `material` VALUES ('150106805677', '路神灯', '', '个', '');
INSERT INTO `material` VALUES ('150106805678', '吸顶灯', '', '个', '100W');
INSERT INTO `material` VALUES ('150106805679', '钠灯泡(亚明)', '', '个', '150W (E40)');
INSERT INTO `material` VALUES ('150106805680', '螺纹灯泡', '', '个', '100W');
INSERT INTO `material` VALUES ('150106805681', '电工胶布', '', '卷', '18×8');
INSERT INTO `material` VALUES ('150106805682', '镇流器', '', '个', '220V/20-40W');
INSERT INTO `material` VALUES ('150106806328', '灯管', '', '支', '40W');
INSERT INTO `material` VALUES ('150106806458', '高压钠灯灯头', '', '个', '220V/250W');
INSERT INTO `material` VALUES ('150106806632', '小型防爆手电筒', 'PELICAN 1830S', '个', '');
INSERT INTO `material` VALUES ('150106806633', '防爆地拖插座', '', '个', '');
INSERT INTO `material` VALUES ('150106806634', '停电应急灯', '', '个', '');
INSERT INTO `material` VALUES ('150106806723', '防爆投光灯', '220V 高压纳灯400W', '个', '');
INSERT INTO `material` VALUES ('150106806964', '单路输出开关电源', 'S-350-24', '个', '输出电压24V');
INSERT INTO `material` VALUES ('150106807063', '浪涌保护器防雷栅', 'MTL-SLP32D', '个', '');
INSERT INTO `material` VALUES ('150106807064', 'XMT数显温度调节仪', '122.0', '个', '精度1.0');
INSERT INTO `material` VALUES ('150106807086', '电线', '', '米', 'BVV3*0.75mm2');
INSERT INTO `material` VALUES ('150106807139', '防爆绕性管', '', '条', 'DN15*1000mm');
INSERT INTO `material` VALUES ('150106807140', '漏电开关', 'DZ47LE', '个', '380V/63');
INSERT INTO `material` VALUES ('150106807143', '防爆绕性管', '', '条', 'DN20*1000mm');
INSERT INTO `material` VALUES ('150106807146', '漏电开关', 'DZ47LE', '个', '220V/40');
INSERT INTO `material` VALUES ('150106807147', '漏电开关', 'DZ47LE', '个', '220V/63');
INSERT INTO `material` VALUES ('150106807148', '节能灯', '', '个', '9W，大头螺纹');
INSERT INTO `material` VALUES ('150106807149', '防爆绕性管', '', '条', 'DN25*1000mm');
INSERT INTO `material` VALUES ('150106807332', '三相四线电器开关', '', '个', '100A');
INSERT INTO `material` VALUES ('150106807878', '配电箱', '', '台', 'AL');
INSERT INTO `material` VALUES ('150106808198', '切割机', '', '台', '');
INSERT INTO `material` VALUES ('150106808202', '电动链锯', '', '台', '');
INSERT INTO `material` VALUES ('150107805684', '进口气相高压橡胶软管(不带止回)', '', '条', 'HIS-6-6H.ST R1/4 D6×1000mm');
INSERT INTO `material` VALUES ('150107805685', '进口液相高压橡胶软管(带止回)', '', '条', 'LIHS-6-10T R1/4 D6×1000mm');
INSERT INTO `material` VALUES ('150107807025', '加气枪头', 'STAUBLI/CMV08（N01021995）', '只', '');
INSERT INTO `material` VALUES ('150203801814', '钢瓶手轮15kg', '', '个', '15kg');
INSERT INTO `material` VALUES ('150204805686', '氮气瓶', '', '个', '');
INSERT INTO `material` VALUES ('150305804473', '加液枪截止密封圈', '', '个', '0502.213');
INSERT INTO `material` VALUES ('150305806479', 'FX型不锈钢增压泵', '', '台', '50FX-28');
INSERT INTO `material` VALUES ('150305808189', '潜水泵', '', '台', '');
INSERT INTO `material` VALUES ('150401008006', '闸刀式切管机', '辉信PCG315', '台', '63-315');
INSERT INTO `material` VALUES ('150401008048', '液压夹扁器', '辉信SQT200', '个', '90-200');
INSERT INTO `material` VALUES ('150401008063', '鞍型钻刀钥匙', '辉信CUTKEY12', '个', '12.0');
INSERT INTO `material` VALUES ('150401802007', '防爆移动风机风管', '', '条', '5m');
INSERT INTO `material` VALUES ('150401805694', '带压开孔钻机', '', '个', 'PQR6000');
INSERT INTO `material` VALUES ('150401805695', '空心锯', '', '个', 'PQR6000-3″（金属管道用）');
INSERT INTO `material` VALUES ('150401805696', '空心锯', '', '个', 'PQR6000-4″（金属管道用）');
INSERT INTO `material` VALUES ('150401805697', '空心锯', '', '个', 'PQR6000-6″（金属管道用）');
INSERT INTO `material` VALUES ('150401805698', '空心锯中心钻', '', '个', 'PQR6000-3″、4″和6″（空心锯配套使用）');
INSERT INTO `material` VALUES ('150401805699', '中心钻', '', '个', '配套杯状钻头底座和PE/PVC钻头64mm(3″)使用');
INSERT INTO `material` VALUES ('150401805700', '防卡套', '', '个', '');
INSERT INTO `material` VALUES ('150401805701', '延长钻杆', '', '个', '150mm');
INSERT INTO `material` VALUES ('150401805702', '杯状钻头', '', '个', 'OD64mm（PE管90mm使用）');
INSERT INTO `material` VALUES ('150401805703', '杯状钻头', '', '个', 'OD92mm（PE管110mm使用）');
INSERT INTO `material` VALUES ('150401805704', '杯状钻头', '', '个', 'OD120mm（PE管160mm使用）');
INSERT INTO `material` VALUES ('150401805705', '杯状钻头中心钻', '', '个', 'OD92mm和OD120mm（PE管使用）');
INSERT INTO `material` VALUES ('150401805706', '杯状钻头底座', '', '个', 'OD64mm');
INSERT INTO `material` VALUES ('150401806730', '轴流防爆风机', '', '个', '400/220V');
INSERT INTO `material` VALUES ('160101007944', '施工警示牌', '', '块', '');
INSERT INTO `material` VALUES ('160101802129', '警示灯', '', '个', '10W');
INSERT INTO `material` VALUES ('160101806628', '应急疏散指示牌', '安全出口指示', '个', '');
INSERT INTO `material` VALUES ('160101806954', '户外PE管材货架', '', '个', '');
INSERT INTO `material` VALUES ('160102005878', '角钢', '', '米', '40*40*4');
INSERT INTO `material` VALUES ('160102005879', '角钢', '', '米', '50*50*5');
INSERT INTO `material` VALUES ('160102805707', '角钢', '', '米', 'L100×100×8mm');
INSERT INTO `material` VALUES ('160102805714', '槽钢', '', '米', '10#（100×43×5.3mm）');
INSERT INTO `material` VALUES ('160102805722', '钢板', '', '块', '400×400×10mm');
INSERT INTO `material` VALUES ('160102805723', '钢板', '', '块', '400×600×12mm');
INSERT INTO `material` VALUES ('160102805729', '工字钢', '', '米', '14#');
INSERT INTO `material` VALUES ('160102805732', '半圆镀锌防护板', '', '米', 'DN15');
INSERT INTO `material` VALUES ('160102806478', '镀锌角钢', '', '米', 'L50×50×4mm');
INSERT INTO `material` VALUES ('160102806995', '白铁皮', '', '平方', '0.3mm');
INSERT INTO `material` VALUES ('160201802210', '水平尺', '', '把', '');
INSERT INTO `material` VALUES ('160201802254', '八角锤', '', '把', '4P');
INSERT INTO `material` VALUES ('160201802259', '钢丝刷', '', '把', '6行');
INSERT INTO `material` VALUES ('160201802269', '螺丝批', '', '把', '');
INSERT INTO `material` VALUES ('160201802288', '剪刀', '', '把', '');
INSERT INTO `material` VALUES ('160201802310', '呆扳手', '', '把', '');
INSERT INTO `material` VALUES ('160201802311', '活动扳手', '', '把', '');
INSERT INTO `material` VALUES ('160201802312', '活动扳手', '', '把', '300');
INSERT INTO `material` VALUES ('160201802313', '活动扳手', '', '把', '250');
INSERT INTO `material` VALUES ('160201802314', '活动扳手', '', '把', '200');
INSERT INTO `material` VALUES ('160201802345', '管钳', '', '把', '450');
INSERT INTO `material` VALUES ('160201802346', '尖咀钳', '', '把', '6寸');
INSERT INTO `material` VALUES ('160201802357', '平口钳', '', '把', '');
INSERT INTO `material` VALUES ('160201802381', '工具箱', '', '个', '');
INSERT INTO `material` VALUES ('160201802396', '角磨机', '', '台', '9553');
INSERT INTO `material` VALUES ('160201802576', '冲击钻头', '', '支', '6厘');
INSERT INTO `material` VALUES ('160201804581', '电工钳', '', '把', 'L=180mm');
INSERT INTO `material` VALUES ('160201804585', '胶套尖嘴钳', '', '把', 'L=160mm');
INSERT INTO `material` VALUES ('160201804593', '大力钳/多用钳', '', '把', '220?0');
INSERT INTO `material` VALUES ('160201804601', '呆扳手(11件组)', '', '套', '5.5-32');
INSERT INTO `material` VALUES ('160201804607', '成套梅花板手', '', '套', '10件组');
INSERT INTO `material` VALUES ('160201804613', '活板手', '', '把', '100mm');
INSERT INTO `material` VALUES ('160201804617', '活板手', '', '把', '300mm');
INSERT INTO `material` VALUES ('160201804637', '管子钳', '', '把', '250mm');
INSERT INTO `material` VALUES ('160201804638', '管子钳', '', '把', '300mm');
INSERT INTO `material` VALUES ('160201804639', '管子钳', '', '把', '350mm');
INSERT INTO `material` VALUES ('160201804640', '管子钳', '', '把', '450mm');
INSERT INTO `material` VALUES ('160201804641', '管子钳', '', '把', '600mm');
INSERT INTO `material` VALUES ('160201804643', '管子钳', '', '把', '1200mm');
INSERT INTO `material` VALUES ('160201804645', '防爆管子钳(铍青铜)', '', '把', '40*300mm');
INSERT INTO `material` VALUES ('160201804648', '防爆管子钳(铍青铜)', '', '把', '75*650mm');
INSERT INTO `material` VALUES ('160201804656', '一字螺丝批', '', '把', 'YS150?');
INSERT INTO `material` VALUES ('160201804657', '一字螺丝批', '', '把', 'YS200?');
INSERT INTO `material` VALUES ('160201804660', '一字螺丝批', '', '把', 'SS100?');
INSERT INTO `material` VALUES ('160201804661', '一字螺丝批', '', '把', 'SS125?');
INSERT INTO `material` VALUES ('160201804673', '十字螺丝批', '', '把', 'SS100?');
INSERT INTO `material` VALUES ('160201804674', '十字螺丝批', '', '把', 'SS125?');
INSERT INTO `material` VALUES ('160201804677', '普通式电工刀', '', '把', '中号');
INSERT INTO `material` VALUES ('160201804678', '漆刷/油漆扫', '', '把', '25mm');
INSERT INTO `material` VALUES ('160201804680', '漆刷/油漆扫', '', '把', '10cm（4寸）');
INSERT INTO `material` VALUES ('160201804681', '漆刷/油漆扫', '', '把', '50mm');
INSERT INTO `material` VALUES ('160201804693', '台秤', '', '个', '8kg');
INSERT INTO `material` VALUES ('160201804701', '双面铝合金人字梯', '', '把', 'QLT-2-8(级)-2.05(m)');
INSERT INTO `material` VALUES ('160201804704', '砂纸', '', '张', '120目(0#)');
INSERT INTO `material` VALUES ('160201804706', '工具袋（常用）', '', '个', '');
INSERT INTO `material` VALUES ('160201804708', '工具包', '', '个', '背包式');
INSERT INTO `material` VALUES ('160201804712', '钢卷尺', '', '把', '5M');
INSERT INTO `material` VALUES ('160201804713', '钢卷尺', '', '把', '50M');
INSERT INTO `material` VALUES ('160201804716', '布卷尺', '', '把', '50M');
INSERT INTO `material` VALUES ('160201804718', '普通游标卡尺', '', '把', '');
INSERT INTO `material` VALUES ('160201804728', '小刮刀', '', '个', 'HARRIS (1 1/2)');
INSERT INTO `material` VALUES ('160201804732', '电工箱', '', '个', '');
INSERT INTO `material` VALUES ('160201804735', '电笔', '', '个', '');
INSERT INTO `material` VALUES ('160201804786', '普通梅花板手', '', '个', '41-46');
INSERT INTO `material` VALUES ('160201805736', '手电（枪）钻', '', '把', '');
INSERT INTO `material` VALUES ('160201805737', '手动葫芦', '', '台', '5吨');
INSERT INTO `material` VALUES ('160201805740', '普通手电筒', '', '个', '220V');
INSERT INTO `material` VALUES ('160201805741', '三节钻筒', '', '把', 'D76?70');
INSERT INTO `material` VALUES ('160201805742', '工程钻筒', '', '把', 'D112?00');
INSERT INTO `material` VALUES ('160201805744', '金属切割片', '', '块', '350?.2');
INSERT INTO `material` VALUES ('160201805745', '锯弓/手锯架', '', '把', '');
INSERT INTO `material` VALUES ('160201805750', '玻璃胶枪', '', '把', '');
INSERT INTO `material` VALUES ('160201806310', '割刀', '', '把', '');
INSERT INTO `material` VALUES ('160201806349', '接头', '', '个', '');
INSERT INTO `material` VALUES ('160201806708', '两用螺丝批', '', '把', '100*5');
INSERT INTO `material` VALUES ('160201806790', '圆头麻花钻咀', '', '个', '16*160');
INSERT INTO `material` VALUES ('160201807010', '胶钳', '', '把', '180MM');
INSERT INTO `material` VALUES ('160201807011', '工程水钻', '', '台', '');
INSERT INTO `material` VALUES ('160201807090', '水龙头', '', '个', 'DN15');
INSERT INTO `material` VALUES ('160201807091', '洗手盘水龙头', '', '个', 'DN15');
INSERT INTO `material` VALUES ('160201807092', '水管角阀', '', '个', 'DN15');
INSERT INTO `material` VALUES ('160201807119', '防爆型潜水泵', '50QWB20-7-0.75', '台', '');
INSERT INTO `material` VALUES ('160201807158', '手枪钻合金钻咀', '', '支', '7mm');
INSERT INTO `material` VALUES ('160201807159', '手枪钻合金钻咀', '', '支', '3mm');
INSERT INTO `material` VALUES ('160201807162', '手枪合金钻咀', '', '支', '3.5mm');
INSERT INTO `material` VALUES ('160201807164', '三爪拉马', '', '套', '250mm');
INSERT INTO `material` VALUES ('160201807167', '手枪合金钻咀', '', '支', '5.5mm');
INSERT INTO `material` VALUES ('160201807168', '手枪合金钻咀', '', '支', '4mm');
INSERT INTO `material` VALUES ('160201807175', '手枪合金钻咀', '', '支', '4.5mm');
INSERT INTO `material` VALUES ('160201807176', '手枪合金钻咀', '', '支', '5mm');
INSERT INTO `material` VALUES ('160201807177', '手枪合金钻咀', '', '支', '8.5mm');
INSERT INTO `material` VALUES ('160201807182', '手枪合金钻咀', '', '支', '6mm');
INSERT INTO `material` VALUES ('160201807183', '手枪合金钻咀', '', '支', '6.5mm');
INSERT INTO `material` VALUES ('160201807184', '手枪合金钻咀', '', '支', '7.5mm');
INSERT INTO `material` VALUES ('160201807185', '手枪合金钻咀', '', '支', '8mm');
INSERT INTO `material` VALUES ('160201807345', '拖线盘', '', '套', '');
INSERT INTO `material` VALUES ('160201807512', '实心车轮', '', '个', '12寸（含油轴承6205）');
INSERT INTO `material` VALUES ('160201807514', '砂轮片', '', '片', '100*16*2.5');
INSERT INTO `material` VALUES ('160201807517', '砂轮片', '', '片', '106*16*1.3');
INSERT INTO `material` VALUES ('160201807520', '万向轮', '', '个', '4寸');
INSERT INTO `material` VALUES ('160201807711', '胶锤', '', '个', '');
INSERT INTO `material` VALUES ('160201808130', '防爆铜锹', '', '把', '340mm*175mm*940mm');
INSERT INTO `material` VALUES ('160201808131', '防爆铜锤', '', '个', '8磅');
INSERT INTO `material` VALUES ('160201808133', '防爆十字镐', '', '把', '385mm*910mm');
INSERT INTO `material` VALUES ('160201808136', '防爆工具套装', '', '套', '');
INSERT INTO `material` VALUES ('160201808139', '钢钎', '', '把', '');
INSERT INTO `material` VALUES ('160201808187', '尖嘴钳', '', '把', '');
INSERT INTO `material` VALUES ('160201808188', '美工刀', '', '把', '');
INSERT INTO `material` VALUES ('160201808190', '冲击钻', '', '台', '');
INSERT INTO `material` VALUES ('160201808191', '磨机', '', '台', '');
INSERT INTO `material` VALUES ('160201808192', '冲击钻嘴', '', '把', '');
INSERT INTO `material` VALUES ('160201808193', '工具包', '', '个', '');
INSERT INTO `material` VALUES ('160201808194', '安全箱', '', '个', '');
INSERT INTO `material` VALUES ('160201808195', '扳手组套', '', '套', '');
INSERT INTO `material` VALUES ('160201808196', '螺丝批组套', '', '套', '');
INSERT INTO `material` VALUES ('160201808197', '半圆锉', '', '把', '');
INSERT INTO `material` VALUES ('160201808199', '套筒组套', '', '套', '');
INSERT INTO `material` VALUES ('160201808200', '钢丝钳', '', '把', '');
INSERT INTO `material` VALUES ('160201808201', '钢卷尺', '', '把', '');
INSERT INTO `material` VALUES ('160201808203', '锯条', '', '片', '');
INSERT INTO `material` VALUES ('160201808251', '红外线测温仪', '', '个', '');
INSERT INTO `material` VALUES ('160301005921', '灭火器', '', '个', '2KG');
INSERT INTO `material` VALUES ('160301005966', '消防水带、水枪', '统称码', '套', '');
INSERT INTO `material` VALUES ('160301805754', '手提式干粉灭火器', '', '个', 'ABC型-2KG');
INSERT INTO `material` VALUES ('160301805755', '手提式干粉灭火器', '', '个', 'ABC型-4KG');
INSERT INTO `material` VALUES ('160301805756', '手提式干粉灭火器', '', '个', 'ABC型-8KG');
INSERT INTO `material` VALUES ('160301805759', '推车式干粉灭火器', '', '个', 'ABC型-35KG');
INSERT INTO `material` VALUES ('160301805760', 'CO2灭火器', '', '个', '2KG');
INSERT INTO `material` VALUES ('160301805761', 'CO2灭火器', '', '个', '5KG');
INSERT INTO `material` VALUES ('160301805762', '灭火器箱', '', '个', '2KG-2具');
INSERT INTO `material` VALUES ('160301805764', '灭火器箱/消防箱', '', '个', '8KG-2具(400*620*230)');
INSERT INTO `material` VALUES ('160301805765', '灭火器专用帆布袋', '', '个', '35kg推车式专用');
INSERT INTO `material` VALUES ('160301805770', '潜水泵水带', '', '条', 'DN32?0m');
INSERT INTO `material` VALUES ('160301805773', '消防水带(带接扣)', '', '条', 'D65?0m');
INSERT INTO `material` VALUES ('160301805775', '直流水枪', '', '个', 'D65');
INSERT INTO `material` VALUES ('160301805776', '多用水枪', '', '个', 'D65');
INSERT INTO `material` VALUES ('160301805780', '《严禁烟火》安全标志牌4#', '', '块', '');
INSERT INTO `material` VALUES ('160301806824', '静电报警器', '', '套', '');
INSERT INTO `material` VALUES ('160301807211', '灭火毯', '', '张', '');
INSERT INTO `material` VALUES ('160301807515', '泡沫发生液', '', '桶', '50KG/桶');
INSERT INTO `material` VALUES ('160301807938', '安全出口标志牌', '', '块', '');
INSERT INTO `material` VALUES ('160301807939', '灭火器标志牌', '', '块', '');
INSERT INTO `material` VALUES ('160301808098', '消防栓标志牌', '', '块', '');
INSERT INTO `material` VALUES ('160302802706', '反光衣', '', '件', '均码');
INSERT INTO `material` VALUES ('160302802708', '雨衣', '', '件', '');
INSERT INTO `material` VALUES ('160302802713', '水鞋', '', '双', '');
INSERT INTO `material` VALUES ('160302802719', '帆布手套', '', '双', '');
INSERT INTO `material` VALUES ('160302802723', '草帽', '', '只', '45cm');
INSERT INTO `material` VALUES ('160302802725', '安全帽', '', '只', '');
INSERT INTO `material` VALUES ('160302802734', '安全绳', '', '条', '50m');
INSERT INTO `material` VALUES ('160302804813', '微型防爆头灯', '', '个', 'IW5130A/LT');
INSERT INTO `material` VALUES ('160302804815', 'PE一次性手套', '', '盒', '无');
INSERT INTO `material` VALUES ('160302805782', '带线防噪声耳塞', '', '个', '3M 1110');
INSERT INTO `material` VALUES ('160302805783', '耐热长皮手套', '', '付', '');
INSERT INTO `material` VALUES ('160302805789', '玛克面屏+安全帽', '', '只', '');
INSERT INTO `material` VALUES ('160302805790', '线纱手套', '', '付', '');
INSERT INTO `material` VALUES ('160302805791', '胶面线纱手套', '', '付', '');
INSERT INTO `material` VALUES ('160302805793', '工业安全鞋（法国）', '', '付', '法国利马特');
INSERT INTO `material` VALUES ('160302805794', '工业安全鞋（莱铭特）', '', '付', '黄色鞋底');
INSERT INTO `material` VALUES ('160302805795', '毛巾', '', '条', '');
INSERT INTO `material` VALUES ('160302806211', '鞋套', '', '包', '均码蓝色塑料袋');
INSERT INTO `material` VALUES ('160302806370', '防砸防刺穿安全鞋', '', '付', '');
INSERT INTO `material` VALUES ('160302806375', '军大衣', '', '件', '');
INSERT INTO `material` VALUES ('160303802745', '防护面罩', '', '件', '');
INSERT INTO `material` VALUES ('160303802755', '口罩', '', '件', '');
INSERT INTO `material` VALUES ('160303805796', 'JSP安全帽+耳罩+面屏', '', '套', '');
INSERT INTO `material` VALUES ('160303805797', '救援设备', '', '套', '');
INSERT INTO `material` VALUES ('160303805798', '3M反光背心', '', '件', '港华标志+3M反光条');
INSERT INTO `material` VALUES ('160303805799', '进口缆绳', '', '米', '');
INSERT INTO `material` VALUES ('160303806411', '路锥', '', '个', '');
INSERT INTO `material` VALUES ('160303806601', '消防战斗服', '', '套', '均码');
INSERT INTO `material` VALUES ('160303807766', '消防过滤式自救呼吸器', '', '个', '');
INSERT INTO `material` VALUES ('160401805801', '密封胶-(俗称牙膏)', '', '支', '');
INSERT INTO `material` VALUES ('160401805802', '液态密封胶', '', '支', 'MF-3');
INSERT INTO `material` VALUES ('160401805803', '大力胶', '', '卷', '');
INSERT INTO `material` VALUES ('160401805805', 'AB速固胶', '', '支', '');
INSERT INTO `material` VALUES ('160401805806', '环氧树脂胶', '', '套', '');
INSERT INTO `material` VALUES ('160401805809', '天蓝色漆油', '', '桶', '');
INSERT INTO `material` VALUES ('160401805811', '中灰酯胶磁漆', '', '桶', '3.5KG/桶');
INSERT INTO `material` VALUES ('160401805814', '银酯胶磁漆', '', '桶', 'T04-01 (2.5KG/桶)');
INSERT INTO `material` VALUES ('160401805815', '深黄醇酸磁漆', '', '桶', 'C04-2 (3.5KG/桶)');
INSERT INTO `material` VALUES ('160401805816', '红丹醇酸防锈漆', '', '桶', 'F53-31 (4.5KG/桶)');
INSERT INTO `material` VALUES ('160401805817', '白色醇酸磁漆', '', '桶', '3.5KG/桶');
INSERT INTO `material` VALUES ('160401805818', '黑色醇酸磁漆', '', '桶', '(2.8KG/桶)');
INSERT INTO `material` VALUES ('160401805819', '大红脂胶漆', '', '桶', '17KG');
INSERT INTO `material` VALUES ('160401805822', '手喷漆（银色）', '', '支', '');
INSERT INTO `material` VALUES ('160401805823', '手喷漆(红色)', '', '支', '');
INSERT INTO `material` VALUES ('160401805824', '手喷漆(白色)', '', '支', '');
INSERT INTO `material` VALUES ('160401805825', '手喷漆（黄色）', '', '支', '');
INSERT INTO `material` VALUES ('160401806724', '深绿醇酸磁漆', 'C04-2', '桶', '3.5KG/桶');
INSERT INTO `material` VALUES ('160401806726', '铁红防锈漆', '3.5KG/桶', '桶', '');
INSERT INTO `material` VALUES ('160401806904', '手喷漆（绿色）', '', '支', '');
INSERT INTO `material` VALUES ('160401806905', '手喷漆（中灰色）', '', '支', '');
INSERT INTO `material` VALUES ('160402802781', '氮气', '', '瓶', '6立方米');
INSERT INTO `material` VALUES ('160402806969', '氮气', '', '瓶', '');
INSERT INTO `material` VALUES ('160403802784', '润滑油', '', '桶', '普通');
INSERT INTO `material` VALUES ('160404802800', '紫铜片', '', '千克', '0.5mm');
INSERT INTO `material` VALUES ('160404802829', '铁线', '', '千克', '20＃');
INSERT INTO `material` VALUES ('160404802846', '玻璃布', '', '米', '');
INSERT INTO `material` VALUES ('160404802877', '玻璃胶', '', '支', '');
INSERT INTO `material` VALUES ('160404802878', '生料带', '', '卷', '20M');
INSERT INTO `material` VALUES ('160404802885', '除锈剂', '', '桶', '');
INSERT INTO `material` VALUES ('160404802892', '化油器清洗剂', '', '支', '500mm');
INSERT INTO `material` VALUES ('160404802898', '麻丝', '', '件', '');
INSERT INTO `material` VALUES ('160404805833', '加工接头', '', '个', '');
INSERT INTO `material` VALUES ('160404805837', '尼龙扎带', '', '袋', '5×250（250条/袋）');
INSERT INTO `material` VALUES ('160404805838', '尼龙扎带', '', '袋', '4×150（500条/袋）');
INSERT INTO `material` VALUES ('160404805840', '橡胶板', '', '米', '330mm(宽)*10mm(厚)');
INSERT INTO `material` VALUES ('160404805842', '尼龙绳', '', '米', '14mm');
INSERT INTO `material` VALUES ('160404805843', '焊条', '', '包', 'D2.5  CHE-422');
INSERT INTO `material` VALUES ('160404805845', '焊条', '', '包', 'D3.2  CHE-422');
INSERT INTO `material` VALUES ('160404805846', '铜片垫', '', '个', '');
INSERT INTO `material` VALUES ('160404805847', '松节水', '', '千克', '10KG/桶');
INSERT INTO `material` VALUES ('160404805848', '洗洁精', '', '千克', '');
INSERT INTO `material` VALUES ('160404805849', '力克士切削油', '', '桶', '');
INSERT INTO `material` VALUES ('160404805850', '润滑脂(俗称雪油)', '', '包', '');
INSERT INTO `material` VALUES ('160404805851', '不锈钢风机网', '', '米', '');
INSERT INTO `material` VALUES ('160404806459', '化油器清洁剂', '', '支', '450毫升');
INSERT INTO `material` VALUES ('160404807023', '不锈钢焊条', '', '包', 'D2.5');
INSERT INTO `material` VALUES ('160404807071', '风向标', '', '个', '');
INSERT INTO `material` VALUES ('160404807163', '松锈剂', '', '瓶', 'WD-40');
INSERT INTO `material` VALUES ('160404807233', '铜板', '', '块', '1000*50*0.5mm');
INSERT INTO `material` VALUES ('160404807673', '中碎布', '', '千克', '');
INSERT INTO `material` VALUES ('160404807677', '铜片', '', '块', '');
INSERT INTO `material` VALUES ('160404808186', '铁嘴', '', '个', '');
INSERT INTO `material` VALUES ('160501804832', '防爆对讲机电池', '', '块', '');
INSERT INTO `material` VALUES ('160501804833', 'IC卡', '', '张', '');
INSERT INTO `material` VALUES ('160501805853', '摩托罗拉对讲机', '', '台', 'GP328(防爆型)');
INSERT INTO `material` VALUES ('160501807130', '德胜扩音器', '', '台', '');
INSERT INTO `material` VALUES ('160701802954', '帆布', '', '平方', '大');
INSERT INTO `material` VALUES ('160701806708', '棉布', '', '张', '60*80CM');
INSERT INTO `material` VALUES ('160701807019', '帆布', '', '块', '10M*15M');
INSERT INTO `material` VALUES ('160701807496', '周转箱', '', '个', '475*360*175');
INSERT INTO `material` VALUES ('310202150005', '氮气', '', '支', '大号');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `userId` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userName` varchar(10) NOT NULL,
  `department` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UQC4E39B56786CAECE` (`email`) USING HASH,
  KEY `FKC4E39B55706CAECE` (`department`),
  KEY `FKC4E39B554FD55CFC` (`position`),
  CONSTRAINT `FKC4E39B554FD55CFC` FOREIGN KEY (`position`) REFERENCES `position` (`positionId`),
  CONSTRAINT `FKC4E39B55706CAECE` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('admin', '000000', 'admin', '1', '5', null, '47628864@qq.com');
INSERT INTO `person` VALUES ('bidding', '000000', 'Mr.Xu', '8', '4', '物料采购', 'bidding@qq.com');
INSERT INTO `person` VALUES ('GM', '000000', 'MR. Liang', null, '6', null, 'gm@qq.com');
INSERT INTO `person` VALUES ('leader', '000000', 'Mis.Li', '7', '1', '招标采购部；安全技术部', 'leader@qq.com');
INSERT INTO `person` VALUES ('manager', '000000', 'Mr.Wei', '8', '2', '', 'manager@qq.com');
INSERT INTO `person` VALUES ('manager1', '000000', 'Mr.Wang', '1', '2', null, 'willsonbin@163.com');
INSERT INTO `person` VALUES ('staff', '000000', 'Mr.He', '1', '4', null, 'staff@qq.com');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `positionId` int(11) NOT NULL AUTO_INCREMENT,
  `positionName` varchar(15) NOT NULL,
  PRIMARY KEY (`positionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '分管领导');
INSERT INTO `position` VALUES ('2', '部门经理');
INSERT INTO `position` VALUES ('3', '部门副经理');
INSERT INTO `position` VALUES ('4', '员工');
INSERT INTO `position` VALUES ('5', '管理员');
INSERT INTO `position` VALUES ('6', '总经理');

-- ----------------------------
-- Table structure for pr
-- ----------------------------
DROP TABLE IF EXISTS `pr`;
CREATE TABLE `pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyDate` datetime DEFAULT NULL,
  `ceaNum` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `prDate` date DEFAULT NULL,
  `prId` varchar(15) DEFAULT NULL,
  `project` varchar(20) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user` varchar(10) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `demandType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prId` (`prId`),
  KEY `FKE0220A887FC` (`department`),
  KEY `FKE02500BBAEE` (`user`),
  CONSTRAINT `FKE0220A887FC` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `FKE02500BBAEE` FOREIGN KEY (`user`) REFERENCES `person` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pr
-- ----------------------------
INSERT INTO `pr` VALUES ('1', null, 'CEA-1', null, '2014-09-06', null, '测试1', null, null, null, '9', '20140830220010jQueryAutocomplete.rar', '其它类');
INSERT INTO `pr` VALUES ('2', '2014-08-30 22:16:52', '', '同意 Mr.Wang 2014/8/31<br/>同意 Mis.Li 2014/9/3', '2014-09-10', 'PR-001', '测试2', '同意，请购', '5', 'bidding', '1', '20140830220010jQueryAutocomplete.rar', '其它类');
INSERT INTO `pr` VALUES ('9', null, '', null, '2014-09-18', null, 'd', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('10', '2014-09-18 16:18:41', '', '同意 Mr.Wang 2014/9/19', '2014-09-13', 'P4-555', 'e', '', '1', 'bidding', '1', null, '市政类工程');
INSERT INTO `pr` VALUES ('11', null, '', null, '2014-09-09', null, '龙江小区', null, null, null, '4', null, '其它类');
INSERT INTO `pr` VALUES ('12', null, '', null, '2014-09-10', null, '龙江小区', null, null, null, '4', null, '其它类');
INSERT INTO `pr` VALUES ('13', null, '', null, '2014-09-29', null, 'dddd', null, null, null, '1', null, '市政类工程');
INSERT INTO `pr` VALUES ('14', null, '', null, '2014-12-10', null, '测试邮件', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('15', null, '', null, '2014-12-04', null, '测试邮件2', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('16', null, '', null, '2014-12-09', null, '测试邮件3', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('17', null, '', null, '2014-12-18', null, '测试邮件4', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('18', null, '', null, '2014-12-03', null, '邮件测试', null, null, null, '1', null, '其它类');
INSERT INTO `pr` VALUES ('19', null, '', null, '2014-12-10', null, '邮件测试22', null, null, null, '1', null, '其它类');

-- ----------------------------
-- Table structure for purchasematerial
-- ----------------------------
DROP TABLE IF EXISTS `purchasematerial`;
CREATE TABLE `purchasematerial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `deadline` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `material` varchar(20) NOT NULL,
  `plan` int(11) NOT NULL,
  `prId` int(11) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `totalPay` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3CCA816828196BB0` (`plan`),
  KEY `FK3CCA81687C3F1D20` (`prId`),
  KEY `FK3CCA8168E07341A6` (`material`),
  KEY `FK3CCA8168F6846AF0` (`supplier`),
  CONSTRAINT `FK3CCA816828196BB0` FOREIGN KEY (`plan`) REFERENCES `dp` (`dpId`),
  CONSTRAINT `FK3CCA81687C3F1D20` FOREIGN KEY (`prId`) REFERENCES `pr` (`id`),
  CONSTRAINT `FK3CCA8168E07341A6` FOREIGN KEY (`material`) REFERENCES `material` (`materialId`),
  CONSTRAINT `FK3CCA8168F6846AF0` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchasematerial
-- ----------------------------
INSERT INTO `purchasematerial` VALUES ('1', '2', null, '0', '0', '110101002836', '1', '1', null, '0');
INSERT INTO `purchasematerial` VALUES ('2', '4.5', null, '0', '0', '120403000046', '1', '1', null, '0');
INSERT INTO `purchasematerial` VALUES ('3', '3', null, '4', '1', '110301807655', '2', '2', '1', '12');
INSERT INTO `purchasematerial` VALUES ('4', '5', null, '900', '1', '160303806601', '2', '2', '1', '4500');
INSERT INTO `purchasematerial` VALUES ('5', '5.9', null, '10', '1', '120303800168', '2', '2', '3', '59');
INSERT INTO `purchasematerial` VALUES ('12', '3', null, '0', '0', '110101002909', '10', '9', null, '0');
INSERT INTO `purchasematerial` VALUES ('13', '2', null, '30', '1', '141003005804', '11', '10', '3', '60');
INSERT INTO `purchasematerial` VALUES ('14', '1', null, '0', '0', '110102003004', '13', '12', null, '0');
INSERT INTO `purchasematerial` VALUES ('15', '1', null, '0', '0', '110101002909', '13', '12', null, '0');
INSERT INTO `purchasematerial` VALUES ('16', '2', null, '0', '0', '110101002836', '15', '14', null, '0');
INSERT INTO `purchasematerial` VALUES ('17', '2', null, '0', '0', '110101002852', '15', '14', null, '0');
INSERT INTO `purchasematerial` VALUES ('18', '4', null, '0', '0', '140116805333', '16', '15', null, '0');
INSERT INTO `purchasematerial` VALUES ('19', '1', null, '0', '0', '110103003033', '16', '15', null, '0');
INSERT INTO `purchasematerial` VALUES ('20', '2', null, '0', '0', '110101002828', '17', '16', null, '0');
INSERT INTO `purchasematerial` VALUES ('21', '2', null, '0', '0', '140111807601', '17', '16', null, '0');
INSERT INTO `purchasematerial` VALUES ('22', '4', null, '0', '0', '140106805321', '18', '17', null, '0');
INSERT INTO `purchasematerial` VALUES ('23', '4', null, '0', '0', '160201802210', '18', '17', null, '0');
INSERT INTO `purchasematerial` VALUES ('24', '33', null, '0', '0', '140111805325', '19', '18', null, '0');
INSERT INTO `purchasematerial` VALUES ('25', '1', null, '0', '0', '110301806599', '20', '19', null, '0');
INSERT INTO `purchasematerial` VALUES ('26', '1', null, '0', '0', '160302805789', '20', '19', null, '0');

-- ----------------------------
-- Table structure for purchaseorder
-- ----------------------------
DROP TABLE IF EXISTS `purchaseorder`;
CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(15) NOT NULL,
  `deliveryAddress` varchar(30) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `orderId` varchar(15) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `applyUser` varchar(10) DEFAULT NULL,
  `material` int(11) DEFAULT NULL,
  `totalPay` double DEFAULT '0',
  `arrivalNum` float DEFAULT '0',
  `supplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDFD4BAADD42BD75C` (`applyUser`),
  KEY `FKDFD4BAAD78C541C7` (`material`),
  KEY `FKDFD4BAADF6846AF0` (`supplier`),
  CONSTRAINT `FKDFD4BAAD78C541C7` FOREIGN KEY (`material`) REFERENCES `purchasematerial` (`id`),
  CONSTRAINT `FKDFD4BAADD42BD75C` FOREIGN KEY (`applyUser`) REFERENCES `person` (`userId`),
  CONSTRAINT `FKDFD4BAADF6846AF0` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchaseorder
-- ----------------------------
INSERT INTO `purchaseorder` VALUES ('12', '2', 'ces', '0757-22381512', 'ces', '2014-09-10', 'O3', '', '3', 'bidding', '3', '8', '2', '2');
INSERT INTO `purchaseorder` VALUES ('13', '5', 'ces', '0757-22381512', 'ces', '2014-09-10', 'O3', '', '3', 'bidding', '4', '4500', '5', '2');
INSERT INTO `purchaseorder` VALUES ('14', '1', 'ces', '0757-22381512', 'ces', '2014-09-10', 'O4', '', '0', 'bidding', '5', '0', '0', '2');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `contacts` varchar(10) DEFAULT NULL,
  `evaluation` varchar(400) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `supplierName` varchar(30) NOT NULL,
  `enableUse` bit(1) NOT NULL,
  `fax` varchar(50) NOT NULL,
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '广东省佛山市顺德区', '张三', '良好', '0757-22381512', '供应商test', '', '0757-25555555');
INSERT INTO `supplier` VALUES ('2', '广东省佛山市顺德区', '测试1', '', '0757-22381512', '测试1', '', '0757-25555555');
INSERT INTO `supplier` VALUES ('3', '广东省佛山市顺德区', '测试2', '', '0757-22381512', '测试2', '', '0757-25555555');
INSERT INTO `supplier` VALUES ('4', '广东省佛山市顺德区', '测试3', '', '0757-22381512', '测试3', '', '0757-25555555');
INSERT INTO `supplier` VALUES ('5', '广东省佛山市顺德区', '测试4', '1.不守时\r\n2.不诚信', '0757-22381512', '测试4', '', '0757-25555555');
INSERT INTO `supplier` VALUES ('6', '广东省佛山市顺德区', '测试5', '', '0757-22222222', '测试5', '', '0757-25555553');
INSERT INTO `supplier` VALUES ('10', '广东省佛山市顺德区大良鉴海北路110号', 'test1', null, '18688888888', '佛山市顺德区港华燃气有限公司', '', '0757-22381023');
