--A

--1

select * 
from equipas;

--2

select * 
from equipas
where id_equipa = 12;

--3

select id_equipa, nome
from equipas;

--4

select id_treinador, nome, idade 
from treinadores 
where idade < 40;

--5

select * 
from experiencias
where lower (escalao) like 'juniores' and anos > 10; 

--6

select * 
from treinadores 
where idade BETWEEN 45 and 53;

--7

select *
from bolas 
where fabricante like 'Reebok' or fabricante like 'Olimpic';

--8

select *
from treinadores
where upper (nome) like 'A%';

--B

--1

select count (*)
from equipas;

--2

select DISTINCT (fabricante)
from bolas;

--3

select count (*)
from treinadores
where idade > 40;

--4

select max (idade) "Idade max"
from treinadores;

--C

--1

select fabricante 
from bolas B inner join equipas E on B.id_equipa = E.id_equipa;

--2

select DISTINCT fabricante 
from bolas b inner join equipas e on b.id_equipa = e.id_equipa;

--3

select round (sum (idade)/COUNT(*),2) "Media idades"
from treinadores t inner join experiencias e on t.id_treinador = e.id_treinador;

--4

select *
from treinadores t inner join experiencias e on t.id_treinador = e.id_treinador
where e.escalao like 'juniores' and e.anos >= 5;

--5

select *
from treinadores t inner join experiencias e on t.id_treinador = e.id_treinador inner join equipas eq on e.id_equipa = eq.id_equipa;

--6

select t.nome, t.telefone, eq.nome
from treinadores t inner join experiencias e on t.id_treinador = e.id_treinador inner join equipas eq on e.id_equipa = eq.id_equipa;

--7

select *
from equipas eq inner join experiencias e on eq.id_equipa = e.id_equipa inner join treinadores t on e.id_treinador = t.id_treinador
where eq.nome like 'Académico';

--8

select max (t.idade) "Treinador mais velho Académico"
from treinadores t inner join experiencias e on t.id_treinador = e.id_treinador inner join equipas eq on e.id_equipa = eq.id_equipa
where eq.nome like 'Académico';

--9

select sum (exp.anos)
from treinadores t inner join experiencias exp on t.id_treinador = exp.id_treinador inner join equipas eq on exp.id_equipa = eq.id_equipa
where t.nome like 'António' and eq.nome like 'Académico';