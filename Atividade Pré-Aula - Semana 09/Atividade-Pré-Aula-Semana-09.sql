/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 17/05/2023
*/

-- Functions:

--     Cálculos complexos ou processamento de dados: Você pode criar funções para realizar cálculos complexos ou processamento de dados, como determinar a média de idade dos jogadores de uma equipe, calcular a pontuação média de um jogador em um torneio, etc.
--     Exemplo:

CREATE FUNCTION calcular_media_idade_equipe(id_equipe INT) RETURNS INT
BEGIN
  DECLARE media_idade INT;
  SELECT AVG(DATEDIFF(CURRENT_DATE, data_nascimento)) INTO media_idade
  FROM Jogadores
  WHERE equipe_atual = id_equipe;
  RETURN media_idade;
END;

-- Procedures:

--     Execução de tarefas complexas em sequência: As procedures podem ser utilizadas para agrupar uma sequência de comandos SQL em um único bloco, permitindo a execução de tarefas complexas de forma mais conveniente e organizada. Por exemplo, você pode criar uma procedure para realizar o registro de uma nova partida, atualizando as pontuações das equipes envolvidas e armazenando as informações relevantes.
--     Exemplo:

CREATE PROCEDURE registrar_partida(
  IN equipe_vencedora INT,
  IN equipe_perdedora INT,
  IN torneio INT
)
BEGIN
  -- Atualizar pontuação da equipe vencedora
  UPDATE Equipes SET pontuacao = pontuacao + 3 WHERE id_equipe = equipe_vencedora;
  
  -- Atualizar pontuação da equipe perdedora
  UPDATE Equipes SET pontuacao = pontuacao + 1 WHERE id_equipe = equipe_perdedora;
  
  -- Inserir registro da partida
  INSERT INTO Partidas (data_partida, hora_partida, equipe_vencedora, equipe_perdedora, torneio)
  VALUES (CURRENT_DATE, CURRENT_TIME, equipe_vencedora, equipe_perdedora, torneio);
END;

-- Triggers:

--     Execução automática de ações em resposta a eventos: Os triggers são acionados automaticamente em resposta a eventos específicos no banco de dados, permitindo a execução de ações adicionais. Por exemplo, você pode criar um trigger para atualizar a data de fim de um torneio sempre que uma nova partida for inserida.
--     Exemplo:

CREATE TRIGGER atualizar_data_fim_torneio
AFTER INSERT ON Partidas
FOR EACH ROW
BEGIN
  UPDATE Torneios
  SET data_fim = NEW.data_partida
  WHERE id_torneio = NEW.torneio;
END;

-- Events:

--     Execução de tarefas agendadas: Os events permitem agendar a execução de comandos SQL em intervalos regulares, facilitando tarefas como atualizações de pontuações, limpeza de dados, entre outras. Por exemplo, você pode criar um event para atualizar a pontuação das equipes automaticamente todos os dias à meia-noite.
--     Exemplo:

CREATE EVENT atualizar_pontuacao_diaria
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 1 DAY
DO
BEGIN
  UPDATE Equipes SET pontuacao = pontuacao + 1;
END;
