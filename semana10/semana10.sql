select * from candidato;
alter table candidato add sereporta int;
update candidato set sereporta = 6 where cpf = 18;
update candidato set sereporta = 1575 where cargo = 5; 

select * from candidato can inner join cargo car 
	on can.cargo = car.codigo; 
SELECT 
    c.cpf, c.nome AS chefe,
    ca.cpf, ca.nome AS 'Se reporta a...'
FROM
    candidato c
INNER JOIN candidato ca ON 
    c.cpf = ca.sereporta
ORDER BY 
    chefe;

Create table martian_confidential
(martian_id int primary key,
first_name varchar(40),
last_name varchar(80),
base_id int,
super_id int,
salary decimal(8,2),
dna_id varchar(30),
foreign key(base_id) references base (base_id)
);
alter table martian_confidential add religiao varchar(100);

insert into martian_confidential values
(1, 'Ray', 'Bradburry', 1, null, 155900, 'gcta'),
(2, 'John', 'Black', 4, 10, 120100, 'cagt'); 

select * from martian_confidential;
create view martian_confidential2 as
	select martian_id, first_name, last_name,
		base_id, super_id, salary from martian_confidential;
select * from martian_confidential2;
update martian_confidential set religiao = 'evangélico';

create table visitor(visitor_id integer,
host_id integer,
first_name varchar(30),
last_name varchar(80));

insert into visitor values (1, 1,'George', 'Ambrose'),
(2, 2,'Kris', 'Cardenas'),
(3, 3, 'Priscilla', 'Lane'),
(4, 4,'Jane', 'Thorton');

alter table visitor add primary key (visitor_id); 

select martian_id, first_name, last_name, 'Martian' as status
from martian_confidential2
	union
select visitor_id, first_name, last_name, 'visitor' as status
from visitor;

select CONCAT('m', martian_id) AS id, first_name, last_name, 
	'Martian' as status
from martian_confidential2
	UNION
select CONCAT('v', visitor_id) AS id, first_name, last_name, 
	'visitor' as status
from visitor;

create view people_on_mars as
select CONCAT('m', martian_id) AS id, first_name, last_name, 
	'Martian' as status
from martian_confidential2
	UNION
select CONCAT('v', visitor_id) AS id, first_name, last_name, 
	'visitor' as status
from visitor;
select * from people_on_mars;

Create table base (base_id integer,
base_name varchar(50), 
founded date);
alter table base add primary key (base_id);
insert into base values
(1,'tharsisland', '2037-06-03'),
(2,'Valles Marineris 2.0', '2040-12-01'),
(3,'Gale Cratertown', '2041-08-15'),
(4,'New New New York', '2042-02-10'),
(5,'Olympus Mons Spa & Casino', null);

create table inventory (inventory_id integer primary key auto_increment, base_id integer,
supply_id integer,
quantity integer,
foreign key(base_id) references base(base_id),
foreign key(supply_id) references supply(supply_id));

insert into inventory(base_id, supply_id, quantity) values(1, 1, 8),
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
(2, 'water filter', 'this takes things out of your water so it\'s drinkable', 6),
(3, 'Duct Tape', 'A 10 meter roll of duct tape for ALL your repairs', 951),
(4, 'Ketchup', 'It\'s ketchup... ', 206),
(5, 'Battery Cell', 'Standard 1000 KAh battery cell for power grid (heavy item)', 17),
(6, 'USB 6.0 cable', 'Carbon fiber coated / 15 TBps spool', 42),
(7, 'Fuzzy Duster ', 'It gets dusty around here. Be prepared!', 19),
(8, 'Mars bars', 'The original nutrient bar made with the finest bioengineered ingredients', 3801),
(9, 'Air Filter', 'Removes 99% of all Martian dust from your ventilation unit', 23),
(10, 'Famous Ray\'s Frozen Pizza', 'This Martian favorite is covered in all your favorite toppings. 1 flavor only', 823);
select b.base_id, s.supply_id, s.nome
from base as b
cross join supply as s order by base_id, supply_id;

select b.base_id, s.supply_id, s.nome,
	(select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id) as quantity
from base as b
cross join supply as s ORDER BY BASE_ID, SUPPLY_ID;

select b.base_id, s.supply_id, s.nome,
	COALESCE((select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id),0) as 
        quantity
from base as b
cross join supply as s;

Create view base_storage as
select b.base_id, s.supply_id, s.nome,
	COALESCE((select quantity from inventory
		where base_id = b.base_id AND supply_id = s.supply_id),0)
        AS quantity
from base as b
cross join supply as s;

select * from base_storage;

select * from martian_confidential;
update martian_confidential set religiao = 'evangélico'
where martian_id = 3;
delete from martian_confidential where martian_id = 3;