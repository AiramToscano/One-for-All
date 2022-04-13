SELECT DISTINCT U.usuario, 
IF(MAX(H.data_reproducao) = '2021-02-28', 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.historico AS H
JOIN SpotifyClone.usuarios AS U 
ON U.usuario_id = H.usuario_id GROUP BY U.usuario ORDER BY U.usuario;
