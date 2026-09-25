-- 1x1 : UNIQUE NA CHAVE ESTRANGEIRA

CREATE TABLE gerente (
	cpf_ger INTEGER NOT NULL,
	nome_ger VARCHAR(50) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (cpf_ger)
);

CREATE TABLE departamento (
	cod_departamento INTEGER NOT NULL,
	nome_departamento VARCHAR(50) NOT NULL,
	
	gerente_cpf_ger INTEGER NOT NULL UNIQUE, --> garante a UNICIDADE
	CONSTRAINT pk_departamento PRIMARY KEY (cod_departamento),
	CONSTRAINT fk_gerente_cpf_ger FOREIGN KEY (gerente_cpf_ger) REFERENCES gerente
		ON DELETE CASCADE ON UPDATE CASCADE
);

--------------------------------------------------------

-- 1xN : 

CREATE TABLE curso (
	codCurso INTEGER,
	nome VARCHAR (40) NOT NULL,
	valor NUMERIC(6, 2),
	CONSTRAINT pk_curso PRIMARY KEY (codCurso)
);

CREATE TABLE aluno (
	prontuario VARCHAR (15),	
	nomeAluno VARCHAR (50) NOT NULL,
	cidade VARCHAR (60) NOT NULL,

	curso_codCurso INTEGER NOT NULL,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (curso_codCurso) REFERENCES curso
);


--------------------------------------------------------

-- Entidade Fraca: Chave estrangeira COMPONDO a Chave primária

--------------------------------------------------------

-- NxN:


CREATE TABLE funcionario( 
	cpf VARCHAR(13),
	nome VARCHAR (50) NOT NULL,
	
	CONSTRAINT pk_func PRIMARY KEY (cpf)
);

CREATE TABLE projeto (
	idProjeto INTEGER,
	nomeProj VARCHAR(40) NOT NULL,
	
	CONSTRAINT pk_projeto PRIMARY KEY(idProjeto)
);

CREATE TABLE trabalha(
	cpf_func VARCHAR (13),
	idProjeto INTEGER NOT NULL,
	
	CONSTRAINT pk_trabalha PRIMARY KEY(cpf_func, idProj),
	CONSTRAINT fk_cpfFunc FOREIGN KEY (cpf_func) REFERENCES funcionario,
	CONSTRAINT fk_idProj FOREIGN KEY (idProjeto) REFERENCES projeto
);

--------------------------------------------------------

-- Hierarquia: Chave primária vem como Estrangeira;
---> Entidade filha tem apenas a Chave Estrangeira como Chave primária

--------------------------------------------------------
