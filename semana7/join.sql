select * from candidato;
	
alter table candidato add 
	check (sexo = 'M' or sexo='F');
    
update candidato set sexo = 'masculino' where 
	cpf = 1;
alter table candidato modify sexo varchar(10);

select * from cargo;
select * from candidato;
select count(*) from candidato;
select * from candidato order by cpf;
select * from candidato;
select * from candidato where nome like '%haddad%';

# atualizar o cargo para os candidatos a presidente
update candidato set cargo = 1 where 
	cpf between 1 and 13;
	
# utiliando joins entre as tabelas candidato e cargo    
select * from candidato;
select can.nome, can.cargo, car.cargo from 
	candidato can inner join cargo car on
	can.cargo = car.codigo order by car.cargo desc;

# selecionar os candidatos agrupando pela sigla

select count(*),sigla from candidato 
group by sigla order by 1 desc;

select * from partido;
select * from municipio;
select * from estado left join municipio
	on sigla_estado = siglaEstado;
select * from municipio where siglaEstado = 'SP';
update municipio set siglaEstado = 'SP' 
	where siglaEstado = 26;
select * from estado;
	


select * from candidato where sexo = 'F';
#
update candidato set sexo = 'M' where 
	cpf between 1 and 9;
update candidato set sexo = 'F' where 
	cpf between 10 and 13;

select count(*) from candidato where sexo = 'M';

# Teste violação da constraint check
#update candidato set sexo = 'masculino' where 
#	cpf = 1;
select * from candidato;
select * from cargo;
insert into cargo (codigo, cargo) values ('6', 'vice-presidente');
insert into cargo (codigo, cargo) values ('7', 'vice-governador');
# Atualizando os cargos dos candidatos a vice-presidente
update candidato set cargo = 6 where 
	cpf between 14 and 26;

select * from candidato order by cpf;

select * from cargo;
#Atualizando os cargos dos governadores
update candidato set cargo = 3 where cpf between 1567 and 1576;

#Atualizando os cargos dos vice-governadores
update candidato set cargo = 7 where cpf between 1577 and 1588;

#Atualizando os cargos dos deputados federais
update candidato set cargo = 4 where cpf between 27 and 1566;

#Atualizando os cargos dos senadores
update candidato set cargo = 2 where cpf between 1589 and 1599;

#Atualizando os cargos dos deputados estaduais
update candidato set cargo = 5 where cpf between 1600 and 3658;

select * from candidato order by cpf;