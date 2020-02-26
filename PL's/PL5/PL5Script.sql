--1
SELECT nome
FROM marinheiros
WHERE idade = (SELECT MAX(idade) FROM marinheiros); 

--2
SELECT id_marinheiro, nome
FROM marinheiros
WHERE id_marinheiro NOT IN (SELECT id_marinheiro FROM reservas)
ORDER BY id_marinheiro;

--3
SELECT id, nome,
TRUNC((SELECT AVG(idade) FROM marinheiros)-idade) AS diferencaIdades
FROM marinheiros
ORDER BY ABS(diferencaIdades)DESC;

--4
SELECT COUNT(*)
FROM (SELECT id_marinheiro
      FROM barcos B1 INNER JOIN reservas R1 ON B1.id_barco=R1.id_barco
      WHERE UPPER(B1.cor) LIKE 'VERMELHO'
      INTERSECT
        SELECT R2.id_marinheiro
        FROM barcos B2 INNER JOIN reservas R2 ON B2.id_barco=R2.id_barco
        WHERE UPPER(B2.cor) LIKE 'VERDE');

--5
SELECT data
FROM reservas
GROUP BY data
HAVING count(*) = (SELECT MAX(count(*)) 
                    FROM reservas
                   GROUP BY data);


--B                   
--1
SELECT id_marinheiro, nome, (SELECT COUNT(*)
                                FROM reservas R
                            WHERE R.id_marinheiro = M.id_marinheiro) AS qtd_reservas
    FROM marinheiros M
ORDER BY qtd_reservas DESC;

--2
SELECT r1.id_marinheiro, r1.id_barco, COUNT(*) AS Qtd_Reservas
FROM reservas r1
GROUP BY r1.id_marinheiro, r1.id_barco
HAVING COUNT(*) > (SELECT AVG(COUNT(*))
                        FROM reservas r2
                            WHERE (r2.id_marinheiro = r1.id_marinheiro)
                         GROUP BY r2.id_marinheiro);
                         
--3
SELECT M.nome
FROM marinheiros M
WHERE NOT EXISTS (SELECT B.id_barco
                    FROM barcos B
                    WHERE UPPER(B.nome) LIKE 'INTERLAKE'
                    MINUS
                    SELECT B.id_barco
                    FROM barcos B INNER JOIN reservas R ON B.id_barco = R.id_barco 
                    WHERE UPPER(B.nome) LIKE 'INTERLAKE'
                    AND R.id_Marinheiro = M.id_marinheiro);
                    
--C
--1

SELECT M1.id_marinheiro, M1.nome, M1.idade
FROM marinheiros M1 
WHERE idade >= ALL(SELECT M2.idade
                    FROM marinheiros M2);
                    
--2

SELECT M1.id_marinheiro,M1.nome, M1.idade
FROM marinheiros M1
WHERE M1.idade < ANY (SELECT M2.idade
                            FROM marinheiros M2)
GROUP BY M1.idade DESC;

--3
SELECT M1.id_marinheiro, M1.nome, M1.classificacao
FROM marinheiros M1
WHERE M1.classificacao IN (SELECT DISTINCT M2.classificacao
                            FROM marinheiros M2
                                ORDER BY 1 DESC
                                    FETCH FRIST 3 ROWS ONLY
                                    )
ORDER BY M1.classificacao DESC;