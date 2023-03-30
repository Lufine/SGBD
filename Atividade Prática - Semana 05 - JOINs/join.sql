/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 28/03/2023
*/

-- Consulta 1 - INNER JOIN: Listar o nome dos jogadores e o nome de suas respectivas equipes atuais:

SELECT Jogadores.nome, Equipes.nome AS equipe_atual
FROM Jogadores
INNER JOIN Equipes ON Jogadores.equipe_atual = Equipes.id_equipe;


-- Consulta 2 - LEFT JOIN: Listar todas as equipes e a quantidade de jogadores que elas possuem:

SELECT Equipes.nome, COUNT(Jogadores.id_jogador) AS qtd_jogadores
FROM Equipes
LEFT JOIN Jogadores ON Equipes.id_equipe = Jogadores.equipe_atual
GROUP BY Equipes.nome;


-- Consulta 3 - INNER JOIN: Listar o nome do torneio, a data de início, a data de fim e o local de todas as partidas realizadas, juntamente com o nome das equipes vencedoras:

SELECT Torneios.nome, Torneios.data_inicio, Torneios.data_fim, Torneios.local, Equipes.nome AS equipe_vencedora
FROM Partidas
INNER JOIN Equipes ON Partidas.equipe_vencedora = Equipes.id_equipe
INNER JOIN Torneios ON Partidas.torneio = Torneios.id_torneio;