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

-- To only show the one bird row from the table:
SELECT Class_type FROM table_class WHERE Class_type = 'Aves';

-- To make the class type be displayed in all uppercase letters:
SELECT UPPER(Class_type) FROM table_class WHERE Class_type = 'Aves';

-- Count how many rows have the class type of being birds:
SELECT COUNT(Class_type) FROM table_class WHERE Class_type = 'Aves';


-- ---------------------------------------


CREATE TABLE table_employees (
    Employee_id# INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Contact_Phone VARCHAR(20) NOT NULL
);

INSERT INTO table_employees
    (First_Name, Last_Name, Contact_Phone)
    VALUES
    ('John', 'Smith', '555-345-5768'),
    ('Mary', 'White', '555-655-5203'),
    ('Jenny', 'Tutone', '555-867-5309'),
    ('Jeremy', 'Pi', '555-314-1592'),
    ('Constance', 'Euler', '555-577-2156'),
    ('Golden', 'Ratio', '555-161-8033')
;

-- To check that the table looks correct:
SELECT * FROM table_employees;



-- To show only the names of the first three employees on the list:
SELECT First_Name, Last_Name FROM table_employees WHERE Employee_id# BETWEEN 10000 AND 10002;

-- To show all 3 columns of the last two employees on the list:
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Employee_id# BETWEEN 10004 AND 10005;

-- To show all of the information for any employee whose last name begins with the letters "Eu":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE 'Eu%';

-- To show all the information for any employee whose last name has the SECOND letter of "u":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE '_u%';

-- -- To show all the information for any employee whose last name ENDS in the letter "e":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE '_%e';
-- -------------------------------------------------------------------------------------------------

-- To change the value of the First Name column where the person's first name is John:
UPDATE table_employees SET First_Name = 'Matt' WHERE First_Name = 'John';

-- Check that the change took place:
SELECT * FROM table_employees;

-- Show all the information for any employee whose first name begins with M, and the last names are in alphabetical order (default):
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE First_Name LIKE 'm%' ORDER BY Last_Name;

-- Or the M names in descending alphabetical order of last names:
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE First_Name LIKE 'm%' ORDER BY Last_Name DESC;

-- ------------------------------------------------------------------------------------------------
