/*
Navicat MySQL Data Transfer

Source Server         : czj
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : 12306

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-06-02 11:41:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agency`
-- ----------------------------
DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `districtid` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_bin NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `windownum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agency_districtid_fk` (`districtid`),
  CONSTRAINT `agency_districtid_fk` FOREIGN KEY (`districtid`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of agency
-- ----------------------------
INSERT INTO `agency` VALUES ('1', '广铁青旅市莲路售点', '7', '广州市番禺区石基镇市莲路官涌村段41号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('2', '广州市骅星票务有限公司', '7', '广州番禺区东环街蔡二村市新路7号104', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('3', '广铁青旅大北路代售点', '7', '广州市番禺区市桥街大北路396号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('4', '番禺市桥镇粤港票务服务部', '7', '广州市番禺区市桥德胜路42号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('5', '华明票务代理服务部', '7', '番禺沙湾镇沙渡路渡头联队市场15号铺', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('6', '广州市佳满鸿商务服务有限公司', '7', '番禺区洛浦街道桔树村万兴一路北排12号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('7', '番禺区南村通缘票务服务部', '7', '广州市番禺区南村镇南阳路67号之4', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('8', '广州市桦阳商务服务有限公司', '7', '广州市番禺区桥南街桥南路174号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('9', '广州市番禺区钟村钟捷票务代理部', '7', '广州番禺区钟村镇社学西路3号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('10', '广州市番禺天地运输服务有限公司', '7', '广州市番禺区大石街105国道大石段298号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('11', '广州市天珑商务服务有限公司', '7', '广州市番禺区市桥街环城中路81号2幢1楼之二', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('12', '广州市番禺区钟村航天商务部', '7', '广州市番禺区钟村街锦绣花园北区十座30号门面', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('13', '广州市番禺区大石票务服务部', '7', '广州市番禺区大石街南大路136号第四栋109铺', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('14', '广州市番禺区沙头街罗捷票务代理店', '7', '广州市番禺区沙头街银平路8号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('15', '广州励峰铁路器材有限公司票务部', '7', '广州番禺区大山朝阳东路202号之3', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('16', '广东铁青时代大厦代售处', '7', '广州市番禺区石壁街石洲路奥园越时代大厦101-028商铺', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('17', '广州市番禺区化龙航铁票务代理服务部', '7', '广州市番禺区化龙镇龙源路2号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('18', '广州市番禺区南村路航票务服务部', '7', '广州市番禺区南村镇市新路北段228号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('19', '广州市番禺区沙湾沙捷票务代理服务部', '7', '广州市番禺区沙湾镇中华大道荷雨居476号铺', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('20', '广州市番禺区市桥街华丽票务信息咨询服务部', '7', '广州市番禺市桥解放路171号', '08:00:00', '18:00:00', '1');
INSERT INTO `agency` VALUES ('21', '广铁青旅维也纳酒店代售点', '7', '广州市番禺区大石街会江村石北工业大道自编11号C栋3号铺', '08:00:00', '18:00:00', '1');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `provinceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_province` (`provinceid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`provinceid`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '东城区', '1');
INSERT INTO `city` VALUES ('2', '西城区', '1');
INSERT INTO `city` VALUES ('3', '崇文区', '1');
INSERT INTO `city` VALUES ('4', '宣武区', '1');
INSERT INTO `city` VALUES ('5', '朝阳区', '1');
INSERT INTO `city` VALUES ('6', '丰台区', '1');
INSERT INTO `city` VALUES ('7', '石景山区', '1');
INSERT INTO `city` VALUES ('8', '海淀区', '1');
INSERT INTO `city` VALUES ('9', '门头沟区', '1');
INSERT INTO `city` VALUES ('10', '房山区', '1');
INSERT INTO `city` VALUES ('11', '通州区', '1');
INSERT INTO `city` VALUES ('12', '顺义区', '1');
INSERT INTO `city` VALUES ('13', '昌平区', '1');
INSERT INTO `city` VALUES ('14', '大兴区', '1');
INSERT INTO `city` VALUES ('15', '怀柔区', '1');
INSERT INTO `city` VALUES ('16', '平谷区', '1');
INSERT INTO `city` VALUES ('17', '密云县', '1');
INSERT INTO `city` VALUES ('18', '延庆县', '1');
INSERT INTO `city` VALUES ('19', '和平区', '2');
INSERT INTO `city` VALUES ('20', '河东区', '2');
INSERT INTO `city` VALUES ('21', '河西区', '2');
INSERT INTO `city` VALUES ('22', '南开区', '2');
INSERT INTO `city` VALUES ('23', '河北区', '2');
INSERT INTO `city` VALUES ('24', '红桥区', '2');
INSERT INTO `city` VALUES ('25', '塘沽区', '2');
INSERT INTO `city` VALUES ('26', '汉沽区', '2');
INSERT INTO `city` VALUES ('27', '大港区', '2');
INSERT INTO `city` VALUES ('28', '东丽区', '2');
INSERT INTO `city` VALUES ('29', '西青区', '2');
INSERT INTO `city` VALUES ('30', '津南区', '2');
INSERT INTO `city` VALUES ('31', '北辰区', '2');
INSERT INTO `city` VALUES ('32', '武清区', '2');
INSERT INTO `city` VALUES ('33', '宝坻区', '2');
INSERT INTO `city` VALUES ('34', '宁河县', '2');
INSERT INTO `city` VALUES ('35', '静海县', '2');
INSERT INTO `city` VALUES ('36', '蓟县', '2');
INSERT INTO `city` VALUES ('37', '石家庄', '3');
INSERT INTO `city` VALUES ('38', '唐山', '3');
INSERT INTO `city` VALUES ('39', '秦皇岛', '3');
INSERT INTO `city` VALUES ('40', '邯郸', '3');
INSERT INTO `city` VALUES ('41', '邢台', '3');
INSERT INTO `city` VALUES ('42', '保定', '3');
INSERT INTO `city` VALUES ('43', '张家口', '3');
INSERT INTO `city` VALUES ('44', '承德', '3');
INSERT INTO `city` VALUES ('45', '沧州', '3');
INSERT INTO `city` VALUES ('46', '廊坊', '3');
INSERT INTO `city` VALUES ('47', '衡水', '3');
INSERT INTO `city` VALUES ('48', '太原', '4');
INSERT INTO `city` VALUES ('49', '大同', '4');
INSERT INTO `city` VALUES ('50', '阳泉', '4');
INSERT INTO `city` VALUES ('51', '长治', '4');
INSERT INTO `city` VALUES ('52', '晋城', '4');
INSERT INTO `city` VALUES ('53', '朔州', '4');
INSERT INTO `city` VALUES ('54', '晋中', '4');
INSERT INTO `city` VALUES ('55', '运城', '4');
INSERT INTO `city` VALUES ('56', '忻州', '4');
INSERT INTO `city` VALUES ('57', '临汾', '4');
INSERT INTO `city` VALUES ('58', '吕梁', '4');
INSERT INTO `city` VALUES ('59', '呼和浩特', '5');
INSERT INTO `city` VALUES ('60', '包头', '5');
INSERT INTO `city` VALUES ('61', '乌海', '5');
INSERT INTO `city` VALUES ('62', '赤峰', '5');
INSERT INTO `city` VALUES ('63', '通辽', '5');
INSERT INTO `city` VALUES ('64', '鄂尔多斯', '5');
INSERT INTO `city` VALUES ('65', '呼伦贝尔', '5');
INSERT INTO `city` VALUES ('66', '巴彦淖尔', '5');
INSERT INTO `city` VALUES ('67', '乌兰察布', '5');
INSERT INTO `city` VALUES ('68', '兴安盟', '5');
INSERT INTO `city` VALUES ('69', '锡林郭勒盟', '5');
INSERT INTO `city` VALUES ('70', '阿拉善盟', '5');
INSERT INTO `city` VALUES ('71', '沈阳', '6');
INSERT INTO `city` VALUES ('72', '大连', '6');
INSERT INTO `city` VALUES ('73', '鞍山', '6');
INSERT INTO `city` VALUES ('74', '抚顺', '6');
INSERT INTO `city` VALUES ('75', '本溪', '6');
INSERT INTO `city` VALUES ('76', '丹东', '6');
INSERT INTO `city` VALUES ('77', '锦州', '6');
INSERT INTO `city` VALUES ('78', '营口', '6');
INSERT INTO `city` VALUES ('79', '阜新', '6');
INSERT INTO `city` VALUES ('80', '辽阳', '6');
INSERT INTO `city` VALUES ('81', '盘锦', '6');
INSERT INTO `city` VALUES ('82', '铁岭', '6');
INSERT INTO `city` VALUES ('83', '朝阳', '6');
INSERT INTO `city` VALUES ('84', '葫芦岛', '6');
INSERT INTO `city` VALUES ('85', '长春', '7');
INSERT INTO `city` VALUES ('86', '吉林', '7');
INSERT INTO `city` VALUES ('87', '四平', '7');
INSERT INTO `city` VALUES ('88', '辽源', '7');
INSERT INTO `city` VALUES ('89', '通化', '7');
INSERT INTO `city` VALUES ('90', '白山', '7');
INSERT INTO `city` VALUES ('91', '松原', '7');
INSERT INTO `city` VALUES ('92', '白城', '7');
INSERT INTO `city` VALUES ('93', '延边', '7');
INSERT INTO `city` VALUES ('94', '哈尔滨', '8');
INSERT INTO `city` VALUES ('95', '齐齐哈尔', '8');
INSERT INTO `city` VALUES ('96', '鸡西', '8');
INSERT INTO `city` VALUES ('97', '鹤岗', '8');
INSERT INTO `city` VALUES ('98', '双鸭山', '8');
INSERT INTO `city` VALUES ('99', '大庆', '8');
INSERT INTO `city` VALUES ('100', '伊春', '8');
INSERT INTO `city` VALUES ('101', '佳木斯', '8');
INSERT INTO `city` VALUES ('102', '七台河', '8');
INSERT INTO `city` VALUES ('103', '牡丹江', '8');
INSERT INTO `city` VALUES ('104', '黑河', '8');
INSERT INTO `city` VALUES ('105', '绥化', '8');
INSERT INTO `city` VALUES ('106', '大兴安岭', '8');
INSERT INTO `city` VALUES ('107', '黄浦区', '9');
INSERT INTO `city` VALUES ('108', '卢湾区', '9');
INSERT INTO `city` VALUES ('109', '徐汇区', '9');
INSERT INTO `city` VALUES ('110', '长宁区', '9');
INSERT INTO `city` VALUES ('111', '静安区', '9');
INSERT INTO `city` VALUES ('112', '普陀区', '9');
INSERT INTO `city` VALUES ('113', '闸北区', '9');
INSERT INTO `city` VALUES ('114', '虹口区', '9');
INSERT INTO `city` VALUES ('115', '杨浦区', '9');
INSERT INTO `city` VALUES ('116', '闵行区', '9');
INSERT INTO `city` VALUES ('117', '宝山区', '9');
INSERT INTO `city` VALUES ('118', '嘉定区', '9');
INSERT INTO `city` VALUES ('119', '浦东新区', '9');
INSERT INTO `city` VALUES ('120', '金山区', '9');
INSERT INTO `city` VALUES ('121', '松江区', '9');
INSERT INTO `city` VALUES ('122', '青浦区', '9');
INSERT INTO `city` VALUES ('123', '南汇区', '9');
INSERT INTO `city` VALUES ('124', '奉贤区', '9');
INSERT INTO `city` VALUES ('125', '崇明县', '9');
INSERT INTO `city` VALUES ('126', '南京', '10');
INSERT INTO `city` VALUES ('127', '无锡', '10');
INSERT INTO `city` VALUES ('128', '徐州', '10');
INSERT INTO `city` VALUES ('129', '常州', '10');
INSERT INTO `city` VALUES ('130', '苏州', '10');
INSERT INTO `city` VALUES ('131', '南通', '10');
INSERT INTO `city` VALUES ('132', '连云港', '10');
INSERT INTO `city` VALUES ('133', '淮安', '10');
INSERT INTO `city` VALUES ('134', '盐城', '10');
INSERT INTO `city` VALUES ('135', '扬州', '10');
INSERT INTO `city` VALUES ('136', '镇江', '10');
INSERT INTO `city` VALUES ('137', '泰州', '10');
INSERT INTO `city` VALUES ('138', '宿迁', '10');
INSERT INTO `city` VALUES ('139', '杭州', '11');
INSERT INTO `city` VALUES ('140', '宁波', '11');
INSERT INTO `city` VALUES ('141', '温州', '11');
INSERT INTO `city` VALUES ('142', '嘉兴', '11');
INSERT INTO `city` VALUES ('143', '湖州', '11');
INSERT INTO `city` VALUES ('144', '绍兴', '11');
INSERT INTO `city` VALUES ('145', '金华', '11');
INSERT INTO `city` VALUES ('146', '衢州', '11');
INSERT INTO `city` VALUES ('147', '舟山', '11');
INSERT INTO `city` VALUES ('148', '台州', '11');
INSERT INTO `city` VALUES ('149', '丽水', '11');
INSERT INTO `city` VALUES ('150', '合肥', '12');
INSERT INTO `city` VALUES ('151', '芜湖', '12');
INSERT INTO `city` VALUES ('152', '蚌埠', '12');
INSERT INTO `city` VALUES ('153', '淮南', '12');
INSERT INTO `city` VALUES ('154', '马鞍山', '12');
INSERT INTO `city` VALUES ('155', '淮北', '12');
INSERT INTO `city` VALUES ('156', '铜陵', '12');
INSERT INTO `city` VALUES ('157', '安庆', '12');
INSERT INTO `city` VALUES ('158', '黄山', '12');
INSERT INTO `city` VALUES ('159', '滁州', '12');
INSERT INTO `city` VALUES ('160', '阜阳', '12');
INSERT INTO `city` VALUES ('161', '宿州', '12');
INSERT INTO `city` VALUES ('162', '巢湖', '12');
INSERT INTO `city` VALUES ('163', '六安', '12');
INSERT INTO `city` VALUES ('164', '亳州', '12');
INSERT INTO `city` VALUES ('165', '池州', '12');
INSERT INTO `city` VALUES ('166', '宣城', '12');
INSERT INTO `city` VALUES ('167', '福州', '13');
INSERT INTO `city` VALUES ('168', '厦门', '13');
INSERT INTO `city` VALUES ('169', '莆田', '13');
INSERT INTO `city` VALUES ('170', '三明', '13');
INSERT INTO `city` VALUES ('171', '泉州', '13');
INSERT INTO `city` VALUES ('172', '漳州', '13');
INSERT INTO `city` VALUES ('173', '南平', '13');
INSERT INTO `city` VALUES ('174', '龙岩', '13');
INSERT INTO `city` VALUES ('175', '宁德', '13');
INSERT INTO `city` VALUES ('176', '南昌', '14');
INSERT INTO `city` VALUES ('177', '景德镇', '14');
INSERT INTO `city` VALUES ('178', '萍乡', '14');
INSERT INTO `city` VALUES ('179', '九江', '14');
INSERT INTO `city` VALUES ('180', '新余', '14');
INSERT INTO `city` VALUES ('181', '鹰潭', '14');
INSERT INTO `city` VALUES ('182', '赣州', '14');
INSERT INTO `city` VALUES ('183', '吉安', '14');
INSERT INTO `city` VALUES ('184', '宜春', '14');
INSERT INTO `city` VALUES ('185', '抚州', '14');
INSERT INTO `city` VALUES ('186', '上饶', '14');
INSERT INTO `city` VALUES ('187', '济南', '15');
INSERT INTO `city` VALUES ('188', '青岛', '15');
INSERT INTO `city` VALUES ('189', '淄博', '15');
INSERT INTO `city` VALUES ('190', '枣庄', '15');
INSERT INTO `city` VALUES ('191', '东营', '15');
INSERT INTO `city` VALUES ('192', '烟台', '15');
INSERT INTO `city` VALUES ('193', '潍坊', '15');
INSERT INTO `city` VALUES ('194', '济宁', '15');
INSERT INTO `city` VALUES ('195', '泰安', '15');
INSERT INTO `city` VALUES ('196', '威海', '15');
INSERT INTO `city` VALUES ('197', '日照', '15');
INSERT INTO `city` VALUES ('198', '莱芜', '15');
INSERT INTO `city` VALUES ('199', '临沂', '15');
INSERT INTO `city` VALUES ('200', '德州', '15');
INSERT INTO `city` VALUES ('201', '聊城', '15');
INSERT INTO `city` VALUES ('202', '滨州', '15');
INSERT INTO `city` VALUES ('203', '荷泽', '15');
INSERT INTO `city` VALUES ('204', '郑州', '16');
INSERT INTO `city` VALUES ('205', '开封', '16');
INSERT INTO `city` VALUES ('206', '洛阳', '16');
INSERT INTO `city` VALUES ('207', '平顶山', '16');
INSERT INTO `city` VALUES ('208', '安阳', '16');
INSERT INTO `city` VALUES ('209', '鹤壁', '16');
INSERT INTO `city` VALUES ('210', '新乡', '16');
INSERT INTO `city` VALUES ('211', '焦作', '16');
INSERT INTO `city` VALUES ('212', '濮阳', '16');
INSERT INTO `city` VALUES ('213', '许昌', '16');
INSERT INTO `city` VALUES ('214', '漯河', '16');
INSERT INTO `city` VALUES ('215', '三门峡', '16');
INSERT INTO `city` VALUES ('216', '南阳', '16');
INSERT INTO `city` VALUES ('217', '商丘', '16');
INSERT INTO `city` VALUES ('218', '信阳', '16');
INSERT INTO `city` VALUES ('219', '周口', '16');
INSERT INTO `city` VALUES ('220', '驻马店', '16');
INSERT INTO `city` VALUES ('221', '武汉', '17');
INSERT INTO `city` VALUES ('222', '黄石', '17');
INSERT INTO `city` VALUES ('223', '十堰', '17');
INSERT INTO `city` VALUES ('224', '宜昌', '17');
INSERT INTO `city` VALUES ('225', '襄樊', '17');
INSERT INTO `city` VALUES ('226', '鄂州', '17');
INSERT INTO `city` VALUES ('227', '荆门', '17');
INSERT INTO `city` VALUES ('228', '孝感', '17');
INSERT INTO `city` VALUES ('229', '荆州', '17');
INSERT INTO `city` VALUES ('230', '黄冈', '17');
INSERT INTO `city` VALUES ('231', '咸宁', '17');
INSERT INTO `city` VALUES ('232', '随州', '17');
INSERT INTO `city` VALUES ('233', '恩施', '17');
INSERT INTO `city` VALUES ('234', '神农架', '17');
INSERT INTO `city` VALUES ('235', '长沙', '18');
INSERT INTO `city` VALUES ('236', '株洲', '18');
INSERT INTO `city` VALUES ('237', '湘潭', '18');
INSERT INTO `city` VALUES ('238', '衡阳', '18');
INSERT INTO `city` VALUES ('239', '邵阳', '18');
INSERT INTO `city` VALUES ('240', '岳阳', '18');
INSERT INTO `city` VALUES ('241', '常德', '18');
INSERT INTO `city` VALUES ('242', '张家界', '18');
INSERT INTO `city` VALUES ('243', '益阳', '18');
INSERT INTO `city` VALUES ('244', '郴州', '18');
INSERT INTO `city` VALUES ('245', '永州', '18');
INSERT INTO `city` VALUES ('246', '怀化', '18');
INSERT INTO `city` VALUES ('247', '娄底', '18');
INSERT INTO `city` VALUES ('248', '湘西', '18');
INSERT INTO `city` VALUES ('249', '广州', '19');
INSERT INTO `city` VALUES ('250', '韶关', '19');
INSERT INTO `city` VALUES ('251', '深圳', '19');
INSERT INTO `city` VALUES ('252', '珠海', '19');
INSERT INTO `city` VALUES ('253', '汕头', '19');
INSERT INTO `city` VALUES ('254', '佛山', '19');
INSERT INTO `city` VALUES ('255', '江门', '19');
INSERT INTO `city` VALUES ('256', '湛江', '19');
INSERT INTO `city` VALUES ('257', '茂名', '19');
INSERT INTO `city` VALUES ('258', '肇庆', '19');
INSERT INTO `city` VALUES ('259', '惠州', '19');
INSERT INTO `city` VALUES ('260', '梅州', '19');
INSERT INTO `city` VALUES ('261', '汕尾', '19');
INSERT INTO `city` VALUES ('262', '河源', '19');
INSERT INTO `city` VALUES ('263', '阳江', '19');
INSERT INTO `city` VALUES ('264', '清远', '19');
INSERT INTO `city` VALUES ('265', '东莞', '19');
INSERT INTO `city` VALUES ('266', '中山', '19');
INSERT INTO `city` VALUES ('267', '潮州', '19');
INSERT INTO `city` VALUES ('268', '揭阳', '19');
INSERT INTO `city` VALUES ('269', '云浮', '19');
INSERT INTO `city` VALUES ('270', '南宁', '20');
INSERT INTO `city` VALUES ('271', '柳州', '20');
INSERT INTO `city` VALUES ('272', '桂林', '20');
INSERT INTO `city` VALUES ('273', '梧州', '20');
INSERT INTO `city` VALUES ('274', '北海', '20');
INSERT INTO `city` VALUES ('275', '防城港', '20');
INSERT INTO `city` VALUES ('276', '钦州', '20');
INSERT INTO `city` VALUES ('277', '贵港', '20');
INSERT INTO `city` VALUES ('278', '玉林', '20');
INSERT INTO `city` VALUES ('279', '百色', '20');
INSERT INTO `city` VALUES ('280', '贺州', '20');
INSERT INTO `city` VALUES ('281', '河池', '20');
INSERT INTO `city` VALUES ('282', '来宾', '20');
INSERT INTO `city` VALUES ('283', '崇左', '20');
INSERT INTO `city` VALUES ('284', '海口', '21');
INSERT INTO `city` VALUES ('285', '三亚', '21');
INSERT INTO `city` VALUES ('286', '重庆', '22');
INSERT INTO `city` VALUES ('287', '万州区', '22');
INSERT INTO `city` VALUES ('288', '涪陵区', '22');
INSERT INTO `city` VALUES ('289', '渝中区', '22');
INSERT INTO `city` VALUES ('290', '大渡口区', '22');
INSERT INTO `city` VALUES ('291', '江北区', '22');
INSERT INTO `city` VALUES ('292', '沙坪坝区', '22');
INSERT INTO `city` VALUES ('293', '九龙坡区', '22');
INSERT INTO `city` VALUES ('294', '南岸区', '22');
INSERT INTO `city` VALUES ('295', '北碚区', '22');
INSERT INTO `city` VALUES ('296', '万盛区', '22');
INSERT INTO `city` VALUES ('297', '双桥区', '22');
INSERT INTO `city` VALUES ('298', '渝北区', '22');
INSERT INTO `city` VALUES ('299', '巴南区', '22');
INSERT INTO `city` VALUES ('300', '黔江区', '22');
INSERT INTO `city` VALUES ('301', '长寿区', '22');
INSERT INTO `city` VALUES ('302', '綦江县', '22');
INSERT INTO `city` VALUES ('303', '潼南县', '22');
INSERT INTO `city` VALUES ('304', '铜梁县', '22');
INSERT INTO `city` VALUES ('305', '大足县', '22');
INSERT INTO `city` VALUES ('306', '荣昌县', '22');
INSERT INTO `city` VALUES ('307', '璧山县', '22');
INSERT INTO `city` VALUES ('308', '梁平县', '22');
INSERT INTO `city` VALUES ('309', '城口县', '22');
INSERT INTO `city` VALUES ('310', '丰都县', '22');
INSERT INTO `city` VALUES ('311', '垫江县', '22');
INSERT INTO `city` VALUES ('312', '武隆县', '22');
INSERT INTO `city` VALUES ('313', '忠县', '22');
INSERT INTO `city` VALUES ('314', '开县', '22');
INSERT INTO `city` VALUES ('315', '云阳县', '22');
INSERT INTO `city` VALUES ('316', '奉节县', '22');
INSERT INTO `city` VALUES ('317', '巫山县', '22');
INSERT INTO `city` VALUES ('318', '巫溪县', '22');
INSERT INTO `city` VALUES ('319', '石柱土家族自治县', '22');
INSERT INTO `city` VALUES ('320', '秀山土家族苗族自治县', '22');
INSERT INTO `city` VALUES ('321', '酉阳土家族苗族自治县', '22');
INSERT INTO `city` VALUES ('322', '彭水苗族土家族自治县', '22');
INSERT INTO `city` VALUES ('323', '江津', '22');
INSERT INTO `city` VALUES ('324', '合川', '22');
INSERT INTO `city` VALUES ('325', '永川', '22');
INSERT INTO `city` VALUES ('326', '南川', '22');
INSERT INTO `city` VALUES ('327', '成都', '23');
INSERT INTO `city` VALUES ('328', '自贡', '23');
INSERT INTO `city` VALUES ('329', '攀枝花', '23');
INSERT INTO `city` VALUES ('330', '泸州', '23');
INSERT INTO `city` VALUES ('331', '德阳', '23');
INSERT INTO `city` VALUES ('332', '绵阳', '23');
INSERT INTO `city` VALUES ('333', '广元', '23');
INSERT INTO `city` VALUES ('334', '遂宁', '23');
INSERT INTO `city` VALUES ('335', '内江', '23');
INSERT INTO `city` VALUES ('336', '乐山', '23');
INSERT INTO `city` VALUES ('337', '南充', '23');
INSERT INTO `city` VALUES ('338', '眉山', '23');
INSERT INTO `city` VALUES ('339', '宜宾', '23');
INSERT INTO `city` VALUES ('340', '广安', '23');
INSERT INTO `city` VALUES ('341', '达州', '23');
INSERT INTO `city` VALUES ('342', '雅安', '23');
INSERT INTO `city` VALUES ('343', '巴中', '23');
INSERT INTO `city` VALUES ('344', '资阳', '23');
INSERT INTO `city` VALUES ('345', '阿坝', '23');
INSERT INTO `city` VALUES ('346', '甘孜', '23');
INSERT INTO `city` VALUES ('347', '凉山', '23');
INSERT INTO `city` VALUES ('348', '贵阳', '24');
INSERT INTO `city` VALUES ('349', '六盘水', '24');
INSERT INTO `city` VALUES ('350', '遵义', '24');
INSERT INTO `city` VALUES ('351', '安顺', '24');
INSERT INTO `city` VALUES ('352', '铜仁', '24');
INSERT INTO `city` VALUES ('353', '黔西南', '24');
INSERT INTO `city` VALUES ('354', '毕节', '24');
INSERT INTO `city` VALUES ('355', '黔东南', '24');
INSERT INTO `city` VALUES ('356', '黔南', '24');
INSERT INTO `city` VALUES ('357', '昆明', '25');
INSERT INTO `city` VALUES ('358', '曲靖', '25');
INSERT INTO `city` VALUES ('359', '玉溪', '25');
INSERT INTO `city` VALUES ('360', '保山', '25');
INSERT INTO `city` VALUES ('361', '昭通', '25');
INSERT INTO `city` VALUES ('362', '丽江', '25');
INSERT INTO `city` VALUES ('363', '思茅', '25');
INSERT INTO `city` VALUES ('364', '临沧', '25');
INSERT INTO `city` VALUES ('365', '楚雄', '25');
INSERT INTO `city` VALUES ('366', '红河', '25');
INSERT INTO `city` VALUES ('367', '文山', '25');
INSERT INTO `city` VALUES ('368', '西双版纳', '25');
INSERT INTO `city` VALUES ('369', '大理', '25');
INSERT INTO `city` VALUES ('370', '德宏', '25');
INSERT INTO `city` VALUES ('371', '怒江', '25');
INSERT INTO `city` VALUES ('372', '迪庆', '25');
INSERT INTO `city` VALUES ('373', '拉萨', '26');
INSERT INTO `city` VALUES ('374', '昌都', '26');
INSERT INTO `city` VALUES ('375', '山南', '26');
INSERT INTO `city` VALUES ('376', '日喀则', '26');
INSERT INTO `city` VALUES ('377', '那曲', '26');
INSERT INTO `city` VALUES ('378', '阿里', '26');
INSERT INTO `city` VALUES ('379', '林芝', '26');
INSERT INTO `city` VALUES ('380', '西安', '27');
INSERT INTO `city` VALUES ('381', '铜川', '27');
INSERT INTO `city` VALUES ('382', '宝鸡', '27');
INSERT INTO `city` VALUES ('383', '咸阳', '27');
INSERT INTO `city` VALUES ('384', '渭南', '27');
INSERT INTO `city` VALUES ('385', '延安', '27');
INSERT INTO `city` VALUES ('386', '汉中', '27');
INSERT INTO `city` VALUES ('387', '榆林', '27');
INSERT INTO `city` VALUES ('388', '安康', '27');
INSERT INTO `city` VALUES ('389', '商洛', '27');
INSERT INTO `city` VALUES ('390', '兰州', '28');
INSERT INTO `city` VALUES ('391', '嘉峪关', '28');
INSERT INTO `city` VALUES ('392', '金昌', '28');
INSERT INTO `city` VALUES ('393', '白银', '28');
INSERT INTO `city` VALUES ('394', '天水', '28');
INSERT INTO `city` VALUES ('395', '武威', '28');
INSERT INTO `city` VALUES ('396', '张掖', '28');
INSERT INTO `city` VALUES ('397', '平凉', '28');
INSERT INTO `city` VALUES ('398', '酒泉', '28');
INSERT INTO `city` VALUES ('399', '庆阳', '28');
INSERT INTO `city` VALUES ('400', '定西', '28');
INSERT INTO `city` VALUES ('401', '陇南', '28');
INSERT INTO `city` VALUES ('402', '临夏', '28');
INSERT INTO `city` VALUES ('403', '甘南', '28');
INSERT INTO `city` VALUES ('404', '西宁', '29');
INSERT INTO `city` VALUES ('405', '海东', '29');
INSERT INTO `city` VALUES ('406', '海北', '29');
INSERT INTO `city` VALUES ('407', '黄南', '29');
INSERT INTO `city` VALUES ('408', '海南', '29');
INSERT INTO `city` VALUES ('409', '果洛', '29');
INSERT INTO `city` VALUES ('410', '玉树', '29');
INSERT INTO `city` VALUES ('411', '海西', '29');
INSERT INTO `city` VALUES ('412', '银川', '30');
INSERT INTO `city` VALUES ('413', '石嘴山', '30');
INSERT INTO `city` VALUES ('414', '吴忠', '30');
INSERT INTO `city` VALUES ('415', '固原', '30');
INSERT INTO `city` VALUES ('416', '中卫', '30');
INSERT INTO `city` VALUES ('417', '乌鲁木齐', '31');
INSERT INTO `city` VALUES ('418', '克拉玛依', '31');
INSERT INTO `city` VALUES ('419', '吐鲁番', '31');
INSERT INTO `city` VALUES ('420', '哈密', '31');
INSERT INTO `city` VALUES ('421', '昌吉', '31');
INSERT INTO `city` VALUES ('422', '博尔塔拉', '31');
INSERT INTO `city` VALUES ('423', '巴音郭楞', '31');
INSERT INTO `city` VALUES ('424', '阿克苏', '31');
INSERT INTO `city` VALUES ('425', '克孜勒苏', '31');
INSERT INTO `city` VALUES ('426', '喀什', '31');
INSERT INTO `city` VALUES ('427', '和田', '31');
INSERT INTO `city` VALUES ('428', '伊犁', '31');
INSERT INTO `city` VALUES ('429', '塔城', '31');
INSERT INTO `city` VALUES ('430', '阿勒泰', '31');
INSERT INTO `city` VALUES ('431', '石河子', '31');
INSERT INTO `city` VALUES ('432', '阿拉尔', '31');
INSERT INTO `city` VALUES ('433', '图木舒克', '31');
INSERT INTO `city` VALUES ('434', '五家渠', '31');
INSERT INTO `city` VALUES ('435', '香港', '32');
INSERT INTO `city` VALUES ('436', '澳门', '33');
INSERT INTO `city` VALUES ('437', '台湾', '34');
INSERT INTO `city` VALUES ('438', '北京', '1');
INSERT INTO `city` VALUES ('439', '上海', '9');
INSERT INTO `city` VALUES ('440', '定州', '3');
INSERT INTO `city` VALUES ('441', '耒阳', '18');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `idtypeid` int(11) NOT NULL,
  `idcardnum` varchar(255) COLLATE utf8_bin NOT NULL,
  `sex` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phonenum` varchar(255) COLLATE utf8_bin NOT NULL,
  `touristtypeid` int(11) NOT NULL,
  `provinceid` int(11) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  `academy` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `classes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `studentnum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `schoollength` int(11) DEFAULT NULL,
  `enterschoolyear` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `discountnum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `startcityid` int(11) DEFAULT NULL,
  `endcityid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `ismaincontact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_idtypeid_fk` (`idtypeid`),
  KEY `contact_countryid_fk` (`countryid`),
  KEY `contact_touristtypeid_fk` (`touristtypeid`),
  KEY `contact_provinceid_fk` (`provinceid`),
  KEY `contact_schoolid_fk` (`schoolid`),
  KEY `contact_startcityid_fk` (`startcityid`),
  KEY `contact_endcityid_fk` (`endcityid`),
  KEY `contact_userid_fk` (`userid`),
  CONSTRAINT `contact_countryid_fk` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`),
  CONSTRAINT `contact_endcityid_fk` FOREIGN KEY (`endcityid`) REFERENCES `city` (`id`),
  CONSTRAINT `contact_idtypeid_fk` FOREIGN KEY (`idtypeid`) REFERENCES `idtype` (`id`),
  CONSTRAINT `contact_provinceid_fk` FOREIGN KEY (`provinceid`) REFERENCES `province` (`id`),
  CONSTRAINT `contact_schoolid_fk` FOREIGN KEY (`schoolid`) REFERENCES `school` (`id`),
  CONSTRAINT `contact_startcityid_fk` FOREIGN KEY (`startcityid`) REFERENCES `city` (`id`),
  CONSTRAINT `contact_touristtypeid_fk` FOREIGN KEY (`touristtypeid`) REFERENCES `touristtype` (`id`),
  CONSTRAINT `contact_userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '张三', '1', '4412831993092929', '男', '1', '2017-10-04', '1077777@qq.com', '229394', '1', '1', null, '', '', null, null, null, null, '4', '2', '1', '0');
INSERT INTO `contact` VALUES ('2', 'root', '1', '4156765672454541', '女', '1', '1991-01-01', '21212121@qq.com', '1234532', '3', null, null, null, null, null, null, null, null, null, null, '1', '1');
INSERT INTO `contact` VALUES ('3', 'ccc', '1', '4546241523142321', '女', '1', '1998-01-01', '21726176@qq.com', '6754343', '3', null, null, null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `contact` VALUES ('4', 'admin', '1', '6746554351453445', '女', '1', '1992-01-01', '1786876@qq.com', '7821362718', '3', null, null, null, null, null, null, null, null, null, null, '2', '1');
INSERT INTO `contact` VALUES ('7', 'zzz', '1', '6245142525167762', '女', '1', '1998-01-01', '6715615@qq.com', '8768787', '3', '1', '1', null, null, '534163461', '4', '2017', null, null, null, '2', '0');
INSERT INTO `contact` VALUES ('8', 'jjj', '1', '3213231243431113', '男', '1', '1993-01-01', '213131@qq.com', '32321312', '3', null, null, null, null, null, null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name_uk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', '中国');
INSERT INTO `country` VALUES ('9', '伊朗');
INSERT INTO `country` VALUES ('4', '俄罗斯');
INSERT INTO `country` VALUES ('15', '印度尼西亚');
INSERT INTO `country` VALUES ('17', '叙利亚');
INSERT INTO `country` VALUES ('20', '古巴');
INSERT INTO `country` VALUES ('18', '巴基斯坦');
INSERT INTO `country` VALUES ('19', '巴西');
INSERT INTO `country` VALUES ('16', '德国');
INSERT INTO `country` VALUES ('6', '日本');
INSERT INTO `country` VALUES ('10', '朝鲜');
INSERT INTO `country` VALUES ('5', '法国');
INSERT INTO `country` VALUES ('12', '泰国');
INSERT INTO `country` VALUES ('7', '瑞士');
INSERT INTO `country` VALUES ('14', '缅甸');
INSERT INTO `country` VALUES ('2', '美国');
INSERT INTO `country` VALUES ('13', '老挝');
INSERT INTO `country` VALUES ('3', '英国');
INSERT INTO `country` VALUES ('21', '荷兰');
INSERT INTO `country` VALUES ('11', '越南');
INSERT INTO `country` VALUES ('8', '韩国');

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `cityid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_cityid_fk` (`cityid`),
  CONSTRAINT `district_cityid_fk` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '荔湾区', '249');
INSERT INTO `district` VALUES ('2', '越秀区', '249');
INSERT INTO `district` VALUES ('3', '海珠区', '249');
INSERT INTO `district` VALUES ('4', '天河区', '249');
INSERT INTO `district` VALUES ('5', '白云区', '249');
INSERT INTO `district` VALUES ('6', '黄埔区', '249');
INSERT INTO `district` VALUES ('7', '番禺区', '249');
INSERT INTO `district` VALUES ('8', '花都区', '249');
INSERT INTO `district` VALUES ('9', '南沙区', '249');
INSERT INTO `district` VALUES ('10', '增城区', '249');
INSERT INTO `district` VALUES ('11', '从化区', '249');
INSERT INTO `district` VALUES ('12', '罗湖区', '251');
INSERT INTO `district` VALUES ('13', '福田区', '251');
INSERT INTO `district` VALUES ('14', '南山区', '251');
INSERT INTO `district` VALUES ('15', '宝安区', '251');
INSERT INTO `district` VALUES ('16', '龙岗区', '251');
INSERT INTO `district` VALUES ('17', '盐田区', '251');
INSERT INTO `district` VALUES ('18', '坪山区', '251');
INSERT INTO `district` VALUES ('19', '龙华区', '251');
INSERT INTO `district` VALUES ('20', '湘桥区', '267');
INSERT INTO `district` VALUES ('21', '潮安区', '267');
INSERT INTO `district` VALUES ('22', '饶平区', '267');
INSERT INTO `district` VALUES ('23', '龙湖区', '253');
INSERT INTO `district` VALUES ('24', '金平区', '253');
INSERT INTO `district` VALUES ('25', '濠江区', '253');
INSERT INTO `district` VALUES ('26', '潮阳区', '253');
INSERT INTO `district` VALUES ('27', '潮南区', '253');
INSERT INTO `district` VALUES ('28', '澄海区', '253');
INSERT INTO `district` VALUES ('29', '南澳县', '253');
INSERT INTO `district` VALUES ('30', '秀峰区', '272');
INSERT INTO `district` VALUES ('31', '叠彩区', '272');
INSERT INTO `district` VALUES ('32', '象山区', '272');
INSERT INTO `district` VALUES ('33', '七星区', '272');
INSERT INTO `district` VALUES ('34', '雁山区', '272');
INSERT INTO `district` VALUES ('35', '阳朔区', '272');
INSERT INTO `district` VALUES ('36', '临桂区', '272');
INSERT INTO `district` VALUES ('37', '灵川县', '272');
INSERT INTO `district` VALUES ('38', '全州县', '272');
INSERT INTO `district` VALUES ('39', '兴安县', '272');
INSERT INTO `district` VALUES ('40', '永福县', '272');
INSERT INTO `district` VALUES ('41', '灌阳县', '272');
INSERT INTO `district` VALUES ('42', '龙胜各族自治县', '272');
INSERT INTO `district` VALUES ('43', '资源县', '272');
INSERT INTO `district` VALUES ('44', '平乐县', '272');
INSERT INTO `district` VALUES ('45', '荔浦县', '272');
INSERT INTO `district` VALUES ('46', '恭城瑶族自治县', '272');
INSERT INTO `district` VALUES ('47', '兴宁区', '270');
INSERT INTO `district` VALUES ('48', '青秀区', '270');
INSERT INTO `district` VALUES ('49', '江南区', '270');
INSERT INTO `district` VALUES ('50', '西乡塘区', '270');
INSERT INTO `district` VALUES ('51', '良庆区', '270');
INSERT INTO `district` VALUES ('52', '武鸣区', '270');
INSERT INTO `district` VALUES ('53', '隆安县', '270');
INSERT INTO `district` VALUES ('54', '马山县', '270');
INSERT INTO `district` VALUES ('55', '上林县', '270');
INSERT INTO `district` VALUES ('56', '宾阳县', '270');
INSERT INTO `district` VALUES ('57', '横县', '270');
INSERT INTO `district` VALUES ('58', '思明区', '168');
INSERT INTO `district` VALUES ('59', '海沧区', '168');
INSERT INTO `district` VALUES ('60', '湖里区', '168');
INSERT INTO `district` VALUES ('61', '集美区', '168');
INSERT INTO `district` VALUES ('62', '同安区', '168');
INSERT INTO `district` VALUES ('63', '翔安区', '168');
INSERT INTO `district` VALUES ('64', '鼓楼区', '167');
INSERT INTO `district` VALUES ('65', '台江区', '167');
INSERT INTO `district` VALUES ('66', '仓山区', '167');
INSERT INTO `district` VALUES ('67', '马尾区', '167');
INSERT INTO `district` VALUES ('68', '晋安区', '167');
INSERT INTO `district` VALUES ('69', '闽侯县', '167');
INSERT INTO `district` VALUES ('70', '连江县', '167');
INSERT INTO `district` VALUES ('71', '罗源县', '167');
INSERT INTO `district` VALUES ('72', '闽清县', '167');
INSERT INTO `district` VALUES ('73', '永泰县', '167');
INSERT INTO `district` VALUES ('74', '平潭县', '167');
INSERT INTO `district` VALUES ('75', '福清市', '167');
INSERT INTO `district` VALUES ('76', '长乐区', '167');
INSERT INTO `district` VALUES ('77', '城厢区', '169');
INSERT INTO `district` VALUES ('78', '涵江区', '169');
INSERT INTO `district` VALUES ('79', '荔城区', '169');
INSERT INTO `district` VALUES ('80', '秀屿区', '169');
INSERT INTO `district` VALUES ('81', '仙游县', '169');

-- ----------------------------
-- Table structure for `idtype`
-- ----------------------------
DROP TABLE IF EXISTS `idtype`;
CREATE TABLE `idtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idtype_name_uk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of idtype
-- ----------------------------
INSERT INTO `idtype` VALUES ('1', '二代身份证');
INSERT INTO `idtype` VALUES ('3', '台湾通行证');
INSERT INTO `idtype` VALUES ('4', '护照');
INSERT INTO `idtype` VALUES ('2', '港澳通行证');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordertime` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `idtype` varchar(255) COLLATE utf8_bin NOT NULL,
  `touristtype` varchar(255) COLLATE utf8_bin NOT NULL,
  `trainname` varchar(255) COLLATE utf8_bin NOT NULL,
  `startstation` varchar(255) COLLATE utf8_bin NOT NULL,
  `endstation` varchar(255) COLLATE utf8_bin NOT NULL,
  `seattype` varchar(255) COLLATE utf8_bin NOT NULL,
  `price` double(11,2) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_userid_fk` (`userid`),
  CONSTRAINT `orders_userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2018-06-02 11:35:18', 'root', '二代身份证', '成人', '和谐号', '广州南', '北京', '二等座', '688.00', '2018-06-05 11:35:55', '2018-06-05 17:36:01', '1');
INSERT INTO `orders` VALUES ('2', '2018-05-05 11:36:36', 'root', '二代身份证', '成人', '飞虎号', '广州南', '上海', '一等座', '588.00', '2018-05-08 11:37:19', '2018-06-08 16:37:26', '1');
INSERT INTO `orders` VALUES ('6', '2018-05-19 11:37:48', 'ccc', '二代身份证', '成人', '和谐号', '北京', '广州南', '二等座', '688.00', '2018-06-20 11:38:40', '2018-06-20 17:38:46', '1');
INSERT INTO `orders` VALUES ('7', '2018-05-31 11:39:00', 'admin', '二代身份证', '成人', '蛟龙号', '广州南', '深圳', '特等座', '111.00', '2018-06-02 11:39:47', '2018-06-02 12:39:51', '2');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京');
INSERT INTO `province` VALUES ('2', '天津');
INSERT INTO `province` VALUES ('3', '河北');
INSERT INTO `province` VALUES ('4', '山西');
INSERT INTO `province` VALUES ('5', '内蒙古');
INSERT INTO `province` VALUES ('6', '辽宁');
INSERT INTO `province` VALUES ('7', '吉林');
INSERT INTO `province` VALUES ('8', '黑龙江');
INSERT INTO `province` VALUES ('9', '上海');
INSERT INTO `province` VALUES ('10', '江苏');
INSERT INTO `province` VALUES ('11', '浙江');
INSERT INTO `province` VALUES ('12', '安徽');
INSERT INTO `province` VALUES ('13', '福建');
INSERT INTO `province` VALUES ('14', '江西');
INSERT INTO `province` VALUES ('15', '山东');
INSERT INTO `province` VALUES ('16', '河南');
INSERT INTO `province` VALUES ('17', '湖北');
INSERT INTO `province` VALUES ('18', '湖南');
INSERT INTO `province` VALUES ('19', '广东');
INSERT INTO `province` VALUES ('20', '广西');
INSERT INTO `province` VALUES ('21', '海南');
INSERT INTO `province` VALUES ('22', '重庆');
INSERT INTO `province` VALUES ('23', '四川');
INSERT INTO `province` VALUES ('24', '贵州');
INSERT INTO `province` VALUES ('25', '云南');
INSERT INTO `province` VALUES ('26', '西藏');
INSERT INTO `province` VALUES ('27', '陕西');
INSERT INTO `province` VALUES ('28', '甘肃');
INSERT INTO `province` VALUES ('29', '青海');
INSERT INTO `province` VALUES ('30', '宁夏');
INSERT INTO `province` VALUES ('31', '新疆');
INSERT INTO `province` VALUES ('32', '香港');
INSERT INTO `province` VALUES ('33', '澳门');
INSERT INTO `province` VALUES ('34', '台湾');

-- ----------------------------
-- Table structure for `route`
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routenameid` int(11) NOT NULL,
  `stationid` int(11) NOT NULL,
  `stationposition` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route_routenameid_fk` (`routenameid`),
  KEY `route_stationid_fk` (`stationid`),
  CONSTRAINT `route_routenameid_fk` FOREIGN KEY (`routenameid`) REFERENCES `routename` (`id`),
  CONSTRAINT `route_stationid_fk` FOREIGN KEY (`stationid`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('1', '1', '25', '1');
INSERT INTO `route` VALUES ('2', '1', '26', '2');
INSERT INTO `route` VALUES ('3', '1', '2', '3');
INSERT INTO `route` VALUES ('4', '1', '28', '4');
INSERT INTO `route` VALUES ('5', '1', '30', '5');
INSERT INTO `route` VALUES ('6', '1', '21', '6');
INSERT INTO `route` VALUES ('7', '2', '8', '1');
INSERT INTO `route` VALUES ('8', '2', '2', '2');
INSERT INTO `route` VALUES ('9', '2', '30', '3');
INSERT INTO `route` VALUES ('10', '2', '21', '4');
INSERT INTO `route` VALUES ('11', '3', '8', '1');
INSERT INTO `route` VALUES ('12', '3', '2', '2');
INSERT INTO `route` VALUES ('13', '3', '28', '3');
INSERT INTO `route` VALUES ('14', '3', '30', '4');
INSERT INTO `route` VALUES ('15', '3', '33', '5');
INSERT INTO `route` VALUES ('16', '3', '21', '6');
INSERT INTO `route` VALUES ('17', '4', '8', '1');
INSERT INTO `route` VALUES ('18', '4', '2', '2');
INSERT INTO `route` VALUES ('19', '4', '28', '3');
INSERT INTO `route` VALUES ('20', '4', '55', '4');
INSERT INTO `route` VALUES ('21', '4', '30', '5');
INSERT INTO `route` VALUES ('22', '4', '33', '6');
INSERT INTO `route` VALUES ('23', '4', '21', '7');
INSERT INTO `route` VALUES ('24', '5', '8', '1');
INSERT INTO `route` VALUES ('25', '5', '2', '2');
INSERT INTO `route` VALUES ('26', '5', '28', '3');
INSERT INTO `route` VALUES ('27', '5', '57', '4');
INSERT INTO `route` VALUES ('28', '5', '30', '5');
INSERT INTO `route` VALUES ('29', '5', '59', '6');
INSERT INTO `route` VALUES ('30', '5', '21', '7');
INSERT INTO `route` VALUES ('31', '6', '2', '1');
INSERT INTO `route` VALUES ('32', '6', '30', '2');
INSERT INTO `route` VALUES ('33', '6', '21', '3');
INSERT INTO `route` VALUES ('34', '7', '8', '1');
INSERT INTO `route` VALUES ('35', '7', '2', '2');
INSERT INTO `route` VALUES ('36', '7', '60', '3');
INSERT INTO `route` VALUES ('37', '7', '62', '4');
INSERT INTO `route` VALUES ('38', '7', '63', '5');
INSERT INTO `route` VALUES ('39', '7', '28', '6');
INSERT INTO `route` VALUES ('40', '7', '64', '7');
INSERT INTO `route` VALUES ('41', '7', '36', '8');
INSERT INTO `route` VALUES ('42', '7', '65', '9');
INSERT INTO `route` VALUES ('43', '7', '66', '10');
INSERT INTO `route` VALUES ('44', '7', '38', '11');
INSERT INTO `route` VALUES ('45', '7', '67', '12');
INSERT INTO `route` VALUES ('46', '7', '55', '13');
INSERT INTO `route` VALUES ('47', '7', '30', '14');
INSERT INTO `route` VALUES ('48', '7', '15', '15');
INSERT INTO `route` VALUES ('49', '7', '21', '16');
INSERT INTO `route` VALUES ('50', '8', '2', '1');
INSERT INTO `route` VALUES ('51', '8', '68', '2');
INSERT INTO `route` VALUES ('52', '8', '61', '3');
INSERT INTO `route` VALUES ('53', '8', '27', '4');
INSERT INTO `route` VALUES ('54', '8', '41', '5');
INSERT INTO `route` VALUES ('55', '8', '37', '6');
INSERT INTO `route` VALUES ('56', '8', '30', '7');
INSERT INTO `route` VALUES ('57', '8', '21', '8');
INSERT INTO `route` VALUES ('58', '9', '8', '1');
INSERT INTO `route` VALUES ('59', '9', '2', '2');
INSERT INTO `route` VALUES ('60', '9', '28', '3');
INSERT INTO `route` VALUES ('61', '9', '36', '4');
INSERT INTO `route` VALUES ('62', '9', '38', '5');
INSERT INTO `route` VALUES ('63', '9', '30', '6');
INSERT INTO `route` VALUES ('64', '9', '21', '7');
INSERT INTO `route` VALUES ('65', '10', '2', '1');
INSERT INTO `route` VALUES ('66', '10', '28', '2');
INSERT INTO `route` VALUES ('67', '10', '36', '3');
INSERT INTO `route` VALUES ('68', '10', '38', '4');
INSERT INTO `route` VALUES ('69', '10', '30', '5');
INSERT INTO `route` VALUES ('70', '10', '21', '6');
INSERT INTO `route` VALUES ('71', '11', '2', '1');
INSERT INTO `route` VALUES ('72', '11', '60', '2');
INSERT INTO `route` VALUES ('73', '11', '69', '3');
INSERT INTO `route` VALUES ('74', '11', '70', '4');
INSERT INTO `route` VALUES ('75', '11', '28', '5');
INSERT INTO `route` VALUES ('76', '11', '64', '6');
INSERT INTO `route` VALUES ('77', '11', '36', '7');
INSERT INTO `route` VALUES ('78', '11', '71', '8');
INSERT INTO `route` VALUES ('79', '11', '65', '9');
INSERT INTO `route` VALUES ('80', '11', '66', '10');
INSERT INTO `route` VALUES ('81', '11', '38', '11');
INSERT INTO `route` VALUES ('82', '11', '72', '12');
INSERT INTO `route` VALUES ('83', '11', '67', '13');
INSERT INTO `route` VALUES ('84', '11', '30', '14');
INSERT INTO `route` VALUES ('85', '11', '21', '15');
INSERT INTO `route` VALUES ('86', '12', '2', '1');
INSERT INTO `route` VALUES ('87', '12', '60', '2');
INSERT INTO `route` VALUES ('88', '12', '73', '3');
INSERT INTO `route` VALUES ('89', '12', '63', '4');
INSERT INTO `route` VALUES ('90', '12', '28', '5');
INSERT INTO `route` VALUES ('91', '12', '74', '6');
INSERT INTO `route` VALUES ('92', '12', '36', '7');
INSERT INTO `route` VALUES ('93', '12', '71', '8');
INSERT INTO `route` VALUES ('94', '12', '75', '9');
INSERT INTO `route` VALUES ('95', '12', '38', '10');
INSERT INTO `route` VALUES ('96', '12', '67', '11');
INSERT INTO `route` VALUES ('97', '12', '57', '12');
INSERT INTO `route` VALUES ('98', '12', '30', '13');
INSERT INTO `route` VALUES ('99', '12', '33', '14');
INSERT INTO `route` VALUES ('100', '12', '21', '15');

-- ----------------------------
-- Table structure for `routename`
-- ----------------------------
DROP TABLE IF EXISTS `routename`;
CREATE TABLE `routename` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `routename_name_uk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of routename
-- ----------------------------
INSERT INTO `routename` VALUES ('2', 'D902 深圳北-北京西');
INSERT INTO `routename` VALUES ('3', 'D904 深圳北-北京西');
INSERT INTO `routename` VALUES ('4', 'D910 深圳北-北京西');
INSERT INTO `routename` VALUES ('6', 'D922 广州南-北京西');
INSERT INTO `routename` VALUES ('1', 'D924 珠海-北京西');
INSERT INTO `routename` VALUES ('5', 'D928 深圳北-北京西');
INSERT INTO `routename` VALUES ('10', 'G66 广州南-北京西');
INSERT INTO `routename` VALUES ('11', 'G68 广州南-北京西');
INSERT INTO `routename` VALUES ('12', 'G70 广州南-北京西');
INSERT INTO `routename` VALUES ('7', 'G72 深圳北-北京西');
INSERT INTO `routename` VALUES ('9', 'G80 深圳北-北京西');
INSERT INTO `routename` VALUES ('8', 'Z202 广州南-北京西');

-- ----------------------------
-- Table structure for `routetime`
-- ----------------------------
DROP TABLE IF EXISTS `routetime`;
CREATE TABLE `routetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeid` int(11) NOT NULL,
  `arrivetime` datetime DEFAULT NULL,
  `leavetime` datetime DEFAULT NULL,
  `trainnumid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `routetime_routeid_fk` (`routeid`),
  KEY `routetime_trainnumid_fk` (`trainnumid`),
  CONSTRAINT `routetime_routeid_fk` FOREIGN KEY (`routeid`) REFERENCES `route` (`id`),
  CONSTRAINT `routetime_trainnumid_fk` FOREIGN KEY (`trainnumid`) REFERENCES `trainnum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of routetime
-- ----------------------------
INSERT INTO `routetime` VALUES ('1', '1', null, '2018-06-08 19:10:00', '1');
INSERT INTO `routetime` VALUES ('2', '2', '2018-06-08 19:33:00', '2018-06-08 19:35:00', '1');
INSERT INTO `routetime` VALUES ('3', '3', '2018-06-08 20:05:00', '2018-06-08 20:10:00', '1');
INSERT INTO `routetime` VALUES ('4', '4', '2018-06-08 22:57:00', '2018-06-08 23:03:00', '1');
INSERT INTO `routetime` VALUES ('5', '5', '2018-06-09 05:20:00', '2018-06-09 05:23:00', '1');
INSERT INTO `routetime` VALUES ('6', '6', '2018-06-09 06:51:00', null, '1');
INSERT INTO `routetime` VALUES ('7', '7', null, '2018-06-08 19:40:00', '2');
INSERT INTO `routetime` VALUES ('8', '8', '2018-06-08 20:12:00', '2018-06-08 20:15:00', '2');
INSERT INTO `routetime` VALUES ('9', '9', '2018-06-09 05:25:00', '2018-06-09 05:28:00', '2');
INSERT INTO `routetime` VALUES ('10', '10', '2018-06-09 06:56:00', null, '2');
INSERT INTO `routetime` VALUES ('11', '11', null, '2018-06-08 19:45:00', '3');
INSERT INTO `routetime` VALUES ('12', '12', '2018-06-08 20:17:00', '2018-06-08 20:20:00', '3');
INSERT INTO `routetime` VALUES ('13', '13', '2018-06-08 23:07:00', '2018-06-08 23:13:00', '3');
INSERT INTO `routetime` VALUES ('14', '14', '2018-06-09 05:30:00', '2018-06-09 05:33:00', '3');
INSERT INTO `routetime` VALUES ('15', '15', '2018-06-09 06:13:00', '2018-06-09 06:15:00', '3');
INSERT INTO `routetime` VALUES ('16', '16', '2018-06-09 07:01:00', null, '3');
INSERT INTO `routetime` VALUES ('17', '17', null, '2018-06-08 19:50:00', '4');
INSERT INTO `routetime` VALUES ('18', '18', '2018-06-08 20:22:00', '2018-06-08 20:25:00', '4');
INSERT INTO `routetime` VALUES ('19', '19', '2018-06-08 23:12:00', '2018-06-08 23:18:00', '4');
INSERT INTO `routetime` VALUES ('20', '20', '2018-06-09 05:07:00', '2018-06-09 05:09:00', '4');
INSERT INTO `routetime` VALUES ('21', '21', '2018-06-09 05:40:00', '2018-06-09 05:44:00', '4');
INSERT INTO `routetime` VALUES ('22', '22', '2018-06-09 06:24:00', '2018-06-09 06:27:00', '4');
INSERT INTO `routetime` VALUES ('23', '23', '2018-06-09 07:13:00', null, '4');
INSERT INTO `routetime` VALUES ('24', '24', null, '2018-06-08 19:55:00', '5');
INSERT INTO `routetime` VALUES ('25', '25', '2018-06-08 20:27:00', '2018-06-08 20:30:00', '5');
INSERT INTO `routetime` VALUES ('26', '26', '2018-06-08 23:27:00', '2018-06-08 23:29:00', '5');
INSERT INTO `routetime` VALUES ('27', '27', '2018-06-09 04:59:00', '2018-06-09 05:01:00', '5');
INSERT INTO `routetime` VALUES ('28', '28', '2018-06-09 05:45:00', '2018-06-09 05:50:00', '5');
INSERT INTO `routetime` VALUES ('29', '29', '2018-06-09 06:14:00', '2018-06-09 06:16:00', '5');
INSERT INTO `routetime` VALUES ('30', '30', '2018-06-09 07:18:00', null, '5');
INSERT INTO `routetime` VALUES ('31', '31', null, '2018-06-08 20:05:00', '6');
INSERT INTO `routetime` VALUES ('32', '32', '2018-06-09 05:15:00', '2018-06-09 05:18:00', '6');
INSERT INTO `routetime` VALUES ('33', '33', '2018-06-09 06:40:00', null, '6');
INSERT INTO `routetime` VALUES ('34', '34', null, '2018-06-08 07:00:00', '7');
INSERT INTO `routetime` VALUES ('35', '35', '2018-06-08 07:38:00', '2018-06-08 07:46:00', '7');
INSERT INTO `routetime` VALUES ('36', '36', '2018-06-08 08:37:00', '2018-06-08 08:39:00', '7');
INSERT INTO `routetime` VALUES ('37', '37', '2018-06-08 09:10:00', '2018-06-08 09:16:00', '7');
INSERT INTO `routetime` VALUES ('38', '38', '2018-06-08 09:49:00', '2018-06-08 09:51:00', '7');
INSERT INTO `routetime` VALUES ('39', '39', '2018-06-08 10:31:00', '2018-06-08 10:34:00', '7');
INSERT INTO `routetime` VALUES ('40', '40', '2018-06-08 11:07:00', '2018-06-08 11:18:00', '7');
INSERT INTO `routetime` VALUES ('41', '41', '2018-06-08 12:11:00', '2018-06-08 12:20:00', '7');
INSERT INTO `routetime` VALUES ('42', '42', '2018-06-08 13:23:00', '2018-06-08 13:50:00', '7');
INSERT INTO `routetime` VALUES ('43', '43', '2018-06-08 14:08:00', '2018-06-08 14:20:00', '7');
INSERT INTO `routetime` VALUES ('44', '44', '2018-06-08 14:56:00', '2018-06-08 14:59:00', '7');
INSERT INTO `routetime` VALUES ('45', '45', '2018-06-08 15:41:00', '2018-06-08 15:43:00', '7');
INSERT INTO `routetime` VALUES ('46', '46', '2018-06-08 16:11:00', '2018-06-08 16:30:00', '7');
INSERT INTO `routetime` VALUES ('47', '47', '2018-06-08 16:58:00', '2018-06-08 17:03:00', '7');
INSERT INTO `routetime` VALUES ('48', '48', '2018-06-08 17:38:00', '2018-06-08 17:40:00', '7');
INSERT INTO `routetime` VALUES ('49', '49', '2018-06-08 18:22:00', null, '7');
INSERT INTO `routetime` VALUES ('50', '50', null, '2018-06-08 08:50:00', '8');
INSERT INTO `routetime` VALUES ('51', '51', '2018-06-08 11:06:00', '2018-06-08 11:12:00', '8');
INSERT INTO `routetime` VALUES ('52', '52', '2018-06-08 12:46:00', '2018-06-08 12:50:00', '8');
INSERT INTO `routetime` VALUES ('53', '53', '2018-06-08 16:23:00', '2018-06-08 16:30:00', '8');
INSERT INTO `routetime` VALUES ('54', '54', '2018-06-08 19:57:00', '2018-06-08 20:09:00', '8');
INSERT INTO `routetime` VALUES ('55', '55', '2018-06-09 00:46:00', '2018-06-09 00:52:00', '8');
INSERT INTO `routetime` VALUES ('56', '56', '2018-06-09 04:12:00', '2018-06-09 04:16:00', '8');
INSERT INTO `routetime` VALUES ('57', '57', '2018-06-09 06:46:00', null, '8');
INSERT INTO `routetime` VALUES ('58', '58', null, '2018-06-08 08:16:00', '9');
INSERT INTO `routetime` VALUES ('59', '59', '2018-06-08 08:56:00', '2018-06-08 09:00:00', '9');
INSERT INTO `routetime` VALUES ('60', '60', '2018-06-08 11:17:00', '2018-06-08 11:20:00', '9');
INSERT INTO `routetime` VALUES ('61', '61', '2018-06-08 12:38:00', '2018-06-08 12:41:00', '9');
INSERT INTO `routetime` VALUES ('62', '62', '2018-06-08 14:25:00', '2018-06-08 14:28:00', '9');
INSERT INTO `routetime` VALUES ('63', '63', '2018-06-08 15:50:00', '2018-06-08 15:54:00', '9');
INSERT INTO `routetime` VALUES ('64', '64', '2018-06-08 17:01:00', null, '9');
INSERT INTO `routetime` VALUES ('65', '65', null, '2018-06-08 10:00:00', '10');
INSERT INTO `routetime` VALUES ('66', '66', '2018-06-08 12:17:00', '2018-06-08 12:20:00', '10');
INSERT INTO `routetime` VALUES ('67', '67', '2018-06-08 13:38:00', '2018-06-08 13:41:00', '10');
INSERT INTO `routetime` VALUES ('68', '68', '2018-06-08 15:25:00', '2018-06-08 15:28:00', '10');
INSERT INTO `routetime` VALUES ('69', '69', '2018-06-08 16:50:00', '2018-06-08 16:53:00', '10');
INSERT INTO `routetime` VALUES ('70', '70', '2018-06-08 18:00:00', null, '10');
INSERT INTO `routetime` VALUES ('71', '71', null, '2018-06-08 11:13:00', '11');
INSERT INTO `routetime` VALUES ('72', '72', '2018-06-08 12:04:00', '2018-06-08 12:06:00', '11');
INSERT INTO `routetime` VALUES ('73', '73', '2018-06-08 12:53:00', '2018-06-08 12:55:00', '11');
INSERT INTO `routetime` VALUES ('74', '74', '2018-06-08 13:34:00', '2018-06-08 13:36:00', '11');
INSERT INTO `routetime` VALUES ('75', '75', '2018-06-08 13:55:00', '2018-06-08 14:00:00', '11');
INSERT INTO `routetime` VALUES ('76', '76', '2018-06-08 14:33:00', '2018-06-08 14:35:00', '11');
INSERT INTO `routetime` VALUES ('77', '77', '2018-06-08 15:28:00', '2018-06-08 15:35:00', '11');
INSERT INTO `routetime` VALUES ('78', '78', '2018-06-08 16:18:00', '2018-06-08 16:20:00', '11');
INSERT INTO `routetime` VALUES ('79', '79', '2018-06-08 16:45:00', '2018-06-08 16:47:00', '11');
INSERT INTO `routetime` VALUES ('80', '80', '2018-06-08 17:05:00', '2018-06-08 17:07:00', '11');
INSERT INTO `routetime` VALUES ('81', '81', '2018-06-08 17:41:00', '2018-06-08 17:53:00', '11');
INSERT INTO `routetime` VALUES ('82', '82', '2018-06-08 18:24:00', '2018-06-08 18:26:00', '11');
INSERT INTO `routetime` VALUES ('83', '83', '2018-06-08 18:41:00', '2018-06-08 18:43:00', '11');
INSERT INTO `routetime` VALUES ('84', '84', '2018-06-08 19:34:00', '2018-06-08 19:43:00', '11');
INSERT INTO `routetime` VALUES ('85', '85', '2018-06-08 20:55:00', null, '11');
INSERT INTO `routetime` VALUES ('86', '86', null, '2018-06-08 12:50:00', '12');
INSERT INTO `routetime` VALUES ('87', '87', '2018-06-08 13:41:00', '2018-06-08 13:43:00', '12');
INSERT INTO `routetime` VALUES ('88', '88', '2018-06-08 14:14:00', '2018-06-08 14:16:00', '12');
INSERT INTO `routetime` VALUES ('89', '89', '2018-06-08 14:57:00', '2018-06-08 14:59:00', '12');
INSERT INTO `routetime` VALUES ('90', '90', '2018-06-08 15:35:00', '2018-06-08 15:38:00', '12');
INSERT INTO `routetime` VALUES ('91', '91', '2018-06-08 16:28:00', '2018-06-08 16:30:00', '12');
INSERT INTO `routetime` VALUES ('92', '92', '2018-06-08 17:04:00', '2018-06-08 17:07:00', '12');
INSERT INTO `routetime` VALUES ('93', '93', '2018-06-08 17:50:00', '2018-06-08 17:52:00', '12');
INSERT INTO `routetime` VALUES ('94', '94', '2018-06-08 18:05:00', '2018-06-08 18:07:00', '12');
INSERT INTO `routetime` VALUES ('95', '95', '2018-06-08 19:06:00', '2018-06-08 19:14:00', '12');
INSERT INTO `routetime` VALUES ('96', '96', '2018-06-08 19:55:00', '2018-06-08 19:57:00', '12');
INSERT INTO `routetime` VALUES ('97', '97', '2018-06-08 20:14:00', '2018-06-08 20:16:00', '12');
INSERT INTO `routetime` VALUES ('98', '98', '2018-06-08 20:56:00', '2018-06-08 21:00:00', '12');
INSERT INTO `routetime` VALUES ('99', '99', '2018-06-08 21:36:00', '2018-06-08 21:38:00', '12');
INSERT INTO `routetime` VALUES ('100', '100', '2018-06-08 22:38:00', null, '12');

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `provinceid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_name_uk` (`name`),
  KEY `school_provinceid_fk` (`provinceid`),
  CONSTRAINT `school_provinceid_fk` FOREIGN KEY (`provinceid`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '中山大学', '19');
INSERT INTO `school` VALUES ('2', '华南理工大学', '19');
INSERT INTO `school` VALUES ('3', '暨南大学', '19');
INSERT INTO `school` VALUES ('4', '广东工业大学', '19');
INSERT INTO `school` VALUES ('5', '华南农业大学', '19');
INSERT INTO `school` VALUES ('6', '华南师范大学', '19');
INSERT INTO `school` VALUES ('7', '广州中医药大学', '19');
INSERT INTO `school` VALUES ('8', '汕头大学', '19');
INSERT INTO `school` VALUES ('9', '南方医科大学', '19');
INSERT INTO `school` VALUES ('10', '广东外语外贸大学', '19');
INSERT INTO `school` VALUES ('11', '深圳大学', '19');
INSERT INTO `school` VALUES ('12', '广州大学', '19');
INSERT INTO `school` VALUES ('13', '广东海洋大学', '19');
INSERT INTO `school` VALUES ('14', '五邑大学', '19');
INSERT INTO `school` VALUES ('15', '惠州学院', '19');
INSERT INTO `school` VALUES ('16', '肇庆学院', '19');
INSERT INTO `school` VALUES ('17', '茂名学院', '19');
INSERT INTO `school` VALUES ('18', '仲恺农农业技术大学', '19');
INSERT INTO `school` VALUES ('19', '广东医学院', '19');
INSERT INTO `school` VALUES ('20', '广州医学院', '19');
INSERT INTO `school` VALUES ('21', '广东药学院', '19');
INSERT INTO `school` VALUES ('22', '东莞理工大学', '19');
INSERT INTO `school` VALUES ('23', '湛江师范大学', '19');
INSERT INTO `school` VALUES ('24', '韩山师范大学', '19');
INSERT INTO `school` VALUES ('25', '嘉应学院', '19');
INSERT INTO `school` VALUES ('26', '韶关学院', '19');
INSERT INTO `school` VALUES ('27', '广东金融学院', '19');
INSERT INTO `school` VALUES ('28', '广东商学院', '19');
INSERT INTO `school` VALUES ('29', '广东警官学院', '19');
INSERT INTO `school` VALUES ('30', '广州体育学院', '19');
INSERT INTO `school` VALUES ('31', '广东美术学院', '19');
INSERT INTO `school` VALUES ('32', '星海音乐学院', '19');
INSERT INTO `school` VALUES ('33', '广东技术师范学院', '19');
INSERT INTO `school` VALUES ('34', '广东培正学院', '19');
INSERT INTO `school` VALUES ('35', '广东白云学院', '19');
INSERT INTO `school` VALUES ('36', '北京大学', '1');
INSERT INTO `school` VALUES ('37', '中国人民大学', '1');
INSERT INTO `school` VALUES ('38', '清华大学', '1');
INSERT INTO `school` VALUES ('39', '北京交通大学', '1');
INSERT INTO `school` VALUES ('40', '北京航空航天大学', '1');
INSERT INTO `school` VALUES ('41', '北京理工大学', '1');
INSERT INTO `school` VALUES ('42', '北京科技大学', '1');
INSERT INTO `school` VALUES ('43', '北京工业大学', '1');
INSERT INTO `school` VALUES ('44', '北京化工大学', '1');
INSERT INTO `school` VALUES ('45', '北京工商大学', '1');
INSERT INTO `school` VALUES ('46', '北京服装学院', '1');
INSERT INTO `school` VALUES ('47', '北京邮电大学', '1');
INSERT INTO `school` VALUES ('48', '北京印刷学院', '1');
INSERT INTO `school` VALUES ('49', '北京建筑大学', '1');
INSERT INTO `school` VALUES ('50', '北京石油化工学院', '1');
INSERT INTO `school` VALUES ('51', '北京电子科技学院', '1');
INSERT INTO `school` VALUES ('52', '中国农业大学', '1');
INSERT INTO `school` VALUES ('53', '北京农学院', '1');
INSERT INTO `school` VALUES ('54', '北京林业大学', '1');
INSERT INTO `school` VALUES ('55', '北京协和医学院', '1');
INSERT INTO `school` VALUES ('56', '首都医科大学', '1');
INSERT INTO `school` VALUES ('57', '北京中医药大学', '1');
INSERT INTO `school` VALUES ('58', '北京师范大学', '1');
INSERT INTO `school` VALUES ('59', '首都师范大学', '1');
INSERT INTO `school` VALUES ('60', '首都体育学院', '1');
INSERT INTO `school` VALUES ('61', '北京外国语大学', '1');
INSERT INTO `school` VALUES ('62', '北京第二外国语学院', '1');
INSERT INTO `school` VALUES ('63', '北京语言大学', '1');
INSERT INTO `school` VALUES ('64', '中国传媒大学', '1');
INSERT INTO `school` VALUES ('65', '中央财经大学', '1');
INSERT INTO `school` VALUES ('66', '北京物资学院', '1');
INSERT INTO `school` VALUES ('67', '中国人民公安大学', '1');
INSERT INTO `school` VALUES ('68', '北京体育大学', '1');
INSERT INTO `school` VALUES ('69', '中央音乐学院', '1');
INSERT INTO `school` VALUES ('70', '中国音乐学院', '1');
INSERT INTO `school` VALUES ('71', '中央美术学院', '1');
INSERT INTO `school` VALUES ('72', '中央戏剧学院', '1');
INSERT INTO `school` VALUES ('73', '中国戏曲学院', '1');
INSERT INTO `school` VALUES ('74', '北京电影学院', '1');
INSERT INTO `school` VALUES ('75', '北京舞蹈学院', '1');
INSERT INTO `school` VALUES ('76', '中央民族大学', '1');

-- ----------------------------
-- Table structure for `seatnum`
-- ----------------------------
DROP TABLE IF EXISTS `seatnum`;
CREATE TABLE `seatnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s1` int(11) DEFAULT NULL,
  `s2` int(11) DEFAULT NULL,
  `s3` int(11) DEFAULT NULL,
  `s4` int(11) DEFAULT NULL,
  `s5` int(11) DEFAULT NULL,
  `s6` int(11) DEFAULT NULL,
  `s7` int(11) DEFAULT NULL,
  `s8` int(11) DEFAULT NULL,
  `s9` int(11) DEFAULT NULL,
  `s10` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of seatnum
-- ----------------------------
INSERT INTO `seatnum` VALUES ('1', '16', '112', '500', null, null, null, null, null, null, null);
INSERT INTO `seatnum` VALUES ('2', null, null, '110', null, '520', null, null, null, null, null);
INSERT INTO `seatnum` VALUES ('3', null, null, null, '14', '20', null, '150', null, '320', null);
INSERT INTO `seatnum` VALUES ('4', null, null, '0', null, '0', null, null, null, null, null);
INSERT INTO `seatnum` VALUES ('5', '0', '0', '0', null, null, null, null, null, null, null);
INSERT INTO `seatnum` VALUES ('6', null, null, null, '0', '0', null, '0', null, '0', null);

-- ----------------------------
-- Table structure for `seattype`
-- ----------------------------
DROP TABLE IF EXISTS `seattype`;
CREATE TABLE `seattype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seattype_name_uk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of seattype
-- ----------------------------
INSERT INTO `seattype` VALUES ('2', '一等座');
INSERT INTO `seattype` VALUES ('3', '二等座');
INSERT INTO `seattype` VALUES ('6', '动卧');
INSERT INTO `seattype` VALUES ('1', '商务座特等座');
INSERT INTO `seattype` VALUES ('10', '无座');
INSERT INTO `seattype` VALUES ('7', '硬卧');
INSERT INTO `seattype` VALUES ('9', '硬座');
INSERT INTO `seattype` VALUES ('5', '软卧');
INSERT INTO `seattype` VALUES ('8', '软座');
INSERT INTO `seattype` VALUES ('4', '高级软卧');

-- ----------------------------
-- Table structure for `station`
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `cityid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_cityid_fk` (`cityid`),
  CONSTRAINT `station_cityid_fk` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('1', '广州东', '249');
INSERT INTO `station` VALUES ('2', '广州南', '249');
INSERT INTO `station` VALUES ('3', '广州北', '249');
INSERT INTO `station` VALUES ('4', '深圳西', '251');
INSERT INTO `station` VALUES ('5', '深圳东', '251');
INSERT INTO `station` VALUES ('6', '厦门北', '168');
INSERT INTO `station` VALUES ('7', '广州西', '249');
INSERT INTO `station` VALUES ('8', '深圳北', '251');
INSERT INTO `station` VALUES ('9', '深圳坪山', '251');
INSERT INTO `station` VALUES ('10', '饶平', '267');
INSERT INTO `station` VALUES ('11', '桂林北', '272');
INSERT INTO `station` VALUES ('12', '桂林西', '272');
INSERT INTO `station` VALUES ('13', '南宁东', '270');
INSERT INTO `station` VALUES ('14', '南宁西', '270');
INSERT INTO `station` VALUES ('15', '厦门高崎', '168');
INSERT INTO `station` VALUES ('16', '福州南', '167');
INSERT INTO `station` VALUES ('17', '北京东', '438');
INSERT INTO `station` VALUES ('20', '北京南', '438');
INSERT INTO `station` VALUES ('21', '北京西', '438');
INSERT INTO `station` VALUES ('22', '北京北', '438');
INSERT INTO `station` VALUES ('23', '北京', '438');
INSERT INTO `station` VALUES ('24', '广州', '249');
INSERT INTO `station` VALUES ('25', '珠海', '252');
INSERT INTO `station` VALUES ('26', '中山', '266');
INSERT INTO `station` VALUES ('27', '长沙', '235');
INSERT INTO `station` VALUES ('28', '长沙南', '235');
INSERT INTO `station` VALUES ('29', '长沙西', '235');
INSERT INTO `station` VALUES ('30', '石家庄', '37');
INSERT INTO `station` VALUES ('31', '石家庄东', '37');
INSERT INTO `station` VALUES ('32', '石家庄北', '37');
INSERT INTO `station` VALUES ('33', '保定东', '42');
INSERT INTO `station` VALUES ('34', '保定', '42');
INSERT INTO `station` VALUES ('36', '武汉', '221');
INSERT INTO `station` VALUES ('37', '郑州', '204');
INSERT INTO `station` VALUES ('38', '郑州东', '204');
INSERT INTO `station` VALUES ('39', '郑州西', '204');
INSERT INTO `station` VALUES ('40', '福田', '251');
INSERT INTO `station` VALUES ('41', '武昌', '221');
INSERT INTO `station` VALUES ('42', '汉口', '221');
INSERT INTO `station` VALUES ('43', '上海', '439');
INSERT INTO `station` VALUES ('44', '上海南', '439');
INSERT INTO `station` VALUES ('45', '上海西', '439');
INSERT INTO `station` VALUES ('46', '上海虹桥', '439');
INSERT INTO `station` VALUES ('47', '杭州', '139');
INSERT INTO `station` VALUES ('48', '杭州东', '139');
INSERT INTO `station` VALUES ('49', '杭州南', '139');
INSERT INTO `station` VALUES ('50', '揭阳', '268');
INSERT INTO `station` VALUES ('51', '普宁', '268');
INSERT INTO `station` VALUES ('52', '宁波', '140');
INSERT INTO `station` VALUES ('53', '宁波东', '140');
INSERT INTO `station` VALUES ('54', '邢台', '41');
INSERT INTO `station` VALUES ('55', '邢台东', '41');
INSERT INTO `station` VALUES ('56', '邯郸', '40');
INSERT INTO `station` VALUES ('57', '邯郸东', '40');
INSERT INTO `station` VALUES ('58', '定州', '440');
INSERT INTO `station` VALUES ('59', '定州东', '440');
INSERT INTO `station` VALUES ('60', '韶关', '250');
INSERT INTO `station` VALUES ('61', '郴州', '244');
INSERT INTO `station` VALUES ('62', '郴州东', '244');
INSERT INTO `station` VALUES ('63', '衡阳东', '238');
INSERT INTO `station` VALUES ('64', '岳阳东', '240');
INSERT INTO `station` VALUES ('65', '驻马店西', '220');
INSERT INTO `station` VALUES ('66', '漯河西', '214');
INSERT INTO `station` VALUES ('67', '安阳东', '208');
INSERT INTO `station` VALUES ('68', '韶关东', '250');
INSERT INTO `station` VALUES ('69', '耒阳西', '441');
INSERT INTO `station` VALUES ('70', '株洲西', '236');
INSERT INTO `station` VALUES ('71', '信阳东', '218');
INSERT INTO `station` VALUES ('72', '鹤壁东', '209');
INSERT INTO `station` VALUES ('73', '郴州西', '244');
INSERT INTO `station` VALUES ('74', '赤壁北', '231');
INSERT INTO `station` VALUES ('75', '明港东', '218');

-- ----------------------------
-- Table structure for `ticketnum`
-- ----------------------------
DROP TABLE IF EXISTS `ticketnum`;
CREATE TABLE `ticketnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seattypeid` int(11) NOT NULL,
  `ticketnum` int(11) NOT NULL,
  `trainnumid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketnum_seattypeid_fk` (`seattypeid`),
  KEY `ticketnum_trainnumid_fk` (`trainnumid`),
  CONSTRAINT `ticketnum_seattypeid_fk` FOREIGN KEY (`seattypeid`) REFERENCES `seattype` (`id`),
  CONSTRAINT `ticketnum_trainnumid_fk` FOREIGN KEY (`trainnumid`) REFERENCES `trainnum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ticketnum
-- ----------------------------
INSERT INTO `ticketnum` VALUES ('1', '3', '110', '1');
INSERT INTO `ticketnum` VALUES ('2', '5', '520', '1');
INSERT INTO `ticketnum` VALUES ('3', '3', '110', '2');
INSERT INTO `ticketnum` VALUES ('4', '5', '520', '2');
INSERT INTO `ticketnum` VALUES ('5', '3', '110', '3');
INSERT INTO `ticketnum` VALUES ('6', '5', '520', '3');
INSERT INTO `ticketnum` VALUES ('7', '3', '110', '4');
INSERT INTO `ticketnum` VALUES ('8', '5', '520', '4');
INSERT INTO `ticketnum` VALUES ('9', '3', '110', '5');
INSERT INTO `ticketnum` VALUES ('10', '5', '520', '5');
INSERT INTO `ticketnum` VALUES ('11', '3', '0', '6');
INSERT INTO `ticketnum` VALUES ('12', '5', '0', '6');
INSERT INTO `ticketnum` VALUES ('13', '1', '16', '7');
INSERT INTO `ticketnum` VALUES ('14', '2', '112', '7');
INSERT INTO `ticketnum` VALUES ('15', '3', '500', '7');
INSERT INTO `ticketnum` VALUES ('16', '4', '14', '8');
INSERT INTO `ticketnum` VALUES ('17', '5', '20', '8');
INSERT INTO `ticketnum` VALUES ('18', '7', '150', '8');
INSERT INTO `ticketnum` VALUES ('19', '9', '320', '8');
INSERT INTO `ticketnum` VALUES ('20', '1', '16', '9');
INSERT INTO `ticketnum` VALUES ('21', '2', '112', '9');
INSERT INTO `ticketnum` VALUES ('22', '3', '500', '9');
INSERT INTO `ticketnum` VALUES ('23', '1', '16', '10');
INSERT INTO `ticketnum` VALUES ('24', '2', '112', '10');
INSERT INTO `ticketnum` VALUES ('25', '3', '500', '10');
INSERT INTO `ticketnum` VALUES ('26', '1', '16', '11');
INSERT INTO `ticketnum` VALUES ('27', '2', '112', '11');
INSERT INTO `ticketnum` VALUES ('28', '3', '500', '11');
INSERT INTO `ticketnum` VALUES ('29', '1', '16', '12');
INSERT INTO `ticketnum` VALUES ('30', '2', '112', '12');
INSERT INTO `ticketnum` VALUES ('31', '3', '500', '12');

-- ----------------------------
-- Table structure for `ticketprice`
-- ----------------------------
DROP TABLE IF EXISTS `ticketprice`;
CREATE TABLE `ticketprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startstationid` int(11) NOT NULL,
  `endstationid` int(11) NOT NULL,
  `seattypeid` int(11) NOT NULL,
  `price` double(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketprice_startstationid_fk` (`startstationid`),
  KEY `ticketprice_endstationid_fk` (`endstationid`),
  KEY `ticketprice_seattypeid_fk` (`seattypeid`),
  CONSTRAINT `ticketprice_endstationid_fk` FOREIGN KEY (`endstationid`) REFERENCES `station` (`id`),
  CONSTRAINT `ticketprice_seattypeid_fk` FOREIGN KEY (`seattypeid`) REFERENCES `seattype` (`id`),
  CONSTRAINT `ticketprice_startstationid_fk` FOREIGN KEY (`startstationid`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ticketprice
-- ----------------------------
INSERT INTO `ticketprice` VALUES ('1', '2', '21', '1', '2724.00');
INSERT INTO `ticketprice` VALUES ('2', '2', '21', '2', '1380.00');
INSERT INTO `ticketprice` VALUES ('3', '2', '21', '3', '709.00');
INSERT INTO `ticketprice` VALUES ('4', '2', '21', '4', '1383.00');
INSERT INTO `ticketprice` VALUES ('5', '2', '21', '5', '750.00');
INSERT INTO `ticketprice` VALUES ('6', '2', '21', '6', '1150.00');
INSERT INTO `ticketprice` VALUES ('7', '2', '21', '7', '426.00');
INSERT INTO `ticketprice` VALUES ('10', '2', '21', '8', '350.00');
INSERT INTO `ticketprice` VALUES ('11', '2', '21', '9', '251.00');
INSERT INTO `ticketprice` VALUES ('12', '2', '21', '10', '251.00');
INSERT INTO `ticketprice` VALUES ('13', '25', '21', '3', '779.00');
INSERT INTO `ticketprice` VALUES ('14', '25', '21', '6', '1150.00');
INSERT INTO `ticketprice` VALUES ('15', '26', '21', '3', '749.00');
INSERT INTO `ticketprice` VALUES ('16', '26', '21', '6', '1150.00');
INSERT INTO `ticketprice` VALUES ('17', '28', '21', '1', '2050.00');
INSERT INTO `ticketprice` VALUES ('18', '28', '21', '2', '1038.00');
INSERT INTO `ticketprice` VALUES ('19', '28', '21', '3', '649.00');
INSERT INTO `ticketprice` VALUES ('20', '28', '21', '4', '930.00');
INSERT INTO `ticketprice` VALUES ('21', '28', '21', '5', '504.00');
INSERT INTO `ticketprice` VALUES ('22', '28', '21', '6', '690.00');
INSERT INTO `ticketprice` VALUES ('23', '28', '21', '7', '322.00');
INSERT INTO `ticketprice` VALUES ('25', '28', '21', '8', '299.00');
INSERT INTO `ticketprice` VALUES ('26', '28', '21', '9', '189.00');
INSERT INTO `ticketprice` VALUES ('27', '28', '21', '10', '189.00');
INSERT INTO `ticketprice` VALUES ('28', '30', '21', '1', '407.00');
INSERT INTO `ticketprice` VALUES ('29', '30', '21', '2', '206.00');
INSERT INTO `ticketprice` VALUES ('30', '30', '21', '3', '128.00');
INSERT INTO `ticketprice` VALUES ('31', '30', '21', '4', '238.00');
INSERT INTO `ticketprice` VALUES ('32', '30', '21', '5', '135.00');
INSERT INTO `ticketprice` VALUES ('33', '30', '21', '7', '89.00');
INSERT INTO `ticketprice` VALUES ('34', '30', '21', '8', '123.00');
INSERT INTO `ticketprice` VALUES ('35', '30', '21', '9', '78.00');
INSERT INTO `ticketprice` VALUES ('36', '30', '21', '10', '78.00');
INSERT INTO `ticketprice` VALUES ('37', '2', '46', '1', '2492.00');
INSERT INTO `ticketprice` VALUES ('38', '2', '46', '2', '1302.00');
INSERT INTO `ticketprice` VALUES ('39', '2', '46', '3', '793.00');
INSERT INTO `ticketprice` VALUES ('40', '2', '46', '4', '1270.00');
INSERT INTO `ticketprice` VALUES ('41', '2', '46', '5', '628.00');
INSERT INTO `ticketprice` VALUES ('42', '2', '46', '6', '760.00');
INSERT INTO `ticketprice` VALUES ('43', '2', '46', '7', '353.00');
INSERT INTO `ticketprice` VALUES ('44', '2', '26', '9', '201.00');
INSERT INTO `ticketprice` VALUES ('45', '2', '26', '10', '201.00');
INSERT INTO `ticketprice` VALUES ('46', '1', '21', '1', '2724.00');
INSERT INTO `ticketprice` VALUES ('47', '1', '21', '2', '1380.00');
INSERT INTO `ticketprice` VALUES ('48', '1', '21', '3', '709.00');
INSERT INTO `ticketprice` VALUES ('49', '1', '21', '4', '1383.00');
INSERT INTO `ticketprice` VALUES ('50', '1', '21', '5', '750.00');
INSERT INTO `ticketprice` VALUES ('51', '1', '21', '6', '1150.00');
INSERT INTO `ticketprice` VALUES ('52', '1', '21', '7', '426.00');
INSERT INTO `ticketprice` VALUES ('53', '1', '21', '8', '350.00');
INSERT INTO `ticketprice` VALUES ('54', '24', '21', '1', '2724.00');
INSERT INTO `ticketprice` VALUES ('55', '24', '21', '2', '1380.00');
INSERT INTO `ticketprice` VALUES ('56', '24', '21', '3', '709.00');
INSERT INTO `ticketprice` VALUES ('57', '24', '21', '4', '1383.00');
INSERT INTO `ticketprice` VALUES ('58', '24', '21', '5', '750.00');
INSERT INTO `ticketprice` VALUES ('59', '24', '21', '6', '1150.00');
INSERT INTO `ticketprice` VALUES ('60', '24', '21', '7', '426.00');
INSERT INTO `ticketprice` VALUES ('61', '24', '21', '9', '251.00');
INSERT INTO `ticketprice` VALUES ('62', '24', '21', '10', '251.00');

-- ----------------------------
-- Table structure for `touristtype`
-- ----------------------------
DROP TABLE IF EXISTS `touristtype`;
CREATE TABLE `touristtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `touristtype_name_uk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of touristtype
-- ----------------------------
INSERT INTO `touristtype` VALUES ('2', '儿童');
INSERT INTO `touristtype` VALUES ('3', '学生');
INSERT INTO `touristtype` VALUES ('1', '成人');
INSERT INTO `touristtype` VALUES ('4', '残疾军人、伤残人民警察');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `seatnumid` int(11) NOT NULL,
  `traintypeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_seatnumid_fk` (`seatnumid`),
  KEY `train_traintypeid_fk` (`traintypeid`),
  CONSTRAINT `train_seatnumid_fk` FOREIGN KEY (`seatnumid`) REFERENCES `seatnum` (`id`),
  CONSTRAINT `train_traintypeid_fk` FOREIGN KEY (`traintypeid`) REFERENCES `traintype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('1', 'D924', '2', '2');
INSERT INTO `train` VALUES ('2', 'D902', '2', '2');
INSERT INTO `train` VALUES ('3', 'D904', '2', '2');
INSERT INTO `train` VALUES ('4', 'D910', '2', '2');
INSERT INTO `train` VALUES ('5', 'D928', '2', '2');
INSERT INTO `train` VALUES ('6', 'D922', '2', '2');
INSERT INTO `train` VALUES ('7', 'G72', '1', '1');
INSERT INTO `train` VALUES ('8', 'Z202', '3', '3');
INSERT INTO `train` VALUES ('9', 'G80', '1', '1');
INSERT INTO `train` VALUES ('10', 'G66', '1', '1');
INSERT INTO `train` VALUES ('11', 'G68', '1', '1');
INSERT INTO `train` VALUES ('12', 'G70', '1', '1');

-- ----------------------------
-- Table structure for `trainnum`
-- ----------------------------
DROP TABLE IF EXISTS `trainnum`;
CREATE TABLE `trainnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainid` int(11) NOT NULL,
  `routenameid` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainnum_trainid_fk` (`trainid`),
  KEY `trainnum_routenameid_fk` (`routenameid`),
  CONSTRAINT `trainnum_routenameid_fk` FOREIGN KEY (`routenameid`) REFERENCES `routename` (`id`),
  CONSTRAINT `trainnum_trainid_fk` FOREIGN KEY (`trainid`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of trainnum
-- ----------------------------
INSERT INTO `trainnum` VALUES ('1', '1', '1', '2018-06-08');
INSERT INTO `trainnum` VALUES ('2', '2', '2', '2018-06-08');
INSERT INTO `trainnum` VALUES ('3', '3', '3', '2018-06-08');
INSERT INTO `trainnum` VALUES ('4', '4', '4', '2018-06-08');
INSERT INTO `trainnum` VALUES ('5', '5', '5', '2018-06-08');
INSERT INTO `trainnum` VALUES ('6', '6', '6', '2018-06-08');
INSERT INTO `trainnum` VALUES ('7', '7', '7', '2018-06-08');
INSERT INTO `trainnum` VALUES ('8', '8', '8', '2018-06-08');
INSERT INTO `trainnum` VALUES ('9', '9', '9', '2018-06-08');
INSERT INTO `trainnum` VALUES ('10', '10', '10', '2018-06-08');
INSERT INTO `trainnum` VALUES ('11', '11', '11', '2018-06-08');
INSERT INTO `trainnum` VALUES ('12', '12', '12', '2018-06-08');

-- ----------------------------
-- Table structure for `traintype`
-- ----------------------------
DROP TABLE IF EXISTS `traintype`;
CREATE TABLE `traintype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of traintype
-- ----------------------------
INSERT INTO `traintype` VALUES ('1', 'G/C-高铁/城际');
INSERT INTO `traintype` VALUES ('2', 'D-动车');
INSERT INTO `traintype` VALUES ('3', 'Z-直达');
INSERT INTO `traintype` VALUES ('4', 'T-特快');
INSERT INTO `traintype` VALUES ('5', 'K-快速');
INSERT INTO `traintype` VALUES ('6', '其他');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_uk` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', '123456');
INSERT INTO `user` VALUES ('2', 'admin', '123456');
