-- 1. Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- unidos com o nome dos corretores que também já alugaram imóveis.
-- USAR UNION
SELECT nome FROM inquilino
	INNER JOIN aluguel
	ON aluguel.cpfinquilino = inquilino.cpf

UNION

SELECT nome FROM corretor
	INNER JOIN aluguel
	ON aluguel.crecicorretor = corretor.creci;

-- 2. Faça uma consulta que selecione o NOME dos inquilinos que já alugaram
-- QUE TENHAM o mesmo nome dos corretores que também já alugaram
-- imóveis. Usar INTERSECT
SELECT nome FROM inquilino
	INNER JOIN aluguel
	ON aluguel.cpfinquilino = inquilino.cpf

INTERSECT

SELECT nome FROM corretor
	INNER JOIN aluguel
	ON aluguel.crecicorretor = corretor.creci;


-- 3. UNION Selecione os nomes que aparecem nas tabelas aluno, professor e
-- funcionários.
select nomealu FROM aluno
UNION
select nomePro FROM professor
UNION
select nomeFunc FROM funcionario;

-- 4. Selecione todos os nomes que aparecem na tabela aluno, mas não na
-- tabela funcionário.
select nomealu FROM aluno
EXCEPT
select nomeFunc FROM funcionario;


-- 5. Faça o contrário do 4.
select nomeFunc FROM funcionario
EXCEPT
select nomealu FROM aluno;

--  6. INTERSECT Selecione os nomes que aparecem na tabela aluno, professor e
-- funcionário
select nomealu FROM aluno
INTERSECT
select nomePro FROM professor
INTERSECT
select nomeFunc FROM funcionario;