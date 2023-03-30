/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 28/03/2023
*/

-- Segue um exemplo de consulta que relaciona as tabelas Jogadores, Equipes e Partidas:

SELECT Jogadores.nome AS jogador_nome, Equipes.nome AS equipe_nome, Partidas.data_partida, Partidas.hora_partida 
FROM Jogadores
INNER JOIN Equipes ON Jogadores.equipe_atual = Equipes.id_equipe
INNER JOIN Partidas ON Jogadores.equipe_atual = Partidas.equipe_vencedora OR Jogadores.equipe_atual = Partidas.equipe_perdedora;

/*Essa consulta retorna o nome do jogador, o nome da equipe, a data e a hora da partida em que o jogador participou, podendo ser como vencedor ou perdedor. Note que é necessário fazer dois JOINs para relacionar as tabelas Jogadores e Equipes e depois utilizar um INNER JOIN com a tabela Partidas, relacionando tanto a equipe vencedora quanto a perdedora.*/

-- Um outro exemplo de consulta que relaciona 2 tabelas:

SELECT Jogadores.nome, Equipes.nome
FROM Jogadores
INNER JOIN Equipes ON Jogadores.equipe_atual = Equipes.id_equipe
WHERE Jogadores.nacionalidade = 'Brasil' AND Equipes.pais_origem = 'Brasil'

/*Essa consulta está relacionando os jagadores de nacionalidade brasileira, com a equipe de origem brasileira */