create table curso 
	(idCurso integer PRIMARY KEY, 
	 nomeCurso VARCHAR (30) NOT NULL, 
	 nroSemestres integer NOt NULL, 
	 dtaFundacao date
	 );
-- drop table curso
--SELECT * FROM curso;

create table aluno
	(prontuario VARCHAR (20) Primary key, 
	 pnome VARCHAR (15) NOT NULL, 
	 snome VARCHAR (30) not null, 
	 dtaNasc date, 
	 sexo char (1)
	 );
--DROP TABLE aluno
-- Adicionando chave estrangeira
ALTER TABLE aluno ADD column idCurso integer references curso (idCurso)ON DELETE CASCADE ON UPDATE CASCADE;

--SELECT * FROM aluno;


-- populando a tabela curso

INSERT INTO curso values (1, 'Sistemas de Informação', 8, '01/02/2021');
INSERT INTO curso values (2, 'Direito', 8, '14/12/1975');
INSERT INTO curso values (3, 'Medicina', 12, '05/07/2000');
INSERT INTO curso values (4, 'Engenharia Elétrica', 10, '10/12/1996');
INSERT INTO curso values (5, 'Biologia', 8, '06/06/1993');
INSERT INTO curso values (6, 'Matemática', 8, '01/07/1968');
INSERT INTO curso values (7, 'Engenharia Civil', 10, '01/02/2015');

-- populando a tabela aluno

INSERT INTO aluno values ('11aa', 'Paulo', 'Henrique', '01/07/1986','M',1);
INSERT INTO aluno values ('11bb', 'Ana', 'Paula Siqueira', '08/07/1990','F',5);
INSERT INTO aluno values ('11cc', 'Júlio', 'Cesar', '08/05/1980','M',3);
INSERT INTO aluno values ('11dd', 'Carlos', 'Augusto', '10/11/1983','M',2);
INSERT INTO aluno values ('11ee', 'Gabriele', 'Antunes', '08/05/1990','F',3);
INSERT INTO aluno values ('11ff', 'Antônio', 'Fagundes', '15/06/1955','M',4);
INSERT INTO aluno values ('11gg', 'Ana', 'Paula Arósio', '08/12/1975','F',5);
INSERT INTO aluno values ('11hh', 'Mara', 'Maravilha', '07/07/1970','F',1);
INSERT INTO aluno values ('11ii', 'Roberto', 'Carlos', '01/07/1956','M',3);
INSERT INTO aluno values ('11jj', 'Carmen', 'Miranda', '03/02/1950','F',2);
INSERT INTO aluno values ('11kk', 'Rubens', 'Cardoso', '09/11/1974','M',4);
INSERT INTO aluno values ('11ll', 'Joana', 'de Assis', '07/04/1982','F',1);
INSERT INTO aluno values ('11mm', 'Paola', 'de Oliveira', '06/03/1985','F',6);
INSERT INTO aluno values ('11nn', 'Joaquim', 'Silva', '25/10/1968','M',6);
INSERT INTO aluno values ('11oo', 'Padre', 'Irlandês', '30/10/1960','M',5);
INSERT INTO aluno values ('11pp', 'Angelina', 'Jolie', '20/03/1978','F',4);
INSERT INTO aluno values ('11qq', 'Derci', 'Golçalves', '02/04/1920','F',3);
INSERT INTO aluno values ('11rr', 'Túlio', 'Maravilha', '30/08/1972','M',3);
INSERT INTO aluno values ('11ss', 'Carla', 'Ribeiro', '08/03/1988','F',2);
INSERT INTO aluno values ('11tt', 'Olivia', 'Palito', '18/09/1977','F',1);
INSERT INTO aluno values ('11uu', 'Marinheiro', 'Popeye', '21/02/1968','M',2);
INSERT INTO aluno values ('11vv', 'Alberto', 'Roberto', '15/03/1955','M',4);
INSERT INTO aluno values ('11ww', 'Julia', 'Roberts', '07/05/1972','F',5);
INSERT INTO aluno values ('11xx', 'Thais', 'Ferçosa', '16/04/1983','F',6);
INSERT INTO aluno values ('11yy', 'Barack', 'Obama', '18/09/1956','M',1);
INSERT INTO aluno values ('11zz', 'Osama', 'Bin Laden', '13/12/1960','M',1);
INSERT INTO aluno values ('22aa', 'Paula', 'Fernandes', '03/03/1983','F',2);
INSERT INTO aluno values ('22bb', 'Lara', 'Rodrigues', '10/10/1991','F',2);
INSERT INTO aluno values ('22cc', 'Mariana', 'Ximenes', '07/08/1982','F',3);
INSERT INTO aluno values ('22dd', 'Marcos', 'Paulo', '18/06/1975','M',4);
INSERT INTO aluno values ('22ee', 'Beatriz', 'Seagal', '15/12/1965','F',4);
INSERT INTO aluno values ('22ff', 'Luciano', 'Huck', '04/06/1978','M',5);
INSERT INTO aluno values ('22gg', 'Marcelo', 'Taz', '06/04/1972','M',6);
INSERT INTO aluno values ('22hh', 'Sabrina', 'Sato', '08/11/1982','F',6);
INSERT INTO aluno values ('22ii', 'Vovó', 'Mafalda', '04/11/1950','F',5);
INSERT INTO aluno values ('22jj', 'Joana', 'Darc', '07/07/1955','F',3);
INSERT INTO aluno values ('22ll', 'Henrique', 'VIII', '15/03/1942','M',1);
INSERT INTO aluno values ('22kk', 'Charles', 'Chapilin', '03/11/1926','M',2);
INSERT INTO aluno values ('22mm', 'Frodo', 'Baggins', '08/12/1975','M',3);
INSERT INTO aluno values ('22nn', 'Lady', 'Gaga', '23/07/1985','F',4);
INSERT INTO aluno values ('22oo', 'Katherina', 'Zeta Jones', '07/12/1977','F',5);
INSERT INTO aluno values ('22pp', 'Ana', 'Carla', '07/12/2005','F',4);
INSERT INTO aluno values ('22qq', 'Pedro', 'Henrique', '10/08/2006','M',7);
INSERT INTO aluno values ('22rr', 'Ana', 'Carla', '07/12/2005','F',7);
INSERT INTO aluno values ('22ss', 'Júlia', 'Silva', '07/12/2003','F',7);
INSERT INTO aluno values ('22tt', 'Beto', 'Antunes', '22/05/2005','M',7);


