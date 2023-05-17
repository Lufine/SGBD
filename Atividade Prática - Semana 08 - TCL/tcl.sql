/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 17/05/2023
*/

-- Início da transação
BEGIN;

-- Realizar as operações desejadas no banco de dados dentro da transação
-- Inserção de um novo jogador
INSERT INTO Jogadores (id_jogador, nome, apelido, data_nascimento, nacionalidade, equipe_atual)
VALUES (1, 'João', 'Jo', '1990-01-01', 'Brasil', 1);

-- Realizar outras operações necessárias dentro da transação

-- Se todas as operações forem concluídas com sucesso, fazer o commit da transação
COMMIT;

-- Caso ocorra algum erro ou deseje desfazer as operações realizadas dentro da transação, faça o rollback

ROLLBACK;
