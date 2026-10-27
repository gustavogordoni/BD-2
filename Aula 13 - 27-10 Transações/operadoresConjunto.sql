--Exemplos operadores de conjuntos
CREATE TABLE ALUNO (prontuario VARCHAR(10),
				    nomeAlu VARCHAR (50),
				    CONSTRAINT pk_aluno PRIMARY KEY (prontuario));

--dados dos alunos
INSERT INTO ALUNO VALUES
		('VP10', 'Ana Paula'), ('VP11', 'Carlos'), ('VP12', 'Danilo'),
		('VP13', 'Pedro'), ('VP14', 'Marcela'), ('VP15', 'Cecília'),
		('VP16', 'Carla'), ('VP17', 'Joana'), ('VP18', 'Júlio');

CREATE TABLE PROFESSOR (prontuario VARCHAR(10),
				    nomePro VARCHAR (50),
				    CONSTRAINT pk_professor PRIMARY KEY (prontuario));

--Dados do professor
INSERT INTO PROFESSOR VALUES
		('VP10', 'Daniela'), ('VP11', 'Cristiane'), ('VP12', 'André'),
		('VP13', 'Joana'), ('VP14', 'Carlos');
		
CREATE TABLE FUNCIONARIO (idFunc INTEGER,
				    nomeFunc VARCHAR (50),
				    CONSTRAINT pk_Funcionario PRIMARY KEY (idFunc));
					
INSERT INTO FUNCIONARIO VALUES
		(1, 'Carlos'), (2, 'Otávio'), (3, 'Ana Paula'), (4, 'Marcela'),
		(5, 'Thiago');



-- Selecione o nome de todos os alunos, professores e funcionários.
select nomeAlu FROM aluno
UNION
select nomePro FROM professor
UNION 
select nomefunc FROM funcionario;
-- 14 retornados: 5 repetições 

-- Refaça a consulta acima para trazer também as linhas repetidas
select nomeAlu FROM aluno
UNION ALL
select nomePro FROM professor
UNION ALL
select nomefunc FROM funcionario;
-- 19



-- 3. UNION Selecione os nomes que aparecem nas tabelas aluno, professor e
-- funcionários.
select nomealu FROM aluno
UNION
select nomePro FROM professor
UNION
select nomeFunc FROM funcionario;

-- 4. Selecione todos os nomes que aparecem na tabela aluno, mas não na
-- tabela funcionário.
select nomealu FROM aluno
EXCEPT
select nomeFunc FROM funcionario;


-- 5. Faça o contrário do 4.
select nomeFunc FROM funcionario
EXCEPT
select nomealu FROM aluno;

--  6. INTERSECT Selecione os nomes que aparecem na tabela aluno, professor e
-- funcionário
select nomealu FROM aluno
INTERSECT
select nomePro FROM professor
INTERSECT
select nomeFunc FROM funcionario;