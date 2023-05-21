/*
Course: Software Engineering - UniEVANGÉLICA
Subject: Database Management Systems
Dev: Luiz Filipe Neuwirth
Date: 21/05/2023
*/

CREATE DATABASE NADESPENSA; -- criação do banco de dados

USE NADESPENSA; -- seleção do banco de

-- Criação de Tabelas
CREATE TABLE USUARIO ( -- criação da tabela USUARIO
    ID_USUARIO INT PRIMARY KEY NOT NULL, -- coluna ID_USUARIO como chave primária e não nula
    SENHA VARCHAR(20) UNIQUE NOT NULL, -- coluna SENHA como única e não nula
    NOME VARCHAR(70) NOT NULL -- coluna NOME como não nula
);

CREATE TABLE ALIMENTOS ( -- criação da tabela ALIMENTOS
    ID_PRODUTO INT PRIMARY KEY NOT NULL, -- coluna ID_PRODUTO como chave primária e não nula
    VALIDADE INT UNIQUE NOT NULL, -- coluna VALIDADE como única e não nula
    QUANTIDADE_PRODUTO INT NOT NULL -- coluna QUANTIDADE_PRODUTO como não nula
);

CREATE TABLE CONTA( -- criação da tabela CONTA
    ID_CONTA INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- coluna ID_CONTA como chave primária, não nula e auto-incrementada
    NOME VARCHAR(30) NOT NULL, -- coluna NOME como não nula
    ID_USUARIO INT NOT NULL, -- coluna ID_USUARIO como não nula
    FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO) -- chave estrangeira referenciando a tabela USUARIO
);

CREATE TABLE NOTIFICACAO( -- criação da tabela NOTIFICACAO
    ID_PRODUTO INT PRIMARY KEY NOT NULL, -- coluna ID_PRODUTO como chave primária e não nula
    PRODUTO VARCHAR(70) NOT NULL, -- coluna PROD como não nula
    VALIDADE INT UNIQUE NOT NULL, -- coluna VALIDADE como única e não nula
    ID_CONTA INT NOT NULL, -- coluna ID_CONTA como não nula
    FOREIGN KEY(ID_CONTA) REFERENCES CONTA(ID_CONTA), -- chave estrangeira referenciando a tabela CONTA
    FOREIGN KEY(ID_PRODUTO) REFERENCES ALIMENTOS(ID_PRODUTO) -- chave estrangeira referenciando a tabela ALIMENTOS
);

CREATE TABLE MERCADO_VIRTUAL( -- criação da tabela MERCADO_VIRTUAL
    PRODUTO VARCHAR(70) PRIMARY KEY NOT NULL, -- coluna PRODUTO como chave primária e não nula
    VALIDADE INT UNIQUE NOT NULL, -- coluna VALIDADE como única e não nula
    ID_CONTA INT NOT NULL, -- coluna ID_CONTA como não nula
    FOREIGN KEY(ID_CONTA) REFERENCES CONTA(ID_CONTA) -- chave estrangeira referenciando a tabela CONTA
);

-- Triggers
DELIMITER // -- altera o delimitador para criar o trigger

CREATE TRIGGER alimentos_after_insert -- criação do trigger alimentos_after_insert
AFTER INSERT -- após a inserção na tabela ALIMENTOS
ON ALIMENTOS FOR EACH ROW -- para cada linha inserida
BEGIN
    INSERT INTO LOG_ALIMENTOS (acao, id_produto validade, quantidade_produto, data_hora) -- insere na tabela LOG_ALIMENTOS
    VALUES ('INSERT', NEW.id_produto, NEW.validade, NEW.quantidade_produto, NOW()); -- os valores 'INSERT', o novo ID_PRODUTO, a nova VALIDADE, a nova QUANTIDADE_PRODUTO e a data e hora atual
END;
//

DELIMITER ; -- restaura o delimitador padrão

-- Procedures e Functions
-- Aqui você pode adicionar ou adaptar procedures e functions para facilitar operações comuns no banco de dados, como inserção, atualização, exclusão e cálculos específicos do domínio do projeto.

-- Procedure para inserir um novo usuário
CREATE PROCEDURE INSERIR_USUARIO(IN id_usuario INT, IN senha VARCHAR(20), IN nome VARCHAR(70))
BEGIN
    INSERT INTO USUARIO (ID_USUARIO, SENHA, NOME) VALUES (id_usuario, senha, nome);
END;

-- Function para calcular a quantidade total de produtos em estoque
CREATE FUNCTION CALCULAR_QUANTIDADE_TOTAL() RETURNS INT
BEGIN
    DECLARE quantidade_total INT;
    SELECT SUM(QUANTIDADE_PRODUTO) INTO quantidade_total FROM ALIMENTOS;
    RETURN quantidade_total;
END;

-- Views
-- Aqui você pode desenvolver views para simplificar consultas complexas e melhorar a segurança e a manutenção do banco de dados.

-- View para listar os produtos com validade próxima de expirar
CREATE VIEW PRODUTOS_VALIDADE_PROXIMA AS
SELECT PRODUTO, VALIDADE FROM ALIMENTOS WHERE VALIDADE <= DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- Usuários e Permissões
-- Aqui você pode definir diferentes tipos de usuários e configurar suas permissões no banco de dados. Isso pode incluir administradores, usuários com permissões limitadas e usuários com acesso somente leitura.

-- Criação de usuários
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'senha_admin';
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'senha_usuario';

-- Concessão de permissões
GRANT ALL PRIVILEGES ON NADESPENSA.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON NADESPENSA.* TO 'usuario'@'localhost';
