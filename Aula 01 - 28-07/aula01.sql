-- AULA 01: 28/07

/*
CREATE TABLE livro(
	isbn INTEGER PRIMARY KEY, -- livro_pk
	titulo VARCHAR(50)
);
*/


CREATE TABLE livro(
	isbn INTEGER, -- pk_livro
	titulo VARCHAR(50),
	CONSTRAINT pk_livro PRIMARY KEY (isbn)
);

CREATE TABLE aluno(
	prontuario VARCHAR(15),
	nome VARCHAR(40) NOT NULL,
	idade INTEGER,

	-- Restrição de chave primária
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- INSERT: popular as tabelas

INSERT INTO aluno (prontuario, nome, idade) VALUES
('12AB', 'Pedro Antônio', 20),
('13CD', 'Ana Vasconcelos', 21),
('14EF', 'Thiago Alves', 19),
('15GH', 'Marcela Silva', 20);

SELECT * FROM aluno;
-- ordena pelo momento da alteração 
-- (alterados recentemente ficam ao final)

--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- UPDATE

-- Atualizando apenas uma coluna por UPDATE
UPDATE aluno SET idade = 21 WHERE prontuario = '12AB';

-- Atualizando mais de uma coluna por UPDATE
/* Atualizando o nome da aluna Ana Vasconcelos para Ana Mara Vasconcelos e a idade dela para 22 */
UPDATE aluno SET nome = 'Ana Mara Vasconcelos', idade = 22 WHERE prontuario = '13CD';