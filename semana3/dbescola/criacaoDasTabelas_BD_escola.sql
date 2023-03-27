-- cria o banco de dados escola
drop database escola2;
CREATE database escola2;
USE escola2 ;
-- -----------------------------------------------------
-- Table `escola`.`turma`
-- -----------------------------------------------------
CREATE TABLE turma (
  codigo VARCHAR(10) NOT NULL,
  professor VARCHAR(60) NOT NULL,
  ano DATE NULL,
  semestre INT NULL,
  numero_disciplina VARCHAR(45) NULL,
  PRIMARY KEY (codigo));


-- -----------------------------------------------------
-- Table `escola`.`aluno`
-- -----------------------------------------------------
CREATE TABLE aluno (
  prontuario VARCHAR(10) NOT NULL,
  nome VARCHAR(150) NOT NULL,
  data_nascimento DATETIME NOT NULL,
  genero VARCHAR(15) NOT NULL,
  altura FLOAT NULL,
  peso FLOAT NULL,
  etnia VARCHAR(45) NULL,
  turma_codigo VARCHAR(10) NOT NULL,
  PRIMARY KEY (prontuario),
  CONSTRAINT fk_aluno_turma1 FOREIGN KEY (turma_codigo)
    REFERENCES turma (codigo) ON DELETE NO ACTION ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `escola`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE disciplina (
  codigo VARCHAR(10) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  aluno_prontuario VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_disciplina_aluno
    FOREIGN KEY (aluno_prontuario)
    REFERENCES aluno (prontuario));


-- -----------------------------------------------------
-- Table `escola`.`pre_requisito`
-- -----------------------------------------------------
CREATE TABLE pre_requisito (
  numero_pre_requisito VARCHAR(10) NOT NULL,
  disciplina_codigo VARCHAR(10) NOT NULL,
  PRIMARY KEY (numero_pre_requisito, disciplina_codigo),
  CONSTRAINT fk_pre_requisito_disciplina1
    FOREIGN KEY (disciplina_codigo)
    REFERENCES disciplina (codigo));
    
create table registro_nota(
	codigo varchar(10), nota float, numero_aluno varchar(10), 
    turma_codigo varchar(10), primary key (codigo), constraint fk_registro
    foreign key(numero_aluno) references aluno(prontuario));


INSERT INTO turma values ('DBE', 'Renato Bueno', 2023, 1,'DBE1') ; 

insert into aluno values ('GU21579X', 'Renato Bueno', '2007-09-05', 
					'MASCULINO', 1.74, 69, 'BRANCO','DBE');
                    
#select * from aluno;                    
                    
alter table turma modify ano year;    
update turma set ano = 2023 where codigo = 'DBE';                
#select * from turma;  

#select count(*) from aluno where genero = 'F';
#select count(*) from aluno where genero = 'M';
#select count(*) as 'quantidade', 
#	altura from aluno group by altura;
alter table aluno modify genero varchar(2);




INSERT INTO aluno (prontuario, nome, data_nascimento, 
genero, altura, peso, etnia,
 turma_codigo)VALUES 
('GU1234500', 'João Silva', '2005-02-15', 
'NB', 1.70, 65, 'Branca', 'DBE');

#select count(*) as 'quantidade', genero from aluno 
#	group by genero;

#select count(*) as 'quantidade', etnia from aluno 
#	group by etnia;

    
    
    
#select altura, nome from aluno order by altura;

#select * from aluno;  
#select * from aluno where altura > 1.8;  
#select round(AVG(altura),2) from aluno;

#select count(*) from aluno where altura < 1.69;
#select count(*) from aluno where altura > 1.69;

#select count(*) from aluno;

alter table aluno modify genero varchar(2); 
alter table aluno modify data_nascimento date;             
                    
				
insert into aluno values ('GU21578X', 'Jose Bueno', '1952-09-05', 
					'MASCULINO', 1.74, 69, 'BRANCO','DBE');
insert into aluno values ('GU21575X', 'Maria Diná', '1942-11-28', 
					'Feminino', 1.50, 58, 'BRANCO','DBE');
                    

#select * from turma;


#select * from aluno where genero like 'fe%'; 
#select * from aluno where altura > 1.5;

#select * from turma; 


alter table turma modify ano year;
update turma set ano = 2023 where codigo = 'DBE';




#alter table aluno add genero varchar(50) after data_nascimento;

insert into disciplina values ('DBE', 'Desenvolvimento Backend', 'GU21579X');
insert into pre_requisito values (1, 'DBE');
#select * from disciplina;
#select * from pre_requisito;


update turma set ano = 2023 where codigo = 'DBE';

select prontuario,data_nascimento from aluno;
insert into aluno values ('GU123456', 'Rafael Bueno', '2007-09-05', 
	'MASCULINO', 1.74, 69, 'BRANCO', 'DBE');
UPDATE aluno set data_nascimento = '2007-09-05 16:30:00' where 
prontuario = 'GU123456';
              
UPDATE ALUNO SET data_nascimento = '2007-09-05' where prontuario = 'GU21579X';

select * from turma;
select * from aluno;