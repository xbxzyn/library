-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动描述',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动图片',
  `start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始日期',
  `end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束日期',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动地点',
  `num` int DEFAULT '0' COMMENT '报名人数',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '活动详情',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='图书活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (10,'“遇‘荐’好书，从这里开始” ——图书馆荐书短视频大赛','','http://localhost:9090/files/download/1742714771613-5.jpg','2025-03-23','2025-04-30','线上',3,'<p style=\"text-indent: 2em; text-align: start;\">一本好书就是一个独立的精神世界，读一本好书恰似一段美妙的精神旅行， 在茫茫书海中遇见一本好书，恰如觅得一位知音。遇见好书时，你是否有“欲荐好书”的冲动？芳菲随春去，葱茏入夏来。夏至已至，不妨就趁此机会，带上一本您喜欢的书，借着明媚阳光，走进校园里，与大家分享您最喜欢的一段读书故事吧！</p><p style=\"text-indent: 2em; text-align: start;\">为激发同学们的阅读兴趣，营造浓厚的读书氛围，帮助同学们树立正确的阅读观念、养成良好的阅读习惯，图书馆特举办“遇‘荐’好书，从这里开始”荐书短视频大赛，让读者朋友们相互分享阅读感悟，为沉浮于书海中迷茫的你找到阅读的方向，一起感受好书的魅力。</p><p style=\"text-indent: 2em; text-align: start;\"><strong>一、活动主题</strong></p><p style=\"text-indent: 2em; text-align: start;\">遇“荐”好书，从这里开始</p><p style=\"text-indent: 2em; text-align: start;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;\"><strong>二、组织单位</strong></span></p><p style=\"text-indent: 2em; text-align: start;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">主办单位：图书馆</span></p><p style=\"text-indent: 2em; text-align: start;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">协办单位：学生会</span></p><p style=\"text-indent: 2em; text-align: start;\"><strong>三、活动时间</strong></p><p style=\"text-indent: 2em; text-align: start;\">作品征集时间：2025年3月23日至4月30日</p><p style=\"text-indent: 2em; text-align: start;\">作品评选时间：2025年5月1日至5月20日</p><p style=\"text-indent: 2em; text-align: start;\">评奖结果公布时间：2025年5月底</p><p style=\"text-indent: 2em; text-align: start;\"><strong>四、活动对象</strong></p><p style=\"text-indent: 2em; text-align: start;\">全校师生读者</p><p style=\"text-indent: 2em; text-align: start;\"><strong>五、活动内容</strong></p><p style=\"text-indent: 2em; text-align: start;\">挑选最喜欢的一本书，录制图书推荐短视频，可结合图书的主要内容、阅读感受、文章赏析、荐书理由等角度进行推荐，时长建议不少于1分钟，不超过5分钟。</p><p style=\"text-indent: 2em; text-align: start;\"><strong>六、参加方式及作品要求</strong></p><p style=\"text-indent: 2em; text-align: start;\">1、参赛者请于4月30日前将短视频以邮件附件形式投稿至指定邮箱：1744432@qq.com，邮件主题注明：遇“荐”好书，从这里开始+图书名称，邮件正文注明姓名、年级、班级、学号（工号）及联系手机信息。</p><p style=\"text-indent: 2em; text-align: start;\">2、视频作品及推荐图书需坚持正确政治方向，弘扬社会主义核心价值观，传播社会正能量。推荐图书类型和主题不限，须为正式出版物。视频内容主题鲜明，导向正确，能引起读者的阅读兴趣，能正面反映主讲人风采，拉近读者与图书的距离。</p><p style=\"text-indent: 2em; text-align: start;\">3、视频作品可采用单人讲述或多人对谈、访谈等形式，自行选择场景，录制语言为普通话。</p><p style=\"text-indent: 2em; text-align: start;\">4、视频须横幅拍摄，视频画幅比例建议16:9，视频格式支持MP4（推荐）、MOV格式，时长不超过5分钟，文件大小不超过500M。视频录制开头格式举例:“遇“荐”好书，从这里开始”，大家好，我是xxx，今天我要给大家推荐一本好书《XXXX》。</p><p style=\"text-indent: 2em; text-align: start;\">5、参选作品必须为作者原创，投稿作品所涉及的包括但不限于版权、肖像权、名誉权等法律责任由作者本人承担。一经发现盗用他人作品行为，将取消其评选与获奖资格。</p><p style=\"text-indent: 2em; text-align: start;\">6、联系电话：0451-86414337</p><p style=\"text-indent: 2em; text-align: start;\"><strong>七、奖项及奖品设置</strong></p><p style=\"text-indent: 2em; text-align: start;\">1、本次活动奖项及奖品设置如下:</p><p style=\"text-indent: 2em; text-align: start;\">一等奖2名 荣誉证书+无线蓝牙耳机</p><p style=\"text-indent: 2em; text-align: start;\">二等奖3名 荣誉证书+便携吹风机</p><p style=\"text-indent: 2em; text-align: start;\">三等奖5名 荣誉证书+智能台灯</p><p style=\"text-indent: 2em; text-align: start;\">优秀奖10名 荣誉证书+保温杯</p><p style=\"text-indent: 2em; text-align: justify;\">2、作品评选结束后，获奖名单将在图书馆微信公众号上发布。</p><p style=\"text-indent: 2em; text-align: justify;\">3、优秀的获奖视频作品将在图书馆微信公众号上进行展示。</p><p style=\"text-indent: 2em; text-align: start;\"><strong>八、其他事项和说明</strong></p><p style=\"text-indent: 2em; text-align: start;\">参赛作品的知识产权归原创者所有，活动组织方享有作品的使用权，拥有对所有参赛作品进行公益展示、报道和宣传，以及制作成专题数字资源并循环使用的权利；</p><p style=\"text-indent: 2em; text-align: start;\">凡投送作品者，均视为认同且接受本次大赛规则。活动主办方对本次大赛拥有最终解释权。</p>','进行中'),(11,'“云阅读”线上书籍推荐',NULL,'http://localhost:9090/files/download/1742721382730-6.jpg','2025-03-23','2025-05-31','线上',6,'<h2 style=\"text-align: start;\">一、活动背景</h2><p style=\"text-align: start;\">随着互联网技术的飞速发展，线上阅读逐渐成为人们获取知识和享受阅读乐趣的重要方式。为了营造浓厚的阅读氛围，激发广大学生的阅读兴趣，培养良好的阅读习惯，学校图书馆特举办“云阅读”线上书籍推荐活动，鼓励学生分享自己喜爱的图书，促进知识的交流与传播。</p><h2 style=\"text-align: start;\">二、活动主题</h2><p style=\"text-align: start;\">“云阅读，共成长——线上书籍推荐之旅”</p><h2 style=\"text-align: start;\">三、活动目的</h2><ol><li style=\"text-align: start;\">鼓励学生积极参与阅读，拓宽知识面，提高文化素养。</li><li style=\"text-align: start;\">提供一个交流学习的平台，让学生能够分享阅读心得，互相启发，共同成长。</li><li style=\"text-align: start;\">丰富校园文化生活，营造积极向上的学习氛围。</li></ol><h2 style=\"text-align: start;\">四、活动时间</h2><p style=\"text-align: start;\">2025年3月23日——5月31日</p><h2 style=\"text-align: start;\">五、活动对象</h2><p style=\"text-align: start;\">全体在校学生</p><h2 style=\"text-align: start;\">六、活动内容及流程</h2><ol><li style=\"text-align: start;\">学生在活动专属平台上按照规定格式分享自己喜欢的图书。</li><li style=\"text-align: start;\">学生可以在评论区对其他同学推荐的图书进行交流学习，发表自己的看法和观点。鼓励学生之间展开深入讨论，互相推荐相关书籍。</li></ol><h2 style=\"text-align: start;\">七、活动规则</h2><ol><li style=\"text-align: start;\">参与者必须为全体在校学生，每人可推荐多本图书，但每本图书只能推荐一次。</li><li style=\"text-align: start;\">推荐内容应真实、客观，不得抄袭、剽窃他人作品。如有违反，将取消参赛资格。</li><li style=\"text-align: start;\">评论区应保持文明、和谐的氛围，不得进行恶意攻击、辱骂等不良行为。</li><li style=\"text-align: start;\">活动期间，参与者应密切关注活动平台的动态，及时了解活动的最新信息。</li></ol>','进行中'),(12,'“凝结在光影里的图书馆记忆—我和我的图书馆”照片展',NULL,'http://localhost:9090/files/download/1742722833290-1.jpg','2025-03-01','2025-06-30','图书馆',6,'<h2 style=\"text-align: start;\">一、活动背景</h2><p style=\"text-align: start;\">图书馆作为知识的殿堂，承载着无数人的学习、成长与回忆。每一张照片都是时光的定格，记录着图书馆的发展变迁以及与读者之间的深厚情谊。为了进一步弘扬图书馆文化，增强读者与图书馆之间的情感连接，特举办此次“凝结在光影里的图书馆记忆—我和我的图书馆”照片展。</p><h2 style=\"text-align: start;\">二、活动主题</h2><p style=\"text-align: start;\">“凝结在光影里的图书馆记忆—我和我的图书馆”</p><h2 style=\"text-align: start;\">三、活动目的</h2><ol><li style=\"text-align: start;\">展示图书馆的发展历程和文化底蕴，让读者更加深入地了解图书馆的历史与变迁。</li><li style=\"text-align: start;\">鼓励读者分享与图书馆的美好回忆，增强读者对图书馆的认同感和归属感。</li><li style=\"text-align: start;\">通过照片展的形式，激发读者的阅读兴趣，营造浓厚的学习氛围。</li></ol><h2 style=\"text-align: start;\">四、活动时间</h2><p style=\"text-align: start;\">2025年3月 - 6月</p><h2 style=\"text-align: start;\">五、活动对象</h2><p style=\"text-align: start;\">全体师生及社会各界摄影爱好者</p><h2 style=\"text-align: start;\">六、活动内容及安排</h2><h3 style=\"text-align: start;\">（一）照片征集（2025年3月1日 - 4月10日）</h3><p style=\"text-align: start;\"><strong>征集内容</strong>：<br>我们希望收到能够反映图书馆与读者之间故事的各类照片，比如图书馆的特色景观、你与图书馆的独特互动瞬间、在图书馆学习或工作的精彩时刻等，这些照片应能体现出图书馆在你生活中的重要意义，或者反映图书馆在时代进程中的发展变化。</p><p style=\"text-align: start;\"><strong>征集要求</strong>：</p><ul><li style=\"text-align: start;\">​<strong>格式要求</strong>：照片需为JPEG格式，确保图像清晰、色彩还原准确，文件大小不超过10MB。</li><li style=\"text-align: start;\">​<strong>拍摄时间</strong>：无具体限制，但能体现图书馆不同时期的风貌更佳。</li><li style=\"text-align: start;\">​<strong>相关信息</strong>：请为每张照片配以简短的文字说明（不超过200字），描述照片的拍摄背景、故事以及照片所传达的情感或意义。</li></ul><p style=\"text-align: start;\"><strong>提交方式</strong>：<br>你可以通过电子邮件将照片和相关文字说明发送至指定邮箱：[图书馆邮箱地址]，邮件主题请注明“图书馆照片展投稿 - [姓名]”；也可以在学校图书馆官方网站专门开辟的活动页面进行线上提交。</p><h3 style=\"text-align: start;\">（二）评选阶段（2025年4月11日 - 4月30日）</h3><p style=\"text-align: start;\"><strong>评选标准</strong>：</p><ul><li style=\"text-align: start;\">​<strong>主题相关性</strong>：照片是否紧密围绕活动主题，能切实体现与图书馆的记忆或图书馆的发展变化。</li><li style=\"text-align: start;\">​<strong>摄影技巧</strong>：包括构图、光线运用、色彩处理等方面是否符合摄影美学。</li><li style=\"text-align: start;\">​<strong>情感感染力</strong>：照片能否引起观众的情感共鸣，传递出对图书馆的热爱和美好回忆。</li></ul><p style=\"text-align: start;\"><strong>评选流程</strong>：</p><ul><li style=\"text-align: start;\">​<strong>初审</strong>：由图书馆工作人员和摄影专业人士组成的评审小组将对所有投稿照片进行初审，筛选出符合基本要求和质量标准的照片。</li><li style=\"text-align: start;\">​<strong>网络投票</strong>：通过图书馆官方网站和微信公众号开通投票通道，让广大师生和社会公众对入围照片进行投票。投票结果将作为评选的重要参考依据之一。</li><li style=\"text-align: start;\">​<strong>终审</strong>：结合网络投票结果，评审小组将再次对各入围照片进行终审，综合考量各方面因素，最终评选出一、二、三等奖和优秀奖。</li></ul><h3 style=\"text-align: start;\">（三）展览准备（2025年5月1日 - 5月20日）</h3><p style=\"text-align: start;\"><strong>展览场地布置</strong>：<br>本次展览将在学校图书馆的特定区域以及线上平台同步进行。线下展览中将根据照片的主题和风格进行分区展示，如“图书馆的岁月变迁”“我与图书馆的邂逅”等，为每幅照片配备展示牌，注明照片信息、作者姓名和文字说明。同时，还将设置互动区域，如留言墙，供观众写下对展览的感受和回忆。</p><p style=\"text-align: start;\"><strong>线上展览搭建</strong>：<br>在图书馆官方网站和微信公众号上设立专门的线上展览页面，按照线下展览的分区方式对照片进行展示。每张照片都将配有可放大查看的细节，方便观众欣赏。线上展览还将设置分享功能，方便观众将喜欢的照片分享到社交媒体平台。</p><h3 style=\"text-align: start;\">（四）展览开展与宣传（2025年5月21日 - 6月10日）</h3><p style=\"text-align: start;\"><strong>线下展览开幕式</strong>：<br>于5月21日在图书馆举行展览开幕式，邀请学校领导、摄影专家、部分获奖作者以及广大师生代表共同出席。开幕式上将介绍本次活动的背景、目的和成果，为获奖作者颁发证书和奖品，并由专业摄影师进行摄影技巧分享和交流。</p><p style=\"text-align: start;\"><strong>宣传推广</strong>：</p><ul><li style=\"text-align: start;\">在学校内部，通过图书馆公告栏、校园广播、班级群等渠道广泛宣传活动信息的更新和展览现场的精彩瞬间，吸引更多师生前往参观。</li><li style=\"text-align: start;\">利用社交媒体平台，如微博、抖音等，发布展览照片和相关话题，鼓励观众在社交媒体上分享自己的参观感受，扩大活动的影响力。</li></ul><h3 style=\"text-align: start;\">（五）颁奖仪式（2025年6月11日）</h3><p style=\"text-align: start;\">在图书馆举办颁奖仪式，邀请学校领导、摄影专家和获奖作者参加。在颁奖仪式上，将公布各个奖项的获奖名单，并为获奖作者颁发荣誉证书和奖品，表彰他们用镜头记录下的珍贵图书馆记忆。</p><h3 style=\"text-align: start;\">（六）活动总结（2025年6月12日 - 6月20日）</h3><p style=\"text-align: start;\">活动结束后，对本次活动进行全面总结。收集观众和作者的反馈意见，分析活动的优点和不足之处，为今后举办类似活动提供经验参考。同时，将活动成果进行整理归档，包括获奖照片、观众留言、活动照片等，进一步丰富图书馆的文化资源。</p>','进行中');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (6,'1','e10adc3949ba59abbe56e057f20f883e','1',NULL,'ADMIN',NULL,NULL),(7,'admin','21232f297a57a5a743894a0e4a801fc3','xbx',NULL,'ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出版社',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出版日期',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '价格',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISBN',
  `store` int DEFAULT NULL COMMENT '库存',
  `category_id` int DEFAULT NULL COMMENT '分类ID',
  `grounding` tinyint(1) DEFAULT NULL COMMENT '是否上架',
  `recommend` tinyint(1) DEFAULT NULL COMMENT '是否推荐',
  `weizhi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='图书信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (10,'平凡的世界','http://localhost:9090/files/download/1742716153094-10.jpg','《平凡的世界》时间跨度从1975年到1985年，全景式地反映了中国近10年间城乡社会生活的巨大历史性变迁；以孙少安和孙少平两兄弟为中心，以整个社会的变迁、思想的转型为背景，通过简单的冲突纠葛，刻画了社会各阶层一般人们的形象，成功地塑造了孙少安和孙少平这些为生活悄悄承受着人生苦难的人们，在这里人性的自尊、自强与自信，人生的苦难与拼搏，挫折与追求，苦痛与欢快，纷繁地交织，读来令人荡气回肠，不忍释卷。 ','路遥','北京十月文艺出版社','2017-05-01','90','9787530209554',2,15,1,1,'1 - A - 01 - 2'),(11,'活着','http://localhost:9090/files/download/1742715691423-9.jpg','《活着》是一部充满血泪的小说。余华通过一位中国农民的苦难生活讲述了人如何去承受巨大的苦难；讲述了眼泪的丰富和宽广；讲述了绝望的不存在：讲述了人是为了活着本身而活着…… 《活着》这部小说荣获意大利格林扎纳·卡佛文学奖奖项(1998年 )，台湾《中国时报》10本好书奖(1994年)，香港“博益”15本好书奖 (1990年)；并入选香港《亚洲周刊》评选的“20世纪中文小说百年百强” ；入选中国百位批评家和文学编辑评选的“九十年代有影响的10部作品 ”','余华','作家出版社','2012-08-01','30','9787530215593',5,15,1,0,'1 - A - 01 - 3'),(12,'红楼梦','http://localhost:9090/files/download/1742716051811-8.jpg','《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面，以及封建专制下新兴资本主义民主思想的萌动。结构宏大、情节委婉、细节精致，人物形象栩栩如生，声口毕现，堪称中国古代小说中的经 典。 由红楼梦研究所校注、人民文学出版社出版的《红楼梦》以庚辰（1760）本《脂砚斋重评石头记》为底本，以甲戌（1754）本、已卯（1759）本、蒙古王府本、戚蓼生序本、舒元炜序本、郑振铎藏本、红楼梦稿本、列宁格勒藏本（俄藏本）、程甲本、程乙本等众多版本为参校本，是一个博采众长、非常适合大众阅读的本子；同时，对底本的重要修改，皆出校记，读者可因以了解《红楼梦》的不同版本状况。 红学所的校注本已印行二十五年，其间1994年曾做过一次修订，又十几年过去，2008年推出修订第三版，体现了新的校注成果和科研成果。 关于《红楼梦》的作者，原本就有多种说法及推想，“前八十回曹雪芹著、后四十回高鹗续”的说法只是其中之一，这次修订中校注者改为“前八十回曹雪芹著；后四十回无名氏续，程伟元、高鹗整理”，应当是一种更科学的表述，体现了校注者对这一问题的新的认识。 现在这个修订后的《红楼梦》是更加完善。','曹雪芹','知识出版社','2015-04-01','90','9787020002207',7,15,1,NULL,'1 - A - 03 - 3'),(13,'百年孤独','http://localhost:9090/files/download/1742716330522-11.jpg','《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等神秘因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪最重要的经典文学巨著之一。1982年加西亚•马尔克斯获得诺贝尔文学奖，奠定世界级文学大师的地位，很大程度上乃是凭借《百年孤独》的巨大影响。','[哥伦比亚] 加西亚·马尔克斯','南海出版社','2017-08-01','35','9787544291170',6,15,1,NULL,'1 - A - 02 -4'),(14,'三体','http://localhost:9090/files/download/1742716727918-12.jpg','作品讲述了地球人类文明和三体文明的信息交流、生死搏杀及两个文明在宇宙中的兴衰历程。《三体》的文本叙事在“后人类”的思考上有着重大突破，构建了科学与文学的互动范式，将道德内涵引入对科技的辩证思考中，并以文学手段在文化语境中对科技进行大胆假设和重构，但科技核心只是一个叙事跳板，是完成现实超越的重要媒介，也是人类命运共同体书写的重要工具。《三体》最吸引人的地方在于通过对人类中心主义的解构，继而完成对人与自然、动物之间的伦理反思与文学表达，最终指向去人类中心化的思想内核','刘慈欣','重庆出版社','2022-04-01','90','9787536692930',2,18,1,1,'1 - B - 11 -3'),(15,'海底两万里','http://localhost:9090/files/download/1742717067587-13.jpg','《海底两万里》 是儒勒·凡尔纳的巅峰之作，是“海洋三部曲”（另两部为《格兰特船长的儿女》和《神秘岛》） 的第二部。全书共两部分，主要讲述了博物学家阿罗纳克斯、其仆人孔塞伊和捕鲸手内德·兰德一起随“鹦鹉螺”号潜艇艇长尼摩周游海底的故事。《海底两万里》 最先以连载的形式，于 1869—1870 年刊登于 《教育与娱乐》 杂志上。虽说当时法国正处于内忧外患 （普法战争、巴黎公社） 的时候，但 《海底两万里》 一开始就受到了读者的欢迎，它所带来的“奇妙的异域风情”给人耳目一新的感觉。世界上第一艘核动力潜艇即被命名为“鹦鹉螺”号。','[法国] 儒尔·凡尔纳','大众文艺出版社','2000-08-01','30','9787010217420',6,18,1,0,'1 - B - 11 -3'),(16,'沙丘','http://localhost:9090/files/download/1742717393296-14.jpg','弗兰克·赫伯特以精细入微的笔法创造了一个与地球截然不同的世界。行星阿拉吉斯。既是英勇豪迈、心计深沉的亚崔迪家族的领地，是阴鸷冷酷、顽强剽悍的弗瑞曼人的故乡，也是庞大无匹、可以吞噬一切的沙虫的巢穴。它所出产的，更是整个人类宇宙梦寐以求的珍宝——香料。\n\n以这颗行星为舞台，上演着英勇和怯懦、高尚和卑鄙、忠诚和背叛的大剧，它的一举一动。都牵动着整个人类宇宙。\n\n人们常常用另一个名字称呼这颗干旱的星球——沙丘。\n\n在这部规模宏大、情节曲折的宇宙史诗的序曲中，亚崔迪家族陷入了绝境，少年保罗的父亲莱托·亚崔迪公爵被银河皇帝转封到了字宙中惟一出产香料的星球一一“沙丘”星。世人皆知，这是亚崔迪家族的死敌哈肯尼男爵的诡计，他要在这里将亚崔迪家族赶尽杀绝。\n\n但是，如果少年保罗能够证明自己是神秘的比·吉斯特姐妹会培育出来的可以同时存在于不同时空的超人，是沙丘星上的土著弗瑞曼人传说中的带领他们赢得自由的“天外纶音”，亚崔迪家族就还有一线生机……\n\n本书一经面世，便受到空前好评，先后荣获了星云奖和雨果奖的最佳长篇奖，更被读者评为“有史以来最富想像力的作品”。','[美]布莱恩·赫伯特等','中信出版集团股份有限公司','2021-11-01','25','9787536457836',3,18,1,0,'1 - B - 12 - 2'),(17,'时间机器','http://localhost:9090/files/download/1742717575763-15.jpg','《时间机器》（The Time Machine）是英国著名小说家赫伯特·乔治·威尔斯在1895年发表的一部科幻小说。这本书也是威尔斯的第一部科幻小说。有评论家将这本书的出版认定为“科幻小说诞生元年”。作品描述一位科学家通过时间旅行机器来到公元802701年。这时的地球到处 是宫殿式建筑。人类进化为两类：艾洛伊人和莫洛克人。作者将将优雅的贵族描写为被莫洛克饲养的畜牲，而且还被当作食物，展示了人类退化的阴森景象。','(英)H.G.威尔士','辽宁人民出版社','2015-07-01','40','9787201124803',6,18,1,0,'1 - B - 13 -1'),(18,'资治通鉴','http://localhost:9090/files/download/1742718053059-16.jpg','《资治通鉴》是司马光及其助刘攽、刘怒、范祖禹等根据大量的史料编纂而成的一部编年体史书，记载了上起周威烈士二十三年（公元前403年），下讫后周世宗显德六年（公元959年）共1362年的历史。书中描绘了战略至五代期间的历史发展脉络，探讨了秦、汉、晋、隋、唐等统一的王朝和战国七雄、魏蜀吴三国、五胡十六国、南北朝、五代十国等几十个政权的盛衰之由，生动地刻画了帝王将相们的为政治国、待人处世之道，以及他们在历史旋涡中的生死悲欢。时至今日，《资治通鉴》仍是一本了解和学习中国历史的必读之书。\n\n司马光（1019—1086），字君实，陕州夏县（今山西夏县）人。他爱好历史，出仕以后，仍治史不懈。治平三年（1066年），司马光撰成一部战国至秦共八卷本的编年史，名为《通志》，进呈宋英宗，英宗命其设局续修。此后，司马光无论在政治上如何进退沉浮，书局一直随身而设。1067年神宗即位，开经筵，司马光进读《通志》，神宗以其“鉴于往事，有资于治道”，命名为《资治通鉴》。王安石行新政时，司马光竭力反对，被任命为枢密事使而坚辞不就，于熙宁三年（1070年）出知永兴军（今陕西西安）。次年退居洛阳，专心编撰《资治通鉴》，至元丰七年（1084年）成书。从治平三年开局，至此共用了19年的时间。','司马光','辽海出版社','2014-12-01','80','9787101053463',5,19,1,0,'2 - B - 01 - 2'),(19,'史记','http://localhost:9090/files/download/1742717983288-17.jpg','《史记》，二十四史之一，最初称为《太史公书》或《太史公记》《太史记》，是西汉史学家司马迁撰写的纪传体史书，是中国历史上第一部纪传体通史，记载了上至上古传说中的黄帝时代，下至汉武帝太初四年间共三千多年的历史。太初元年（前104年），司马迁开始了该书创作，前后经历了十四年，才得以完成。\n史记》全书包括十二本纪（记历代帝王政绩）、三十世家（记诸侯国和汉代诸侯、勋贵兴亡）、七十列传（记重要人物的言行事迹，主要叙人臣，其中最后一篇为自序）、十表（大事年表）、八书（记各种典章制度记礼、乐、音律、历法、天文、封禅、水利、财用）。《史记》共一百三十篇，五十二万六千五百余字，比《淮南子》多三十九万五千余字，比《吕氏春秋》多二十八万八千余字。《史记》规模巨大，体系完备，而且对此后的纪传体史书影响很深，历朝正史皆采用这种体裁撰写。 \n《史记》被列为“二十四史”之首，对后世史学和文学的发展都产生了深远影响，其首创的纪传体编史方法为后来历代“正史”所传承。《史记》还被认为是一部优秀的文学著作，在中国文学史上有重要地位，被鲁迅誉为“史家之绝唱，无韵之离骚”，有很高的文学价值。刘向等人认为此书“善序事理，辩而不华，质而不俚”。《史记》与《汉书》、《东观汉记》并称“三史”，为唐代科举之常科 [37]，又与《汉书》《后汉书》《三国志》合称“前四史”。','司马迁','辽海出版社','2014-12-01','120','9787101003048',9,19,1,0,'2 - B - 03 - 3'),(20,'三国志','http://localhost:9090/files/download/1742718329206-18.jpg','《三国志（套装上下册）》是晋代陈寿编写的一部主要记载魏、蜀、吴三国鼎立时期的纪传体国别史，详细记载了从魏文帝黄初元年（220）到晋武帝太康元年（280）六十年的历史。《三国志（套装上下册）》全书六十五卷，《魏书》三十卷，《蜀书》十五卷，《吴书》二十卷，共六十五卷。陈寿是晋朝朝臣，晋承魏而得天下，所以《三国志（套装上下册）》尊魏为正统。\n\n《三国志（套装上下册）》不仅是一部史学巨著，更是一部文学巨著。陈寿在尊重史实的基础上，以简练、优美的语言为我们绘制了一幅幅三国人物肖像图。人物塑造得非常生动。','陈寿','中华书局','2011-01-01','60','9787101077087',5,19,1,0,'2 - B - 02 -4'),(21,'汉书','http://localhost:9090/files/download/1742718597627-19.jpg','《汉书》是中国第一部纪传体断代史，全书记述了自西汉的汉高祖元年至新朝王莽地皇四年，共二百三十年史事。此书文赡事详，奠定正史编例，为治文史学者必读之中华史学名著。今以点校本《汉书》为基础，简体横排刊印，更加方便读者学习和使用。','班固','中华书局','2012-03-04','200','9787101085280',5,19,1,0,'1 -B - 03 - 4'),(22,'理想国','http://localhost:9090/files/download/1742718849268-20.jpg','《理想国》涉及柏拉图思想体系的各个方面，包括哲学、伦理、教育、文艺、政治等内容，主要是探讨理想国家的问题。\n\n《理想国》一书是柏拉图的一篇重要对话录，对话录里柏拉图以苏格拉底之口通过与其他人对话的方式设计了一个真、善、美相统一的政体，即可以达到公正的理想国。柏拉图的理想国是人类历史上最早的乌托邦。在他的理想国里统治者必须是哲学家，他认为现存的政治都是坏的，人类的真正出路在于哲学家掌握政权，也只有真正的哲学家才能拯救当时城邦所处的危机。这种信念构成了柏拉图成熟的政治哲学体系的核心。在他的眼里“哲学家”有着特殊的内涵。他认为哲学家是最高尚、最有学识的人，而这种贤人统治下的贤人政体就是最好是政体。所以，只有建立以哲学家为国王的国家才是最理想的国家。这个国家就是存在于天上的模范国家。\n\n在他看来，哲学家的本质是具有知识，具有智慧、正义、善的美德，只有哲学家才能达到对国家最高理念的认识，即对“善”的把握，而其他人也只能把握“意见”而已。治国作为一门知识，也只有哲学家才能掌握它，进而有资格执政，也就是说只有哲学家才能达到对于国家理念的认识，知道“理想国”应该怎样组织、怎样治理。这样，所谓哲学家执政，就被柏拉图理解为高超的智慧、真实的知识、完美的德行和绝对最高权力的结合。他坚信只有哲学家才可拯救城邦和人民，哲学家是理想国必然的统治者。\n\n人类追求的正义与善就是柏拉图理想国的主题，他认为国家、政治和法律要朝向真正的存在并与人的灵魂相关才有意义。在《理想国》里苏格拉底刚开始讨论的话题就是“正义”问题，由此我们可以看到柏拉图对正义有着多么强烈的憧憬与向往！他认为绝对的正义在神那里，这正好印证了对话结尾的宣言，“让我们永远走向上的路，追求正义和智慧”。正义和智慧不仅是国家的主题，也可以说是整个宇宙存在的本质，因为国家的起点“就是永无止境的时间以及时间带来的变化”。\n\n柏拉图的正义表现在爱情上就是节制。在我们很多人看来，柏拉图式的爱情似乎是精神恋的代名词，用来指称那种超越时间、空间，不以占有对方肉体为目的的只存在于灵魂间的爱情。而实际上柏拉图式爱情的真谛指的是一种对节制的崇尚，对善和美的追求。','（古希腊）柏拉图','商务印书馆','2010-10-01','50','9787100017565',7,20,1,0,'2 - B - 09 - 3'),(23,'社会契约论','http://localhost:9090/files/download/1742719034495-21.jpg','本书是十八世纪法国启蒙思想家、法国大革命的思想先驱卢梭（1712—1778）的一部政治哲学著作。它探讨的是政治权利的原理，它的主旨是为人民民主主权的建立奠定理论基础。\n\n本书分为四卷：第一卷论述了社会结构和社会契约，第二卷阐述主权及其权利，第三卷阐述政府及其运作形式，第四卷讨论几种社会组织。书中所提倡的民主理论很快风靡世界，不仅引发了震惊世界的法国大革命，亦为美国《独立宣言》、法国《人权宣言》等奠定了理论基础。本书第一次提出了“天赋人权”和“主权在民”的思想，后者是现代民主制度的基石。',' [法] 卢梭',' 商务印书馆','2003-02-01','25','9787100037259',9,20,1,0,'2 - B - 10 -1'),(24,'教育漫话','http://localhost:9090/files/download/1742719240804-22.jpg','《教育漫话》是17世纪英国伟大的启蒙思想家、哲学家和经济学家约翰·洛克（John Locke,1632-1704)撰写的一本教育名著，由作者流亡荷兰期间(1683～1689)写给友人E.克拉克讨论其子女的教育问题的几封信整理而成，于1693年出版。\n\n本书的主题是论述“绅士教育”，即论述刚夺得政权的英国资产阶级与新贵族的子弟的教育。洛克认为,绅士要既有贵族的风度,能活跃于上流社会和政治舞台,又有事业家的进取精神，是发展资产阶级经济的实干人才；绅士应受体育、德育和智育等方面的教育。\n\n《教育漫话》在西方教育史上第一次将教育分为体育、德育、智育三部分，并作了详细论述。它强调环境与教育的巨大作用，强调在体魄与德行方面进行刻苦锻炼。这些思想对西方近代教育思想，特别是对18世纪的法国教育家影响很深。《教育漫话》是对人们多种全方位的帮助，解读心里社会个人的巨作。',' [英]约翰·洛克','商务印书馆','2018-06-01','40','9787100158695',2,21,1,0,'2 - B -12 - 3'),(25,'爱弥儿','http://localhost:9090/files/download/1742719430539-23.jpg','《爱弥儿，或论教育》，系法国资产阶级民主主义者、杰出的启蒙思想家卢梭(1712—1778)的重要著作。此书写于1757年，1762年第一次在荷兰的阿姆斯特丹出版。此书出版时，轰动了整个法国和西欧一些资产阶级国家，影响巨大。这部书不仅是卢梭论述资产阶级教育的专著，而且是他阐发资产阶级社会政治思想的名著。\n\n继十六、十七世纪荷兰和英国相继发生的资产阶级革命之后，十八世纪的西欧正处于资本主义经济日益发展壮大，封建社会行将崩溃，更为深刻的资产阶级革命即将到来的时期。这种情况在法国表现得尤为明显。当时，法国是一个落后的封建专制国家，路易十四的“朕即国家”这句骄横的名言，就反映了这种专权状况。封建贵族和僧侣们凭借封建王权和神权对第三等级施加沉重的压迫，使整个第三等级其中包括资产阶级完全处于政治上无权的地位。在经济上，封建贵族和僧侣们拥有大量的土地，控制着财政税收大权，残酷剥削和掠夺第三等级，特别是广大工农劳苦大众。但是，随着资本主义生产的发展，资产阶级的经济实力日益扩大，使它再也不能容忍那种无权状况了。反对封建压迫，推翻君主专制制度，扫除资本主义发展的障碍，成了第三等级的共同要求。卢梭和其他资产阶级启蒙思想家的著作正是反映了这一要求。《爱弥儿》一书则是卢梭通过对他所假设的教育对象爱弥儿的教育，来反对封建教育制度，阐述他的资产阶级教育思想。\n\n本书共分五卷。卢梭根据儿童的年龄提出了对不同年龄阶段的儿童进行教育的原则、内容和方法。在第一卷中，着重论述对两岁以前的婴儿如何进行体育教育，使儿童能自然发展。在第二卷中，他认为两岁至十二岁的儿童在智力方面还处于睡眠时期，缺乏思维能力，因此主张对这一时期的儿童进行感官教育。在第三卷中，他认为十二至十五岁的少年由于通过感官的感受，已经具有一些经验，所以主要论述对他们的智育教育。在第四卷中，他认为十五至二十岁的青年开始进入社会，所以主要论述对他们的德育教育。在第五卷中，他认为男女青年由于自然发展的需要，所以主要论述对女子的教育以及男女青年的爱情教育。卢梭提出的按年龄特征分阶段进行教育的思想，在教育史上无疑是个重大的进步，它对后来资产阶级教育学的发展，特别是对教育心理学的发展，提供了极可贵的启示。但是应该指出，这种分期以及把体育、智育和德育截然分开施教的方法，是不科学的。','[法] 卢梭','商务印书馆','1978-06-23','30','9787100011129',7,21,1,NULL,'2 - B - 14 - 3'),(26,'艺术的故事','http://localhost:9090/files/download/1742719587051-24.jpg','《艺术的故事》概括地叙述了从最早的洞窟绘画到当今的实验艺术的发展历程，以阐明艺术史是“各种传统不断迂回、不断改变的历史，每一件作品在这历史中都既回顾过去又导向未来。\n\n继1997年三联版《艺术的故事》后，英国费顿出版社授权广西美术出版社独家出版，也是国内唯一合法授权的版本。','[英国] E·H·贡布里希','广西美术出版社','2008-04-12','35','9787807463726',3,22,1,1,'2 - B - 15 -2'),(27,'艺术博物馆','http://localhost:9090/files/download/1742719748295-25.jpg','这是一座虚拟的艺术博物馆，由英国费顿出版社（Phaidon Press）创建并策展，收藏了人类最为精美的艺术品，且不受实际空间的限制。约3000件绘画、雕塑、湿壁画、摄影、挂毯、浮雕饰带、装置艺术、行为艺术、影像艺术、木版画、丝网版画、陶瓷和手抄本等荟萃一堂，讲述世界艺术的历史。\n\n徜徉于25个展馆，在陈列着旷世杰作的452个展厅中度过美好时光。这些艺术品有的妇孺皆知，有的默默无闻，搜罗自世界各地的公共和私人收藏。你可以驻足于宽敞的走廊，或参观具体的展览，从我们的永久收藏中选取作品呈现特定的主题和内容。\n\n达‧芬奇的《蒙娜丽莎》、伦勃朗最杰出的自画像、委拉斯凯兹的《宫娥》、毕加索的《格尔尼卡》、中国的陶瓷、葛饰北斋的木版画、秘鲁的金器、拉斯科洞窟的岩画、赛‧托姆布雷和布莱斯‧马登的作品，一一收藏。内容之丰富，别无他处。\n\n展馆有彩色编号，墙面文字清晰地解释了每个展厅所涉及的艺术运动、文化或主题，每件作品附有说明标注。“艺术博物馆”恢弘开阔，方便游览，极富教益，启迪心智，不啻为一场精彩绝伦的视觉盛宴。\n\n全年365天、每天24小时开放，这是世界上第一个真正可以随时随地参观的艺术博物馆。','英国费顿出版社','湖南美术出版社','2017-10-11','50','9787535680174',6,22,1,NULL,'2 - B - 16 -2'),(28,'极简宇宙史','http://localhost:9090/files/download/1742719880394-26.jpg','我们的存在的确让太阳系与众不同。夏夜，你躺在沙滩上，仰望夜空。一颗小小的流星安静滑过，还来不及许愿，不可思议的事情发生了：你一下子穿越五十亿年，走进时光的旅行……\n\n霍金亲传弟子、物理学博士克里斯托弗·加尔法德带领我们踏上一场关于宇宙的过去、现在和未来的惊奇之旅。不需要图表和方程式，只需凭着奇诡的想象，我们就可走向衰亡的太阳表面，飞越遥远的星系，感受来自黑洞的死亡魅力……你可以轻松读懂时至今日的宇宙神奇，继续探究关于上帝的存在、时间的起源以及人类的未来。','[法] 克里斯托弗·加尔法德','上海三联书店','2016-03-01','50','9787542654434',5,23,1,NULL,'3 - B - 03 - 2'),(29,'果壳中的宇宙','http://localhost:9090/files/download/1742719999810-27.jpg','在《果壳中的宇宙》这部新作中，霍金把读者带到理论物理的最前沿，真理在那里甚至比幻想更令人眼花缭乱。他利用通俗的语言解释制约着宇宙的原理。','[英] 史蒂芬·霍金',' 湖南科学技术出版社','2006-03-13','70',' 9787535733597',4,23,1,NULL,'3 - B - 03 - 3'),(30,'地球之美','http://localhost:9090/files/download/1742720245318-28.jpg','★一部看得见的地球简史！\n\n★200个改写地球命运的时刻，呈现46亿年漫长的地球史！\n\n★法国国家自然历史博物馆、法国地质学会、法国国家地质遗产、联合国教科文组织 专家权威撰写\n\n★法国自然历史博物馆、法国国家科学研究院、美国国家航空航天局(NASA)、美国国家地理学会、伦敦自然历史博物馆 提供素材\n\n★200余幅史前遗迹、生物、地貌高清还原图\n\n★世界最丰富、最罕见动植物和矿物标本\n\n★在这个地球环境屡遭破坏，PM2.5爆棚的时代，这是一本让我们回味地球之美，期待美好未来的读物。','[法] 帕特里克·德韦弗 文 / [法] 让·弗朗索瓦·布翁克里斯蒂亚尼 图','新星出版社','2017-06-01','30','9787513324052',6,24,1,1,'3 - B - 13 - 2'),(31,'宝石圣典','http://localhost:9090/files/download/1742720585990-29.jpg','本书主要研究地球上的岩石、矿物、宝石及化石，揭示了这些自然现象的精美和奇特，同时也揭示了它们非比寻常的价值和用途。传奇历史　　 岩石、宝石、矿物和化石是我们所在的这颗古老星球上众多伟大事件的证明，几千年来始终被视为充满魔力的护身宝物，成为神话和传奇的焦点。本书展示了这些宝物的奇特之美，以及它们在人类历史中所占的地位，从科依诺尔钻石到颇具传奇色彩的叶卡捷琳娜大帝宫殿中的琥珀大厅，应有尽有。一本必备的指南　　 本书中鲜明清晰的图片资料向读者展示了各类岩石与宝石，提供了帮助人们准确识别它们的重要知识，还提供了切割、抛光和陈列物品的实用的信息，展示出其无穷魅力，从基本的建筑材料到精美装饰全部包涵在内。','【英】罗纳德·路易斯·勃尼威兹','电子工业出版社','2013-11-01','90','9787121207167',0,24,1,0,'3 - B - 14 - 2');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carousel` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (4,'1','http://localhost:9090/files/download/1742661862135-2.jpg'),(6,'2','http://localhost:9090/files/download/1742663721870-bg.jpg'),(9,'4','http://localhost:9090/files/download/1742722905097-7.jpg'),(10,'9','http://localhost:9090/files/download/1742723792364-8.jpg');
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_id` int DEFAULT NULL COMMENT '图书ID',
  `num` int DEFAULT NULL COMMENT '数量',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='书单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,8,1,6,'2025-02-19 23:25:32'),(6,7,1,21,'2025-03-20 20:19:33'),(7,26,1,22,'2025-03-23 21:40:55'),(8,14,1,22,'2025-03-23 21:41:01'),(9,31,1,22,'2025-04-02 14:50:59');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='图书分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (15,'文学'),(18,'科幻'),(19,'历史'),(20,'哲学'),(21,'教育'),(22,'艺术'),(23,'天文'),(24,'地理');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `activity_id` int DEFAULT NULL COMMENT '活动ID',
  `user_id` int DEFAULT NULL COMMENT '收藏人ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='活动收藏信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (12,10,22,'2025-04-02 15:16:47'),(13,12,22,'2025-04-04 14:48:40'),(14,12,81,'2025-04-04 15:02:03'),(15,11,81,'2025-04-04 15:02:05'),(16,10,81,'2025-04-04 15:02:08'),(17,12,83,'2025-04-09 15:31:52'),(18,11,83,'2025-04-09 15:31:55'),(19,10,83,'2025-04-09 15:31:57');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '评论人',
  `pid` int DEFAULT NULL COMMENT '父级ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时间',
  `fid` int DEFAULT NULL COMMENT '关联ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模块',
  `root_id` int DEFAULT NULL COMMENT '根节点ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='评论信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (33,'宝石圣典，让我走进了宝石的世界，领略了宝石之美！！',22,NULL,'2025-03-24 19:04:29',31,'book',33),(34,'没错，值得推荐',23,33,'2025-03-24 19:21:15',31,'book',33),(35,'科普书。最喜欢巧思和雕刻结合的宝石。纯粹宝石切割和矿石晶体一样有股冷冰冰的印象。',23,NULL,'2025-03-24 19:24:04',31,'book',35),(36,'应有尽有，矿石爱好者必备入门级工具书，也非常适合被当作矿石知识启蒙科普书拿来给少年儿童看。今天顺手一翻读了几页的感想：虽然知道未经雕琢的天然之美千金难买，但有些品类的宝石还真就得借由高超精湛的人工切割技法才能使其本身更炫妙的样貌得以充分显现啊。',38,NULL,'2025-03-24 19:32:34',31,'book',36),(37,'原来草莓个头大不一定是用了激素呀。',46,NULL,'2025-03-25 00:32:11',16,'posts',37),(38,'神奇的知识又增加了。',46,NULL,'2025-03-25 00:34:45',18,'posts',38),(39,'黑暗森林',46,NULL,'2025-03-25 01:08:16',14,'book',39),(40,'平凡的世界，不平凡的一生',22,NULL,'2025-04-02 14:52:39',10,'book',40);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '反馈内容',
  `hfnr` text COMMENT '回复内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `img` varchar(300) DEFAULT NULL COMMENT '附件图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (4,22,'<p> 图书馆空调的温度较低，由于图书馆内的人员数量较少，是否可以调高温度。</p>',NULL,'2025-03-24 22:02:56','未回复','空调温度',NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `leixing` text COMMENT '提醒类型',
  `content` text COMMENT '消息内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (3,22,'图书借阅逾期','宝石圣典 该借书逾期，请及时归还;归还日期: 2025-04-01','2025-04-02 15:00:00'),(4,22,'图书借阅逾期','宝石圣典 该借书逾期，请及时归还;归还日期: 2025-04-01','2025-04-02 15:15:00');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (6,'投入使用','中小学图书馆管理系统成功投入使用，欢迎使用。','2025-03-22 23:32:18');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '书籍名称',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '借书编号',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '借书时间',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `ghtime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (24,'宝石圣典','1907324935218249728','2025-04-02 14:51:15',22,'逾期','2025-04-01'),(27,'果壳中的宇宙','1907325586488803328','2025-04-02 14:53:50',52,'已借出','2025-04-09'),(28,'宝石圣典','1908050712918286336','2025-04-04 14:55:14',22,'已借出','2025-04-11'),(29,'艺术的故事','1908050729729056768','2025-04-04 14:55:18',34,'已借出','2025-04-11'),(30,'爱弥儿','1908050759185653760','2025-04-04 14:55:25',56,'已借出','2025-04-11'),(31,'三体','1909871373227778048','2025-04-09 15:29:53',43,'已借出','2025-04-16'),(32,'爱弥儿','1909871402965393408','2025-04-09 15:30:00',43,'已借出','2025-04-16'),(33,'教育漫话','1909871421944619008','2025-04-09 15:30:05',43,'已借出','2025-04-16'),(34,'地球之美','1909871440416333824','2025-04-09 15:30:09',43,'已借出','2025-04-16'),(35,'理想国','1909871472452427776','2025-04-09 15:30:17',43,'已借出','2025-04-16'),(36,'极简宇宙史','1909871618900746240','2025-04-09 15:30:52',75,'已借出','2025-04-16'),(37,'汉书','1909871636030283776','2025-04-09 15:30:56',75,'已借出','2025-04-16'),(38,'理想国','1909871651540819968','2025-04-09 15:31:00',75,'已借出','2025-04-16'),(39,'时间机器','1909871666988441600','2025-04-09 15:31:03',75,'已借出','2025-04-16'),(40,'三国志','1909871681270046720','2025-04-09 15:31:07',75,'已借出','2025-04-16'),(41,'三体','1909871703898316800','2025-04-09 15:31:12',75,'已借出','2025-04-16'),(42,'爱弥儿','1909871841014308864','2025-04-09 15:31:45',83,'已借出','2025-04-16'),(43,'艺术博物馆','1909871851349073920','2025-04-09 15:31:47',83,'已借出','2025-04-16'),(44,'平凡的世界','1909871912531386368','2025-04-09 15:32:02',83,'已借出','2025-04-16'),(45,'宝石圣典','1909871928096448512','2025-04-09 15:32:06',83,'已借出','2025-04-16'),(69,'宝石圣典','1909913205399650304','2025-04-09 18:16:07',83,'已借出','2025-04-16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_item`
--

DROP TABLE IF EXISTS `orders_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `book_id` int DEFAULT NULL COMMENT '图书ID',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书名称',
  `book_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书封面',
  `num` int DEFAULT NULL COMMENT '数量',
  `order_id` int DEFAULT NULL COMMENT '借书订单ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_orders_item_order_id` (`order_id`),
  CONSTRAINT `fk_orders_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_item`
--

LOCK TABLES `orders_item` WRITE;
/*!40000 ALTER TABLE `orders_item` DISABLE KEYS */;
INSERT INTO `orders_item` VALUES (24,31,'宝石圣典','http://localhost:9090/files/download/1742720585990-29.jpg',1,24),(27,29,'果壳中的宇宙','http://localhost:9090/files/download/1742719999810-27.jpg',1,27),(28,31,'宝石圣典','http://localhost:9090/files/download/1742720585990-29.jpg',1,28),(29,26,'艺术的故事','http://localhost:9090/files/download/1742719587051-24.jpg',1,29),(30,25,'爱弥儿','http://localhost:9090/files/download/1742719430539-23.jpg',1,30),(31,14,'三体','http://localhost:9090/files/download/1742716727918-12.jpg',1,31),(32,25,'爱弥儿','http://localhost:9090/files/download/1742719430539-23.jpg',1,32),(33,24,'教育漫话','http://localhost:9090/files/download/1742719240804-22.jpg',1,33),(34,30,'地球之美','http://localhost:9090/files/download/1742720245318-28.jpg',1,34),(35,22,'理想国','http://localhost:9090/files/download/1742718849268-20.jpg',1,35),(36,28,'极简宇宙史','http://localhost:9090/files/download/1742719880394-26.jpg',1,36),(37,21,'汉书','http://localhost:9090/files/download/1742718597627-19.jpg',1,37),(38,22,'理想国','http://localhost:9090/files/download/1742718849268-20.jpg',1,38),(39,17,'时间机器','http://localhost:9090/files/download/1742717575763-15.jpg',1,39),(40,20,'三国志','http://localhost:9090/files/download/1742718329206-18.jpg',1,40),(41,14,'三体','http://localhost:9090/files/download/1742716727918-12.jpg',1,41),(42,25,'爱弥儿','http://localhost:9090/files/download/1742719430539-23.jpg',1,42),(43,27,'艺术博物馆','http://localhost:9090/files/download/1742719748295-25.jpg',1,43),(44,10,'平凡的世界','http://localhost:9090/files/download/1742716153094-10.jpg',1,44),(45,31,'宝石圣典','http://localhost:9090/files/download/1742720585990-29.jpg',1,45),(69,31,'宝石圣典','http://localhost:9090/files/download/1742720585990-29.jpg',1,69);
/*!40000 ALTER TABLE `orders_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '发布人ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `read_count` int DEFAULT NULL COMMENT '阅读量',
  `section_id` int DEFAULT NULL COMMENT '版块ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='帖子信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (16,'大棚草莓是“反季节水果”吗','http://localhost:9090/files/download/1742710341323-1.jpg','[\"科普知识\"]','<p><img src=\"http://localhost:9090/files/download/1742710253570-1.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"/></p><p style=\"text-indent: 2em; text-align: left;\">草莓因其酸甜的口感成功俘获了人们的味蕾。在闲暇时光，前往大棚采摘草莓，沉浸式感受农事活动带来的质朴快乐，正逐渐成为众多人休闲游玩的热门之选。</p><p style=\"text-indent: 2em; text-align: left;\">不过，伴随大棚草莓采摘的日益风靡，网络上也涌现出了一些质疑的声音。有人心生疑惑：大棚里产出的草莓，与自然生长规律下的季节不同步，它到底算不算“反季节水果”呢？还有人满腹狐疑：大棚草莓果实饱满、品相极佳，是不是在生长过程中被施用了大量激素才得以如此？</p><p style=\"text-indent: 2em; text-align: left;\"><strong>“反季节水果”概念不成立</strong></p><p style=\"text-indent: 2em; text-align: left;\">青岛农业大学教授、中国园艺学会草莓分会荣誉副理事长姜卓俊接受科普时报记者采访时说：“农业科研中，不存在反季节水果的概念。只要自然条件适合，草莓可以一年四季生长。温度超过30℃和低于10℃，会抑制草莓生长。露地栽培情况下，我国草莓从南到北的成熟时间是四月到六月。从某种意义上说，是季节影响了草莓生长发育的进程。大众口中的反季节草莓，其实是利用现代科技为草莓提供了适宜的生长环境。”</p><p style=\"text-indent: 2em; text-align: left;\">当下，大棚种植技术巧妙攻克了部分季节温度与湿度不利于草莓生长的难题。与此同时，科研人员持续致力于草莓品种的改良，随着一些早熟品种的相继问世，草莓的成熟期也在不断提前。</p><p style=\"text-indent: 2em; text-align: left;\"><strong>草莓个头大不一定是用了激素</strong></p><p style=\"text-indent: 2em; text-align: left;\">在草莓采摘园，看着那些饱满圆润的大棚草莓，不少人心里犯嘀咕：“这么大个头，莫不是用了激素膨大剂？” 对此，姜卓俊“辟谣”说：“草莓个头大小，关键在于品种和栽种管理，跟激素可没啥关系！” 在育种专家们的努力下，草莓家族越来越壮大，品种丰富多样，果实个头也越来越可观，单果重50克以上的品种随处可见，甚至还冒出了粉色、白色等新奇颜色的草莓。</p><p style=\"text-indent: 2em; text-align: left;\">至于膨大剂，大家也别忧心忡忡。姜卓俊着重解释，膨大剂会让草莓含水量猛增，果皮变得薄脆，口味大打折扣，储存和销售也都成了难题，果农们用它纯属 “搬起石头砸自己的脚”，根本不划算。这下，大家可以放心品尝香甜的大草莓啦！</p><p style=\"text-indent: 2em; text-align: left;\"><strong>如何挑选大棚草莓</strong></p><p style=\"text-indent: 2em; text-align: left;\">在大棚采摘草莓应该如何挑选呢？专家总结了两点小窍门。</p><p style=\"text-indent: 2em; text-align: left;\">一是看。自然生长的草莓被一层蜡质层包裹着，俗称“皮”，这层蜡质层一旦被侵蚀，草莓会暗淡无光泽，且果实表层细胞壁也会渗出汁液。因此，当看到无光泽且表面有汁液浸出的草莓，要避免采摘。</p><p style=\"text-indent: 2em; text-align: left;\">二是闻。自然生长的草莓有淡淡宜人的清香，但使用过量药剂的草莓会附着药剂的气味，遇到这样的草莓，一定不要选购。</p><p style=\"text-indent: 2em; text-align: left;\">此外，吃草莓前，建议消费者先用流水冲洗几分钟，再用淡盐水浸泡几分钟，最后冲洗干净后食用。</p>',22,'2025-03-23 14:11:19',4,8),(17,'水杉：江城市树跨越亿年而来','http://localhost:9090/files/download/1742710740932-4.jpg','[\"学习园地\",\"科普知识\"]','<p style=\"text-indent: 2em; text-align: left;\">兽蹄鸟迹尚无朕，恐龙恶蜥横駊（pǒ）娑。</p><p style=\"text-indent: 2em; text-align: left;\">水杉斯时乃特立，凌霄巨木环北极。</p><p style=\"text-indent: 2em; text-align: left;\">——胡先骕（sù）《水杉歌》（节选）<img src=\"http://localhost:9090/files/download/1742710802976-4.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: left;\">秋水长天，万鸟翔集。“百湖之市”武汉，最美季节来临。市树水杉染红全城，一如它的英文名“Dawn redwood”——黎明红杉，伴着湖光水色，点亮每一个晨昏。<br></p><p style=\"text-indent: 2em; text-align: left;\">这一幕似乎太过寻常，每年秋天准时在武汉人的家门口上演。但黎明之前，是一个跨越数百万年乃至上亿年的“复活”归来故事。</p><p style=\"text-indent: 2em; text-align: left;\"><strong>“神树”重现</strong></p><p style=\"text-indent: 2em; text-align: left;\">远在1.45亿年前的白垩纪，水杉曾遍布北半球。世人眼中，它和同时期的恐龙一样，早已消亡于“冰川灭世浩劫”，只存化石。</p><p style=\"text-indent: 2em; text-align: left;\">直到1941年冬，植物学家干铎在川鄂交界磨刀溪（今湖北利川谋道镇）见到一株被当地人称为水桫（suō）的“神树”。从发现到采集标本，再到考证物种，直至最终定名，前后历经8年。1948年5月15日，生物学家胡先骕与林学家郑万钧联合发表论文，正式宣告水杉——远古冰川时代幸存者，重现于世。它被国家标号为“0001”的“水杉模式标本树”。</p><p style=\"text-indent: 2em; text-align: left;\">这一奇迹，轰动世界，被誉为“20世纪植物界最大发现”。西方惊呼“就像见到一头活恐龙”，中国则称“可媲美发现大熊猫”。被称为“中国生物学界老祖宗”的胡先骕先生，为之创作了一首68句七言古诗兼科学长诗《水杉歌》。</p><p style=\"text-indent: 2em; text-align: left;\">其后，作为植物国宝的水杉开启了由几粒种子，从中国重新传向全世界的新生之路。我国先后将水杉作为国礼，赠送美国、朝鲜和尼泊尔等国。80多个国家和地区的植物学家跋山涉水而来，亲赴湖北利川考察、引种。</p><p style=\"text-indent: 2em; text-align: left;\">利川的这棵水杉“神树”，迄今树龄已逾660多年，高35米、胸径2.4米，子孙遍全球，被称为“天下第一杉”。</p><p style=\"text-indent: 2em; text-align: left;\"><strong>伴水而生</strong></p><p style=\"text-indent: 2em; text-align: left;\">大半个世纪过去，水杉展现了远古幸存者的生命力：耐寒、耐热、耐湿，生长速度快，适应环境范围极广，身影重现于全球六大洲。</p><p style=\"text-indent: 2em; text-align: left;\">顾名思义，水杉亲水性很强，江河湖泊密布之地最宜生息。大江大湖的武汉，自然成了水杉乐园。千年万年隐于深山的水杉，带着山野之气，在江城惬意生长。</p><p style=\"text-indent: 2em; text-align: left;\">武汉从来爱英雄，更何况是从宇宙洪荒中孑遗的传奇英雄树——坚韧、耐苦、刚直、亲水，又带着楚人先民出身山林筚路蓝缕之气……1984年，水杉被正式确定为武汉的市树。</p><p style=\"text-indent: 2em; text-align: left;\">市树不负市民，四季相伴，为城中生活添色不少。初春，嫩绿新生，叶如小梳轻展。盛夏，青绿亭亭如翠伞。深秋，如金似火，流光飞舞。寒冬，叶子落尽，高树端挺，直冲云天。</p><p style=\"text-indent: 2em; text-align: left;\">论颜值，水杉实在是360度无死角，皮相骨相季相俱佳。玉树临风临水，独木塔立，排列似仪仗，成林如画。东湖绿道、解放公园、金银湖等处的水杉林，年年都是出片佳境。红杉成林、湖水荡漾，已然是国际湿地城市武汉的标志性场景。</p><p style=\"text-indent: 2em; text-align: left;\"><strong>生生不息</strong></p><p style=\"text-indent: 2em; text-align: left;\">水杉当选武汉市树，据说有个小插曲：武汉人把长在水边的池杉和落羽杉一并误认成了水杉，以致拉高票数不少。</p><p style=\"text-indent: 2em; text-align: left;\">到现在，大多数人还是“杉杉不分”，把涨渡湖的网红池杉叫作水杉。其实，两个关键特点就能判断哪个是水杉：叶如飞羽、整齐对称。水杉极具对称美：树形，标准的等腰三角形。叶、芽鳞、雄球花、雄蕊等，均交互对生。枝叶如羽，两侧小叶一左一右对称。</p><p style=\"text-indent: 2em; text-align: left;\">逢月夜，透过水杉枝叶看月亮，极富禅意。</p><p style=\"text-indent: 2em; text-align: left;\">水杉林中，多鸟语。笔者仅在家门口的湖边水杉林中，就记录到五六十种鸟，常见的有喜鹊、白头鹎（bēi）、黑卷尾、珠颈斑鸠、棕背伯劳、白鹭、夜鹭、翠鸟等。</p><p style=\"text-indent: 2em; text-align: left;\">水杉，不仅自己生命力顽强，也助力其他生命。鹭鸟、喜鹊尤其喜欢在水杉树上筑巢，世代守护利川“神树”的土家族人将此树别称为“喜树”，相传喜鹊在树上繁衍生息数百年。正所谓：莽原山林，烽火沧桑。长夜逝去，黎明再现。杉杉不息，生生不息！</p>',22,'2025-03-23 14:18:36',1,8),(18,'超新星爆发或为两次物种大灭绝“元凶”','http://localhost:9090/files/download/1742711043309-5.jpg','[\"科普知识\",\"学习园地\"]','<p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;\">德国基尔大学一项最新研究表明，地球历史上至少经历了两次由超新星爆发引起的大规模灭绝事件。研究称，这些强大的爆炸可能是晚泥盆纪和奥陶纪灭绝事件的幕后推手，分别发生在3.72亿年前和4.45亿年前。相关论文发表在新一期《皇家天文学会月刊》上。</span></p><p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742711017395-5.jpg\" alt=\"\" data-href=\"\" style=\"\"></p><p style=\"text-indent: 2em;\">超新星爆发是大质量恒星生命周期末期的一种现象。这种爆炸不仅能够传播重化学元素，还有助于新恒星和行星的形成，但如果发生得太接近地球，也会对地球生命造成毁灭性影响。研究人员发现，这类爆炸可能曾剥夺了地球大气中的臭氧层，导致酸雨并使生物暴露于有害的太阳紫外线之下。</p><p style=\"text-indent: 2em;\">据研究，奥陶纪大灭绝导致约60%的海洋无脊椎动物消失，而晚泥盆纪大灭绝则造成了大约70%的物种灭绝，并显著改变了古代海洋和湖泊中鱼类的多样性。研究还指出，太阳周围1000秒差距（约3260光年）内的超新星爆发率与这两次大规模灭绝的时间点相吻合，表明超新星可能是这些灭绝事件的主要原因。</p><p style=\"text-indent: 2em;\">进一步的研究集中在距离太阳20秒差距（约65光年）范围内的超新星爆发频率，通过对比已知数据，支持了超新星作为这两起大规模灭绝事件的原因。幸运的是，目前预计未来100万年内仅有两颗恒星——心宿二和参宿四，可能成为超新星，而它们均位于超过500光年之外。根据计算机模拟，这样的距离不太可能对地球产生影响。因此，当前看来人们还是相对安全的。<br></p>',79,'2025-03-23 14:23:50',6,13),(19,'国内首个太空采矿机器人来了！“星际矿工”如何采矿？','http://localhost:9090/files/download/1742711272809-6.jpg','[\"科普知识\"]','<p style=\"text-indent: 2em; text-align: start;\">随着地球资源的日益枯竭，人类的目光逐渐投向了太空，尤其是蕴藏丰富矿产资源的月球、火星、近地小行星等。太空采矿，这个以往在科幻小说和电影中出现的场景，正在逐步走向现实。</p><p style=\"text-indent: 2em; text-align: start;\">前不久，我国首台太空采矿机器人在中国矿业大学诞生。一起去看看未来的“星际矿工”是什么样↓↓↓</p><p style=\"text-indent: 2em; text-align: start;\">国内首个“星际矿工”诞生</p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学刘新华教授团队研发的多功能太空采矿机器人，与时下火爆的人形机器人以及机器狗等不同，太空采矿机器人的基本形态为六足模式，有三个轮足和三个爪足。刘新华教授告诉记者，之所以这样设计，主要是为了适应太空中的微重力环境。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_06189ef1-94ed-4f12-9e61-630ae1b46792.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">太空采矿机器人要在地外星体上完成地质勘探和矿物采集任务，钻探属于必备技能。在地球重力环境下，机器人本身的重量就足以支撑钻头钻进，而月球重力只有地球的六分之一，小行星上大多是低微重力，如何让钻头顺利钻进星体表面就成了大问题。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_0ef3a0c5-b2cb-48f3-8878-207e10322ae6.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">为了解决失重带来的漂移，科研团队想到了模拟昆虫的爪刺结构，于是，为太空采矿机器人设计了特殊的爪刺足。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_f0d4c263-c433-4c26-ae60-a56734ec0991.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学机电工程学院教授 刘新华：这属于一个阵列式的爪刺，微重力环境下，它的附着能力更强，抓地能力更强。在微重力环境下能够让它固定住进行采样，还能够根据地形进行移动。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_ab653cda-a124-4727-b565-800f6d59fe44.gif\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">不仅能适应太空的微重力环境，“采用仿生六足移动结构”，机器人足末端有车轮和锚固结构两种配置，也让它可以在小行星坑洼不平的地面上行走。目前，太空采矿机器人原型机已经向有关部门申请专利，并且通过了初审。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_c9090a10-4629-4a15-b90e-0d52727717db.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学机电工程学院教授 刘新华：我们实现了这种微重力的等效实验，这个机器人在模拟月壤的环境下，实现行走、锚固，甚至采样。</p><p style=\"text-indent: 2em; text-align: start;\">“星际矿工”的“十八般武艺” 如何练成</p><p style=\"text-indent: 2em; text-align: start;\">太空采矿机器人要在太空星体上完成探矿采矿工作，不仅要面对微重力的问题，还要面对极端温差、真空、太空辐射以及重量体积限制等一系列难题。如何让机器人练就“十八般武艺”？刘新华教授团队给太空采矿机器人搭建了一个特殊的“训练场”。</p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学机电工程学院副教授 华德正：我们搭建这个环境主要考虑两个方面，一个方面就是模拟近地小行星表面的风化程度，主要是以沙壤为主。另一块就是微重力环境，我们设计的这种悬吊机构，通过垂直的悬吊抵消它的重力，实现微重力的变化。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_dc291669-2ac2-4456-b861-7dcae273e1ca.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">团队成员介绍，经过在沙盘上不断训练，目前，通过六足差动系统悬架、离合器等协同工作，太空采矿机器人已经可以根据工作环境调整自身结构形状，适应地外星体的复杂地表环境。</p><p style=\"text-indent: 2em; text-align: start;\">要掌握更多勘探的绝活，太空采矿机器人还需要到中国矿业大学深地工程智能建造与健康运维全国重点实验室进行“进阶训练”，这里可以精准模拟月球表面极端环境。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_b24ae2b1-22bb-4c6a-892c-51f8f3a8fe2e.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学深地工程智能建造与健康运维全国重点实验室副教授 李瑞林：这个设备主要是将月球的原位环境模拟出来。六分之一G重力场，超高真空的环境。月球上白天可以达到130℃的高温，晚上可以达到-180℃，甚至在极区可以达到-250℃的低温。</p><p style=\"text-indent: 2em; text-align: start;\">不仅实现对月球小重力场等极端环境的长时间、高精度模拟，这一装置中正在开展的两个研究，“月球资源特征与储层物性原位探测方法与装备”“月球极区水冰资源温控贯入开采与原位制氢方法与装备”，也都是太空采矿研究的重点科研项目。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_3a2d0872-e32e-4566-8bf4-bba81023a2d5.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学深地工程智能建造与健康运维全国重点实验室副教授 李瑞林：将环境模拟出来以后，我们再采用和月壤性质相似的模拟月壤，将月球地层的特性高保真重现出来。实际上它就是跟月球上基本一致的状态。这时候我们再去做实验，实际上跟月球上的数据是接近的。</p><p style=\"text-indent: 2em; text-align: start;\">人类有望试验性开采 近地星体上的太空资源</p><p style=\"text-indent: 2em; text-align: start;\">开发太空资源不仅是科技竞争的制高点，更承载着未来人类文明可持续发展的希望。专家介绍，基于现有的空间科学技术、航空航天技术以及采矿技术等，人类有望在几十年内实现试验性开采近地星体上的太空资源。</p><p style=\"text-indent: 2em; text-align: start;\">专家介绍，在有限的地球资源最终将面临枯竭困境的威胁下，人类走向太空是必然选择。月球作为地球唯一的天然卫星，同时具有距地球相对较近的优势和丰富的资源，目前对月球资源的探索研究全球关注度最高，科研投入也最大。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_84827af4-ee51-43e0-92bd-53a7d3f03ddb.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学环境与测绘学院教授 李怀展：月亮表面的氦-3，它可以作为核燃料，还有月球背面水冰资源。</p><p style=\"text-indent: 2em; text-align: start;\">月球资源或成人类最先 开发利用的太空资源</p><p style=\"text-indent: 2em; text-align: start;\">专家介绍，20世纪50年代末以来，全球成功登月并开展探测任务的月球探测器和载人飞船已有80多个，积累了丰富的月球探测相关资料。目前中国、美国、俄罗斯等国都制定了载人登月计划，月球资源极有可能成为人类最先开发利用的太空资源。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_d144e71d-1efb-4ca6-bc4b-61d521bcb882.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">此外，太阳系中数量众多的小行星也蕴藏着丰富的矿产资源，其中近地小行星运行轨道距离地球较近，同样开发利用相对便利，目前已初步掌握有1500多颗近地小行星具有非常高的开采价值和可采性。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_4d4b7bb2-8222-4d33-9f32-54109ea5f8a4.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学环境与测绘学院教授 李怀展：小行星主要是稀土资源，还有就是铁、镍、钴这种金属。通过前期的探测，这些资源是确定存在的。</p><p style=\"text-indent: 2em; text-align: start;\">人类在与太空采矿有关的 关键技术上取得大量成果</p><p style=\"text-indent: 2em; text-align: start;\">据了解，目前全球科技界在地外天体钻孔技术、太空中原位资源利用等与太空采矿有关的多个关键技术上取得了大量成果。太空3D打印技术等一大批新兴技术涌现，也让我们对在太空制造组装采矿装备和利用太空资源充满期待。</p><p style=\"text-align: center;\"><img src=\"http://www.kepu.gov.cn/news/pic/2025-03/17/310488_c47e7e43-037a-4daf-b254-ff05a1886a1b.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-indent: 2em; text-align: start;\">中国矿业大学深地工程智能建造与健康运维全国重点实验室副教授 李瑞林：向外太空发展是人类社会未来发展非常重要的一个阶段，是人类文明发展非常重要的一个阶段。去外星球发展，第一步就是资源，要解决资源的问题。所以这就是我们国家也包括我们自己做研究，重点在聚焦太空采矿，或者说月球资源的原位开采利用放在首位的原因。</p>',79,'2025-03-23 14:27:46',2,13),(20,'好书推荐之《平凡的世界》','http://localhost:9090/files/download/1742711689779-7.jpg','[\"学习园地\"]','<p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742711697571-7.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: left;\"> &nbsp; &nbsp;《平凡的世界》是中国作家路遥创作的一部全景式地表现中国当代城乡社会生活的百万字长篇小说。全书共三部。1986年12月首次出版。</p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp;该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。</p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; 初读该书是在高三的时候，那时候的自己每天午睡前的20分钟，沉浸在该书的世界的，第二次再读该书已是大学毕业一年后，这是自己最喜欢的一本书，孙少平想在平凡的世界中活出自己的一丝不平凡，他一直有着自己的思想，也曾和晓霞有过一段很美好的经历，最后的孙少平，留在了煤矿的黑色世界里，照顾着师傅的妻子。我想，孙少平活出了自己的不平凡！</p><p style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp;繁华的世界，我们，每一个，渺小而平凡。</p><p style=\"text-align: start;\">　　平凡的世界，洗尽铅华，尘埃落定。</p><p style=\"text-align: start;\">　　黄土地上是另一个世界，那里有苦难与磨砺，有奋斗与觉醒，有善良与残忍，有爱与痛苦。少平少安一家的沉降起伏，几多辛酸几多无奈。</p><p style=\"text-align: start;\">　　黄土养育了西北汉子的粗犷与豪迈，他们的身上从来找不到云端的飘逸，永远是脚踏实地的坚定。即便在生活的最底层，即便一无所有，主人公还在为自己靠双手收获的那么一丁点的幸福，痛并快乐着。</p><p style=\"text-align: start;\">　　路遥的文字，向来朴实，就像黄土地般的厚重，却很感人，类似于黄沙吹入眼中，无意去哭，但在合上书却早已泪眼朦胧。柔柔眼睛，却发现身边已是另一个世界。</p><p style=\"text-align: start;\">　　我不想说这本书反映了什么时代变迁，展现了中国农村几十年发展的缩影，他的历史意义，留与后人评说，最最想写的，是这么一个与现实生活已差很多年代的文学作品，在当年那个懵懂无知的男孩心中所激起的震荡。</p><p style=\"text-align: start;\">　　人年轻的时候，总爱动不动就想到了生死，一点打击一点挫折，自己的喜怒哀乐好像全世界都不能理解。谁不曾年轻过，在年轻气盛目空一切的岁数，内心充满了愿望和理想，对自己的人生寄予了太多的期许，尽情的肤浅狂妄张扬奔腾，毕竟少年心思当拿云。</p><p style=\"text-align: start;\">　　少平也是的。少平的出场，伴随着饥饿与贫穷，为了馒头，为了学费，甚至为了尊严，为了生存下去，整部书徐徐开始了讲述。</p><p style=\"text-align: start;\">　　书中的贫穷，我们不懂。我们不知道生活在黄土地上的少平一家，为了修一个能遮风挡雨的新窑，为了给让少平和兰香有学上，为了给少安找到媳妇，为了给老人治病，面对着那一片片田地时内心的汹涌与期待，粮食的收成，决定了一家人所有的幸福，粮食的事，却是天说了算，而他们早已习惯了天不肯多给的同情。不停地等，不停地盼，一次次的充满希望看着一望无际的田地，不断的毫无保留的付出，只为了能离贫穷，远一点点。</p><p style=\"text-align: start;\">　　书中的奋斗，我们不懂。少平上高中读书的劲头，回家种田的精力，建窑烧砖的拼命，以及后来到外面去挖煤，再到矿山的从不放弃，从没叫过一句苦，从没喊过一声累，他不是超人，瘦弱的肩膀也有压垮的时候，也想放弃退缩之后一了百了，是什么支撑着他不断向前永不退缩</p><p style=\"text-align: start;\">　　书中的爱情，我们不懂。少平与红梅的懵懂，与晓霞的爱情悲剧，少安与润叶类似兄妹的爱恋，润叶对向前的责任，金波对蒙古姑娘的罗曼蒂克……很无奈的发现，为什么爱，要被赋予那么多的责任与意义，背在两个年轻人身上，让双方都感觉好沉重。</p><p style=\"text-align: start;\">　　书中那些融入了作者血与泪的喜怒哀乐，不谙世事的我们怎么能懂，少年不识愁滋味，为赋新词强说愁，而今识尽愁滋味，欲说还休，却道天凉好个秋。渐渐成熟的我，再次翻开这本书，却发现，少平是幸福的，我们是平凡的。</p><p style=\"text-align: start;\">　　作者潜意识里把少平塑造成了一个拥有相当完美人格的人，他的经历，或许我们都曾有过，但他的意志品质我们却望尘莫及，从这个意义上，少平的世界是不平凡的，因为他有自己内心的力量可以支撑自己闯过一切磨难，真正平凡的是我们，这些在细小琐碎中彷徨挣扎的脆弱懦弱的人们，我们或许更像少安，肩上有全家人的重担，也有自己的抱负，辛勤的耕耘，期待成功，但当现实在眼前时，还是懦弱的低下了头选择妥协。对润叶的爱，默默的不让她为难，不让她受苦，不让周围的人说三道四，只好自己选择放手，或许自己内心有点伤，但这样毕竟大家都好。我们或许更像晓霞，有远大的理想，善良隐忍，遇见真爱，毫不犹豫的去追求，不怕家人的反对，不怕周围人的眼光，只要对自己的心说，勇敢去爱，不死心还在，即使死了，爱还在。或许更像金波，为了朋友两肋插刀，永远真诚与真实，大方从不吝啬，爱憎分明，喜怒哀乐全部表现在脸上，像个孩子，但招人喜欢。</p><p style=\"text-align: start;\">　　这些所有人的一切，都是围绕孙少平的人生，亲情友情事业爱情，在少平那里，处理起来，总是与众不同，他自谦从不自卑，期望但不狂妄，所以他遇到再大的问题，也能扛过去，再伤心的事也可以自己恢复，骨子里的坚强自立，奋发勇敢，智慧责任，让他过早的成熟，面对真爱，他选择放弃，因为知道没有未来，这里的知道是他考虑了自己的人生轨迹和晓霞的追求而得出的。因为不想面对众人及道义的压力，这里的不想绝不是懦弱的不敢只是知道两个人承担不起这样的压力，总压着迟早会崩溃掉的。面对自己的理想，即使去挖煤，也不愿到大城市当工人，这里又完全出自他的本心了，挖煤让他快乐而满足，人生又何必贪图强求呢，很从容的选择继续挖煤，或许在少平眼中，这样的选择根本不是选择，当身上的重担轻一些的时候，毕竟还可以享受一下自己的梦想。</p><p style=\"text-align: start;\">　　心远地自偏，最最平凡的人身上一旦汇聚了最最不平凡的气质，人生注定要与众不同轰轰烈类，平凡如他的我们，能拥有他的责任感远见豁达及大气吗？</p><p style=\"text-align: start;\">　　少平是不甘于平凡的，我们也一样，其实每个人，都在通往不平凡的路上，趔趄前行</p><p style=\"text-align: start;\">　　在前进的过程中，只要记得，我们的理想，我们的责任，我们肩上的重担和心里的声音，奋斗我们的青春，理智的选择我们的未来，像冰心先生说的那样，爱在左,同情在右,走在生命的两旁,随时撒种,随时开花,将这一路径长途,点缀得香花弥漫,使穿枝拂叶的行人,踏着荆棘,不觉得痛苦,有泪可落,却不是悲凉.</p><p style=\"text-align: start;\">　　每个平凡的我们注定会有不平凡的人生。</p>',58,'2025-03-23 14:35:21',2,9),(21,'好书推荐｜《钢铁是怎样炼成的》：生命坚韧的铸造 缓爬 缓爬','http://localhost:9090/files/download/1742712029933-8.png','[\"学习园地\"]','<p style=\"text-align: start;\">《钢铁是怎样炼成的》是苏联作家尼古拉·奥斯特洛夫斯基的代表作品，是一部描写苏联社会变革时期的小说。通过主人公帕维尔·克罗特科夫的一生经历，小说展现了个体在历史巨变中的命运沉浮，以及人性在逆境中的坚韧与抗争。</p><p style=\"text-align: start;\"><img src=\"http://localhost:9090/files/download/1742712039409-8.png\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: start;\">小说以帕维尔·克罗特科夫的人生为主线，生动地描绘了一个苏联普通家庭在战争、革命和苏维埃建设时期的遭遇和经历。帕维尔·克罗特科夫的一生，就像钢铁一样，经历了严酷的磨砺，最终铸就了一颗坚韧不拔的心灵。</p><p style=\"text-align: start;\">小说以第一人称的形式，由主人公帕维尔·克罗特科夫回忆过去的经历，以及他对于生命、理想和爱情的思考。通过对帕维尔的心灵世界的深刻描绘，小说突显了一个普通人在历史洪流中的苦难命运。他的爱情、友情、家庭，以及他在军队、工厂、监狱中的经历，都使得读者深刻感受到那个时代的动荡和普通人的坚韧。</p><p style=\"text-align: start;\">小说通过对帕维尔参加战争的描写，展现了那个时代的烽火硝烟和个体在战争中的顿挫。帕维尔在战场上目睹了生离死别、血雨腥风，这让他对于人性的善恶和生命的脆弱有了更为深刻的认识。战争成为磨练帕维尔意志的巨大炼炉，也使得他在逆境中逐渐形成了坚定的信念和对生命的珍视。</p><p style=\"text-align: start;\">随着战争结束，苏联进入了社会主义建设时期。帕维尔转战于各类工厂和生产一线，他投身于新生活的建设，体验了社会主义时代的巨变。然而，这个时期同样伴随着新的困境和考验，政治运动、集体化运动等让人在生活的波澜中不断奋斗。</p><p style=\"text-align: start;\">小说中通过帕维尔的爱情经历，展现了他对于理想和真实的追求。在苏联时代的政治风云中，帕维尔与玛莎之间的感情经历了诸多波折，但他们的坚持和对爱情的执着，使得小说中充满了温暖和人性的光辉。帕维尔通过对玛莎的爱情，体验到了在动荡时代中珍贵而坚定的情感纽带，这成为他在风雨中前行的力量源泉。</p><p style=\"text-align: start;\">小说通过对帕维尔在苏联社会变革时期的政治运动中的遭遇，揭示了当时政治运动对个体命运的深远影响。帕维尔因为政治原因被判刑入狱，经历了种种磨难。小说通过对狱中生活的描写，呈现了个体在政治运动中所受到的巨大压力和生命的坚韧。帕维尔在狱中对于理想的思考，表达了对自由和尊严的追求。</p><p style=\"text-align: start;\">小说通过帕维尔一生的波折，展现了苏联社会变革时期的浩劫和普通人在其中的坚韧与抗争。他的命运或许并不是特殊的，但在他的坚守中体现了一种生命的力量。小说通过对战争、爱情、政治运动等多个层面的描写，使得读者能够更全面地理解当时苏联社会的风云变幻，以及个体在其中所面临的生存压力和心灵考验。</p><p style=\"text-align: start;\">总的来说，《钢铁是怎样炼成的》是一部描写个体在历史洪流中坚韧抗争的小说，通过主人公帕维尔·克罗特科夫的一生，展现了生命的坚强和人性的复杂。这部小说对于历史、人性、社会的思考，使得读者在感受战争年代的苦难同时，也能够体味到生命中对于真实、尊严和理想的追求。</p>',58,'2025-03-23 14:40:43',1,9),(22,'语文其实很好玩——分享几个趣味语文小故事 ','http://localhost:9090/files/download/1742712406092-8.jpg','[\"学习园地\"]','<p style=\"text-align: left;\"><span style=\"font-size: 16px;\">美国现代著名作家马克·吐温，在一次宴会上，与一位女士对坐，出于礼貌，说了一声：“你真漂亮！”那位女士不领情，却说：“可惜我无法同样地赞美您！”马克·吐温说：“那没关系，你可以像我一样说一句谎话。”言辞委婉、平和，反其义而用之，那位女士低下了头。</span></p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/ca7cac4c64d04a65877126ac12aa9c43.jpeg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: left;\">智慧的反驳，比激烈的否认更能得到别人的尊重。</p><p style=\"text-align: left;\">”</p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/1061816642cd46a580c657f10f8bd89d.jpeg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>世界上最短的信</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">法国著名作家雨果将《悲惨世界》的手稿寄给出版社后，过了一段时间还不见此书出版。于是就给出版社去了一封信，内容只写了：“？——雨果。”很快，他便收到一封出版社的回信，内容也只有：“！——编辑室。”过了不久，轰动世界的《悲惨世界》便于读者见面了。</span></p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/6d6c082a9eb74ec08e36d4ed3d9546b6.jpeg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: left;\">这封信，被称为“世界上最短的信。”</p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>谁对谁错</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">从前有个旅店贴了一张广告，上面写着：“下雨天留客天留客不留。”一位旅客走上来，要求住店。店主指着广告说：“你没看见写的广告：‘下雨天，留客天，留客？不留。’”客人说：“我看见了。广告说得清楚：‘下雨天，留客天。留客不？留！’”</span></p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/cff3801d5c3b4fdeb8f3bf010d26ff05.jpeg\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: left;\">其实，这句话还有另外两种读法：一种是疑问句式：“下雨天，留客天，留客不留？”一种是陈述句式：“下雨天，留客，天留，客不留。”</p><p style=\"text-align: left;\">你读出来了吗？用好标点真的很重要！</p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>“一字千金”的由来</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">两千多年前，秦国的宰相吕不韦组织他的门客集体编纂了一部大书——《吕氏春秋》。书成之后，把“稿本”挂在首都咸阳的城门上，声称有能增删一字者赏给千金。</span></p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/6f2bee37129e45d4a3bf5996ba8ec5a4.jpeg\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>不知是因为这书实在编得好还是人们畏惧吕不韦的权势，据说，竟没人能够拿走这笔高额的“奖金”。于是，这个故事引出了一个“一字千金”的成语。用来形容一篇文章的价值很高，或者称赞一篇文章在修辞上特别出色，字字珠矶，不可多得。通常我们用来形容文章的价值或修辞的美妙比较妥当。</strong></span></p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>灯谜联难倒君臣</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">有一年元宵节前夕，乾隆帝让每位大臣都糊一盏灯，上面写好谜语、对联或诗文送进宫来，让大家一同欣赏，共度元宵佳节。</span></p><p style=\"text-align: left;\">到了元宵节这天，各式各样的彩灯挂满了御花园。乾隆与文武百官在御花园里走动，就好像是在灯海里畅游。他们每到一盏灯前，或赏诗，或猜谜，或对句，不时发出一阵阵酣畅的笑声。</p><p style=\"text-align: left;\">文武大臣众星捧月般地陪着乾隆帝来到纪晓岚献的彩灯前，只见上面挂着一副灯谜对联，上写：<span style=\"font-size: 16px;\">黑不是，白不是，红黄更不是；和狐狼猫狗仿佛，既非家畜，又非野兽。诗也有，词也有，论语上也有；对东西南北模糊，虽为短品，也是妙文。</span></p><p style=\"text-align: center;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/919387569bb045299dd7fd6b710a0c80.jpeg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p style=\"text-align: left;\">满朝文武看了这副灯谜对联，立刻收敛了笑容，皱起眉头，他们都被难住了。既爱对句又喜猜谜的乾隆帝，这时也没了辙。君臣一起，搜肠刮肚，绞尽了脑汁，但猜来猜去，还是不知所云。最后，只得让纪晓岚自己揭开谜底。</p><p style=\"text-align: left;\">原来，谜联是打两个字，上联是“猜”，下联是“谜”。</p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>“座右铭”的由来</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">东汉书法家崔援年轻时好意气用事，他因哥哥被人杀害，大怒之下杀了仇人，只身逃亡。几年后遇朝廷大赦，才回到故乡。崔援自知因一时鲁莽惹起大祸，吃足苦头，就作铭（文体的一种）放在座位的右侧，用以自戒。以后凡是把一些格言写出来放在座位旁边用以自勉的，就叫做“座右铭”。</span></p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>“孺子牛”的由来</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">据《左传·哀公六年》记载：“鲍子曰：汝忘君之为孺子牛而折其齿乎?而背之也。”这里所说的孺子，是指春秋时期齐景公的幼子——荼。</span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">齐景公特别宠爱他的孺子，有一次，齐景公趴到地上，嘴衔绳子，装作牛，让荼当牛骑。荼正玩得高兴，不小心从“牛”背上跃了下来，绳子把齐景公的牙齿折断了。</span></p><p style=\"text-align: left;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/5eca3862e27b4ab9a96f00da3f5292ea.jpeg\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">显然，当年的“孺子牛”是指齐景公对他幼儿的宠爱。鲁迅《自嘲》诗里：“俯首甘为孺子牛”，是用这个典故，注入了全新的内容，表示了他甘为人民大众的牛的高贵品质，表达自己对人民大众的无限忠诚。</span></p><p style=\"text-align: left;\">”</p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\"><strong>“桃李”的由来</strong></span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">人们历来喜欢把老师培养出来的学生称作“桃李”。把老师教育、培养了众多学生称作“桃李满天下”。</span></p><p style=\"text-align: left;\"><span style=\"font-size: 16px;\">为什么要把学生称为\"桃李\"呢?有这么一段故事：春秋时，魏国有个大臣叫子质，他得势的时候，曾培养和保举过不少的人，后来因为得罪了魏文侯，便独自跑到北方去。</span></p><p style=\"text-align: left;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20180804/625997c6fecc413d884fbcfaf9973dee.jpeg\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: left;\">在北方，子质遇见一个叫子简的人。就向他发牢骚，埋怨自己培养的人不肯为他出力。以至于流落北方。子简笑着说：“春天种下桃树和李树，夏天可以在树下休息纳凉，秋天还可以吃到果子；可是你春天种下的是蒺藜（一种带刺的植物），不仅不能利用它的种子，秋天长出来的刺还会刺人。所以，<span style=\"font-size: 16px;\">君子培养人才，要像种树一样，应该先选准对象，然后再加以培养。</span>”</p><p style=\"text-align: left;\">尔后，人们就把培养人才称作“树人”；把培养出来的优秀人才称为“桃李”。</p>',58,'2025-03-23 14:44:29',1,10),(23,'不为五斗米折腰','http://localhost:9090/files/download/1742712821866-9.jpg','[\"科普知识\"]','<p style=\"text-align: start;\">陶渊明为了养家糊口，来到离家乡不远的彭泽当县令。在那年冬天，郡的太守派出一名督邮，到<a href=\"https://zhidao.baidu.com/search?word=%E5%BD%AD%E6%B3%BD%E5%8E%BF&amp;fr=iknow_pc_qb_highlight\" target=\"\">彭泽县</a>来督察。督邮，品位很低，却有些权势，在太守面前说话好坏就凭他那张嘴。这次派来的督邮，是个粗俗而又傲慢的人，他一到彭泽的旅舍，就差县吏去叫县令来见他。 </p><p style=\"text-align: start;\">陶渊明平时蔑视功名富贵，不肯趋炎附势，对这种假借上司名义发号施令的人很瞧不起，但也不得不去见一见，于是他马上动身。不料县吏拦住陶渊明说：“大人，参见督邮要穿官服，并且束上大带，不然有失体统，督邮要乘机大做文章，会对大人不利的！”</p><p style=\"text-align: center;\">这一下，陶渊明再也忍受不下去了。他长叹一声，道：“我不能为五斗米向乡里小人折腰！”说罢，索性取出官印，把它封好，并且马上写了一封辞职信，随即离开只当了八十多天县令的彭泽。<img src=\"http://localhost:9090/files/download/1742712814285-9.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p>',51,'2025-03-23 14:53:49',1,10),(24,'两袖清风','http://localhost:9090/files/download/1742712941638-10.jpg','[\"学习园地\"]','<p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742712927870-10.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\">于谦是明朝著名的民族英雄和诗人。他曾先后担任过监察御史、巡抚、<a href=\"https://zhidao.baidu.com/search?word=%E5%85%B5%E9%83%A8%E5%B0%9A%E4%B9%A6&amp;fr=iknow_pc_qb_highlight\" target=\"\">兵部尚书</a>等职。于谦作风廉洁，为人耿直。于谦生活的那个时代，朝政腐败，贪污成风，贿赂公行。当时各地官僚进京朝见皇帝，都要从本地老百姓那里搜刮许多的土特产品，诸如绢帕、蘑菇、线香等献给皇上和朝中权贵。</p><p style=\"text-align: start;\">明朝正统年间，宦官<a href=\"https://zhidao.baidu.com/search?word=%E7%8E%8B%E6%8C%AF&amp;fr=iknow_pc_qb_highlight\" target=\"\">王振</a>以权谋私，每逢朝会，各地官僚为了讨好他，多献以珠宝白银，巡抚于谦每次进京奏事，总是不带任何礼品。他的同僚劝他说：“你虽然不献金宝、攀求权贵，也应该带一些著名的土特产如线香、蘑菇、手帕等物，送点人情呀！”于谦笑着举起两袖风趣地说：“带有清风！”以示对那些阿谀奉承之贪官的嘲弄。两袖清风的成语从此便流传下来。</p><p style=\"text-align: start;\"><br></p>',51,'2025-03-23 14:55:43',2,10),(25,'庄子不愿做官','http://localhost:9090/files/download/1742712985422-11.jpg','[\"学习园地\"]','<p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742712991248-11.jpg\" alt=\"\" data-href=\"\" style=\"width: 100%;\">有一天，庄子正在涡水垂钓。楚王委派的二位大夫前来聘请他，楚王听说了庄子的大名，希望庄子能够出山，上可以为君王分忧，下可以为黎民百姓谋福利。这是多么好的事情。</p><p style=\"text-align: start;\">可庄子稳拿钓鱼竿，看都不看来者一眼，淡然说道；“我听说<a href=\"https://zhidao.baidu.com/search?word=%E6%A5%9A%E5%9B%BD&amp;fr=iknow_pc_qb_highlight\" target=\"\">楚国</a>有只神龟，被杀死时已三千岁了。楚王珍藏之以竹箱，覆之以锦缎，供奉在庙堂之上。请问二大夫，此龟是宁愿死后留骨而贵，还是宁愿生时在泥水中潜行曳尾呢？”二大夫道：“自然是愿活着在泥水中摇尾而行啦。”庄子说：“二位大夫请回去吧！我也愿在泥水中曳尾而行。”</p>',51,'2025-03-23 14:56:36',0,10),(26,'学生英语角','http://localhost:9090/files/download/1742713445770-12.png','[\"学习园地\",\"生活小贴士\"]','<p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742713490846-12.png\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><h2 style=\"text-align: start;\">How toRead \'Apple\' and Its Meaning</h2><p><br></p><p style=\"text-align: start;\">在英语学习中，了解如何正确发音以及单词的含义非常重要。‘Apple’是一个常见的英语单词，表示‘苹果’。在发音上，‘Apple’的音标是/ˈæpl/。这个单词的发音规则遵循了英语的常见音节结构，小学生学习时可以通过逐字发音来掌握。Apple不只指水果，它还可以用来做比喻或象征某些事物，如‘apple of my eye’表示非常重要的某人或某物。在日常生活中，学生们经常接触到‘apple’这个词，可以通过语境来更好地理解它的多种用法。</p><h2 style=\"text-align: start;\">How to Read \'Banana\' andIts Meaning</h2><p style=\"text-align: start;\">‘Banana’是英语中常见的水果单词，表示‘香蕉’。它的发音是/bəˈnænə/，学习者需要注意重音在第二个音节。Banana不仅在食物中有广泛的应用，也出现在许多文化表达中，例如‘bananasplit’是一种冰淇淋甜点。香蕉这个词不仅在课堂上，平时的对话和阅读中也十分常见，掌握其发音与用法非常重要。除了作为水果外，‘banana’还可以用于形容某些形象的表达，例如‘going bananas’，意思是非常疯狂或失控。</p><h2 style=\"text-align: start;\">How to Read\'Cat\' and Its Meaning</h2><p style=\"text-align: start;\">‘Cat’是小学生日常接触到的词汇之一，表示‘猫’。它的发音是/kæt/，一个简短而清晰的单词，容易发音和记忆。Cat是指一种宠物，常见于许多家庭中，也是许多动画和故事中的主角。‘Cat’这个词的用法也非常广泛，比如‘cat’s whiskers’意味着‘猫的胡须’，但它在口语中有时还表示某人非常优秀或特别。通过熟悉这种日常用语，学生能够更好地理解语言的多样性。</p><h2 style=\"text-align: start;\">How to Read \'Dog\'and Its Meaning</h2><p style=\"text-align: start;\">‘Dog’是英语中的基础单词之一，表示‘狗’。其发音为/dɔɡ/，简单明了。Dogs作为人类的朋友，出现频繁，是英语学习中的常见词汇。‘Dog’还可以作为动词使用，表示‘追逐’。在英语口语中，‘dog’也可以用作比喻，比如‘dogdays of summer’指的是夏季最热的时候。对于小学生来说，‘dog’是一个基础且常见的单词，掌握它的正确发音和多种用法可以帮助孩子更好地理解日常对话。</p><h2 style=\"text-align: start;\">Howto Read \'Elephant\' andIts Meaning</h2><p style=\"text-align: start;\">‘Elephant’是英语中一个较为复杂的单词，表示‘大象’。它的发音为/ˈɛləfənt/。发音中的音节较长，且有一个重音在第一个音节。大象是陆地上最大的哺乳动物，通常出现在儿童故事、动物园、以及文化表现中。除了动物的意义外，‘elephant’这个词还可以用来表达‘something largeand difficult to ignore’，例如‘theelephant in the room’，意思是大家都知道但没有谈论的问题。通过学习‘elephant’，学生不仅能掌握动物的名称，还能学习到一些比喻性表达。</p>',51,'2025-03-23 15:04:25',1,12),(27,'难忘的校园','http://localhost:9090/files/download/1742713998382-14.jpeg','[\"生活小贴士\"]','<p>今天，我想和大家一起探寻那些在校园里闪耀的点滴魅力。校园生活是我们青春的舞台，它充满了欢笑、汗水和回忆。让我们一同回到那些美好的岁月，感受校园生活的独特魅力吧！</p><p style=\"text-align: center;\"><img src=\"http://localhost:9090/files/download/1742714005806-14.jpeg\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><p>**一、晨曦中的清新气息**</p><p>每天清晨，当太阳的第一缕阳光洒在校园的大地上，校园就仿佛被注入了新鲜活力。那一刻，树叶上的露珠闪烁着晶莹剔透的光芒，微风拂过，带来了阵阵清凉。走在校园的小路上，感受着清晨的宁静，呼吸着新鲜的空气，这种宁静和清新会让你忘记所有的烦恼和压力，让你心情愉悦地迎接新的一天。</p><p>**二、友情的芬芳盛开**</p><p>在校园里，友情是最美丽的花朵，在时间的洗礼下绽放出独特的芬芳。它们像彩虹般绚丽，像海浪般澎湃，给我们带来温暖和力量。在课堂上，我们一起学习、讨论，彼此帮助、互相成长。在食堂里，我们一起分享美食、开怀大笑，营造出欢乐的氛围。无论是困难时的携手相伴，还是成功时的共同庆祝，友情都是校园生活中最珍贵的财富。</p><p>**三、智慧的火花闪耀**</p><p>在校园里，智慧的火花在学习的道路上不断闪耀。教室里，老师们用知识的火炬点亮我们前行的路，他们用智慧的引导帮助我们探索未知的世界。课堂上的讨论和思辨，实验室里的探索和创新，都是智慧与智慧碰撞的瞬间。这些知识的火花点燃了我们的求知欲望，让我们不断成长，展现出我们的才华和潜力。</p><p>**四、多彩的文化</p><p>校园是文化的熔炉，多彩的文化在这里交织出绚丽的图景。音乐会、话剧演出、文艺晚会……校园文化活动丰富多样，各种才艺展示和演出给了我们展示自我的舞台。在校园的角落里，你可以听到吉他的弹奏声，看到舞蹈社团的翩翩起舞，感受着一幕幕文化的盛宴。这些文化活动不仅丰富了我们的生活，也培养了我们的审美情趣和综合素质。</p><p>**五、记忆中的浪漫时光**</p><p>校园生活充满了浪漫的时刻，那些年的青涩恋爱、甜蜜约会、手牵手漫步在校园小径的画面仿佛还历历在目。无论是在操场上追逐嬉戏，还是在图书馆里静静读书，每一个浪漫的瞬间都让我们的心跳加速，让我们沉浸在幸福的氛围中。这些美好的回忆是我们宝贵的财富，伴随着我们走过人生的每一个阶段。</p><p>**六、梦想的起航地**</p><p>校园是我们梦想的起航地，是我们追逐梦想的舞台。在这里，我们结识了志同道合的朋友，遇到了具有启发和影响力的导师，获得了宝贵的学习机会和资源。无论是创业梦想、科研梦想还是艺术梦想，校园给予了我们实现梦想的平台和支持。在这个充满活力和机遇的环境里，我们奋发向前，勇敢追逐梦想。</p><p>七、无尽的可能性</p><p>校园生活中蕴藏着无尽的可能性。在校园的学习和实践中，我们可以尝试各种不同的领域和兴趣，开拓自己的眼界和思维。参加社团活动、学术竞赛、志愿服务等，都是拓展自己的机会。我们可以发现自己的潜能和特长，不断挑战自我，突破自己的极限。校园生活给予我们实现梦想的土壤，让我们的才华和激情得以展现。</p><p>八、相聚与离别</p><p>在校园里，我们与朋友们一起度过了美好的时光，一起经历了成长和困难。但随着毕业的临近，我们也将面临离别。这个阶段的相聚和离别，让我们更加珍惜彼此的存在，深深地明白朋友的重要性。虽然我们将各自奔向未来的道路，但校园生活中的那些情谊将永远铭刻在心中。离别并不意味着结束，而是另一个开始，我们将继续支持彼此，见证彼此的成长。</p><p>九、传承与创新</p><p>校园生活是传承与创新的结合，我们在传统中汲取营养，在创新中不断突破。学习传统文化，了解历史的沉淀，是我们继承和传扬优秀文化的基础。同时，校园也是创新的摇篮，我们勇于探索新的领域，勇敢尝试新的理念和思维方式。传承与创新相得益彰，让校园生活充满了活力和创造力。</p><p>十、感恩与回馈</p><p>在校园生活中，我们也要学会感恩与回馈。感恩老师的教导和栽培，感恩朋友的陪伴和支持，感恩家人的无私付出。我们要学会回馈社会，通过自己的努力和奉献，回报那些曾经帮助过我们的人和社会。感恩和回馈的精神将伴随我们一生，让我们的校园生活变得更让我们的校园生活变得更有意义和丰富。我们可以参与志愿活动，关注社会公益事业，帮助那些需要帮助的人群。我们可以分享自己的知识和经验，帮助他人成长和进步。回馈社会不仅让我们感到满足和快乐，也推动着社会的进步和发展。</p><p>校园生活是我们人生中最美好的阶段之一，它承载了我们的成长、欢笑和泪水。它是一段无法复制的青春岁月，我们在这里度过了难忘的时光，结识了一生的挚友，收获了宝贵的经历和回忆。**无论我们身在何处，校园生活的魅力将永远熠熠生辉，激励着我们追求更美好的未来。**</p><p>园生活带给我们的点滴魅力。回忆起那些逝去的岁月，我们会感受到一种深深的思念和眷恋。校园生活教会了我们勇敢面对挑战，锻炼了我们的意志和毅力，培养了我们的团队合作和领导能力。</p><p>尽管我们已经离开了校园，步入了社会的大门，但那些校园生活的经历和收获将永远伴随着我们。它们是我们成长的基石，是我们人生道路上的宝贵财富。让我们怀揣着那份校园的纯真和热情，继续前行，实现更多的梦想。</p>',51,'2025-03-23 15:13:33',3,14);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_section`
--

DROP TABLE IF EXISTS `posts_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_section` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='社区版块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_section`
--

LOCK TABLES `posts_section` WRITE;
/*!40000 ALTER TABLE `posts_section` DISABLE KEYS */;
INSERT INTO `posts_section` VALUES (8,'知识科普'),(9,'图书分享'),(10,'​语文天地'),(12,'​英语角'),(13,'​科学探索'),(14,'校园生活');
/*!40000 ALTER TABLE `posts_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置',
  `open_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开放时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='阅览室信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (7,'图书阅览室1','http://localhost:9090/files/download/1742659059546-1.jpg','1 - A - 2','8:00 - 20:00'),(8,'图书阅览室2','http://localhost:9090/files/download/1742659068591-2.jpg','1 - A - 9','8:00 - 20:00'),(9,'图书阅览室3','http://localhost:9090/files/download/1742659074969-3.jpg','2 - B - 2','8:00 - 20:00'),(10,'图书阅览室4','http://localhost:9090/files/download/1742659083181-4.jpg','2 - B -9','8:00 - 20:00'),(12,'图书阅览室5','http://localhost:9090/files/download/1742659107833-5.jpg','3 - C -1','8:00 - 20:00'),(13,'图书阅览室6','http://localhost:9090/files/download/1742659094943-6.jpg','3 - C -9','8:00 - 20:00');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编号',
  `room_id` int DEFAULT NULL COMMENT '阅览室ID',
  `row` int DEFAULT NULL COMMENT '排',
  `col` int DEFAULT NULL COMMENT '列',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='座位信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (121,'001',7,1,1,'未选'),(122,'002',7,1,2,'未选'),(123,'003',7,1,3,'未选'),(124,'004',7,1,4,'未选'),(125,'005',7,1,5,'未选'),(126,'006',7,2,1,'未选'),(127,'007',7,2,2,'已选'),(128,'008',7,2,3,'已选'),(129,'009',7,2,4,'未选'),(130,'010',7,2,5,'未选'),(131,'011',7,3,1,'未选'),(132,'012',7,3,2,'未选'),(133,'013',7,3,3,'未选'),(134,'014',7,3,4,'已选'),(135,'015',7,3,5,'未选'),(136,'016',7,4,1,'已选'),(137,'017',7,4,2,'未选'),(138,'018',7,4,3,'未选'),(139,'019',7,4,4,'未选'),(140,'020',7,4,5,'已选'),(141,'001',8,1,1,'未选'),(142,'002',8,1,2,'未选'),(143,'003',8,1,3,'未选'),(144,'004',8,1,4,'未选'),(145,'005',8,1,5,'未选'),(146,'006',8,2,1,'未选'),(147,'007',8,2,2,'未选'),(148,'008',8,2,3,'未选'),(149,'009',8,2,4,'未选'),(150,'010',8,2,5,'已选'),(151,'011',8,3,1,'未选'),(152,'012',8,3,2,'未选'),(153,'013',8,3,3,'已选'),(154,'014',8,3,4,'未选'),(155,'015',8,3,5,'未选'),(156,'016',8,4,1,'未选'),(157,'017',8,4,2,'未选'),(158,'018',8,4,3,'未选'),(159,'019',8,4,4,'未选'),(160,'020',8,4,5,'未选'),(161,'001',9,1,1,'未选'),(162,'002',9,1,2,'未选'),(163,'003',9,1,3,'未选'),(164,'004',9,1,4,'未选'),(165,'005',9,1,5,'未选'),(166,'006',9,2,1,'未选'),(167,'007',9,2,2,'未选'),(168,'008',9,2,3,'未选'),(169,'009',9,2,4,'未选'),(170,'010',9,2,5,'未选'),(171,'011',9,3,1,'未选'),(172,'012',9,3,2,'未选'),(173,'013',9,3,3,'未选'),(174,'014',9,3,4,'未选'),(175,'015',9,3,5,'未选'),(176,'016',9,4,1,'未选'),(177,'017',9,4,2,'未选'),(178,'018',9,4,3,'未选'),(179,'019',9,4,4,'未选'),(180,'020',9,4,5,'未选'),(181,'001',10,1,1,'未选'),(182,'002',10,1,2,'未选'),(183,'003',10,1,3,'未选'),(184,'004',10,1,4,'未选'),(185,'005',10,1,5,'未选'),(186,'006',10,2,1,'未选'),(187,'007',10,2,2,'未选'),(188,'008',10,2,3,'未选'),(189,'009',10,2,4,'未选'),(190,'010',10,2,5,'未选'),(191,'011',10,3,1,'未选'),(192,'012',10,3,2,'未选'),(193,'013',10,3,3,'未选'),(194,'014',10,3,4,'未选'),(195,'015',10,3,5,'未选'),(196,'016',10,4,1,'未选'),(197,'017',10,4,2,'未选'),(198,'018',10,4,3,'未选'),(199,'019',10,4,4,'未选'),(200,'020',10,4,5,'未选'),(201,'001',12,1,1,'未选'),(202,'002',12,1,2,'未选'),(203,'003',12,1,3,'未选'),(204,'004',12,1,4,'未选'),(205,'005',12,1,5,'未选'),(206,'006',12,2,1,'未选'),(207,'007',12,2,2,'未选'),(208,'008',12,2,3,'未选'),(209,'009',12,2,4,'未选'),(210,'010',12,2,5,'未选'),(211,'011',12,3,1,'未选'),(212,'012',12,3,2,'未选'),(213,'013',12,3,3,'未选'),(214,'014',12,3,4,'未选'),(215,'015',12,3,5,'未选'),(216,'016',12,4,1,'未选'),(217,'017',12,4,2,'未选'),(218,'018',12,4,3,'未选'),(219,'019',12,4,4,'未选'),(220,'020',12,4,5,'未选'),(221,'001',13,1,1,'未选'),(222,'002',13,1,2,'未选'),(223,'003',13,1,3,'未选'),(224,'004',13,1,4,'未选'),(225,'005',13,1,5,'未选'),(226,'006',13,2,1,'未选'),(227,'007',13,2,2,'未选'),(228,'008',13,2,3,'未选'),(229,'009',13,2,4,'未选'),(230,'010',13,2,5,'未选'),(231,'011',13,3,1,'未选'),(232,'012',13,3,2,'未选'),(233,'013',13,3,3,'未选'),(234,'014',13,3,4,'未选'),(235,'015',13,3,5,'未选'),(236,'016',13,4,1,'未选'),(237,'017',13,4,2,'未选'),(238,'018',13,4,3,'未选'),(239,'019',13,4,4,'未选'),(240,'020',13,4,5,'未选');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_reserve`
--

DROP TABLE IF EXISTS `seat_reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_reserve` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `seat_id` int DEFAULT NULL COMMENT '座位ID',
  `user_id` int DEFAULT NULL COMMENT '预约人ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `yydate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约时间段',
  `kssj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `jssj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='座位预约信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_reserve`
--

LOCK TABLES `seat_reserve` WRITE;
/*!40000 ALTER TABLE `seat_reserve` DISABLE KEYS */;
INSERT INTO `seat_reserve` VALUES (78,122,22,'2025-04-02 14:51:44','过期','2025-04-02','14:00','15:00'),(79,129,22,'2025-04-02 14:51:48','过期','2025-04-02','14:00','15:00'),(80,157,52,'2025-04-02 14:53:28','过期','2025-04-02','13:00','15:00'),(81,147,52,'2025-04-02 14:53:30','过期','2025-04-02','13:00','15:00'),(82,125,80,'2025-04-02 14:54:55','过期','2025-04-02','14:00','15:00'),(83,138,80,'2025-04-02 14:54:57','过期','2025-04-02','14:00','15:00'),(84,127,22,'2025-04-04 14:46:01','已选','2025-04-15','13:00','14:00');
/*!40000 ALTER TABLE `seat_reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activity_id` int DEFAULT NULL COMMENT '活动ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报名时间',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否签到',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='活动报名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (9,12,52,'2025-04-02 14:53:58','未签到','2021040401','16298765432'),(10,11,52,'2025-04-02 14:54:01','未签到','2021040401','16298765432'),(11,12,80,'2025-04-02 14:54:41','未签到','2017080201','12698654321'),(12,10,80,'2025-04-02 14:54:43','未签到','2017080201','12698654321'),(13,12,22,'2025-04-02 15:16:37','未签到','2024010101','13812345678'),(14,11,22,'2025-04-04 14:47:45','未签到','2024010101','13812345678'),(15,12,83,'2025-04-09 15:31:51','未签到','2017080302','12385432109'),(16,11,83,'2025-04-09 15:31:54','未签到','2017080302','12385432109'),(17,10,83,'2025-04-09 15:31:57','未签到','2017080302','12385432109');
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `score` int DEFAULT NULL COMMENT '信誉分',
  `nianji` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年级',
  `banji` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `bzr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班主任',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='普通用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'2024010101','e10adc3949ba59abbe56e057f20f883e','李明',NULL,'USER','13812345678',NULL,100,'一年级','1班','张老师'),(23,'2024010102','e10adc3949ba59abbe56e057f20f883e','王华',NULL,'USER','13987654321',NULL,100,'一年级','1班','张老师'),(24,'2024010201','e10adc3949ba59abbe56e057f20f883e','张勇',NULL,'USER','13698765432',NULL,100,'一年级','2班','李老师'),(25,'2024010202','e10adc3949ba59abbe56e057f20f883e','刘梅',NULL,'USER','13578946213',NULL,100,'一年级','2班','李老师'),(26,'2024010301','e10adc3949ba59abbe56e057f20f883e','陈辉',NULL,'USER','13345678901',NULL,100,'一年级','3班','王老师'),(27,'2024010302','e10adc3949ba59abbe56e057f20f883e','赵琳',NULL,'USER','13256789431',NULL,100,'一年级','3班','王老师'),(28,'2024010401','e10adc3949ba59abbe56e057f20f883e','孙浩',NULL,'USER','13167890245',NULL,100,'一年级','4班','刘老师'),(29,'2024010402','e10adc3949ba59abbe56e057f20f883e','周悦',NULL,'USER','13045678912',NULL,100,'一年级','4班','刘老师'),(30,'2023020101','e10adc3949ba59abbe56e057f20f883e','吴迪',NULL,'USER','18867890123',NULL,100,'二年级','1班','张老师'),(31,'2023020102','e10adc3949ba59abbe56e057f20f883e','郑玲',NULL,'USER','18790123456',NULL,100,'二年级','1班','张老师'),(32,'2023020201','e10adc3949ba59abbe56e057f20f883e','冯磊',NULL,'USER','18678901234',NULL,100,'二年级','2班','李老师'),(33,'2023020202','e10adc3949ba59abbe56e057f20f883e','褚瑶',NULL,'USER','18567890134',NULL,100,'二年级','2班','李老师'),(34,'2023020301','e10adc3949ba59abbe56e057f20f883e','卫峰',NULL,'USER','18456789023',NULL,100,'二年级','3班','王老师'),(35,'2023020302','e10adc3949ba59abbe56e057f20f883e','蒋欣',NULL,'USER','18345678903',NULL,100,'二年级','3班','王老师'),(36,'2023020401','e10adc3949ba59abbe56e057f20f883e','沈悦',NULL,'USER','18278901245',NULL,100,'二年级','4班','刘老师'),(37,'2023020402','e10adc3949ba59abbe56e057f20f883e','韩亮',NULL,'USER','18167890321',NULL,100,'二年级','4班','刘老师'),(38,'2022030101','e10adc3949ba59abbe56e057f20f883e','杨柳',NULL,'USER','17890123456',NULL,100,'三年级','1班','张老师'),(39,'2022030102','e10adc3949ba59abbe56e057f20f883e','何敏',NULL,'USER','17789012345',NULL,100,'三年级','1班','张老师'),(40,'2022030201','e10adc3949ba59abbe56e057f20f883e','吕刚',NULL,'USER','17698765432',NULL,100,'三年级','2班','李老师'),(41,'2022030202','e10adc3949ba59abbe56e057f20f883e','施慧',NULL,'USER','17589012345',NULL,100,'三年级','2班','李老师'),(42,'2022030301','e10adc3949ba59abbe56e057f20f883e','张敏',NULL,'USER','17490123456',NULL,100,'三年级','3班','王老师'),(43,'2022030302','e10adc3949ba59abbe56e057f20f883e','孔亮',NULL,'USER','17389012345',NULL,100,'三年级','3班','王老师'),(44,'2022030401','e10adc3949ba59abbe56e057f20f883e','曹阳',NULL,'USER','17298765432',NULL,100,'三年级','4班','刘老师'),(45,'2022030402','e10adc3949ba59abbe56e057f20f883e','严悦',NULL,'USER','17189012345',NULL,100,'三年级','4班','刘老师'),(46,'2021040101','e10adc3949ba59abbe56e057f20f883e','朱磊',NULL,'USER','16890123456',NULL,100,'四年级','1班','张老师'),(47,'2021040102','e10adc3949ba59abbe56e057f20f883e','许晴',NULL,'USER','16789012345',NULL,100,'四年级','1班','张老师'),(48,'2021040201','e10adc3949ba59abbe56e057f20f883e','何勇',NULL,'USER','16698765432',NULL,100,'四年级','2班','李老师'),(49,'2021040202','e10adc3949ba59abbe56e057f20f883e','吕静',NULL,'USER','16589012345',NULL,100,'四年级','2班','李老师'),(50,'2021040301','e10adc3949ba59abbe56e057f20f883e','施伟',NULL,'USER','16490123456',NULL,100,'四年级','3班','王老师'),(51,'2021040302','e10adc3949ba59abbe56e057f20f883e','张丽',NULL,'USER','16389012345',NULL,100,'四年级','3班','王老师'),(52,'2021040401','e10adc3949ba59abbe56e057f20f883e','孔强',NULL,'USER','16298765432',NULL,100,'四年级','4班','刘老师'),(53,'2021040402','e10adc3949ba59abbe56e057f20f883e','曹梅',NULL,'USER','16189012345',NULL,100,'四年级','4班','刘老师'),(54,'2020050101','e10adc3949ba59abbe56e057f20f883e','李勇',NULL,'USER','15890123456',NULL,100,'五年级','1班','张老师'),(55,'2020050102','e10adc3949ba59abbe56e057f20f883e','王芳',NULL,'USER','15789012345',NULL,100,'五年级','1班','张老师'),(56,'2020050201','e10adc3949ba59abbe56e057f20f883e','张辉',NULL,'USER','15698765432',NULL,100,'五年级','2班','李老师'),(57,'2020050202','e10adc3949ba59abbe56e057f20f883e','刘敏',NULL,'USER','15589012345',NULL,100,'五年级','2班','李老师'),(58,'2020050301','e10adc3949ba59abbe56e057f20f883e','陈强',NULL,'USER','15490123456',NULL,100,'五年级','3班','王老师'),(59,'2020050302','e10adc3949ba59abbe56e057f20f883e','赵悦',NULL,'USER','15389012345',NULL,100,'五年级','3班','王老师'),(60,'2020050401','e10adc3949ba59abbe56e057f20f883e','孙浩',NULL,'USER','15298765432',NULL,100,'五年级','4班','刘老师'),(61,'2020050402','e10adc3949ba59abbe56e057f20f883e','周玲',NULL,'USER','15189012345',NULL,100,'五年级','4班','刘老师'),(62,'2019060101','e10adc3949ba59abbe56e057f20f883e','吴迪',NULL,'USER','14890123456',NULL,100,'六年级','1班','张老师'),(63,'2019060102','e10adc3949ba59abbe56e057f20f883e','郑丽',NULL,'USER','14789012345',NULL,100,'六年级','1班','张老师'),(64,'2019060201','e10adc3949ba59abbe56e057f20f883e','冯强',NULL,'USER','14698765432',NULL,100,'六年级','2班','李老师'),(65,'2019060202','e10adc3949ba59abbe56e057f20f883e','褚慧',NULL,'USER','14589012345',NULL,100,'六年级','2班','李老师'),(66,'2019060301','e10adc3949ba59abbe56e057f20f883e','卫峰',NULL,'USER','14490123456',NULL,100,'六年级','3班','王老师'),(67,'2019060302','e10adc3949ba59abbe56e057f20f883e','蒋欣',NULL,'USER','14389012345',NULL,100,'六年级','3班','王老师'),(68,'2019060401','e10adc3949ba59abbe56e057f20f883e','沈悦',NULL,'USER','14298765432',NULL,100,'六年级','4班','刘老师'),(69,'2019060402','e10adc3949ba59abbe56e057f20f883e','韩亮',NULL,'USER','14189012345',NULL,100,'六年级','4班','刘老师'),(70,'2018070101','e10adc3949ba59abbe56e057f20f883e','杨柳',NULL,'USER','13876543210',NULL,100,'七年级','1班','张老师'),(71,'2018070102','e10adc3949ba59abbe56e057f20f883e','何敏',NULL,'USER','13786543210',NULL,100,'七年级','1班','张老师'),(72,'2018070201','e10adc3949ba59abbe56e057f20f883e','吕刚',NULL,'USER','13695432108',NULL,100,'七年级','2班','李老师'),(73,'2018070202','e10adc3949ba59abbe56e057f20f883e','施慧',NULL,'USER','13584321097',NULL,100,'七年级','2班','李老师'),(74,'2018070301','e10adc3949ba59abbe56e057f20f883e','张敏',NULL,'USER','13493210865',NULL,100,'七年级','3班','王老师'),(75,'2018070302','e10adc3949ba59abbe56e057f20f883e','孔亮',NULL,'USER','13382109754',NULL,100,'七年级','3班','王老师'),(76,'2018070401','e10adc3949ba59abbe56e057f20f883e','曹阳',NULL,'USER','13291098643',NULL,100,'七年级','4班','刘老师'),(77,'2018070402','e10adc3949ba59abbe56e057f20f883e','严悦',NULL,'USER','13180987532',NULL,100,'七年级','4班','刘老师'),(78,'2017080101','e10adc3949ba59abbe56e057f20f883e','朱磊',NULL,'USER','12890876543',NULL,100,'八年级','1班','张老师'),(79,'2017080102','e10adc3949ba59abbe56e057f20f883e','许晴',NULL,'USER','12789765432',NULL,100,'八年级','1班','张老师'),(80,'2017080201','e10adc3949ba59abbe56e057f20f883e','何勇',NULL,'USER','12698654321',NULL,100,'八年级','2班','李老师'),(81,'2017080202','e10adc3949ba59abbe56e057f20f883e','吕静',NULL,'USER','12587654310',NULL,100,'八年级','2班','李老师'),(82,'2017080301','e10adc3949ba59abbe56e057f20f883e','施伟',NULL,'USER','12496543210',NULL,100,'八年级','3班','王老师'),(83,'2017080302','e10adc3949ba59abbe56e057f20f883e','张丽',NULL,'USER','12385432109',NULL,100,'八年级','3班','王老师'),(84,'2017080401','e10adc3949ba59abbe56e057f20f883e','孔强',NULL,'USER','12294321087',NULL,100,'八年级','4班','刘老师'),(85,'2017080402','e10adc3949ba59abbe56e057f20f883e','曹梅',NULL,'USER','12183210976',NULL,100,'八年级','4班','刘老师'),(86,'2016090101','e10adc3949ba59abbe56e057f20f883e','李勇',NULL,'USER','11890876543',NULL,100,'九年级','1班','张老师'),(87,'2016090102','e10adc3949ba59abbe56e057f20f883e','王芳',NULL,'USER','11789765432',NULL,100,'九年级','1班','张老师'),(88,'2016090201','e10adc3949ba59abbe56e057f20f883e','张辉',NULL,'USER','11698654321',NULL,100,'九年级','2班','李老师'),(89,'2016090202','e10adc3949ba59abbe56e057f20f883e','刘敏',NULL,'USER','11587654310',NULL,100,'九年级','2班','李老师'),(90,'2016090301','e10adc3949ba59abbe56e057f20f883e','陈强',NULL,'USER','11496543210',NULL,100,'九年级','3班','王老师'),(91,'2016090302','e10adc3949ba59abbe56e057f20f883e','赵悦',NULL,'USER','11385432109',NULL,100,'九年级','3班','王老师'),(92,'2016090401','e10adc3949ba59abbe56e057f20f883e','孙浩',NULL,'USER','11294321087',NULL,100,'九年级','4班','刘老师'),(93,'2016090402','e10adc3949ba59abbe56e057f20f883e','周玲',NULL,'USER','11183210976',NULL,100,'九年级','4班','刘老师');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25 19:27:25
