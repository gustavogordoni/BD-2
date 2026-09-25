/* --/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
Curso 1:1 Coordenador
Curso 1:N Aluno
*/

CREATE TABLE curso_(
	codCurso INTEGER,
	nome VARCHAR(50),
	valor NUMERIC(10, 2),

	CONSTRAINT pk_curso_ PRIMARY KEY (codCurso)
);

CREATE TABLE aluno_(
	ra VARCHAR(30),
	nome VARCHAR(50),
	endereco VARCHAR(255),

	codCurso INTEGER,

	CONSTRAINT pk_aluno_ PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (codCurso) REFERENCES curso_

);

CREATE TABLE coordenador_(
	cod_coord INTEGER,
	nome VARCHAR(50),

	codCurso INTEGER UNIQUE, -- garante que o relacionamento seja 1 para 1

	CONSTRAINT pk_coordenador_ PRIMARY KEY (cod_coord),
	CONSTRAINT fk_coordenador_curso FOREIGN KEY (codCurso) REFERENCES curso_

);

-- ALTER TABLE coordenador_ ADD CONSTRAINT unq_codCurso UNIQUE (codCurso);
-- DROP TABLE coordenador_, aluno_, curso_;

/* --------------------------------------------------------
	ENTIDADE FRACA
	1:N – com entidade fraca
*/

CREATE TABLE funcionario (
	codFunc INTEGER NOT NULL,				          		
	nome VARCHAR(50) NOT NULL, 
	
	CONSTRAINT pk_funcionario PRIMARY KEY (codFunc)
);

