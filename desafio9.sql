SELECT COUNT(MH.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.musica_historico AS MH
JOIN SpotifyClone.usuarios AS U ON U.usuario_id = MH.usuario_id 
GROUP BY MH.usuario_id HAVING COUNT(MH.usuario_id) = 3 LIMIT 1;
