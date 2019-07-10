INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_lawyer','Lawyer',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_lawyer','Lawyer',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_lawyer', 'Lawyer', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('lawyer','Lawyer')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lawyer',0,'associate','Associate',20,'',''),
	('lawyer',1,'lawyer','Lawyer',20,'',''),
	('lawyer',2,'snrpartner','Senior Partner',30,'',''),
	('lawyer',3,'snrpartner','Managing Partner',40,'',''),
	('lawyer',4,'boss','Named Partner',50,'','')
;		

