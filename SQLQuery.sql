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

-- Create a table for an animal's Order within its taxonomy
CREATE TABLE table_Order (
	Order_id INT PRIMARY KEY NOT NULL IDENTITY (10, 10),
	Order_type VARCHAR(50) NOT NULL
);



SELECT * FROM table_Order;

-- --------------------------------------------

-- Create a table for each animal's care needs:
CREATE TABLE animal_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	supervisor_id INT NOT NULL
);


SELECT * FROM animal_care;

-- --------------------------------------------

-- Create a table for each animal's nutritional needs
CREATE TABLE animal_diet (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (1000, 1000),
	nutrition_type VARCHAR(50) NOT NULL,
	delivery_cost MONEY NOT NULL
);



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
