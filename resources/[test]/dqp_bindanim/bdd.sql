CREATE TABLE IF NOT EXISTS `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT '{}',
  `humor` varchar(60) COLLATE utf8mb4_bin DEFAULT '{}',
  `demarche` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `pav7` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}',
  `pav8` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}',
  `pav9` varchar(150) COLLATE utf8mb4_bin DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;