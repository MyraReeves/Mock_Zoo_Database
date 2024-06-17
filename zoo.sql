CREATE DATABASE database_zoo;

USE database_zoo;

CREATE TABLE table_animalia (
    animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    phylum VARCHAR(50) NOT NULL
);

INSERT INTO table_animalia
    (phylum)
    VALUES
    ('Arthropoda'),
    ('Chordata'),
	('Cnidaria'),
	('Echinodermata')
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




/* --------------------------------------------
    Create a table for the type of diet an animal eats
-------------------------------------------- */

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



/* ---------------------------------------------
    Create a table for each animal's care needs:
--------------------------------------------- */

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




/* ----------------------------------------------------
     Create a table for each animal's nutritional needs
---------------------------------------------------- */

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




/* ------------------------------------------
	Create a table for each animal's habitat:
------------------------------------------ */

CREATE TABLE habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (55550, 1),
	habitat_type VARCHAR(50) NOT NULL,
	maintenance_cost MONEY NOT NULL
);

INSERT INTO habitat
	(habitat_type, maintenance_cost)
	VALUES
	('primate exhibits', 4000),
	('brown bear exhibit', 4000),
	('African savannah', 5000),
	('gray wolf exhibit', 2000),
	('otter exhibit', 10000),
	('coyote exhibit', 2000),
	('kangaroo habitat', 50000),
	('sloth habitat', 200),
	('aquariums', 500000),
    ('touch pools', 100000),
	('walk-thru aviaries', 10000),
	('bird of prey exhibits', 1000),
	('bat habitat', 200),
	('komodo dragon habitats', 300),
	('tortoise habitat', 200),
	('python habitat', 1000),
	('meerkat exhibit', 2000),
	('hippo pool', 100000),
	('rhino exhibit', 100000),
	('tapir exhibit', 300),
	('warthog exhibit', 200),
	('lion exhibit', 4000),
	('giraffe barn', 100000),
	('camel exhibit', 200),
	('elk exhibit', 200),
	('spider monkey exhibit', 6000),
	('tiger exhibit', 4000),
	('lemurs', 100),
	('insect house', 500),
	('butterfly greenhouse', 2000),
	('petting zoo', 1000)
;

SELECT * FROM habitat;


/* -------------------------------------------------
	Insert a tropical forest building into the list:
------------------------------------------------- */
INSERT INTO habitat (habitat_type, maintenance_cost)
VALUES ('tropical forest building', 100000);




/* -----------------------------------------------------
	Create a table for the curators of each animal area:
----------------------------------------------------- */

CREATE TABLE animal_curators (
	employee_id INT PRIMARY KEY NOT NULL IDENTITY (202400000,1),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Contact VARCHAR(20) NOT NULL
);

INSERT INTO animal_curators
	(FirstName, LastName, Contact)
	VALUES
	('Margaret', 'Nguyen', '555-576-2899'),
	('Mary', 'Fischer', '555-784-4856'),
	('Arnold', 'Budinich', '555-475-3944'),
	('Denise', 'LaBonia', '555-891-5853'),
	('Kimberly', 'Rose', '555-485-4855'),
	('Damien', 'Ferrerro', '555-288-3749')
;

SELECT * FROM animal_curators;



/* -------------------------------------------------------------------------
	Create a table for each individual animal, refencing the earlier tables:
------------------------------------------------------------------------- */

