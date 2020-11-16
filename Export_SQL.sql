-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 14 nov. 2020 à 16:41
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : pieces
--

-- --------------------------------------------------------

--
-- Structure de la table anime
--

CREATE TABLE IF NOT EXISTS anime (
  id_work integer PRIMARY KEY autoincrement,
  release_date date NOT NULL,
  ending_date date DEFAULT NULL,
  studio varchar(255) NOT NULL,
  nbr_total_ep int NOT NULL,
  FOREIGN KEY(id_work) REFERENCES work (id)
) ;

--
-- Déchargement des données de la table anime
--

INSERT or REPLACE INTO anime (id_work, release_date, ending_date, studio, nbr_total_ep) VALUES
(3, '2007-10-04', '2008-03-27', 'Kyoto Animation', 23),
(4, '1999-10-20', '2019-07-07', 'Toei Animation', 890);

-- --------------------------------------------------------

--
-- Structure de la table artist
--

CREATE TABLE IF NOT EXISTS artist (
  id integer PRIMARY KEY autoincrement,
  lastname varchar(255) NOT NULL,
  firstname varchar(255) NOT NULL,
  gender varchar(255) DEFAULT NULL,
  id_language int NOT NULL,
  FOREIGN KEY (id_language) REFERENCES language (id)
) ;

--
-- Déchargement des données de la table artist
--

INSERT or REPLACE INTO artist (id, lastname, firstname, gender, id_language) VALUES
(1, 'Miyazaki', 'Hayao', 'male', 22),
(2, 'Sato', 'Yoshiharu', 'male', 22),
(3, 'Jones', 'Diana Wynne', 'female', 11),
(4, 'Yamashita', 'Akihiko', 'male', 22),
(5, 'Hiraishi', 'Joe', 'male', 22),
(6, 'Ishihara', 'Tatsuya', 'male', 22),
(7, 'Shimo', 'Fumihiko', 'male', 22),
(8, 'Ikeda', 'Kazumi', 'male', 22),
(9, 'Hinoue', 'Itaru', 'female', 22),
(10, 'Maeda', 'Jun', 'male', 22),
(11, 'Eiichiro', 'Oda', 'male', 22),
(12, 'Fukazawa', 'Toshinori', 'male', 22),
(13, 'Ito', 'Satoshi', 'male', 22),
(14, 'Chu', 'gong', 'unknown', 23),
(15, 'Jang', 'Sung-Rak', 'male', 23),
(16, 'Gi', 'So-Ryeong', 'male', 23);

-- --------------------------------------------------------

--
-- Structure de la table chapter
--

CREATE TABLE IF NOT EXISTS chapter (
  id integer PRIMARY KEY autoincrement,
  nbr_chapter int NOT NULL,
  title varchar(255) DEFAULT NULL,
  id_manga int NOT NULL,
  id_language int NOT NULL,
  FOREIGN KEY (id_language) REFERENCES language (id),
  FOREIGN KEY (id_manga) REFERENCES manga (id)
) ;

--
-- Déchargement des données de la table chapter
--

INSERT or REPLACE INTO chapter (id, nbr_chapter, title, id_manga, id_language) VALUES
(1, 1, 'Romance Dawn', 4, 11),
(2, 1, 'They call him Straw Hat Luffy', 4, 11),
(3, 1, '', 5, 11),
(4, 1, '', 5, 14);

-- --------------------------------------------------------

--
-- Structure de la table episode
--

CREATE TABLE IF NOT EXISTS episode (
  id integer PRIMARY KEY autoincrement,
  nbr_episode int NOT NULL,
  title varchar(255) DEFAULT NULL,
  id_language int NOT NULL,
  id_anime int NOT NULL,
  FOREIGN KEY (id_language) REFERENCES language (id),
  FOREIGN KEY (id_anime) REFERENCES anime (id)
);
--
-- Déchargement des données de la table episode
--

INSERT or REPLACE INTO episode (id, nbr_episode, title, id_language, id_anime) VALUES
(1, 1, 'Je suis Luffy, Celui qui deviendra le roi des pirates', 14, 4),
(2, 2, 'Le grand manieur de sabres! Roronoa Zoro, chasseur de pirates!', 14, 4),
(3, 1, 'La colline où dansent les pétales de cerisiers', 14, 3),
(4, 2, 'La première étape', 14, 3);

-- --------------------------------------------------------

--
-- Structure de la table genre
--

CREATE TABLE IF NOT EXISTS genre (
  id integer PRIMARY KEY autoincrement,
  label varchar(255) NOT NULL
) ;

--
-- Déchargement des données de la table genre
--

