INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_flightschool', 'Flight School', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('flightschool', 'LSFS')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('flightschool',0,'recruit','Recruit',120, '{}', '{}'),
	('flightschool',1,'experienced','Experienced',160, '{}', '{}'),
	('flightschool',2,'manager','Manager',200, '{}', '{}'),
	('flightschool',3,'boss','Boss',240, '{}', '{}')
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('flylic', 'Flight License')
;
