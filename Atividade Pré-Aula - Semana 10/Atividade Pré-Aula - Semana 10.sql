/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 17/05/2023
*/


-- Criar a View de relatório:

CREATE VIEW RelatorioPartidas AS
SELECT p.id_partida, p.data_partida, p.hora_partida, e1.nome AS equipe_vencedora, e2.nome AS equipe_perdedora, t.nome AS torneio
FROM Partidas p
JOIN Equipes e1 ON p.equipe_vencedora = e1.id_equipe
JOIN Equipes e2 ON p.equipe_perdedora = e2.id_equipe
JOIN Torneios t ON p.torneio = t.id_torneio;

-- Nesse exemplo, a View "RelatorioPartidas" seleciona informações das tabelas "Partidas", "Equipes" e "Torneios" usando joins para obter os nomes das equipes vencedora e perdedora, bem como o nome do torneio.



-- Criar um novo usuário no banco de dados:


CREATE USER 'usuario_restrito'@'localhost' IDENTIFIED BY 'senha_usuario';

Substitua 'usuario_restrito' pelo nome do usuário desejado e 'senha_usuario' pela senha correspondente.



-- Conceder acesso somente leitura à View para o usuário restrito:

GRANT SELECT ON esports.RelatorioPartidas TO 'usuario_restrito'@'localhost';