INSERT or REPLACE INTO genre (id, label) VALUES
(1, 'Ecchi'),
(2, 'Gore'),
(3, 'Sexual Violence'),
(4, 'Smut'),
(5, 'Hentai'),
(6, 'Action'),
(7, 'Adventure'),
(8, 'Comedy'),
(9, 'Crime'),
(10, 'Drama'),
(11, 'Fantasy'),
(12, 'Historical'),
(13, 'Horror'),
(14, 'Isekai'),
(15, 'Magical Girls'),
(16, 'Mecha'),
(17, 'Medical'),
(18, 'Mystery'),
(19, 'Philosophical'),
(20, 'Psychological'),
(21, 'Romance'),
(22, 'Schi-Fi'),
(23, 'Shoujo Ai'),
(24, 'Shounen Ai'),
(25, 'Slice of Life'),
(26, 'Sports'),
(27, 'Superhero'),
(28, 'Thriller'),
(29, 'Tragedy'),
(30, 'Wuxia'),
(31, 'Yaoi'),
(32, 'Yuri');

-- --------------------------------------------------------

--
-- Structure de la table genrework
--

CREATE TABLE IF NOT EXISTS genrework (
  id_work integer,
  id_genre integer,
  PRIMARY KEY (id_work,id_genre),
  FOREIGN KEY (id_work) REFERENCES work (id),
  FOREIGN KEY (id_genre) REFERENCES genre (id)
) ;

--
-- Déchargement des données de la table genrework
--

