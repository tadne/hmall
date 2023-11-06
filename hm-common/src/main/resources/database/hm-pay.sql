-- --------------------------------------------------------
-- 主机:                           192.168.150.101
-- 服务器版本:                        8.0.27 - MySQL Community Server - GPL
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 hmall 的数据库结构
CREATE DATABASE IF NOT EXISTS `hm-pay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hm-pay`;

-- 导出  表 hmall.pay_order 结构
CREATE TABLE IF NOT EXISTS `pay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_order_no` bigint NOT NULL COMMENT '业务订单号',
  `pay_order_no` bigint NOT NULL DEFAULT '0' COMMENT '支付单号',
  `biz_user_id` bigint NOT NULL COMMENT '支付用户id',
  `pay_channel_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '支付渠道编码',
  `amount` int NOT NULL COMMENT '支付金额，单位分',
  `pay_type` tinyint NOT NULL DEFAULT '5' COMMENT '支付类型，1：h5,2:小程序，3：公众号，4：扫码，5：余额支付',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态，0：待提交，1:待支付，2：支付超时或取消，3：支付成功',
  `expand_json` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拓展字段，用于传递不同渠道单独处理的字段',
  `result_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '第三方返回业务码',
  `result_msg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '第三方返回提示信息',
  `pay_success_time` datetime DEFAULT NULL COMMENT '支付成功时间',
  `pay_over_time` datetime NOT NULL COMMENT '支付超时时间',
  `qr_code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付二维码链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creater` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `updater` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `biz_order_no` (`biz_order_no`) USING BTREE,
  UNIQUE KEY `pay_order_no` (`pay_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1659160218174607364 DEFAULT CHARSET=utf8mb3 COMMENT='支付订单';

-- 正在导出表  hmall.pay_order 的数据：~0 rows (大约)
DELETE FROM `pay_order`;
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES
	(1658455441987891201, 1658453559437434882, 1658455441975308289, 1, 'balance', 55400, 5, 3, '', '', '', '2023-05-16 21:14:57', '2023-05-16 22:52:45', NULL, '2023-05-16 20:52:44', '2023-05-18 19:38:03', 0, 0, b'0'),
	(1659160218174607363, 1659160216593354754, 1659160218174607362, 1, 'balance', 156000, 5, 3, '', '', '', '2023-05-18 19:34:48', '2023-05-18 21:33:16', NULL, '2023-05-18 19:33:16', '2023-05-18 19:37:54', 0, 0, b'0');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
