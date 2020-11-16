USE 'pieces';

CREATE TABLE work       (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        title VARCHAR(255) NOT NULL,
                        alt_title VARCHAR(255),
                        category ENUM('Kodomo', 'Shonen', 'Shojo', 'Seinen', 'Josei', 'Seijin', 'Webcomic', 'Hentai', 'Unknown'),
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
                        gender ENUM('male', 'female', 'unknown'),
                        id_language INT,
                        FOREIGN KEY (id_language) REFERENCES language (id)
);

CREATE TABLE artist     (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        lastname VARCHAR(255) NOT NULL,
                        firstname VARCHAR(255) NOT NULL,
                        gender ENUM('male', 'female', 'unknown'),
                        id_language INT NOT NULL,
                        FOREIGN KEY (id_language) REFERENCES language (id)
);

CREATE TABLE episode    (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nbr_episode INT NOT NULL,
                        title VARCHAR(255),
                        id_language INT NOT NULL,
                        id_anime INT NOT NULL, 
                        FOREIGN KEY (id_language) REFERENCES language (id),
                        FOREIGN KEY (id_anime) REFERENCES anime (id)
);

CREATE TABLE chapter   (
                        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        nbr_chapter INT NOT NULL,
                        title VARCHAR(255),
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
				occupation ENUM('Author', 'Scriptwriter', 'Designer', 'Director', 'Character Designer', 'Music') NOT NULL,
				PRIMARY KEY (id_work, id_artist, occupation),
				FOREIGN KEY (id_work) REFERENCES work (id),
				FOREIGN KEY (id_artist) REFERENCES artist (id)
);

INSERT INTO language(name) VALUES ('Arabic'), ('Bengali'), ('Bulgarian'), ('Burmese'), ('Catalan'), ('Chinese(Simp)'), ('Chinese(Hong-Kong)'), ('Czech'), ('Danish'), ('Dutch'), ('English'), ('Filipino'), ('Finnish'), ('French'), ('German'), ('Greek'), ('Hebrew'), ('Hindi'), ('Hungarian'), ('Indonesian'), ('Italian'), ('Japanese'), ('Korean'), ('Lithuanian'), ('Malay'), ('Mongolian'), ('Norwegian'), ('Other'), ('Persian'), ('Polish'), ('Portuguese(BR)'), ('Portuguese(PT)'), ('Romanian'), ('Russian'), ('Serbo-Russian'), ('Spanish(ES)'), ('Spanish(LATAM)'), ('Swedish'), ('Thai'), ('Turkish'), ('Ukrainian'), ('Vietnamese');

INSERT INTO work (title, alt_title, category, description, id_language)
VALUES 
('となりのトトロ', 'Tonari no Totoro, Mon Voisin Totoro', 'Unknown', 'Un professeur d\'université, M. Kusakabe, et ses deux filles, Satsuki, onze ans, et Mei, cinq ans, s\'installent dans leur nouvelle maison à la campagne. Celle-ci est proche de l\'hôpital où sa femme est hospitalisée. Explorant les alentours, Mei rencontre Totoro, sorte de créature gigantesque et maître de la forêt. Cet étonnant personnage est accompagné de deux de ses semblables, bien qu\'ils soient de moindres tailles : le plus petit est blanc et le moyen est bleu. Dès lors, Mei n\'a de cesse de rechercher Totoro et de passer du temps en sa compagnie. Elle découvrira notamment les divers et impressionnants pouvoirs de son nouveau compagnon, ainsi que son entourage pour le moins singulier...', 3),
('Howl\'s Moving Castle / ハウルの動く城', 'Le Château Ambulant / Hauru no Ugoku Shiro', 'Unknown', '', 22),
('Clannad', 'クラナド', 'Shojo', 'Tomoya Okasaki est en troisième année au lycée et est considéré comme délinquant. Tout semble immuable dans sa vie de lycéen jusqu\'à ce qu\'il rencontre Nagisa et, dès lors, la vie de Tomoya parut changer. Il commence à rêver d\'un monde sombre dans lequel vit une jeune fille ayant la capacité de créer des objets uniquement à partir d\'ordures, qui lui créa un corps fait à partir de ces ordures. Tomoya entre ainsi dans ce monde vide et sombre et suit la fille, la seule autre existence "survivante" dans ce monde.', 22),
('ワンピース', 'One Piece', 'Shonen', 'Gloire, fortune et puissance, c\'est ce que possédait Gold Roger, le tout puissant roi des pirates, avant de mourir sur l\'échafaud. Mais ses dernières paroles ont éveillées bien des convoitises, et lança la fabuleuse "ère de la piraterie", chacun voulant trouver le fabuleux trésor qu\'il disait avoir laissé. A 17 ans, Luffy prend la mer dans une petite barque avec pour but de réunir un équipage de pirates, mais de pirates pas comme les autres, qui devront partager sa conception un peu étrange de la piraterie. L\'aventure est lancée.', 22),
('나 혼자만 레벨업', 'Solo Leveling, Only I level up, Na Honjaman Level Up', 'Shonen', 'Sung Jin Woo est considéré comme le plus faible des Chasseurs de rang E... Autrement dit le plus faible parmi les faibles. Il est tellement faible qu\'il est surnommé par ses confrères, le « Faible ». Avec une équipe de Chasseurs, il se rend dans un donjon de rang D. Malheureusement, l\'équipe se retrouve piégée dans une salle avec des monstres qui ne sont pas du tout du niveau du donjon... S\'en suit un massacre... Et Sung Jin Woo, aux portes de la mort arrive à acquérir une capacité pour le moins étrange...', 23);

