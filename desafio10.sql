SELECT H.historico_nome AS nome, COUNT(U.plano_id) AS reproducoes FROM SpotifyClone.historico AS H
JOIN SpotifyClone.usuarios AS U ON U.usuario_id = H.usuario_id
WHERE U.plano_id = 1 OR U.plano_id = 4 GROUP BY H.historico_nome ORDER BY H.historico_nome;
