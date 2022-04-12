SELECT U.usuario, COUNT(MH.usuario_id) AS qtde_musicas_ouvidas,
 ROUND(SUM(M.tempo_segundos)/60, 2) AS total_minutos FROM SpotifyClone.musica_historico AS MH
JOIN SpotifyClone.musica AS M ON M.musica_id = MH.musica_id
JOIN SpotifyClone.usuarios AS U ON U.usuario_id = MH.usuario_id 
GROUP BY MH.usuario_id ORDER BY U.usuario;
