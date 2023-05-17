/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 17/05/2023
*/


-- Criar a View de Relatório:
-- Exemplo de criação da View:

CREATE VIEW RelatorioPartidas AS
SELECT p.id_partida, p.data_partida, p.hora_partida, e1.nome AS equipe_vencedora, e2.nome AS equipe_perdedora, t.nome AS torneio
FROM Partidas p
JOIN Equipes e1 ON p.equipe_vencedora = e1.id_equipe
JOIN Equipes e2 ON p.equipe_perdedora = e2.id_equipe
JOIN Torneios t ON p.torneio = t.id_torneio;



-- Criar um Usuário com Restrição de Acesso à View:

CREATE USER usuario_relatorio@'localhost' IDENTIFIED BY 'senha_usuario';
GRANT SELECT ON nome_banco_de_dados.RelatorioPartidas TO usuario_relatorio@'localhost';



-- Criar um Usuário com Permissão de Leitura em Todo o Banco de Dados:

CREATE USER usuario_leitura@'localhost' IDENTIFIED BY 'senha_usuario';
GRANT SELECT ON nome_banco_de_dados.* TO usuario_leitura@'localhost';