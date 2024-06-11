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


