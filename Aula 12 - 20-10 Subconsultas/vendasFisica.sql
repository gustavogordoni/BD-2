-----------------------------------------------------------------------------------
-- Tabela Cliente 
create table cliente (
codigo_cliente numeric(5) not null,
nome_cliente varchar(40),
endereco varchar(40),
cidade varchar(20),
cep varchar(9),
uf char(2),
cnpj varchar(20),
ie varchar(20));
alter table cliente add constraint pk_cliente 
	primary key (codigo_cliente);

-- Tabela vendedor 
create table vendedor (
codigo_vendedor numeric(5) not null,
nome_vendedor varchar(40) not null,
salario_fixo numeric(7,2),
faixa_comissao char(1));

alter table vendedor add constraint pk_vendedor
primary key (codigo_vendedor);

-- Tabela pedido

create table pedido(
num_pedido numeric(5) not null,
prazo_entrega numeric(3) not null,
codigo_cliente numeric(5) not null,
codigo_vendedor numeric(5) not null,
total_pedido    numeric(10,2));

alter table pedido add constraint pk_pedido 
	primary key (num_pedido);
alter table pedido add constraint fk_pedido_cliente 
	foreign key (codigo_cliente) references cliente; 
alter table pedido add constraint fk_pedido_vendedor 
	foreign key (codigo_vendedor)references vendedor; 
                                              
--Tabela produto 
create table produto (
codigo_produto numeric(5) not null,
unidade char(3),
descricao varchar(30),
val_unit  numeric(7,2));

alter table produto add constraint pk_produto
	primary key (codigo_produto);

select * from produto;

-- Tabela Item_Pedido

create table item_pedido (
num_pedido numeric(5) not null,
codigo_produto numeric(5) not null,
quantidade numeric(3));

alter table item_pedido add constraint pk_item_pedido 
	primary key (num_pedido,codigo_produto);
alter table item_pedido add constraint fk_item_ped_pedi 
	foreign key (num_pedido) references pedido;
alter table item_pedido add constraint fk_item_ped_prod 
	foreign key (codigo_produto) references produto;

-- Fim das tabelas 
--Inserido dados na tabela cliente
insert into cliente 
  values (720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', 'RJ',
'12113231/0001-34', '2134');
insert into cliente
  values (870, 'Flávio', 'Av. Pres. Vargas 10', 'São Paulo', '22763931', 'SP',
'22534126/9387-9', '4631');
insert into cliente
  values (110, 'Jorge', 'Rua Caiapo 13', 'Curitiba', '30078500', 'PR',
'14512764/9834-9', null);
insert into cliente 
  values (222, 'Lúcia', 'Rua Itabira 123 Loja 9', 'Belo Horizonte',
'221243491', 'MG', '28315213/9348-8', '2985');

insert into cliente 
  values (830, 'Maurício', 'Av. Paulista 1236', 'São Paulo', '3012683', 'SP',
'32816985/7465-6', '9343');

insert into cliente 
  values (130, 'Edmar', 'Rua da Praia sn', 'Salvador', '30079300', 'BA',
'23463284/234-9', '7121');

insert into cliente
  values (410, 'Rodolfo', 'Largo da lapa 27 sobrado', 'Rio de Janeiro',
'30078900', 'RJ', '12835128/2346-9', '7431');

insert into cliente 
  values (20, 'Beth', 'Av. Climério n.45', 'São Paulo', '25679300', 'SP',
'3248126/7326-8', '9280');

insert into cliente
  values (157, 'Paulo', 'T. Moraes c/3', 'Londrina', null, 'PR',
'3284223/324-2', '1923');

insert into cliente
  values (180, 'Lúcio', 'Av. Beira Mar n. 1256', 'Florianópolis', '30077500',
'SC', '12736571/2347', null);

insert into cliente 
  values (260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ',
'21763571/232-9', '2530');

insert into cliente 
  values (290, 'Renato', 'Rua Meireles n. 123 bl. sl.345', 'São Paulo',
'30225900', 'SP', '13276547/213-3', '9071');

insert into cliente 
  values (390, 'Sebastião', 'Rua da Igreja n.10', 'Uberaba', '30438700', 'MG',
'32176547/213-3', '9071');

