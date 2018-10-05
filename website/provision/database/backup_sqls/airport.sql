-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: embraer
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(120) NOT NULL DEFAULT '',
  `name` char(120) NOT NULL DEFAULT '',
  `location_id` int(11) unsigned NOT NULL,
  `lat` char(25) NOT NULL DEFAULT '',
  `lng` char(25) NOT NULL DEFAULT '',
  `address` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'ala','ala-uaaa-almaty',1,'43.35','77.0333','Almaty, Kazakhstan'),(2,'dfw','dfw-dallas-ft-worth-in',2,'32.8833','-97.0333','Grapevine, TX, USA'),(3,'pek','pek-zbaa-capital-apt',3,'40.0666','116.6','Beijing, China'),(4,'dxb','dxb-omdb-dubai-intl',4,'25.25','55.35','Dubai - United Arab Emirates'),(5,'gru','gru-sbgr-guarulhos-gov-and',5,'-23.4333','-46.4666','Guarulhos, State of São Paulo, Brazil'),(6,'per','per-ypph-perth-intl',6,'-31.9333','115.95','Redcliffe WA 6104, Australia'),(7,'txl','txl-eddt-tegel',7,'52.5666','13.3','Berlin, Germany'),(8,'hkg','hkg-vhhh-hong-kong-intl',8,'22.3','113.9','Hong Kong'),(9,'pvg','pvg-zspd-pudong-apt',9,'31.15','121.8','Shanghai, China'),(10,'ltn','ltn-eggw-luton',10,'51.8666','-0.35','Chiltern Green Rd, Luton LU2, UK'),(11,'hla','hla-fala-lanseria-intl',11,'-25.9333','27.9166','Ashenti Rd, South Africa'),(12,'scl','scl-scel-arturo-merino-beni',12,'-33.3833','-70.783','Pudahuel, Santiago Metropolitan Region, Chile'),(13,'gva','gva-lsgg-geneva',13,'46.2333','6.1166','Grand-Saconnex, Switzerland'),(14,'hnd','hnd-rjtt-tokyo-haneda-int',14,'35.55','139.7666','Ōta, Tokyo, Japan'),(15,'sin','sin-wsss-changi',15,'1.35','103.9833','Singapore'),(16,'ist','ist-ltba-ataturk',16,'40.9666','28.8','Istanbul, Turkey'),(17,'hpn','hpn-khpn-westchester-co',17,'41.0666','-73.7','Greenwich, CT, USA'),(18,'syd','syd-yssy-kingsford-smith-in',18,'-33.9333','151.1666','Mascot NSW 2020, Australia'),(19,'vko','vko-uuww-vnukovo',19,'55.6','37.2833','Vnukovo, Moscow, Russia'),(20,'lax','lax-los-angeles-intl',20,'33.9333','-118.4','Los Angeles, CA, USA'),(21,'tlc','tlc-mmto-lic-adolfo-lopez-m',21,'19.3333','-99.55','Plan de Ayala, La Constitución Totoltepec, Méx., Mexico'),(22,'abv','abv-dnaa-nnamdi-azikiwe-int',22,'9','7.25','Abuja, Nigeria'),(23,'mia','mia-miami-intl',23,'25.7833','-80.2833','5523-5699 Blue Lagoon Dr, Miami, FL 33126, USA'),(25,'bom','bom-vabb-chhatrapati-shivaj',25,'19.0833','72.8666','Mumbai, Maharashtra, India'),(26,'ord','ord-chicago-o-hare-int',26,'41.9666','-87.9','Chicago, IL, USA'),(174,'hkt','hkt-vtsp-phuket-intl',174,'8.0997','98.2997','Sa Khu, Thalang District, Phuket 83110, Thailand'),(182,'fco','fco-lirf-fiumicino',182,'41.7997','12.25','00054 Fiumicino, Metropolitan City of Rome, Italy'),(190,'las','las-klas-mc-carran-intl',190,'36.0666','-115.15','Paradise, NV, USA'),(197,'yyz','yyz-cyyz-toronto-pearson-in',197,'43.6663','-79.6163','Mississauga, ON, Canada'),(204,'lbg','lbg-lfpb-le-bourget',204,'48.9666','2.4333','Bonneuil-en-France, France'),(211,'var','var-lbwn-varna',211,'43.2333','27.8166','2, 9154 Varna, Bulgaria'),(212,'ruh','ruh-oerk-king-khaled-intl',212,'24.9663','46.7166','Riyadh Saudi Arabia'),(213,'hnl','hnl-phnl-honolulu-intl',213,'21.3166','-157.9163','Honolulu, HI, USA'),(214,'cph','cph-ekch-kastrup',214,'55.6','12.6333','2791 Dragør, Denmark'),(215,'cgk','cgk-wiii-soekarno-hatta-int',215,'-6.1163','106.65','Tangerang, Tangerang City, Banten, Indonesia'),(216,'akl','akl-nzaa-auckland-intl',216,'-37','174.783','Auckland, New Zealand'),(217,'agr','agr-viag-agra-ab',217,'27.1497','77.95','Agra, Uttar Pradesh, India'),(260,'edi','edi-egph-edinburgh',260,'55.95','-3.35','Ingliston, UK'),(267,'wlg','wlg-nzwn-wellington-intl',267,'-41.3166','174.8','Wellington, New Zealand'),(274,'dub','dub-eidw-dublin-intl',274,'53.4163','-6.25','Old Airport Rd, Co. Dublin, Ireland'),(281,'han','han-vvnb-noi-bai-intl',281,'21.2163','105.7997','AH14, Phú Cường, Sóc Sơn, Hà Nội, Vietnam'),(288,'lxr','lxr-helx-luxor-intl',288,'25.6666','32.7','Rd Lead to Oksor Airport, Egypt'),(295,'mel','mel-ymml-melbourne-intl',295,'-37.6663','144.8333','Melbourne Airport VIC 3045, Australia'),(302,'mnl','mnl-rpll-ninoy-aquino-intl',302,'14.5','121.0163','Parañaque, Metro Manila, Philippines'),(309,'pnh','pnh-vdpp-phnom-penh-intl',309,'11.55','104.8497','Phnom Penh, Cambodia'),(316,'zrh','zrh-lszh-zurich',316,'47.4666','8.55','Rümlang, Switzerland'),(323,'ath','ath-lgav-eleftherios-venize',323,'37.8833','23.7163','Leof. Posidonos, Elliniko 167 77, Greece'),(330,'bud','bud-lhbp-liszt-ferenc-intl',330,'47.433','19.2663','Vecsés, 2220 Hungary'),(337,'cpt','cpt-fact-cape-town-intl',337,'-33.95','18.6','Cape Town, South Africa'),(344,'del','del-vidp-indira-gandhi-intl',344,'28.5666','77.0997','New Delhi, Delhi, India'),(351,'jrs','jrs-lljr-jerusalem',351,'31.9982458','34.7989687','Holon, Israel'),(358,'led','led-ulli-pulkovo',358,'59.7997','30.2663','St Petersburg, Russia'),(365,'lim','lim-spim-jorge-chavez-intl',365,'-12.0166','-77.0997','Callao District, Peru'),(372,'mad','mad-lemd-barajas',372,'40.4666','-3.55','Madrid, Spain'),(379,'muc','muc-eddm-munich',379,'48.35','11.7833','München-Flughafen, Germany'),(386,'prg','prg-lkpr-ruzyne',386,'50.1','14.25','253 01 Hostivice, Czechia'),(393,'sea','sea-ksea-seattle-tacoma-int',393,'47.433','-122.2997','SeaTac, WA, USA'),(400,'sfo','sfo-ksfo-san-francisco-intl',400,'37.6166','-122.3663','2-198;1-99 Old Bayshore Hwy, Millbrae, CA 94030, USA'),(407,'vie','vie-loww-schwechat',407,'48.1','16.5163','Unnamed Road, 2320, Austria'),(414,'yul','yul-cyul-montreal-pierre-el',414,'45.4666','-73.7333','Dorval, QC, Canada'),(421,'yvr','yvr-cyvr-vancouver-intl',421,'49.183','-123.1833','Richmond, BC, Canada'),(428,'ayt','ayt-ltai-antalya',428,'36.8833','30.7833','Yenigöl Mahallesi, Havaalanı Cd. No:327, 07200 Muratpaşa/Antalya, Turkey'),(435,'bog','bog-skbo-eldorado-intl',435,'4.7','-74.1333','Bogotá, Bogota, Colombia'),(442,'jnb','jnb-fajs-o-r-tambo-intl',442,'-26.1166','28.2333','Kempton Park, South Africa'),(449,'lis','lis-lppt-lisbon',449,'38.783','-9.133','Lisbon, Portugal'),(463,'bkk','bkk-vtbs-suvarnabhumi-intl',463,'13.6808','100.7472','Nong Prue, Bang Phli, Samut Prakan 10540, Thailand'),(470,'cun','cun-mmun-cancun-intl',470,'21.0333','-86.8663','QROO 180 7825, Quintana Roo, Mexico'),(477,'kul','kul-wmkk-kuala-lumpur-intl',477,'2.7333','101.6833','Jalan Pekeliling, 43900, Selangor, Malaysia'),(484,'sgn','sgn-vvts-tansonnhat',484,'10.8166','106.65','Ho Chi Minh City, Ho Chi Minh, Vietnam'),(491,'ssh','ssh-hesh-sharm-el-sheikh-in',491,'27.9663','34.3833','Sharm El-Sheikh, Qesm Sharm Ash Sheikh, South Sinai Governorate, Egypt'),(498,'hrb','hrb-zyhb-taiping-apt',498,'45.6233','126.2502','Harbin, Heilongjiang, China'),(505,'anc','anc-panc-stevens-anchorage',505,'61.1663','-149.983','Anchorage, AK, USA'),(512,'atl','atl-katl-hartsfield-jacks',512,'33.6333','-84.4166','Nlvr SE, Atlanta, GA 30337, USA'),(519,'mlb','mlb-kmlb-melbourne-intl',519,'28.1','-80.6333','Melbourne, FL, USA'),(526,'mle','mle-vrmm-ibrahim-nasir-intl',526,'4.1916','73.5288','Malé, Maldives'),(533,'ome','ome-paom-nome',533,'64.5','-165.4333','Nome, AK, USA'),(540,'pkc','pkc-uhpp-yelizovo',540,'53.183','158.4','Yelizovo, Kamchatka Krai, Russia'),(547,'rkv','rkv-birk-reykjavik',547,'64.1163','-21.9333','Vesturvör 20, Kópavogur, Iceland'),(554,'scf','scf-ksdl-scottsdale',554,'33.6166','-111.9','Scottsdale, AZ, USA'),(561,'stl','stl-kstl-lambert-st-louis-i',561,'38.7333','-90.3497','Berkeley, MO, USA'),(568,'uak','uak-bgbw-narsarsuaq',568,'61.1497','-45.4163','Unnamed Road, Narssarssuaq, Greenland'),(575,'urc','urc-zwww-diwobao-apt',575,'43.9072','87.4738','Urumqi, Xinjiang, China'),(582,'yqx','yqx-cyqx-gander-intl',582,'48.933','-54.5497','Gander, NL, Canada'),(589,'sju','sju-tjsj-luis-munoz-marin-i',589,'18.4333','-66','Carolina, Puerto Rico'),(590,'fll','fll-kfll-ft-lauderdale-holl',590,'26.0663','-80.15','S Perimeter Rd, Dania Beach, FL 33004, USA'),(591,'bhm','bhm-kbhm-birmingham-shuttle',591,'33.5497','-86.75','Birmingham, AL, USA'),(592,'msy','msy-kmsy-armstrong-new-orle',592,'29.9833','-90.25','Kenner, LA, USA'),(615,'gye','gye-segu-jose-joaquin-de-ol',615,'-2.1497','-79.8663','Samborondon, Ecuador');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 13:32:40
