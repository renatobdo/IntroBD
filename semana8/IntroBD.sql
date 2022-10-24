create database testes;
use testes;
Create Table CLIENTE ( ID_CLIENTE Integer not null,
nome varchar(40) not null,
razao_social varchar(60),
CPJ_CNPF varchar(18),
Ativo Boolean,
Saldo Numeric(15, 2 ),
constraint pk_cliente primary Key ( id_cliente )
);

Insert Into CLIENTE (ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO)
Values (1, 'PADARIA DOCES E SABORES', 'PADARIA DS', '1234567890', true, -100 );
 Insert Into CLIENTE (ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO)
Values (2, 'PEDRO DA SILVA TADEU', null, '8415784548', false, 1200 );
 Insert Into CLIENTE (ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO)
Values (3, 'JOAO JOSE FARINHA', null, '3232242342', false, -10 );
 Insert Into CLIENTE (ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO)
Values (4, 'FLAVIA MARIA PEDROSCA', 'FMP', '1294316576', true, 2554 );
 Insert Into CLIENTE (ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO)
Values (5, 'DEVMEDIA', 'CLUBE DELPHI', '129431657600123', true, null );

select * from cliente;

SELECT ID_CLIENTE, NOME, RAZAO_SOCIAL, CPJ_CNPF, ATIVO, SALDO,
CASE
 WHEN SALDO < 0 THEN 'Cliente Devedor'
 WHEN SALDO = 0 THEN 'Saldo zerado'
 WHEN SALDO > 0 THEN 'Saldo Positivo'
ELSE
 'Indefinido'
end as SITUACAO
FROM CLIENTE;

# retorna a coluna com o nome que não for nulo entre 
# o campo NOME e RAZAO_SOCIAL. Caso os dois campos
# não sejam nulos retorna o primeiro campo.
# Já a coluna SALDO 
# irá retornar zero quando a coluna for nulo.
SELECT
ID_CLIENTE, COALESCE( NOME, RAZAO_SOCIAL ) as NOME_APRESENTACAO,
NOME, RAZAO_SOCIAL, COALESCE( SALDO, 0.0) as SALDO
FROM CLIENTE;