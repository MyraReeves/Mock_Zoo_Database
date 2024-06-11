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



CREATE TABLE table_class (
    class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
    class_type VARCHAR(60) NOT NULL
);

