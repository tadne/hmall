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
CREATE DATABASE IF NOT EXISTS `hm-trade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hm-trade`;

-- 导出  表 hmall.order 结构
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint NOT NULL COMMENT '订单id',
  `total_fee` int NOT NULL DEFAULT '0' COMMENT '总金额，单位为分',
  `payment_type` tinyint(1) unsigned zerofill NOT NULL COMMENT '支付类型，1、支付宝，2、微信，3、扣减余额',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `status` tinyint(1) DEFAULT NULL COMMENT '订单的状态，1、未付款 2、已付款,未发货 3、已发货,未确认 4、确认收货，交易成功 5、交易取消，订单关闭 6、交易结束，已评价',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `consign_time` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '交易关闭时间',
  `comment_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `multi_key_status_time` (`status`,`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- 正在导出表  hmall.order 的数据：~6 rows (大约)
DELETE FROM `order`;
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES
	(123865420, 327900, 3, 2, 1, '2021-07-28 11:01:41', NULL, NULL, NULL, NULL, NULL, '2021-07-28 11:01:47'),
	(1654779387523936258, 135800, 3, 1, 1, '2023-05-06 09:25:24', NULL, NULL, NULL, NULL, NULL, '2023-05-06 09:25:24'),
	(1654782927348740097, 135800, 3, 1, 1, '2023-05-06 09:39:28', NULL, NULL, NULL, NULL, NULL, '2023-05-06 09:39:28'),
	(1658434251768471554, 120000, 3, 1, 1, '2023-05-16 11:28:32', NULL, NULL, NULL, NULL, NULL, '2023-05-16 11:28:32'),
	(1658453559437434882, 55400, 3, 1, 1, '2023-05-16 12:45:15', NULL, NULL, NULL, NULL, NULL, '2023-05-16 12:45:15'),
	(1659160216593354754, 156000, 3, 1, 1, '2023-05-18 11:33:16', NULL, NULL, NULL, NULL, NULL, '2023-05-18 11:33:16');

-- 导出  表 hmall.order_detail 结构
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单详情id ',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='订单详情表';

-- 正在导出表  hmall.order_detail 的数据：~10 rows (大约)
DELETE FROM `order_detail`;
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES
	(1, 123865420, 100000003145, 2, 'vivo X23 8GB+128GB 幻夜蓝 水滴屏全面屏 游戏手机 移动联通电信全网通4G手机', '{"颜色": "红色", "版本": "8GB+128GB"}', 95900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/4612/28/6223/298257/5ba22d66Ef665222f/d97ed0b25cbe8c6e.jpg!q70.jpg.webp', '2021-07-28 11:05:21', '2021-07-28 11:05:21'),
	(8, 1654779387523936258, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{"颜色": "红色", "版本": "6GB+128GB"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 09:25:24', '2023-05-06 09:25:24'),
	(9, 1654779387523936258, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{"颜色": "蓝色", "版本": "6GB+128GB"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 09:25:24', '2023-05-06 09:25:24'),
	(10, 1654782927348740097, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{"颜色": "红色", "版本": "6GB+128GB"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 09:39:28', '2023-05-06 09:39:28'),
	(11, 1654782927348740097, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{"颜色": "蓝色", "版本": "6GB+128GB"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 09:39:28', '2023-05-06 09:39:28'),
	(12, 1658434251768471554, 100002672272, 1, '荣耀V20胡歌同款手机全网通 标配版 6GB+128GB 魅丽红 游戏手机 移动联通电信4G全面屏手机 双卡双待', '{"颜色": "红色"}', 95000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/8112/20/10485/366920/5c2336deEab272fe3/12b58de5020ca1a1.jpg!q70.jpg.webp', '2023-05-16 11:28:32', '2023-05-16 11:28:32'),
	(13, 1658434251768471554, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{"颜色": "蓝色", "版本": "6GB+128GB"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-16 11:28:32', '2023-05-16 11:28:32'),
	(14, 1658453559437434882, 100002672274, 1, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{"颜色": "红色", "版本": "6GB+128GB"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-16 12:45:15', '2023-05-16 12:45:15'),
	(15, 1659160216593354754, 100001964366, 1, 'OPPO A7 全面屏拍照手机 4GB+64GB 清新粉 全网通 移动联通电信4G 双卡双待手机', '{"颜色": "粉色"}', 65400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t25564/327/2615611632/135559/d3c69840/5bebd32eN3bf6f987.jpg!q70.jpg.webp', '2023-05-18 11:33:16', '2023-05-18 11:33:16'),
	(16, 1659160216593354754, 100002624512, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{"颜色": "红色"}', 90600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2023-05-18 11:33:16', '2023-05-18 11:33:16');

-- 导出  表 hmall.order_logistics 结构
CREATE TABLE IF NOT EXISTS `order_logistics` (
  `order_id` bigint NOT NULL COMMENT '订单id，与订单表一对一',
  `logistics_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流单号',
  `logistics_company` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流公司名称',
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人手机号码',
  `province` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `town` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `street` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- 正在导出表  hmall.order_logistics 的数据：~1 rows (大约)
DELETE FROM `order_logistics`;
INSERT INTO `order_logistics` (`order_id`, `logistics_number`, `logistics_company`, `contact`, `mobile`, `province`, `city`, `town`, `street`, `create_time`, `update_time`) VALUES
	(123865420, '', '', '李四', '13838411438', '上海', '上海', '浦东新区', '航头镇', '2021-07-28 11:07:01', '2021-07-28 11:07:01');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
