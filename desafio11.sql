SELECT musica_nome AS nome_musica, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(musica_nome, "Her Own","Trybe")
, "Silly" ,"Nice"),"Circus", "Pull Request"),"Inner Fire", "Project")
,"Streets",  "Code Review") AS novo_nome
 FROM SpotifyClone.musica
WHERE musica_id = 3 OR  musica_id = 15 OR musica_id = 6 OR
musica_id = 4 OR musica_id = 18 ORDER BY musica_nome;
