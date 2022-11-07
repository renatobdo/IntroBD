Create table martian_confidential
(martian_id int,
first_name varchar(40),
last_name varchar(80),
base_id int,
super_id int,
salary decimal(8,2),
dna_id varchar(30));


insert into martian_confidential values
(1, 'Ray', 'Bradburry', 1, null, 155900, 'gcta'),
(2, 'John', 'Black', 4, 10, 120100, 'cagt'); 

select * from martian_confidential;

######### Passos para criar a view ############
# 1 - criar uma query que irá retornar os dados que irão aparecer na view
#
select martian_id, first_name, last_name, base_id, super_id
from martian_confidential;

create view martian_public as 
select martian_id, first_name, last_name, base_id, super_id
from martian_confidential;

select * from martian_public;

#### Criação da tabela visitor ###############
create table visitor(visitor_id integer,
host_id integer,
first_name varchar(30),
last_name varchar(80));

insert into visitor values (1, 1,'George', 'Ambrose'),
(2, 2,'Kris', 'Cardenas'),
(3, 3, 'Priscilla', 'Lane'),
(4, 4,'Jane', 'Thorton');

##### Criar uma view de todas as pessoas em marte
### colunas requeridas fisrt name, last name, 
#### unique id, martian ou visitor?

select martian_id, first_name, last_name, 'Martian' as status
from martian_public
	union
select visitor_id, first_name, last_name, 'visitor' as status
from visitor;

#### Temos martian e visitor com mesmo id na tabela, por isso podemos usar o concat para
#### diferenciá-los
######## CONCAT ################
select CONCAT('m', martian_id) AS id, first_name, last_name, 
	'Martian' as status
from martian_public
	UNION
select CONCAT('v', visitor_id) AS id, first_name, last_name, 
	'visitor' as status
from visitor;

############### Criação da view ################
CREATE VIEW people_on_mars AS
select CONCAT('m', martian_id) AS id, first_name, last_name, 
	'Martian' as status
from martian_public
	UNION
select CONCAT('v', visitor_id) AS id, first_name, last_name, 
	'visitor' as status
from visitor;

select * from people_on_mars 
	ORDER BY last_name;
    
## Outro benefício da view é a simplicidade pois esconde a complexidade
## Queries comuns devem ser simples.

Create table base (base_id integer,
base_name varchar(50), 
founded date);
insert into base values(1,
'tharsisland', '2037-06-03'),
(2,
'Valles Marineris 2.0', '2040-12-01'),
(3,
'Gale Cratertown', '2041-08-15'),
(4,
'New New New York', '2042-02-10'),
(5,
'Olympus Mons Spa & Casino', null);

create table inventory (base_id integer primary key,
supply_id integer primary key,
quantity integer,
foreign key(base_id) references base(base_id),
foreign key(supply_id) references supply(supply_id));
insert into inventory values(1, 1, 8),
(1,3,5),
(1,5,1),
(1,6,2),
(1,8,12),
(1,9,1),
(2,4,5),
(2,8,62),
(2,10,37),
(3,2,11),
(3,7,2),
(4,10,91);


create table supply(supply_id integer primary key,
nome varchar(80),
description varchar(120),
quantity integer);

insert into supply values(1, 'solar panel', 'standard 1x1 meter cell', 912),
(2, 'water filter', 'this takes things out of your water
so it\'s drinkable', 6),
(3, 'Duct Tape', 'A 10 meter roll of duct tape for ALL your repairs', 951),
(4, 'Ketchup', 'It\'s ketchup... ', 206),
(5, 'Battery Cell', 'Standard 1000 KAh battery cell for power grid
(heavy item)', 17),
(6, 'USB 6.0 cable', 'Carbon fiber coated / 15 TBps spool', 42),
(7, 'Fuzzy Duster ', 'It gets dusty around here. Be prepared!', 19),
(8, 'Mars bars', 'The original nutrient bar made with the finest
bioengineered ingredients', 3801),
(9, 'Air Filter', 'Removes 99% of all Martian dust from your
ventilation unit', 23),
(10, 'Famous Ray\'s Frozen Pizza', 'This Martian favorite is covered
in all your favorite toppings. 1 flavor only', 823);

########### 
## Criar uma view com o nome base_storage
# com a quantidade de suprimentos em cada base

select b.base_id, s.supply_id, s.name
from base as b
cross join supply as s;

## conecta cada linha na tabela da esquerda com cada linha
## na tabela da direita. Isso nos dá todas as combinações de base supply
## 5 bases x 10 supply itens = 50 linhas

select b.base_id, s.supply_id, s.name,
	(select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id)
from base as b
cross join supply as s;

## iremos substituir todos os valores nulos por zero com a função
## COALESCE
select b.base_id, s.supply_id, s.name,
	COALESCE((select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id),0)
from base as b
cross join supply as s;
################
select b.base_id, s.supply_id, s.name,
	COALESCE((select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id),0)
        AS quantity
from base as b
cross join supply as s;

##### Criando a view ###############
Create view base_storage as
select b.base_id, s.supply_id, s.name,
	COALESCE((select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id),0)
        AS quantity
from base as b
cross join supply as s;

######### Exercício 
# Crie uma view que mostre os produtos que estejam com o preço
# acima da média
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products); 



##########################################
create table products (id int primary key,
quantityInStock int,
msrp int, 
productCode varchar(30));

### msrp = preço sugerido pelo fabricante
insert into products values (1, 1, 2, 'S12_1090');
insert into products values (2, 2, 30, 'S12_1091');
insert into products values (3, 3, 40, 'S12_1092');
insert into products values (4, 4, 50, 'S12_1093');
insert into products values (5, 5, 100, 'S12_1099');
