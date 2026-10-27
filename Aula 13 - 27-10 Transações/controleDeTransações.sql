/*
	BEGIN TRANSACTION;
		insert
		update
		delete
	
	END TRANSACTION;
	COMMIT;
	
	ROLLBACK;


	
	Controle de concorrência
	- Dados corretos.
	- Sistemas multiusuários.

	
	Estados da transação:
	- Ativa
	Estado inicial da transação. Ela permanece neste estado enquanto estiver em execução
	
	- Em Efetivação Parcial
	Após a execução da última declaração
	
	- Em Falha
	Após a descoberta de que a execução normal já não pode se realizar.
	
	- Abortada
	A transação foi desfeita e o BD retorna ao estágio anterior.
	
	- Efetivada
	Após a conclusão com sucesso.

	
	Propriedades das Transações
	- Atomicidade: Será realizada em sua totalidade ou não será de forma alguma
	- Consistência: 
	- Isolamento: Uma transação deve ser executada sem ser interferida por outras
	- Durabilidade: Mudanças realizadas devem ser persistentes

	* ACID  * 
	Conjunto de mecanismos que garante a propriedade I (Isolamento)
	do modelo ACID, permitindo que múltiplas transações ocorram ao
	mesmo tempo sem corromper os dados


	* Por que o controle de concorrência é necessário? *
	- Dirty read (leitura suja): 
		seria a visualização dos dados no bloco de transação de 
		outro usuário
		
	- Nonrepeatable Read (leituras não repetidas):
				
	- Phantom Read (leituras fantasmas)	


	BEGIN TRANSACTION;
		insert
		update

		savepoint s1;
		delete

		rollback to s1;
	
	END TRANSACTION;	
*/

create table conta(
	id integer,
	cliente varchar(255) not null,
	saldo numeric(15,2) default 0,
	constraint pk_conta PRIMARY KEY (id)
);

insert into conta(id,cliente,saldo) values 
	(1,'JOAO',1000),
	(2,'PEDRO',15000),
	(3,'MARIO',450),
  	(4,'JOAQUIM',40000);

select * from conta;


-- Exemplo 1: 
-- Transferir 200 reais no JOÃO para o PEDRO
begin;

	-- Retira da conta do João
	update conta set saldo = saldo - 200 where id = 1;
	select * from conta where id = 1;
	
	-- Acrescenta na conta do Pedro
	update conta SET saldo = saldo + 200 WHERE id = 2;
	select * from conta where id = 2;

commit;

select * from conta;


-- Exemplo 2 (savepoint):
begin;

	update conta set saldo = 120 where id = 1;
	
	savepoint savepoint_1;
	
	
	update conta set saldo = saldo - 1000 where id = 2;
	select * from conta where id = 2;
	
	rollback to savepoint_1;
	
	
	select * from conta where id = 2;

commit;
select * from conta;
-- Apenas a definição do saldo para 120 que foi executado


-- Exercício 3:
-- Inserção na tabela conta (id = 7) 
-- da cliente Mara com saldo 5000.
-- Desfaça a inserção da transação 1.
BEGIN;
	INSERT INTO conta VALUES 
	(7, 'Mara', 5000);

	select * from conta;

ROLLBACK;


-- ERROS 1 --- --- ---
BEGIN;
	-- sucesso
	INSERT INTO conta VALUES 
	(7, 'Mara', 5000);
	
	-- erro
	INSERT INTO conta VALUES 
	(7, 'Mara', 5000; -- <-- sem parênteses

	-- não deixa executar, por conta do erro anterior
	select * from conta;
	
END; -- commit, rollback
-- TODO O BLOCO DE TRANSAÇÃO É IGNORADO!!!!


-- ERROS 2 --- --- ---
BEGIN;
	-- sucesso
	INSERT INTO conta VALUES 
	(7, 'Mara', 5000);
	
	savepoint save_1;

	-- erro
	INSERT INTO conta VALUES 
	(7, 'Mara', 5000; -- <-- sem parênteses

	ROLLBACK TO save_1;
	-- CONSEGUE RETORNAR AO ESTADO ANTERIOR DO ERRO.
	-- NÃO PERDE TODA A TRANSAÇÃO!!!
	
END; -- commit, rollback


/*
	Dirty read (leitura suja)
	- Um dos piores problemas
	- SGBDs não permitem (inclusive no postgreSql)

	Nonrepeatable Read
	- Dados alterados e confirmados (commit) são notados pela outra transação
	- Atualizações e deleções

	PHANTOM READ (leituras fantasmas)
	- Mesma ideia do Nonrepeatable read, mas com inserções.


	NÍVEIS DE ISOLAMENTO
	- Read Uncommited
	
	- Read Commited
	
	- Repeatable Read
	
	- Serializable
	
*/



