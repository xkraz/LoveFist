INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_courthouse','Courthouse',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_courthouse','Courthouse',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_courthouse', 'Courthouse', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('courthouse','Courthouse')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('courthouse',0,'security','Security',20,'',''),
	('courthouse',1,'staff','Employee',20,'',''),
	('courthouse',2,'counsel','Counsel',30,'',''),
	('courthouse',3,'da','District Attorney',40,'',''),
	('courthouse',4,'boss','Judge',50,'','')
;		

