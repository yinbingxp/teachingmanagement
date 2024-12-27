/*
 Navicat Premium Data Transfer

 Source Server         : springbot
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : teaching-manager

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 27/12/2024 18:41:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `administrator_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`administrator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, '管理员', 'admine', 'admine');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '课程表ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher_id` int NULL DEFAULT NULL COMMENT '任课教师',
  `credit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学分',
  `hour` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学时',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课时间',
  `place_id` int NULL DEFAULT NULL COMMENT '地点id',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '简介描述',
  `course_status_id` int NULL DEFAULT NULL COMMENT '课程状态',
  `is_delete` int NULL DEFAULT 0 COMMENT '0代表没有删除，1代表已经删除了。',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `course_place_idx`(`place_id` ASC) USING BTREE,
  INDEX `course_status_idx`(`course_status_id` ASC) USING BTREE,
  INDEX `course_teacher_idx`(`teacher_id` ASC) USING BTREE,
  CONSTRAINT `course_place` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_status` FOREIGN KEY (`course_status_id`) REFERENCES `course_status` (`course_status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for course_application
-- ----------------------------
DROP TABLE IF EXISTS `course_application`;
CREATE TABLE `course_application`  (
  `course_application_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师的id(申请人)',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `course_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_credit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学分',
  `course_hour` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学时',
  `course_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课时间（可能需要改进）',
  `course_place_id` int NULL DEFAULT NULL COMMENT '上课地点id',
  `course_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程描述',
  `course_examination_id` int NULL DEFAULT NULL COMMENT '课程审批状态',
  `operation_id` int NULL DEFAULT NULL COMMENT '申请的操作，有新增，修改和删除。',
  `date_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`course_application_id`) USING BTREE,
  UNIQUE INDEX `course_id_UNIQUE`(`course_id` ASC) USING BTREE,
  INDEX `application_examination_idx`(`course_examination_id` ASC) USING BTREE,
  INDEX `application_operation_idx`(`operation_id` ASC) USING BTREE,
  INDEX `application_place_idx`(`course_place_id` ASC) USING BTREE,
  INDEX `application_teacher_idx`(`teacher_id` ASC) USING BTREE,
  CONSTRAINT `application_examination` FOREIGN KEY (`course_examination_id`) REFERENCES `course_examination` (`course_examination_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `application_operation` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `application_place` FOREIGN KEY (`course_place_id`) REFERENCES `place` (`place_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程申请记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_application
-- ----------------------------

-- ----------------------------
-- Table structure for course_examination
-- ----------------------------
DROP TABLE IF EXISTS `course_examination`;
CREATE TABLE `course_examination`  (
  `course_examination_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批流程中的名称',
  PRIMARY KEY (`course_examination_id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程审批表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_examination
-- ----------------------------
INSERT INTO `course_examination` VALUES (2, '已通过');
INSERT INTO `course_examination` VALUES (1, '待审批');
INSERT INTO `course_examination` VALUES (3, '未通过');

-- ----------------------------
-- Table structure for course_status
-- ----------------------------
DROP TABLE IF EXISTS `course_status`;
CREATE TABLE `course_status`  (
  `course_status_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`course_status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_status
-- ----------------------------
INSERT INTO `course_status` VALUES (1, '等待课程安排');
INSERT INTO `course_status` VALUES (2, '可选');
INSERT INTO `course_status` VALUES (3, '已结课');
INSERT INTO `course_status` VALUES (4, '授课中');
INSERT INTO `course_status` VALUES (5, '待选');

-- ----------------------------
-- Table structure for course_switch
-- ----------------------------
DROP TABLE IF EXISTS `course_switch`;
CREATE TABLE `course_switch`  (
  `course_switch_id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL COMMENT '1代表启动选课，0代表关闭选课',
  PRIMARY KEY (`course_switch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程的开启与关闭表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_switch
-- ----------------------------
INSERT INTO `course_switch` VALUES (1, 0);

-- ----------------------------
-- Table structure for courses_students
-- ----------------------------
DROP TABLE IF EXISTS `courses_students`;
CREATE TABLE `courses_students`  (
  `courses_students_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `student_id` int NULL DEFAULT NULL COMMENT '学生id',
  `score` float NULL DEFAULT NULL COMMENT '课程成绩',
  PRIMARY KEY (`courses_students_id`) USING BTREE,
  INDEX `students_idx`(`student_id` ASC) USING BTREE,
  CONSTRAINT `students` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程与学生之间的选择（学生选课，课程被选）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_students
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`department_id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '人工智能学院');
INSERT INTO `department` VALUES (2, '人文学院');
INSERT INTO `department` VALUES (11, '医学院');
INSERT INTO `department` VALUES (4, '商学院');
INSERT INTO `department` VALUES (6, '外国语言文学院');
INSERT INTO `department` VALUES (9, '建筑学院');
INSERT INTO `department` VALUES (10, '机械工程学院');
INSERT INTO `department` VALUES (12, '理学院');
INSERT INTO `department` VALUES (13, '电子与信息技术学院');
INSERT INTO `department` VALUES (3, '社会科学学院');
INSERT INTO `department` VALUES (7, '美术学院');
INSERT INTO `department` VALUES (5, '航空航天学院');
INSERT INTO `department` VALUES (8, '马克思主义学院');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation`  (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作名称',
  PRIMARY KEY (`operation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户操作信息表，如新增，删除，修改等' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (1, '新增');
INSERT INTO `operation` VALUES (2, '修改');
INSERT INTO `operation` VALUES (3, '删除');

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `place_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点名称',
  PRIMARY KEY (`place_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES (1, '15号楼101');
INSERT INTO `place` VALUES (2, '15号楼201');
INSERT INTO `place` VALUES (3, '15号楼301');
INSERT INTO `place` VALUES (4, '15号楼401');
INSERT INTO `place` VALUES (5, '16号楼101');
INSERT INTO `place` VALUES (6, '16号楼110');
INSERT INTO `place` VALUES (7, '物理楼318');
INSERT INTO `place` VALUES (8, '物理楼201');
INSERT INTO `place` VALUES (9, '医学院520');
INSERT INTO `place` VALUES (10, '医学院211');
INSERT INTO `place` VALUES (11, '16号楼201');
INSERT INTO `place` VALUES (12, '16号楼301');
INSERT INTO `place` VALUES (13, '物理楼109');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int NOT NULL AUTO_INCREMENT COMMENT '学生ID（不可见）',
  `student_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `student_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生班级',
  `date_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '123456' COMMENT '密码',
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE INDEX `student_number_UNIQUE`(`student_number` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` int NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `teacher_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师工号',
  `department_id` int NULL DEFAULT NULL COMMENT '学院id',
  `date_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '123456' COMMENT '密码',
  PRIMARY KEY (`teacher_id`) USING BTREE,
  UNIQUE INDEX `teacher_number_UNIQUE`(`teacher_number` ASC) USING BTREE,
  INDEX `teacher_department_idx`(`department_id` ASC) USING BTREE,
  CONSTRAINT `teacher_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
