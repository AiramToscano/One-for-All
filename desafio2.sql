SELECT COUNT(DISTINCT M.musica_id) AS cancoes, COUNT(DISTINCT A.artista_id) AS artistas,
COUNT(DISTINCT AL.album_id) AS albuns FROM SpotifyClone.artista AS A
JOIN SpotifyClone.album AS AL
ON AL.artista_id = A.artista_id
JOIN SpotifyClone.musica AS M ON M.Album_id = AL.album_id;