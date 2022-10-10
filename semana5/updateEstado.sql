#https://brasilescola.uol.com.br/brasil/estados-brasil.htm
select * from estado;
select count(*) from estado where sigla_Estado <> 'DF';
update estado set capital = 'Rio Branco' 
	where sigla_Estado = 'AC';

update estado set capital = 'Maceió' 
	where sigla_Estado = 'AL';

update estado set capital = 'Macapa' 
	where sigla_Estado = 'AP';

update estado set capital = 'Manaus' 
	where sigla_Estado = 'AM';

update estado set capital = 'Salvador' 
	where sigla_Estado = 'BA';

update estado set capital = 'Fortaleza' 
	where sigla_Estado = 'CE';

update estado set capital = 'Brasília' 
	where sigla_Estado = 'DF';

update estado set capital = 'Vitória' 
	where sigla_Estado = 'ES';

update estado set capital = 'Goiânia' 
	where sigla_Estado = 'GO';

update estado set capital = 'São Luís' 
	where sigla_Estado = 'MA';

update estado set capital = 'Cuiabá' 
	where sigla_Estado = 'MT';

update estado set capital = 'Campo Grande' 
	where sigla_Estado = 'MS';

update estado set capital = 'Belo Horizonte' 
	where sigla_Estado = 'MG';

update estado set capital = 'Belém' 
	where sigla_Estado = 'PA';

update estado set capital = 'João Pessoa' 
	where sigla_Estado = 'PB';

update estado set capital = 'Curitiba' 
	where sigla_Estado = 'PR';

update estado set capital = 'Recife' 
	where sigla_Estado = 'PE';

update estado set capital = 'Teresina' 
	where sigla_Estado = 'PI';

update estado set capital = 'Rio de Janeiro' 
	where sigla_Estado = 'RJ';

update estado set capital = 'Natal' 
	where sigla_Estado = 'RN';

update estado set capital = 'Porto Alegre' 
	where sigla_Estado = 'RS';

update estado set capital = 'Porto Velho' 
	where sigla_Estado = 'RO';

update estado set capital = 'Boa Vista' 
	where sigla_Estado = 'RR';

update estado set capital = 'Florianópolis' 
	where sigla_Estado = 'SC';

update estado set capital = 'São Paulo' 
	where sigla_Estado = 'SP';

update estado set capital = 'Aracaju' 
	where sigla_Estado = 'SE';

update estado set capital = 'Palmas' 
	where sigla_Estado = 'TO';