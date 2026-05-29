DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','e99a18c428cb38d5f260853678922e03','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `rental_user`;
CREATE TABLE `rental_user`(rental_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '出租用户ID',
`lessors_name` varchar(64) comment '出租人名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (rental_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '出租用户';

DROP TABLE IF EXISTS `tenant_user`;
CREATE TABLE `tenant_user`(tenant_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '承租用户ID',
`name_of_the_lessee` varchar(64) comment '租赁人名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (tenant_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '承租用户';

DROP TABLE IF EXISTS `house_information`;
CREATE TABLE `house_information`(house_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋信息ID',
`house_no` varchar(64) comment '房屋编号',
`house_name` varchar(64) comment '房屋名称',
`cover` varchar(255) comment '封面',
`house_type` varchar(64) comment '房屋类型',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`house_details` longtext comment '房屋详情',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (house_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '房屋信息';
insert into `house_information` values (1,'房屋编号1','房屋名称1','/api/upload/1569136373586198529.jpg','房屋类型1',1,1,'厅室1','详细地址1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'出租人名1',344,606,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (2,'房屋编号2','房屋名称2','/api/upload/1569136129385431040.jpg','房屋类型2',2,2,'厅室2','详细地址2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'出租人名2',73,865,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (3,'房屋编号3','房屋名称3','/api/upload/1569136210197086209.jpg','房屋类型3',3,3,'厅室3','详细地址3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'出租人名3',902,401,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (4,'房屋编号4','房屋名称4','/api/upload/1569136087618551809.jpg','房屋类型4',4,4,'厅室4','详细地址4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'出租人名4',335,156,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (5,'房屋编号5','房屋名称5','/api/upload/1569136327922810881.jpg','房屋类型5',5,5,'厅室5','详细地址5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'出租人名5',529,319,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (6,'房屋编号6','房屋名称6','/api/upload/1569135973319573504.jpg','房屋类型6',6,6,'厅室6','详细地址6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'出租人名6',328,704,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (7,'房屋编号7','房屋名称7','/api/upload/1569136281571557376.jpg','房屋类型7',7,7,'厅室7','详细地址7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'出租人名7',110,700,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');
insert into `house_information` values (8,'房屋编号8','房屋名称8','/api/upload/1569136028508225536.jpg','房屋类型8',8,8,'厅室8','详细地址8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'出租人名8',250,833,'未审核',0,'2025-06-06 09:52:58','2025-06-06 09:52:58');

DROP TABLE IF EXISTS `housing_application`;
CREATE TABLE `housing_application`(housing_application_id int(11) NOT NULL AUTO_INCREMENT COMMENT '看房申请ID',
`house_no` varchar(64) comment '房屋编号',
`house_name` varchar(64) comment '房屋名称',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`remarks` varchar(64) comment '看房备注',
`date_of_viewing` date comment '看房日期',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housing_application_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '看房申请';
insert into `housing_application` values (1,'房屋编号1','房屋名称1',1,1,'厅室1','详细地址1',0,'出租人名1',0,'看房备注1','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (2,'房屋编号2','房屋名称2',2,2,'厅室2','详细地址2',0,'出租人名2',0,'看房备注2','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (3,'房屋编号3','房屋名称3',3,3,'厅室3','详细地址3',0,'出租人名3',0,'看房备注3','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (4,'房屋编号4','房屋名称4',4,4,'厅室4','详细地址4',0,'出租人名4',0,'看房备注4','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (5,'房屋编号5','房屋名称5',5,5,'厅室5','详细地址5',0,'出租人名5',0,'看房备注5','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (6,'房屋编号6','房屋名称6',6,6,'厅室6','详细地址6',0,'出租人名6',0,'看房备注6','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (7,'房屋编号7','房屋名称7',7,7,'厅室7','详细地址7',0,'出租人名7',0,'看房备注7','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `housing_application` values (8,'房屋编号8','房屋名称8',8,8,'厅室8','详细地址8',0,'出租人名8',0,'看房备注8','2025-06-06','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');

DROP TABLE IF EXISTS `lease_application`;
CREATE TABLE `lease_application`(lease_application_id int(11) NOT NULL AUTO_INCREMENT COMMENT '租赁申请ID',
`house_no` varchar(64) comment '房屋编号',
`house_name` varchar(64) comment '房屋名称',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`lease_application` text comment '租赁申请',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (lease_application_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '租赁申请';
insert into `lease_application` values (1,'房屋编号1','房屋名称1',1,1,'厅室1','详细地址1',0,'出租人名1',0,'租赁申请1','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (2,'房屋编号2','房屋名称2',2,2,'厅室2','详细地址2',0,'出租人名2',0,'租赁申请2','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (3,'房屋编号3','房屋名称3',3,3,'厅室3','详细地址3',0,'出租人名3',0,'租赁申请3','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (4,'房屋编号4','房屋名称4',4,4,'厅室4','详细地址4',0,'出租人名4',0,'租赁申请4','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (5,'房屋编号5','房屋名称5',5,5,'厅室5','详细地址5',0,'出租人名5',0,'租赁申请5','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (6,'房屋编号6','房屋名称6',6,6,'厅室6','详细地址6',0,'出租人名6',0,'租赁申请6','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (7,'房屋编号7','房屋名称7',7,7,'厅室7','详细地址7',0,'出租人名7',0,'租赁申请7','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `lease_application` values (8,'房屋编号8','房屋名称8',8,8,'厅室8','详细地址8',0,'出租人名8',0,'租赁申请8','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');

DROP TABLE IF EXISTS `contract_information`;
CREATE TABLE `contract_information`(contract_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '合同信息ID',
`contract_no` varchar(64) comment '合同号',
`house_name` varchar(64) comment '房屋名称',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`lease_time` varchar(64) comment '租赁时间',
`contract_documents` varchar(255) comment '合同文件',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (contract_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '合同信息';
insert into `contract_information` values (1,'合同号1','房屋名称1',1,1,'厅室1','详细地址1',0,'出租人名1',0,'租赁时间1','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (2,'合同号2','房屋名称2',2,2,'厅室2','详细地址2',0,'出租人名2',0,'租赁时间2','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (3,'合同号3','房屋名称3',3,3,'厅室3','详细地址3',0,'出租人名3',0,'租赁时间3','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (4,'合同号4','房屋名称4',4,4,'厅室4','详细地址4',0,'出租人名4',0,'租赁时间4','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (5,'合同号5','房屋名称5',5,5,'厅室5','详细地址5',0,'出租人名5',0,'租赁时间5','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (6,'合同号6','房屋名称6',6,6,'厅室6','详细地址6',0,'出租人名6',0,'租赁时间6','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (7,'合同号7','房屋名称7',7,7,'厅室7','详细地址7',0,'出租人名7',0,'租赁时间7','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `contract_information` values (8,'合同号8','房屋名称8',8,8,'厅室8','详细地址8',0,'出租人名8',0,'租赁时间8','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');

DROP TABLE IF EXISTS `payment_information`;
CREATE TABLE `payment_information`(payment_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '缴费信息ID',
`payment_no` varchar(64) comment '缴费号',
`contract_no` varchar(64) comment '合同号',
`house_name` varchar(64) comment '房屋名称',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`payment_name` varchar(64) comment '缴费名称',
`payment_amount` int(11) DEFAULT 0 comment '缴费金额',
`payment_date` date comment '缴费日期',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (payment_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '缴费信息';
insert into `payment_information` values (1,'缴费号1','合同号1','房屋名称1',0,'出租人名1',0,'缴费名称1',1,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (2,'缴费号2','合同号2','房屋名称2',0,'出租人名2',0,'缴费名称2',2,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (3,'缴费号3','合同号3','房屋名称3',0,'出租人名3',0,'缴费名称3',3,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (4,'缴费号4','合同号4','房屋名称4',0,'出租人名4',0,'缴费名称4',4,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (5,'缴费号5','合同号5','房屋名称5',0,'出租人名5',0,'缴费名称5',5,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (6,'缴费号6','合同号6','房屋名称6',0,'出租人名6',0,'缴费名称6',6,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (7,'缴费号7','合同号7','房屋名称7',0,'出租人名7',0,'缴费名称7',7,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `payment_information` values (8,'缴费号8','合同号8','房屋名称8',0,'出租人名8',0,'缴费名称8',8,'2025-06-06','未支付','支付宝',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');

DROP TABLE IF EXISTS `rent_out_application`;
CREATE TABLE `rent_out_application`(rent_out_application_id int(11) NOT NULL AUTO_INCREMENT COMMENT '退租申请ID',
`contract_no` varchar(64) NOT NULL UNIQUE comment '合同号',
`house_name` varchar(64) comment '房屋名称',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`reasons_for_rent_cancellation` text comment '退租原因',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (rent_out_application_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '退租申请';
insert into `rent_out_application` values (1,'合同号1','房屋名称1',1,1,'厅室1','详细地址1',0,'出租人名1',0,'退租原因1','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (2,'合同号2','房屋名称2',2,2,'厅室2','详细地址2',0,'出租人名2',0,'退租原因2','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (3,'合同号3','房屋名称3',3,3,'厅室3','详细地址3',0,'出租人名3',0,'退租原因3','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (4,'合同号4','房屋名称4',4,4,'厅室4','详细地址4',0,'出租人名4',0,'退租原因4','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (5,'合同号5','房屋名称5',5,5,'厅室5','详细地址5',0,'出租人名5',0,'退租原因5','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (6,'合同号6','房屋名称6',6,6,'厅室6','详细地址6',0,'出租人名6',0,'退租原因6','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (7,'合同号7','房屋名称7',7,7,'厅室7','详细地址7',0,'出租人名7',0,'退租原因7','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');
insert into `rent_out_application` values (8,'合同号8','房屋名称8',8,8,'厅室8','详细地址8',0,'出租人名8',0,'退租原因8','未审核','',0,'2025-06-06 09:52:59','2025-06-06 09:52:59');

DROP TABLE IF EXISTS `message_message`;
CREATE TABLE `message_message`(message_message_id int(11) NOT NULL AUTO_INCREMENT COMMENT '留言信息ID',
`house_name` varchar(64) comment '房屋名称',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`message_content` text comment '留言内容',
`message_date` date comment '留言日期',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (message_message_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '留言信息';
insert into `message_message` values (1,'房屋名称1','厅室1','详细地址1',0,'出租人名1',0,'留言内容1','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (2,'房屋名称2','厅室2','详细地址2',0,'出租人名2',0,'留言内容2','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (3,'房屋名称3','厅室3','详细地址3',0,'出租人名3',0,'留言内容3','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (4,'房屋名称4','厅室4','详细地址4',0,'出租人名4',0,'留言内容4','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (5,'房屋名称5','厅室5','详细地址5',0,'出租人名5',0,'留言内容5','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (6,'房屋名称6','厅室6','详细地址6',0,'出租人名6',0,'留言内容6','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (7,'房屋名称7','厅室7','详细地址7',0,'出租人名7',0,'留言内容7','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `message_message` values (8,'房屋名称8','厅室8','详细地址8',0,'出租人名8',0,'留言内容8','2025-06-06','未审核','',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');

DROP TABLE IF EXISTS `housing_evaluation`;
CREATE TABLE `housing_evaluation`(housing_evaluation_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋评价ID',
`contract_no` varchar(64) NOT NULL UNIQUE comment '合同号',
`house_name` varchar(64) comment '房屋名称',
`deposit` int(11) DEFAULT 0 comment '押金',
`rent` int(11) DEFAULT 0 comment '租金',
`hall` varchar(64) comment '厅室',
`detailed_address` varchar(64) comment '详细地址',
`rental_user` int(11) DEFAULT 0 comment '出租用户',
`lessors_name` varchar(64) comment '出租人名',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`evaluation_grade` varchar(64) comment '评价等级',
`evaluation_content` longtext comment '评价内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housing_evaluation_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '房屋评价';
insert into `housing_evaluation` values (1,'合同号1','房屋名称1',1,1,'厅室1','详细地址1',0,'出租人名1',0,'评价等级1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (2,'合同号2','房屋名称2',2,2,'厅室2','详细地址2',0,'出租人名2',0,'评价等级2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (3,'合同号3','房屋名称3',3,3,'厅室3','详细地址3',0,'出租人名3',0,'评价等级3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (4,'合同号4','房屋名称4',4,4,'厅室4','详细地址4',0,'出租人名4',0,'评价等级4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (5,'合同号5','房屋名称5',5,5,'厅室5','详细地址5',0,'出租人名5',0,'评价等级5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (6,'合同号6','房屋名称6',6,6,'厅室6','详细地址6',0,'出租人名6',0,'评价等级6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (7,'合同号7','房屋名称7',7,7,'厅室7','详细地址7',0,'出租人名7',0,'评价等级7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `housing_evaluation` values (8,'合同号8','房屋名称8',8,8,'厅室8','详细地址8',0,'出租人名8',0,'评价等级8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');

DROP TABLE IF EXISTS `house_type`;
CREATE TABLE `house_type`(house_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋类型ID',
`house_type` varchar(64) comment '房屋类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (house_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '房屋类型';
insert into `house_type` values (1,'房屋类型1',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (2,'房屋类型2',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (3,'房屋类型3',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (4,'房屋类型4',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (5,'房屋类型5',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (6,'房屋类型6',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (7,'房屋类型7',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');
insert into `house_type` values (8,'房屋类型8',0,'2025-06-06 09:53:00','2025-06-06 09:53:00');

insert into `auth` values ('1','管理员','出租用户','rental_user','出租用户','/rental_user/table','','_blank','1','1','1','1','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('2','管理员','出租用户','rental_user','出租用户详情','/rental_user/view','','_blank','1','1','1','1','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('3','管理员','承租用户','tenant_user','承租用户','/tenant_user/table','','_blank','1','1','1','1','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('4','管理员','承租用户','tenant_user','承租用户详情','/tenant_user/view','','_blank','1','1','1','1','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('5','管理员','房屋信息','house_information','房屋信息','/house_information/table','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"figure":true,"examine":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('6','管理员','房屋信息','house_information','房屋信息详情','/house_information/view','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('7','管理员','房屋信息','house_information','房屋信息','/house_information/list','top','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('8','管理员','房屋信息','house_information','房屋信息详情','/house_information/details','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('9','管理员','看房申请','housing_application','看房申请','/housing_application/table','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('10','管理员','看房申请','housing_application','看房申请详情','/housing_application/view','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('11','管理员','看房申请','housing_application','看房申请','/housing_application/edit','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('12','管理员','租赁申请','lease_application','租赁申请','/lease_application/table','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('13','管理员','租赁申请','lease_application','租赁申请详情','/lease_application/view','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('14','管理员','租赁申请','lease_application','租赁申请','/lease_application/edit','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('15','管理员','合同信息','contract_information','合同信息','/contract_information/table','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('16','管理员','合同信息','contract_information','合同信息详情','/contract_information/view','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('17','管理员','缴费信息','payment_information','缴费信息','/payment_information/table','','_blank','1','1','1','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{"figure":true,"pay":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('18','管理员','缴费信息','payment_information','缴费信息详情','/payment_information/view','','_blank','1','1','1','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('19','管理员','退租申请','rent_out_application','退租申请','/rent_out_application/table','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('20','管理员','退租申请','rent_out_application','退租申请详情','/rent_out_application/view','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('21','管理员','留言信息','message_message','留言信息','/message_message/table','','_blank','1','1','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('22','管理员','留言信息','message_message','留言信息详情','/message_message/view','','_blank','1','1','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('23','管理员','留言信息','message_message','留言信息','/message_message/edit','','_blank','1','1','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('24','管理员','房屋评价','housing_evaluation','房屋评价','/housing_evaluation/table','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{"figure":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('25','管理员','房屋评价','housing_evaluation','房屋评价详情','/housing_evaluation/view','','_blank','1','1','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('26','管理员','房屋类型','house_type','房屋类型','/house_type/table','','_blank','1','1','1','1','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('27','管理员','房屋类型','house_type','房屋类型详情','/house_type/view','','_blank','1','1','1','1','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('28','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('29','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('30','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('31','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('32','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('33','管理员','新闻','article','新闻列表','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('34','管理员','新闻','article','新闻详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('35','管理员','新闻','article','热点新闻','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('36','管理员','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('37','管理员','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('38','管理员','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('39','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('40','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('41','管理员','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('42','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('43','游客','出租用户','rental_user','出租用户','/rental_user/table','','_blank','1','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('44','游客','出租用户','rental_user','出租用户详情','/rental_user/view','','_blank','1','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('45','游客','承租用户','tenant_user','承租用户','/tenant_user/table','','_blank','1','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('46','游客','承租用户','tenant_user','承租用户详情','/tenant_user/view','','_blank','1','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('47','游客','房屋信息','house_information','房屋信息','/house_information/table','','_blank','0','0','0','0','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"figure":false,"examine":false,"can_show_comment":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('48','游客','房屋信息','house_information','房屋信息详情','/house_information/view','','_blank','0','0','0','0','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('49','游客','房屋信息','house_information','房屋信息','/house_information/list','top','_blank','0','0','0','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('50','游客','房屋信息','house_information','房屋信息详情','/house_information/details','','_blank','0','0','0','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"can_comment":false,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('51','游客','看房申请','housing_application','看房申请','/housing_application/table','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('52','游客','看房申请','housing_application','看房申请详情','/housing_application/view','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('53','游客','看房申请','housing_application','看房申请','/housing_application/edit','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('54','游客','租赁申请','lease_application','租赁申请','/lease_application/table','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('55','游客','租赁申请','lease_application','租赁申请详情','/lease_application/view','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('56','游客','租赁申请','lease_application','租赁申请','/lease_application/edit','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('57','游客','合同信息','contract_information','合同信息','/contract_information/table','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('58','游客','合同信息','contract_information','合同信息详情','/contract_information/view','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('59','游客','缴费信息','payment_information','缴费信息','/payment_information/table','','_blank','0','0','0','0','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{"figure":false,"pay":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('60','游客','缴费信息','payment_information','缴费信息详情','/payment_information/view','','_blank','0','0','0','0','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('61','游客','退租申请','rent_out_application','退租申请','/rent_out_application/table','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('62','游客','退租申请','rent_out_application','退租申请详情','/rent_out_application/view','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('63','游客','留言信息','message_message','留言信息','/message_message/table','','_blank','0','0','0','0','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('64','游客','留言信息','message_message','留言信息详情','/message_message/view','','_blank','0','0','0','0','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('65','游客','留言信息','message_message','留言信息','/message_message/edit','','_blank','0','0','0','0','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('66','游客','房屋评价','housing_evaluation','房屋评价','/housing_evaluation/table','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{"figure":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('67','游客','房屋评价','housing_evaluation','房屋评价详情','/housing_evaluation/view','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('68','游客','房屋类型','house_type','房屋类型','/house_type/table','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('69','游客','房屋类型','house_type','房屋类型详情','/house_type/view','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('70','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('71','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('72','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('73','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('74','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('75','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('76','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('77','游客','新闻','article','热点新闻','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('78','游客','新闻','article','新闻详情','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('79','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('80','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('81','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('82','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('83','游客','公告','notice','公告','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('84','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('85','出租用户','出租用户','rental_user','出租用户','/rental_user/table','','_blank','0','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('86','出租用户','出租用户','rental_user','出租用户详情','/rental_user/view','','_blank','0','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('87','出租用户','承租用户','tenant_user','承租用户','/tenant_user/table','','_blank','0','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('88','出租用户','承租用户','tenant_user','承租用户详情','/tenant_user/view','','_blank','0','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('89','出租用户','房屋信息','house_information','房屋信息','/house_information/table','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"figure":false,"examine":false,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('90','出租用户','房屋信息','house_information','房屋信息详情','/house_information/view','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('91','出租用户','房屋信息','house_information','房屋信息','/house_information/list','top','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('92','出租用户','房屋信息','house_information','房屋信息详情','/house_information/details','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('93','出租用户','看房申请','housing_application','看房申请','/housing_application/table','','_blank','0','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('94','出租用户','看房申请','housing_application','看房申请详情','/housing_application/view','','_blank','0','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('95','出租用户','看房申请','housing_application','看房申请','/housing_application/edit','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('96','出租用户','租赁申请','lease_application','租赁申请','/lease_application/table','','_blank','0','0','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('97','出租用户','租赁申请','lease_application','租赁申请详情','/lease_application/view','','_blank','0','0','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('98','出租用户','租赁申请','lease_application','租赁申请','/lease_application/edit','','_blank','0','0','0','0','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('99','出租用户','合同信息','contract_information','合同信息','/contract_information/table','','_blank','1','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('100','出租用户','合同信息','contract_information','合同信息详情','/contract_information/view','','_blank','1','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('101','出租用户','缴费信息','payment_information','缴费信息','/payment_information/table','','_blank','1','0','0','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{"figure":false,"pay":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('102','出租用户','缴费信息','payment_information','缴费信息详情','/payment_information/view','','_blank','1','0','0','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('103','出租用户','退租申请','rent_out_application','退租申请','/rent_out_application/table','','_blank','0','0','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('104','出租用户','退租申请','rent_out_application','退租申请详情','/rent_out_application/view','','_blank','0','0','1','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('105','出租用户','留言信息','message_message','留言信息','/message_message/table','','_blank','0','0','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{"examine":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('106','出租用户','留言信息','message_message','留言信息详情','/message_message/view','','_blank','0','0','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('107','出租用户','留言信息','message_message','留言信息','/message_message/edit','','_blank','0','0','0','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('108','出租用户','房屋评价','housing_evaluation','房屋评价','/housing_evaluation/table','','_blank','0','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{"figure":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('109','出租用户','房屋评价','housing_evaluation','房屋评价详情','/housing_evaluation/view','','_blank','0','0','0','0','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('110','出租用户','房屋类型','house_type','房屋类型','/house_type/table','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('111','出租用户','房屋类型','house_type','房屋类型详情','/house_type/view','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('112','出租用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('113','出租用户','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('114','出租用户','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('115','出租用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('116','出租用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('117','出租用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('118','出租用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('119','出租用户','新闻','article','热点新闻','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('120','出租用户','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('121','出租用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('122','出租用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('123','出租用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('124','出租用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('125','出租用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('126','出租用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('127','承租用户','出租用户','rental_user','出租用户','/rental_user/table','','_blank','0','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('128','承租用户','出租用户','rental_user','出租用户详情','/rental_user/view','','_blank','0','0','0','0','lessors_name,gender','lessors_name,gender','lessors_name,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('129','承租用户','承租用户','tenant_user','承租用户','/tenant_user/table','','_blank','0','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('130','承租用户','承租用户','tenant_user','承租用户详情','/tenant_user/view','','_blank','0','0','0','0','name_of_the_lessee,gender','name_of_the_lessee,gender','name_of_the_lessee,gender',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('131','承租用户','房屋信息','house_information','房屋信息','/house_information/table','','_blank','0','0','0','0','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"figure":false,"examine":false,"can_show_comment":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('132','承租用户','房屋信息','house_information','房屋信息详情','/house_information/view','','_blank','0','0','0','0','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('133','承租用户','房屋信息','house_information','房屋信息','/house_information/list','top','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('134','承租用户','房屋信息','house_information','房屋信息详情','/house_information/details','','_blank','1','1','1','1','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name','house_no,house_name,cover,house_type,deposit,rent,hall,detailed_address,house_details,rental_user,lessors_name',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('135','承租用户','看房申请','housing_application','看房申请','/housing_application/table','','_blank','0','0','0','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('136','承租用户','看房申请','housing_application','看房申请详情','/housing_application/view','','_blank','0','0','0','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('137','承租用户','看房申请','housing_application','看房申请','/housing_application/edit','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,remarks,date_of_viewing',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('138','承租用户','租赁申请','lease_application','租赁申请','/lease_application/table','','_blank','0','0','0','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('139','承租用户','租赁申请','lease_application','租赁申请详情','/lease_application/view','','_blank','0','0','0','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('140','承租用户','租赁申请','lease_application','租赁申请','/lease_application/edit','','_blank','1','1','1','1','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application','house_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_application',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('141','承租用户','合同信息','contract_information','合同信息','/contract_information/table','','_blank','0','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('142','承租用户','合同信息','contract_information','合同信息详情','/contract_information/view','','_blank','0','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,lease_time,contract_documents',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('143','承租用户','缴费信息','payment_information','缴费信息','/payment_information/table','','_blank','0','0','0','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{"figure":false,"pay":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('144','承租用户','缴费信息','payment_information','缴费信息详情','/payment_information/view','','_blank','0','0','0','1','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date','payment_no,contract_no,house_name,rental_user,lessors_name,tenant_user,payment_name,payment_amount,payment_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('145','承租用户','退租申请','rent_out_application','退租申请','/rent_out_application/table','','_blank','1','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('146','承租用户','退租申请','rent_out_application','退租申请详情','/rent_out_application/view','','_blank','1','0','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,reasons_for_rent_cancellation',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('147','承租用户','留言信息','message_message','留言信息','/message_message/table','','_blank','0','1','0','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{"examine":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('148','承租用户','留言信息','message_message','留言信息详情','/message_message/view','','_blank','0','1','0','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('149','承租用户','留言信息','message_message','留言信息','/message_message/edit','','_blank','1','1','1','1','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date','house_name,hall,detailed_address,rental_user,lessors_name,tenant_user,message_content,message_date',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('150','承租用户','房屋评价','housing_evaluation','房屋评价','/housing_evaluation/table','','_blank','1','1','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{"figure":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('151','承租用户','房屋评价','housing_evaluation','房屋评价详情','/housing_evaluation/view','','_blank','1','1','0','1','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content','contract_no,house_name,deposit,rent,hall,detailed_address,rental_user,lessors_name,tenant_user,evaluation_grade,evaluation_content',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('152','承租用户','房屋类型','house_type','房屋类型','/house_type/table','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('153','承租用户','房屋类型','house_type','房屋类型详情','/house_type/view','','_blank','0','0','0','0','house_type','house_type','house_type',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('154','承租用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('155','承租用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('156','承租用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('157','承租用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('158','承租用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('159','承租用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('160','承租用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('161','承租用户','新闻','article','热点新闻','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('162','承租用户','新闻','article','新闻详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('163','承租用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('164','承租用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('165','承租用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('166','承租用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('167','承租用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `auth` values ('168','承租用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `user_group` values ('3','100','出租用户',null,'rental_user','rental_user_id','0','1','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `user_group` values ('4','100','承租用户',null,'tenant_user','tenant_user_id','0','3','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1602151376865984513.jpg','91','2025-06-06 09:53:00.0','2025-06-06 09:53:00.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1602151497791963137.jpg','680','2025-06-06 09:53:01.0','2025-06-06 09:53:01.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1602151661130743809.jpg','417','2025-06-06 09:53:01.0','2025-06-06 09:53:01.0');
insert into `article` values ('1','防疫措施优化后一周：天津二手房成交量暴涨86%，外地客户蜂拥而至','房屋','829','0','2025-06-06 09:53:03.0','2025-06-06 09:53:03.0',null,null,null,'<p>12月5日至12月11日，根据贝壳数据，天津市二手房成交1210套，环比上周涨86%，达3个月来峰值。有销售人员对《华夏时报》记者表示，疫情管控措施优化后，原先怕隔离、怕弹窗而不敢赴津的北京、河北的客户群激活。</p><p>“高考红利”是天津楼市不可不说的魅力。有销售称天津的购房者30%是本地人，70%是外地客户，外地客户买房为的就是给子女“降低约100分的高考录取分数”，在人生关键处推孩子一把。</p><p>另有销售人员表示，以往那些不合规的落户手段越来越难施展了，当下花个三四十万在天津交社保再买房积分落户是最“科学”的方式。记者获悉，2023年始，在天津市购新房可直接积分，最高可一次性加30分，之后每年再加15分。也有销售人士称“这是针对期房的，最好买快建好的期房，以免烂尾。”</p><p>合硕机构首席分析师郭毅认为，“如果天津的产业无法建立更好的发展趋势，天津楼市很难有明显的起色，所以我认为天津市场的价格低迷状态，会在一段时间内保持筑底态势。”</p><p><strong>上周二手房成交量暴涨</strong></p><p>今年国庆假期，天津市的多位房产销售曾对《华夏时报》记者表示，疫情缘故导致天津不少中介门店关闭，天津市的核心客户群——北京客户也几乎没人敢去，去了要隔离，回来或弹窗。12月12日，天津市的销售曹越（化名）喜悦地对记者表示，“放心大胆来！除非二手房业主要求出示，否则没人查核酸，我们上周二手房成交火爆。”</p><p>贝壳找房数据显示，天津市上周（12月5日至12月11日）二手房成交1210套，环比前一周上涨86%，是9月以来成交量最高的一周，达3个月来新高，尤其周末两日成交量超500套。</p><p>天津市上周二手房成交量暴涨由哪些因素导致？</p><p>曹越（化名）认为，“核心原因是疫情防控政策放宽，积压数月的北京、河北等地客户，在核酸检验取消后，开始来津看房、买房，客户们认为，如果能赶在今年年底前，以首套贷款3.9%的利率入手，就能减少还贷压力。”</p><p>曹越称，“目前来津购房的客户70%是外地客户，本地客户仅占30%。”天津为什么如此吸引外地客户？</p><p>12月12日，资深中介人士陈淮（化名）对记者表示，“外地客户多是奔着户口去的，由于集体户口无法参加高考，所以必须买套房把户口落定。买房的客户多是为了让孩子享受高考红利。”</p><p>据了解，天津市的高考分数比河北、河南等高考大省低大约100分。陈淮称，“高考分数低，就是天津楼市多年来的‘秘密武器’，不少家长认为，花个几十万给孩子换来高考100来分，就是在孩子人生命运的转折处推了一把。”</p><p>去年上半年，记者曾前往天津实地调查，彼时整个宝坻区均笼罩在“买房落户”的氛围中，有开发商为给客户落户便利，专门设计超小户型，出售后不仅可以后期托管，还提供一条龙服务，通过特殊渠道将不符合落户条件的“白人”变成“专业人才”落户。</p><p>12月12日，合硕机构首席分析师郭毅在接受《华夏时报》记者采访时表示，“去天津买房的人群中，来自北京市的家长们占多数。根据北京的相关政策，非京籍初中生只能考取职高，因此不少北漂选择将户口迁移到天津，如此既能享受高考红利，在京津两地通勤也不影响工作。”</p><p>去年，天津市出台文件，对部分通过不合规手段获取天津户口的“假天津人”进行了“户口清退”，对“高考移民”也提高门槛，要求须在天津有3年学籍才能参加高考。陈淮认为，不合规的落户手段不仅存在隐患、方式也已过时，当前积分落户政策进一步放松，“白人”（没有大学学历的购房者）两三年就能落户天津。</p>','/api/upload/1602951948724600832.jpg',null);
insert into `article` values ('2','诸葛找房：2022年第50周重点城市新房成交微降 二手房转升 武汉、济南','房屋','833','0','2025-06-06 09:53:03.0','2025-06-06 09:53:03.0',null,null,null,'<p><strong>一、2022年第50周重点15城新房成交规模环比下降3.17%，武汉、济南位居涨幅前二</strong></p><p>进入2022年第50周，监测重点15城新建商品住宅成交量为21323套，环比小幅下降3.17%。11月份以来，政策支持房地产的利好信号加速释放，叠加近日全国疫情防控政策进一步优化，多地调整放宽防疫措施，在因疫情积压的购房需求有所释放下，第49周新房成交规模显著回升，本周成交稍有回落，仍高于近一个月来成交平均水平。预计接下来随着年底房企加大推盘及促销力度，加上当前政策利好加持，成交将呈现稳中有升态势。</p><p><img src="http://n.sinaimg.cn/sinakd20114/498/w833h465/20221213/a1de-e3959b9eb1f829d5250c11c24adbd33a.jpg"></p><p>（注：重点15城包括北京、深圳、成都、苏州、南京、青岛、济南、宁波、大连、杭州、无锡、上海、温州、佛山、武汉，2022年第7周环比为931.78%）</p><p>2022年第50周监测重点15城中，8城新建商品住宅成交量上涨，7城成交量下滑。成交上涨城市中，武汉位居涨幅首位，本周新房成交2296套，环比上涨97.08%，近日，武汉限购政策已释放一定的松动信号，部分银行表示二环外不再限购，在一定程度上促进购房需求进一步释放，带动成交大幅回升；其次为济南，本周成交1222套，环比涨幅为38.08%；深圳位居涨幅第三，本周成交702套，环比上涨33.71%。从下降城市来看，宁波跌幅领跑，本周成交723套，环比下降62.4%；大连跌幅位居第二，本周成交182套，环比跌幅为46.31%；杭州以24.28%的跌幅位居第三。整体来看，在政策端各类利好多管齐下叠加疫情防控措施优化调整的背景下，北上深一线城市及武汉、南京等重点二线城市新房市场率先显露回升迹象。</p>','/api/upload/1602952343828037633.jpg',null);
insert into `article` values ('3','二手房交易出现“新渠道”，中介费直降4万，160万中介会失业吗？','房屋','930','0','2025-06-06 09:53:03.0','2025-06-06 09:53:03.0',null,null,null,'<p>关于二手房交易这块，相信很多人都非常希望能尽快跳过中介，让卖家和买家直接对接，这样不仅可以省下一大笔中介费，还能避免中介在其中使用各种手段让卖家和买家都防不胜防。</p><p>之所以会有这种想法，更多的还是最近几年买家和卖家都深受二手房中介的困扰。比如对于买家来说，总是会遇到虚假房源，中介先以低价优质房源吸引客户看房。</p><p><img src="http://n.sinaimg.cn/sinakd20117/310/w716h394/20221112/abc2-ccaaaa7d10535e972b4459205ad22ef7.jpg"></p><p>然后等顾客已经出发在路上的时候，突然打电话说该套房源已经被别的顾客下定或者房东暂时在外面等理由，让买家无法看那套虚假房源。</p><p>当买家失望的时候，中介又说有另外一套差不多的房源，这个时候买家大多会想着既然已经出来了，那就看看的吧。而中介也是利用这一点，不断“欺骗”买家看房。</p><p>除此之外，中介行业还普遍存在收费不合理的情况，比如收取高额的服务保障费，这个费用的主要作用是为了确保买卖双方能顺利交易。但是在实际的操作中有消费者表示，中介收取了这个费用之后并没有保障房源的顺利交割。</p><p>其次，房屋中介的合同中存在诸多不合理条款。如“一方出现违约行为，违约方赔偿等同于定金额的违约金，交易过程中产生的费用及甲乙双方的佣金及服务费在违约金中扣除”，这就意味着如果卖方违约，买方仍然要从违约金中拿出一部分作为中介费。</p><p>还有一些中介为了确保房源不被同行撬走，会要求甚至逼迫卖家与其签约独家，这样或许房子可以卖一个更好的价格，并且卖家也不会受到其他中介的骚扰，但是也失去了更多买家知晓的机会。</p>','/api/upload/1602952226035204096.jpg',null);
insert into `article` values ('4','11月多个核心城市二手房成交量止跌回升','房屋','163','0','2025-06-06 09:53:03.0','2025-06-06 09:53:03.0',null,null,null,'<p>	<span style="color: rgb(77, 79, 83);">格隆汇12月13日丨据中新网，中指研究院13日发布的一份报告显示，11月，中国多个核心城市二手房交易活跃度提升，其中，南京、杭州、天津二手房成交量止跌回升。不过，10个主要城市二手房价环比仍处于下行通道。中指报告指出，深圳、南京、杭州、成都、天津等多地11月份二手房成交量回升。其中，深圳11月二手住宅共成交近2200套，为下半年单月最高。11月，深圳二手住宅价格环比下跌0.37%，已连续20个月下跌。</span></p>','/api/upload/1602951775105581057.jpg',null);
insert into `article_type` values ('1','100','房屋','0',null,null,null,'2025-06-06 09:53:03.0','2025-06-06 09:53:03.0');
