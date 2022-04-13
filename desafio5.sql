SELECT H.historico_nome AS cancao, Count(H.historico_nome) AS reproducoes FROM SpotifyClone.historico AS H
JOIN SpotifyClone.musica_historico AS MH ON MH.historico_id = H.historico_id 
GROUP BY historico_nome ORDER BY reproducoes DESC, H.historico_nome LIMIT 2;
