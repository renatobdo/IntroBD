create database eleicoes;
use eleicoes;

CREATE TABLE partido 
( 
 sigla varchar(10) PRIMARY KEY,  
 nome varchar(80),
 nomeColigacao varchar(80)  
); 

CREATE TABLE coligacao 
( 
 nome varchar(80),  
 id INT PRIMARY KEY 
); 

CREATE TABLE Estado 
( 
 nome varchar(80),  
 sigla_Estado varchar(2) PRIMARY KEY
); 

CREATE TABLE Municipio 
( 
 nome varchar(100),  
 id INT PRIMARY KEY,
 populacao int,
 siglaEstado varchar(2)
); 

create table candidato
(
	cpf int primary key,
    nome varchar(150),
    sigla varchar(10),
    siglaEstado varchar(2),
    vice tinyint(1),
    vicecpf int
);
alter table Municipio add constraint fk_siglaEstadoMunicipio
foreign key (siglaEstado) references Estado (sigla_Estado);

alter table partido add constraint fk_nomecoligacao
foreign key (nomeColigacao) references coligacao (nome);

alter table candidato add constraint fk_siglaEstado
foreign key (siglaEstado) references Estado (sigla_Estado);

alter table candidato add constraint fk_viceCandidato
foreign key (vicecpf) references candidato (cpf);
 
alter table candidato add constraint fk_sigla 
foreign key (sigla) references partido(sigla);

alter table estado add constraint fk_estadoPartido
foreign key (nomeColigacao) references Coligacao (nome);






