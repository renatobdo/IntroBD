# https://www.tse.jus.br/partidos/partidos-registrados-no-tse/registrados-no-tse
alter table partido modify sigla varchar(20);
insert into partido (sigla, nome, nomeColigacao) values
('MDB', 'movimento democrático brasileiro', ''),
('PTB', 'partido trabalhista brasileiro', ''),
('PDT', 'partido democrático trabalhista', ''),
('PT', 'partido dos trabalhadores',''),
('PCdoB', 'partido comunista do Brasil', ''),
('PSB', 'partido socialista Brasileiro',''),
('PSDB', 'partido da social democracia Brasileira', ''),
('AGIR', 'agir', ''),
('PSC', 'partido social cristão', ''),
('PMN', 'partido da mobilização social',''),
('cidadania','cidadania', ''),
('PV', 'partido verde',''),
('AVANTE', 'avante',''),
('PP', 'progressistas',''),
('PSTU', 'partido socialista dos trabalhadores unificado',''),
('PCB', 'partido comunista brasileiro', ''),
('PRTB', 'partido renovador trabalhista brasileiro', ''),
('DC', 'democracia cristã',''),
('PCO', 'partido da causa operária',''),
('PODE', 'podemos',''),
('REPUBLICANOS', 'Republicanos', ''),
('PSOL', 'Partido Socialismo e Liberdade', ''),
('PL', 'Partido Liberal', ''),
('PSD', 'Partido Social Democrático', ''),
('PATRIOTA', 'Patriota', ''),
('PROS', 'Partido Republicano da Ordem Social', ''),
('SOLIDARIEDADE', 'Solidariedade', ''),
('NOVO', 'Partido Novo',''),
('REDE', 'Rede Sustentabilidade', ''),
('PMB', 'Partido da mulher brasileira', ''),
('UP', 'Unidade Popular', ''),
('UNIÃO', 'União Brasil', '');

select * from partido;
# E se fosse necessário acrescentar a data de fundaçãoptimize
# Presidente nacional e número da legenda?
alter table partido add dt_fundacao date;
alter table partido add presidente_nacional varchar(100);
alter table partido add num_legenda int;
select * from partido;
update partido set dt_fundacao = '1981-06-30' where sigla = 'MDB';
update partido set presidente_nacional = 'Luiz Felipe Baleia Tenuto Rossi' 
where sigla = 'MDB';
update partido set num_legenda = 15 where sigla = 'MDB';

update partido set dt_fundacao = '1981-06-30';
select * from partido;
update partido set dt_fundacao = '1981-11-03' where sigla ='PTB';
update partido set presidente_nacional = 'KASSYO SANTOS RAMOS' where sigla ='PTB';
update partido set num_legenda = 14 where sigla = 'PTB';
select * from partido;