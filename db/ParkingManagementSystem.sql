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
INSERT INTO `parkinglots` VALUES (1,1,2,4,'Hayden Parkinglot',0,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0�\0\0\0ҺIp\0\0\0	pHYs\0\0\0\0\0��\0\0\nOiCCPPhotoshop ICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ��������c3-�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0\0PLTE~~~������uuu������LLL������yyynnn���iii\0\0�������\0��\0���\0��\0\0�����\0\0����@�\0�\0�\0d�����������\0\0\0���   !!!\"\"\"###$$$%%%&&&\'\'\'((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������y�[\0\0\0 tRNS�������������������������������\0\\\\�\0\0oIDATx���b��F�f�f���u��-υ��M,�`�I�}�9��q���BO���J=pP�ApP�AUT�����a�\0G��\"R�\\)\"��+�?�C�=���!���,Rʵ)���\Z�l��p�J�	9S����/o\Zw�p�±\'��p�;y�\r��&~&w�`ĸ�����������D��DYyZ�]]0H�!Mm�/\r;���wKRjF�+�A�V�p�t\0��cj��QW3�AǓ�8:�`���rY%��\"K��u��UM^�Ks����ܜV��ɛ����mS)k8t�7��|�8q͝��L�������,2���HwZ�}���f�h%�x)��N�aS���$����i8������0\0pP�ApVǛ��u��2�h�8����	8G�=�p\0p\0��`@\n\\�G�؄I0ࠀ�\n8(ࠀ�\n8(ࠀ��\0ࠀ�\n8(ࠀíĨ�C���}�t���<�6�ID�4��$?2�r����SK�u6�%[m>����-\0�����n�\r`����y����	���Y�s8Brs���6	�C��aGTn~p��\Z�p��aG`nNpT�C,�|X����-�&m�����3��~�2�fǣ�׷{�O����|(�-In�p��{e����y�G�ܬ�X���N\Z�i��-58R�f��v=�\'{��!�-|���]�d�vR�7��|WP37g8��а-{��M4MӤ��U������۳ְ�g��M4]���:��\r��ܜ��ٰ��mp��s����8?��[Gp�\Z�n�C^_�����e+����\n���&͛h�&��i������/[ӪX8���<p(\\�n�C�:��������Mp�N2��N�wO++�A�{T8�f�Z7�4M�$\"�L\"��r;C�0ߣ��М��$��:M��!���=*\Z���8D�ӎ�w8�rK\n�Y�Q�oҸ����Jw�p�C7��p\\V����i_�p��\\��~�&�1Ge\n���gb��/8��9�����޻�Yj��r�	�z��i��RS\'p�s4਌�*7�V}���V��R��[�рCv=3Q��o���un�p8���c��V��#c��7��=�i.^ݸ�1���4�)۟�^�q#C9�(8�t�\Z����&7�1��5�8��Y+�4��n���q�E�rn�p(>]��`��D��:M.7p��*��?}��\\���Q�D���ףp���G��t���}b�;0��uz�dz59�����d#5U>�f��}�q�����/\n���T���)�3�&+8�rCjZ��7�����Wq�\"u�\r�i�\'��>�dp 5��Qʣj|o�8���6{��)�l 5�Q�W&p|kLTnHM�p�\"��V��ܐ�6���)�ܐ�6�Q��1�Ԥ���PnNB8�m;KM���ć~n���=�����In��0�L���\"7��S2�a��>�\n7x�7r����9S9�A??&/v���x���;l��ܝ�����֯�x���?��\"�sg�޾?==�\\���&s��P�HM���6D���.}7=���6K��P�HM��lT>n�;O��z��,Rݡ:��v���i�*�.E�i�\r#IM\roB�[��±�������tjڅ���R^�	�i}\'U�����# ����0��tRl�?a�9�\'5�nw8��6�Ԥʇ;�rJjR���|�\r%5��t��)���&U>���$���&%@��\r�UnCIM͕i�Є�\r%5ma�ʇh]Y���PR�8*�6IMAp��6�Դ��¡MRS�\r%5m`��ph��\0�KnCIM��y�O��C�rJj�rV�,�$59���PRӆk��¡MR��:Mι\r%5m���,�$5�t# ��Vjj?�T}$5y/\Z��P+558da\r�R��¡Q�\r�Rӆ��8��¡��9���i+k:ZG�>C���<�PyNӚ�\r� �ṙá���5��f�ph��l�PtCt�nKj7��}�b��$��*�c�{-�\'7+8���{,{���R�f��ɮw�i{�없̖�>��;0��?n�;�M��:M�Z7�4��pX,�17u8��m��v���¡sS���Y\r7�����6�C3��xs~>���׷�5����&�-!O�~��������C3���gJ�{���x��|�Ќ�e�#�i��Ͽ���0_84cn)�H�&��OO[%Z8�-�x8R�f�h�gY8�-�h8���d٧X8�-�H8Ү���}<n���1�]{15��������Qݙs�c۫�F�e���RSW��HM��#���`>���9�||���);���>������Ǜ#HM���=p�R~?�zy�� R�p(�9:[C����������F��&5)-[����o//o��I~6��`R�ނ7?���E\0����I�9(��������RSC\'�f\'��;�!55t�Tj�|��΀�iu\']�h�\\T��HM�:�x�+��E�vt�)�墹sCj*q/͞RS�wR�?}����O�!5U���V��:�Ԛ(HMy�/	���wF�?�\"7����z>���2]$��)�\\B\n>���N4��Ԕ�H>�����RS/px���~| 5�á!59��JM�_�ɔ���N攚��@jj�df�I�uHM\r��@j�;�!55t��IgD�Դ���IM\nVRӺN\"5%�\r�	��8��R��T��HMHMՐ�����| 5!5U�@jBj��Ԅ��0��knHM���	��~^GjBjZ�\"@jBjZ�K@jBj�O4!5!5-�Q�����ۆԄԴ�6�&VjZjR+5�\"5�R��Bj�\0R�\0�!5��\0HMf�&RS�ܐ�����@j\Z\'7�&���I��N\"5��\r�� 5u\0RS�ܐ�j!#5!5U�@jBj��Ԅ�T��	��a2��ܐ��{\'RRS���ԄԴtE�ԄԴ4��Ԅ�T�hBjBjZ�� 5!5-�\r�	�i�mHMHMKmCjBjBjBj*ۆ�d�ÂԔ<7��=\0��l�<��t:u�R�����#�HM˻\0RSu�w��8\r��N4�)5���[;\'��r$�If�Y:˭�G���N+5�RD��}����.p�I�\"Rz˭�]�(R�,���,�V8tw��HMr���rk�Cy8��$�\r�G>�Iy8�Ԥ\n[J�Iu8�ԤGf�I�������H.5i��R�J_�KM{[vP�iw_���v��RӾ��\"5mo١��}�Hj�ز�KM[�ڗԴ�eHM��ڝ���2��m}�QjjkRӶ�v*555HM[6h�RS�Q��ԼA�����\Z���\rڻԤh�IjZ�}HM�F͑��G�7�Դ�2��m�7�Դ�K��mp 5���1Wjzx*ȗ[��>��\Zv�&��]r�G��a7�,�ȳR�����\n�ܒ�q����a�[8��~q}8�s��0+(��[4��4�,5��	�Y�ɼ\ZRf��!�h�)�:j��&�ܐ����HM�W�c�&�&��������!5��&RR�Rې����چ�4��T�?m�ԔNj��^Ҩ�fGRS���[\"ly�[�\'������_jRu�4��iݍ�ܒKMɗ�R��.ߗ&��R��#��[���ަ4������&�A�Ɛ�%8��ԗ�R�u���-�u��\0���&M>��H�[68)՘���$�Tp�=l���V,V�偣k�)�\\R��KMQp�����@j\n�#�Ԥ�R��ÑTjR�)���REɖ�:�5��R�#��唚T;�Wj�t��A�R�ApP�ApP�A�ApP�Aik���2�F�g��n�pT�\Z�QC��S�\0N+���8�����pP�ApP�1Vk*8��P3e���\0�:\'�8�X��E������g弧���!\"����J��]��ɥ���*w58��\"��E>����t~X�7�a��r�����_�4��)Jy(m��ꑣ|j�gvG��\r3lr�;���Qn��JN8�r���մ�?�74�y�*w&��-p@l\0�&�t�)QW3���)\\�O�hñ�˅����,�*��V/�/(|����K����ΗܜV������.�Zl��\"��mie�{K��p�O$�ks��c��m��/C���R��crw�C媉r�8�8�#��\n8(ࠀ�\n8(ࠀ�\n8(ࠀ����J��?\0�Ne�jG�M\0\0\0\0IEND�B`�','This parking lot is located behind the Hayden dorm building'),(2,0,10,14,'Babbio Lot',0,NULL,NULL),(3,0,10,16,'River Lot',0,NULL,NULL),(4,0,3,16,'Hayden Lot',0,NULL,NULL);
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
