create database db_formula1;

use db_formula1;

create table tb_equipes(
sigla varchar(10) primary key not null,
nome_equipe varchar(100) not null,
cod_pais int not null
);

create table tb_paises(
codigo int primary key not null,
nome_pais varchar(100) not null
);

create table tb_pilotos(
numero int primary key not null,
nome_piloto varchar(100) not null, 
cod_pais int not null,
sigla_equipe varchar(100) not null 
);

create table tb_corridas(
sigla_gp varchar(10) primary key not null,
nome_gp varchar(100) not null,
cod_pais int not null,
qtd_voltas int not null
);

create table tb_participantes(
sigla_gp varchar (10) not null,
num_piloto int not null,
posicao_largada int not null,
primary key (sigla_gp, num_piloto)
);	

alter table tb_equipes add foreign key (cod_pais) references tb_paises(codigo);

alter table tb_pilotos add foreign key (cod_pais) references tb_paises(codigo);
alter table tb_pilotos add foreign key (sigla_equipe) references tb_equipes (sigla);

alter table tb_corridas add foreign key (cod_pais) references tb_paises(codigo);

alter table tb_participantes add foreign key (sigla_gp) references tb_corridas(sigla_gp);
alter table tb_participantes add foreign key (num_piloto) references tb_pilotos(numero);

insert tb_paises (codigo, nome_pais) values 
(1,'Alemanha'),
(2,'Brasil'),
(3,'Itália'),
(4,'França'),
(5,'Mônaco'),
(6,'Portugal'),
(7,'Japão'),
(8,'Estados Unidos'),
(9,'Inglaterra'),
(10,'Canadá');

select * from tb_paises;

insert tb_equipes (sigla, nome_equipe, cod_pais) values
('FER', 'Ferrari', 1),
('RED', 'Redbull Racing', 2),
('MER', 'Mercedes', 9),
('MCL', 'McLaren', 5),
('TOY', 'Toyota', 7),
('ALP','Alpine', 6),
('WIL','Williams', 10),
('SAU','Sauber', 8),
('AST','Aston Martins', 3),
('RCB','Racing Bulls', 4);

select * from tb_equipes;

insert tb_pilotos values
(12, 'Ayrton Senna', 2, 'MCL'),   
(44, 'Lewis Hamilton', 9,'FER'),  
(16, 'Charles Leclerc', 5, 'MER'),
(33, 'Max Verstappen', 3, 'RED'),  
(5,'Gabriel Bortoleto', 2 ,'SAU'),  
(4, 'Lando Norris', 4,'ALP'),  
(67, 'Geroge Russel', 8, 'AST'), 
(10, 'Kamui Kobayashi', 7, 'TOY'), 
(81, 'Oscar Pistri', 1, 'WIL'), 
(55, 'Pierre Gansly', 6, 'RCB'), 
(14, 'Alberto Ascari', 10, 'FER');
insert tb_pilotos values
(32, 'Arthur Pereira', 2, 'SAU' ),   
(92, 'Jean Louis', 4, 'MCL'),  
(73,'Felipe Paz', 2, 'TOY'),    
(8, 'Giorno Giovana', 3, 'RCB'),  
(39, 'João Almeida', 2, 'WIL'),  
(9, 'Leonardo Francesco', 3, 'MER');

select * from tb_pilotos;

insert tb_corridas values
('ALE', 'Grande Prêmio da Alemanha', 1, 52),
('BRA', 'Grande prêmio do Brasil', 2, 77),
('ITA', 'Grande prêmio da Itália', 3, 64),
('FRA', 'Grande prêmio da França', 4, 70),
('MON', 'Grande prêmio de Mônaco', 5, 73),
('POR', 'Grande prêmio de Portugal', 6, 58),
('JAP', 'Grande prêmio do Japão', 7, 47),
('USA', 'Grande prêmio dos Estados Unidos', 8, 55),
('ING', 'Grande prêmio da Inglaterra', 9, 67),
('CAN', 'Grande prêmio do Canadá', 10, 50);

select * from tb_corridas;

