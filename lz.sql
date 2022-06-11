/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : lz

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 11/06/2022 18:06:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ylrc_book
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_book`;
CREATE TABLE `ylrc_book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cannum` int(11) NOT NULL,
  `introduce` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `parent` tinyblob NULL,
  `price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_f6ml3kbo4oid4qp6pb59k1hrx`(`book_name`) USING BTREE,
  INDEX `FKal4b8hstt8aah1whrxva9oeg9`(`category_id`) USING BTREE,
  INDEX `FKn304de2i069ybg9o6vrat7n2d`(`parent_id`) USING BTREE,
  CONSTRAINT `FKal4b8hstt8aah1whrxva9oeg9` FOREIGN KEY (`category_id`) REFERENCES `ylrc_book_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKn304de2i069ybg9o6vrat7n2d` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_book_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_book
-- ----------------------------
INSERT INTO `ylrc_book` VALUES (21, '2022-02-14 14:14:34', '2022-02-16 14:58:33', '张益达', 'java核心技术卷I', 49, 'Java入门基础', 0, 1, 11, 10, NULL, '10', '电子科技大学出版社');
INSERT INTO `ylrc_book` VALUES (22, '2022-02-14 14:15:11', '2022-02-15 23:42:56', '王宝强', '数据结构与算法', 50, '学习程序的结构和灵魂', 0, 1, 16, 10, NULL, '12', '清华大学出版社');
INSERT INTO `ylrc_book` VALUES (23, '2022-02-14 14:18:17', '2022-02-15 23:43:39', '李斯', '人与自然和谐共处', 100, '介绍人与自然如何和谐共处', 0, 1, 15, 12, NULL, '13', '长江出版社');
INSERT INTO `ylrc_book` VALUES (24, '2022-02-14 14:33:30', '2022-02-15 23:44:25', '张三', '社交技巧', 10, '从中融入群体', 0, 1, 17, 12, NULL, '15', '武汉大学出版社');
INSERT INTO `ylrc_book` VALUES (26, '2022-02-14 15:05:26', '2022-02-16 15:19:44', 'Alice', 'March Learning', 11, '学习英语', -1, 1, 14, 13, NULL, '15', '银河出版社');
INSERT INTO `ylrc_book` VALUES (27, '2022-02-14 23:45:55', '2022-02-15 23:45:55', 'Bob', '俄语学习', 10, '快速入门俄语', 0, 1, 18, 13, NULL, '14', '新华书店出版社');
INSERT INTO `ylrc_book` VALUES (30, '2022-02-16 15:18:14', '2022-02-16 15:22:47', '测试作者1', '测试图书11111', 22, '测试简介', 0, 1, 20, 19, NULL, '123', '测试出版社1');

-- ----------------------------
-- Table structure for ylrc_book_category
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_book_category`;
CREATE TABLE `ylrc_book_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `type_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfwm92qjk0c1ex1piqeowdw7y4`(`parent_id`) USING BTREE,
  CONSTRAINT `FKfwm92qjk0c1ex1piqeowdw7y4` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_book_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_book_category
-- ----------------------------
INSERT INTO `ylrc_book_category` VALUES (10, '2022-02-14 14:12:43', '2022-02-15 23:40:01', '计算机类', NULL);
INSERT INTO `ylrc_book_category` VALUES (11, '2022-02-14 14:12:50', '2022-02-15 23:40:16', '编程语言', 10);
INSERT INTO `ylrc_book_category` VALUES (12, '2022-02-14 14:12:57', '2020-11-04 14:13:06', '人文图书', NULL);
INSERT INTO `ylrc_book_category` VALUES (13, '2022-02-14 15:04:52', '2022-02-15 23:40:46', '外文类', NULL);
INSERT INTO `ylrc_book_category` VALUES (14, '2022-02-14 15:05:05', '2022-02-15 23:41:00', '英语类', 13);
INSERT INTO `ylrc_book_category` VALUES (15, '2022-02-15 23:40:35', '2022-02-15 23:40:35', '人与自然', 12);
INSERT INTO `ylrc_book_category` VALUES (16, '2022-02-15 23:41:39', '2022-02-15 23:41:39', '理论基础', 10);
INSERT INTO `ylrc_book_category` VALUES (17, '2022-02-15 23:41:47', '2022-02-15 23:41:47', '社会学', 12);
INSERT INTO `ylrc_book_category` VALUES (18, '2022-02-15 23:41:59', '2022-02-15 23:41:59', '俄语学习', 13);
INSERT INTO `ylrc_book_category` VALUES (19, '2022-02-16 15:17:33', '2022-02-16 15:17:33', '测试分类1', NULL);
INSERT INTO `ylrc_book_category` VALUES (20, '2022-02-16 15:17:44', '2022-02-16 15:17:44', '测试分类1-1', 19);

-- ----------------------------
-- Table structure for ylrc_borrow
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_borrow`;
CREATE TABLE `ylrc_borrow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `borrow_num` int(11) NOT NULL,
  `borrow_state` int(11) NOT NULL,
  `borrow_time` datetime NOT NULL,
  `expected_return_time` datetime NOT NULL,
  `over_time` int(11) NOT NULL,
  `return_time` datetime NULL DEFAULT NULL,
  `book_id` bigint(20) NULL DEFAULT NULL,
  `student_id` bigint(20) NULL DEFAULT NULL,
  `student_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1a2muh6q2ylx8frxgl7q5hfcg`(`book_id`) USING BTREE,
  INDEX `FKpml98lhdawqm8xamkhkadir64`(`student_id`) USING BTREE,
  CONSTRAINT `FK1a2muh6q2ylx8frxgl7q5hfcg` FOREIGN KEY (`book_id`) REFERENCES `ylrc_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpml98lhdawqm8xamkhkadir64` FOREIGN KEY (`student_id`) REFERENCES `ylrc_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_borrow
