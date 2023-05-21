/*
Course: Software Engineering - UniEVANGÉLICA
Subject: Database Management Systems
Dev: Luiz Filipe Neuwirth
Date: 21/05/2023
*/

/*
Para aprimorar o projeto "Despensa Virtual" com conceitos avançados de banco de dados, como triggers, procedures, functions, views, usuários e permissões, você pode implementar as seguintes modificações:
*/

/*
Triggers: Crie triggers para garantir a integridade dos dados e rastrear mudanças importantes no banco de dados. Por exemplo, você pode criar um trigger que seja acionado quando uma nova notificação é inserida na tabela NOTIFICACAO, verificando se o produto já existe na tabela ALIMENTOS e atualizando sua quantidade em ALIMENTOS de acordo com a quantidade na notificação.
*/

/*
Procedures e Functions: Adapte ou crie novas procedures e functions para facilitar operações comuns no banco de dados. Por exemplo, você pode criar uma procedure para inserir um novo produto na tabela ALIMENTOS e atualizar automaticamente a tabela NOTIFICACAO com a validade do produto.
*/

/*
Views: Desenvolva views para simplificar consultas complexas e melhorar a segurança e a manutenção do banco de dados. Por exemplo, você pode criar uma view que retorne os produtos da tabela ALIMENTOS juntamente com suas respectivas notificações da tabela NOTIFICACAO, facilitando a visualização dos dados relacionados.
*/

/*
Usuários e Permissões: Defina diferentes tipos de usuários e configure suas permissões no banco de dados. Por exemplo, você pode criar um usuário administrador com permissões completas para gerenciar todas as tabelas e um usuário com acesso somente leitura para consultar os dados.
*/

/*
Exemplo de implementação de um trigger:
*/

-- Trigger que atualiza a quantidade de um produto na tabela ALIMENTOS quando uma nova notificação é inserida
DELIMITER //

CREATE TRIGGER atualizar_quantidade AFTER INSERT ON NOTIFICACAO
FOR EACH ROW
BEGIN
    UPDATE ALIMENTOS
    SET QUANTIDADE_PRODUTO = QUANTIDADE_PRODUTO - 1
    WHERE ID_PRODUTO = NEW.ID_PRODUTO;
END//

DELIMITER ;

/*
Exemplo de criação de uma view:
*/

-- View que retorna os produtos da tabela ALIMENTOS juntamente com suas respectivas notificações da tabela NOTIFICACAO
CREATE VIEW PRODUTOS_COM_NOTIFICACAO AS
SELECT A.ID_PRODUTO, A.VALIDADE, A.QUANTIDADE_PRODUTO, N.PRODUTO AS NOTIFICACAO
FROM ALIMENTOS A
LEFT JOIN NOTIFICACAO N ON A.ID_PRODUTO = N.ID_PRODUTO;

/*
Exemplo de criação de um usuário e configuração de permissões:
*/

-- Criar usuário administrador
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'senha123';

-- Conceder todas as permissões ao usuário administrador
GRANT ALL PRIVILEGES ON NADESPENSA.* TO 'admin'@'localhost';

-- Criar usuário com acesso somente leitura
CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'senha456';

-- Conceder permissões de leitura ao usuário somente leitura
GRANT SELECT ON NADESPENSA.* TO 'readonly'@'localhost';