insert tb_participantes values
('ITA', 33, 1),  
('BRA', 12, 3),   
('ING', 9, 2),
('MON', 16, 5),
('FRA', 4, 4),  
('USA', 67, 7),
('BRA', 5, 6),  
('ITA', 8, 9),   
('FRA', 92, 8),  
('JAP', 10, 11),
('BRA', 39, 10),   
('ALE', 81, 12),
('ITA', 9, 13),   
('BRA', 73, 17),   
('POR', 55, 15),
('CAN', 14, 14),
('BRA', 32, 16);

select * from tb_participantes;

/*3- Liste o nome dos países que começam com a letra B e terminam com a letra L.*/

select nome_pais
from tb_paises
where nome_pais like 'b%' and nome_pais like '%l';

/*4- Liste o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA */

select tb_pilotos.nome_piloto as 'Nome do Piloto', tb_paises.nome_pais as 'Nome do País'
from tb_pilotos join tb_paises
on tb_pilotos.cod_pais = tb_paises.codigo
where tb_pilotos.cod_pais in (2, 3 ,4);

/*Outra forma de fazer a mesma consulta*/

select tb_pilotos.nome_piloto as 'Nome do Piloto' , tb_paises.nome_pais as 'Nome do País'
from tb_pilotos, tb_paises
where tb_pilotos.cod_pais = tb_paises.codigo and tb_pilotos.cod_pais in (2, 3 ,4);


/*5- Liste o nome dos pilotos.*/

select nome_piloto as 'Nome dos Pilotos'
from tb_pilotos;

/*6- Liste o nome dos gp e a quantidade de voltas (use ALIAS)*/

select nome_gp as 'Nome do GP', qtd_voltas as 'Quantidades de Voltas'
from tb_corridas;

/*7- Liste o nome dos pilotos e seus países*/

select tb_pilotos.nome_piloto as 'Nome do Piloto', tb_paises.nome_pais as 'Nome do País'
from tb_pilotos,tb_paises
where tb_pilotos.cod_pais = tb_paises.codigo;

/*8- Insira o atributo salário na tabela piloto.*/

alter table tb_pilotos add salario decimal (10,2);

/*9- Popule o atributo salário da tabela piloto. */

update tb_pilotos set salario = 100000.00 where numero = 12;
update tb_pilotos set salario = 120500.00 where numero = 44;
update tb_pilotos set salario = 72000.00 where numero = 16;
update tb_pilotos set salario = 95000.00 where numero = 33;
update tb_pilotos set salario = 60300.00 where numero = 5;
update tb_pilotos set salario = 122700.00 where numero = 4; 
update tb_pilotos set salario = 89000.00 where numero = 67;
update tb_pilotos set salario = 135000.00 where numero = 10;
update tb_pilotos set salario = 55700.00 where numero = 81;
update tb_pilotos set salario = 90800.00 where numero = 55;
update tb_pilotos set salario = 180000.00 where numero = 14;
update tb_pilotos set salario = 94000.00 where numero = 32;
update tb_pilotos set salario = 65000.00 where numero = 92; 
update tb_pilotos set salario = 150000.00 where numero = 73;
update tb_pilotos set salario = 88500.00 where numero = 8;
update tb_pilotos set salario = 125300.00 where numero = 39;
update tb_pilotos set salario = 91700.00 where numero = 9;

/*10- Liste o nome dos pilotos cujos salários sejam entre 70 e 100 mil.*/

select nome_piloto as 'Nome do Piloto', salario as 'Salário'
from tb_pilotos
where salario between 70000.00 and 100000.00;

/*11- Retorne para cada cod_pais, a média salarial dos empregados.*/

select AVG (tb_pilotos.salario) as 'Média salarial', tb_paises.nome_pais as 'País'
from tb_pilotos, tb_paises
where tb_pilotos.cod_pais = tb_paises.codigo
group by tb_paises.nome_pais;

/*12- Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem crescente de valor.*/

select nome_piloto as 'Nome do Piloto', salario as 'Salário'
from tb_pilotos
order by salario asc;

alter table tb_corridas change nome_piloto nome_gp varchar(100) not null;