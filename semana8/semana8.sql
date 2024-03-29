delete from candidato where cargo = 5 order by cpf;

create table fruta (id int, nome varchar(100), idcor int);
create table cor(id int, nome varchar(100));
alter table fruta add constraint 
	fk_corfruta foreign key (idcor) references 
		cor(id);
insert into cor (id, nome) values (1, 'amarela'),
(2, 'vermelho'),
(3, 'verde'), 
(4, 'azul');    

insert into fruta (id, nome,idcor) values(1,'banana', 1),
(2,'maça', 2),
(3,'abacate', 3); 
insert into fruta (id, nome,idcor) values(5,'fruta_sem_cor', 5);   

insert into fruta (id, nome,idcor) values(4, 'morango', 2);
select * from cor;
select * from fruta;

#1 left inclusive
select * from fruta left join cor on
	fruta.idcor = cor.id;
    
#2 left exclusive
select * from fruta left join cor on
	fruta.idcor = cor.id where cor.nome is null;
    
#3 full outer inclusive (pesquisem sobre o full no mysql)
select * from fruta full join cor on
	fruta.idcor = cor.id;

select * from fruta left join cor on
	fruta.idcor = cor.id
    union
select * from fruta right join cor on
	fruta.idcor = cor.id;

#4 inner join
select * from fruta inner join cor on
	fruta.idcor = cor.id;
    
##5 full outer exclusive (pesquisem sobre o full no mysql)
select * from fruta full join cor on
	fruta.idcor = cor.id where fruta.idcor is null or 
    cor.id is null;
#https://stackoverflow.com/questions/4796872/how-can-i-do-a-full-outer-join-in-mysql
select * from fruta left join cor on
	fruta.idcor = cor.id where fruta.idcor is null or 
    cor.id is null
    union
select * from fruta right join cor on
	fruta.idcor = cor.id where fruta.idcor is null or 
    cor.id is null;

#6 right inclusive
select * from fruta right join cor on
	fruta.idcor = cor.id;

#7 right exclusive
select * from fruta right join cor on
	fruta.idcor = cor.id where fruta.idcor is null;

# Agrupando pela cor da fruta
select * from cor;

# Desafio 1... Tentativa 
select count(*), cor.nome 
	from fruta left join cor
		on fruta.idcor = cor.id 
        union 
select count(*), cor.nome 
	from fruta right join cor
		on fruta.idcor = cor.id         
			group by idcor order by 1 desc;
#
SELECT 
    CONCAT(c.cpf, ', ', c.nome) AS vice,
    CONCAT(c.cpf, ', ', c.nome) AS presidente
FROM
    candidato c
INNER JOIN candidato ca ON 
    c.candidato = ca.candidato
ORDER BY 
    Manager;

select * from employees;