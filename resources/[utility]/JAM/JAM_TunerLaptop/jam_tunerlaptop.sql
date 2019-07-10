ALTER TABLE `owned_vehicles`
	ADD `jamboost` FLOAT NOT NULL DEFAULT '1'
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('jamtunerlaptop','Tuner Laptop', 1)
;

INSERT INTO `shops` (store, item, price) VALUES
	('TwentyFourSeven','jamtunerlaptop', 15000),
	('RobsLiquor','jamtunerlaptop', 15000),
	('LTDgasoline','jamtunerlaptop', 15000)
;