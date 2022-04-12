CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    valor_plano FLOAT(3,2) NOT NULL
);

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(45) NOT NULL,
    idade NUMERIC(3) NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano (plano_id)
);

CREATE TABLE SpotifyClone.artista(
     artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(45) NOT NULL
);

CREATE TABLE SpotifyClone.historico(
     historico_id INT PRIMARY KEY AUTO_INCREMENT,
     historico_nome VARCHAR(45) NOT NULL,
	 usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id)
);

CREATE TABLE SpotifyClone.album(
     album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(45) NOT NULL,
    ano_lancamento NUMERIC(4),
    artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
);

CREATE TABLE SpotifyClone.musica(
     musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_nome VARCHAR(45) NOT NULL,
    album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id),
    tempo_segundos NUMERIC(5)
);


CREATE TABLE SpotifyClone.usuario_artista (
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
);

CREATE TABLE SpotifyClone.musica_historico (
	musica_id INT NOT NULL,
    historico_id INT NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (musica_id, historico_id, usuario_id),
    FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musica (musica_id),
    FOREIGN KEY (historico_id) REFERENCES SpotifyClone.historico (historico_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id)
);

CREATE TABLE SpotifyClone.album_musica (
	album_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id, musica_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id),
    FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musica (musica_id)
);
INSERT INTO SpotifyClone.plano (nome, valor_plano)
VALUES ('gratuito', 0), ('familiar', 7.99), ('universitario', 5.99), ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id, data_assinatura)
VALUES ('Thati', 23, 1, '2019-10-20'), ('Cintia', 35, 2, '2017-12-30'), ('Bill', 20, 3, '2019-06-05'),
('Roger', 45, 4, '2020-05-13'), ('Norman', 58, 4, '2017-02-17'), ('Patrick', 33, 2, '2017-01-06'),
('Vivian', 26, 3, '2018-01-05'), ('Carol', 19, 3, '2018-02-14'), ('Angelina', 42, 2, '2018-04-29'),
('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.album (album_nome, ano_lancamento, artista_id)
VALUES ('Envious', '1990', 1) , ('Exuberant', '1993', 1) ,('Hallowed Steam', '1995', 4),
('Incandescent', '1998', 3), ('Temporary Culture', '2001', 2) ,('Library of liberty', '2003', 2) ,('Chained Down', '2007', 5), 
('Cabinet of fools', '2012', 5), ('No guarantees', '2015', 5) ,('Apparatus', '2015', 6);

INSERT INTO SpotifyClone.artista (artista_nome)
VALUES ('Walter Phonenix'), ('Freedie Shannon'), ('Lance Day') ,('Peter Strong'), 
('Tyler Isle'), ('Fog');

INSERT INTO SpotifyClone.historico (historico_nome, usuario_id)
VALUES ('Honey', 1), ('Walking And Man', 1), ('Young And Father' ,1) ,('Diamond Power',1), 
('Lets Be Silly', 1), ('I Heard I Want To Bo Alone',2), ('Finding My Traditions', 2), 
('Without My Love', 2), ('Baby', 2), ('Magic Circus', 3), ('Dance whith her Own' , 3), ('Hard and time', 3),
 ('Reflections of Magic', 4), ('I ride Alone', 4), ('honey, I alone wolf', 4)
, ('honey so do I', 5), ('Rock is everything' , 5 ), ('Diamond Power' , 5), ('Soul For Us', 5), ('Wouldnt It Be Nice', 5)
, ('He Heard Youre Bad For Me', 6), ('He Hopes We Cant Stay' ,6),
 ('Walking And Game', 6), ('Time Fireworks' , 7), ('Troubles Of My Inner Fire' , 7), ('Celebration Of More', 7)
, ('You Make Me Feel So' , 7), ('He"s Walking Away', 8), ('Hes Trouble', 8), ('Thang Of Thunder' ,8), ('Words Of Her Life' , 8)
, ('Sweetie, Lets Go Wild', 9), ('She Knows' ,9), ('History Of My Roses', 9), ('Without My Love', 10)
, ('Rock His Everything', 10), ('Home Forever', 10), ('Home' ,10);

INSERT INTO SpotifyClone.musica (musica_nome, album_id, tempo_segundos)
VALUES ('Soul For Us',1 , 200), ('Reflections Of Magic',1, 163), ('dance with her own',1, 116),
 ('Troubles of My inner fire',2, 203), ('Time Fireworks',2, 152), ('Magic Circus',3, 105),
('Honey, so do I',3, 207), ('Sweetie, Lets Go Wild',3, 139),
 ('She Knows',3, 224), ('Fantasy For Me',4, 100), ('Celebration Of More',4, 146), 
('Rock His Everything',4, 223), ('Home Forever',4, 231), ('Diamond Power',4, 241),
 ('Lets Be Silly',5, 132), ('Thang Of Thunder',5, 240), 
('Words Of Her Life',6, 185), ('Without My Streets',6, 176), ('Need Of The Evening',6, 190),
 ('History Of My Roses',7, 222), ('Without My Love',7, 111), 
('Walking And Game',7, 123), ('Young And Father',7, 197), ('Finding My Traditions',8, 179),
 ('Walking And Man',8, 229), ('Hard And Time',8, 135), 
('Honey, Im A Lone Wolf',8, 250), ('she thinks i wont stay tonight',9, 166),
 ('He Heard Youre Bad For Me',9, 154),
 ('He Hopes We Cant Stay',9, 210), ('I Know I Know',9, 117), 
('Hes Walking Away',10, 159), ('Hes Trouble',10, 138), ('I Heard I Want To Bo Alone',10, 120), ('I Ride Alone',10, 151), 
('Honey',10, 79), ('You Cheated On Me',10, 95), ('Wouldnt It Be Nice',10, 213), 
('Baby',10, 136), ('You Make Me Feel So',10, 83);

INSERT INTO SpotifyClone.usuario_artista (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3),
(3, 4), (3, 1), (5, 5), (5, 6), (6, 6) , (6, 3) , (6, 1)
, (7, 4), (7, 5), (8, 1), (8, 5) , (9, 6) , (9, 2) , (9, 3)
, (10, 4) , (10, 6), (10,1);

INSERT INTO SpotifyClone.album_musica (album_id, musica_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 4), (2, 5),
(3, 6), (3, 7), (3, 8), (3, 9), (4, 10),
(4, 11), (4, 12), (4, 13), (4, 14), (4, 15),
(5, 16), (5, 17), (5, 18), (6, 19), (6, 20),
(6, 21), (6, 22), (6, 23), (7, 24), (7, 25),
(7, 26), (7, 27), (8, 28), (8, 29), (8, 30),
(8, 31), (9, 32), (9, 33), (9, 34), (9, 35),
(10, 36), (10, 37), (10, 38), (10, 39), (10, 40);

INSERT INTO SpotifyClone.musica_historico (musica_id, historico_id, usuario_id)
VALUES (1, 1 , 1), (2, 2 , 1), (3, 3, 1),(4, 4, 2), (5, 5, 2), (6, 6 ,2), (7, 7 ,2),
 (8, 8 ,3), (9, 9 ,3), (10, 10 ,3), (11, 11 , 4), (12, 12 ,4), (13, 13 ,4),
 (14, 14 ,4), (15, 15 ,5), (16, 16 ,5), (17, 17 ,5), (18, 18 ,6), (19, 19 ,6), (20, 20 ,7),
(21, 21 ,8), (22, 22 ,8), (23, 23 ,8), (24, 24 ,9), (25, 25 , 9),(26, 26 ,9), (27, 27 ,10), (28, 28, 10),
 (29, 29 ,10), (9, 30 ,10), (30, 31, 9),(31, 32 , 9), (32, 33 ,9),
 (33, 34 ,9), (34, 35 ,8), (35, 36 , 8),(36, 37 ,8), (37, 38 ,8);
