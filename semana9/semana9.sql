# Database utilizado para os exemplos com subqueries
create database projetos2;
use projetos2;
#
create table projetos (id int,
titulo varchar(45),
datap date,
url varchar(100));
#
create table usuario (id int,
nome varchar(45),
email varchar(45),
senha varchar(45));
#
create table comentario(id int,
comentario text,
datac date,
id_usuario int,
id_projeto int);
#
create table likes_por_projeto(id_projeto int,
id_usuario int);
#
create table likes_por_comentario(id_usuario int,
id_comentario int);
#
alter table projetos add primary key (id);
alter table usuario add primary key(id);
alter table comentario add primary key (id);
alter table likes_por_projeto add primary key(id_projeto,id_usuario);
alter table likes_por_comentario add primary key(id_usuario,id_comentario);


alter table comentario add foreign key (id_projeto) references projetos(id);
alter table comentario add foreign key (id_usuario) references usuario(id);
alter table likes_por_projeto add foreign key (id_projeto) references projetos(id);
alter table likes_por_projeto add foreign key (id_usuario) references usuario(id);


alter table likes_por_comentario add foreign key (id_usuario) references usuario(id);
alter table likes_por_comentario add foreign key (id_comentario) references comentario(id);

insert into projetos (id, titulo, datap) values (1, 'Aplicação C#', '2018-04-01'),
(2, 'Aplicação Ionic', '2018-05-07'),
(3, 'Aplicação Python', '2018-08-05');

insert into comentario (id, comentario, id_projeto, id_usuario) 
	values (1, 'A Microsoft acertou com essa linguagem', 1, 1),
(2, 'Parabéns pelo projeto!bem legal!',1, 3),
(3, 'Super interessante! Fácil e rápido!',2, 4),
(4, 'Cara, que simples fazer um app assim!',2, 1),
(5, 'Linguagem muito diferente.',3, 3),
(6, 'Adorei aprender Python! Parabéns!',3, 2),
(7, 'Muito maneiro esse framework!',2, 2);

insert into usuario (id, nome, email, senha) values
	(1, 'Bruna Luiza', 'bruninha@gmail.com', 'abc123.'),
    (2, 'Thiago Braga', 'thiagobraga_1@hotmail.com', 'pena093'),
    (3, 'Osvaldo Justino', 'osvaltino@yahoo.com.br', 'osvaldit1_s'),
    (4, 'Gabriel Fernando', 'gabriel_fnd@gmail.com', 'gabss34');
    
insert into likes_por_projeto(id_projeto, id_usuario) values
	(1,1),
    (1,3),
    (2,1),
    (2,2),
    (2,3),
    (2,4),
    (3,2);
#    
insert into likes_por_comentario(id_usuario, id_comentario) values
	(7,1),
    (7,2),
    (7,4);

# 1) subquery como coluna de um select
SELECT
    P.titulo,
    (SELECT COUNT(C.id_projeto)
      FROM comentario C
      WHERE C.id_projeto = P.id ) AS Quantidade_Comentarios
FROM projetos P
GROUP BY P.id order by titulo;

# sem subquery (com join)
select count(id_projeto) as 'Quantidade_Comentarios', id_projeto, p.titulo
	from comentario c join projetos p
     on c.id_projeto = p.id group by id_projeto order by titulo;
	
# Mais de uma subquery como coluna de um select
SELECT
    P.titulo,
    (SELECT COUNT(C.id_projeto)
    FROM comentario C
    WHERE C.id_projeto = P.id ) AS Quantidade_Comentarios,
	(SELECT COUNT(LP.id_projeto)
	FROM likes_por_projeto LP
	WHERE LP.id_projeto = P.id ) AS Quantidade_Likes
FROM
    projetos P GROUP BY P.id order by Quantidade_Likes desc;

# 2) subquery como filtro. 
#A ideia é buscar os projetos que receberam comentários
SELECT P.id,
    P.titulo,
    P.datap
FROM projetos P
WHERE P.id IN
    (SELECT C.id_projeto
        FROM comentario C
        WHERE P.id = C.id_projeto
    );

#
SELECT
    P.id,
    P.titulo,
    P.datap
FROM
    projetos P
WHERE
    EXISTS
    (
        SELECT
            C.id_projeto
        FROM
            comentario C
        WHERE
            P.id = C.id_projeto
    );

# O projeto com data mais recente ou último projeto.
SELECT
    P.titulo,
    P.datap
FROM
    projetos P
WHERE
    P.id = (SELECT
      MAX(LP.id_projeto)
    FROM
      likes_por_projeto LP);
	
# subquery como fonte de dados de uma consulta principal. Subquery tabela temporária
SELECT
    F.titulo,
    F.Quantidade_Comentarios
FROM
    (SELECT
        P.id,
        P.titulo,
        (SELECT
            COUNT(C.id_projeto)
        FROM
            comentario C
        WHERE
            C.id_projeto = P.id ) AS Quantidade_Comentarios
FROM
    projetos P
) as F
WHERE
    F.Quantidade_Comentarios > 2;

# SQL CASE
select * from comentario;
SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END evaluation
FROM
    employees;

# https://www.sqltutorial.org/sql-case/ 
select count(*) as 'quantidade_comentarios',
CASE
		WHEN 'quantidade_comentarios' >= 3  THEN 'muitos'
        WHEN 'quantidade_comentarios' <= 2  THEN 'poucos'
end as avaliacao_comentarios
, p.titulo
	from comentario c join projetos p
     on c.id_projeto = p.id group by id_projeto order by titulo;
	
    
select count(id_projeto) as 'id_projeto',
CASE
		WHEN 'id_projeto' > 2  THEN 'Muitos'
        WHEN 'id_projeto' <= 2 THEN 'Poucos'
END avaliacao_dos_comentarios
	from likes_por_projeto group by id_projeto;