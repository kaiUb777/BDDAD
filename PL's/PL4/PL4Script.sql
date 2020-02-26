-- PL4
-- 1
SELECT titulo 
FROM CD
UNION ALL
SELECT titulo
FROM Musicas;

-- 2
SELECT titulo
FROM CD
UNION
SELECT titulo
FROM Musicas;

-- 3
SELECT titulo , length(titulo) as length_titulo
FROM CD
UNION
SELECT titulo, length(titulo)
FROM Musicas
ORDER BY length_titulo [DESC];

--4
SELECT titulo
FROM CD
INTERSECT
SELECT titulo
FROM Musicas;

--5
SELECT duracao
FROM musicas
WHERE UPPER(interprete) like 'PINK FLOYD'
INTERSECT
SELECT duracao
FROM musicas
WHERE UPPER(interprete) NOT LIKE 'PINK FLOYD';

--6
SELECT duracao
FROM musicas
WHERE UPPER(interprete) like 'PINK FLOYD'
INTERSECT
SELECT duracao
FROM musicas
WHERE UPPER(interprete) NOT LIKE 'PINK FLOYD'
ORDER BY duracao DESC;

--7

SELECT id_editora
FROM editoras
MINUS
SELECT id_editora
FROM CD;

--5

--1
SELECT count (*)
FROM CD
GROUP BY local_compra;

--2
SELECT DISTINCT count (*)
FROM CD
GROUP BY local_compra;

--3
SELECT local_compra, count(*) AS QUANTIDADE
FROM CD
GROUP BY local_compra;

--4
SELECT local_compra, count(*) AS QUANTIDADE
FROM CD
GROUP BY local_compra
ORDER BY QUANTIDADE ASC;

--5
SELECT local_compra, count(*) AS QUANTIDADE
FROM CD
WHERE local_compra not like 'null'
GROUP BY local_compra
ORDER BY QUANTIDADE ASC;

--6
SELECT local_compra, count(*) AS QUANTIDADE, sum(valor_pago), max(valor_pago)
FROM CD
WHERE local_compra not like 'null'
GROUP BY local_compra
ORDER BY QUANTIDADE ASC;

--7
SELECT cod_cd, interprete, count(*) AS Quantidade
FROM musicas
GROUP BY cod_cd, interprete
ORDER BY cod_cd;

--8
SELECT count(*) AS Quantidade
FROM cd
GROUP BY local_compra
HAVING count(*) > 2;

--9
SELECT local_compra, sum(valor_pago) AS Total
FROM CD
GROUP BY local_compra
HAVING AVG(valor_pago) < 10;

--10
SELECT local_compra, SUM(valor_pago) AS Total
From CD
GROUP BY local_compra
HAVING COUNT(*) > 2;

--11
SELECT cod_cd, interprete
From musicas
GROUP BY cod_cd, interprete
HAVING COUNT(*) = 1
ORDER BY cod_cd, interprete;

--12
SELECT interprete
From musicas
WHERE interprete LIKE UPPER('l%') OR interprete LIKE UPPER('E%') OR interprete LIKE LOWER('l%') OR interprete LIKE LOWER('E%')
GROUP BY interprete
ORDER BY interprete;

--13

SELECT cd.titulo, count(*)
FROM cd INNER JOIN musicas ON cd.cod_cd = musicas.cod_cd
GROUP BY cd.titulo;

--14
SELECT cd.cod_cd, cd.titulo, count(*)
FROM cd INNER JOIN musicas ON cd.cod_cd = musicas.cod_cd
GROUP BY cd.cod_cd, cd.titulo;

--15 
SELECT cd.cod_cd, cd.titulo, count(*)
FROM cd INNER JOIN musicas ON cd.cod_cd = musicas.cod_cd
WHERE duracao > 5
GROUP BY cd.cod_cd, cd.titulo;

--16
SELECT cd.cod_cd, cd.titulo, count(*) AS qtd
FROM cd 
INNER JOIN musicas ON cd.cod_cd = musicas.cod_cd
GROUP BY cd.cod_cd, cd.titulo
HAVING COUNT(*) < 6;

--17

SELECT cd.cod_cd, cd.titulo, count(*) AS qtd
FROM cd 
INNER JOIN musicas ON cd.cod_cd = musicas.cod_cd
GROUP BY cd.cod_cd, cd.titulo
HAVING AVG(musicas.duracao) > 4;