-- tabela professor
CREATE table professor
	(prontuario integer primary key,
	 pnome VARCHAR (20) NOT NULL, 
	 snome VARCHAR (30) NOT NULL, 
	 dtaNasc date);
--DROP TABLE professor


-- populando tabela professor
INSERT INTO professor values (1,'Rafael','Miani','11/01/1984');
INSERT INTO professor values (2,'Pedro','Antonio','15/07/1980');
INSERT INTO professor values (3,'Natal','Henrique','22/12/1981');
INSERT INTO professor values (4,'Carla','Joana','30/10/1972');
INSERT INTO professor values (5,'Raquel','Silva','03/04/1980');
INSERT INTO professor values (6,'Ana','Carla','07/08/1978');
INSERT INTO professor values (7,'Roberto','Silva','13/07/1960');
INSERT INTO professor values (8,'Mariana','Cunha','18/05/1982');
INSERT INTO professor values (9,'Sebastião','Roberto','15/03/1980');
INSERT INTO professor values (10,'Mauro','Augusto','21/03/1978');


-- tabela professorLecionaAluno
create table professorLecionaAluno 
	(prontuarioAluno VARCHAR(20) NOT NULL references aluno 
	 ON DELETE CASCADE ON UPDATE CASCADE,
	 prontuarioProfessor integer NOT NULL references professor 
	 ON DELETE CASCADE ON UPDATE CASCADE,
	 ano integer not null, 
	 semestre integer not null, 
	 nota real, 
	 CONSTRAINT pk_alunoProf PRIMARY KEY (prontuarioAluno,prontuarioProfessor,ano,semestre));
		 
-- drop table professorLecionaAluno
--ALTER TABLE professorLecionaAluno ADD column nota real;

