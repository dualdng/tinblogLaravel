-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.38-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `b_article`
--

DROP TABLE IF EXISTS `b_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` text,
  `excerpt` varchar(100) DEFAULT NULL,
  `userId` int(5) NOT NULL,
  `categoryId` int(2) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `type` int(2) NOT NULL,
  `createDate` datetime NOT NULL,
  `status` int(1) DEFAULT NULL,
  `view` int(5) DEFAULT '0',
  `vote` int(10) DEFAULT NULL COMMENT '评分字段次数',
  `rank` int(10) DEFAULT NULL COMMENT '评分字段总分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_article`
--

LOCK TABLES `b_article` WRITE;
/*!40000 ALTER TABLE `b_article` DISABLE KEYS */;
INSERT INTO `b_article` VALUES (48,'Hello!','这是一篇初始文章！','',1,1,'Blog',4,'2014-05-15 22:47:19',0,804,0,0),(49,'前任攻略','<p>\r\n	<img src=\"http://www.uuuuj.com/attached/image/20140517/20140517232027_72405.jpg\" width=\"633\" height=\"380\" alt=\"\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;color:#999999;\">“在爱情走到迷茫的时候，要验证是否相爱最好的方法就是分开，分开后如果痛苦，如果思念，那就是真爱，真爱一定会让俩人再次相遇”就以这个开头吧。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#999999;\"><span style=\"font-size:14px;line-height:21px;\"> 因为一首歌《矜持》看了这部电影，碰巧看这部之前看了另外一部《军鸡》，一渣一佳，对比鲜明。有人说“</span></span><span style=\"font-size:14px;line-height:21px;color:#999999;\">有人说，你结婚的那个人，一定不是你最爱的人”，起初我不是这么认为的，但是经历过太多之后，也渐渐相信了，也许还没到不能不信的时候，我还有点相信缘分。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;color:#999999;\"> 整部片可以说是矛盾的，正如开题的那句话“<span style=\"color:#999999;font-size:14px;line-height:21px;white-space:normal;\">在爱情走到迷茫的时候，要验证是否相爱最好的方法就是分开，分开后如果痛苦，如果思念，那就是真爱，真爱一定会让俩人再次相遇</span>”，罗茜和孟云终归是没有再次相遇的，片尾的夏露和孟云再次相遇又恰恰验证了这句话。对于这个问题，我姑且认为是孟云最终对于罗茜的爱已经淡去，也就是他为夏露腾出了原本属于罗茜的那个空间，这样也正好说明最终相遇的是夏露而不是罗茜。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;color:#999999;\"> 网上的评论以希望罗茜和孟云在一起的居多，在我看来，我更喜欢现在的结局。并不是夏露和孟云短短的恋爱时间超过了罗茜的14年，而是珍惜当下。如果两者真的相爱，根本不需要恋爱14年就可以走上婚姻的殿堂，之所以苦苦14年，就是因为孟云对罗茜说过的话：“你爱夏露吗？”，“爱，但是总觉得离结婚还差了那么点”，其实孟云和罗茜也差那么点，但是由于他们相互太了解，而没人捅破这层。<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;color:#999999;\"> 所以，最终我还是相信孟云渐渐把心中的那个空让给了夏露。<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#999999;\"><span style=\"font-size:14px;line-height:21px;\">最后矜持：</span></span> <audio src=\"http://music.uuuuj.com/矜持.mp3\" controls=\"controls\" loop=\"loop\"></audio>\r\n</p>','',1,3,'电影',4,'2014-05-18 00:01:15',0,789,0,0),(52,'Emlog获取文章第一张图片','<p>\n	前面在码一个emlog的主题，恰好用到了就写上吧，我要转行做技术博客。。\n</p>\n<p>\n	将如下代码放到主题目录中的module.php里面，记得要包在&lt;?php ?&gt;之间，然后在log_list.php的循环里面调用&lt;?php first_img($sid);?&gt;就ok了。\n</p>\n<p>\n	代码如下：\n</p>\n<p>\n<pre class=\"prettyprint lang-php\">function first_img($id)\n{\n	$DB = MySqlii::getInstance(); \n	$query=\'select content from emlog_blog where gid=\\\'\'.$id.\'\\\'\';\n	$res = $DB-&gt;query($query);\n	$res=$DB-&gt;fetch_array($res);\n	$pattern=\'/&lt;img[a-zA-Z0-9 -_]*\\/&gt;/\';\n	$result=preg_match($pattern,$res[\'content\'],$matches);\n	if(!empty($matches[0]))\n	{\n		echo $matches[0];\n	}\n	else\n	{\n//如果没有图片则显示一张自定义图片		echo \'&lt;img src=\\\'\'.TEMPLATE_URL.\'/images/content.jpg\\\'/&gt;\';\n	}\n}</pre>\n</p>','Emlog获取文章第一张图片代码',1,2,'emlog,主题',4,'2014-06-23 21:22:43',0,892,0,0),(50,'近况','<p>\r\n	最近身体真是差到极点，不清楚是啥原因，喉咙疼了好几天了，码代码都不带劲，顺带测试下。\r\n</p>\r\n<br />','',1,1,'关于你',3,'2014-05-18 22:25:16',0,199,0,0),(51,'2014注定不容易','<p>\r\n	最近可以说是不怎么愉快的，首先工作方面，原本计划是在项目结束之后回南京辞职的，但是现在看来项目最起码也要到年底才能结束。于是目前只能考虑裸辞了，顺便回家看看老妈，之后回南京继续寻觅工作吧，即将成为无业游民。\r\n</p>\r\n<p>\r\n	然后呢，说说最近的一件大事。就是咱妈检查出子宫肌瘤和啥乳房瘤的，虽然最后确诊为良性的，但是终究还是要做手术的。到目前为止，我妈身上已经少了“胆”、“子宫”两个器官了，我也不想她再多少什么，毕竟虽然不是我动刀，但是动她和动自己又有啥区别呢。老天永远是这么的丧心病狂，专门欺负好人。\r\n</p>\r\n<p>\r\n	于是我决定以后要多做好事，积点德，不为别人就为她。\r\n</p>\r\n<p>\r\n	最后，大家平时主意身体，多吃水果和蔬菜，然后没事跑跑步，说到这，我已经两个月没跑步了，最近真是废的可以。\r\n</p>\r\n<p>\r\n	总之2014的上半年是以一种自己从来不敢想的悲催方式度过了。\r\n</p>\r\n<p>\r\n	生活就像强奸，如果无法反抗，就躺下来享受吧。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','',1,1,'健康,工作',4,'2014-06-08 23:56:52',0,849,0,0),(53,'Emlog无刷新评论（ajax）','<p>\r\n	看到此类的教程比较少，就把自己弄好的一个无刷新ajax评论代码放出来吧。\r\n</p>\r\n<p>\r\n	首先将如下代码放到主题的js文件中载入。\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-js\">function test()\r\n{\r\n		var comname=$(\':input[name=\\\'comname\\\']\').val(); \r\n		var commail=$(\':input[name=\\\'commail\\\']\').val(); \r\n		var comurl=$(\':input[name=\\\'comurl\\\']\').val(); \r\n		var gid=$(\':input[name=\\\'gid\\\']\').val(); \r\n		var pid=$(\':input[name=\\\'pid\\\']\').val(); \r\n		var comment=$(\'#comment\').val(); \r\n		var poststr=\'comname=\'+comname+\'&amp;commail=\'+commail+\'&amp;comurl=\'+comurl+\'&amp;comment=\'+comment+\'&amp;gid=\'+gid+\'&amp;pid=\'+pid;\r\n		$.ajax({\r\n				url:\'index.php?action=addcom\',\r\n				type:\'POST\',\r\n				data:poststr,\r\n				success:function(data){\r\n						$(\'#ajax_comments\').html(comment+\'&amp;nbsp--&amp;nbsp查看评论请刷新\').css({\'display\':\'block\'});\r\n						$(\'#comment-post\').fadeOut();\r\n						$(\'#comment\').val(\'刷新之后可查看评论\');\r\n						$(\"html,body\").animate({scrollTop:$(\".nextlog\").offset().top+10},1000);\r\n				}\r\n				})\r\n		return false;\r\n}</pre>\r\n</p>\r\n<p>\r\n	然后找到主题的module.php文件，找到“//blog：发表评论表单”的一块，然后再找到&lt;form method=\"post\" name=\"commentform\"<span style=\"color:#E53333;\"> action=\"&lt;?php echo BLOG_URL; ?&gt;index.php?action=addcom\"</span> id=\"commentform\"&gt;,将其中的<span style=\"color:#E53333;white-space:normal;\">&nbsp;action=\"&lt;?php echo BLOG_URL; ?&gt;index.php?action=addcom\"<span style=\"color:#000000;\"> 替换为<span style=\"color:#E53333;\">onSubmit=\'return test();\'</span><span style=\"color:#E53333;\">。</span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#000000;\">在其次，在主题目录下的echo_log.php中的评论框位置&lt;?php blog_comments($comments); ?&gt;前面加上一行<span style=\"color:#E53333;\">&lt;div id=\'ajax_comments\'&gt;&lt;/div&gt;</span>，用来展示新发表的评论。</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#000000;\">然后 ajax无刷新就完了。</span>\r\n</p>','看到此类的教程比较少，就把自己弄好的一个无刷新ajax评论代码放出来吧。\r\n首先将如下代码放到主题的js文件中载入。',1,2,'emlog,主题,a',4,'2014-06-25 13:01:19',0,1471,0,0),(54,'Wordpress瀑布流图片墙代码','<p>\r\n	这是帮别人弄的一个代码，就发出来吧，就是wp新增一个分类“picturewall”，将需要作为图片墙的文章发到这个分类下。然后将附件中几个代码放到wordpress主题目录里面，按照附件里面的1.php和2.php分别将代码加进主题相对应的位置，然后将category-2.php改名为category-picturewall.php即可。\r\n</p>\r\n<p>\r\n	采用的是masonry的插件实现的瀑布流部局。\r\n</p>\r\n<p>\r\n	访问：https://xxxxxx.com/category/picturewall 即可。\r\n</p>\r\n<p>\r\n	ps：如果出现没有瀑布流效果的，可以试着将放到heade.php里面的代码位置调整下，尽量不要被其他代码覆盖掉。\r\n</p>\r\n<p>\r\n	最后上下载地址：<a href=\"http://pan.baidu.com/s/1hqIbPkS\" target=\"_blank\">点我下载</a> \r\n</p>\r\n<p>\r\n	效果暂时还没有，等有了再看吧。\r\n</p>','wordpress瀑布流效果图片墙，默认使用分类为picturewall的文章。',1,2,'wordpress,',4,'2014-06-26 17:17:07',0,1531,0,0),(55,'随语','终于知道，再也没人给你发表情了。','',1,1,'关于你,爱情',3,'2014-06-28 23:28:08',0,751,0,0),(56,'Github同步代码文件夹空问题','由于谷歌被墙，于是我把部分内容放到了github上面，然后把文件夹git init之后，往github上push后发现，所有的文件夹都是空的，其他单文件都是可以正常同步的，经过多方度娘后发现，原来是原本的文件夹里面隐藏着以前用谷歌时的.git文件夹，导致无法同步，虽然不晓得什么原因，直接把原文件夹里面的.git删了就一切正常了。','',1,2,'github',4,'2014-07-01 16:12:43',0,173,0,0),(57,'常用mysql命令','<p>\r\n	日常用的mysql命令，有时总是忘记写法，这边记录一下吧\r\n</p>\r\n<p>\r\n	1、备份\r\n</p>\r\n<p>\r\n	控制台下：mysqldump -u root -p database &gt; /path/xxx.sql\r\n</p>\r\n<p>\r\n	2、还原\r\n</p>\r\n<p>\r\n	登录到mysql：mysql -u root -p\r\n</p>\r\n<p>\r\n	选择数据库：use database;\r\n</p>\r\n<p>\r\n	source xxx.sql;\r\n</p>\r\n<p>\r\n	3、创建数据库\r\n</p>\r\n<p>\r\n	create database xxxx;\r\n</p>\r\n<p>\r\n	4、创建用户\r\n</p>\r\n<p>\r\n	create user xxx identified by \'xxxx\';\r\n</p>\r\n<p>\r\n	5、权限\r\n</p>\r\n<p>\r\n	grant select,........ on database.table to user@\'%\' identified by \'xxxx\';\r\n</p>\r\n<p>\r\n	6、创建表\r\n</p>\r\n<p>\r\n	create table xxx (<span style=\"line-height:1.5;\">xxx int(10) auto_increment primary key,</span><span style=\"line-height:1.5;\">xxx varchar(20) not null,</span><span style=\"line-height:1.5;\">.....);</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">7、修改密码</span>\r\n</p>\r\n<p>\r\n	update mysql.user set password=password(\'xxxx\') where user=\'xxx\';\r\n</p>\r\n<p>\r\n	先这么多了\r\n</p>','linux常用mysql命令，基本覆盖了日常使用',1,2,'mysql,linu',4,'2014-07-01 23:18:27',0,129,0,0),(58,'赶快加入博客新体位','<p>\r\n	<span style=\"color:#E53333;font-size:18px;\"><a href=\"http://www.uuuuj.com/attached/image/20140704/20140704000047_20052.jpeg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140704/20140704000047_20052.jpeg\" alt=\"\" width=\"600\" height=\"337\" title=\"\" align=\"\" /></a><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:18px;\">独立博客社交圈 群号： 180593303</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	本群有各种萝莉，妹子，白虎等极品，还有很<span style=\"font-size:18px;\"></span>多少妇，欢迎你的加入。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	如果你还在犹豫，请买一个TT进来吧。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	博客程序包括Php平台的Wordpress,Typecho,Emlog,Zblog,和ASP平台的博客程序、Java平台的B3BLOG、Node.js平台的Ghost博客以及Github的静态博客程序Octopress!\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	欢迎分享独立博客的心得、原创博客、原创插件、原创运营方案、原创主题！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	我们鼓励大家分享自己的博客，交换友情实在的友情链接！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	为了方便大家解决问题，我们建议主动提问！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	定期放出独家资源共享！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	因为独立博客环境变化太大，本群的意义更在于交流和相处，不让博客的旅程太寂寞孤独是我们的追求！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	IDC和域名交流请理性！二次元ACG博客主也欢迎加入哦！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	我们只欢迎真诚的人！\r\n</p>','独立博客社交圈 群号： 180593303',1,1,'Blog,博客新体位',4,'2014-07-03 18:47:17',0,675,0,0),(59,'多说评论问题','<p>\r\n	最近博客使用的多说出现了不可预见的评论问题，具体症状呢就是我发布的文章下面的评论会丢失，在多说的后台管理是可以看到的，但是在博客页面却看不到。\r\n</p>\r\n<p>\r\n	针对上面这个问题，我起初是怀疑多说的问题，于是准备卸载（期间还常识了sohu的畅言，但是实在是不好用），然后重新弄个评论的页面。\r\n</p>\r\n<p>\r\n	折腾了几个小时后发现，实现不了嵌套评论的效果，对于嵌套中再嵌套的评论顺序始终无法实现。最后又重新回顾了多说的那个问题，最后研究文章的时候发现，原来是我把文章的url设置的是可变的。具体问题呢：\r\n</p>\r\n<p>\r\n	我是通过从数据库里面取出所有文章，然后通过数组的编号来实现文章列表的，这就导致我所有的第一篇文章的编号都是0，第二篇为1，以此类推。。。最终的结果就是我新发的文章就又变成0了，而上一篇原本为0的文章编号变成了1，但是给多说的编号又是0，直接导致多说就混乱了。\r\n</p>\r\n<p>\r\n	最终把文章的区分还是用文章的固定id来实现了。现在应该没啥问题，也不纠结多说了，除了载入慢点，但是他的社会化效果很好。\r\n</p>','',1,2,'Blog,多说,评论',4,'2014-07-07 21:44:54',0,1180,0,0),(60,'多图','<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140704/20140704000047_20052.jpeg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140704/20140704000047_20052.jpeg\" alt=\"\" /></a>\r\n</p>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140707/20140707231937_50271.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140707/20140707231937_50271.jpg\" alt=\"\" width=\"440\" height=\"638\" title=\"\" align=\"\" /></a>\r\n</p>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140707/20140707232105_97193.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140707/20140707232105_97193.jpg\" alt=\"\" width=\"440\" height=\"660\" title=\"\" align=\"\" /></a>\r\n</p>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140707/20140707232311_49241.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140707/20140707232311_49241.jpg\" alt=\"\" width=\"600\" height=\"375\" title=\"\" align=\"\" /></a>\r\n</p>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140707/20140707232404_48067.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140707/20140707232404_48067.jpg\" alt=\"\" width=\"600\" height=\"338\" title=\"\" align=\"\" /></a>\r\n</p>','',1,1,'图片,Life',1,'2014-07-07 23:25:47',0,276,0,0),(61,'假如爱有天意','<p style=\"text-align:center;\">\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140708/20140708231858_41280.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140708/20140708231858_41280.jpg\" alt=\"\" width=\"500\" height=\"273\" title=\"\" align=\"\" /></a> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140708/20140708232003_98239.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140708/20140708232003_98239.jpg\" alt=\"\" width=\"701\" height=\"510\" title=\"\" align=\"\" /></a> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\">同样的又是通过一首音乐无意中发现了这部电影，这不一直说着自己是越来越相信缘分了，是你的终究是你的，不是你的长脚会飞，这部电影恰好就是这么个意思。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\">看完电影后并没有像想象中的那样痛哭流涕（至少我从小到大是眼泪如水的），可能最近对于感情这方面的东西确实淡了许多。有时胡思乱想下，然后立马弄个游戏、电影啥的就这么过去了，想的最多的时间也就是洗澡和睡觉前那半个小时吧。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\">整部电影很平淡，满俗套的剧情，片尾他儿子和他女儿的相遇是整片的最大亮点，我是到最后才恍然大悟，所谓的爱有天意就是父辈没有完成的事，在儿女这代完成了。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\"><span style=\"line-height:24px;font-size:16px;\">然后这部电影的ost简直大赞，无论是开场的卡农，还是后续的插曲，简直完美。</span></span>\r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\">现在的生活看似平淡无奇，我表面上看起来也是活蹦乱跳，感觉没啥烦恼似的，毕竟是装，装时间长了也会累的，于是呢，我会情不自禁的把所有的责任归咎到工作上面，始终想让自己相信是工作的原因导致问题不能及时解决。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\">首先把这份工作辞了是最好的开始吧（当然辞职的原因不仅限于此）。</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"font-size:16px;\"><span style=\"line-height:24px;font-size:16px;\">最后奉上我最喜欢的一首：</span></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:small;\"><span style=\"line-height:24px;\"> <audio src=\"http://music.baidutt.com/up/kwcuwswm/yayyu.mp3\" controls=\"\" loop=\"\"><br />\r\n</audio></span></span> \r\n</p>','该是你的，就是你的；不是你的，长脚会飞。',1,3,'电影,假如爱有天意',4,'2014-07-08 23:28:03',0,349,0,0),(62,'Kindeditor问题','<p>\r\n	最近发现网站上有个天大的错误，所有的category都写成了catagory，赶紧修复了。请原谅我的渣英文吧。阿门。\r\n</p>\r\n<p>\r\n	然后折腾一个以前的问题，我用的是kindeditor的编辑器，可是发现，在输入代码时，怎么弄都写不进数据库，然后度娘度娘，发现有关的东西还真是少。翻阅代码发现，这段代码怎么看怎么别扭（我是直接用的kindeditor里面的phpdemo提供的代码添加的编辑器）。代码如下：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n你们觉得以上这段代码哪里有不对劲么。\r\n<p>\r\n<pre class=\"prettyprint lang-php\">if (!empty($_POST[\'content1\'])) {\r\n		if (get_magic_quotes_gpc()) {\r\n			$htmlData = stripslashes($_POST[\'content1\']);\r\n		} else {\r\n			$htmlData = $_POST[\'content1\'];\r\n		}\r\n	}</pre>\r\n</p>\r\n<p>\r\n	于是我改成了\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">if (!empty($_POST[\'content1\'])) {\r\n		if (get_magic_quotes_gpc()) {\r\n			$htmlData = $_POST[\'content1\'];\r\n		} else {\r\n			$htmlData = addslashes($_POST[\'content1\']);\r\n		}\r\n	}</pre>\r\n</p>\r\n大功告成，妈妈再也不用担心我内容写不进数据库了。\r\n<p>\r\n	<span style=\"line-height:1.5;\">最后，我抑郁了，我真的抑郁了，我找不到生命的意义。</span>\r\n</p>\r\n<p>\r\n	还有，谢谢你来梦里看我，好久不见了。\r\n</p>','最近发现网站上有个天大的错误，所有的category都写成了catagory，赶紧修复了。请原谅我的渣英文吧。阿门。\r\n然后折腾一个以前的问题，我用的是kindeditor的编辑器，可是发现，在输入代',1,2,'Blog,kindeditor,php',4,'2014-07-15 11:19:07',0,575,0,0),(63,'VIM记录','<p>\r\n	首先直接删除并进入插入：\r\n</p>\r\n<p>\r\n	ci[ 删除一对 [] 中的所有字符并进入插入模式<br />\r\nci( 删除一对 () 中的所有字符并进入插入模式<br />\r\nci&lt; 删除一对 &lt;&gt; 中的所有字符并进入插入模式<br />\r\nci{ 删除一对 {} 中的所有字符并进入插入模式<br />\r\ncit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式<br />\r\nci” ci’ ci` 删除一对引号字符 (” 或 ‘ 或 `) 中所有字符并进入插入模式\r\n</p>\r\n<p>\r\n	其次选择：\r\n</p>\r\n<p>\r\n	vi[ 选择一对 [] 中的所有字符<br />\r\nvi( 选择一对 () 中的所有字符<br />\r\nvi&lt; 选择一对 &lt;&gt; 中的所有字符<br />\r\nvi{ 选择一对 {} 中的所有字符<br />\r\nvit 选择一对 HTML/XML 的标签内部的所有字符<br />\r\nvi” vi’ vi` 选择一对引号字符 (” 或 ‘ 或 `) 中所有字符\r\n</p>\r\n<p>\r\n	记录一下\r\n</p>','',1,2,'vim,linux',4,'2014-07-15 17:18:51',0,274,0,0),(64,'PHP正则匹配问题','<p>\r\n	学习php中发现，关于preg_match中匹配结果的问题：\r\n</p>\r\n<p>\r\n	首先举个例子，\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">$data2=\'aaaabbbccc这是间隔ddddeeefff这是间隔gggghhhjjj这里是间隔|kkkklllmmm\';\r\npreg_match_all(\'/gggg(h(hh))jjj/\', $data2,$result);\r\n$result=$result?$result:die(\'数据没抓到\');\r\nvar_dump($result);</pre>\r\n这个输出的结果为：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">array\r\n  0 =&gt; \r\n    array\r\n      0 =&gt; string \'gggghhhjjj\' (length=10)\r\n  1 =&gt; \r\n    array\r\n      0 =&gt; string \'hhh\' (length=3)\r\n  2 =&gt; \r\n    array\r\n      0 =&gt; string \'hh\' (length=2)</pre>\r\n很容易理解result[0]为全部匹配结果，result[1]为第一次“括号”中匹配的结果，result[2]为第二次“括号”匹配的结果。\r\n</p>\r\n<p>\r\n	但是正则表达式变成这样呢：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">$data2=\'aaaabbbccc这是间隔ddddeeefff这是间隔gggghhhjjj这里是间隔|kkkklllmmm\';\r\npreg_match_all(\'/gggg(h(hh))jjj|aaaa(bbb)c(cc)|dddd(eee)fff|kkkk(lll)mmm/\', $data2,$result);\r\n$result=$result?$result:die(\'数据没抓到\');\r\nvar_dump($result);</pre>\r\n博主就凌乱了，这个最后的result要如何分配呢。\r\n</p>\r\n<p>\r\n	实际上输出的结果如下：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint\">array\r\n  0 =&gt; \r\n    array\r\n      0 =&gt; string \'aaaabbbccc\' (length=10)\r\n      1 =&gt; string \'ddddeeefff\' (length=10)\r\n      2 =&gt; string \'gggghhhjjj\' (length=10)\r\n      3 =&gt; string \'kkkklllmmm\' (length=10)\r\n  1 =&gt; \r\n    array\r\n      0 =&gt; string \'\' (length=0)\r\n      1 =&gt; string \'\' (length=0)\r\n      2 =&gt; string \'hhh\' (length=3)\r\n      3 =&gt; string \'\' (length=0)\r\n  2 =&gt; \r\n    array\r\n      0 =&gt; string \'\' (length=0)\r\n      1 =&gt; string \'\' (length=0)\r\n      2 =&gt; string \'hh\' (length=2)\r\n      3 =&gt; string \'\' (length=0)\r\n  3 =&gt; \r\n    array\r\n      0 =&gt; string \'bbb\' (length=3)\r\n      1 =&gt; string \'\' (length=0)\r\n      2 =&gt; string \'\' (length=0)\r\n      3 =&gt; string \'\' (length=0)\r\n  4 =&gt; \r\n    array\r\n      0 =&gt; string \'cc\' (length=2)\r\n      1 =&gt; string \'\' (length=0)\r\n      2 =&gt; string \'\' (length=0)\r\n      3 =&gt; string \'\' (length=0)\r\n  5 =&gt; \r\n    array\r\n      0 =&gt; string \'\' (length=0)\r\n      1 =&gt; string \'eee\' (length=3)\r\n      2 =&gt; string \'\' (length=0)\r\n      3 =&gt; string \'\' (length=0)\r\n  6 =&gt; \r\n    array\r\n      0 =&gt; string \'\' (length=0)\r\n      1 =&gt; string \'\' (length=0)\r\n      2 =&gt; string \'\' (length=0)\r\n      3 =&gt; string \'lll\' (length=3)</pre>\r\n我可以这么理解：\r\n</p>\r\n<p>\r\n	result[0][]为每一个正则的全部匹配结果。\r\n</p>\r\n<p>\r\n	result[1][2]为第一个括号匹配的结果，至于为什么索引是[2]，我觉得是因为这条正则全部匹配的结果是在result[0][2]中的。\r\n</p>\r\n<p>\r\n	result[2][2]为第二个括号匹配的结果，<span style=\"white-space:normal;\">至于为什么索引是[2]，我觉得是因为这条正则全部匹配的结果是在result[0][2]中的。</span>\r\n</p>','形如gggg(h(hh))jjj|aaaa(bbb)c(cc)|dddd(eee)fff|kkkk(lll)mmm这种正则表达式，使用preg_match()函数之后的结果输出问题记录。',1,2,'php,blog',4,'2014-07-18 14:55:12',0,393,0,0),(65,'为你的博客加上一句电影台词','<p>\r\n	这是我在学习php的过程中整出来的玩意。\r\n</p>\r\n<p>\r\n	在你博客特定的位置加上一句电影台词，增加文艺值。具体效果就如同我的博客刚进页面时的那句话：\r\n</p>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140722/20140722160447_84752.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140722/20140722160447_84752.jpg\" alt=\"\" width=\"761\" height=\"509\" title=\"\" align=\"\" /></a>\r\n</p>\r\n<p>\r\n	然后呢，就是傻瓜式调用了：\r\n</p>\r\n<p>\r\n	直接在主题目录的functions.php（wordpress）|module.php(emlog)当中加上一段代码：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">function line_api()//line api\r\n{\r\n	$url=\'http://line.uuuuj.com/include/line_api.php?type=1\';\r\n	$line=file_get_contents($url);\r\n	$line=json_decode($line,true);\r\n	$error=json_last_error();\r\n	echo \'&lt;a href=\\\'http://www.uuuuj.com\\\' title=\\\'\'.$line[\'name\'].\'\\\'&gt;\'.$line[\'line\'].\'&lt;/a&gt;——\'.$line[\'name\'];\r\n}</pre>\r\n然后在你需要显示的任意页面的任意部分加上：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">&lt;?php line_api();?&gt;</pre>\r\n就大功告成了，如果有问题直接联系我。。\r\n</p>\r\n<p>\r\n	下面是说明：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-php\">url:http://line.uuuuj.com/include/line_api.php;\r\n可选参数:type=1;\r\ntype=1:返回带有电影名称的json数据;\r\n返回值：\r\nline:台词;\r\nname:电影名称;\r\n不加:直接返回一句台词的json数据;</pre>\r\n以上。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','在你博客特定的位置加上一句电影台词，增加文艺值。具体效果就如同我的博客刚进页面时的那句台词',1,2,'php,台词,电影',4,'2014-07-22 16:15:31',0,316,0,0),(66,'一群不敢刮胡子，怕被认作女人的逗比','<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20140728/20140728225904_98484.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\"><img src=\"http://www.uuuuj.com/attached/image/20140728/20140728225904_98484.jpg\" alt=\"\" width=\"640\" height=\"426\" title=\"\" align=\"\" /></a> \r\n</p>\r\n<p>\r\n	我不是啥韩寒的粉，但相比于小四，我宁愿是韩寒的粉。了解这部电影是从youku上看到邓紫棋的那首《后会无期》，也许仅仅是歌声，并不足以让我主意电影，但是配上了mv之后，我就知道这部电影不得不看。\r\n</p>\r\n<p>\r\n	后面听到了《平凡之路》，特别对于其中的一句：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint\">我曾经毁了我的一切 只想永远地离开\r\n我曾经堕入无边黑暗 想挣扎无法自拔</pre>\r\n说到电影，我是看过n多影评才去看的，意料之中的碰到了睡着的人。确实，这部电影对于不是太多愁善感（喜欢变形金刚4这类劲爆大片的）着实无聊了点，可以说是没有剧情的，就是一些繁杂的小事拼凑起来的；但同时，你又不能说她差，因为我看到最后有一种意犹未尽的感觉，这种感觉很微妙，不可言喻。\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	很佩服韩寒，我觉得让我产生意犹未尽的感觉完全是靠前期的宣传片造成的。比如，你不看电影你永远不知道他们看的那颗火箭是半路爆炸的；苏米的那句：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-js\">有机会，我把我的故事都讲给你听。可惜没有这个机会了！</pre>\r\n原来不是在车后座说出来的。\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	很喜欢其中的一句台词：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint\">旅行者1号，1977年发射，经历了36年，终于冲出了太阳系，进入了外太空的星际空间。他这样孤独的漂流，只为了去未知的世界看一眼。有些人，一辈子缩在一个角落里，连窗外都懒得看，更别说踏出门。</pre>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:14px;\"><strong>最后，电影里的是阿拉斯加，是一只大型犬（大到什么程度，在某些地方是禁养此类大型犬的），你如果自己还无法拥有30m</strong></span><sup><span style=\"color:#E53333;font-size:14px;\"><strong>2</strong></span><span style=\"color:#E53333;font-size:14px;\"><strong></strong></span><span style=\"color:#E53333;font-size:14px;\"><strong></strong></span></sup><span style=\"color:#E53333;font-size:14px;\"><strong>&nbsp;的居住空间的话，还是不要跟风了，他不是哈士奇，小马达可不想因为它世界上又多了n只流浪狗。</strong></span> \r\n</p>\r\n<p>\r\n	最终有5个人看完了字幕，主题曲在电影结尾稍加改变了下，其中的“说唱”部分变成了：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint\">就走吧\r\n无论去哪\r\n就算你被给过什么\r\n就走吧\r\n无论去哪\r\n就算你被夺走什么\r\n就走吧\r\n无论去哪\r\n就算你会错过什么</pre>\r\n很好的契合了看完电影的感觉“就走吧！”\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	字幕中还显眼的加上了句“吸烟有害健康，骑摩托车请带头盔”。\r\n</p>\r\n<p>\r\n	附上主题曲\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<audio src=\"http://music.uuuuj.com/平凡之路.mp3\" controls=\"controls\" loop=\"loop\"></audio>\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>','',1,3,'电影,后会无期',4,'2014-07-28 23:41:37',0,2835,0,0),(67,'多说真是慢','于是我要抛弃多说了——听过很多大道理，却依然过不好这一生。','',1,1,'关于你,爱情',3,'2014-08-05 16:05:25',0,3193,0,0),(68,'弃多说','<p>\r\n	终于还是把多说弃了，为什么呢，因为有时多说确实加载的太慢，甚至有时都没评论狂出来。本身自己很早就把评论的功能弄好了，只是迫于懒惰和怕垃圾评论一大堆没放出来，现在就勇敢的放出来吧。<span style=\"line-height:1;\"></span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:12px;\">另外，最近一直在纠结辞职的问题，自己还是太优柔寡断了。8月15回去一趟，8月30再回去一趟，朋友终于完成了终身大事，祝福再祝福。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:12px;\">而自己呢，本以为蛮有可能的事情，最终发展的确实截然相反，所以你要相信，是你的就是你的，不是你的，就不要想太多了，伤神。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:12px;\">你始终要相信：</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:12px;\">\r\n<pre class=\"prettyprint\">在这个城市里，我坚持的相信一定会有那么一个人，想着同样的事情，怀着相似的频率，在某站寂寞的出口，安排好了与我相遇。</pre>\r\n<br />\r\n</span>\r\n</p>','',1,1,'关于你,爱情',4,'2014-08-12 23:38:35',0,6790,0,0),(69,'垃圾评论遍地飞','<p>\r\n	<span style=\"line-height:1.5;\">最近实在是无心弄网站，于是出现了垃圾评论漫天飞的问题。还好事先限制了60秒评论一次，然后还是得把反垃圾功能给弄进去。于是乎把akismet整进来了，不晓得一个apikey能用几个站？</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">我看网站上说如果要加多个网站，需要购买最基本的personal版本么，反正我本地测试了可用，就把这个key先用着吧。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">只是加入了最简单的看这个评论是不是垃圾评论的功能，还是很easy的。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">另外：input的requred不能判断空格的问题哈。看来得再判断下是不是空格。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">然后也附带下渣渣 akismet的代码吧：</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">\r\n<pre class=\"prettyprint lang-php\">function akismet_check($user_ip,$user_agent,$comment_author,$comment_author_email,$comment_author_url,$comment_content)\r\n{\r\n		$apikey=\'你的key\';\r\n		$blog=\'你的站点\';\r\n		$referrer=\'你的站点\';\r\n		$blog_charset=\'utf-8\';\r\n		$url=$apikey.\'.rest.akismet.com/1.1/comment-check\';\r\n		$data=array(\r\n				\'blog\'=&gt;$blog,\r\n				\'user_ip\'=&gt;$user_ip,\r\n				\'user_agent\'=&gt;$user_agent,\r\n				\'referrer\'=&gt;$referrer,\r\n				\'comment_author\'=&gt;$comment_author,\r\n				\'comment_author_email\'=&gt;$comment_author_email,\r\n				\'comment_author_url\'=&gt;$comment_author_url,\r\n				\'comment_content\'=&gt;$comment_content,\r\n				\'blog_charset\'=&gt;$blog_charset\r\n		);\r\n		$curl=curl_init();\r\n		curl_setopt($curl,CURLOPT_URL,$url);\r\n		curl_setopt($curl,CURLOPT_HEADER,0);\r\n		curl_setopt($curl, CURLOPT_HTTPHEADER, array(                                                                            \r\n				\'User-Agent:Wordpress/1.0 | Akismet/2.5.9\'                                                                                  \r\n		)                                                                         \r\n);         \r\n		curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);\r\n		curl_setopt($curl,CURLOPT_POST,1);\r\n		curl_setopt($curl,CURLOPT_POSTFIELDS,$data);\r\n		$res=curl_exec($curl);\r\n		return $res;\r\n}\r\n</pre>\r\n输入都很通俗易懂的，用户ip，user-agent，名称，邮箱，地址，内容，我现在就用这几个来判断是否垃圾。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">返回值如果是“true”则是垃圾评论。</span>\r\n</p>','',1,2,'php,blog',4,'2014-09-11 10:47:30',0,1361,0,0),(70,'音乐播放器','<p>\r\n	弄了一个星期，总算是折腾出一个播放器了。其中下载音乐就花了N久，把我优酷上搜集的音乐都下载下来，然后转成mp3。期间还因为用了一款渣渣转换工具，转出来的歌不能在html5播放器中播放，于是乎又重新转。\r\n</p>\r\n<p>\r\n	目前播放器还没用到库，估计得哪天加上用户收藏功能的时候再连上库吧。\r\n</p>\r\n<p>\r\n	期间遇到个问题：从windows下打包成zip的歌，上传到vps之后解压，文件名就变成了问号，从而导致播放器无法找到歌曲。经过多次实验之后发现，采用打包成tar.gz的方式可以避免。具体操作就是先打包成tar.gz的，然后解压之后使用命令：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-bsh\">convmv -f GBK -t UTF-8 --notest -r 文件夹</pre>\r\n即可把乱码问题解决。\r\n</p>\r\n<p>\r\n	如果没有convmv就直接：\r\n</p>\r\n<p>\r\n<pre class=\"prettyprint lang-bsh\">apt-get install convmv\r\n附上参数含义：\r\n-f 原始编码(windows下的编码，一般是GBK);\r\n-t vps上的编码;\r\n--notest 如果不加，就表示预览，并不会修改;\r\n-r 递归目录所有子目录。\r\n</pre>\r\n	<p>\r\n		体验地址：<span style=\"color:#E53333;\"><span style=\"color:#E53333;\"><a href=\"http://soft.uuuuj.com\" target=\"_blank\">点我</a></span></span>\r\n	</p>\r\n	<p>\r\n		<span style=\"color:#E53333;\"><span style=\"color:#000000;\">另外，翻以前的电脑翻出一堆烦心的东西，以前保存的短信，额。</span><br />\r\n</span>\r\n	</p>\r\n</p>','',1,2,'代码,播放器,博客',4,'2014-09-14 20:17:43',0,444,0,0),(71,'至于我？马革裹尸，战死沙场','<p>\r\n	新主题挂起来晾一晾，响应式还没弄的起来，测试来测试去太麻烦，暂时就不搞响应式。全站ajax还是没搞，ajax地址也没换，就这么将就着吧。<span style=\"white-space:normal;\">友情链接换到了内页，要点击才能看到。</span>\r\n</p>\r\n<p>\r\n	9月30日离职，全新的生活又开始，成为一名危害社会的无业游民。可悲的是以前找工作的时候还有个人陪，现在是一片荒凉。准备在近期把阑尾的两个摊子先搞定，一个是emlog的主题Siyochen的，还一个是答应别人搞的。\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">至于题目，出自魔兽世界地球时代，瘟疫之地圣光之愿礼拜堂里面的那个玛尔兰。</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">另外，成为了一名摄影人士，听起来就是很屌。顺便科普下大宾得：</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">\r\n<pre class=\"prettyprint\">宾得（PANTEX）是世界著名相机公司，而且买的是情怀，千万不要被烂大街的C&amp;N蒙蔽了双眼，大家都来买宾得吧。</pre>\r\n</span>\r\n</p>','',1,1,'关于你,摄影',4,'2014-09-29 11:02:29',0,1708,0,0),(72,'Today you are you','<pre class=\"prettyprint\">Today you are you, that is truer than true. There is no one alive who is youer than you！</pre>\r\n<pre class=\"prettyprint\">你就是那个独一无二的你</pre>\r\n<p>\r\n	<a href=\"http://www.uuuuj.com/attached/image/20141010/20141010205506_43213.jpg\" rel=\"gallery\" target=\"_blank\" title=\"\" style=\"line-height:1.5;\"><img src=\"http://www.uuuuj.com/attached/image/20141010/20141010205506_43213.jpg\" alt=\"\" width=\"800\" height=\"530\" title=\"\" align=\"\" /></a>\r\n</p>','',1,1,'关于你',4,'2014-10-10 20:59:03',0,485,0,0);
/*!40000 ALTER TABLE `b_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_attachment`
--

DROP TABLE IF EXISTS `b_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_attachment` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_attachment`
--

LOCK TABLES `b_attachment` WRITE;
/*!40000 ALTER TABLE `b_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_category`
--

DROP TABLE IF EXISTS `b_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_category`
--

LOCK TABLES `b_category` WRITE;
/*!40000 ALTER TABLE `b_category` DISABLE KEYS */;
INSERT INTO `b_category` VALUES (1,'LifeTime'),(2,'Codes'),(3,'Movies');
/*!40000 ALTER TABLE `b_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_comment`
--

DROP TABLE IF EXISTS `b_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `postId` int(10) NOT NULL,
  `parentId` int(10) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `text` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=803 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_comment`
--

LOCK TABLES `b_comment` WRITE;
/*!40000 ALTER TABLE `b_comment` DISABLE KEYS */;
INSERT INTO `b_comment` VALUES (1,68,0,'0','tinty','http://www.uuuuj.com','admin@uuuuj.com','管理员来测试下评论功能！！！。。','2014-08-12 23:39:47'),(2,68,0,'0','小黎','http://199508.com','4020426@qq.com','好看多了。','2014-08-13 15:26:45'),(3,68,2,'qqD027D1E733AE39DC7C020AFDE5918D1A','咸鱼','http://www.uuuuj.com','','测试下','2014-08-13 18:23:24'),(4,68,0,'0','阿福','http://rffan.info','admin@rffan.com','咬咬，你觉得，我们俩有没有可能？辞职来台州把。','2014-08-13 23:45:41'),(5,68,0,'0','上海小额贷款','http://shanghai.yiqirong.com/','157200189@qq.com','管理员又来测试功能了.http://shanghai.yiqirong.com/','2014-08-14 14:28:25'),(6,68,0,'0','神父','http://da.ji8.me','f.oy@qq.com','咬咬，你觉得，我们俩有没有可能？辞职来南昌把。','2014-08-15 15:39:16'),(7,68,0,'0','Siyochen','http://www.siyochen.com','1490602@qq.com','楼上的你们这帮人啊。都不愿意辞职了到咬咬那边去。诚意呢！','2014-08-16 13:07:12'),(8,64,0,'0','氟硅酸钠包装秤','http://www.baggingpalletizing.com','public@go2mj.com','这位小友,我看你玉树临风,天赋异秉,将来必成大器.现在给你个小小的考验,你点点我的ID,进入我的秘密基地，之后我们谈谈怎么拯救世界,你看如何？','2014-08-18 16:04:10'),(9,68,0,'0','玥璃','http://ccco.me','425881381@qq.com','测试一下。哈哈~','2014-08-19 22:55:35'),(12,68,0,'0','Small Desert','http://www.itiyun.com','yxb9510@gmial.com','嗯...不知道说什么。。','2014-08-20 22:52:34'),(15,66,0,'0','文字控吧','http://www.lfqie.com','365754451@qq.com','哈哈，还有这样的么、、','2014-08-25 11:11:26'),(231,69,0,'0','咸鱼','http://www.uuuuj.com','admin@uuuuj.com','我来测试下评论','2014-09-12 10:21:03'),(17,68,0,'0','氟硅酸钠包装秤','http://www.baggingpalletizing.com','public@go2mj.com','好吧，我来支持一下~~~~','2014-08-26 14:33:42'),(299,70,0,'0','siyochen','http://www.siyochen.com','1490602@qq.com','可以留言了吗','2014-09-18 07:57:11'),(300,70,0,'0','siyochen','http://www.siyochen.com','1490602@qq.com','= =可以了啊，最近干嘛呢','2014-09-18 07:58:27'),(663,71,0,'0','千年','http://www.qiannian.info','40210590@qq.com','这是评论的第三个测试','2014-10-08 21:08:48'),(677,71,669,'0','咸鱼','http://www.uuuuj.com','admin@uuuuj.com','么有 无业游民找工作中。','2014-10-10 21:10:22'),(766,69,0,'0','大肥羊','http://cyhour.com/','nieccyyy@qq.com','就是提交前判断？如果是的话就提交不了？要装那个插件么？','2014-11-07 14:56:09'),(770,72,0,'0','王语双个人网站','http://wangyushuang.com','707787641@qq.com','路过。PS：见博不错，已擅自收录到我的友链http://wangyushuang.com/links.html之中了；博主不介意吧？','2014-11-09 16:45:48'),(771,71,0,'0','扭腰时报','http://www.niuyork.com','nb@niuyork.com','喜欢之前的，现在这个无爱。那个倒霉图太大了','2014-11-11 15:26:11'),(772,68,0,'0','王语双个人网站','http://wangyushuang.com','707787641@qq.com','该断不断，反受其乱。','2014-11-12 15:29:12'),(773,53,0,'0','wlqc','http://','wlqc@qq.com','hello..哦，还中文？','2014-11-16 01:20:29'),(774,53,0,'0','wlqc','http://','wlqc@qq.com','再试一下？？','2014-11-16 01:21:47'),(775,71,0,'0','知道91博客','http://www.zhidao91.com','zhidao91@yeah.net','博主说得好悲壮啊，O(∩_∩)O~','2014-11-21 01:01:30'),(776,72,0,'0','玥璃','http://ccco.me','425881381@qq.com','刚刚进来看到那艘船，好有free。','2014-11-21 08:46:09'),(777,68,0,'0','王语双个人网站','http://wangyushuang.com','95249542@qq.com','相信一定会有那么一个人，想着同样的事情，怀着相似的频率，在某站寂寞的出口，安排好了与我相遇。','2014-11-22 17:09:01'),(778,72,0,'0','神父','http://da.ji8.me','f.oy@qq.com','打开上面那张图片花了80秒','2014-11-25 16:29:21'),(779,72,0,'0','蒋新磊','http://www.jiangxinlei.com','zyy-861223@163.com','浩大的图片','2014-11-27 11:58:16'),(780,72,0,'0','琉璃瓦','http://www.yxllwa.com','2812259260@qq.com','网站速度不错啊。哪里的空间啊','2014-12-03 18:07:24'),(781,70,0,'0','琉璃瓦','http://www.yxllwa.com','2812259260@qq.com','这个东西在哪里使用啊','2014-12-03 18:08:58'),(782,68,0,'0','Zhys','http://www.9sep.org','zhys@9sep.org','咬咬，你觉得，我们俩有没有可能？辞职来长沙把带你去快乐大本营现场。楼下保持队形！','2014-12-14 01:55:08'),(783,72,0,'0','Zhys','http://www.9sep.org','zhys@9sep.org','图片加载花了20s。','2014-12-14 02:00:17'),(784,70,0,'0','王语双','http://wangyushuang.com','lw@wangyushuang.com','喜欢就慢慢折腾，折腾出来，自然满心欢喜。恭喜博主。','2014-12-16 19:30:26'),(785,72,0,'0','王语双个人站','http://wangyushuang.com','lw@wangyushuang.com','*^____^* 圣诞节了，过来问个好。预祝元旦快乐，新年快乐！','2014-12-25 12:00:47'),(787,72,0,'0','siyochen','http://siyochen.com','1490602@qq.com','还活着么。。。。。。','2015-01-17 09:34:23'),(788,71,0,'0','黑皮甘蔗','http://www.ganzhe8.com','517209078@qq.com','这文章真有意思','2015-01-21 14:43:02'),(789,70,0,'0','英文网址大全BuzzRecipe.com','http://buzzrecipe.com/','victor2u@qq.com','以前保存的短信 嗯  确实挺烦心的','2015-01-23 22:47:19'),(790,71,0,'0','威客兼职','http://www.renwuyi.com','293459572@qq.com','我也是来测试行不行','2015-01-24 15:43:30'),(791,72,0,'0','麦杰包装秤','http://www.baggingpalletizing.com  ','gabirella@163.com','好有意境','2015-02-03 10:46:44'),(792,70,0,'0','威客兼职','http://www.renwuyi.com','293459572@qq.com','现在不太喜欢播放器了，感觉累赘','2015-02-06 11:19:30'),(793,68,0,'0','申克','http://shenco.duapp.com','shenco@163.com','多说有时候确实有点恼火，但也有它的好处，我放弃了好几次，又把它弄回来了。','2015-02-09 18:22:48'),(794,72,0,'0','siyochen','http://www.siyochen.com','1490602@qq.com','嘿~还活着吗。活着的话祝你新春快乐。','2015-02-19 13:04:44'),(795,71,0,'0','沉鱼落雁随笔','http://www.keyafu.com','kakpu@sohu.coom','已经很喜欢 你的博客了','2015-02-22 14:49:58'),(796,71,0,'0','晨风','http://www.banghui.org','aijava@live.cn','这是评论的一个测试','2015-02-26 17:25:35'),(797,68,0,'0','晨风','http://www.banghui.org','aijava@live.cn','咬咬，你觉得，我们俩有没有可能？辞职来上海把。','2015-02-26 17:28:33'),(798,72,0,'0','admin','http://www.uuuuj.com','admin@dreamby.me','阿道夫撒旦飞洒的','2015-03-06 17:30:46'),(799,72,0,'0','admin','http://www.uuuuj.com','admin@dreamby.me','阿斯飞洒地方撒旦发123213','2015-03-06 17:33:23'),(800,72,0,'0','admin','http://www.uuuuj.com','admin@dreamby.me','撒旦放松放松地方1231241245','2015-03-06 17:38:12'),(801,72,800,'0','admin','http://www.uuuuj.com','admin@dreamby.me','阿斯顿飞洒地方撒旦发123213','2015-03-06 18:16:39'),(802,72,799,'0','admin','http://www.uuuuj.com','admin@dreamby.me','撒旦发送到飞洒地方撒旦飞洒12312412412521352135','2015-03-06 18:17:20');
/*!40000 ALTER TABLE `b_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_links`
--

DROP TABLE IF EXISTS `b_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_links` (
  `id` int(10) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_links`
--

LOCK TABLES `b_links` WRITE;
/*!40000 ALTER TABLE `b_links` DISABLE KEYS */;
INSERT INTO `b_links` VALUES (0,'吾爱网络电视','http://www.5itv.org','吾爱网络电视'),(1,'Be always as merry a','http://ccco.me/','CcCo.Me'),(2,'陈昕妤中文网','http://www.siyochen.com/','Siyochen'),(3,'wordpress教程及黑科技','http://wysafe.com','梦月酱'),(4,'分享网络资源|记录生活点滴','http://www.isays.cn/','小寂博客'),(5,'','http://www.wsidea.com/','维思迪博客');
/*!40000 ALTER TABLE `b_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option`
--

DROP TABLE IF EXISTS `b_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option` (
  `title` varchar(50) NOT NULL,
  `keywords` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option`
--

LOCK TABLES `b_option` WRITE;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` VALUES ('Brague','Brague,PHP,wordpress,emlog,html5,css3,js','What a beauty life!');
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_tag`
--

DROP TABLE IF EXISTS `b_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_tag` (
  `id` int(10) NOT NULL,
  `tag_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_tag`
--

LOCK TABLES `b_tag` WRITE;
/*!40000 ALTER TABLE `b_tag` DISABLE KEYS */;
INSERT INTO `b_tag` VALUES (1,'tag1'),(2,'tag2');
/*!40000 ALTER TABLE `b_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_third`
--

DROP TABLE IF EXISTS `b_third`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_third` (
  `userId` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `thirdId` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_third`
--

LOCK TABLES `b_third` WRITE;
/*!40000 ALTER TABLE `b_third` DISABLE KEYS */;
INSERT INTO `b_third` VALUES ('qqD027D1E733AE39DC7C020AFDE5918D1A','咸鱼','admin@uuuuj.com','http://www.uuuuj.com','http://q.qlogo.cn/qqapp/101141172/D027D1E733AE39DC7C020AFDE5918D1A/40','D027D1E733AE39DC7C020AFDE5918D1A'),('qq','','','','','');
/*!40000 ALTER TABLE `b_third` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `name` varchar(12) NOT NULL,
  `password` varchar(60) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (1,'admin@uuuuj.com','Tinty','$2y$10$ExorvuWq9DhMs3eHiTq5sOULnYUHoeBSuamOTFWInHJyOpoMTDf2e','从明天起，做一个幸福的人；骑马、砍柴、周游世界！','9dMRjreB5tux0gNrmooNWOWNTqFZITue55P6YJvyBrX99Gj5pvZUAi3QTcS9');
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-09  1:09:05
