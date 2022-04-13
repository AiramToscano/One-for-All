SELECT AR.artista_nome AS artista, A.album_nome AS album FROM SpotifyClone.album AS A
JOIN SpotifyClone.artista AS AR ON AR.artista_id = A.artista_id LIMIT 2;
