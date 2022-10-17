rollback;
select * from candidato;
alter table candidato modify sexo varchar(20);

	
alter table candidato add 
	check (sexo = 'M' or sexo='F');
update candidato set sexo = 'masculino' where 
	cpf = 1;

create table cargo (codigo int,
cargo varchar(50));
alter table candidato add cargo int;
alter table cargo add 
	constraint primary key (codigo);
alter table candidato add constraint 
	fk_cargo foreign key (cargo) references 
		cargo(codigo);
 ALTER TABLE cargo ENGINE = InnoDB;
 select * from cargo;
  select * from candidato;


 # atualizar o cargo para os candidatos a presidente
 update candidato set cargo = 1 where 
	cpf between 1 and 13;
	
# utiliando joins entre as tabelas candidato e cargo    
select candidato.nome, cargo.cargo from 
	candidato join cargo on
	candidato.cargo = cargo.codigo;
    
alter table candidato add cargo  


update candidato set sexo = 'M' where 
	cpf between 1 and 9;
update candidato set sexo = 'F' where 
	cpf between 10 and 13;

select count(*) from candidato where sexo = 'M';