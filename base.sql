CREATE DATABASE IF NOT EXISTS pieces;
CREATE TABLE work   (
                    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    title VARCHAR(255),
                    alt_title VARCHAR(255),
                    release_date INT,
                    ending_date INT,
                    idstudio,
                    langue,
                    categorie,
                    description VARCHAR(255));

CREATE TABLE users  (
                    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    pseudo VARCHAR(255),
                    password VARCHAR(255),
                    email VARCHAR(255),
                    birthdate INT,
                    sex VARCHAR(255),
                    idlangue
);

CREATE TABLE artist (
                    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    lastname VARCHAR(255),
                    firstname VARCAHR(255),
                    birthdate INT,
                    deathdate INT,
                    idlangue
);