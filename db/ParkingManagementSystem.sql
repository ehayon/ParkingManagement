-- MySQL dump 10.13  Distrib 5.1.63, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: ParkingManagementSystem
-- ------------------------------------------------------
-- Server version	5.1.63

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id_activity` int(11) NOT NULL AUTO_INCREMENT,
  `id_parkinglot` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  PRIMARY KEY (`id_activity`),
  KEY `id_parkinglot` (`id_parkinglot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id_announcement` int(11) NOT NULL AUTO_INCREMENT,
  `announcement` varchar(140) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_announcement`,`announcement`,`created_at`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'This lot will be closing for winter break on 12/17 at 6pm','2012-12-05 22:26:29'),(2,'A silver Toyota, licence plate \"BEWCHY\" is blocking the entrance','2012-12-05 22:26:54'),(3,'Lot closes tonight at 6pm due to snow clearing tomorrow morning ','2012-12-05 23:06:36'),(4,'test','2012-12-12 03:34:36'),(5,'test2','2012-12-12 03:34:53'),(6,'fdsfadfadsf','2012-12-12 03:46:24'),(7,'Lot will close on December 18th for intersession','2012-12-12 22:43:23'),(8,'Lot is now open...','2012-12-12 23:09:48');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id_comment`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,5,'This lot sucks!'),(6,5,'This lot has been closed for months...'),(7,5,'test comment'),(10,14,'alert(\"foo\"); it\'s a test'),(11,5,'alert(\"test\");');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkinglots`
--