INSERT INTO anime (id_work, release_date, ending_date, studio, nbr_total_ep) VALUES (3, '2007-10-4', '2008-03-27', 'Kyoto Animation', 23), (4, '1999-10-20', '2019-07-07', 'Toei Animation', 890);
INSERT INTO movie (id_work, release_date, studio, duration) VALUES (1, '1988-04-01', 'Studio Ghibli', 86), (2, '2004-11-20', 'Studio Ghibli', 118);
INSERT INTO manga (id_work, release_date, ending_date, studio, nbr_volume, nbr_chap) VALUES (4, '1997-12-24', '2020-04-03', 'Shueisha', 97, 974), (5, '2019-09-26', '2020-08-27', 'D&C Media, Kakao', 3, 126);


INSERT INTO genre(label) VALUES ('Ecchi'), ('Gore'), ('Sexual Violence'), ('Smut'), ('Hentai'), ('Action'), ('Adventure'), ('Comedy'), ('Crime'), ('Drama'), ('Fantasy'), ('Historical'), ('Horror'), ('Isekai'), ('Magical Girls'), ('Mecha'), ('Medical'), ('Mystery'), ('Philosophical'), ('Psychological'), ('Romance'), ('Schi-Fi'), ('Shoujo Ai'), ('Shounen Ai'), ('Slice of Life'), ('Sports'), ('Superhero'), ('Thriller'), ('Tragedy'), ('Wuxia'), ('Yaoi'), ('Yuri');

INSERT INTO theme(label) VALUES ('Aliens'), ('Animals'), ('Cooking'), ('Crossdressing'), ('Delinquents'), ('Demons'), ('Genderswap'), ('Ghosts'), ('Gyaru'), ('Harem'), ('Incest'), ('Loli'), ('Mafia'), ('Magic'), ('Martial Arts'), ('Military'), ('Monster Girls'), ('Monsters'), ('Music'), ('Ninja'), ('Office Workers'), ('Police'), ('Post-Apocalyptic'), ('Reincarnation'), ('Reverse Harem'), ('Samurai'), ('School Life'), ('Shota'), ('Supernatural'), ('Survival'), ('Survival'), ('Time Travel'), ('Traditional Games'), ('Vampires'), ('Video Games'), ('Villainess'), ('Virtual Reality'), ('Zombies');

INSERT INTO technicalDataSheet(id_work, id_artist, occupation) VALUES (1, 1, 'Author'), (1, 1, 'Director'), (1, 1, 'Scriptwriter'), (1, 2, 'Character Designer'), (2, 1, 'Director'), (2, 1, 'Scriptwriter'), (2, 3, 'Author'), (2, 4, 'Character Designer'), (2, 5, 'Music'), (3, 6, 'Director'), (3, 7, 'Scriptwriter'), (3, 8, 'Character Designer'), (3, 9, 'Character Designer'), (3, 10, 'Music'), (4, 11, 'Author'), (4, 12, 'Director'), (4, 13, 'Director'), (5, 14, 'Author'), (5, 15, 'Designer'), (5, 16, 'Designer');
INSERT INTO artist(lastname, firstname, gender, id_language) VALUES ('Miyazaki', 'Hayao', 'male', 22), ('Sato', 'Yoshiharu', 'male', 22), ('Jones', 'Diana Wynne', 'female', 11), ('Yamashita', 'Akihiko', 'male', 22), ('Hiraishi', 'Joe', 'male', 22), ('Ishihara', 'Tatsuya', 'male', 22), ('Shimo', 'Fumihiko', 'male', 22), ('Ikeda', 'Kazumi', 'male', 22), ('Hinoue', 'Itaru', 'female', 22), ('Maeda', 'Jun', 'male', 22), ('Eiichiro', 'Oda', 'male', 22), ('Fukazawa', 'Toshinori', 'male', 22), ('Ito', 'Satoshi', 'male', 22), ('Chu', 'gong', 'unknown', 23), ('Jang', 'Sung-Rak', 'male', 23), ('Gi', 'So-Ryeong', 'male', 23);

