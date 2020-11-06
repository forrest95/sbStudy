/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : 127.0.0.1:3306
Source Database       : wanli

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2020-11-05 18:14:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `lead` text COLLATE utf8_unicode_ci NOT NULL COMMENT '摘要',
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文章banner',
  `content_html` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容-html格式',
  `content_mark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容-markdown格式',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `status` tinyint(4) NOT NULL DEFAULT '3' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL COMMENT '文章ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_article_id_index` (`article_id`),
  KEY `article_category_category_id_index` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_category
-- ----------------------------

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL COMMENT '文章ID',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_tag_article_id_index` (`article_id`),
  KEY `article_tag_tag_id_index` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类关系',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类外部url，默认为空',
  `icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '栏目一', '', '', '0', null, null);
INSERT INTO `categories` VALUES ('2', '0', '栏目er', '', '', '0', null, null);
INSERT INTO `categories` VALUES ('3', '0', 'lanmu3', '', '', '0', null, null);
INSERT INTO `categories` VALUES ('4', '0', '4', 'aa', '', '0', null, null);
INSERT INTO `categories` VALUES ('5', '0', '5', 'bb', '', '0', null, null);
INSERT INTO `categories` VALUES ('6', '0', '6', 'cc', '', '0', null, null);
INSERT INTO `categories` VALUES ('7', '0', '7', 'd', '', '0', null, null);
INSERT INTO `categories` VALUES ('8', '0', '8', 'e', '', '0', null, null);
INSERT INTO `categories` VALUES ('9', '0', '9', 'f', '', '0', null, null);
INSERT INTO `categories` VALUES ('10', '0', '10', 'g', '', '0', null, null);
INSERT INTO `categories` VALUES ('11', '0', '11', 'h', '', '0', null, null);
INSERT INTO `categories` VALUES ('12', '0', '12', 'i', '', '0', null, null);
INSERT INTO `categories` VALUES ('13', '0', '13', 'j', '', '0', null, null);
INSERT INTO `categories` VALUES ('14', '0', '14', 'k', '', '0', null, null);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '层级关系',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `lidx` int(11) NOT NULL DEFAULT '0' COMMENT '左侧索引',
  `ridx` int(11) NOT NULL DEFAULT '0' COMMENT '右侧索引',
  `depth` int(11) NOT NULL DEFAULT '0' COMMENT '层级',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_lidx_index` (`lidx`),
  KEY `comments_ridx_index` (`ridx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for lanmu
