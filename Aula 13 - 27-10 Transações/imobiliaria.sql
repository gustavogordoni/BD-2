--drop table imovel
CREATE TABLE imovel(idImovel INTEGER,
		    tipoImovel varchar(30) NOT NULL,
		    Rua varchar(50),
		    cidade varchar(50),
		    CEP varchar(10),
		    preco numeric(10,2),
		    constraint pk_imovel PRIMARY KEY (idImovel));

--inserindo imóveis
INSERT INTO imovel VALUES(1, 'Casa', 'Rua Alagoas', 'Votuporanga', '15505-555', 980.00),
			 (2, 'Casa', 'Rua Ceará', 'Votuporanga', '15505-551', 789.55),
			 (3, 'Casa', 'Av. Paschoalino Pedrazzoli', 'Votuporanga', '15505-550', 1200.00),
			 (4, 'Casa', 'Rua Alagoas', 'Votuporanga', '15505-555', 990.00),
			 (5, 'Casa', 'Rua Uruguai', 'Votuporanga', '15505-557', 15000.00),
			 (6, 'Casa', 'Rua Chile', 'Votuporanga', '15505-558', 650.00),
			 (7, 'Apartamento', 'Rua Amazonas', 'Votuporanga', '15505-556', 1450.00),
			 (8, 'Apartamento', 'Av. Andaló', 'São José do Rio Preto', '13505-555', 2000.00),
			 (9, 'Apartamento', 'Av. Murchid Homsi', 'São José do Rio Preto', '13405-555', 1620.00),
			 (10, 'Sobrado', 'Rua Pernambuco', 'Votuporanga', '15500-555', 700.00),
			 (11, 'Sobrado', 'Rua Alagoas', 'Votuporanga', '15505-555', 1000.00);

CREATE TABLE inquilino(cpf varchar(15),
		       nome VARCHAR(50) NOT NULL,
		       dtaNascimento date,
		       sexo varchar(1));

ALTER TABLE inquilino ADD CONSTRAINT pk_inquilino PRIMARY KEY (cpf);

insert INTO inquilino VALUES('123.456.789','Alberto Roberto', '11/05/1988', 'M'),
			    ('223.456.789','Joana', '11/05/1990', 'F'),
			    ('123.458.789','Pedro', '10/06/1991', 'M'),
			    ('123.456.987','Mara', '20/08/1996', 'F'),
			    ('124.456.789','Carlos', '10/07/1991', 'M'),
			    ('153.456.789','João', '25/10/1988', 'M'),
			    ('323.456.789','Silvia', '15/06/1995', 'F'),
			    ('225.456.789','Julio', '10/09/1997', 'M'),
			    ('183.256.789','Marcelo', '21/05/1978', 'M'),
			    ('427.496.280','Renata', '11/02/2001', 'F');

CREATE TABLE corretor(creci varchar(15),
		       nome VARCHAR(50) NOT NULL,
		       dtaNascimento date,
		       sexo varchar(1));
ALTER TABLE corretor ADD CONSTRAINT pk_corretor PRIMARY KEY (creci);

insert INTO corretor VALUES('12sd12','Rodolfo', '22/08/1988', 'M'),
			    ('12sd13','Joana', '15/11/1989', 'F'),
			    ('12sd14','Ana Mara', '12/07/1990', 'F'),
			    ('12sd16','Marcelo', '19/07/1985', 'M'),
			    ('12sd21','Renata', '11/09/2001', 'F');

create table ALUGUEL(cpfInquilino varchar(15),
		     creciCorretor varchar(15),
		     idImovel integer,
		     dataIniLocacao date NOT NULL,
		     dataFimLocacao date,
		     CONSTRAINT pk_aluguel PRIMARY KEY (cpfInquilino, creciCorretor, idImovel, dataIniLocacao),
		     CONSTRAINT fk_cpfInq FOREIGN KEY (cpfInquilino) references inquilino, 
		     CONSTRAINT fk_cpfCorret FOREIGN KEY (creciCorretor) references corretor,
		     CONSTRAINT fk_idImovel FOREIGN KEY (idImovel) references imovel);

INSERT into aluguel VALUES ('123.456.789', '12sd21', 1, '01/01/2018'),
			   ('427.496.280', '12sd13', 2, '02/02/2018'),
			   ('123.456.987', '12sd21', 3, '07/03/2017'),
			   ('124.456.789', '12sd16', 4, '05/06/2019'),
			   ('323.456.789', '12sd16', 5, '10/01/2017'),
			   ('183.256.789', '12sd14', 8, '01/08/2016'),
			   ('123.456.789', '12sd21', 9, '01/01/2017');

INSERT into aluguel VALUES ('124.456.789', '12sd21', 4, '01/01/2016', '05/05/2019');


/*
	Operadores de Conjuntos

	SELECT 1
		{ UNION [ALL] | INTERSECT | EXCEPT | MINUS}
	SELECT 2

	UNION - JUNTA (se tiver repetição nas duas tabelas, só exibirá)
	INTERSECT - DEVE POSSUIR EM AMBAS
	EXCEPT - 

	SElECT * from t1
	Union
	Select * from t2
	Intersect
	Select * from t3;

	MESMO NÚMERO DE COLUNAS;
	MESMO TIPO DE DADOS;
*/

/*
	UNION
	Une o resultado de duas consultas, eliminando linhas repetidas.
*/

-- Selecionar o nome de todos os inquilinos e corretores
SELECT nome FROM inquilino
UNION
SELECT nome FROM corretor
ORDER BY nome;
-- 12 retornos (3 repetidos)


-- Seria semelhante ao UNION ALL
SELECT nome, 'Inquilino' AS tipoPessoa FROM inquilino
UNION
SELECT nome, 'Corretor' AS tipoPessoa FROM corretor
ORDER BY nome;
-- 15 retornos

-- UNION ALL
SELECT nome FROM inquilino
UNION ALL
SELECT nome FROM corretor
ORDER BY nome;
-- 15 retornos

/*
	INTERSECT
	
	Retorna as linhas que estão em ambas as consultas.
	Exemplo: Faça uma consulta que retorne o nome dos inquilinos que também aparecem na tabela corretor:
*/

SELECT nome from inquilino
INTERSECT
SELECT nome from corretor;


-- Selecionar o nome e o sexo dos inquilinos e corretores
-- que possuem mesmo nome e idade.
select nome, sexo from inquilino
INTERSECT
select nome, sexo from corretor;


/*
	EXCEPT
	
	Retorna as linhas que aparecem na primeira, mas não aparecem na segunda:
*/

-- Faça uma consulta que retorne os nomes que 
-- aparecem apenas na tabela inquilino, mas não na corretor.
SELECT nome from inquilino
EXCEPT
SELECT nome from corretor;

-- Faça o contrário
SELECT nome from corretor
EXCEPT
SELECT nome from inquilino;

-- 1. Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- unidos com o nome dos corretores que também já alugaram imóveis.
-- USAR UNION
SELECT nome FROM inquilino
	INNER JOIN aluguel
	ON aluguel.cpfinquilino = inquilino.cpf

UNION

SELECT nome FROM corretor
	INNER JOIN aluguel
	ON aluguel.crecicorretor = corretor.creci;

-- 2. Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- QUE TENHAM o mesmo nome dos corretores que também já alugaram
-- imóveis. Usar INTERSECT
SELECT nome FROM inquilino
	INNER JOIN aluguel
	ON aluguel.cpfinquilino = inquilino.cpf

INTERSECT

SELECT nome FROM corretor
	INNER JOIN aluguel
	ON aluguel.crecicorretor = corretor.creci;