DROP TABLE IF EXISTS `parkinglots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkinglots` (
  `id_parkinglot` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `available` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `location` text,
  `id_comment` int(11) NOT NULL,
  `image` blob,
  `description` text,
  PRIMARY KEY (`id_parkinglot`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkinglots`
--

LOCK TABLES `parkinglots` WRITE;
/*!40000 ALTER TABLE `parkinglots` DISABLE KEYS */;
INSERT INTO `parkinglots` VALUES (1,1,2,4,'Hayden Parkinglot',0,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0ÒºIp\0\0\0	pHYs\0\0\0\0\0šœ\0\0\nOiCCPPhotoshop ICC profile\0\0xÚSgTSé=÷ŞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆ€ŒQ,Š\nØä!¢ƒ£ˆŠÊûá{£kÖ¼÷æÍşµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sı#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóıxÎ®ÎÎ6¶_-ê¿ÿ\"bbãşåÏ«p@\0\0át~Ñş,/³\Z€;€mş¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}şgÂ_ÀWılù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ıG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púaÁ(¼	AÈa!ÚˆbŠX#™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ğdt1š ›Ğr´\Z=Œ6¡çĞ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRİ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºİ•N—ĞWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªŞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yı‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ı»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠŞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSİ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜¾^€Lo§Şy½çú}/ıTımú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«ÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ı=\r‡Ù«Z~s´r:V:ŞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆİÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)Y3sĞÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Ş2ŞY_Ì7À·È·ËOÃo_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖĞaæa‹Ã~\'…‡…W†?pˆX\ZÑ1—5wÑÜCsßDúD–DŞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ğA*¨Œ%òw%\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLİ›:šv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²şÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæŞ-[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒİµa×ønÑî{¼ö4ìÕÛ[¼÷ı>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒı#¶×¹ÔÕÒ=TRÖ+ëGÇ¾şïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêŞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<ş“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷é7Îİô½yñÿÖÕ9=İ½ózo÷Å÷õßİ~r\'ıÎË»Ùw\'î­¼O¼_ô@íAÙCİ‡Õ?[şÜØïÜjÀw óÑÜG÷…ƒÏş‘õC™Ë†\r†ë8>99â?rıéü§CÏdÏ&ş¢şË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ıêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSĞ§û“““ÿ˜óüc3-Û\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0\0PLTE~~~÷÷÷¾¾¾uuu–––´´´LLLºººüüüyyynnnÀÀÀiii\0\0ÿ€ÿÿ€€ÿ\0ÿÿ\0€ÿÿ\0ÿÿ\0\0ÿÿ€ÿÿ\0\0ÿ€€€@ÿ\0€\0ÿ\0dªÿşşş€€€ÿÿÿ\0\0\0ÿÿÿ   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~€€€‚‚‚ƒƒƒ„„„………†††‡‡‡ˆˆˆ‰‰‰ŠŠŠ‹‹‹ŒŒŒ‘‘‘’’’“““”””•••–––———˜˜˜™™™ššš›››œœœŸŸŸ   ¡¡¡¢¢¢£££¤¤¤¥¥¥¦¦¦§§§¨¨¨©©©ªªª«««¬¬¬­­­®®®¯¯¯°°°±±±²²²³³³´´´µµµ¶¶¶···¸¸¸¹¹¹ººº»»»¼¼¼½½½¾¾¾¿¿¿ÀÀÀÁÁÁÂÂÂÃÃÃÄÄÄÅÅÅÆÆÆÇÇÇÈÈÈÉÉÉÊÊÊËËËÌÌÌÍÍÍÎÎÎÏÏÏĞĞĞÑÑÑÒÒÒÓÓÓÔÔÔÕÕÕÖÖÖ×××ØØØÙÙÙÚÚÚÛÛÛÜÜÜİİİŞŞŞßßßàààáááâââãããäääåååæææçççèèèéééêêêëëëìììíííîîîïïïğğğñññòòòóóóôôôõõõööö÷÷÷øøøùùùúúúûûûüüüııışşşÿÿÿy„[\0\0\0 tRNSÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\0\\\\í\0\0oIDATxÚìİb›¸FÓfÚfê¡°uŞÿ-Ï…íÄM,Œ`ÿI¬}‘9“ñq¤ÁBOÿ£¨J=pPÀApPÀAUT‹ìÓçÀa‡\0GÀÑ\"RŠ\\)\"·¿+·?C=ÉûÀ!¥¹ü,RÊµ)ò×‘\ZÜlôÍpìJŞ	9SûŞÄë/o\Zwıp¨Â±\'ù½p¬;yÉ\rÅ×&~&wË`Ä¸ÄåÿâĞİä×ÁÑÔDùÚDYyZ]]0Hş!Mm”/\r;ÿóıwKRjFÉ+ÂAVËpt\0”Úcj†¢QW3¢AÇ“é8:º`·€ãrY%òù\"K¸Šu¹ UM^KsäößÎÜœVìêÉ›Àñ³ÈmS)k8t“7…£|â8qÍŸôL’·†£ÓÊ,2—ÁàHwZù}•¼ûf÷h%ïx)›µN aS‡‡ã$­ÀÀÁi8†—²Àƒ0\0pPÀApVÇ›õu¸©2àhÄ8€£Ç	8Gó=ûp\0p\0§à`@\n\\ÊGÈØ„I0à €ƒ\n8(à €ƒ\n8(à €ƒà\0à €ƒ\n8(à €Ã­Ä¨€C»æÙ}Èt¸åÇ<Ÿ6ÀIDä4Ïú$?2ür‚ãÜÃSKÃu6À%[m>¼àğÍ-\0›íÓÔn­\r`Á‡ş¹yÃñ÷–	£”Ys8Brs…ãË6	‚CÿøaGTn~pÜÛ\ZpèòaG`nNpT¶C,Š|XÁ››õ-‡&mÏÍÅì3À¡Â‡~Û2äfÇ£Ô×·{O¦ƒ¾|(·-In†p¬È{e»¯ßäyµGÜ¬àX—ôšN\ZÍiêş-58RåfÇêv=ì¤\'{ş¢!¹-|—ëÓ]îdóvRÚ7ğá|WP37g8ÖçºĞ°-{ğ†M4MÓ¤ğ×UàˆÉÍõÛ³Ö°g“öM4]êş¦:·Á\r˜ÜœáØÙ°íãŒmpüùs—‘†–8?¦™[Gpì\Zn‚C^_åŞñãüe+Û‡É•\n½×&Í›hš&™¦iúóú•÷/[ÓªX8¬ö¨<p(\\µn…Cî:šÚ‡á•ùŒMp¼N2‰¼N¯wO++·A¶{T8ÔfºZ7Ñ4MÓ$\"“L\"²Çr;Cà0ß£ÂáĞœİÇ$Óô:Mòç!ÛÃ=*\Z†¹8DŞÓ¹w8ôrK\nÇYÎQ¼oÒ¸‰¦ëÅJwùp…C7·Œp\\V½£¶i_ùp—š\\ö¨~¤&³1Ge\n½éÎgb©©/8¶Ê9—²ñ±áËŞ»’Yjêr	¥zó­íi«ÄRS\'pì“s4à¨Œâ*7ŞV}ÎşùVÛÜRÀ±[ÎÑ€Cv=3Q¿Áoø¤šunáp8Í­‚cÇÓVõŠ#cÁá7ë¼=Ïi.^İ¸‘1Š÷«4¹)ÛŸğ^q#C9·(8ït¯\Zô­ÿÄ&7ä†1…Ã5·8Ÿ‘Y+ç4áÓn•½“q¾E†rnşp(>]§£`ÜıD›:M.7píÎ*¹¹?}®ö\\®š‚QûDƒÉş×£pÄäæGÃæt—šî}bí;0¦éuz™dz59«åæ‡d#5U>±f¢é}ÀqªÃ”›/\n¡™ÔTÿÄÃ)ê3¯&+8‚rCjZõ‰7·®‡×Wq›\"uÈ\r©ií\'ÜŸ>¹dp 5ÙÃQÊ£j|o®8ä†ÔÔ6{ô )ál 5ÂQŞW&p|kLTnHMÍp”\"âşV¡Üš6ÁñÖ)ÿÜš6ÂQ’ò1¾Ô¤»ùøPnNB8®m;KM›àÈÄ‡~nÙà°Ò=ìàÈÁ‡In©à0ÅLáˆæÃ\"7¹öS2Àa§˜>è§\n7xú7rœ¡Ç´9S9ıA??&/v†Îİxûşü;lª¶Üœ¿«’ŠÖ¯µxĞÏ÷?¨ñ\"ØsgŞŞ¾?==‡\\›¨å&s©îPãHMËı¼6DëÒ×.}7=¿˜ç6K©îPãHMËılT>nÛ;OŞóz¹É,Rİ¡:’švõ³iù*ç™.E©ié\r#IM\roBĞ[ğÆÂ±÷Ìí´€¶³¿ÔtjÚ…õ–ÊR^§	©i}\'U¥¦†¯# ·ÓÉ0©étRl«?a¹9Â\'5©nw8òå6”Ô¤Ê‡;ùrJjRåÃ|¹\r%5©òtµ’)·¡¤&U>ú‚Ã$·¡¤&%@šß\r‡UnCIMÍ•iáĞ„¹\r%5ma£Ê‡h]Yö›ÛPRÓ8*‡6IMAp˜ç6”Ô´ÚÂ¡MRS¹\r%5m`£¶ph“Ô\0‡KnCIMÛày°O²…CırJjÚrV©,Ú$59ÂášÛPRÓ†k•ÚÂ¡MR“Û:MÎ¹\r%5m¹­,Ú$5¹t# ·¡Vjj?«T}$5y/\Z’ÛP+558da\r„R“çÂ¡Q¹\rµRÓ†³Ê8ŠïÂ¡¹9Á±ÿi+k:ZG™>C€ØÜ<àPyNÓš\r— Öá¹™Ã¡õ„·5ÛÚf·ph†ÜláPtCtênKj7ŞÖ}ÎbáĞ$¹Â‘Ñ*ÛcÙ{-š\'7+8’ú¨{,{—¥ÿRåf‡¾É®w—i{Ûì—†Ì–›>³ú;0´ï?nÛ;­M˜›:MÍZ7Ñ4‡ì£pX,š17u8š€m˜¢vç£‡ÑÂ¡sS‡£©Y\r7·ÜùøÔ6ë…C3æ–Îxs~>ìéé×·—5³æ‡&Ì-!Oş~şñíåíÑıë…C3æ–ÀgJÿ{şñò²xçÓ|áĞŒ¹e#üiãßÏ¿Ş™0_84cn)àH²&Á¿OO[%Z8Ô-·x8R­f²hÙgY8Ô-·h8®ƒ´dÙ§X8Ô-·H8Ò®Àø´}<n¹…Á1ç]{15¸¹ÁÑş‚”Qİ™s€cÛ«•FôeÎíÀRSW—ÙHM©ê#€§§`>š’9®||â©);¥”ç>šú€ãÌÇ›#HMŞÇè=p”R~?ÿzyËö RŸp(Ê9:[Cãå¢ÿışñòö–êF£Ü&5)-[ñó÷o//o§ïI~6Êí`R“Ş‚7?şóíE\0‚ÔÔĞIƒ9(µ—‹şüùîRSC\'­f\'ÙÓ;¬!55tÒTjÒ|¹¨Î€©iu\']îhè½\\T¡™HMë:éx¯+ÁËEçvt©)øå¢¹sCj*q/ÍRSíwR“?}ÀÔÂO©!5UùàùV¤¦:’Ôš(HMyÎ/	‡Ô¾wF®?—\"7¤¦…óz>€‘š2]$â©)á\\B\n>š’N4…óÔ”H>šòÃÃRS/pxóÔÔ~| 5¹Ã¡!59ğÁJM¥_©É”¤¦†Næ”šŒø@jjèdf©I½uHM\rì@jÒ;®!55t²©IgD„Ô´º“IM\nVRÓºN\"5%É\r©	©©8šRå†ÔTûãHMHMÕ‘ššª| 5!5Uù@jBjªóÔ„Ôä0™ÔknHMõ½©	©©~^GjBjZº\"@jBjZšK@jBjªO4!5!5-ÀQšš–Û†Ô„Ô´Ô6¤&VjZjR+5\"5±RÓêBjÊ\0RÓ\0¹!5íÙ\0HMfû&RSòÜššüà@j\Z\'7¤&¤¦¸I°ÖN\"5åÉ\r©© 5u\0RS¶Üšj!#5!5Uù@jBjªòÔ„ÔTç©	©Éa2©×Üšê{\'RRSı¼Ô„Ô´tE€Ô„Ô´4—€Ô„ÔTŸhBjBjZ€£ 5!5-·\r©	©i©mHMHMKmCjBjBjBj*Û†ÔdÛÃ‚Ô”<7¤¦=\0©Élß<–Ôt:u—R“—Ôôà#ƒHMË»\0RSuãw—Û8\rã÷N4)5‰ô—[;\'­‡r$©If‘Y:Ë­G»ÀN+5ÍRDŠÌ}åÖ‡ê.p©Iæ\"RzË­İ]à(RÓ,çïë,·V8tw£HMrù¾Îrk„Cy8ŠÔ$×\rªG>©Iy8’Ô¤\n[J©Iu8–Ô¤Gf©I§—‡“š”àH.5iôò€R“J_ÓKM{[vP©iw_»švµì¸RÓ¾¾ö\"5moÙ¡¥¦}íHjÚØ²£KM[ûÚ—Ô´¥eHMÛúÚÔÔÜ2¤¦m}íQjjkRÓ¶¾v*555HM[6h¿RS“QƒÔÔ¼A»–ššŒ\Z¤¦¶\rÚ»Ô¤hÔIjZñ}HMŠFÍ‘¤¦Gß7†Ô´Ü2¤¦mß7ˆÔ´ÜK¤¦mp 5­ûª1Wjzx*È—[ØÃ>µ¯\Zv¥&İÇ]rËGÔãa7·,áÈ³R“£¿ëÓ\nÃÜ’Àq€·›Àa›[8ñ~q}8Ìs‡ã0+(Ãá‘[4™×4É,5¹ä	ÇYÎÉ¼\ZRf©É!·h©)ó:j™¥&—Üš¼ÎëHMÁWúc¤&¤&‡¹¤¦–¤¦ä¹!5­ì&RRÓRÛšš–Ú†Ô4°ÔTö?m…Ô”NjšÕ^Ò¨ğœfGRS²§Ï[\"lyÂ[­\'¼»šöæ–_jRuš4İ©iİ§Ü’KMÉ—ÊR–š.ß—&·ÌR“İ#³ò¡[åÀöŞ¦4¹¥•šŒ&İAŸÆ¨%8§ÜÔ—ñR¤u·°¯-İuÊÍ\0À‰&M>üáH—[68)Õ˜¢‡Ã$·Tp„=l¼ûæV,V¹å£k©)\\R“½KMQp¤“šÔá@j\n#£Ô¤ÇR“øÃ‘TjRÌ)·ÔÔREÉ–›:¥5ÖÌR“#ÍÁå”šT;™Wjò¯t¹ÀARÀApPÀApPÀAÀApPÀAikÎü2àFƒgãnpTê\ZÀQCÃßSà\0N+ÀÁ€8¸”¥€ãpPÀApPÀ1Vk*8ÚêP3eÀ±à\0:\'à8ÔX¢õEÀÀ¡ÇØgå¼§¤İÁ!\"çÃóùJ¹ı]¹ıÉ¥¬êÑ*w58¤”\"—ŸE>¿ş‹t~XÉ7Ëa™»ræö½‘×_Ş4ïú)Jy(m”»ê‘£|jägvG©Æ\r3lr·;­”ëQn¤ÓJN8¬r×şÕ´ó?ß7Â€4åyÅ*w&Á¨-p@l\0”&ªt—)QW3¢Á†)\\ÃO…hÃ±Ë…•ÈçË,á*Öá‚V/÷/(|…£•KƒäößÎ—ÜœV¬Š¹ßãà.•ZläÎ\"·mieŸ{Kğêp”O$‡ks†cÕám“»/C¡¯£R±Ícrw†Cåª‰rÊ8€8€#ÔÁ\n8(à €ƒ\n8(à €ƒ\n8(à €ƒ¢€ƒJ¡ş?\0ÕNejGõM\0\0\0\0IEND®B`‚','This parking lot is located behind the Hayden dorm building'),(2,0,10,14,'Babbio Lot',0,NULL,NULL),(3,0,10,16,'River Lot',0,NULL,NULL),(4,0,3,16,'Hayden Lot',0,NULL,NULL);
/*!40000 ALTER TABLE `parkinglots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkinglots_announcements`
--

DROP TABLE IF EXISTS `parkinglots_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkinglots_announcements` (
  `id_parkinglot` int(11) NOT NULL,
  `id_announcement` int(11) NOT NULL,
  PRIMARY KEY (`id_parkinglot`,`id_announcement`),
  KEY `id_announcement` (`id_announcement`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkinglots_announcements`
--

LOCK TABLES `parkinglots_announcements` WRITE;
/*!40000 ALTER TABLE `parkinglots_announcements` DISABLE KEYS */;
INSERT INTO `parkinglots_announcements` VALUES (1,1),(1,2),(1,3),(1,4),(1,6),(1,7),(1,8),(2,5);
/*!40000 ALTER TABLE `parkinglots_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkinglots_comments`
--

DROP TABLE IF EXISTS `parkinglots_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkinglots_comments` (
  `id_parkinglot` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  PRIMARY KEY (`id_parkinglot`,`id_comment`),
  KEY `id_comment` (`id_comment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkinglots_comments`
--

LOCK TABLES `parkinglots_comments` WRITE;
/*!40000 ALTER TABLE `parkinglots_comments` DISABLE KEYS */;
INSERT INTO `parkinglots_comments` VALUES (1,5),(1,6),(1,7),(1,10),(1,11);
/*!40000 ALTER TABLE `parkinglots_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkinglots_parkingspaces`
--

DROP TABLE IF EXISTS `parkinglots_parkingspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkinglots_parkingspaces` (
  `id_parkinglot` int(11) NOT NULL,
  `id_parkingspace` int(11) NOT NULL,
  PRIMARY KEY (`id_parkinglot`,`id_parkingspace`),
  KEY `id_parkingspace` (`id_parkingspace`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkinglots_parkingspaces`
--

LOCK TABLES `parkinglots_parkingspaces` WRITE;
/*!40000 ALTER TABLE `parkinglots_parkingspaces` DISABLE KEYS */;
INSERT INTO `parkinglots_parkingspaces` VALUES (1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11);
/*!40000 ALTER TABLE `parkinglots_parkingspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkingspaces`
--

DROP TABLE IF EXISTS `parkingspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkingspaces` (
  `id_parkingspace` int(11) NOT NULL AUTO_INCREMENT,
  `state` char(1) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `rot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_parkingspace`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingspaces`
--

LOCK TABLES `parkingspaces` WRITE;
/*!40000 ALTER TABLE `parkingspaces` DISABLE KEYS */;
INSERT INTO `parkingspaces` VALUES (11,'1',70,272,73),(3,'1',70,247,73),(4,'1',70,222,73),(5,'1',70,197,73),(6,'1',70,172,73),(7,'0',70,147,73),(8,'0',70,122,73),(9,'0',70,97,73),(10,'0',70,72,73);
/*!40000 ALTER TABLE `parkingspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `action` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'General User'),(2,2,'Admin'),(3,1,'General User'),(4,2,'Admin'),(5,1,'General User'),(6,2,'Admin'),(7,1,'General User'),(8,2,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_parkinglots_subscriptions`
--

DROP TABLE IF EXISTS `user_parkinglots_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_parkinglots_subscriptions` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_parkinglot` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`,`id_parkinglot`),
  KEY `id_parkinglot` (`id_parkinglot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_parkinglots_subscriptions`
--

LOCK TABLES `user_parkinglots_subscriptions` WRITE;
/*!40000 ALTER TABLE `user_parkinglots_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkinglots_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `hashed_password` varchar(120) NOT NULL,
  `password_salt` varchar(60) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'ethanhayon','Ethan','Hayon','ehayon','$5$rounds=1000$FltiKUoy1mcgzXC$x17s0WTwXy3o31ZbPUAYjo5MguEjul2V1sCzh4nZUUA','$5$rounds=100$FltiKUoy1mcgzXC',2),(14,'test','bob','o\'malley','test@test.tv','$5$rounds=1000$et6HsOVXkB9vpDU$.9sDisWkU8601chrYjH/YM4pIE.Uu86p8ZrdX/wJ76D','$5$rounds=100$et6HsOVXkB9vpDU',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_role` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`,`id_role`),
  KEY `id_role` (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-13 15:50:36
