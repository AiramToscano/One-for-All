CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    valor_plano FLOAT(3,2) NOT NULL
);

CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(45) NOT NULL,
    idade NUMERIC(3) NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
);

CREATE TABLE artista(
     artista_id INT PRIMARY KEY AUTO_INCREMENT,
     artista_nome VARCHAR(45) NOT NULL
);

CREATE TABLE historico(
     historico_id INT PRIMARY KEY AUTO_INCREMENT,
     historico_nome VARCHAR(45) NOT NULL,
	 usuario_id INT NOT NULL,
	 data_reproducao DATE NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

CREATE TABLE album(
     album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(45) NOT NULL,
    ano_lancamento NUMERIC(4),
    artista_id INT NOT NULL,
   FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

CREATE TABLE musica(
     musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_nome VARCHAR(45) NOT NULL,
    album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES album (album_id),
    tempo_segundos NUMERIC(5)
);


CREATE TABLE usuario_artista (
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

CREATE TABLE musica_historico (
	musica_id INT NOT NULL,
    historico_id INT NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (musica_id, historico_id, usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musica (musica_id),
    FOREIGN KEY (historico_id) REFERENCES historico (historico_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

CREATE TABLE album_musica (
	album_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id, musica_id),
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (musica_id) REFERENCES musica (musica_id)
);
INSERT INTO SpotifyClone.plano (nome, valor_plano)
VALUES ('gratuito', '0'), ('familiar', '7.99'), ('universitario', '5.99'), ('pessoal', '6.99');

INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id, data_assinatura)
VALUES ('Thati', 23, 1, '2019-10-20'), ('Cintia', 35, 2, '2017-12-30'), ('Bill', 20, 3, '2019-06-05'),
('Roger', 45, 4, '2020-05-13'), ('Norman', 58, 4, '2017-02-17'), ('Patrick', 33, 2, '2017-01-06'),
('Vivian', 26, 3, '2018-01-05'), ('Carol', 19, 3, '2018-02-14'), ('Angelina', 42, 2, '2018-04-29'),
('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.artista (artista_nome)
VALUES ('Walter Phoenix'), ('Freedie Shannon'), ('Lance Day') ,('Peter Strong'), 
('Tyler Isle'), ('Fog');

INSERT INTO SpotifyClone.album (album_nome, ano_lancamento, artista_id)
VALUES ('Envious', '1990', 1) , ('Exuberant', '1993', 1) ,('Hallowed Steam', '1995', 4),
('Incandescent', '1998', 3), ('Temporary Culture', '2001', 2) ,('Library of liberty', '2003', 2) ,('Chained Down', '2007', 5), 
('Cabinet of fools', '2012', 5), ('No guarantees', '2015', 5) ,('Apparatus', '2015', 6);

INSERT INTO SpotifyClone.historico (historico_nome, usuario_id , data_reproducao)
VALUES ('Honey', 1, '2020-02-28'),('Walking And Man', 1,'2020-02-28'), 
('Young And Father' ,1,'2020-02-28') ,('Diamond Power',1,'2020-02-28'), 
("Let's Be Silly", 1,'2020-02-28'), ('I Heard I Want To Bo Alone',2,'2020-02-28'),
 ('Finding My Traditions', 2,'2020-02-28'), 
('Without My Love', 2,'2020-02-28'), ('Baby', 2,'2020-02-28'),
 ('Magic Circus', 3,'2020-02-28'), ('Dance whith her Own' , 3,'2020-02-28'),
 ('Hard and time', 3,'2020-02-28'),
 ('Reflections Of Magic', 4,'2021-02-28'), ('I Ride Alone', 4,'2021-02-28'),
 ("Honey, So Do I", 4,'2021-02-28')
, ("Honey, I'm A Lone Wolf", 5,'2020-02-28'), ('Rock His Everything' , 5,'2017-02-28' ),
 ('Diamond Power' , 5,'2020-02-28'), ('Soul For Us', 5,'2020-02-28'),
 ('Wouldnt It Be Nice', 6,'2019-02-28')
, ('He Heard Youre Bad For Me', 6,'2017-02-28'), ('He Hopes We Cant Stay' ,6,'2017-02-28'),
 ('Walking And Game', 6,'2018-02-28'), ('Time Fireworks' , 7,'2018-02-28'),
 ('Troubles Of My Inner Fire' , 7,'2020-02-28'), ('Celebration Of More', 7,'2018-02-28')
,('Baby' , 8,'2018-02-28'), ('You Make Me Feel So' , 8,'2020-02-28'),
('He"s Walking Away', 8,'2019-02-28'),
 ('Hes Trouble', 8,'2021-02-28'), ('Thang Of Thunder' ,9,'2021-02-28'),
 ('Words Of Her Life' , 8,'2018-02-28')
, ('Sweetie, Lets Go Wild', 9,'2021-02-28'), ('She Knows' ,9,'2018-02-28'),
 ('History Of My Roses', 10,'2017-02-28'), ('Without My Love', 10,'2017-02-28')
, ('Rock His Everything', 10,'2017-02-28'), ('Home Forever', 10,'2017-02-28');

INSERT INTO SpotifyClone.musica (musica_nome, album_id, tempo_segundos)
VALUES ('Soul For Us',1 , 200), ('Reflections Of Magic',1, 163), ('Dance With Her Own',1, 116),
 ('Troubles Of My Inner Fire',2, 203), ('Time Fireworks',2, 152), ('Magic Circus',3, 105),
('Honey, so do I',3, 207), ('Sweetie, Lets Go Wild',3, 139),
 ('She Knows',3, 244), ('Fantasy For Me',4, 100), ('Celebration Of More',4, 146), 
('Rock His Everything',4, 223), ('Home Forever',4, 231), ('Diamond Power',4, 241),
 ("Let's Be Silly",5, 132), ('Thang Of Thunder',5, 240), 
('Words Of Her Life',6, 185), ('Without My Streets',6, 176), ('Need Of The Evening',6, 190),
 ('History Of My Roses',7, 222), ('Without My Love',7, 111), 
('Walking And Game',7, 123), ('Young And Father',7, 197), ('Finding My Traditions',8, 179),
 ('Walking And Man',8, 229), ('Hard And Time',8, 135), 
('Honey, Im A Lone Wolf',8, 150), ('she thinks i wont stay tonight',9, 166),
 ('He Heard Youre Bad For Me',9, 154),
 ('He Hopes We Cant Stay',9, 210), ('I Know I Know',9, 117), 
('Hes Walking Away',10, 159), ('Hes Trouble',10, 138), ('I Heard I Want To Bo Alone',10, 120), ('I Ride Alone',10, 151), 
('Honey',10, 79), ('You Cheated On Me',10, 95), ('Wouldnt It Be Nice',10, 213), 
('Baby',10, 136), ('You Make Me Feel So',10, 83);

INSERT INTO SpotifyClone.usuario_artista (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (2,2),
(3, 4), (3, 1), (5, 5), (5, 6), (6, 6) , (6, 3) , (6, 1)
, (7, 4), (7, 5), (8, 1), (8, 5) , (9, 6) , (9, 2) , (9, 3)
, (10, 4) , (10, 6);

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
VALUES (1, 19 , 5), (2, 13 , 4), (3, 11, 3),(4, 25, 7), (5, 24, 7), (6, 10 ,3), (7, 16 ,5),
 (8, 33 ,9), (9, 34 ,9), (11, 26 , 7), (12, 17 ,5), (12, 37 ,10),
 (13, 38 ,10), (14, 4 ,1), (14, 18 ,5), (15, 5 ,1), (16, 31 ,9), (17, 32 ,9), (20, 35 ,10),
(21, 8 ,2), (21, 36 ,10), (22, 23 ,6), (23, 3 ,1), (24, 7 , 2),(25, 2 ,1), (26, 12 ,3), (27, 15, 4),
 (29, 21 ,6), (30, 22 ,6), (32, 29, 8),(33, 30 , 8), (34, 6 ,2),
 (35, 14 ,4), (36, 1 ,1), (38, 20 , 6),(39, 9 ,2), (39, 27 ,8) , (40, 28 ,8);