-- populando tabela professorLecionaAluno
INSERT INTO professorLecionaAluno VALUES ('11aa',1,2018,2,8.5);
INSERT INTO professorLecionaAluno VALUES ('11aa',3,2018,1,7);
INSERT INTO professorLecionaAluno VALUES ('11bb',4,2020,2,6.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',1,2020,1,9);
INSERT INTO professorLecionaAluno VALUES ('11dd',5,2021,1,4.5);
INSERT INTO professorLecionaAluno VALUES ('11ee',4,2021,2,7.5);
INSERT INTO professorLecionaAluno VALUES ('11ff',3,2022,2,9.5);
INSERT INTO professorLecionaAluno VALUES ('11bb',6,2023,1,5.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',9,2023,1,6);
INSERT INTO professorLecionaAluno VALUES ('11gg',7,2023,2,8);
INSERT INTO professorLecionaAluno VALUES ('11bb',5,2025,1,7.5);
INSERT INTO professorLecionaAluno VALUES ('11gg',10,2026,1,9.5);
INSERT INTO professorLecionaAluno VALUES ('11hh',3,2025,1,5.5);
INSERT INTO professorLecionaAluno VALUES ('11hh',3,2026,1,7.5);
INSERT INTO professorLecionaAluno VALUES ('22bb',8,2026,1,6);
INSERT INTO professorLecionaAluno VALUES ('22bb',9,2026,1,8);





/*	PRODUTO CARTESIANO - INCORRETO

	Um produto cartesiano entre duas tabelas resulta em 
	uma terceira tabela contendo todos os elementos da primeira tabela, 
	combinados com todos da segunda 
*/

SELECT nomeCurso, pnome, sexo FROM curso, aluno;


/*	JUNÇÕES (JOIN)

	É utilizada para unir dados de duas ou mais tabelas através de um campo em comum entre ambas
	Relação chave estrangeira / chave primária
	
	SELECT <colunas> FROM Tabela1 T1, Tabela2 T2 WHERE T1.C1 = T2.C2
	
	SELECT <colunas> FROM Tabela1 T1
	INNER JOIN Tabela2 T2
	ON T1.C1 = T2.C2

*/

-- Como realizar uma consulta que retorne o nome (pnome) 
-- dos alunos e os cursos que os mesmos fazem?

-- Forma Clássica.
SELECT pnome, nomeCurso FROM curso c, aluno a WHERE a.idCurso = c.idCurso;

-- Forma (Não Clássica?)
SELECT pnome, nomeCurso FROM curso c
	INNER JOIN aluno a
	ON a.idCurso = c.idCurso;


-- Exemplo 2: Selecionar o pnome dos professores que lecionaram alguma disciplina em 2021
SELECT pnome, ano FROM professor prof
	INNER JOIN professorlecionaaluno lec
	ON prof.prontuario = lec.prontuarioProfessor
	WHERE ano = 2021;

/*
SELECT pnome, ano FROM professor prof, professorlecionaaluno lec
	WHERE prof.prontuario = lec.prontuarioProfessor
	AND ano = 2021;
*/


-- Exemplo 3: Selecionar o nome dos alunos que tiraram mais de 7, o ano e seu curso.
SELECT pnome, nota, ano, nomeCurso FROM aluno a
	INNER JOIN professorlecionaaluno leciona
	ON a.prontuario = leciona.prontuarioaluno
	INNER JOIN curso c
	ON c.idcurso = a.idcurso
	
	WHERE nota > 7
	ORDER BY pnome;

/*
SELECT pnome, nota, ano, nomeCurso FROM aluno a, professorlecionaaluno leciona, curso c
	WHERE a.prontuario = leciona.prontuarioaluno
	AND c.idcurso = a.idcurso
	
	AND nota > 7
	ORDER BY pnome;
*/

-- Exemplo 4: acrescente o nome do professor na consulta acima
SELECT a.pnome AS "Aluno", nota, ano, nomeCurso, p.pnome AS "Professor" FROM aluno a
	INNER JOIN professorlecionaaluno leciona
	ON a.prontuario = leciona.prontuarioaluno
	INNER JOIN curso c
	ON c.idcurso = a.idcurso
	INNER JOIN professor p
	ON p.prontuario = leciona.prontuarioprofessor
	
	WHERE nota > 7
	ORDER BY a.pnome;

/*
SELECT a.pnome, nota, ano, nomeCurso, p.pnome FROM aluno a, professorlecionaaluno leciona, curso c, professor p
	WHERE a.prontuario = leciona.prontuarioaluno
	AND c.idcurso = a.idcurso
	AND p.prontuario = leciona.prontuarioprofessor
	
	AND nota > 7
	ORDER BY a.pnome;
*/


/* Exercícios */

-- 1 – Selecione o nome de todos os alunos, o sexo e o nome do curso, 
-- para as pessoas que fazem Medicina.
SELECT a.pnome, a.sexo, nomeCurso FROM aluno a
	INNER JOIN curso c
	ON a.idcurso = c.idcurso
	WHERE nomeCurso = 'Medicina';

-- 2 – Selecione o nome do professor e a média das notas de seus alunos, 
-- ordenados pela média das notas – Coloque um alias para a Média
SELECT p.pnome AS "Professor", AVG(nota) AS "Média" FROM professor p
	INNER JOIN professorlecionaaluno leciona
	ON p.prontuario = leciona.prontuarioprofessor
	GROUP BY p.pnome
	ORDER BY "Média";

-- 3 – Qual o nome dos professores e dos alunos que lecionaram e tiveram aula em 2010
SELECT p.pnome AS "Professor", a.pnome AS "Aluno", ano FROM aluno a
	INNER JOIN professorlecionaaluno leciona
	ON leciona.prontuarioaluno = a.prontuario
	INNER JOIN professor p
	ON p.prontuario = leciona.prontuarioprofessor

	WHERE ano = 2010;

-- 4 - Selecionar o nome do curso e a quantidade de alunos de cada curso.
SELECT c.nomecurso, COUNT(a.pnome) AS "Qtd. Alunos" FROM curso c
	INNER JOIN aluno a
	ON a.idcurso = c.idcurso

	GROUP BY c.nomecurso
	ORDER BY "Qtd. Alunos";
	