CREATE DATABASE IF NOT EXISTS Pieces;

CREATE TABLE work       (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        title VARCHAR(255) NOT NULL,
                        alt_title VARCHAR(255),
                        category ENUM('Kodomo',, 'Shonen', 'Shojo', 'Seinen', 'Josei', 'Seijin', 'Webcomic', 'Hentai'),
                        description VARCHAR(255),
                        id_language INT NOT NULL,
                        FOREIGN KEY (id_language) REFERENCES language (id)
);

CREATE TABLE anime      (
                        id_work INT PRIMARY KEY,
                        release_date DATE NOT NULL,
                        ending_date DATE,
                        studio ENUM('Toei Animation', 'Kyoto Animation') NOT NULL,
                        nbr_total_ep INT NOT NULL,
                        FOREIGN KEY(id_work) REFERENCES work (id)
);

CREATE TABLE movie       (
                        id_work INT PRIMARY KEY,
                        release_date DATE NOT NULL,
                        studio ENUM('Studio Ghibli') NOT NULL,
                        duration INT NOT NULL,
                        FOREIGN KEY(id_work) REFERENCES work (id)
);

CREATE TABLE manga      (
                        id_work INT PRIMARY KEY,
                        release_date DATE NOT NULL,
                        ending_date DATE,
                        studio ENUM('Shueisha', 'D&C Media, Kakao') NOT NULL,
                        nbr_volume INT NOT NULL,
                        nbr_chap INT NOT NULL,
                        FOREIGN KEY(id_work) REFERENCES work (id)
);

CREATE TABLE users      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nickname VARCHAR(255) NOT NULL,
                        password VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL,
                        birthdate INT,
                        gender VARCHAR(255),
                        id_language INT,
                        FOREIGN KEY (id_language) REFERENCES language (id)
);

CREATE TABLE artist     (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        lastname VARCHAR(255) NOT NULL,
                        firstname VARCHAR(255) NOT NULL,
                        birthdate INT,
                        deathdate INT,
                        gender VARCHAR(255),
                        id_language INT NOT NULL,
                        FOREIGN KEY (id_language) REFERENCES language (id)
);

CREATE TABLE episode    (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nbr_episode INT NOT NULL,
                        title VARCHAR(255) NOT NULL,
                        id_language INT NOT NULL,
                        id_anime INT NOT NULL, 
                        FOREIGN KEY (id_language) REFERENCES language (id),
                        FOREIGN KEY (id_anime) REFERENCES anime (id)
);

CREATE TABLE chapter   (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nbr_chapter INT NOT NULL,
                        title VARCHAR(255) NOT NULL,
                        id_manga INT NOT NULL,
                        id_language INT NOT NULL,
                        FOREIGN KEY (id_language) REFERENCES language (id),
                        FOREIGN KEY (id_manga) REFERENCES manga (id)
);

CREATE TABLE language     (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        name VARCHAR(255) NOT NULL
);

CREATE TABLE genre      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        label VARCHAR(255) NOT NULL
);

CREATE TABLE theme      (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        label VARCHAR(255) NOT NULL
);

CREATE TABLE rating       (
                        id_work INT NOT NULL,
                        id_user INT NOT NULL,
                        rating INT NOT NULL /*limité à 10*/,
                        PRIMARY KEY (id_work, id_user),
                        FOREIGN KEY (id_work) REFERENCES work (id),
                        FOREIGN KEY (id_user) REFERENCES users (id)

);
CREATE TABLE genreWork	(
						id_work INT NOT NULL,
						id_genre INT NOT NULL,
						PRIMARY KEY (id_work, id_genre),
						FOREIGN KEY (id_work) REFERENCES work (id),
						FOREIGN KEY (id_genre) REFERENCES genre (id)
);

CREATE TABLE themeWork	(
						id_work INT NOT NULL,
						id_theme INT NOT NULL,
						PRIMARY KEY (id_work, id_theme),
						FOREIGN KEY (id_work) REFERENCES work (id),
						FOREIGN KEY (id_theme) REFERENCES theme (id)
);
CREATE TABLE technicalDatasheet	(
								id_work INT NOT NULL,
								id_artist INT NOT NULL,
								occupation ENUM('occ1', 'occ2', 'occ3') NOT NULL,
								PRIMARY KEY (id_work, id_artist),
								FOREIGN KEY (id_work) REFERENCES work (id),
								FOREIGN KEY (id_artist) REFERENCES artist (id)
);
