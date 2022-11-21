DELIMITER $$
CREATE PROCEDURE GetCustomers()
BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetCustomers_by_name()
BEGIN
	SELECT 
		customerName
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;
call GetCustomers();
call GetCustomers_by_name();
DELIMITER $$
CREATE PROCEDURE selecionar_cliente(IN quantidade int)
BEGIN
	SELECT * from customers ORDER BY customerName LIMIT quantidade;    
END$$
DELIMITER ;
drop procedure GetCustomers2;


call selecionar_cliente(10);


DELIMITER $$
CREATE PROCEDURE verficar_quantidade_clientes(OUT quantidade int)
BEGIN
	SELECT count(*) into quantidade from customers;    
END$$
DELIMITER ;

call verficar_quantidade_clientes(@quantidade);
select @quantidade as 'quantidade_de_clientes';

CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);

DELIMITER $$

CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE LoadCalendars(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;

    WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;

END$$

DELIMITER ;
CALL LoadCalendars('2022-11-01',30);
select * from calendars;



DELIMITER $$

CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$

DELIMITER ;


DELIMITER $$
CREATE FUNCTION Idade(nascimento date) RETURNS int DETERMINISTIC
BEGIN
	DECLARE hoje DATE;
	SELECT current_date() INTO hoje;
	RETURN year(hoje)-year(nascimento);
END $$
DELIMITER ;

Select Idade(DATE('2000-01-01')) as 'idade';
drop procedure idade_do_cliente;
DELIMITER $$
CREATE PROCEDURE idade_do_cliente(
    IN  pCustomeridade DATE, 
    OUT pconselho  VARCHAR(50))
BEGIN
    DECLARE idade DECIMAL(10,2) DEFAULT 0;

	Select Idade(DATE(pCustomeridade)) 
    INTO idade;

    IF idade < 18 THEN
        SET pconselho = 'Não pode beber';
	else
		set pconselho = 'Pode beber com moderação';
    END IF;
END$$
DELIMITER ;
call  idade_do_cliente('2005-01-01',@pconselho);
select @pconselho as "conselho";
