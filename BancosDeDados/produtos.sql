create table Cliente(
codigo int not null unique,
nome varchar(50),
telefone varchar(15));

create table Produto(
codigo int not null unique,
nome varchar(40),
preco numeric(4,2));

create table Venda(
nf integer not null unique,
codcli integer,
codpro integer,
qtde integer);

insert into Cliente (codigo,nome, telefone) values (1, 'Maria', '3785-8457');
insert into Cliente (codigo, nome, telefone) values(2, 'Juca', '3665-0019');
insert into Cliente (codigo, nome, telefone) values(3, 'Teobaldo', '3877-2384');
insert into Cliente (codigo, nome, telefone) values(4, 'Joaquina', '3987-3357');
insert into Cliente (codigo, nome, telefone) values(5, 'Jeferson', '3335-5594');

insert into Produto (codigo, nome, preco) values(1, 'chocolate', 5.00);
insert into Produto (codigo, nome, preco) values(2, 'sorvete', 10.00);
insert into Produto (codigo, nome, preco) values(3, 'suco', 6.00);
insert into Produto (codigo, nome, preco) values(4, 'refrigerante', 4.50);
insert into Produto (codigo, nome, preco) values(5, 'sanduiche', 8.50);
insert into Produto (codigo, nome, preco) values(6, 'água', 3.50);

insert into Venda (nf, codcli, codpro, qtde) values(1,1,1,2);
insert into Venda (nf, codcli, codpro, qtde) values(2,1,2,1);
insert into Venda (nf, codcli, codpro, qtde) values(3,1,3,2);
insert into Venda (nf, codcli, codpro, qtde) values(4,2,2,1);
insert into Venda (nf, codcli, codpro, qtde) values(5,2,1,3);
insert into Venda (nf, codcli, codpro, qtde) values(6,3,2,3);
insert into Venda (nf, codcli, codpro, qtde) values(7,3,3,4);
insert into Venda (nf, codcli, codpro, qtde) values(8,4,2,1);
insert into Venda (nf, codcli, codpro, qtde) values(9,5,1,1);
insert into Venda (nf, codcli, codpro, qtde) values(10,4,3,2);