--Comentário de uma linha
/*
Comentário de mais de uma linha
*/
--Criação da tabela livro
CREATE TABLE LIVRO
	(
	 isbn INTEGER,
	 titulo VARCHAR (50) NOT NULL,
	 CONSTRAINT pk_livro PRIMARY KEY (isbn)
	);

--DROP TABLE LIVRO

--Tabela aluno
CREATE TABLE aluno
	(
	 prontuario VARCHAR (15),
	 nomeAluno VARCHAR (40) NOT NULL,
	 idade INTEGER,
	 CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
	);

--inserindo dados na tabela aluno
INSERT INTO aluno
	VALUES ('12AB', 'Pedro Antônio', 20);

INSERT INTO aluno 
	VALUES ('13CD', 'Ana Vasconcelos', 21),
		   ('14EF', 'Thiago Alves', 19),
		   ('15GH', 'Marcela Silva', 20);

SELECT * FROM aluno;

SELECT current_date - '2005/01/01';

--UPDATE
UPDATE aluno SET idade = 21
	WHERE prontuario = '12AB';

SELECT * FROM aluno ORDER BY nomeAluno DESC;

--ATUALIZAR o nome da Ana para Ana Paula Vasconcelos
-- e a sua idade de 21 para 22.
UPDATE aluno SET nomeAluno = 'Ana Paula Vasconcelos',
			     idade = 22
		WHERE prontuario = '13CD';





