CREATE TABLE PAIS(nome VARCHAR (50), capital VARCHAR (50) NOT NULL, populacao real, idh real, continente varchar (30), CONSTRAINT PK_PAIS PRIMARY KEY (nome));

INSERT INTO PAIS VALUES ('Afeganistão','Cabul',29.1,0.349,'Ásia'),('Angola', 'Luanda', 18.4, 0.403, 'África'),('Áustria', 'Viena', 8.2, 0.895, 'Europa');
INSERT INTO PAIS VALUES ('Bolívia','La Paz',10.9,0.675,'América do Sul'),('Camarões', 'Iaundê', 19.1, 0.482, 'África'),('Alemanha', 'Berlim', 81.76, 0.920, 'Europa');
INSERT INTO PAIS VALUES ('Argentina','Buenos Aires',40.0,0.811,'América do Sul'),('Austrália', 'Camberra', 22.6, 0.938, 'Oceania'),('Brasil', 'Brasília', 190.732, 0.730, 'América do Sul');
INSERT INTO PAIS VALUES ('Canadá','Ottawa',34.48,0.911,'América do Norte'),('Chile', 'Santiago do Chile', 17.09, 0.819, 'América do Sul'),('Coréia do Sul', 'Seul', 48.3, 0.909, 'Ásia');
INSERT INTO PAIS VALUES ('Costa do Marfim','Abidjan',20.1,0.397,'África'),('Cuba', 'Havana', 11.07, 0.780, 'América Central'),('Equador', 'Quito', 14.3, 0.724, 'América do Sul');
INSERT INTO PAIS VALUES ('Espanha','Madri',47.19,0.885,'Europa'),('Estados Unidos da América', 'Washington DC', 308.745, 0.937, 'América do Norte'),('França', 'Paris', 65.3, 0.893, 'Europa');
INSERT INTO PAIS VALUES ('Guatemala','Cidade da Guatemala',14,0.560,'América Central'),('Islândia', 'Reykjavik', 0.318, 0.906, 'Europa'),('Rússia', 'Moscou', 142.9, 0.788, 'Europa e Ásia');
INSERT INTO PAIS VALUES ('Argélia','Argel',40.400,0.748,'África'),('África do Sul', 'Pretória', 57.39, 0.709, 'África'),('Arábia Saudita', 'Riade', 33.55, 0.854, 'Ásia');
INSERT INTO PAIS VALUES ('Bélgica','Bruxelas',11.500,0.931,'Europa'),('Bulgária', 'Sófia', 7.03, 0.816, 'Europa'),('Burquina Faso', 'Uagadugu', 19.7, 0.305, 'África');
INSERT INTO PAIS VALUES ('Cabo Verde','Praia',0.553,0.665,'África'),('Colômbia', 'Bogotá', 49.464, 0.767, 'América do Sul'),('Croácia', 'Zagreb', 4.16, 0.767, 'Europa');
INSERT INTO PAIS VALUES ('Dinamarca','Copenhaga',5.75,0.866,'Europa'),('Egito', 'Cairo', 99.375, 0.707, 'África'),('Filipinas', 'Manila', 106.512, 0.718, 'Ásia');
INSERT INTO PAIS VALUES ('China','Pequim',1412,0.788,'Ásia'),('Dominica', 'Roseau', 0.071, 0.717, 'América Central'),('Escócia', 'Edimburgo ', 5.424, 0.901, 'Europa');
INSERT INTO PAIS VALUES ('Irlanda do Norte','Belfast',1.885,0.899,'Europa'),('Finlândia', 'Helsinque', 5.556, 0.871, 'Europa'),('Gana', 'Acra', 33.48, 0.467, 'África');
INSERT INTO PAIS VALUES ('Holanda','Amsterdã',17.7,0.944,'Europa'),('Honduras', 'Tegucigalpa', 10.43, 0.632, 'América Central'),('Marrocos', 'Rabat', 37.46, 0.683, 'África');
INSERT INTO PAIS VALUES ('Albânia','Tirana',2.87,0.810,'Europa'),('Azerbaijão', 'Baku', 10.2, 0.760, 'Europa e Ásia'),('Bahamas', 'Nassau', 0.410, 0.820, 'América Central');
INSERT INTO PAIS VALUES ('Bielorrússia','Minsk',9.2,0.824,'Europa'),('Burundi', 'Gitega', 11.2, 0.439, 'África'),('Cazaquistão', 'Nursultan', 18.7, 0.802, 'Ásia');
INSERT INTO PAIS VALUES ('Djibouti','Djibouti',1.15,0.52,'África'),('Eslováquia', 'Bratislava', 5.5, 0.88, 'Europa'),('Etiópia', 'Adis Abeba', 132, 0.492, 'África');
INSERT INTO PAIS VALUES ('Emirados Árabes Unidos','Abu Dhabi',11.5,0.94,'Ásia'),('Gabão', 'Libreville', 2.4, 0.733, 'África'),('Haiti', 'Porto Príncipe', 11.4, 0.554, 'América Central');
INSERT INTO PAIS VALUES ('Madagáscar','Antananarivo', 28,0.487,'África'),('Lituânia', 'Vilnius', 2.8, 0.895, 'Europa'),('Índia', 'Nova Déli', 1400, 0.685, 'Ásia');


SELECT * FROM PAIS order by nome;

-- 1. Faça uma consulta que retorne o nome e o idh dos países que tem uma letra ‘e’
-- no nome ou que tenham idh maior que 0.7. Ordene em ordem decrescente do
-- idh.
SELECT nome, idh FROM pais 
	WHERE nome LIKE '%e%' OR idh > 0.7
	ORDER BY idh DESC;

-- 2. Faça uma consulta que tenha no nome do país a segunda letra ‘a’ e após o a
-- tenha a letra ‘e’ em algum momento. Também deve possuir a população menor
-- que 15.
SELECT nome, populacao FROM pais 
	WHERE nome LIKE '_a%e%' AND populacao < 15;

-- 3. Faça uma consulta que retorne o nome dos países que tenham uma letra ‘r’ no
-- nome ou que tenham a penúltima letra sendo a letra ‘l’.
SELECT nome, idh FROM pais 
	WHERE nome LIKE '%r%' OR nome LIKE '%l_';

-- 4. Faça uma consulta que retorne o continente e a média de população de cada
-- continente.
SELECT continente, AVG(populacao) FROM pais 
	GROUP BY continente
	ORDER BY continente;

-- 5. Faça uma consulta que retorne os continentes e a quantidade de países de cada
-- continente.
SELECT continente, COUNT(*) FROM pais 
	GROUP BY continente
	ORDER BY continente;

-- 6. Faça uma consulta que retorne os continentes e a média do idh desses
-- continentes desde que a média seja maior que 0.65
SELECT continente, AVG(idh) AS "Média do IDH" FROM pais 
	GROUP BY continente
	HAVING AVG(idh) > 0.65
	ORDER BY AVG(idh);

-- 7. Faça uma consulta que retorne o total de população de cada continente, desde
-- que o continente não seja da Oceania ou da Europa. Ordene em ordem
-- decrescente do idh.
SELECT continente, SUM(populacao) AS "População" FROM pais 
	WHERE continente NOT LIKE 'Oceania' AND continente NOT LIKE '%Europa%'	
	GROUP BY continente
	ORDER BY SUM(populacao) DESC;