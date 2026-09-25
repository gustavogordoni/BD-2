CREATE TABLE livro(
	isbn INTEGER,
	titulo VARCHAR(60),
	nroPgs INTEGER,
	ano INTEGER,
	edicao INTEGER,

	CONSTRAINT pk_livro PRIMARY KEY (isbn)
);

CREATE TABLE aluno(
	prontuario VARCHAR(10),
	nome VARCHAR(50),
	dtaNasc DATE,
	rua VARCHAR(20),
	nro INTEGER,
	bairro VARCHAR(30),
	cidade VARCHAR(50),
	cep VARCHAR(15),	

	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

CREATE TABLE reservasLivro(
	isbn INTEGER,
	prontuario VARCHAR(10),
	dtaRes DATE,
	dtaDev DATE,

	CONSTRAINT pk_reservasLivro PRIMARY KEY (isbn, prontuario, dtaRes),
	CONSTRAINT fk_reservas_aluno FOREIGN KEY (prontuario) REFERENCES aluno
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_reservas_livro FOREIGN KEY (isbn) REFERENCES livro
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE telefoneAluno(
	nroTelefone VARCHAR(11), -- integer ERROR:  integer out of range
	prontuario VARCHAR(10),

	CONSTRAINT pk_telefoneAluno PRIMARY KEY (nroTelefone, prontuario),
	CONSTRAINT fk_telefone_aluno FOREIGN KEY (prontuario) REFERENCES aluno
				ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO livro (isbn, titulo, nroPgs, ano, edicao) VALUES
(1001, 'Dom Casmurro', 256, 1899, 1),
(1002, 'O Cortico', 304, 1890, 2),
(1003, 'Memorias Postumas de Bras Cubas', 280, 1881, 1),
(1004, 'Grande Sertao: Veredas', 624, 1956, 3),
(1005, 'Capitaes da Areia', 272, 1937, 2);


INSERT INTO aluno (prontuario, nome, dtaNasc, rua, nro, bairro, cidade, cep) VALUES
('VP001', 'Joao da Silva', '2003-05-15', 'Rua das Flores', 100, 'Centro', 'Votuporanga', '15500-000'),
('VP002', 'Maria Oliveira', '2004-08-22', 'Rua Brasil', 250, 'Vila America', 'Votuporanga', '15501-000'),
('VP003', 'Carlos Santos', '2002-11-10', 'Rua Sao Paulo', 350, 'Centro', 'Fernandopolis', '15600-000'),
('VP004', 'Ana Souza', '2005-02-28', 'Rua Amazonas', 450, 'Jardim Italia', 'Mirassol', '15130-000'),
('VP005', 'Pedro Lima', '2003-12-03', 'Rua Bahia', 550, 'Vila Nova', 'Sao Jose do Rio Preto', '15000-000');


INSERT INTO reservasLivro (isbn, prontuario, dtaRes, dtaDev) VALUES
(1001, 'VP001', '2026-09-01', '2026-09-15'),
(1002, 'VP002', '2026-09-02', '2026-09-16'),
(1003, 'VP003', '2026-09-03', '2026-09-17'),
(1004, 'VP004', '2026-09-04', '2026-09-18'),
(1005, 'VP005', '2026-09-05', '2026-09-19');


INSERT INTO telefoneAluno (nroTelefone, prontuario) VALUES
('17991234567', 'VP001'),
('17992345678', 'VP002'),
('17993456789', 'VP003'),
('17994567890', 'VP004'),
('17995678901', 'VP005');