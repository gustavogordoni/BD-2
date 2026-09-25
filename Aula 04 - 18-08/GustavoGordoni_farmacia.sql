-- criação da tabela
CREATE TABLE REMEDIO (
	codRemedio integer NOT NULL,
	nomeRemedio varchar(40) NOT NULL, 
	descricao varchar(100) NOT NULL, 
	laboratorio varchar(40) NOT NULL, 
	preco numeric NOT NULL,
	constraint pk_remedio PRIMARY KEY (codRemedio));

-- inserção de dados
INSERT INTO REMEDIO VALUES (1, 'AAS', 'Ad. 2 x 10 cprs. 500 mg', 'SANOFI-AVENTIS', 11.53);
INSERT INTO REMEDIO VALUES (2, 'BACTERACIN', 'Cx. 12 cprs.', 'TEUTO BRAS.', 9.31);
INSERT INTO REMEDIO VALUES (3, 'CALADRYL', 'Creme bisn. 28 g.', 'JOHNSON & JOHNSON', 12.28);
INSERT INTO REMEDIO VALUES (4, 'DEPROZOL', '1000 mg. 2 cprs. rev', 'ACHE', 24.69);
INSERT INTO REMEDIO VALUES (5, 'ENGOV', 'Fracao - 1 env. x 6 cprs', 'COSMED', 4.00);
INSERT INTO REMEDIO VALUES (6, 'FAMOX', '20 mg. cprs. cx. 10', 'ACHE', 15.74);
INSERT INTO REMEDIO VALUES (7, 'FASTURTEC', '1,5 mg. po liof. 3 FA vd', 'SANOFI-AVENTIS', 1300.66);
INSERT INTO REMEDIO VALUES (8, 'GALVUS', '50 mg. 14 cp', 'NOVARTIS', 46.37);
INSERT INTO REMEDIO VALUES (9, 'LACTO-PURGA', 'Fracao - 1 bl. x 6 cprs. rev', 'COSMED', 2.62);
INSERT INTO REMEDIO VALUES (10, 'MAGNOPYROL', 'Xpe. fr. 100 ml', 'FARMASA', 17.22);
INSERT INTO REMEDIO VALUES (11, 'RESPRIN', 'Fracao 4 cprs', 'JOHNSON & JOHNSON', 4.17);
INSERT INTO REMEDIO VALUES (12, 'RIVOTRIL', 'Cx. 20 cprs. 0,5 mg', 'ROCHE', 5.97);
INSERT INTO REMEDIO VALUES (13, 'SEDILAX', 'Bl. 4 cprs. laranja', 'TEUTO BRAS.', 3.25);
INSERT INTO REMEDIO VALUES (14, 'ZADITEN', 'Sol. oral 30 ml', 'NOVARTIS', 65.27);
INSERT INTO REMEDIO VALUES (15, 'ALIVIUM', 'Comprimidos 20 un.', 'FARMA VIDA', 18.50);
INSERT INTO REMEDIO VALUES (16, 'BEMDOR', 'Caixa 12 comprimidos', 'LABOR MAIS', 12.90);
INSERT INTO REMEDIO VALUES (17, 'CALMEX', 'Comprimidos 30 un.', 'BIOFARMA', 22.40);
INSERT INTO REMEDIO VALUES (18, 'DIGESTOL', 'Frasco 100 ml', 'FARMA BRASIL', 15.75);
INSERT INTO REMEDIO VALUES (19, 'DORALIV', 'Caixa 20 comprimidos', 'NOVA SAUDE', 19.90);
INSERT INTO REMEDIO VALUES (20, 'FEBRILAR', 'Comprimidos 10 un.', 'MEDICORP', 8.60);
INSERT INTO REMEDIO VALUES (21, 'GASTROMAX', 'Capsulas 28 un.', 'LABOR MAIS', 27.30);
INSERT INTO REMEDIO VALUES (22, 'GRIPALL', 'Comprimidos 12 un.', 'FARMA VIDA', 14.80);
INSERT INTO REMEDIO VALUES (23, 'IMUNEX', 'Frasco 60 ml', 'BIOFARMA', 31.50);
INSERT INTO REMEDIO VALUES (24, 'NEUROCALM', 'Comprimidos 20 un.', 'MEDICORP', 26.90);
INSERT INTO REMEDIO VALUES (25, 'RESPIFLUX', 'Xarope 120 ml', 'NOVA SAUDE', 21.70);
INSERT INTO REMEDIO VALUES (26, 'VITAMAX', 'Comprimidos 30 un.', 'FARMA BRASIL', 24.50);
INSERT INTO REMEDIO VALUES (27, 'DERMALIV', 'Creme bisnaga 30 g', 'BIOFARMA', 17.40);
INSERT INTO REMEDIO VALUES (28, 'COLONEX', 'Capsulas 20 un.', 'LABOR MAIS', 29.80);
INSERT INTO REMEDIO VALUES (29, 'ALERGIN', 'Comprimidos 10 un.', 'MEDICORP', 16.25);
INSERT INTO REMEDIO VALUES (30, 'TOSSELIV', 'Xarope 100 ml', 'FARMA VIDA', 13.60);



-- 1. Selecionar todos os remédios.
SELECT * FROM remedio;

-- 2. Selecionar o nome e o preço de todos os remédios.
SELECT nomeRemedio FROM remedio;

-- 3. Selecionar o nome, o preço e o laboratório de todos os remédios mais caros que 10 reais. 
SELECT nomeRemedio, preco FROM remedio;

-- 4. Selecionar todos os remédios que sejam do laboratório ‘ACHE’ ou FARMASA ou NOVARTIS, utilizando o comando OR e depois o comando IN.
SELECT laboratorio FROM remedio WHERE laboratorio = 'ACHE' OR laboratorio = 'FARMASA' OR laboratorio = 'NOVARTIS';
SELECT laboratorio FROM remedio WHERE laboratorio IN ('ACHE', 'FARMASA', 'NOVARTIS');

-- 5. Selecione o nome, o laboratório e o preço dos remédios em ordem crescente dos preços.
SELECT nomeRemedio, laboratorio, preco FROM remedio ORDER BY preco;

-- 6. Selecione o nome dos remédios, suas descrições e preço dos remédios em ordem decrescente de preço. Renomeie a coluna nomeRemedio para “Nome do Remédio” e preco para “preço”
SELECT nomeRemedio AS "Nome do Remédio", descricao, preco AS "Preço" FROM remedio ORDER BY preco DESC;

-- 7. Selecione o nome dos remédios e o preço dos remédios com preço entre 5 e 15. (BETWEEN)
SELECT nomeRemedio, preco FROM remedio WHERE preco BETWEEN 5 AND 15 ORDER BY preco;

-- 8. Atualize o preço de todos os produtos em 5%
UPDATE remedio SET preco = preco * 1.05;

-- 9. Elimine todos os produtos mais caros que 20 ou do laboratório FARMASA.
DELETE FROM remedio WHERE preco > 20 OR laboratorio = 'FARMASA';