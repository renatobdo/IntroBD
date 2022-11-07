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

insert into martian_confidential values
(1, 'Ray', 'Bradburry', 1, null, 155900, 'gcta'),
(2, 'John', 'Black', 4, 10, 120100, 'cagt'); 

select * from martian_confidential;