insert into cliente 
  values (234, 'José', 'Quadra 3 bl. 3 sl. 1003', 'Brasilia', '22841650', 'DF',
'21763576/1232-3', '2931');

insert into cliente 
  values (500, 'Rodolfo', 'Largo do São Francisco 27 sobrado', 'São Paulo', '82679330', 'SP', '6248125/3321-7', '1290');

--inserido dados na tabela Vendedor

insert into vendedor
  values (209, 'José', 1800.00, 'C');

insert into vendedor
  values (111, 'Carlos', 2490.00, 'A');

insert into vendedor
  values (11, 'João', 2780.00, 'C');

insert into vendedor
  values (240, 'Antônio', 9500.00, 'C');

insert into vendedor
  values (720, 'Felipe', 4600.00, 'A');

insert into vendedor
  values (213, 'Jonas', 2300.00, 'A');

insert into vendedor
  values (101, 'João', 2650.00, 'C');

insert into vendedor
  values (310, 'Josias', 870.00, 'B');

insert into vendedor
  values (250, 'Maurício', 2930.00, 'B');

--Inserido dados na tabela Pedido
--Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas
--tabelas Cliente e Vendedor

insert into pedido
  values (121,2,410,209, null);

insert into pedido
  values (97,2,720,101, null);

insert into pedido
  values (101,1,720,101, null);

insert into pedido
  values (137,2,720,720, null);

insert into pedido
  values (148,2,720,101, null);

insert into pedido
  values (189,5,870,213, null);

insert into pedido
  values (104,3,110,101, null);

insert into pedido
  values (203,3,830,250, null);

insert into pedido
  values (98,2,410,209, null);

insert into pedido
  values (143,3,20,111, null);

insert into pedido
  values (105,5,180,240, null);

insert into pedido
  values (111,2,260,240, null);

insert into pedido
  values (103,2,260,240, null);

insert into pedido
  values (91,2,260,11, null);

insert into pedido
  values (138,3,260,11, null);

insert into pedido
  values (108,5,290,310, null);

insert into pedido
  values (119,3,390,250, null);

insert into pedido
  values (127,1,410,11, null);


--Inserido dados na tabela Produto

insert into produto
  values (25,'Kg','Queijo',5.97);

insert into produto
  values (31,'BAR','Chocolate',5.87);

insert into produto
  values (78,'L','Vilho', 7);

insert into produto
  values (22,'M','Linho',5.11);

insert into produto
  values (30,'SAC','Açúcar',5.30);

insert into produto
  values (53,'M','Linha',6.80);

insert into produto
  values (13,'G','Ouro',11.18);

insert into produto
  values (45,'M','Madeira',5.25);

insert into produto
  values (87,'M','Cano',6.97);

insert into produto
  values (77,'M','Papel',6.05);




--Inserido dados na tabela Item_Pedido
--Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas
--tabelas Pedido e Produto*/

insert into item_pedido
  values (101,78,18);

insert into item_pedido
  values (101,13,5);

insert into item_pedido
  values (98,77,5);

insert into item_pedido
  values (148,45,8);

insert into item_pedido
  values (148,31,7);

insert into item_pedido
  values (148,77,3);

insert into item_pedido
  values (148,25,10);

insert into item_pedido
  values (148,78,30);

insert into item_pedido
  values (104,53,32);

insert into item_pedido
  values (203,31,6);

insert into item_pedido
  values (189,78,45);

insert into item_pedido
  values (143,31,20);

insert into item_pedido
  values (105,78,10);

insert into item_pedido
  values (111,25,10);

insert into item_pedido
  values (111,78,70);

insert into item_pedido
  values (103,53,37);

insert into item_pedido
  values (91,77,40);

insert into item_pedido
  values (138,22,10);

insert into item_pedido
  values (138,77,35);

insert into item_pedido
  values (138,53,18);

insert into item_pedido
  values (108,13,17);

insert into item_pedido
  values (119,77,40);

insert into item_pedido
  values (119,13,6);

insert into item_pedido
  values (119,22,10);

insert into item_pedido
  values (119,53,43);

insert into item_pedido
  values (137,13,8);

-- Fim inserts 

