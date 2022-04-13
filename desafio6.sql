SELECT CAST(ROUND(MIN(P.valor_plano),2) AS char(4)) AS faturamento_minimo ,
CAST(MAX(P.valor_plano) AS CHAR(4)) AS faturamento_maximo,
CAST(ROUND(AVG(P.valor_plano),2) AS CHAR(4)) AS faturamento_medio,
CAST(SUM(P.valor_plano) AS CHAR(5)) AS faturamento_total from SpotifyClone.usuarios AS U
JOIN SpotifyClone.plano AS P ON P.plano_id = U.plano_id;
