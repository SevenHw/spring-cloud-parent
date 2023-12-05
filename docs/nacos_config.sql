/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50741
 Source Host           : localhost:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 50741
 File Encoding         : 65001

 Date: 05/12/2023 17:45:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'provider-develop.yaml', 'DEFAULT_GROUP', 'index: 88888\nserver:\n  port: 25002\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', '6aefe4e6f9cf1266b7f43ee0f772e8fd', '2023-12-04 15:26:28', '2023-12-05 15:52:06', NULL, '0:0:0:0:0:0:0:1', '', '7162e79e-fc63-453f-839c-cbb65eb2d200', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'gateway-develop.yaml', 'DEFAULT_GROUP', 'server:\n  port: 25003\nspring:\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: consumer # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://consumer  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/order/**\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', '2fb0e553a2e326e70d5c751ee6aa8570', '2023-12-04 15:29:30', '2023-12-05 15:47:59', NULL, '0:0:0:0:0:0:0:1', '', '7162e79e-fc63-453f-839c-cbb65eb2d200', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (17, 'consumer-develop.yaml', 'DEFAULT_GROUP', 'server:\n  port: 25001\n  \n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', '7f8eef10246412e5693becc791d87ea5', '2023-12-05 14:03:35', '2023-12-05 15:48:11', NULL, '0:0:0:0:0:0:0:1', '', '7162e79e-fc63-453f-839c-cbb65eb2d200', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8000', '62595fffcb5b98031f215a4197152924', '2023-12-04 15:26:28', '2023-12-04 15:26:28', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8000', '62595fffcb5b98031f215a4197152924', '2023-12-04 15:26:49', '2023-12-04 15:26:50', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (2, 3, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8000', '62595fffcb5b98031f215a4197152924', '2023-12-04 15:27:51', '2023-12-04 15:27:52', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 4, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8000', '62595fffcb5b98031f215a4197152924', '2023-12-04 15:28:37', '2023-12-04 15:28:37', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 15:29:30', '2023-12-04 15:29:30', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (5, 6, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 15:30:23', '2023-12-04 15:30:23', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'provider-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'bea97b501a41df957183365cd73d8e18', '2023-12-04 15:35:36', '2023-12-04 15:35:36', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 8, 'consumer-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 15:35:36', '2023-12-04 15:35:36', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'gateway-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', 'cbb5ccc67b0b2a9a844458b8e596be38', '2023-12-04 15:35:36', '2023-12-04 15:35:36', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 10, 'consumer.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:03:03', '2023-12-04 17:03:03', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 11, 'consumer.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:03:36', '2023-12-04 17:03:37', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (10, 12, 'consumer.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:06:15', '2023-12-04 17:06:16', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:06:29', '2023-12-04 17:06:30', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'consumer-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:06:29', '2023-12-04 17:06:30', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'consumer.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:06:29', '2023-12-04 17:06:30', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 16, 'consumer.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-04 17:06:29', '2023-12-04 17:06:30', NULL, '0:0:0:0:0:0:0:1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (2, 17, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 13:56:00', '2023-12-05 13:56:00', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (8, 18, 'consumer-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 13:56:00', '2023-12-05 13:56:00', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (10, 19, 'consumer.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 13:56:00', '2023-12-05 13:56:00', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (11, 20, 'consumer.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 13:56:00', '2023-12-05 13:56:00', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (0, 21, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9000\r\n\r\n#Ribbon负载均衡策略配置\r\nprovider: #设置的服务提供方的应用名称\r\n  ribbon:\r\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\r\n\r\n#设置Ribbon的超时时间\r\nribbon:\r\n  ConnectTimeout: 1000 #连接超时时间,毫秒\r\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\r\n\r\n#设置日志级别  feign只记录debug的级别日志\r\nlogging:\r\n  level:\r\n    cn.seven: debug', '74d3dac25143a590c91ea0b7a7ca3194', '2023-12-05 14:03:35', '2023-12-05 14:03:35', NULL, '0:0:0:0:0:0:0:1', 'I', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (13, 22, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 14:10:56', '2023-12-05 14:10:56', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (14, 23, 'consumer-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 14:10:56', '2023-12-05 14:10:56', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (15, 24, 'consumer.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 14:10:56', '2023-12-05 14:10:56', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (16, 25, 'consumer.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'a68e9ea6501620d97dbacb2e15449c29', '2023-12-05 14:10:56', '2023-12-05 14:10:56', NULL, '0:0:0:0:0:0:0:1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (7, 26, 'provider-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'bea97b501a41df957183365cd73d8e18', '2023-12-05 14:13:31', '2023-12-05 14:13:31', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (9, 27, 'gateway-develop.yml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', 'cbb5ccc67b0b2a9a844458b8e596be38', '2023-12-05 14:13:31', '2023-12-05 14:13:31', NULL, '0:0:0:0:0:0:0:1', 'D', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (17, 28, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9000\r\n\r\n#Ribbon负载均衡策略配置\r\nprovider: #设置的服务提供方的应用名称\r\n  ribbon:\r\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\r\n\r\n#设置Ribbon的超时时间\r\nribbon:\r\n  ConnectTimeout: 1000 #连接超时时间,毫秒\r\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\r\n\r\n#设置日志级别  feign只记录debug的级别日志\r\nlogging:\r\n  level:\r\n    cn.seven: debug', '74d3dac25143a590c91ea0b7a7ca3194', '2023-12-05 14:30:09', '2023-12-05 14:30:10', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (5, 29, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', 'cbb5ccc67b0b2a9a844458b8e596be38', '2023-12-05 14:35:30', '2023-12-05 14:35:30', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (5, 30, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: consumer # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://consumer  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/order/**\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', '7a848dae156be362e1a63c448885f1e4', '2023-12-05 14:41:39', '2023-12-05 14:41:40', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (5, 31, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'cloud:\n  # 网关配置\n  gateway:\n  # 路由配置:转发规则\n    routes: # 集合\n      - id: consumer # id: 唯一标识  默认uuid\n        # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n        uri: lb://consumer  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n        predicates: # predicates: 条件,用于请求网关路径匹配的规则\n          - Path=/order/**\n      - id: provider # id: 唯一标识  默认uuid\n        # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n        uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n        predicates: # predicates: 条件,用于请求网关路径匹配的规则\n          - Path=/goods/**\n    # 微服务的名称配置\n    discovery:\n      locator:\n        enabled: true #设置为true可以在路径上添微服务名称\n        lower-case-service-id: true # 允许为小写', 'ccae3f216d23af834d15f7680feb935b', '2023-12-05 14:42:45', '2023-12-05 14:42:46', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 32, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'bea97b501a41df957183365cd73d8e18', '2023-12-05 15:40:05', '2023-12-05 15:40:06', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 33, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 1023\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', '6e93fc5a8d166a17f3b31b7afecd2e30', '2023-12-05 15:43:58', '2023-12-05 15:43:59', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 34, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 1023\nserver:\n  port: 8090\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'b8833cee9475242b2267b074869c3c48', '2023-12-05 15:44:40', '2023-12-05 15:44:40', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 35, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 10222\nserver:\n  port: 8090\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'ea4f376907d7cb7803e64f35920dab09', '2023-12-05 15:47:38', '2023-12-05 15:47:39', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (5, 36, 'gateway-develop.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n    # 路由配置:转发规则\n      routes: # 集合\n        - id: consumer # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://consumer  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/order/**\n        - id: provider # id: 唯一标识  默认uuid\n          # uri: http://localhost:8000/ # uri: 转发路径  动态路由   不常用也不建议用\n          uri: lb://provider  #动态路由  从注册中心获取  规则  lb://注册中心的服务名称\n          predicates: # predicates: 条件,用于请求网关路径匹配的规则\n            - Path=/goods/**\n      # 微服务的名称配置\n      discovery:\n        locator:\n          enabled: true #设置为true可以在路径上添微服务名称\n          lower-case-service-id: true # 允许为小写', '319a7448325113b8a65f2ec138b282b8', '2023-12-05 15:47:59', '2023-12-05 15:47:59', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (17, 37, 'consumer-develop.yaml', 'DEFAULT_GROUP', '', '\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', '9bb1c7aff8f3457d700f6992b0cd5a1b', '2023-12-05 15:48:10', '2023-12-05 15:48:11', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 38, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 10222\nserver:\n  port: 25002\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'bf32826de698ec6840ce59e8deb5a4fe', '2023-12-05 15:49:43', '2023-12-05 15:49:43', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 39, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 99999999999999999\nserver:\n  port: 25002\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'fe7f75f04718d365fdd267325cb43815', '2023-12-05 15:49:55', '2023-12-05 15:49:55', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');
INSERT INTO `his_config_info` VALUES (1, 40, 'provider-develop.yaml', 'DEFAULT_GROUP', '', 'index: 99999999999999999\nserver:\n  port: 25002\n\n#Ribbon负载均衡策略配置\nprovider: #设置的服务提供方的应用名称\n  ribbon:\n    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RandomRule #策略类\n\n#设置Ribbon的超时时间\nribbon:\n  ConnectTimeout: 1000 #连接超时时间,毫秒\n  ReadTimeout: 15000 #逻辑处理超时时间，毫秒\n\n#设置日志级别  feign只记录debug的级别日志\nlogging:\n  level:\n    cn.seven: debug', 'fe7f75f04718d365fdd267325cb43815', '2023-12-05 15:52:06', '2023-12-05 15:52:06', NULL, '0:0:0:0:0:0:0:1', 'U', '7162e79e-fc63-453f-839c-cbb65eb2d200', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '7162e79e-fc63-453f-839c-cbb65eb2d200', 'develop', '开发命名空间', 'nacos', 1701667995223, 1701667995223);
INSERT INTO `tenant_info` VALUES (2, '1', '0069a165-4d80-4148-bd61-7a0f2fb81480', 'pro', '开发环境', 'nacos', 1701674203513, 1701674203513);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
