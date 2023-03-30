/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 28/03/2023
*/

--Criação tabela Jogadores
CREATE TABLE Jogadores (
id_jogador INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
apelido VARCHAR(20) NOT NULL UNIQUE,
data_nascimento DATE,
nacionalidade VARCHAR(50),
equipe_atual INT,
CONSTRAINT fk_equipe_atual
FOREIGN KEY (equipe_atual)
REFERENCES Equipes(id_equipe)
);

/*A primeira tabela é "Jogadores", com atributos como id, nome, apelido, data de nascimento, nacionalidade e equipe atual, onde o último é uma chave estrangeira que se refere à tabela "Equipes".*/

--Criação tabela Equipes
CREATE TABLE Equipes (
id_equipe INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL UNIQUE,
data_fundacao DATE,
pais_origem VARCHAR(50),
logo VARCHAR(100)
);

/*A tabela "Equipes" armazena informações sobre cada equipe, incluindo seu nome, data de fundação, país de origem e logotipo.*/

--Criação tabela Torneios
CREATE TABLE Torneios (
id_torneio INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL UNIQUE,
data_inicio DATE,
data_fim DATE,
local VARCHAR(50),
premio_em_dinheiro DECIMAL(10,2)
);

/*A tabela "Torneios" é responsável por armazenar informações sobre cada torneio, como seu nome, data de início e término, localização e prêmio em dinheiro.*/

--Criação tabela Partidas
CREATE TABLE Partidas (
id_partida INT PRIMARY KEY,
data_partida DATE,
hora_partida TIME,
equipe_vencedora INT,
equipe_perdedora INT,
torneio INT,
CONSTRAINT fk_equipe_vencedora
FOREIGN KEY (equipe_vencedora)
REFERENCES Equipes(id_equipe),
CONSTRAINT fk_equipe_perdedora
FOREIGN KEY (equipe_perdedora)
REFERENCES Equipes(id_equipe),
CONSTRAINT fk_torneio
FOREIGN KEY (torneio)
REFERENCES Torneios(id_torneio)
);

/*A tabela "Partidas" contém informações sobre as partidas, incluindo o seu identificador único ("id_partida"), a data e hora da partida ("data_partida" e "hora_partida"), a equipe vencedora e perdedora ("equipe_vencedora" e "equipe_perdedora"), e o torneio ao qual a partida pertence ("torneio"). Esta tabela também contém chaves estrangeiras para as tabelas "Equipes" e "Torneios" para referenciar a equipe vencedora e perdedora e o torneio, respectivamente.*/

--Criação tabela arena
CREATE TABLE arena(
	id int PRIMARY KEY,
  	nome varchar(30),
  	local varchar(30),
  	capacidade int,
  	datainicio date,
    datafim date,
  	torneio varchar(30)
)

/*A tabela "arena" contém informações sobre as arenas em que as partidas ocorrem, incluindo o seu identificador único ("id"), o nome da arena ("nome"), o local onde está localizada ("local"), a sua capacidade ("capacidade"), a data de início e de término do torneio ao qual a arena pertence ("datainicio" e "datafim"), e o nome do torneio ("torneio").*/

-- Alteração
ALTER TABLE Equipes
ADD CONSTRAINT fk_id_jogador_capitao
FOREIGN KEY (id_jogador_capitao)
REFERENCES Jogadores(id_jogador);

/*inclui uma alteração na tabela "Equipes", adicionando uma chave estrangeira que se refere à tabela "Jogadores", especificamente ao id do jogador que atua como capitão da equipe.*/

-- Exclusão
DROP TABLE arena;

/*Aqui foi feita a exclusão da tabela "arena".*/