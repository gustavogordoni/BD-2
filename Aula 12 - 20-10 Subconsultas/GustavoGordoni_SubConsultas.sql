-- 1. Utilizando sub consultas, retorne o nome dos vendedores que venderam
-- pedidos com prazo de entrega igual a 3 ou 5
SELECT v.nome_vendedor FROM vendedor v
	WHERE v.codigo_vendedor IN
	(SELECT p.codigo_vendedor FROM pedido p
	WHERE prazo_entrega BETWEEN 3 AND 5);
	
-- 2. Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram
-- algum barco.
select nome_marin from marinheiros m 
	where m.id_marin IN (select r.id_marin from reservas r);

-- 3. Retorne o nome de todos os barcos que já foram reservados utilizando sub
-- consultas.
select nome_barco from barcos b
	where b.id_barco IN
	(select r.id_barco from reservas r);

-- 4. Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram
-- algum barco Marrom.
select nome_marin from marinheiros m 
	where m.id_marin 
	IN (select r.id_marin from reservas r
		where r.id_barco 
		IN (select id_barco FROM barcos b where cor = 'Marrom'));

-- 5. Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram
-- algum barco Marrom ou Azul.
select nome_marin from marinheiros m 
	where m.id_marin 
	IN (select r.id_marin from reservas r
		where r.id_barco 
		IN (select id_barco FROM barcos b where cor = 'Marrom' OR cor = 'Azul'));


-- 6. Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram
-- algum barco Marrom E Azul. DICA: dois selects INTERNOS comparando id_marin,
-- separados por AND
select nome_marin from marinheiros m 
	where m.id_marin 
		IN (select r.id_marin from reservas r
		where r.id_barco IN (select id_barco FROM barcos b where cor = 'Marrom'))
	and m.id_marin 
		IN (select r.id_marin from reservas r
		where r.id_barco IN (select id_barco FROM barcos b where cor = 'Azul'));
		
-- 7. Faça uma consulta que retorno o nome do funcionário com o maior salário.
select pNome, salario from empregado
	where salario = (select max(salario) from empregado);

-- 8. Faça uma consulta que retorno o nome do funcionário com o menor salário.
select pNome, salario from empregado
	where salario = (select min(salario) from empregado);