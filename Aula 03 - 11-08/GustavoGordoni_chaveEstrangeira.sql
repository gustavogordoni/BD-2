CREATE TABLE pessoa (
	idPessoa INTEGER,
	nomePessoa VARCHAR(50),
	rua VARCHAR(50),
	nro INTEGER,
	bairro VARCHAR(50),
	cidade VARCHAR(70),
	cep VARCHAR(10),
	telContato VARCHAR(15),

	CONSTRAINT pk_pessoa PRIMARY KEY (idPessoa)
);


CREATE TABLE animal(
	idAnimal INTEGER,
	nomeAnimal VARCHAR(50),
	dtaNasc DATE,
	tipoAnimal VARCHAR(50),

	idPessoa INTEGER,

	CONSTRAINT pk_animal PRIMARY KEY (idAnimal),
	CONSTRAINT pf_animal_pessoa FOREIGN KEY (idPessoa) REFERENCES pessoa
);

CREATE TABLE veterinario(
	idVeterinario INTEGER,
	nome VARCHAR(50),
	telContato VARCHAR(14),

	CONSTRAINT pk_veterinario PRIMARY KEY (idVeterinario)
);

CREATE TABLE atendimento(
	idAnimal INTEGER,
	idVeterinario INTEGER,
	dtaConsulta DATE,

	relatorio TEXT,

	CONSTRAINT pk_atendimento PRIMARY KEY (idAnimal, idVeterinario, dtaConsulta),
	CONSTRAINT pf_atendimento_animal FOREIGN KEY (idAnimal) REFERENCES animal,
	CONSTRAINT pf_atendimento_veterinario FOREIGN KEY (idVeterinario) REFERENCES veterinario
);

-- drop table atendimento; 
-- drop table pessoa;
-- drop table animal;
-- drop table veterinario;


/* ------------------------------------------------- */

CREATE TABLE autor(
	idAutor INTEGER,
	nome VARCHAR(50),
	dtaNasc DATE,

	CONSTRAINT pk_autor PRIMARY KEY (idAutor)
);

CREATE TABLE livro(
	idLivro INTEGER,
	titulo VARCHAR(100),
	generoPrincipal VARCHAR(50),
	anoPublic INTEGER,

	CONSTRAINT pk_livro PRIMARY KEY (idLivro)
);

CREATE TABLE aluno(
	prontuario VARCHAR(10),
	nomeAlu VARCHAR(50),
	dtaNasc DATE,
	cidade VARCHAR(100),

	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

CREATE TABLE telefoneAluno(
	ntoTel INTEGER,
	prontuario VARCHAR(10),

	CONSTRAINT pk_telefoneAluno PRIMARY KEY (ntoTel, prontuario),
	CONSTRAINT fk_telefoneAluno_aluno FOREIGN KEY (prontuario) REFERENCES aluno
);

CREATE TABLE autor_livro(
	idAutor INTEGER,
	idLivro INTEGER,

	CONSTRAINT pk_autor_livro PRIMARY KEY (idAutor, idLivro),
	CONSTRAINT fk_autor FOREIGN KEY (idAutor) REFERENCES autor,
	CONSTRAINT fk_livro FOREIGN KEY (idLivro) REFERENCES livro

);

CREATE TABLE exemplar(
	nroExemplar INTEGER,
	idLivro INTEGER,

	CONSTRAINT pk_exemplar PRIMARY KEY (nroExemplar, idLivro),
	CONSTRAINT fk_livro FOREIGN KEY (idLivro) REFERENCES livro
);

CREATE TABLE emprestimo(
	prontuario VARCHAR(10),
	nroExemplar INTEGER,
	idLivro INTEGER,

	dtaEmpr DATE,
	dtaDev DATE,

	CONSTRAINT pk_emprestimo PRIMARY KEY (prontuario, nroExemplar, idLivro),
	CONSTRAINT fk_emprestimo_exemplar FOREIGN KEY (nroExemplar, idLivro) REFERENCES exemplar,
	CONSTRAINT fk_emprestimo_aluno FOREIGN KEY (prontuario) REFERENCES aluno
);

