-- AULA 02: 04/08

CREATE TABLE aluno(
	prontuario VARCHAR(15),
	nomeAluno VARCHAR(40) NOT NULL,
	idade INTEGER,

	-- Restrição de chave primária
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- INSERT: popular as tabelas

INSERT INTO aluno (prontuario, nomeAluno, idade) VALUES
('VP10', 'Rafael', 25),
('VP20', 'Ana Maria', 22),
('VP30', 'João Carlos', 21),
('VP40', 'Joana', 23),
('VP50', 'Danilo', 20);

SELECT * FROM aluno;
-- ordena pelo momento da alteração 
-- (alterados recentemente ficam ao final)

--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- UPDATE

-- Atualizando apenas uma coluna por UPDATE
UPDATE aluno SET idade = 23 WHERE prontuario = 'VP20';

-- Atualizando mais de uma coluna por UPDATE
/* DANILO: Idade para 21 e nome para Danilo José */
UPDATE aluno SET nomeAluno = 'Danilo José', idade = 21 WHERE prontuario = 'VP50';


--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- DELETE

/* Eliminar os alunos que possuem mais de 21 anos */
DELETE FROM aluno WHERE idade > 21;

