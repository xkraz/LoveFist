USE `essentialmode`;


INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('repairkit', 'Repairkit', 3, 0, 1)
;
INSERT INTO `shops` (`store`, `item`, `price`) VALUES
('TwentyFourSeven', 'repairkit', 5000),
('LTDgasoline', 'repairkit', 5000),
('RobsLiquor', 'repairkit', 5000)
;