-- ----------------------------
INSERT INTO `ylrc_borrow` VALUES (34, 'java核心技术卷I', 0, 1, '2020-11-04 14:17:04', '2020-11-05 00:00:00', 0, '2020-11-04 14:17:42', 21, 31, 'student1');
INSERT INTO `ylrc_borrow` VALUES (35, '数据结构与算法', 0, 1, '2020-11-04 14:17:12', '2020-11-05 00:00:00', 0, '2020-11-04 14:17:28', 22, 31, 'student1');
INSERT INTO `ylrc_borrow` VALUES (36, 'java核心技术卷I', 0, 1, '2020-11-04 14:17:58', '2020-11-03 00:00:00', 1, '2020-11-04 14:28:06', 21, 31, 'student1');
INSERT INTO `ylrc_borrow` VALUES (37, '数据结构与算法', 0, 1, '2020-11-04 14:18:04', '2020-11-05 00:00:00', 0, '2020-11-04 15:03:13', 22, 31, 'student1');
INSERT INTO `ylrc_borrow` VALUES (38, '人与自然和谐共处', 0, 1, '2020-11-02 14:20:27', '2020-11-03 00:00:00', 1, '2020-11-03 14:20:33', 23, 32, 'student2');
INSERT INTO `ylrc_borrow` VALUES (39, '人与自然和谐共处', 0, 1, '2020-11-04 14:20:46', '2020-11-05 00:00:00', 1, '2022-02-14 12:11:56', 23, 32, 'student2');
INSERT INTO `ylrc_borrow` VALUES (40, 'March Learning', 0, 1, '2020-11-04 15:13:16', '2023-11-02 00:00:00', 0, '2022-02-16 15:19:44', 26, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (41, 'March Learning', 1, 0, '2020-11-04 15:44:53', '2022-11-03 00:00:00', 0, NULL, 26, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (42, '社交技巧', 0, 1, '2020-11-04 15:45:47', '2020-11-03 00:00:00', 1, '2020-11-04 16:11:48', 24, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (43, 'March Learning', 1, 0, '2020-11-04 15:55:04', '2020-11-02 00:00:00', 1, NULL, 26, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (44, '人与自然和谐共处', 0, 1, '2020-11-04 15:56:27', '2020-11-05 00:00:00', 1, '2022-02-15 22:49:32', 23, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (45, 'March Learning', 1, 0, '2020-11-04 16:19:18', '2020-11-05 00:00:00', 1, NULL, 26, 34, 'student3');
INSERT INTO `ylrc_borrow` VALUES (46, 'java核心技术卷I', 1, 0, '2022-02-16 00:01:52', '2022-02-17 00:00:00', 0, NULL, 21, 31, 'student1');
INSERT INTO `ylrc_borrow` VALUES (47, '测试图书11111', 0, 1, '2022-02-16 15:21:18', '2022-02-17 00:00:00', 0, '2022-02-16 15:22:47', 30, 36, '测试一');

-- ----------------------------
-- Table structure for ylrc_clazz
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_clazz`;
CREATE TABLE `ylrc_clazz`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `faculties_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9rd7i5767t6iq0xfili05w2ug`(`faculties_id`) USING BTREE,
  CONSTRAINT `FK9rd7i5767t6iq0xfili05w2ug` FOREIGN KEY (`faculties_id`) REFERENCES `ylrc_faculties` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_clazz
-- ----------------------------
INSERT INTO `ylrc_clazz` VALUES (12, '2022-02-02 14:08:53', '2022-02-15 23:16:59', '计算机一班', '02', '计一', '17564756475', 18);
INSERT INTO `ylrc_clazz` VALUES (13, '2022-02-07 14:09:30', '2022-02-15 23:17:24', '计算机二班', '12', '计二', '17685746354', 18);
INSERT INTO `ylrc_clazz` VALUES (14, '2022-02-03 14:59:50', '2022-02-15 23:17:58', '文法一班', '11', '文一', '18674534254', 19);
INSERT INTO `ylrc_clazz` VALUES (15, '2022-02-02 15:24:19', '2022-02-15 23:18:20', '文法二班', '测试', '文二', '13535466756', 19);
INSERT INTO `ylrc_clazz` VALUES (16, '2022-02-03 23:20:14', '2022-02-15 23:20:14', '外国语一班', '01', '外一', '15078675645', 20);
INSERT INTO `ylrc_clazz` VALUES (17, '2022-02-07 23:22:36', '2022-02-15 23:22:36', '外国语二班', '13', '外二', '15875645364', 20);

-- ----------------------------
-- Table structure for ylrc_database_bak
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_database_bak`;
CREATE TABLE `ylrc_database_bak`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filepath` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_database_bak
-- ----------------------------

-- ----------------------------
-- Table structure for ylrc_faculties
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_faculties`;
CREATE TABLE `ylrc_faculties`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leader` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `faculties_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKb5lm427hp6aa2p7ahdyc4od6c`(`faculties_id`) USING BTREE,
  CONSTRAINT `FKb5lm427hp6aa2p7ahdyc4od6c` FOREIGN KEY (`faculties_id`) REFERENCES `ylrc_faculties` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_faculties
-- ----------------------------
INSERT INTO `ylrc_faculties` VALUES (18, '2022-02-02 14:06:23', '2022-02-15 23:15:33', '教三', '计算机书籍', '张三', '计算机学院', '15', '18675645345', NULL);
INSERT INTO `ylrc_faculties` VALUES (19, '2022-02-01 14:07:02', '2022-02-15 23:16:02', '教八', '文法学院', '李四', '文法学院', '12', '18695846354', NULL);
INSERT INTO `ylrc_faculties` VALUES (20, '2022-02-01 14:07:45', '2022-02-15 23:16:30', '教二', '外文书籍', '王五', '外国语学院', '17', '15095746354', NULL);

-- ----------------------------
-- Table structure for ylrc_library
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_library`;
CREATE TABLE `ylrc_library`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `admin_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `library_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `library_floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `library_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `library_status` int(11) NOT NULL,
  `faculties_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4r10h9hrc0vwl8c7nhjt4nhyu`(`faculties_id`) USING BTREE,
  CONSTRAINT `FK4r10h9hrc0vwl8c7nhjt4nhyu` FOREIGN KEY (`faculties_id`) REFERENCES `ylrc_faculties` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_library
-- ----------------------------
INSERT INTO `ylrc_library` VALUES (8, '2022-02-02 14:10:02', '2022-02-15 23:36:55', '16857463545', '管理员3', '第一层', '一区书架', 1, 18);
INSERT INTO `ylrc_library` VALUES (10, '2022-02-02 14:11:04', '2022-02-15 23:36:50', '15046352545', '管理员2', '第一层', '二区书架', 1, 18);
INSERT INTO `ylrc_library` VALUES (11, '2022-02-02 15:02:37', '2022-02-15 23:36:45', '14352435465', '管理员3', '第三层', '三区书架', 1, 18);
INSERT INTO `ylrc_library` VALUES (12, '2022-02-15 23:37:21', '2022-02-15 23:37:21', '16574635465', '管理员4', '第三层', '四区书架', 1, 19);
INSERT INTO `ylrc_library` VALUES (13, '2022-02-15 23:37:44', '2022-02-15 23:37:44', '18674635465', '管理员5', '第三层', '五区书架', 1, 19);
INSERT INTO `ylrc_library` VALUES (14, '2022-02-15 23:38:07', '2022-02-15 23:38:07', '18674635465', '管理员6', '第四层', '六区书架', 1, 19);
INSERT INTO `ylrc_library` VALUES (15, '2022-02-15 23:38:34', '2022-02-15 23:38:34', '15463546554', '管理员7', '第五层', '七区书架', 1, 20);
INSERT INTO `ylrc_library` VALUES (16, '2022-02-15 23:39:00', '2022-02-15 23:39:00', '18697845746', '管理员8', '第五层', '八区书架', 1, 20);

-- ----------------------------
-- Table structure for ylrc_menu
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_menu`;
CREATE TABLE `ylrc_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsbtnjocfrq29e8taxdwo21gic`(`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_menu
-- ----------------------------
INSERT INTO `ylrc_menu` VALUES (2, '2022-01-06 14:26:03', '2022-01-05 18:24:53', '系统设置', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (3, '2022-01-06 16:58:55', '2022-01-05 18:26:02', '菜单管理', '/menu/list', 'mdi-view-list', 1, 2, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (5, '2022-01-02 17:04:44', '2020-03-14 18:27:53', '新增', '/menu/add', 'mdi-plus', 2, 3, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (7, '2020-03-14 17:07:43', '2020-03-15 12:11:25', '角色管理', '/role/list', 'mdi-account-settings-variant', 5, 2, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (8, '2020-03-14 18:28:48', '2020-03-21 22:04:45', '编辑', 'edit(\'/menu/edit\')', 'mdi-grease-pencil', 3, 3, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (9, '2020-03-14 18:30:00', '2020-03-21 22:08:20', '删除', 'del(\'/menu/delete\')', 'mdi-close', 4, 3, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (10, '2020-03-15 12:12:00', '2020-03-15 12:12:00', '添加', '/role/add', 'mdi-account-plus', 6, 7, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (11, '2020-03-15 12:12:36', '2020-03-21 22:10:45', '编辑', 'edit(\'/role/edit\')', 'mdi-account-edit', 7, 7, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (12, '2020-03-15 12:13:19', '2020-03-21 22:15:27', '删除', 'del(\'/role/delete\')', 'mdi-account-remove', 8, 7, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (13, '2020-03-15 12:14:52', '2020-03-15 12:17:00', '用户管理', '/user/list', 'mdi-account-multiple', 9, 2, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (14, '2020-03-15 12:15:22', '2020-03-15 12:17:27', '添加', '/user/add', 'mdi-account-plus', 10, 13, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (15, '2020-03-16 17:18:14', '2020-03-21 22:11:19', '编辑', 'edit(\'/user/edit\')', 'mdi-account-edit', 11, 13, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (16, '2020-03-16 17:19:01', '2020-03-21 22:15:36', '删除', 'del(\'/user/delete\')', 'mdi-account-remove', 12, 13, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (19, '2020-03-22 11:24:36', '2020-03-22 11:26:00', '上传图片', '/upload/upload_photo', 'mdi-arrow-up-bold-circle', 0, 13, b'0', b'0');
INSERT INTO `ylrc_menu` VALUES (20, '2020-03-22 14:09:35', '2020-03-22 14:09:47', '日志管理', '/system/operator_log_list', 'mdi-tag-multiple', 13, 2, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (21, '2020-03-22 14:11:39', '2020-03-22 14:11:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', 14, 20, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (22, '2020-03-22 14:12:57', '2020-03-22 14:46:55', '清空日志', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', 15, 20, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (23, '2020-03-22 14:46:40', '2020-03-22 14:47:09', '数据备份', '/database_bak/list', 'mdi-database', 16, 2, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (24, '2020-03-22 14:48:07', '2020-03-22 15:13:41', '备份', 'add(\'/database_bak/add\')', 'mdi-database-plus', 17, 23, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (25, '2020-03-22 14:49:03', '2020-03-22 14:49:03', '删除', 'del(\'/database_bak/delete\')', 'mdi-database-minus', 18, 23, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (26, '2020-03-22 19:36:20', '2020-03-22 19:36:20', '还原', 'restore(\'/database_bak/restore\')', 'mdi-database-minus', 19, 23, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (35, '2020-10-28 13:02:36', '2020-10-28 14:32:44', '学院管理', '', 'mdi-home-outline', 20, NULL, b'0', b'0');
INSERT INTO `ylrc_menu` VALUES (36, '2020-10-28 13:04:02', '2020-10-28 13:04:02', '学院列表', '/faculties/list', 'mdi-baby-buggy', 21, 35, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (37, '2020-10-28 13:04:38', '2020-10-29 10:02:25', '班级列表', '/clazz/list', 'mdi-assistant', 22, 35, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (38, '2020-10-28 13:06:47', '2020-10-28 13:06:47', '添加', '/faculties/add', 'mdi-animation', 23, 36, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (39, '2020-10-28 13:07:43', '2020-10-28 13:07:43', '修改', 'edit(\'/faculties/edit\')', 'mdi-marker', 24, 36, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (40, '2020-10-28 13:09:03', '2020-10-28 16:50:38', '删除', 'del(\'/faculties/delete\')', 'mdi-close-outline', 25, 36, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (41, '2020-10-28 13:09:38', '2020-10-29 10:02:37', '添加', '/clazz/add', 'mdi-arrow-up-bold-box', 26, 37, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (42, '2020-10-28 13:10:06', '2020-10-29 10:02:48', '修改', 'edit(\'/clazz/edit\')', 'mdi-approval', 27, 37, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (43, '2020-10-28 13:10:29', '2020-10-29 10:02:57', '删除', 'del(\'/clazz/delete\')', 'mdi-arrow-collapse-all', 28, 37, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (44, '2020-10-28 14:57:12', '2022-02-15 23:23:14', '书架管理', '', 'mdi-school', 31, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (45, '2020-10-28 14:59:50', '2020-10-28 15:08:14', '书架列表', '/library/list', 'mdi-home-circle', 33, 44, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (46, '2020-10-28 15:01:50', '2020-10-28 15:01:50', '新增', '/library/add', 'mdi-account-plus', 35, 45, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (48, '2020-10-28 15:02:49', '2020-10-28 15:03:44', '编辑', 'edit(\'/library/edit\')', 'mdi-account-settings-variant', 36, 45, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (49, '2020-10-28 15:04:48', '2020-10-28 15:04:48', '删除', 'del(\'/library/delete\')', 'mdi-account-remove', 37, 45, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (53, '2020-10-28 15:25:28', '2020-10-28 15:25:28', '借阅管理', '', 'mdi-rotate-3d', 0, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (54, '2020-10-28 16:10:50', '2020-10-28 16:16:50', '借阅列表', '/borrow/list', 'mdi-restore', 0, 53, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (55, '2020-10-28 16:13:33', '2020-10-28 16:18:59', '违规列表', '/violation/list', 'mdi-alert-circle', 0, 53, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (60, '2020-10-29 10:23:39', '2020-10-30 12:36:22', '借阅统计', '', 'mdi-camera-iris', 39, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (63, '2020-10-29 13:59:05', '2020-10-29 14:58:05', '归还', 'returnBook(\'/borrow/returnBook\')', 'mdi-undo-variant', 0, 54, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (67, '2020-10-30 11:32:02', '2020-10-30 15:35:28', '删除', 'del(\'/violation/delete\')', 'mdi-close', 0, 55, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (68, '2020-10-30 13:43:55', '2020-11-02 09:03:20', '图书借阅统计', '/quantity/book', 'mdi-seal', 39, 60, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (69, '2020-11-02 09:04:01', '2020-11-02 09:04:01', '学生借阅统计', '/quantity/student', 'mdi-decagram-outline', 41, 60, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (70, '2020-11-02 09:20:17', '2020-11-02 09:20:17', '图书管理', '', 'mdi-battery-90', 0, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (71, '2020-11-02 09:20:54', '2020-11-02 09:20:54', '图书列表', '/book/list', 'mdi-beaker', 0, 70, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (72, '2020-11-02 09:21:35', '2020-11-02 09:21:35', '增加图书', '/book/add', 'mdi-arrow-up-bold', 0, 71, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (73, '2020-11-02 09:22:14', '2020-11-02 09:22:14', '删除图书', 'del(\'/book/delete\')', 'mdi-battery-plus', 0, 71, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (74, '2020-11-02 09:22:49', '2020-11-02 09:22:49', '图书修改', 'edit(\'/book/edit\')', 'mdi-book-open', 0, 71, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (76, '2020-11-02 09:24:17', '2020-11-02 11:07:13', '图书借阅', 'borrow(\'/book/borrow\')', 'mdi-arrow-right-bold-box', 0, 71, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (81, '2020-11-02 09:25:54', '2020-11-02 09:25:54', '分类列表', '/category/list', 'mdi-battery-90', 0, 70, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (82, '2020-11-02 09:26:27', '2020-11-02 09:26:27', '添加分类', '/category/add', 'mdi-battery-plus', 0, 81, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (83, '2020-11-02 09:27:13', '2020-11-02 09:27:31', '删除分类', 'del(\'/category/delete\')', 'mdi-battery-charging-20', 0, 81, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (84, '2020-11-02 09:28:51', '2020-11-02 09:29:21', '修改分类', 'edit(\'/category/edit\')', 'mdi-barcode', 0, 81, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (85, '2020-11-02 19:12:24', '2020-11-02 19:12:24', '学生管理', '', 'mdi-border-color', 0, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (86, '2020-11-02 19:12:43', '2020-11-02 19:12:43', '学生列表', '/student/list', 'mdi-box-cutter', 0, 85, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (87, '2020-11-02 19:12:59', '2020-11-02 19:12:59', '添加', '/student/add', 'mdi-arrow-expand-right', 0, 86, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (88, '2020-11-02 19:13:17', '2020-11-02 19:13:17', '编辑', 'edit(\'/student/edit\')', 'mdi-format-list-numbers', 0, 86, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (89, '2020-11-02 19:13:35', '2020-11-02 19:13:35', '删除', 'del(\'/student/delete\')', 'mdi-battery-50', 0, 86, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (90, '2020-11-03 09:46:29', '2020-11-03 09:46:29', '学生借阅数量统计', '/quantity/borrow', 'mdi-cisco-webex', 55, 60, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (91, '2020-11-03 10:28:44', '2020-11-03 10:28:44', '信息展示', '', 'mdi-account', 0, NULL, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (93, '2020-11-03 10:29:33', '2020-11-03 17:51:44', '个人借阅信息', '/show/list', 'mdi-account-off', 0, 91, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (94, '2020-11-03 10:41:27', '2020-11-03 10:57:55', '二级菜单获取', '/book/category', 'mdi-zip-box', 0, 71, b'0', b'0');
INSERT INTO `ylrc_menu` VALUES (95, '2020-11-03 14:49:12', '2022-02-16 15:51:14', '书架信息', '/library/list', 'mdi-account-plus', 0, 91, b'0', b'1');
INSERT INTO `ylrc_menu` VALUES (96, '2021-01-08 15:07:14', '2022-02-09 15:07:14', '归还', 'returnBook(\'/borrow/returnBook\')', 'mdi-barcode', 0, 93, b'1', b'1');
INSERT INTO `ylrc_menu` VALUES (97, '2021-01-01 16:22:03', '2022-02-09 16:36:56', '借阅图书', '/book/addBorrow', 'mdi-window-maximize', 0, 71, b'0', b'0');

-- ----------------------------
-- Table structure for ylrc_operater_log
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_operater_log`;
CREATE TABLE `ylrc_operater_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operator` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2090 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_operater_log
-- ----------------------------

-- ----------------------------
-- Table structure for ylrc_order_auth
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_order_auth`;
CREATE TABLE `ylrc_order_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_sn` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_order_auth
-- ----------------------------

-- ----------------------------
-- Table structure for ylrc_role
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role`;
CREATE TABLE `ylrc_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `role_type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_role
-- ----------------------------
INSERT INTO `ylrc_role` VALUES (1, '2022-02-01 13:16:38', '2022-02-16 00:04:56', '超级管理员', '超级管理员拥有最高权限。', 1, 0);
INSERT INTO `ylrc_role` VALUES (9, '2022-02-01 12:04:01', '2020-11-03 15:52:16', '用户', '用户', 1, 0);
INSERT INTO `ylrc_role` VALUES (10, '2022-02-01 19:18:23', '2022-02-15 23:12:54', '学生', '拥有借书，还书等功能。', 1, 0);

-- ----------------------------
-- Table structure for ylrc_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role_authorities`;
CREATE TABLE `ylrc_role_authorities`  (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  INDEX `FKhj7ap1o1cjrl7enr9arf5f2qp`(`authorities_id`) USING BTREE,
  INDEX `FKg3xdaexmr0x1qx8omhvjtk46d`(`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_role_authorities
-- ----------------------------
INSERT INTO `ylrc_role_authorities` VALUES (9, 60);
INSERT INTO `ylrc_role_authorities` VALUES (9, 68);
INSERT INTO `ylrc_role_authorities` VALUES (9, 91);
INSERT INTO `ylrc_role_authorities` VALUES (9, 93);
INSERT INTO `ylrc_role_authorities` VALUES (9, 96);
INSERT INTO `ylrc_role_authorities` VALUES (9, 95);
INSERT INTO `ylrc_role_authorities` VALUES (10, 60);
INSERT INTO `ylrc_role_authorities` VALUES (10, 68);
INSERT INTO `ylrc_role_authorities` VALUES (10, 70);
INSERT INTO `ylrc_role_authorities` VALUES (10, 71);
INSERT INTO `ylrc_role_authorities` VALUES (10, 76);
INSERT INTO `ylrc_role_authorities` VALUES (10, 97);
INSERT INTO `ylrc_role_authorities` VALUES (10, 91);
INSERT INTO `ylrc_role_authorities` VALUES (10, 93);
INSERT INTO `ylrc_role_authorities` VALUES (10, 96);
INSERT INTO `ylrc_role_authorities` VALUES (10, 95);
INSERT INTO `ylrc_role_authorities` VALUES (1, 2);
INSERT INTO `ylrc_role_authorities` VALUES (1, 3);
INSERT INTO `ylrc_role_authorities` VALUES (1, 5);
INSERT INTO `ylrc_role_authorities` VALUES (1, 8);
INSERT INTO `ylrc_role_authorities` VALUES (1, 9);
INSERT INTO `ylrc_role_authorities` VALUES (1, 7);
INSERT INTO `ylrc_role_authorities` VALUES (1, 10);
INSERT INTO `ylrc_role_authorities` VALUES (1, 11);
INSERT INTO `ylrc_role_authorities` VALUES (1, 12);
INSERT INTO `ylrc_role_authorities` VALUES (1, 13);
INSERT INTO `ylrc_role_authorities` VALUES (1, 14);
INSERT INTO `ylrc_role_authorities` VALUES (1, 15);
INSERT INTO `ylrc_role_authorities` VALUES (1, 16);
INSERT INTO `ylrc_role_authorities` VALUES (1, 19);
INSERT INTO `ylrc_role_authorities` VALUES (1, 35);
INSERT INTO `ylrc_role_authorities` VALUES (1, 36);
INSERT INTO `ylrc_role_authorities` VALUES (1, 38);
INSERT INTO `ylrc_role_authorities` VALUES (1, 39);
INSERT INTO `ylrc_role_authorities` VALUES (1, 40);
INSERT INTO `ylrc_role_authorities` VALUES (1, 37);
INSERT INTO `ylrc_role_authorities` VALUES (1, 41);
INSERT INTO `ylrc_role_authorities` VALUES (1, 42);
INSERT INTO `ylrc_role_authorities` VALUES (1, 43);
INSERT INTO `ylrc_role_authorities` VALUES (1, 44);
INSERT INTO `ylrc_role_authorities` VALUES (1, 45);
INSERT INTO `ylrc_role_authorities` VALUES (1, 46);
INSERT INTO `ylrc_role_authorities` VALUES (1, 48);
INSERT INTO `ylrc_role_authorities` VALUES (1, 49);
INSERT INTO `ylrc_role_authorities` VALUES (1, 53);
INSERT INTO `ylrc_role_authorities` VALUES (1, 54);
INSERT INTO `ylrc_role_authorities` VALUES (1, 63);
INSERT INTO `ylrc_role_authorities` VALUES (1, 55);
INSERT INTO `ylrc_role_authorities` VALUES (1, 67);
INSERT INTO `ylrc_role_authorities` VALUES (1, 60);
INSERT INTO `ylrc_role_authorities` VALUES (1, 68);
INSERT INTO `ylrc_role_authorities` VALUES (1, 69);
INSERT INTO `ylrc_role_authorities` VALUES (1, 90);
INSERT INTO `ylrc_role_authorities` VALUES (1, 70);
INSERT INTO `ylrc_role_authorities` VALUES (1, 71);
INSERT INTO `ylrc_role_authorities` VALUES (1, 72);
INSERT INTO `ylrc_role_authorities` VALUES (1, 73);
INSERT INTO `ylrc_role_authorities` VALUES (1, 74);
INSERT INTO `ylrc_role_authorities` VALUES (1, 94);
INSERT INTO `ylrc_role_authorities` VALUES (1, 81);
INSERT INTO `ylrc_role_authorities` VALUES (1, 82);
INSERT INTO `ylrc_role_authorities` VALUES (1, 83);
INSERT INTO `ylrc_role_authorities` VALUES (1, 84);
INSERT INTO `ylrc_role_authorities` VALUES (1, 85);
INSERT INTO `ylrc_role_authorities` VALUES (1, 86);
INSERT INTO `ylrc_role_authorities` VALUES (1, 87);
INSERT INTO `ylrc_role_authorities` VALUES (1, 88);
INSERT INTO `ylrc_role_authorities` VALUES (1, 89);

-- ----------------------------
-- Table structure for ylrc_student
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_student`;
CREATE TABLE `ylrc_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `student_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` bigint(20) NULL DEFAULT NULL,
  `faculties_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_pwu0au85xk4qrm5puga73mtt8`(`student_id`) USING BTREE,
  INDEX `FKojifflll0nukkmlc0t69bjyqa`(`clazz_id`) USING BTREE,
  INDEX `FKialy9ssbhh5q1spjpc1m87skg`(`faculties_id`) USING BTREE,
  INDEX `FKe83orkk340l35tp3o39b4v859`(`role_id`) USING BTREE,
  CONSTRAINT `FKe83orkk340l35tp3o39b4v859` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKialy9ssbhh5q1spjpc1m87skg` FOREIGN KEY (`faculties_id`) REFERENCES `ylrc_faculties` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKojifflll0nukkmlc0t69bjyqa` FOREIGN KEY (`clazz_id`) REFERENCES `ylrc_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_student
-- ----------------------------
INSERT INTO `ylrc_student` VALUES (31, '2022-02-09 14:11:33', '2022-02-15 23:46:26', 1, '00001', 'student1', 12, 18, 10, '123456', '18657463545', NULL);
INSERT INTO `ylrc_student` VALUES (32, '2022-02-09 14:11:48', '2022-02-15 23:46:42', 1, '00002', 'student2', 13, 18, 10, '123456', '18675645365', NULL);
INSERT INTO `ylrc_student` VALUES (34, '2022-02-10 15:09:52', '2022-02-15 23:47:03', 1, '00003', 'student3', 14, 19, 10, '123456', '15847364756', NULL);
INSERT INTO `ylrc_student` VALUES (36, '2022-02-16 15:19:04', '2022-02-16 15:19:04', 2, '00005', '测试一', 12, 18, 10, '123456', '18675645364', NULL);

-- ----------------------------
-- Table structure for ylrc_user
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_user`;
CREATE TABLE `ylrc_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_btsosjytrl4hu7fnm1intcpo8`(`username`) USING BTREE,
  INDEX `FKg09b8o67eu61st68rv6nk8npj`(`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_user
-- ----------------------------
INSERT INTO `ylrc_user` VALUES (1, '2022-02-01 19:18:53', '2022-02-16 23:13:52', 'test@qq.com', NULL, '1508465532', '123456', 1, 1, 'admin', 1);

-- ----------------------------
-- Table structure for ylrc_violation
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_violation`;
CREATE TABLE `ylrc_violation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `reasons_for_violation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` bigint(20) NULL DEFAULT NULL,
  `borrow_id` bigint(20) NULL DEFAULT NULL,
  `student_id` bigint(20) NULL DEFAULT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK79xtrdl9qauoxgaqwxdcajrf9`(`book_id`) USING BTREE,
  INDEX `FK1whjn9mhsol8vpqcqnh4rw9hl`(`borrow_id`) USING BTREE,
  INDEX `FKhbaey7jph7s8atg5d0rl6v0ru`(`student_id`) USING BTREE,
  CONSTRAINT `FK1whjn9mhsol8vpqcqnh4rw9hl` FOREIGN KEY (`borrow_id`) REFERENCES `ylrc_borrow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK79xtrdl9qauoxgaqwxdcajrf9` FOREIGN KEY (`book_id`) REFERENCES `ylrc_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhbaey7jph7s8atg5d0rl6v0ru` FOREIGN KEY (`student_id`) REFERENCES `ylrc_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ylrc_violation
-- ----------------------------
INSERT INTO `ylrc_violation` VALUES (23, '2022-02-03 16:12:18', '2022-02-15 23:47:20', '归还逾期', 26, 43, 34, 'March Learning');
INSERT INTO `ylrc_violation` VALUES (24, '2022-02-03 12:10:01', '2022-02-15 23:47:20', '归还逾期', 23, 39, 32, '人与自然和谐共处');
INSERT INTO `ylrc_violation` VALUES (25, '2022-02-03 12:10:01', '2022-02-15 23:47:20', '归还逾期', 23, 44, 34, '人与自然和谐共处');
INSERT INTO `ylrc_violation` VALUES (26, '2022-02-02 12:10:01', '2022-02-15 23:47:20', '归还逾期', 26, 45, 34, 'March Learning');

SET FOREIGN_KEY_CHECKS = 1;
