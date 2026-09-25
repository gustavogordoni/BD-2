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


select m.nome_marin, EXTRACT(year from r.data_res) AS "ano" FROM marinheiros m
	INNER JOIN reservas r
	ON m.id_marin = r.id_marin
	WHERE EXTRACT(year from r.data_res) > 2020;


select cor, count(*) FROM barcos
	GROUP BY cor
	ORDER BY cor;