-- Confirmando alterações 
--Realizando as alterações no banco de dados após ele ser instalado
--Adicionando campo de senha na tabela vendedor
alter table vendedor add senha varchar;

-- Adicionando campos na tabela produto
alter table produto add valor_custo numeric(7,2);
alter table produto rename val_unit to  valor_venda ;
alter table produto add qtde_minima numeric(5,2);
alter table produto add qtde numeric(5,2);

update produto
set qtde =  10;

update produto
set qtde_minima =  5;

update produto
set valor_custo =  3;

update produto
set valor_custo =  3;


---- Adicionando campos na tabela item_pedido
alter table item_pedido add valor_venda numeric(7,2);
alter table item_pedido add valor_custo numeric(7,2);

-- Adicionando o campo comissao_produto e atribuindo valor a ele na tabela produto
alter table produto add comissao_produto numeric(5,3);

update produto
set comissao_produto = 0.005;

-- Salvando os Dados 

commit;

-- Fim 

-------------------------------------------------------------------
/*

select <colunas> from Tabela1
	where coluna IN (select colunaX from tabela);


- AS COLUNAS DEVEM POSSUIR O MESMO TIPO DE DADO;
- SE JÁ SE RELACIONOU, RETORNA;

*/

-- ALTER JOINS 
select nome_cliente, prazo_entrega FROM 
	cliente c LEFT JOIN pedido p
	ON c.codigo_cliente = p.codigo_cliente;	

select nome_cliente, prazo_entrega FROM 
	cliente c LEFT JOIN pedido p
	ON c.codigo_cliente = p.codigo_cliente
	WHERE prazo_entrega IS NULL;	



-- SUBCONSULTAS
/* 
ESCOPO DAS COLUNAS.

Colunas mais externas são visíveis 
e podem ser utilizadas nas mais internas.

Colunas internas não podem ser utilizadas nas externas.

*/

SELECT v.nome_vendedor  FROM vendedor v
	WHERE v.codigo_vendedor 
	IN (SELECT p.codigo_vendedor from pedido p);

SELECT v.nome_vendedor FROM vendedor v
	WHERE v.codigo_vendedor 
	IN (SELECT p.codigo_vendedor from pedido p 
	WHERE prazo_entrega > 3);


-- nome dos vendedores que venderam algum 
-- pedido para clientes de SP. 
SELECT v.nome_vendedor FROM vendedor v
	WHERE v.codigo_vendedor 
	IN (SELECT p.codigo_vendedor from pedido p 
		WHERE p.codigo_cliente 
		IN (SELECT c.codigo_cliente FROM cliente c
			WHERE c.uf = 'SP'));


-- SELECIONAR o vendedor e o salário fixo do vendedor com o maior salário
SELECT nome_vendedor, salario_fixo FROM vendedor
	WHERE salario_fixo IN 
		(SELECT max(salario_fixo) FROM vendedor);
	
SELECT nome_vendedor, salario_fixo FROM vendedor
	WHERE salario_fixo =
		(SELECT max(salario_fixo) FROM vendedor);


-- EXISTS é uma função que retorna TRUE se a sub consulta retorna alguma linha. FALSE, caso contrário.
-- NOT EXISTS é o inverso. Retorna TRUE se não voltar nenhuma linha e FALSE caso contrário.
SELECT v.nome_vendedor FROM vendedor V
	WHERE EXISTS 
	(SELECT * from pedido p WHERE p.prazo_entrega = 3);


-- EXIST com junção na subConsulta
SELECT nome_cliente FROM cliente c
	WHERE EXISTS (
    	SELECT 1 FROM pedido p
    		WHERE p.codigo_cliente = c.codigo_cliente
		);
-- é equivalente a:
SELECT c.nome_cliente FROM cliente c
	WHERE c.codigo_cliente IN
	(SELECT p.codigo_cliente FROM pedido p);


-- 1. Utilizando sub consultas, retorne o nome dos vendedores que venderam
-- pedidos com prazo de entrega igual a 3 ou 5

SELECT v.nome_vendedor FROM vendedor v
	WHERE v.codigo_vendedor IN
	(SELECT p.codigo_vendedor FROM pedido p
	WHERE prazo_entrega BETWEEN 3 AND 5);