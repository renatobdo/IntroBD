select * from candidato;
alter table candidato add sereporta int;
update candidato set sereporta = 6 where cpf = 18;
update candidato set sereporta = 1575 where cargo = 5; 

select * from candidato can inner join cargo car 
	on can.cargo = car.codigo; 
SELECT 
    c.cpf, c.nome AS chefe,
    ca.cpf, ca.nome AS 'Se reporta a...'
FROM
    candidato c
INNER JOIN candidato ca ON 
    c.cpf = ca.sereporta
ORDER BY 
    chefe;

