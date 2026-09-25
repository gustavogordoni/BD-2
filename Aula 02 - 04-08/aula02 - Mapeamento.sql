-- AULA 02: 04/08

/* 
CRIAÇÃO DE TABELAS COM CHAVES ESTRANGEIRAS 
*/

-- 1 X N -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

-- Tabela Cliente - Lado 1
CREATE TABLE cliente (
	cpf VARCHAR (13) NOT NULL,
	nome VARCHAR (60) NOT NULL,
	
	constraint pk_cliente primary key (cpf)
);

-- Tabela Pedido - Lado N
CREATE TABLE pedido (
	cod_pedido integer NOT NULL,
	valor numeric (9,2) NOT NULL,
	cpf_cli VARCHAR (13) NOT NULL,
	
	CONSTRAINT pk_pedido PRIMARY KEY (cod_pedido),
	CONSTRAINT fk_pedido_cliente FOREIGN KEY (cpf_cli) REFERENCES cliente	
);

INSERT INTO cliente VALUES
('123.456', 'Miani'),
('456.789', 'Cristiane');

INSERT INTO pedido VALUES
(1, 49.5, '456.789');

INSERT INTO pedido VALUES
(2, 130, '456.789');

select * from cliente;
select * from pedido;

-- drop table pedido;

-- ON DELETE CASCADE & ON UPDATE CASCADE
CREATE TABLE pedido (
	cod_pedido integer NOT NULL,
	valor numeric (9,2) NOT NULL,
	cpf_cli VARCHAR (13) NOT NULL,
	
	CONSTRAINT pk_pedido PRIMARY KEY (cod_pedido),
	CONSTRAINT fk_pedido_cliente FOREIGN KEY (cpf_cli) REFERENCES cliente
		ON DELETE CASCADE ON UPDATE CASCADE
);

-- Atualiza não só na tabela cliente, MAS TBM na tabela PEDIDO
UPDATE cliente SET cpf = '444.444' WHERE cpf = '456.789';

DELETE FROM cliente WHERE cpf = '444.444';



-- 1 X 1 -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
-- Chave estrangeira deve ter a restrição de unicidade UNIQUE

CREATE TABLE gerente(
	cpf_ger integer NOT NULL,
	nome_ger VARCHAR (50) NOT NULL,
	
	constraint pk_gerente PRIMARY KEY (cpf_ger)
);

CREATE TABLE departamento (
	cod_departamento integer NOT NULL,
	nome_departamento VARCHAR (50) NOT NULL,
	gerente_cpf_ger integer NOT NULL,
	-- CORRETO: gerente_cpf_ger integer NOT NULL UNIQUE,
	
	constraint pk_departamento PRIMARY KEY (cod_departamento),
	constraint fk_gerente_cpf_ger FOREIGN KEY (gerente_cpf_ger) REFERENCES gerente
);

-- drop table departamento;

INSERT INTO gerente VALUES (1, 'Carlos');

INSERT INTO departamento VALUES (10, 'TI', 1);
INSERT INTO departamento VALUES (20, 'RH', 1);

select * from departamento;

CREATE TABLE departamento (
	cod_departamento integer NOT NULL,
	nome_departamento VARCHAR (50) NOT NULL,	
	
	-- CORRETO: 
	gerente_cpf_ger integer NOT NULL UNIQUE,
	
	constraint pk_departamento PRIMARY KEY (cod_departamento),
	constraint fk_gerente_cpf_ger FOREIGN KEY (gerente_cpf_ger) REFERENCES gerente
);


/* --/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
Curso 1:1 Coordenador
Curso 1:N Aluno
*/

CREATE TABLE curso_(
	codCurso int,
	nome varchar(50),
	valor real,

	constraint pk_curso_ PRIMARY KEY (codCurso)
);

CREATE TABLE aluno_(
	ra varchar(30),
	nome varchar(50),
	endereco varchar(255),

	codCurso int,

	constraint pk_aluno_ PRIMARY KEY (ra),
	constraint fk_aluno_curso FOREIGN KEY (codCurso) REFERENCES curso_

);

CREATE TABLE coordenador_(
	cod_coord int,
	nome varchar(50),

	codCurso int UNIQUE,

	constraint pk_coordenador_ PRIMARY KEY (cod_coord),
	constraint fk_coordenador_curso FOREIGN KEY (codCurso) REFERENCES curso_

);

-- drop table coordenador_, aluno_, curso_;

INSERT INTO curso_ VALUES (1, 'BSI'), (2, 'CIV');

INSERT INTO coordenador_ VALUES (10, 'Evandro', 1), (20, 'Mara', 2);

-- INSERT INTO aluno_ VALUES ();