INSERT or REPLACE INTO genrework (id_work, id_genre) VALUES
(1, 7),
(1, 8),
(2, 7),
(2, 8),
(2, 11),
(2, 21),
(3, 8),
(3, 10),
(3, 21),
(3, 25),
(4, 6),
(4, 7),
(4, 8),
(4, 10),
(4, 11),
(5, 6),
(5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE IF NOT EXISTS "language" (
  id integer PRIMARY KEY autoincrement,
  name varchar(255)
) ;

--
-- Déchargement des données de la table `language`
--

INSERT or REPLACE INTO language (id, name) VALUES
(1, 'Arabic'),
(2, 'Bengali'),
(3, 'Bulgarian'),
(4, 'Burmese'),
(5, 'Catalan'),
(6, 'Chinese(Simp)'),
(7, 'Chinese(Hong-Kong)'),
(8, 'Czech'),
(9, 'Danish'),
(10, 'Dutch'),
(11, 'English'),
(12, 'Filipino'),
(13, 'Finnish'),
(14, 'French'),
(15, 'German'),
(16, 'Greek'),
(17, 'Hebrew'),
(18, 'Hindi'),
(19, 'Hungarian'),
(20, 'Indonesian'),
(21, 'Italian'),
(22, 'Japanese'),
(23, 'Korean'),
(24, 'Lithuanian'),
(25, 'Malay'),
(26, 'Mongolian'),
(27, 'Norwegian'),
(28, 'Other'),
(29, 'Persian'),
(30, 'Polish'),
(31, 'Portuguese(BR)'),
(32, 'Portuguese(PT)'),
(33, 'Romanian'),
(34, 'Russian'),
(35, 'Serbo-Russian'),
(36, 'Spanish(ES)'),
(37, 'Spanish(LATAM)'),
(38, 'Swedish'),
(39, 'Thai'),
(40, 'Turkish'),
(41, 'Ukrainian'),
(42, 'Vietnamese');

-- --------------------------------------------------------

--
-- Structure de la table manga
--

CREATE TABLE IF NOT EXISTS manga (
  id_work integer PRIMARY KEY autoincrement,
  release_date date NOT NULL,
  ending_date date DEFAULT NULL,
  studio varchar(255) NOT NULL,
  nbr_volume int NOT NULL,
  nbr_chap int NOT NULL,
  FOREIGN KEY(id_work) REFERENCES work (id)
) ;

--
-- Déchargement des données de la table manga
--

INSERT or REPLACE INTO manga (id_work, release_date, ending_date, studio, nbr_volume, nbr_chap) VALUES
(4, '1997-12-24', '2020-04-03', 'Shueisha', 97, 974),
(5, '2019-09-26', '2020-08-27', 'D&C Media, Kakao', 3, 126);

-- --------------------------------------------------------

--
-- Structure de la table movie
--

CREATE TABLE IF NOT EXISTS movie (
  id_work integer PRIMARY KEY autoincrement,
  release_date date NOT NULL,
  studio varchar(255) NOT NULL,
  duration int NOT NULL,
  FOREIGN KEY(id_work) REFERENCES work (id)
);
--
-- Déchargement des données de la table movie
--

INSERT or REPLACE INTO movie (id_work, release_date, studio, duration) VALUES
(1, '1988-04-01', 'Studio Ghibli', 86),
(2, '2004-11-20', 'Studio Ghibli', 118);

-- --------------------------------------------------------

--
-- Structure de la table rating
--

CREATE TABLE IF NOT EXISTS rating (
  id_work integer,
  id_user integer,
  rating int NOT NULL check (rating < 11),
  PRIMARY KEY (id_work,id_user),
  FOREIGN KEY (id_work) REFERENCES work (id),
  FOREIGN KEY (id_user) REFERENCES users (id)
) ;

--
-- Déchargement des données de la table rating
--

INSERT or REPLACE INTO rating (id_work, id_user, rating) VALUES
(1, 1, 7),
(1, 2, 8),
(1, 3, 3),
(1, 4, 9),
(1, 5, 10),
(2, 1, 3),
(2, 2, 4),
(2, 3, 1),
(2, 4, 6),
(2, 5, 2),
(3, 1, 6),
(3, 2, 7),
(3, 3, 9),
(3, 4, 7),
(3, 5, 5),
(4, 1, 8),
(4, 2, 3),
(4, 3, 8),
(4, 4, 6),
(4, 5, 9),
(5, 1, 7),
(5, 2, 5),
(5, 3, 6),
(5, 4, 8),
(5, 5, 8);

-- --------------------------------------------------------

--
-- Structure de la table technicaldatasheet
--

CREATE TABLE IF NOT EXISTS technicaldatasheet (
  id_work integer,
  id_artist integer,
  occupation varchar(255) NOT NULL,
  PRIMARY KEY (id_work,id_artist,occupation),
  FOREIGN KEY (id_work) REFERENCES work (id),
  FOREIGN KEY (id_artist) REFERENCES artist (id)
) ;

--
-- Déchargement des données de la table technicaldatasheet
--

INSERT or REPLACE INTO technicaldatasheet (id_work, id_artist, occupation) VALUES
(1, 1, 'Author'),
(1, 1, 'Scriptwriter'),
(1, 1, 'Director'),
(1, 2, 'Character Designer'),
(2, 1, 'Scriptwriter'),
(2, 1, 'Director'),
(2, 3, 'Author'),
(2, 4, 'Character Designer'),
(2, 5, 'Music'),
(3, 6, 'Director'),
(3, 7, 'Scriptwriter'),
(3, 8, 'Character Designer'),
(3, 9, 'Character Designer'),
(3, 10, 'Music'),
(4, 11, 'Author'),
(4, 12, 'Director'),
(4, 13, 'Director'),
(5, 14, 'Author'),
(5, 15, 'Designer'),
(5, 16, 'Designer');

-- --------------------------------------------------------

--
-- Structure de la table theme
--

CREATE TABLE IF NOT EXISTS theme (
  id integer PRIMARY KEY autoincrement,
  label varchar(255) NOT NULL
) ;

--
-- Déchargement des données de la table theme
--

INSERT or REPLACE INTO theme (id, label) VALUES
(1, 'Aliens'),
(2, 'Animals'),
(3, 'Cooking'),
(4, 'Crossdressing'),
(5, 'Delinquents'),
(6, 'Demons'),
(7, 'Genderswap'),
(8, 'Ghosts'),
(9, 'Gyaru'),
(10, 'Harem'),
(11, 'Incest'),
(12, 'Loli'),
(13, 'Mafia'),
(14, 'Magic'),
(15, 'Martial Arts'),
(16, 'Military'),
(17, 'Monster Girls'),
(18, 'Monsters'),
(19, 'Music'),
(20, 'Ninja'),
(21, 'Office Workers'),
(22, 'Police'),
(23, 'Post-Apocalyptic'),
(24, 'Reincarnation'),
(25, 'Reverse Harem'),
(26, 'Samurai'),
(27, 'School Life'),
(28, 'Shota'),
(29, 'Supernatural'),
(30, 'Survival'),
(31, 'Survival'),
(32, 'Time Travel'),
(33, 'Traditional Games'),
(34, 'Vampires'),
(35, 'Video Games'),
(36, 'Villainess'),
(37, 'Virtual Reality'),
(38, 'Zombies');

-- --------------------------------------------------------

--
-- Structure de la table themework
--

CREATE TABLE IF NOT EXISTS themework (
  id_work integer,
  id_theme integer,
  PRIMARY KEY (id_work,id_theme),
  FOREIGN KEY (id_work) REFERENCES work (id),
  FOREIGN KEY (id_theme) REFERENCES theme (id)
) ;

--
-- Déchargement des données de la table themework
--

INSERT or REPLACE INTO themework (id_work, id_theme) VALUES
(1, 29),
(2, 14),
(3, 10),
(3, 27),
(3, 29),
(4, 3),
(4, 14),
(5, 14),
(5, 18),
(5, 24),
(5, 30);

-- --------------------------------------------------------

--
-- Structure de la table users
--

CREATE TABLE IF NOT EXISTS users (
  id integer PRIMARY KEY autoincrement,
  nickname varchar(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  gender varchar(255),
  id_language INT,
  FOREIGN KEY (id_language) REFERENCES language (id)
) ;

--
-- Déchargement des données de la table users
--

INSERT or REPLACE INTO users (id, nickname, password, email, gender, id_language) VALUES
(1, 'vani', 'supervani', 'vani@gmail.fr', 'male', 14),
(2, 'hamtoé', 'jambon94', 'hamtoé@mail.com', 'male', 14),
(3, 'superuser', 'jesuissuperuser', 'user@user.fr', 'unknown', 28),
(4, 'moi', 'lui', 'elle@onnesaitplus.net', 'unknown', 5),
(5, 'Jacqueline', 'monchienestblanc', 'jacquelinevillard@hotmail.fr', 'female', 13);

-- --------------------------------------------------------

--
-- Structure de la table `work`
--

CREATE TABLE IF NOT EXISTS "work" (
  id integer PRIMARY KEY autoincrement,
  title varchar(255) NOT NULL,
  alt_title varchar(255) DEFAULT NULL,
  category varchar(255) DEFAULT NULL,
  description VARCHAR(255),
  id_language INT NOT NULL,
  FOREIGN KEY (id_language) REFERENCES language (id)
) ;

--
-- Déchargement des données de la table `work`
--

INSERT or REPLACE INTO work (id, title, alt_title, category, description, id_language) VALUES
(1, 'となりのトトロ', 'Tonari no Totoro, Mon Voisin Totoro', 'Unknown', "Un professeur d'université, M. Kusakabe, et ses deux filles, Satsuki, onze ans, et Mei, cinq ans, s'installent dans leur nouvelle maison à la campagne. Celle-ci est proche de l'hôpital où sa femme est hospitalisée. Explorant les alentours, Mei ...", 3),
(2, "Howl's Moving Castle / ハウルの動く城", 'Le Château Ambulant / Hauru no Ugoku Shiro', 'Unknown', '', 22),
(3, 'Clannad', 'クラナド', 'Shojo', "Tomoya Okasaki est en troisième année au lycée et est considéré comme délinquant. Tout semble immuable dans sa vie de lycéen jusqu'à ce qu'il rencontre Nagisa et, dès lors, la vie de Tomoya parut changer. Il commence à rêver d'un monde sombre dans ...", 22),
(4, 'ワンピース', 'One Piece', 'Shonen', "Gloire, fortune et puissance, c'est ce que possédait Gold Roger, le tout puissant roi des pirates, avant de mourir sur l'échafaud. Mais ses dernières paroles ont éveillées bien des convoitises, et lança la fabuleuse ère de la piraterie , chacun ...", 22),
(5, '나 혼자만 레벨업', 'Solo Leveling, Only I level up, Na Honjaman Level Up', 'Shonen', "Sung Jin Woo est considéré comme le plus faible des Chasseurs de rang E... Autrement dit le plus faible parmi les faibles. Il est tellement faible qu'il est surnommé par ses confrères, le « Faible ». Avec une équipe de Chasseurs, il se rend dans un ...", 23);

/*1.      Voir toutes les œuvres dont l’artiste « Hayao Miyazaki » (et son rôle) a été impliqué (LIKE + jointure)*/
SELECT title, occupation 
FROM work 
INNER JOIN technicaldatasheet ON work.id = technicaldatasheet.id_work 
LEFT JOIN artist ON technicaldatasheet.id_artist = artist.id 
WHERE lastname LIKE 'Miyazaki';

/*2.      Connaître le nombre d’épisode paru pour chaque anime (COUNT)*/
SELECT COUNT(*), w.title 
FROM anime a LEFT OUTER JOIN episode e ON a.id_work = e.id_anime 
LEFT OUTER join work w ON a.id_work = w.id 
GROUP BY w.title;

/*3.      Voir tous les films dont la moyenne de la note est supérieure à 4 par artiste (AVG + HAVING + jointure + GROUP BY)*/
SELECT title, AVG(rating) 
FROM work 
INNER JOIN rating ON rating.id_work = work.id 
GROUP BY title 
HAVING AVG(rating) >= 7;

/*4.      Voir tous les utilisateurs (+ leur note) qui ont émis une note sur le manga « Naruto » (LIKE + jointure)*/
SELECT nickname, rating 
FROM users 
INNER JOIN rating ON users.id = rating.id_user 
INNER JOIN work ON rating.id_work = work.id 
WHERE title LIKE '%One Piece%' OR alt_title LIKE '%One Piece%';

.save pieces
