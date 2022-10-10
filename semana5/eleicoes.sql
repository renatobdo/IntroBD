drop database if exists eleicoes;
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
 id INT PRIMARY KEY,
 nome varchar(80) 
  
); 

CREATE TABLE Estado 
( 
sigla_Estado varchar(2) PRIMARY KEY,
 nome varchar(80)
 
); 

CREATE TABLE Municipio 
( 
 id INT PRIMARY KEY,
 nome varchar(100),  
 siglaEstado varchar(2),
 populacao int
 
); 

create table candidato
(
	cpf int primary key,
    nome varchar(150),
    sigla varchar(15),
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

alter table estado add capital varchar(100);
alter table estado add nomeColigacao varchar(80);

alter table estado add constraint fk_estadoPartido
foreign key (nomeColigacao) references Coligacao (nome);







