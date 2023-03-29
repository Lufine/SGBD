/*
Curso de Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
DATA: 28/03/2023
Dev: Luiz Filipe - 2111287
*/

-- Criação da tabela Consultórios
CREATE TABLE Consultorios (
  idConsultorio INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  localizacao VARCHAR(50) NOT NULL
);

-- Criação da tabela Profissionais
CREATE TABLE Profissionais (
  idProfissional INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  especialidade VARCHAR(50) NOT NULL,
  registroCRM VARCHAR(10) NOT NULL
);

-- Criação da tabela Pacientes
CREATE TABLE Pacientes (
  idPaciente INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  dataNascimento DATE NOT NULL,
  numConvenio VARCHAR(20) NOT NULL
);

-- Criação da tabela Agendamentos
CREATE TABLE Agendamentos (
  idAgendamento INTEGER PRIMARY KEY,
  dataHora DATETIME NOT NULL,
  idPaciente INTEGER NOT NULL,
  idProfissional INTEGER NOT NULL,
  FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
  FOREIGN KEY (idProfissional) REFERENCES Profissionais(idProfissional)
);

/* Código SQL - DDL:
   Código SQL - DML (INSERT, UPDATE, DELETE):

   Exemplo de INSERT para inserir um novo agendamento:
*/

INSERT INTO Agendamentos (data_hora, id_paciente, id_profissional) VALUES ('2023-04-10 14:30:00', 1234, 5678);

-- Exemplo de UPDATE para atualizar os dados de um agendamento existente:

UPDATE Agendamentos SET data_hora = '2023-04-10 15:00:00', id_paciente = 4321 WHERE id_agendamento = 1;

-- Exemplo de DELETE para excluir um agendamento de consulta:

DELETE FROM Agendamentos WHERE id_agendamento = 1;

/* Código SQL - DQL:

   Exemplo de SELECT para listar todos os consultórios disponíveis na clínica:
*/

SELECT * FROM Consultorios;

-- Exemplo de SELECT para listar todos os profissionais da clínica e suas respectivas especialidades:

SELECT * FROM Profissionais;

-- Exemplo de SELECT para listar todos os pacientes da clínica e suas respectivas datas de nascimento:

SELECT * FROM Pacientes;

-- Exemplo de SELECT para listar todas as consultas agendadas para um determinado dia:

SELECT * FROM Agendamentos WHERE DATE(data_hora) = '2023-04-10';

-- Exemplo de SELECT para listar todas as consultas agendadas para um determinado profissional:

SELECT * FROM Agendamentos WHERE id_profissional = 5678;

-- Exemplo de SELECT para listar todas as consultas agendadas para um determinado paciente:

SELECT * FROM Agendamentos WHERE id_paciente = 1234;

/*Operadores de comparação:

"=": igual a
"<>": diferente de
"<": menor que
">": maior que
"<=": menor ou igual a
">=": maior ou igual a

Combinando diferentes operadores lógicos:

"AND": operador lógico "E", onde a condição só é verdadeira se as duas expressões forem verdadeiras.
"OR": operador lógico "OU", onde a condição é verdadeira se pelo menos uma das expressões for verdadeira.
"NOT": operador lógico "NÃO", onde a condição é verdadeira se a expressão for falsa e vice-versa.*/

/*Operadores de intervalo:

BETWEEN: retorna valores dentro de um intervalo especificado. Exemplo: */

SELECT * FROM Pacientes WHERE dataNascimento BETWEEN 1998 AND 2005;

/*NOT BETWEEN: retorna valores fora de um intervalo especificado. Exemplo: */

SELECT * FROM Pacientes WHERE dataNascimento NOT BETWEEN 1998 AND 2005;

/*IN: retorna valores que correspondem a uma lista de valores especificados. Exemplo: */

SELECT * FROM Pacientes WHERE nome IN ('João', 'Maria', 'José');

/*NOT IN: retorna valores que não correspondem a uma lista de valores especificados. Exemplo:*/

SELECT * FROM Pacientes WHERE nome NOT IN ('João', 'Maria', 'José');

/*Operadores de padrão:

LIKE: retorna valores que correspondem a um padrão especificado usando caracteres curinga (% ou _). Exemplo: */

SELECT * FROM Pacientes WHERE nome LIKE 'Jo%';

/*NOT LIKE: retorna valores que não correspondem a um padrão especificado usando caracteres curinga (% ou _). Exemplo: */

SELECT * FROM Pacientes WHERE nome NOT LIKE 'Jo%';

/*REGEXP: retorna valores que correspondem a uma expressão regular especificada. Exemplo: */

SELECT * FROM Pacientes WHERE nome REGEXP '^Joa(n|quim)$';

/*NOT REGEXP: retorna valores que não correspondem a uma expressão regular especificada. Exemplo: */

SELECT * FROM Pacientes WHERE nome NOT REGEXP '^Joa(n|quim)$';

/*JOINS são utilizados para combinar dados de diferentes tabelas em um único resultado. Existem quatro tipos principais de JOINS: INNER JOIN, LEFT JOIN, RIGHT JOIN e FULL OUTER JOIN. Abaixo apresento alguns exemplos de JOINS para o banco de dados da rede de clínica médica:

INNER JOIN para listar todas as consultas agendadas com o nome do paciente e do profissional:*/

SELECT Agendamentos.*, Pacientes.nome AS nome_paciente, Profissionais.nome AS nome_profissional 
FROM Agendamentos 
INNER JOIN Pacientes ON Agendamentos.id_paciente = Pacientes.id 
INNER JOIN Profissionais ON Agendamentos.id_profissional = Profissionais.id;

-- LEFT JOIN para listar todos os consultórios, mesmo que não tenham agendamentos:

SELECT Consultorios., Agendamentos. 
FROM Consultorios 
LEFT JOIN Agendamentos ON Consultorios.id = Agendamentos.id_consultorio;

-- RIGHT JOIN para listar todos os agendamentos, mesmo que não tenham consultórios associados:

SELECT Agendamentos., Consultorios. 
FROM Agendamentos 
RIGHT JOIN Consultorios ON Agendamentos.id_consultorio = Consultorios.id;

-- FULL OUTER JOIN para listar todos os pacientes e seus agendamentos, incluindo os pacientes que não têm agendamentos:

SELECT Pacientes., Agendamentos. 
FROM Pacientes 
FULL OUTER JOIN Agendamentos ON Pacientes.id = Agendamentos.id_paciente;