CREATE TABLE dependente (
	codDepend INTEGER NOT NULL, -- chave parcial
	codFunc INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_dependente PRIMARY KEY(codDepend, codFunc), 
	-- chave composta: chave parcial + chave estrangeira
	
	CONSTRAINT fk_dependente_func FOREIGN KEY (codFunc) REFERENCES funcionario
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO funcionario VALUES
(1, 'Rafael'), (2, 'Carla');

INSERT INTO dependente VALUES
(10, 1, 'Maria Júlia'), (10, 2, 'João Antônio'), (20, 1, 'Bruno');

-- Exemplo de JUNÇÃO (visualizar os funcionarios de cad dependente)
SELECT f.nome, d.nome 
	FROM funcionario f INNER JOIN dependente d
	ON f.codFunc = d.codFunc;

-- DROP TABLE funcionario, dependente;

/* --------------------------------------------------------
	N:N	
*/

CREATE TABLE funcionario( 
	cpf VARCHAR(13) NOT NULL,
	nome VARCHAR (50) NOT NULL,
	
	CONSTRAINT pk_func PRIMARY KEY (cpf)
);

CREATE TABLE projeto (
	idProjeto INTEGER NOT NULL,
	nomeProj VARCHAR(40) NOT NULL,
	
	CONSTRAINT pk_projeto PRIMARY KEY(idProjeto)
);

CREATE TABLE trabalha(
	cpf_func VARCHAR (13) NOT NULL,
	idProjeto INTEGER NOT NULL,
	
	CONSTRAINT pk_trabalha PRIMARY KEY(cpf_func, idProjeto),
	
	CONSTRAINT fk_cpfFunc FOREIGN KEY (cpf_func) REFERENCES funcionario,
	CONSTRAINT fk_idProj FOREIGN KEY (idProjeto) REFERENCES projeto
);

INSERT INTO funcionario VALUES
('123.123', 'João'),
('456.456', 'Joana');

INSERT INTO projeto VALUES
(1, 'Modelagem de BD'),
(2, 'Análise de Requisitos');

INSERT INTO trabalha VALUES
('123.123', 1), ('123.123', 2), -- projetos que João trabalha
('456.456', 2);

-- JUNÇÃO
SELECT nome, nomeproj FROM funcionario
	INNER JOIN trabalha
	ON cpf = cpf_func
	INNER JOIN projeto
	ON projeto.idProjeto = trabalha.idProjeto;

-- DROP TABLE trabalha;

/* --------------------------------------------------------
	Ternário
*/

CREATE TABLE maquina(
	cod_maq INTEGER,
	descricao TEXT,

	CONSTRAINT pk_maquina PRIMARY KEY (cod_maq)
);

CREATE TABLE trabalha(
	cpf_func VARCHAR (13) NOT NULL,
	idProjeto INTEGER NOT NULL,
	cod_maq INTEGER NOT NULL,

	CONSTRAINT pk_trabalha PRIMARY KEY(cpf_func, idProjeto, cod_maq),
	
	CONSTRAINT fk_cpfFunc FOREIGN KEY (cpf_func) REFERENCES funcionario,
	CONSTRAINT fk_idProj FOREIGN KEY (idProjeto) REFERENCES projeto,
	CONSTRAINT fk_cod_maq FOREIGN KEY (cod_maq) REFERENCES maquina
);

SELECT funcionario.nome, maquina.cod_maq, nomeProj FROM funcionario
	INNER JOIN trabalha
	ON cpf = cpf_func
	INNER JOIN projeto
	ON projeto.idProjeto = trabalha.idProjeto
	INNER JOIN maquina
	ON maquina.cod_maq = trabalha.cod_maq;


/* --------------------------------------------------------
	Multivalorado
*/

CREATE TABLE empregado(
	idEmp INTEGER,
	pNome VARCHAR(30),
	fNome VARCHAR(30),
	salario real,
	sexo VARCHAR(10),

	CONSTRAINT pk_empregado PRIMARY KEY (idEmp)
);


CREATE TABLE TelefoneEmpregado(
	idEmp INTEGER,
	telefone VARCHAR(15),

	CONSTRAINT pk_telefoneEmpregado PRIMARY KEY (idEmp, telefone),
	CONSTRAINT fk_emp_tel FOREIGN KEY (idEmp) REFERENCES empregado
);

 -- DROP TABLE telefoneempregado;

INSERT INTO empregado VALUES
(1, 'Rafael', 'Miani', 5000, 'M'),
(2, 'Maria', 'Fernanda', 6000, 'F'),
(3, 'Ana', 'Júlia', 4000, 'F');

INSERT INTO telefoneempregado VALUES
(1, '17 999999999'),
(1, '17 998888888'),
(2, '18 997777777'),
(2, '18 996666666'),
(2, '18 995555555'),
(3, '19 994444444');

select pnome, telefone from telefoneempregado t
	INNER JOIN empregado e
	on e.idEmp = t.idEmp;

/* --------------------------------------------------------
	Generalização / Especialização
*/

CREATE TABLE pessoa (
	cpf VARCHAR(13),
	nome VARCHAR(30) NOT NULL,
	dtaNasc date,

	CONSTRAINT pk_pessoa PRIMARY KEY (cpf)
);

-- Tabelas filhas

CREATE TABLE aluno(
	cpfPessoa VARCHAR(13),
	prontuario VARCHAR(12),

	CONSTRAINT pk_aluno PRIMARY KEY (cpfPessoa),
	CONSTRAINT fk_aluno_pessoa FOREIGN KEY (cpfpessoa) REFERENCES pessoa
);

CREATE TABLE engenheiro(
	cpfPessoa VARCHAR(13),
	crea INTEGER,
	
	CONSTRAINT pk_engenheiro PRIMARY KEY (cpfPessoa),
	CONSTRAINT fk_engenheiro_pessoa FOREIGN KEY (cpfpessoa) REFERENCES pessoa
);

-- DROP table aluno, engenheiro

SELECT nome, prontuario, crea FROM pessoa p
	INNER JOIN aluno a
	ON p.cpf = a.cpfPessoa
	INNER JOIN engenheiro e
	ON p.cpf = e.cpfPessoa;


/* --------------------------------------------------------
	Agregação

	Medico N:N Paciente -> Gera Consulta

	Consulta N:N Exame -> Gera ExamesDaConsulta
*/

CREATE TABLE medico(
	crm VARCHAR(20),
	nomeMed VARCHAR(50),

	CONSTRAINT pk_medico PRIMARY KEY (crm)
);

CREATE TABLE paciente(
	idPaciente INTEGER,
	nomePac VARCHAR(50),

	CONSTRAINT pk_paciente PRIMARY KEY (idPaciente)
);

CREATE TABLE exame(
	idExame INTEGER,
	nomeEx VARCHAR(50),

	CONSTRAINT pk_exame PRIMARY KEY (idExame)
);


CREATE TABLE consulta(
	crm VARCHAR(20),
	idPaciente INTEGER,
	dtaHora TIMESTAMP,
	
	CONSTRAINT pk_consulta PRIMARY KEY (crm, idPaciente, dtaHora),
	
	CONSTRAINT fk_consulta_medico FOREIGN KEY (crm) REFERENCES medico,
	CONSTRAINT fk_consulta_paciente FOREIGN KEY (idPaciente) REFERENCES paciente
);

CREATE TABLE consulta_exames(
	crm VARCHAR(20),
	idPaciente INTEGER,
	dtaHora TIMESTAMP,

	idExame INTEGER,

	CONSTRAINT pk_con_exa PRIMARY KEY (crm, idPaciente, dtaHora, idExame),

	CONSTRAINT fk_con_exa_consulta FOREIGN KEY (crm, idPaciente, dtaHora) REFERENCES consulta,
	CONSTRAINT fk_con_exa_exame FOREIGN KEY (idExame) REFERENCES exame
);

