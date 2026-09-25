-- 1
CREATE TABLE curso(
	idCurso integer, 
	nomeCurso varchar(30), 
	nroSemestres integer,
	dtaFundacao date,
	
	CONSTRAINT pk_curso PRIMARY KEY (idCurso)
);

CREATE TABLE aluno(
	prontuario varchar(30),
	nome varchar(30),
	dtaNasc date,
	sexo char(1),
	idCurso INTEGER,

	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (idCurso) REFERENCES CURSO (idCurso)
);

-- 2
INSERT INTO curso VALUES 
(1, 'Ciência da Computação', 8, '01/03/1986'),
(2, 'Direito', 8, '14/12/1975'),
(3, 'Medicina', 12, '05/07/2000'),
(4, 'Engenharia Elétrica', 10, '10/12/1996'),
(5, 'Biologia', 8, '06/06/1993'),
(6, 'Matemática', 8, '01/07/1968');

INSERT INTO aluno VALUES 
('11aa', 'Paulo', '01/07/1986', 'M', 1),
('11bb', 'Ana', '08/07/1990', 'F', 5),
('11cc', 'Júlio', '08/05/1980', 'M', 3),
('11dd', 'Carlos', '10/11/1983', 'M', 2),
('11ee', 'Gabriele', '08/05/1990', 'F', 3),
('11ff', 'Antônio', '15/06/1955', 'M', 4),
('11gg', 'Ana', '08/12/1975', 'F', 5),
('11hh', 'Mara', '07/07/1970', 'F', 1),
('11ii', 'Roberto', '01/07/1956', 'M', 3),
('11jj', 'Carmen', '03/02/1950', 'F', 2);

-- 3
INSERT INTO aluno VALUES
('11kk', 'Pedro Roberto', '11/01/2000', 'M', 3);

-- DELETE
-- 4
DELETE FROM curso WHERE idCurso = 2;
-- Erro; existem elementos que dependem desse registro;

-- 5
DELETE FROM aluno WHERE idCurso = 2;

-- 6
DELETE FROM curso WHERE idCurso = 2;
-- Sucesso; NÃO existem elementos que dependem desse registro;

-- UPDATE
-- 7
UPDATE curso SET idCurso = 10 WHERE idCurso = 3;
-- Erro; existem elementos que dependem desse registro;

-- 8
UPDATE aluno SET nome = 'Ana Paula' WHERE prontuario = '11gg';