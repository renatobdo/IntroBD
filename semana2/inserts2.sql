use mydb;
insert into categoria (codigo, descricao) values (1, 'bebidas'),
(2, 'frutas'),
(3, 'carnes'),
(4, 'frios'),
(5, 'limpeza'),
(6, 'higiene'),
(7, 'roupas');

insert into fornecedor (codigo, nome, endereco, bairro, estado,
telefone) values 
(1, 'AMBEV', 'Av. Amâncio Gaioli, 1493', 'Água Chata', 'SP', NULL),
(2, 'Natural da terra', 'Av. Kennedy, 782', 'Centro', 'SP', NULL),
(3, 'Swift', 'Av. Francisco Prestes Maia, 136', 'Centro', 'SP', NULL),
(4, 'Hering', 'Av. Senador Vergueiro, 4190', 'Rudge Ramos', 'SP', '(11) 2988-2969'),
(5, 'Limpeza Net Descartáveis E Utilidades', 'Av. Senador Vergueiro, 4147', 
'Rudge Ramos', 'SP', '(11) 4368-9715');

insert into produto (codigo, nomeprod, estoque, codcategoria, codfornecedor) 
values 
(1, 'skol', 1000, 1, 1),
(2, 'Brahma', 2000, 1, 1),
(3, 'Sukita', 200, 1, 1),
(4, 'Guaraná Antártica', 500, 1, 1),
(5, 'Banana', 50, 2, 2),
(6, 'Maçã', 70, 2, 2),
(7, 'uva', 30, 2, 2),
(8, 'alcatra', 20, 3, 3),
(9, 'maminha', 15, 3, 3),
(10, 'carne moída', 30, 3, 3),
(11, 'camiseta', 5, 7, 4),
(12, 'bermuda', 7, 7, 4),
(13, 'boné', 3, 7, 4),
(14, 'sabonete', 100, 6, 5),
(15, 'detergente', 200, 5, 5);

select * from categoria;
select * from fornecedor;
select * from produto;
