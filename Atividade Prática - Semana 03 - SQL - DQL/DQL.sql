--100 registros para tabela Jogadores:

INSERT INTO Jogadores (id_jogador, nome, apelido, data_nascimento, nacionalidade, equipe_atual) VALUES
(1, 'João Silva', 'Jota', '1995-02-12', 'Brasil', 'Furia'),
(2, 'Maria Souza', 'Má', '1998-07-05', 'Brasil', 'MIBR'),
(3, 'Pedro Oliveira', 'Pê', '1990-10-21', 'Portugal', 'G2 Esports'),
(4, 'Ana Santos', 'Aninha', '1993-04-30', 'Brasil', 'Astralis'),
...
(99, 'Lucas Costa', 'Luquinhas', '1996-01-18', 'Brasil', 'Cloud9'),
(100, 'Isabela Ramos', 'Bela', '1999-08-25', 'Brasil', 'Virtus.pro');

-- 100 registros para tabela Equipes:

INSERT INTO Equipes (id_equipe, nome, data_fundacao, pais_origem, logo) VALUES
(1, 'Furia', '2017-01-01', 'Brasil', 'furia.png'),
(2, 'MIBR', '2018-01-01', 'Brasil', 'mibr.png'),
(3, 'G2 Esports', '2013-01-01', 'França', 'g2.png'),
(4, 'Astralis', '2016-01-01', 'Dinamarca', 'astralis.png'),
...
(99, 'Virtus.pro', '2003-01-01', 'Rússia', 'virtuspro.png'),
(100, 'Cloud9', '2013-01-01', 'Estados Unidos', 'cloud9.png');

-- 100 registros para tabela Torneios:

INSERT INTO Torneios (id_torneio, nome, data_inicio, data_fim, local, premio_em_dinheiro) VALUES
(1, 'BLAST Premier Spring Finals', '2021-06-15', '2021-06-20', 'Dinamarca', 500000),
(2, 'IEM Katowice', '2022-02-16', '2022-02-27', 'Polônia', 1000000),
(3, 'ESL One Cologne', '2021-07-06', '2021-07-18', 'Alemanha', 750000),
(4, 'DreamHack Masters Spring', '2021-05-04', '2021-05-09', 'Suécia', 250000),
...
(99, 'Flashpoint Season 4', '2021-11-08', '2021-11-21', 'Estados Unidos', 1500000),
(100, 'EPIC League CIS', '2021-12-09', '2021-12-19', 'Rússia', 500000);

-- 100 registros para tabela Partidas:

INSERT INTO Partidas (id_partida, data_partida, hora_partida, equipe_vencedora, equipe_perdedora, torneio)
VALUES
(1, '2023-03-01', '15:00:00', 'Furia','Virtus.pro', 'IEM Katowice'),
(2, '2023-03-03', '17:30:00', 'Astralis', 'Cloud9', 'IEM Katowice'),
(3, '2023-03-04', '10:00:00', 'MIBR', 'Imperial', 'IEM Katowice'),
(4, '2023-03-05', '19:00:00', 'Virtus.pro', 'G2 Esports', 'IEM Katowice'),
...
(99, '2023-03-11', '20:45:00', 'Astralis', 'G2 Esports', 'IEM Katowice'),
(100, '2023-03-14', '16:00:00', 'Furia', 'Cloud9', 'IEM Katowice');

-- 100 registros para tabela arenas:

INSERT INTO arena (id, nome, local, capacidade, datainicio, datafim, torneio)
VALUES
(1, 'Arena A', 'São Paulo', 1000, '2023-04-01', '2023-04-05', 'BLAST Premier Spring Finals'),
(2, 'Arena B', 'Rio de Janeiro', 1500, '2023-05-10', '2023-05-15', 'IEM Katowice'),
(3, 'Arena C', 'Curitiba', 800, '2023-07-01', '2023-07-05', 'ESL One Cologne'),
(4, 'Arena D', 'Belo Horizonte', 1200, '2023-08-15', '2023-08-20', 'DreamHack Masters Spring'),
...
(99, 'Arena F', 'Salvador', 1100, '2023-10-01', '2023-10-05', 'Flashpoint Season 4'),
(100, 'Arena G', 'Fortaleza', 1300, '2023-11-01', '2023-11-05', 'EPIC League CIS');


-- Operadores de comparação:

--1. Selecionar todas as equipes fundadas antes de 2000:

SELECT * FROM Equipes WHERE data_fundacao < '2000-01-01';


--2. Selecionar todos os jogadores com nacionalidade diferente de brasileira:

SELECT * FROM Jogadores WHERE nacionalidade <> 'Brasileiro';


-- Combinando diferentes operadores lógicos:

--31. Selecionar todas as partidas em que a equipe vencedora foi a equipe 1 e a equipe perdedora não foi a equipe 2:

SELECT * FROM Partidas WHERE equipe_vencedora = 1 AND equipe_perdedora <> 2;


--2. Selecionar todas as equipes que não são brasileiras e foram fundadas depois de 2000 ou possuem um apelido com mais de 5 caracteres:

SELECT * FROM Equipes WHERE (pais_origem <> 'Brasil' AND data_fundacao > '2000-01-01') OR CHAR_LENGTH(nome) > 5;


-- Operadores de intervalo:

--1. Selecionar todas as partidas que aconteceram entre 2020-01-01 e 2021-12-31:

SELECT * FROM Partidas WHERE data_partida BETWEEN '2020-01-01' AND '2021-12-31';


--2. Selecionar todas as equipes fundadas entre 1990 e 2000:

SELECT * FROM Equipes WHERE data_fundacao >= '1990-01-01' AND data_fundacao <= '2000-12-31';


--Operadores de padrão:

--1. Selecionar todas as equipes que possuem a palavra "Sport" no nome:

SELECT * FROM Equipes WHERE nome LIKE '%Sport%';


--2. Selecionar todos os jogadores que possuem um apelido iniciado com a letra "J":

SELECT * FROM Jogadores WHERE apelido LIKE 'J%';


--Operadores de agregação:

--1. Selecionar a média de idade dos jogadores:

SELECT AVG(DATEDIFF(NOW(), data_nascimento)/365) AS media_idade FROM Jogadores;


--2. Selecionar a soma do prêmio em dinheiro de todos os torneios:

SELECT SUM(premio_em_dinheiro) AS total_premio FROM Torneios;


--3. Selecionar o número total de partidas disputadas:

SELECT COUNT(*) AS total_partidas FROM Partidas;


--4. Selecionar o nome da equipe com o maior número de jogadores:

SELECT E.nome, COUNT(*) AS total_jogadores FROM Equipes E INNER JOIN Jogadores J ON E.id_equipe = J.equipe_atual GROUP BY E.id_equipe ORDER BY total_jogadores DESC LIMIT 1;