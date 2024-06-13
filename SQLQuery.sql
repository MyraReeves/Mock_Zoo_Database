CREATE DATABASE database_zoo;

USE database_zoo;

CREATE TABLE table_animalia (
    Id# INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    Animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO table_animalia
    (Animalia_type)
    VALUES
    ('Vertebrate'),
    ('Invertebrate')
;

SELECT * FROM table_animalia;


-- ----------------------------------------


CREATE TABLE table_class (
    Class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 100),
    Class_type VARCHAR(60) NOT NULL
);

INSERT INTO table_class
    (Class_type)
    VALUES
    ('Aves'),
    ('Amphibia'),
    ('Reptilia'),
    ('Mammalia'),
    ('Insecta'),
    ('Chondrichthyes'),
    ('Actinopterygii'),
    ('Scyphozoa'),
    ('Asteroidea')
;

SELECT * FROM table_class;


-- --------------------------------------

-- To permanently change the jellyfish class value to the sea anemone class value instead:
UPDATE table_class SET Class_type = 'Hexacorallia' WHERE Class_type = 'Scyphozoa';

-- Checking that it took effect:
SELECT * FROM table_class;

-- Changing it back to the way it was.  Back to jellyfish instead of sea anemones:
UPDATE table_class SET Class_type = 'Scyphozoa' WHERE Class_type = 'Hexacorallia';

-- --------------------------------------

-- To only TEMPORARILY change a value. For example, to show that Actinopterygii is the class for ray-finned fish species:
SELECT REPLACE(Class_type, 'Actinopterygii', 'Ray-finned fishes') FROM table_class;

-- Looking at the entire table to check that it took effect:
SELECT * FROM table_class;


-- --------------------------------------

-- To only show the bird row from the table:
SELECT Class_type FROM table_class WHERE Class_type = 'Aves';

-- To make the class type be displayed in all uppercase letters:
SELECT UPPER(Class_type) FROM table_class WHERE Class_type = 'Aves';

-- Count how many rows have the class type of being birds:
SELECT COUNT(Class_type) FROM table_class WHERE Class_type = 'Aves';


-- --------------------------------------------

-- Create a table for the type of diet an animal eats
CREATE TABLE table_diet_type (
	diet_id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
	diet_type VARCHAR(50) NOT NULL
);

INSERT INTO table_diet_type
    (diet_type)
    VALUES
    ('Carnivore'),
    ('Herbivore'),
    ('Omnivore')
;

SELECT * FROM table_diet_type;

-- --------------------------------------------

-- Create a table for each animal's care needs:
-- Create a table for each animal's care needs:
CREATE TABLE animal_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(150) NOT NULL,
	supervisor_id INT NOT NULL
);


INSERT INTO animal_care
	(care_id, care_type, supervisor_id)
	VALUES
	('care_001', 'replace aquarium filter', 1),
	('care_002', 'drain and refill aquarium', 1),
	('care_003', 'test water pH, ammonia, phosphate, nitrite, nitrate', 1),
	('care_004', 'bottle feed', 4),
	('care_005', 'enrichment device maintenance', 4),
	('care_006', 'clean habitat', 4),
	('care_007', 'positive reinforcement training', 4),
	('care_008', 'dental work', 3),
	('care_009', 'injections', 3),
	('care_010', 'train voluntary medical behaviors', 3),
	('care_011', 'daily weigh', 2),
	('care_012', 'monthly checkup', 4),
	('care_013', 'move to new enclosure', 5),
	('care_014', 'surgery', 3),
	('care_015', 'handle for public education', 5)
;

SELECT * FROM animal_care;

-- --------------------------------------------

-- Create a table for each animal's nutritional needs
CREATE TABLE animal_diet (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	nutrition_type VARCHAR(100) NOT NULL,
	cost MONEY NOT NULL
);


INSERT INTO animal_diet
	(nutrition_type, cost)
	VALUES
	('flash frozen fish & squid', 1500),
	('frozen shrimp', 700),
	('frozen rodents', 1600),
	('day old chicken/turkey chicks', 500),
	('live rodents and chickens', 600),
	('milk', 600),
	('seed mix', 300),
	('live crickets', 200),
	('mealworms', 200),
	('bread', 100),
	('produce', 5000),
	('ground corn', 300),
	('alfalfa hay', 300),
	('fish pellets', 100),
	('exotic feline diet', 2000),
	('frozen canid diet', 2000),
	('frozen mustelid diet', 2000),
	('omnivore biscuits', 2000),
	('herbivore biscuits', 1000),
	('primate biscuits', 2000),
	('monkey biscuits', 1000),
	('dry dog food', 500),
	('canned dog food', 100),
	('hard-boiled egg', 200),
	('bones & marrow', 400),
	('daily vitamins/medication', 5000) 
;

SELECT * FROM animal_diet;

-- --------------------------------------------

-- Create a table for each animal's habitat:
CREATE TABLE habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (55550, 1),
	habitat_type VARCHAR(50) NOT NULL,
	maintenance_cost MONEY NOT NULL
);


SELECT * FROM animal_diet;

-- --------------------------------------------

-- Create a table of zookeepers for each type of animal:
CREATE TABLE zookeepers (
	employee_id INT PRIMARY KEY NOT NULL IDENTITY (202400000,1),
	keeper_FirstName VARCHAR(100) NOT NULL,
	keeper_LastName VARCHAR(100) NOT NULL,
	keeper_Contact VARCHAR(20) NOT NULL
);


SELECT * FROM zookeepers;
-- --------------------------------------------
