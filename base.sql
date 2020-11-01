CREATE DATABASE IF NOT EXISTS pieces;

CREATE TABLE work       (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        title VARCHAR(255),
                        alt_title VARCHAR(255),
                        release_date INT,
                        ending_date INT,
                        studio,
                        idlangue,
                        categorie,
                        description VARCHAR(255));

CREATE TABLE anime      (
                        id.oeuvre,
                        nbr_total_ep INT NOT NULL,
                        nbr_released_ep INT AUTO_INCREMENT
);

CREATE TABLE film       (
                        id.oeuvre,
                        duration INT NOT NULL
);

CREATE TABLE manga      (
                        id.oeuvre,
                        nbr_tome INT AUTO_INCREMENT,
                        nbr_chap INT AUTO_INCREMENT
);

CREATE TABLE users      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        pseudo VARCHAR(255),
                        password VARCHAR(255),
                        email VARCHAR(255),
                        birthdate INT,
                        sex VARCHAR(255),
                        idlangue
);

CREATE TABLE artist     (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        lastname VARCHAR(255),
                        firstname VARCAHR(255),
                        birthdate INT,
                        deathdate INT,
                        sex VARCHAR(255),
                        idlangue
);

CREATE TABLE episode    (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        id.anime,
                        title VARCHAR(255),
                        nbr_episode INT,
                        id.langue
);

CREATE TABLE chapitre   (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        id.manga,
                        title VARCHAR(255),
                        nbr_chapitre INT,
                        id.manga,
                        id.langue
);

CREATE TABLE langue     (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nom VARCHAR(255)
);

CREATE TABLE genre      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        libelle VARCHAR(255)
);

CREATE TABLE theme      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        libelle VARCHAR(255)
);

CREATE TABLE note       (
                        id.oeuvre,
                        id.user,
                        note INT 
);