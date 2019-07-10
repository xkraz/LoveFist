SET @job_name = 'casino';
SET @society_name = 'society_casino';
SET @job_Name_Caps = 'Casino';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_casino_fridge', 'Casino (Fridge)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	(@job_name, 0, 'segurança', 'Dancer', 300, '{}', '{}'),
	(@job_name, 0, 'segurança', 'Escort', 400, '{}', '{}'),
	(@job_name, 1, 'barman', 'Bouncer', 400, '{}', '{}'),
	(@job_name, 1, 'barman', 'Transporter', 450, '{}', '{}'),
	(@job_name, 1, 'barman', 'Head of Security', 500, '{}', '{}'),
	(@job_name, 2, 'boss', 'Head of Transportation', 500, '{}', '{}')
	(@job_name, 2, 'boss', 'Head of Entertainment', 500, '{}', '{}')
	(@job_name, 2, 'boss', 'Tycoon', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('jager', 'Jägermeister', 5),
    ('vodka', 'Vodka', 5),
    ('rhum', 'Rum', 5),
    ('whisky', 'Whisky', 5),
    ('tequila', 'Tequila', 5),
    ('martini', 'White Martini', 5),
    ('soda', 'Soda', 5),
    ('jusfruit', 'Fruit Juice', 5),
    ('icetea', 'Ice Tea', 5),
    ('energy', 'Energy Drink', 5),
    ('drpepper', 'Dr. Pepper', 5),
    ('limonade', 'Lemonade', 5),
    ('saucisson', 'Sausage', 5),
    ('grapperaisin', 'Grapes', 5),
    ('golem', 'Golem', 5),
    ('whiskycoca', 'Whisky and Coke', 5),
    ('vodkaenergy', 'Vodka-energy', 5),
    ('vodkafruit', 'Fruity Vodka', 5),
    ('rhumfruit', 'Fruity Rhum', 5),
    ('rhumcoca', 'Rum and Coke', 5),
    ('mojito', 'Mojito', 5),
;
