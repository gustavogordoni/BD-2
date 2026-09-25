CREATE TABLE marinheiros (id_marin integer PRIMARY KEY, nome_marin VARCHAR (40), avaliacao integer, idade integer);

INSERT INTO marinheiros VALUES (1,'Capitão Gancho', 8, 57),(2,'Alma Negra', 9, 37),
			(3,'Jack Sparrow', 5, 35),(4,'Marujo Frajuto', 3, 42),(5,'Barba Branca', 10, 67),
			(6,'Mariana do Mar', 7, 29),(7,'Clara Veleira', 9, 37),(8,'João Navegante', 6, 52);

--INSERT INTO marinheiros VALUES (6,'Willy caolho', 8, 59)
CREATE TABLE barcos (id_barco INTEGER PRIMARY KEY, nome_barco VARCHAR (40), cor VARCHAR(10));

INSERT INTO barcos VALUES (1, 'Pérola Negra', 'Preto'), (2, 'Azul do Mar', 'Azul'),(3, 'Catraca voadora', 'Verde')
			,(4, 'Sigano do Mar', 'Marrom'),(5, 'Jóia do Oceano', 'Preto'),(6, 'Marinheiros Gayvotenses', 'Rosa'),
			(7, 'Capitão do Mar', 'Amarelo'),(8, 'Maré Alta', 'Verde'),(9, 'Tempestade Alegre', 'Roxo');

CREATE TABLE reservas (id_marin INTEGER REFERENCES marinheiros (id_marin), id_barco INTEGER REFERENCES barcos (id_barco), data_res date,
			PRIMARY KEY (id_marin,id_barco,data_res));

INSERT INTO reservas values (1,2,'01/01/2013'),(2,4,'07/04/2013'),(3,1,'05/06/2013'),(2,2,'07/08/2013'),(4,2,'05/03/2013'),
(5,6,'24/10/2013'),(3,5,'08/02/2013'),(2,4,'12/08/2013'),(5,5,'03/04/2013'),(3,5,'07/04/2013'),(1,6,'25/09/2013'),
(6,7,'14/10/2024'),(5,8,'10/02/2024'),(7,7,'13/11/2023'),(4,6,'22/07/2024'),(7,8,'11/11/2018'),(1,7,'23/10/2024');

SELECT * FROM marinheiros;
SELECT * FROM barcos;
SELECT * FROM reservas;


-- 1. Faça uma consulta que selecione o nome de todos os barcos que foram alugados e a data da reserva, ordenados pela data crescentemente.
SELECT nome_barco, data_res FROM barcos b
	INNER JOIN reservas r
	ON b.id_barco = r.id_barco
	ORDER BY r.data_res;

SELECT nome_barco, data_res FROM barcos b, reservas r
	WHERE b.id_barco = r.id_barco
	ORDER BY r.data_res;

-- 2. Faça uma consulta que retorne o nome dos marinheiros que possuem uma letra i no nome que alugaram um barco depois de 05/05/2013.
SELECT nome_marin, data_res AS "Dta. Aluguel" FROM marinheiros m
	INNER JOIN reservas r
	ON m.id_marin = r.id_marin	
	WHERE nome_marin LIKE '%i%'
	AND data_res > '05/05/2013';

SELECT nome_marin, data_res AS "Dta. Aluguel" FROM marinheiros m, reservas r
	WHERE m.id_marin = r.id_marin	
	AND nome_marin LIKE '%i%'
	AND data_res > '05/05/2013';

-- 3. Faça uma consulta que retorne a quantidade de barcos que cada marinheiro já fez reserva. Deve ser retornado o nome dos marinheiros e a quantidade.
SELECT nome_marin, COUNT(data_res) AS "Qtd. Reservas" FROM marinheiros m
	INNER JOIN reservas r
	ON m.id_marin = r.id_marin
	GROUP BY nome_marin;

SELECT nome_marin, COUNT(data_res) AS "Qtd. Reservas" FROM marinheiros m, reservas r
	WHERE m.id_marin = r.id_marin
	GROUP BY nome_marin;

-- 4. Modifique o exercício 3 para que sejam somente os marinheiros que alugaram uma quantidade maior que um barco.
SELECT nome_marin, COUNT(data_res) AS "Qtd. Reservas" FROM marinheiros m
	INNER JOIN reservas r
	ON m.id_marin = r.id_marin
	GROUP BY nome_marin
	HAVING COUNT(data_res) > 1;

SELECT nome_marin, COUNT(data_res) AS "Qtd. Reservas" FROM marinheiros m, reservas r
	WHERE m.id_marin = r.id_marin
	GROUP BY nome_marin
	HAVING COUNT(data_res) > 1;

-- 5. Selecione o nome dos marinheiros e dos barcos que alugaram em ordem alfabética do marinheiro.
SELECT nome_marin, nome_barco FROM marinheiros m
	INNER JOIN reservas r
	ON m.id_marin = r.id_marin
	INNER JOIN barcos b
	ON b.id_barco = r.id_barco
	ORDER BY nome_marin;

SELECT nome_marin, nome_barco FROM marinheiros m, reservas r, barcos b
	WHERE m.id_marin = r.id_marin
	AND b.id_barco = r.id_barco
	ORDER BY nome_marin;