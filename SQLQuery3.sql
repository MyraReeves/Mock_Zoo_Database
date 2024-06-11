CREATE DATABASE database_zoo;

USE database_zoo;

CREATE TABLE table_animalia (
    animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    animalia_type VARCHAR(100) NOT NULL
);