CREATE TABLE animal_collection (
	id# VARCHAR(50) PRIMARY KEY NOT NULL,
	animal VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	phylum INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES table_animalia (animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	taxonomy_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES table_class (class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES habitat (habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	diet_type INT NOT NULL CONSTRAINT fk_diet_id FOREIGN KEY REFERENCES table_diet_type (diet_id) ON UPDATE CASCADE ON DELETE CASCADE,
	commissary_id INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES animal_diet (nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	additional_commissary INT CONSTRAINT fk_nutrition_id_additional FOREIGN KEY REFERENCES animal_diet (nutrition_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	seasonal_diet_supplement INT CONSTRAINT fk_nutrition_id_seasonal FOREIGN KEY REFERENCES animal_diet (nutrition_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	care_needed VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES animal_care (care_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO animal_collection
	(id#, animal, sex, phylum, taxonomy_class, habitat, diet_type, commissary_id, additional_commissary, seasonal_diet_supplement, care_needed)
	VALUES
	('Arctos20220925', 'brown bear - Hope', 'F', 2, 400, 51, 3, 117, 110, 109, 'care_010'),
	('Arctos20220926', 'brown bear - Dexter', 'M', 2, 400, 51, 3, 117, 110, 100, 'care_010'),
	('PaOnca20210609', 'jaguar - Pantanal', 'F', 2, 400, 82, 1, 114, 124, 102, 'care_006'),
-- Table still needs to be completed
	('PanLeo20200214', 'lion - Bruno', 'M', 2, 400, 71, 1, 114, 124, 102, 'care_006')	
;

SELECT * FROM animal_collection;




/* --------------------------------------------------------------------------------------
	Joining the animal diets and animal collection tables together using explicit syntax:
-------------------------------------------------------------------------------------- */
SELECT * FROM animal_diet 
INNER JOIN animal_collection 
ON animal_collection.commissary_id = animal_diet.nutrition_id;


/* ------------------------------------------------------------------------
	Same result using implicit syntax (NOT considered to be good practice):
------------------------------------------------------------------------ */
SELECT animal_diet.*, animal_collection.* 
FROM animal_diet, animal_collection
WHERE animal_diet.nutrition_id = animal_collection.commissary_id




/* ------------------------------------------------------
	Displaying all information for one individual animal:
------------------------------------------------------ */
SELECT
	animals.animal, 
	z1.phylum,
	z2.class_type,
	z3.habitat_type AS 'location',
	z4.diet_type,
	z5.nutrition_type AS 'diet',
	z6.nutrition_type AS 'additional diet',
	z7.nutrition_type AS 'seasonal supplement',
	z8.care_type AS 'care needed'

	FROM animal_collection AS animals
	INNER JOIN table_animalia AS z1 ON z1.animalia_id = animals.phylum
	INNER JOIN table_class AS z2 ON z2.class_id = animals.taxonomy_class
	INNER JOIN habitat AS z3 ON z3.habitat_id = animals.habitat
	INNER JOIN table_diet_type AS z4 ON z4.diet_id = animals.diet_type
	INNER JOIN animal_diet AS z5 ON z5.nutrition_id = animals.commissary_id
	INNER JOIN animal_diet z6 ON z6.nutrition_id = animals.additional_commissary
	INNER JOIN animal_diet z7 ON z7.nutrition_id = animals.seasonal_diet_supplement
	INNER JOIN animal_care AS z8 ON z8.care_id = animals.care_needed
	WHERE animal = 'brown bear - Dexter'    -- Modify this line to be whichever desired individual
;


/* --------------------------------------------------------------------
	Displaying cost of habitats & diets for keeping a specific species:
-------------------------------------------------------------------- */
SELECT
	animals.animal AS 'species', 
	a1.habitat_type, a1.maintenance_cost,
	a2.nutrition_type, a2.cost,
	a3.nutrition_type, a3.cost,
	a4.nutrition_type AS 'OPTIONAL seasonal supplement', a4.cost AS 'cost of optional supplement'

	FROM animal_collection AS animals
	INNER JOIN habitat AS a1 ON a1.habitat_id = animals.habitat
	INNER JOIN animal_diet AS a2 ON a2.nutrition_id = animals.diet_type
	INNER JOIN animal_diet AS a3 ON a3.nutrition_id = animals.additional_commissary
	INNER JOIN animal_diet AS a4 ON a4.nutrition_id = animals.seasonal_diet_supplement
	WHERE animal = 'jaguar - Pantanal' -- Modify this line to view the cost of a different species
;



/* ----------------------------------------------------------------
	Displaying SUMS of cost of habitats & diets for ALL of the zoo:
---------------------------------------------------------------- */
DECLARE @totalCost_Exhibits MONEY;
DECLARE @totalCost_Diets MONEY;

DECLARE @animalsCost_Sum MONEY;

SET @totalCost_Exhibits = (SELECT SUM(maintenance_cost) FROM habitat);
SET @totalCost_Diets = (SELECT SUM(cost) FROM animal_diet);
SET @animalsCost_Sum = (@totalCost_Exhibits + @totalCost_Diets);

PRINT (
																-- Convert the monetary sums into a string to be displayed
	'Montly maintenance cost of all exhibits:' + CHAR(9) + '$ ' + CONVERT(VARCHAR(20), @totalCost_Exhibits) + CHAR(13) +
	'Monthly total animal food ordering cost:' + CHAR(9) + '$ ' + CONVERT(VARCHAR(20), @totalCost_Diets) + CHAR(13) +
	'________________________________________________________________' + CHAR(13) +
	'Total monthly budget for housing & feeding our animal collection:' + CHAR(13) +
	'$ ' + CONVERT(VARCHAR(50), @animalsCost_Sum)
)
