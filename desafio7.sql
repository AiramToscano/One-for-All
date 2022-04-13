SELECT AR.artista_nome AS artista, A.album_nome AS album,
COUNT(UA.artista_id) AS seguidores FROM SpotifyClone.album AS A
JOIN SpotifyClone.artista AS AR ON AR.artista_id = A.artista_id
JOIN SpotifyClone.usuario_artista AS UA ON UA.artista_id = A.artista_id 
GROUP BY AR.artista_nome , A.album_nome ORDER BY seguidores DESC, artista, album;