-- ----------------------------
DROP TABLE IF EXISTS `lanmu`;
CREATE TABLE `lanmu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lanmu
-- ----------------------------
INSERT INTO `lanmu` VALUES ('1', '栏目一');
INSERT INTO `lanmu` VALUES ('2', '栏目二');
INSERT INTO `lanmu` VALUES ('3', '栏目3');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网址',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', 'baidu', 'http://www.baidu.com', '百度');
INSERT INTO `links` VALUES ('2', 'qq', 'http://www.qq.com', '腾讯');
INSERT INTO `links` VALUES ('4', 'wangyi', 'http://www.wangyi.com', '网易');
INSERT INTO `links` VALUES ('5', 'xiaomi', 'http://www.xiaomi.com', '小米');
INSERT INTO `links` VALUES ('6', 'f', 'fff', 'fffff');
INSERT INTO `links` VALUES ('7', 'bb', 'nn11', 'mm');
INSERT INTO `links` VALUES ('8', '', '', '');
INSERT INTO `links` VALUES ('9', '', '', '');
INSERT INTO `links` VALUES ('10', '', '', '');
INSERT INTO `links` VALUES ('11', '111', '222', '333');
INSERT INTO `links` VALUES ('12', 'aa1', 'aa2', 'aa3');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单关系',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单对应的权限',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单链接地址',
  `active` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单高亮地址',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '0', '控制台', 'fa fa-dashboard', 'system.index', 'admin/dash', 'admin/dash', '后台首页', '5', '2017-03-19 20:52:20', '2017-03-22 10:15:06');
INSERT INTO `menus` VALUES ('2', '0', '系统管理', 'fa fa-cog', 'system.manage', 'admin/role*,admin/permission*,admin/user*,admin/menu*,admin/log*', 'admin/role*,admin/permission*,admin/user*,admin/menu*,admin/log*', '系统功能管理', '5', '2017-03-19 20:52:20', '2017-03-27 18:28:08');
INSERT INTO `menus` VALUES ('3', '2', '用户管理', 'fa fa-users', 'user.list', 'admin/user', 'admin/user*', '显示用户管理', '1', '2017-03-19 20:52:20', '2017-03-22 17:20:19');
INSERT INTO `menus` VALUES ('4', '2', '角色管理', 'fa fa-male', 'role.list', 'admin/role', 'admin/role*', '显示角色管理', '3', '2017-03-19 20:52:20', '2017-03-27 18:29:22');
INSERT INTO `menus` VALUES ('5', '2', '权限管理', 'fa fa-paper-plane', 'permission.list', 'admin/permission', 'admin/permission*', '显示权限管理', '4', '2017-03-19 20:52:20', '2017-03-22 17:20:29');
INSERT INTO `menus` VALUES ('6', '0', '菜单管理', 'fa fa-navicon', 'menu.list', 'admin/menu', 'admin/menu*', '显示菜单管理', '6', '2017-03-19 20:52:20', '2017-03-27 18:28:36');
INSERT INTO `menus` VALUES ('7', '2', '系统日志', 'fa fa-file-text-o', 'log.all', 'admin/log', 'admin/log*', '显示系统日志', '2', '2017-03-19 20:52:20', '2017-03-27 18:29:22');
INSERT INTO `menus` VALUES ('8', '0', '博客管理', 'fa fa-diamond', 'system.blog', 'admin/article*,admin/category*,admin/tag*,admin/link*,admin/setting*,admin/media*', 'admin/article*,admin/category*,admin/tag*,admin/link*,admin/setting*,admin/media*', '博客管理', '4', '2017-03-19 20:52:20', '2017-03-27 18:28:08');
INSERT INTO `menus` VALUES ('9', '0', '文章管理', 'fa fa-paw', 'article.list', 'admin/article', 'admin/article', '文章管理', '5', '2017-03-19 20:52:20', '2017-03-27 18:28:36');
INSERT INTO `menus` VALUES ('10', '8', '分类管理', 'fa fa-list-ul', 'category.list', 'admin/category', 'admin/category*', '分类管理', '5', '2017-03-19 20:52:20', '2017-03-27 18:30:25');
INSERT INTO `menus` VALUES ('11', '8', '标签管理', 'fa fa-tags', 'tag.list', 'admin/tag', 'admin/tag*', '标签管理', '4', '2017-03-19 20:52:20', '2017-03-27 18:30:25');
INSERT INTO `menus` VALUES ('12', '8', '友情链接', 'fa fa-link', 'link.list', 'admin/link', 'admin/link*', '友情链接', '3', '2017-03-19 20:52:20', '2017-03-27 18:30:25');
INSERT INTO `menus` VALUES ('13', '8', '博客配置', 'fa fa-cogs', 'blog.list', 'admin/setting', 'admin/setting*', '博客配置', '2', '2017-03-19 20:52:20', '2017-03-27 18:30:25');
INSERT INTO `menus` VALUES ('14', '8', '七牛图片', 'fa fa-image', 'media.list', 'admin/media', 'admin/media*', '七牛图片', '1', '2017-03-19 20:52:20', '2017-03-27 18:30:25');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2015_01_15_105324_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('4', '2015_01_15_114412_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('5', '2015_01_26_115212_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('6', '2015_01_26_115523_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('7', '2015_02_09_132439_create_permission_user_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_11_03_173731_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_12_08_154342_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('10', '2016_12_09_101452_create_tags_table', '1');
INSERT INTO `migrations` VALUES ('11', '2016_12_09_114002_create_articles_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_12_09_135006_article_tag_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_12_09_153644_article_category_table', '1');
INSERT INTO `migrations` VALUES ('14', '2016_12_14_112255_create_settings_table', '1');
INSERT INTO `migrations` VALUES ('15', '2016_12_14_135049_create_links_table', '1');
INSERT INTO `migrations` VALUES ('16', '2016_12_19_174339_create_comments_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '登录后台权限', 'system.login', '登录后台权限', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('2', '后台首页', 'system.index', '后台首页', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('3', '系统管理', 'system.manage', '系统管理', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('4', '显示菜单列表', 'menu.list', '显示菜单列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('5', '创建菜单', 'menu.create', '创建菜单', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('6', '删除菜单', 'menu.destroy', '删除菜单', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('7', '修改菜单', 'menu.edit', '修改菜单', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('8', '查看菜单', 'menu.show', '查看菜单', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('9', '显示角色列表', 'role.list', '显示角色列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('10', '创建角色', 'role.create', '创建角色', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('11', '删除角色', 'role.destroy', '删除角色', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('12', '修改角色', 'role.edit', '修改角色', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('13', '查看角色权限', 'role.show', '查看角色权限', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('14', '显示权限列表', 'permission.list', '显示权限列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('15', '创建权限', 'permission.create', '创建权限', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('16', '删除权限', 'permission.destroy', '删除权限', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('17', '修改权限', 'permission.edit', '修改权限', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('18', '显示用户列表', 'user.list', '显示用户列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('19', '创建用户', 'user.create', '创建用户', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('20', '修改用户', 'user.edit', '修改用户', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('21', '删除用户', 'user.destroy', '删除用户', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('22', '查看用户信息', 'user.show', '查看用户信息', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('23', '修改用户密码', 'user.reset', '修改用户密码', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('24', '日志管理', 'log.list', '日志管理', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('25', '删除日志', 'log.destroy', '删除日志', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('26', '查看日志', 'log.show', '查看日志', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('27', '下载日志', 'log.download', '下载日志', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('28', '筛选日志信息', 'log.filter', '筛选日志信息', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('29', '博客管理', 'system.blog', '博客管理', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('30', '文章列表', 'article.list', '文章列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('31', '创建文章', 'article.create', '创建文章', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('32', '删除文章', 'article.destroy', '删除文章', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('33', '修改文章', 'article.edit', '修改文章', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('34', '发布文章', 'article.push', '发布文章', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('35', '草稿箱', 'article.audit', '草稿箱', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('36', '查看文章', 'article.show', '查看文章', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('37', '分类列表', 'category.list', '分类列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('38', '创建分类', 'category.create', '创建分类', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('39', '删除分类', 'category.destroy', '删除分类', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('40', '修改分类', 'category.edit', '修改分类', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('41', '查看分类', 'category.show', '查看分类', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('42', '标签列表', 'tag.list', '标签列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('43', '创建标签', 'tag.create', '创建标签', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('44', '删除标签', 'tag.destroy', '删除标签', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('45', '修改标签', 'tag.edit', '修改标签', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('46', '友情链接列表', 'link.list', '友情链接列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('47', '添加友情链接', 'link.create', '添加友情链接', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('48', '删除友情链接', 'link.destroy', '删除友情链接', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('49', '修改友情链接', 'link.edit', '修改友情链接', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('50', '博客配置列表', 'blog.list', '博客配置列表', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('51', '博客配置修改', 'blog.edit', '博客配置修改', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('52', '七牛图片管理', 'media.list', '七牛图片管理', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permissions` VALUES ('53', '七牛图片管理', 'media.destroy', '七牛图片管理', null, '2017-03-19 20:52:19', '2017-03-19 20:52:19');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('2', '2', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('3', '3', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('4', '4', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('5', '5', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('6', '6', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('7', '7', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('8', '8', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('9', '9', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('10', '10', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('11', '11', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('12', '12', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('13', '13', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('14', '14', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('15', '15', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('16', '16', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('17', '17', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('18', '18', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('19', '19', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('20', '20', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('21', '21', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('22', '22', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('23', '23', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('24', '24', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('25', '25', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('26', '26', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('27', '27', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('28', '28', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('29', '29', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('30', '30', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('31', '31', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('32', '32', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('33', '33', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('34', '34', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `permission_role` VALUES ('35', '35', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('36', '36', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('37', '37', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('38', '38', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('39', '39', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('40', '40', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('41', '41', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('42', '42', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('43', '43', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('44', '44', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('45', '45', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('46', '46', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('47', '47', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('48', '48', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('49', '49', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('50', '50', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('51', '51', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('52', '52', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('53', '53', '1', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('54', '1', '2', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `permission_role` VALUES ('55', '2', '2', '2017-03-19 20:52:20', '2017-03-19 20:52:20');

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_user
-- ----------------------------
INSERT INTO `permission_user` VALUES ('1', '1', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('2', '2', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('3', '3', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('4', '29', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('5', '52', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('6', '53', '10', '2017-03-23 10:18:57', '2017-03-23 10:18:57');
INSERT INTO `permission_user` VALUES ('8', '25', '20', '2017-03-27 10:21:39', '2017-03-27 10:21:39');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', 'admin', '超级管理员', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');
INSERT INTO `roles` VALUES ('2', '普通用户', 'user', '普通用户', '1', '2017-03-19 20:52:19', '2017-03-19 20:52:19');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '22', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `role_user` VALUES ('2', '2', '2', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `role_user` VALUES ('3', '2', '3', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `role_user` VALUES ('4', '2', '4', '2017-03-19 20:52:20', '2017-03-19 20:52:20');
INSERT INTO `role_user` VALUES ('5', '1', '8', '2017-03-21 19:32:04', '2017-03-21 19:32:04');
INSERT INTO `role_user` VALUES ('7', '2', '10', '2017-03-23 10:16:48', '2017-03-23 10:16:48');
INSERT INTO `role_user` VALUES ('8', '1', '15', '2017-03-24 11:13:19', '2017-03-24 11:13:19');
INSERT INTO `role_user` VALUES ('9', '2', '15', '2017-03-24 11:13:19', '2017-03-24 11:13:19');
INSERT INTO `role_user` VALUES ('10', '2', '19', '2017-03-27 09:35:19', '2017-03-27 09:35:19');
INSERT INTO `role_user` VALUES ('11', '2', '20', '2017-03-27 09:52:01', '2017-03-27 09:52:01');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('0e91e95bb8c61290ffdeb9fb457b51bb', 'eyJpdiI6IjN0VjFnd05LMUpQRWlkTEZOV3B1K1E9PSIsInZhbHVlIjoiR0x1ejFGVmJaQVZremExeTBtRDBkS0I1TU5RbEE1eUs1cm1cL0RTQ1RYSlFBYlpwXC92MGx3Y3NWMWVRUFwvZDcrNlBQVFJLUTVQcE5SUWk1OGJIZ0ZIb3g2VFNLTjVWZzkxdGZQaHRaYVwvc2tuOFRKd1NcL01yRFFtcUxLVVdWWmtEY3lKSGp2ZGxlSTVOZjJodDJSd3h0bXBTanUwSWNqWU9sM2hUa1B3TmtkTWZcL3dNK2Q5bElYdHg2Z0tQTndDcWxLbWNqbHJEVFU2VndDXC9oNnZsSHdud2FycHZiVUIzNkFJc25uWXlndU9Pd0YyUFAxaGNaS0E1RENoXC9WK1dzTnFZWG1ibEdKUWZNakhTUEgxbUJPUHg0Zjhnb0loVHo4SUNLXC9GdkU5MTFiclE2SEtBRkZUXC9HSnVYemFBak9Jb2tvXC9rZURyQmxcL0g5UFRZRVRSMkloc1p4MUllQXNVZ21vRGJZaitETkwyZ1Bld2xnTnZraDFJNjJRYVVhNXZJTVBDYlY2bnc4SHNabnFUbXF4T3RQQyszeXp2MzZDVlQ0WnhRQmx1K2Y3TlRFQVJzMGtIOTdpcDdoeEUraDdCZjVcL0NMcGtieldsVmRxblRMdjkrRVY2N05uclV2Q1l5UzIxWW95cDN0R2d5SGZRZ3NCaEpCbVlTODNLU2tBYnlObkVIcjdDU09YT0dIeUlZT0FOT0RWRGNhUmZwaERlRzZRQmE1U0xBeDQ5Z3hLanZMYU9mVm5HSm9LRlkxcDgwVzhudForRm9GVUtVeGQyQzVCZW5oaTJPNGw0U1ZCczdTZTRLejVFaCtKMnFQVG4rUXFINUlnSmRPelJ3M05nVllHOXVDZHpYK1ZTRnNxVnl3WlkwRTZqZWhWZWlQbEJ3dUpkZ042MStlSG5qcDVrVUJXUG9NNUNFeTRpMis0cklNSzJZVXpldnl3Tm5NU2V5MTRhM0huQW54RE0xNDF4c0RFR2w1TSt2dzQwNWwyK1hjeGgwKzVZV0Y0WFRCUEFGNDdHbXhZcWhNcFBDRnp0bGlKRjltYVRoTTQ0MGxzQmgxZVF4WUYyR0VpbklqUFFjdXJORmU5XC9rQ3c4Um40dHRLOGRaVFNCbDJpbXRtQW9nZ1ZlYWpTS0QrUzF3XC9ub0xDN2xub1RabDcrTlAzNWoxaEU3UHFYN09jUHRveWNsMlwvYnFGa2lwYWVxWitNTnZ3a0ZJeHFXQzRzRUgrdU1lZzA5VTNCdzVLdExoZUhvUDJ4SHNzUWg3dHdpaE83N0VzMnE1czhkTVNZUWloR0FFbXloVjgrdXFKXC9MWURKSkY2Uml6cUpXb0V1WnJ1Z0FSb29sOFJQSmVTOEFpak8ydEs0elMxNnZzWkt0cnVXXC8zRlNuMTlSUktqMllJQUVJU3FqYXhEbytNcnNYMFFIbFJiS1BVVzUybVwvVTJ3Mml5aTVVbzVXdENJVGRDajZ6UmVZckVoNUFlWld0STdHUlpYeTlLS1J1K1YwYXNGaE1kMHp1d25ReSszK1wvRllLdnFwMUZzTUg5Z09CSGR5ZjM0QWp6RzNRVE5heWhuS0NjaTExMmxRZW00RkI4UXQxRE8xWlVYbTFVRWgrQjZuMmpNTXlDNlVWVDZURjZlSDNmcHBWQWF5KzNvZ1pLdXhVWVlnR0pHaFVNeXFYdGVtUHAxaDlQUTRwRDhJY2R1b2JxenpiMnZuNVQwYjFlR0hXS0dnRGxVNU9cL0l5dWRFVEtndHdRYnF4Y09LUzlweWR0bTlGK3hZazE5ZXBkUmNldUI0UGU0WG9QZ3hORXRzVVM1elQ4NDdocGNKMzNqQWtkaEU0eWhmcmlQaHpuSXRVVFZrajE1WHFCTG1oajNxT051ZFNTUjduS0hKMjl2WERKdjd6azdVZiswNWNEeFZMT1hLV3J2S0xpMitreVVBRjdZSk1RemltbTNaQnM3a2N2WlZVSXBRdFVlNDNtZkRcL3o4Qm5jVVVRUHROVzJIRnIzQjNCekJERzZDY1h3TTdGSVwvRTM1cStqNGZOTGJTbWp2T1RtcXB3Tlg2T3pEMlwvNmk0cXB3MVIyZkRBSkJkK1RFczJINitmd1FaWDJLZFRqRGFzTkZqQ0VkRmcwZ0hlQnlFTGhTSU5OMTZ5RUZTXC9jSW45WGN4aFpOa0FnV1pLNUdCalA4TVo5OHdGaHQ2cmhYSnhEUVBtXC9nMDNpT052UHVCNStUbjlCRzNuNCthOHlkNmk1eWVZblk1eWZNZnhvRFRcL2dKTDdySWg5THViUUE0a3RocHhYNnFxQ1lZTXJHdDg3dHFcL01UZmcxZXpUZFdpVlZtaFE4bmk3XC9RaUlObllMUDdJYnZQXC9tS2I1cFgzMGdsZndYTDN2Nm1PbTROb1c3N2I2QWVcL210bjQxaDFxeDI0bWplV05KbHpUVGVoVmtWeUl3Rjh1Ync1eFwvZzd2cStZN2xrTzhOdXJGMm0xaUhudWM3djVHOG03XC9rMkt4dHNTUFRtK2NrZXBSS1B2Z3BvVFwvRjRQWnhUWGJibzFQMkxidzl2Y3RkbGNpb1hjUTNOMGJtbE1mdytCOWU1dzRPb1FHRUp6WXkrbURUSmx3YWtlMkI5U2VaTTZcL2ErbEJ1c3hESElCd1lKTE1EQlZ2OGtyaStGemFpVDF2cHNtNCtOY1RJWDBBWWRoaEQ4SUpBcmdDc0lMNklxU3V4UDhmUXZCUzBMNjh0dkhBNThJYnFSbXdLMko3bzhEbGN3TDBJZHFEaTBDVGd2dG5sbG1pWUw1RmhRbDM1ZUlwTGx2TzUxd1k9IiwibWFjIjoiMDgzZmY2M2JiYzRiYmU3N2U3YzZmZjMzY2RjMDEwYzJmMTg4OWFjNzAxYTg2MjgyODJmYjJjMTNhODAyM2UzNyJ9');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'baidu', 'http://www.baidu.com', '百度', null, null);
INSERT INTO `test` VALUES ('2', 'qq', 'http://www.qq.com', '腾讯', null, null);

-- ----------------------------
-- Table structure for test2
-- ----------------------------
DROP TABLE IF EXISTS `test2`;
CREATE TABLE `test2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网站描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test2
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `job` varchar(20) DEFAULT NULL COMMENT '工作岗位',
  `mgr` int(11) DEFAULT NULL COMMENT '上级领导的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1001', 'king', '董事长', null);
INSERT INTO `t_employee` VALUES ('1002', 'jack', '技术总监', '1001');
INSERT INTO `t_employee` VALUES ('1003', 'paul', '财务总监', '1001');
INSERT INTO `t_employee` VALUES ('1004', 'tom', '销售总监', '1001');
INSERT INTO `t_employee` VALUES ('1005', 'tomas', '技术一部经理', '1002');
INSERT INTO `t_employee` VALUES ('1006', 'linda', '技术二部经理', '1002');
INSERT INTO `t_employee` VALUES ('1007', 'lucy', '会计', '1003');
INSERT INTO `t_employee` VALUES ('1008', 'lily', '出纳', '1003');
INSERT INTO `t_employee` VALUES ('1009', 'terry', '销售一部经理', '1004');
INSERT INTO `t_employee` VALUES ('1010', 'emma', '销售二部经理', '1004');
INSERT INTO `t_employee` VALUES ('1011', 'may', '软件工程师', '1005');
INSERT INTO `t_employee` VALUES ('1012', 'bella', '软件工程师', '1005');
INSERT INTO `t_employee` VALUES ('1013', 'kelly', '软件工程师', '1006');

-- ----------------------------
-- Table structure for t_player
-- ----------------------------
DROP TABLE IF EXISTS `t_player`;
CREATE TABLE `t_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_player
-- ----------------------------
INSERT INTO `t_player` VALUES ('1', '张三', '1');
INSERT INTO `t_player` VALUES ('2', '李四', '1');
INSERT INTO `t_player` VALUES ('3', '王五', '2');
INSERT INTO `t_player` VALUES ('4', '赵六', '2');
INSERT INTO `t_player` VALUES ('5', '钱7', '3');
INSERT INTO `t_player` VALUES ('6', '球员8', '3');
INSERT INTO `t_player` VALUES ('7', '球员9', '4');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', 'aafrr', '5', '44111');
INSERT INTO `t_student` VALUES ('22', '李四', '11', '98');
INSERT INTO `t_student` VALUES ('52', '郭靖', '99', '88');
INSERT INTO `t_student` VALUES ('53', 'aa', '44', '55');
INSERT INTO `t_student` VALUES ('54', 'tt', '11', '111');
INSERT INTO `t_student` VALUES ('55', 'aa', '77', '777');

-- ----------------------------
-- Table structure for t_team
-- ----------------------------
DROP TABLE IF EXISTS `t_team`;
CREATE TABLE `t_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_team
-- ----------------------------
INSERT INTO `t_team` VALUES ('1', '球队1');
INSERT INTO `t_team` VALUES ('2', '球队2');
INSERT INTO `t_team` VALUES ('3', '球队三');
INSERT INTO `t_team` VALUES ('4', '球队四');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '账号',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('22', 'www', '', 'www@qq.com', '$2y$10$Qyu5b0EzlSHR0pYqWxp4Se3iESYlhUIFxmg/gQ5Ro7SRoUnt2jKby', null, '2017-03-27 20:02:20', '2017-03-27 20:02:20');

-- ----------------------------
-- Table structure for wenzhang
-- ----------------------------
DROP TABLE IF EXISTS `wenzhang`;
CREATE TABLE `wenzhang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `lanmu_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wenzhang
-- ----------------------------
INSERT INTO `wenzhang` VALUES ('1', '文章1', '内容1', '1');
INSERT INTO `wenzhang` VALUES ('2', '文章2', '内容2', '1');
INSERT INTO `wenzhang` VALUES ('3', '文章3', '内容3', '2');
INSERT INTO `wenzhang` VALUES ('4', '文章4', '内容4', '2');
INSERT INTO `wenzhang` VALUES ('5', '文章5', '内容5', '3');
INSERT INTO `wenzhang` VALUES ('6', 'wenzhang6', 'neirong6', '3');
