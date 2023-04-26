select * from employees;
select employees.firstName, 
		employees.lastName,
        offices.city
	from employees inner join
	offices on employees.officeCode = 
			offices.officeCode;
		
# 1) Quantos pedidos foram realizados por ano
# por cada cliente ?
select count(orderNumber) as 'qtd_total_pedidos', 
 customerNumber, 
	YEAR(requiredDate) as ano
	from orders 
    WHERE year(requiredDate) = '2003'
	group by customerNumber order by qtd_total_pedidos 
		desc;
# O nosso banco de dados tem pedidos de quais anos?
select * from orders order by requiredDate;
# 2) Qual cliente fez mais pedidos?
select count(orderNumber) as 'qtd_total_pedidos', 
 customerNumber, 
	YEAR(requiredDate) as ano
	from orders 
    WHERE year(requiredDate) = '2003'
	group by customerNumber order by qtd_total_pedidos 
		desc;
#Imagine que nós temos uma tabela de pedidos com os 
#seguintes atributos ordernumber, orderDate, requiredDate, 
#shippedDate, status, comments, customerNumber.  
#Gostaria de saber se um pedido está atrasado 
#baseado no atributo shippedDate. Se o shippedDate for maior 
#do que 3 dias está atrasado, caso contrário não está atrasado.
SELECT ordernumber, orderDate, requiredDate, 
		shippedDate, status, comments, customerNumber,
    CASE WHEN 
		DATEDIFF(shippedDate, requiredDate) > 3 
			THEN 'Atrasado' 
	ELSE 
		'Não atrasado' 
	END AS atrasado
FROM orders 
	WHERE shippedDate > DATE_ADD(requiredDate, INTERVAL 3 DAY);
select * from orders;
#
INSERT INTO orders (ordernumber, orderDate, requiredDate, 
shippedDate, status, comments, customerNumber)
VALUES 
(10001, '2023-04-23', '2023-04-25', '2023-04-29', 'Shipped', 
'Comentários sobre o pedido 1', 103),
(10002, '2023-04-22', '2023-04-25', '2023-04-24', 'Shipped', 
'Comentários sobre o pedido 2', 103),
(10003, '2023-04-20', '2023-04-25', '2023-04-26', 'Shipped', 
'Comentários sobre o pedido 3', 103);
