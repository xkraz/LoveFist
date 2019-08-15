CREATE TABLE `medical_records` (
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `injury` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `treatment` varchar(255) NOT NULL,
  `perscription` varchar(255) NOT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
