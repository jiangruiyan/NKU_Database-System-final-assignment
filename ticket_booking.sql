/*
 Navicat Premium Data Transfer

 Source Server         : ticketBooking
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : ticket_booking

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 02/06/2025 18:25:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `train_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_status` enum('sold','available') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`train_id`, `seat_id`, `start_station`, `end_station`) USING BTREE,
  INDEX `seat_id2`(`seat_id` ASC) USING BTREE,
  INDEX `start_station`(`start_station` ASC) USING BTREE,
  INDEX `end_station`(`end_station` ASC) USING BTREE,
  CONSTRAINT `end_station` FOREIGN KEY (`end_station`) REFERENCES `station` (`station_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `seat_id2` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `start_station` FOREIGN KEY (`start_station`) REFERENCES `station` (`station_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `train_id4` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('C2003', '01车01F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车01F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车01F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车02F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车02F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车02F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04A号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04A号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04C号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04C号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04D号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04D号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '01车04F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03A号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03A号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03B号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03B号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03B号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03C号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03C号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03D号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03D号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2003', '03车03F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车01F号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车01F号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车01F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车02F号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车02F号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车02F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04A号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04A号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04C号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04C号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04D号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04D号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04F号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04F号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '01车04F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03A号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03A号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03B号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03B号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03B号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03C号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03C号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03D号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03D号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03F号', '亦庄', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03F号', '天津', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2018', '03车03F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车01F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车02F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04A号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04C号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04D号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '01车04F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03A号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03B号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03C号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03D号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '亦庄', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '亦庄', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '北京南', '亦庄', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2025', '03车03F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车01F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车02F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车04A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车04C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车04D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '01车04F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '03车03A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '03车03B号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '03车03C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '03车03D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2212', '03车03F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车01F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '01车03F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01B号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01B号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01B号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2551', '02车01F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车01F号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车02F号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04A号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04C号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04D号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '01车04F号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03A号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03B号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03C号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03D号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '天津', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '武清', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2562', '03车03F号', '滨海', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车01F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车02F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '01车04F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03B号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '军粮城北', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '军粮城北', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '塘沽', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '塘沽', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '塘沽', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '滨海', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '滨海', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2570', '03车03F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '北京南', '军粮城北', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '北京南', '天津', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '北京南', '滨海', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '武清', '军粮城北', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '武清', '天津', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车01F号', '武清', '滨海', 'sold');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车02F号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04A号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04C号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04D号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '01车04F号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03A号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03B号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03C号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03D号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '军粮城北', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '北京南', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '北京南', '武清', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '天津', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '武清', '军粮城北', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '武清', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2575', '03车03F号', '武清', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车01F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车01F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车01F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车02F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车02F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车02F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '01车04F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03A号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03A号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03A号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03B号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03B号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03B号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03C号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03C号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03C号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03D号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03D号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03D号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03F号', '天津', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03F号', '滨海', '北京南', 'available');
INSERT INTO `inventory` VALUES ('C2596', '03车03F号', '滨海', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车01F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车02F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '01车04F号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03A号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03B号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03C号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03D号', '天津', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '北京南', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '北京南', '天津', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '北京南', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '塘沽', '滨海', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '天津', '塘沽', 'available');
INSERT INTO `inventory` VALUES ('C2597', '03车03F号', '天津', '滨海', 'available');

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passenger_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_name`) USING BTREE,
  UNIQUE INDEX `id_card`(`id_card` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES ('a', '0', '测试账号', '0', '0');
INSERT INTO `passenger` VALUES ('BigBouBo', 'tiananmen568', '郭正平', '120110200405059999', '13577777777');
INSERT INTO `passenger` VALUES ('bozi123', 'wyb999zkx', '王怡博', '411326200510103333', '13566666666');
INSERT INTO `passenger` VALUES ('ClarenceWise', '479479xy', '熊耀', '530629200512126666', '18888888888');
INSERT INTO `passenger` VALUES ('loong', 'wyl123', '温延龙', 'XXXXXXXXXXXXXXXXXX', '15555555555');
INSERT INTO `passenger` VALUES ('zhangsb', '123', '张栩鸣', '220101199911112222', '13900000000');
INSERT INTO `passenger` VALUES ('zzzzzzhangsan', 'zhang123abc', '张三', '51011120000101111X', '13333333333');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `train_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_type` enum('二等座','一等座','商务座') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`train_id`, `seat_id`) USING BTREE,
  INDEX `seat_id`(`seat_id` ASC) USING BTREE,
  CONSTRAINT `train_id3` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('C2003', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2003', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2003', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2003', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2003', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2003', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2003', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2003', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2003', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2003', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2003', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2018', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2018', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2018', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2018', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2018', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2018', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2018', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2018', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2018', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2018', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2018', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2025', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2025', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2025', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2025', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2025', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2025', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2025', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2025', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2025', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2025', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2025', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2212', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2212', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2212', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2212', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2212', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2212', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2212', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2212', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2212', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2212', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2212', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2551', '01车01A号', '商务座');
INSERT INTO `seat` VALUES ('C2551', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2551', '01车03A号', '一等座');
INSERT INTO `seat` VALUES ('C2551', '01车03C号', '一等座');
INSERT INTO `seat` VALUES ('C2551', '01车03D号', '一等座');
INSERT INTO `seat` VALUES ('C2551', '01车03F号', '一等座');
INSERT INTO `seat` VALUES ('C2551', '02车01A号', '二等座');
INSERT INTO `seat` VALUES ('C2551', '02车01B号', '二等座');
INSERT INTO `seat` VALUES ('C2551', '02车01C号', '二等座');
INSERT INTO `seat` VALUES ('C2551', '02车01D号', '二等座');
INSERT INTO `seat` VALUES ('C2551', '02车01F号', '二等座');
INSERT INTO `seat` VALUES ('C2562', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2562', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2562', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2562', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2562', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2562', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2562', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2562', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2562', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2562', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2562', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2570', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2570', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2570', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2570', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2570', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2570', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2570', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2570', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2570', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2570', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2570', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2575', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2575', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2575', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2575', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2575', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2575', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2575', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2575', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2575', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2575', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2575', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2596', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2596', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2596', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2596', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2596', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2596', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2596', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2596', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2596', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2596', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2596', '03车03F号', '二等座');
INSERT INTO `seat` VALUES ('C2597', '01车01F号', '商务座');
INSERT INTO `seat` VALUES ('C2597', '01车02F号', '商务座');
INSERT INTO `seat` VALUES ('C2597', '01车04A号', '一等座');
INSERT INTO `seat` VALUES ('C2597', '01车04C号', '一等座');
INSERT INTO `seat` VALUES ('C2597', '01车04D号', '一等座');
INSERT INTO `seat` VALUES ('C2597', '01车04F号', '一等座');
INSERT INTO `seat` VALUES ('C2597', '03车03A号', '二等座');
INSERT INTO `seat` VALUES ('C2597', '03车03B号', '二等座');
INSERT INTO `seat` VALUES ('C2597', '03车03C号', '二等座');
INSERT INTO `seat` VALUES ('C2597', '03车03D号', '二等座');
INSERT INTO `seat` VALUES ('C2597', '03车03F号', '二等座');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `station_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `station_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`station_id`) USING BTREE,
  UNIQUE INDEX `station_name`(`station_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('10004', '亦庄');
INSERT INTO `station` VALUES ('10351', '军粮城北');
INSERT INTO `station` VALUES ('10010', '北京南');
INSERT INTO `station` VALUES ('10172', '塘沽');
INSERT INTO `station` VALUES ('10157', '天津');
INSERT INTO `station` VALUES ('10007', '武清');
INSERT INTO `station` VALUES ('10140', '滨海');

-- ----------------------------
-- Table structure for stopovers
-- ----------------------------
DROP TABLE IF EXISTS `stopovers`;
CREATE TABLE `stopovers`  (
  `train_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int NOT NULL,
  `station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrival_time` time NULL DEFAULT NULL,
  `departure_time` time NULL DEFAULT NULL,
  PRIMARY KEY (`train_id`, `sequence`) USING BTREE,
  INDEX `station`(`station` ASC) USING BTREE,
  CONSTRAINT `station` FOREIGN KEY (`station`) REFERENCES `station` (`station_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `train_id2` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stopovers
-- ----------------------------
INSERT INTO `stopovers` VALUES ('C2003', 1, '北京南', NULL, '06:51:00');
INSERT INTO `stopovers` VALUES ('C2003', 2, '亦庄', '07:01:00', '07:03:00');
INSERT INTO `stopovers` VALUES ('C2003', 3, '天津', '07:28:00', NULL);
INSERT INTO `stopovers` VALUES ('C2018', 1, '天津', NULL, '16:01:00');
INSERT INTO `stopovers` VALUES ('C2018', 2, '亦庄', '16:25:00', '16:31:00');
INSERT INTO `stopovers` VALUES ('C2018', 3, '北京南', '16:42:00', NULL);
INSERT INTO `stopovers` VALUES ('C2025', 1, '北京南', NULL, '18:47:00');
INSERT INTO `stopovers` VALUES ('C2025', 2, '亦庄', '18:57:00', '18:59:00');
INSERT INTO `stopovers` VALUES ('C2025', 3, '武清', '19:15:00', '19:20:00');
INSERT INTO `stopovers` VALUES ('C2025', 4, '天津', '19:34:00', NULL);
INSERT INTO `stopovers` VALUES ('C2212', 1, '天津', NULL, '09:01:00');
INSERT INTO `stopovers` VALUES ('C2212', 2, '北京南', '09:36:00', NULL);
INSERT INTO `stopovers` VALUES ('C2551', 1, '北京南', NULL, '06:00:00');
INSERT INTO `stopovers` VALUES ('C2551', 2, '天津', '06:30:00', '06:33:00');
INSERT INTO `stopovers` VALUES ('C2551', 3, '滨海', '06:55:00', NULL);
INSERT INTO `stopovers` VALUES ('C2562', 1, '滨海', NULL, '09:17:00');
INSERT INTO `stopovers` VALUES ('C2562', 2, '天津', '09:39:00', '09:42:00');
INSERT INTO `stopovers` VALUES ('C2562', 3, '武清', '09:55:00', '09:57:00');
INSERT INTO `stopovers` VALUES ('C2562', 4, '北京南', '10:19:00', NULL);
INSERT INTO `stopovers` VALUES ('C2570', 1, '滨海', NULL, '11:55:00');
INSERT INTO `stopovers` VALUES ('C2570', 2, '塘沽', '12:04:00', '12:06:00');
INSERT INTO `stopovers` VALUES ('C2570', 3, '军粮城北', '12:16:00', '12:18:00');
INSERT INTO `stopovers` VALUES ('C2570', 4, '天津', '12:31:00', '12:34:00');
INSERT INTO `stopovers` VALUES ('C2570', 5, '北京南', '13:04:00', NULL);
INSERT INTO `stopovers` VALUES ('C2575', 1, '北京南', NULL, '13:00:00');
INSERT INTO `stopovers` VALUES ('C2575', 2, '武清', '13:21:00', '13:23:00');
INSERT INTO `stopovers` VALUES ('C2575', 3, '天津', '13:37:00', '13:40:00');
INSERT INTO `stopovers` VALUES ('C2575', 4, '军粮城北', '13:52:00', '13:54:00');
INSERT INTO `stopovers` VALUES ('C2575', 5, '滨海', '14:09:00', NULL);
INSERT INTO `stopovers` VALUES ('C2596', 1, '滨海', NULL, '20:31:00');
INSERT INTO `stopovers` VALUES ('C2596', 2, '天津', '20:53:00', '20:56:00');
INSERT INTO `stopovers` VALUES ('C2596', 3, '北京南', '21:26:00', NULL);
INSERT INTO `stopovers` VALUES ('C2597', 1, '北京南', NULL, '20:19:00');
INSERT INTO `stopovers` VALUES ('C2597', 2, '天津', '20:49:00', '20:52:00');
INSERT INTO `stopovers` VALUES ('C2597', 3, '塘沽', '21:09:00', '21:11:00');
INSERT INTO `stopovers` VALUES ('C2597', 4, '滨海', '21:21:00', NULL);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passenger_id` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `train_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departure_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrival_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `passenger_id`(`passenger_id` ASC) USING BTREE,
  INDEX `train_id`(`train_id` ASC) USING BTREE,
  INDEX `departure_station`(`departure_station` ASC) USING BTREE,
  INDEX `arrival_station`(`arrival_station` ASC) USING BTREE,
  INDEX `seat_id`(`seat_id` ASC) USING BTREE,
  CONSTRAINT `arrival_station` FOREIGN KEY (`arrival_station`) REFERENCES `station` (`station_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departure_station` FOREIGN KEY (`departure_station`) REFERENCES `station` (`station_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id_card`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `train_id` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('BRU32PWL', '510703200501010101', 'C2575', '武清', '天津', '01车01F号');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `train_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`train_id`) USING BTREE,
  INDEX `departure`(`departure` ASC) USING BTREE,
  INDEX `destination`(`destination` ASC) USING BTREE,
  CONSTRAINT `departure` FOREIGN KEY (`departure`) REFERENCES `station` (`station_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `destination` FOREIGN KEY (`destination`) REFERENCES `station` (`station_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('C2003', '北京南', '天津');
INSERT INTO `train` VALUES ('C2018', '天津', '北京南');
INSERT INTO `train` VALUES ('C2025', '北京南', '天津');
INSERT INTO `train` VALUES ('C2212', '天津', '北京南');
INSERT INTO `train` VALUES ('C2551', '北京南', '滨海');
INSERT INTO `train` VALUES ('C2562', '滨海', '北京南');
INSERT INTO `train` VALUES ('C2570', '滨海', '北京南');
INSERT INTO `train` VALUES ('C2575', '北京南', '滨海');
INSERT INTO `train` VALUES ('C2596', '滨海', '北京南');
INSERT INTO `train` VALUES ('C2597', '北京南', '滨海');

-- ----------------------------
-- View structure for train_schedule_view
-- ----------------------------
DROP VIEW IF EXISTS `train_schedule_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `train_schedule_view` AS select `s1`.`train_id` AS `train_id`,`s1`.`station` AS `start_station`,substring_index(`s1`.`departure_time`,':',2) AS `start_time`,`s2`.`station` AS `end_station`,substring_index(`s2`.`arrival_time`,':',2) AS `end_time`,concat(if((floor((time_to_sec(timediff(`s2`.`arrival_time`,`s1`.`departure_time`)) / 3600)) > 0),concat(floor((time_to_sec(timediff(`s2`.`arrival_time`,`s1`.`departure_time`)) / 3600)),'小时'),''),if(((floor((time_to_sec(timediff(`s2`.`arrival_time`,`s1`.`departure_time`)) / 60)) % 60) > 0),concat((floor((time_to_sec(timediff(`s2`.`arrival_time`,`s1`.`departure_time`)) / 60)) % 60),'分'),'')) AS `travel_time` from (`stopovers` `s1` join `stopovers` `s2` on((`s1`.`train_id` = `s2`.`train_id`))) where (`s1`.`sequence` < `s2`.`sequence`);

-- ----------------------------
-- Procedure structure for updateInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateInventory`;
delimiter ;;
CREATE PROCEDURE `updateInventory`(IN ticketID VARCHAR(255))
BEGIN
 UPDATE inventory
 SET ticket_status = 'available'
 WHERE train_id = (SELECT train_id FROM ticket WHERE ticket_id = ticketID)
	AND seat_id = (SELECT seat_id FROM ticket WHERE ticket_id = ticketID)
	AND (SELECT sequence FROM stopovers WHERE station = start_station AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = ticketID)) >= (SELECT sequence FROM stopovers WHERE station = (SELECT departure_station FROM ticket WHERE ticket_id = ticketID) AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = ticketID))
	AND (SELECT sequence FROM stopovers WHERE station = end_station AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = ticketID)) <= (SELECT sequence FROM stopovers WHERE station = (SELECT arrival_station FROM ticket WHERE ticket_id = ticketID) AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = ticketID));
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updatePassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `updatePassword`;
delimiter ;;
CREATE PROCEDURE `updatePassword`(IN newPwd VARCHAR(255),username VARCHAR(255))
BEGIN
	UPDATE passenger SET password = newPwd WHERE user_name = username;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table passenger
-- ----------------------------
DROP TRIGGER IF EXISTS `new_differ_old`;
delimiter ;;
CREATE TRIGGER `new_differ_old` BEFORE UPDATE ON `passenger` FOR EACH ROW BEGIN
    IF NEW.`password` = OLD.`password` THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: New password must differ from the original one!';
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ticket
-- ----------------------------
DROP TRIGGER IF EXISTS `no_duplicate_ticket`;
delimiter ;;
CREATE TRIGGER `no_duplicate_ticket` BEFORE INSERT ON `ticket` FOR EACH ROW BEGIN
	IF EXISTS(
		SELECT * FROM ticket WHERE passenger_id = NEW.passenger_id AND train_id = NEW.train_id
		                           AND departure_station = NEW.departure_station 
															 AND arrival_station = NEW.arrival_station
	) 
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT ='Error: You are trying to book a duplicate ticket!';
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ticket
-- ----------------------------
DROP TRIGGER IF EXISTS `update_inventory_after_book`;
delimiter ;;
CREATE TRIGGER `update_inventory_after_book` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
 UPDATE inventory
 SET ticket_status = 'sold'
 WHERE train_id = NEW.train_id
 AND seat_id = NEW.seat_id
 AND (
  ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = NEW.train_id) <= 
	 (SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id) 
	 AND 
	 (SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) <= 
	 (SELECT sequence FROM stopovers WHERE station = NEW.arrival_station AND train_id = NEW.train_id)
	 AND 
	 (SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) > 
	 (SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id))

  OR 
 ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = NEW.train_id) >= 
  (SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id) 
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) >= 
	(SELECT sequence FROM stopovers WHERE station = NEW.arrival_station AND train_id = NEW.train_id)
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) < 
	(SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id))

  OR 
 ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = NEW.train_id) <= 
  (SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id) 
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) >= 
	(SELECT sequence FROM stopovers WHERE station = NEW.arrival_station AND train_id = NEW.train_id))
	
  OR 
 ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = NEW.train_id) >= 
  (SELECT sequence FROM stopovers WHERE station = NEW.departure_station AND train_id = NEW.train_id) 
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = NEW.train_id) <= 
	(SELECT sequence FROM stopovers WHERE station = NEW.arrival_station AND train_id = NEW.train_id))
);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ticket
-- ----------------------------
DROP TRIGGER IF EXISTS `update_inventory_after_refund`;
delimiter ;;
CREATE TRIGGER `update_inventory_after_refund` AFTER DELETE ON `ticket` FOR EACH ROW BEGIN
 CREATE TEMPORARY TABLE tmp1 AS
 SELECT * FROM inventory;

 CREATE TEMPORARY TABLE tmp2 AS
 SELECT * FROM inventory;
 
 CREATE TEMPORARY TABLE tmp3 AS
 SELECT * FROM inventory;

 CREATE TEMPORARY TABLE tmp4 AS
 SELECT * FROM inventory;


 UPDATE inventory
 SET ticket_status = 'available'
 WHERE train_id = OLD.train_id
 AND seat_id = OLD.seat_id
 AND (
  ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = OLD.train_id) <= 
	 (SELECT sequence FROM stopovers WHERE station = OLD.departure_station AND train_id = OLD.train_id) 
	 AND 
	 (SELECT sequence FROM stopovers WHERE station = end_station AND train_id = OLD.train_id) <= 
	 (SELECT sequence FROM stopovers WHERE station = OLD.arrival_station AND train_id = OLD.train_id)
	 
	 AND 
	 (SELECT ticket_status FROM tmp1 WHERE train_id = OLD.train_id AND seat_id = OLD.seat_id AND tmp1.start_station = inventory.start_station 
	                                                               AND tmp1.end_station = OLD.departure_station) = 'available')



  OR 
 ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = OLD.train_id) >= 
  (SELECT sequence FROM stopovers WHERE station = OLD.departure_station AND train_id = OLD.train_id) 
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = OLD.train_id) >= 
	(SELECT sequence FROM stopovers WHERE station = OLD.arrival_station AND train_id = OLD.train_id)

	AND 
	(SELECT ticket_status FROM tmp2 WHERE train_id = OLD.train_id AND seat_id = OLD.seat_id AND tmp2.start_station = OLD.arrival_station 
	                                                              AND tmp2.end_station = inventory.end_station) = 'available')
  OR 
 ((SELECT sequence FROM stopovers WHERE station = start_station AND train_id = OLD.train_id) <= 
  (SELECT sequence FROM stopovers WHERE station = OLD.departure_station AND train_id = OLD.train_id) 
	AND 
	(SELECT sequence FROM stopovers WHERE station = end_station AND train_id = OLD.train_id) >= 
	(SELECT sequence FROM stopovers WHERE station = OLD.arrival_station AND train_id = OLD.train_id)

	AND 
	(SELECT ticket_status FROM tmp3 WHERE train_id = OLD.train_id AND seat_id = OLD.seat_id AND tmp3.start_station = inventory.start_station 
	                                                              AND tmp3.end_station = OLD.departure_station) = 'available' 
	AND 
	(SELECT ticket_status FROM tmp4 WHERE train_id = OLD.train_id AND seat_id = OLD.seat_id AND tmp4.start_station = OLD.arrival_station 
	                                                              AND tmp4.end_station = inventory.end_station) = 'available')
);


DROP TEMPORARY TABLE tmp1;
DROP TEMPORARY TABLE tmp2;
DROP TEMPORARY TABLE tmp3;
DROP TEMPORARY TABLE tmp4;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

