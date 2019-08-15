CREATE TABLE `criminal_warrants` (
  `firstname` varchar(255) NOT NULL DEFAULT '0',
  `lastname` varchar(255) NOT NULL DEFAULT '0',
  `gender` varchar(255) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '0',
  `seen` varchar(255) NOT NULL DEFAULT '0',
  `datee` varchar(255) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
