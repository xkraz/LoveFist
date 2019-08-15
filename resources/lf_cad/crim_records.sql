CREATE TABLE `criminal_records` (
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `charges` varchar(255) NOT NULL,
  `fine` varchar(255) NOT NULL,
  `sentence` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `issued` varchar(255) NOT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
