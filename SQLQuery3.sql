CREATE DATABASE database_zoo;

USE database_zoo;

CREATE TABLE table_animalia (
    animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO table_animalia
    (animalia_type)
    VALUES
    ('Vertebrate'),
    ('Invertebrate')
;

SELECT * FROM table_animalia;


-- ----------------------------------------


CREATE TABLE table_class (
    class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 100),
    class_type VARCHAR(60) NOT NULL
);

INSERT INTO table_class
    (class_type)
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
UPDATE table_class SET class_type = 'Hexacorallia' WHERE class_type = 'Scyphozoa';

-- Checking that it took effect:
SELECT * FROM table_class;

-- Changing it back to the way it was.  Back to jellyfish instead of sea anemones:
UPDATE table_class SET class_type = 'Scyphozoa' WHERE class_type = 'Hexacorallia';

-- --------------------------------------

-- To only TEMPORARILY change a value. For example, to show that Actinopterygii is the class for ray-finned fish species:
SELECT REPLACE(class_type, 'Actinopterygii', 'Ray-finned fishes') FROM table_class;

-- Looking at the entire table to check that it took effect:
SELECT * FROM table_class;


-- --------------------------------------

-- To only show the one bird row from the table:
SELECT class_type FROM table_class WHERE class_type = 'Aves';

-- To make the class type be displayed in all uppercase letters:
SELECT UPPER(class_type) FROM table_class WHERE class_type = 'Aves';

-- Count how many rows have the class type of being birds:
SELECT COUNT(class_type) FROM table_class WHERE class_type = 'Aves';


-- ---------------------------------------


CREATE TABLE table_employees (
    employee_id INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
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
SELECT First_Name, Last_Name FROM table_employees WHERE employee_id BETWEEN 10000 AND 10002;

-- To show all 3 columns of the last two employees on the list:
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE employee_id BETWEEN 10004 AND 10005;

-- To show all of the information for any employee whose last name begins with the letters "Eu":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE 'Eu%';


