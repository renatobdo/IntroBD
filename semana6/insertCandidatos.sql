delete from candidato;
select * from candidato order by cpf;
#https://divulgacandcontas.tse.jus.br/divulga/#/estados/2022/2040602022/BR/candidatos

delete from candidato;
select * from candidato;
select count(*) from candidato;
alter table candidato add cargo varchar(100);
update candidato set cargo = 'presidente';
select * from candidato;
update candidato set cargo = 'vice-presidente'
	where cpf  between 14 and 26 ;
# ou poderia ser feito dessa forma:
# update candidato set cargo = 'vice-presidente'
#	where cpf  >= 14 and cpf <= 26 ;    

select * from candidato;

# atualizar os cargos dos candidatos a deputado federal por são paulo
update candidato set cargo = 'deputado federal'
	where cpf  between 27 and 1566 ;

alter table candidato add id int after cpf; 
select * from candidato;
# realizando a cópia da coluna cpf para a coluna id;
update candidato set id = cpf;
alter table candidato drop cpf;
alter table candidato add constraint primary key (id);
alter table candidato add cpf varchar(20) after id;

update candidato set siglaEstado = 'SP' where cargo = 'deputado federal';

select * from candidato;
select count(*) from candidato where cargo = 'deputado federal';
select count(*) from candidato where cargo = 'governador';
select count(*) from candidato where cargo = 'presidente';
select * from estado;
select * from municipio where nome like 'Sao Paulo';

update municipio set populacao = 1200000 where nome like 'Sao Paulo';

update candidato set cargo = 'governador' where id between 1567 and 1576;
update candidato set siglaEstado = 'SP' where id between 1567 and 1576;
