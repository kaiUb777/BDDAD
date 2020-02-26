--1--
SELECT * FROM cd;

--2--
SELECT TITULO, DATA_COMPRA FROM cd;

--3--
SELECT DATA_COMPRA FROM cd;

--4--
SELECT DISTINCT DATA_COMPRA FROM cd;

--5--
SELECT COD_CD, INTERPRETE FROM musicas;

--6--
SELECT DISTINCT COD_CD, INTERPRETE FROM musicas;

--7--
SELECT DATA_COMPRA as "Data Compra" from cd;

--8--
SELECT TITULO, VALOR_PAGO, round((VALOR_PAGO*0.23)/1.23,2) as "Valor do IVA" FROM cd; 

--9--
SELECT * FROM musicas WHERE cod_cd = 2;

--10--
SELECT * from musicas where cod_cd != 2;

--11--
SELECT * FROM musicas where cod_cd = 2 AND duracao > 5;

--12--
SELECT * from musicas where cod_cd = 2 and duracao BETWEEN 4 and 6;

--13--
SELECT * from musicas where cod_cd = 2 and duracao < 4 OR duracao > 6;

--14--
Select * from musicas where cod_cd in (1,3,5,6);

--15--
SELECT * from musicas where cod_cd not in (1,3,5,6);

--16--
SELECT titulo from cd where upper(local_compra) LIKE 'FNAC';

--17--
Select titulo from cd where upper(local_compra) not like 'FNAC' or local_compra is null;

--18--
Select * from musicas where upper(interprete) like 'ORQUESTRA%';

--19--
Select * from musicas where upper(interprete) like '%Y%';

--20--
select * from musicas where UPPER(titulo) LIKE '%DAL_';

--21--
select * from musicas where titulo like '%@%%' escape '@';

--22--
--select * from musicas where UPPER(titulo) like 'B%' or upper(titulo) like 'D%' or upper(titulo) like 'H%';

select * from musicas where REGEXP_LIKE(titulo, '^[bdh]', 'i');

--23--
select * from cd where local_compra is null;

--24--
select * from cd where local_compra is not null;

--B

--1
select titulo, data_compra
from cd
order by titulo;

--2
select titulo,data_compra
from cd
order by data_compra desc;

--3
select titulo,data_compra
from cd
order by data_compra asc;

--4
select titulo,data_compra
from cd
order by local_compra asc;

--5
SELECT TITULO, VALOR_PAGO, round((VALOR_PAGO*0.23)/1.23,2) as IVA_PAGO 
FROM cd order by IVA_PAGO desc;

--6
select titulo, data_compra
from cd
order by data_compra desc, titulo;

--C

--1
select COUNT(*) 
from musicas;

--2
select count(distinct local_compra) as qtd_locais_compra
from cd;

--3
select sum(valor_pago)
from cd;

--4
select MAX(valor_pago) 
from cd;

--5
select min(valor_pago)
from cd;

--6
select sum(duracao)/ COUNT (*)
from musicas;

--D

select *
from cd, musicas; -- produto cartesiano

--1
select C.titulo as "Titulo CD", M.titulo as "Titulo Musicas"
from cd C, musicas M where C.cod_cd = M.cod_cd;

select * 
from cd C inner join musicas M on c.cod_cd = m.cod_cd;

--2
select C.titulo , M.titulo from cd C inner join musicas M on c.cod_cd = m.cod_cd 
where m.nr_musica = 1;

--3
select M.nr_musica, M.titulo, m.duracao from cd C inner join musicas M on C.cod_cd = M.cod_cd
where upper(c.titulo) like 'PUNKZILLA';
