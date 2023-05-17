/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 17/05/2023
*/



-- Function:

-- Criar uma função para calcular a média de idade dos jogadores de uma determinada equipe:


CREATE FUNCTION calcular_media_idade_equipe(nome_equipe VARCHAR(50)) RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE media_idade DECIMAL(10, 2);
  -- Lógica para calcular a média de idade dos jogadores da equipe
  RETURN media_idade;
END;





-- Procedure:

-- Criar uma procedure para inserir uma nova partida no sistema:


CREATE PROCEDURE inserir_partida(
  IN data_partida DATE,
  IN hora_partida TIME,
  IN equipe_vencedora INT,
  IN equipe_perdedora INT,
  IN torneio INT
)
BEGIN
  -- Lógica para inserir os dados da nova partida na tabela Partidas
END;





-- Trigger:

-- Criar um trigger para atualizar automaticamente a data de término de um torneio quando todas as partidas forem concluídas:


CREATE TRIGGER atualizar_data_fim_torneio
AFTER INSERT ON Partidas
FOR EACH ROW
BEGIN
  -- Lógica para verificar se todas as partidas do torneio foram concluídas
  -- Atualizar a data de término do torneio, se necessário
END;





-- Event:

-- Criar um evento para realizar backups diários do banco de dados:


CREATE EVENT realizar_backup_diario
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
  -- Lógica para realizar o backup do banco de dados
END;





-- View:

-- Criar uma view para exibir a lista de jogadores de uma equipe em ordem alfabética:


CREATE VIEW lista_jogadores_equipe AS
SELECT nome, apelido, data_nascimento, nacionalidade
FROM Jogadores
WHERE equipe_atual = <id_equipe>
ORDER BY nome ASC;





-- Role:

-- Criar uma role para os administradores do sistema com permissões de acesso e manipulação em todas as tabelas:

CREATE ROLE admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Jogadores TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Equipes TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Torneios TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Partidas TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON arena TO admin;