INSERT INTO users(nickname, password, email, gender, id_language) VALUES ('vani', 'supervani', 'vani@gmail.fr', 'male', 14), ('hamtoé', 'jambon94', 'hamtoé@mail.com', 'male', 14), ('superuser', 'jesuissuperuser', 'user@user.fr', 'unknown', 28), ('moi', 'lui', 'elle@onnesaitplus.net', 'unknown', 5), ('Jacqueline', 'monchienestblanc', 'jacquelinevillard@hotmail.fr', 'female', 13);

INSERT INTO genreWork(id_work, id_genre) VALUES (1, 7), (1, 8), (2, 7), (2, 8), (2, 11), (2, 21), (3, 8), (3, 10), (3, 21), (3, 25), (4, 6), (4, 7), (4, 8), (4, 10), (4, 11), (5, 6), (5, 11);
INSERT INTO ThemeWork(id_work, id_theme) VALUES (1, 29), (2, 14), (3, 10), (3, 29), (3, 27), (4, 14), (4, 3), (5, 14), (5, 18), (5, 24), (5, 30); 

INSERT INTO rating(id_work, id_user, rating) VALUES (1, 1, 7), (1, 2, 8), (1, 3, 3), (1, 4, 9), (1, 5, 10),
(2, 1, 3), (2, 2, 4), (2, 3, 1), (2, 4, 6), (2, 5, 2),
(3, 1, 6), (3, 2, 7), (3, 3, 9), (3, 4, 7), (3, 5, 5),
(4, 1, 8), (4, 2, 3), (4, 3, 8), (4, 4, 6), (4, 5, 9),
(5, 1, 7), (5, 2, 5), (5, 3, 6), (5, 4, 8), (5, 5, 8);

INSERT INTO chapter(nbr_chapter, title, id_manga, id_language) VALUE (1, "Romance Dawn", 4, 11), (1, "They call him \'Straw Hat Luffy\'", 4, 11), (1, "", 5, 11), (1, "", 5, 14);

INSERT INTO episode(nbr_episode, title, id_language, id_anime) VALUE    (1, "Je suis Luffy, Celui qui deviendra le roi des pirates", 14, 4), (2, "Le grand manieur de sabres! Roronoa Zoro, chasseur de pirates!", 14, 4), (1, "La colline où dansent les pétales de cerisiers", 14, 3), (2, "La première étape", 14, 3);

/*1.      Voir toutes les œuvres dont l’artiste « Hayao Miyazaki » (et son rôle) a été impliqué (LIKE + jointure)*/
SELECT title, occupation 
FROM work 
INNER JOIN technicaldatasheet ON work.id = technicaldatasheet.id_work 
LEFT JOIN artist ON technicaldatasheet.id_artist = artist.id 
WHERE lastname LIKE 'Miyazaki';

/*2.      Connaître le nombre d’épisode paru pour chaque anime (COUNT)*/
SELECT COUNT(e.id), w.title 
FROM anime a LEFT OUTER JOIN episode e ON a.id_work = e.id_anime 
LEFT OUTER join work w ON a.id_work = w.id 
GROUP BY w.title

/*3.      Voir tous les films dont la moyenne de la note est supérieure à 4 par artiste (AVG + HAVING + jointure + GROUP BY)*/
SELECT title, AVG(rating) 
FROM work 
INNER JOIN rating ON rating.id_work = work.id 
GROUP BY title 
HAVING AVG(rating) >= 4;

/*4.      Voir tous les utilisateurs (+ leur note) qui ont émis une note sur le manga « Naruto » (LIKE + jointure)*/
SELECT nickname, rating 
FROM users 
INNER JOIN rating ON users.id = rating.id_user 
INNER JOIN work ON rating.id_work = work.id 
WHERE title LIKE '%One Piece%' OR alt_title LIKE '%One Piece%';
