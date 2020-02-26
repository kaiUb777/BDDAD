-------------------------------------------------------------------------------------------------------------------------------
-- 1) Mostrar o nome de todos os médicos e, no caso dos médicos subordinados, o nome do respetivo médico chefe. O resultado 
--    deve ser apresentado por ordem alfabética do primeiro nome referido anteriormente. O comando deve usar a função NVL que 
--    permite substituir o valor NULL por outro valor.
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
  SELECT M1.nome
         ,NVL((SELECT M2.nome 
                 FROM medicos M2 
                WHERE M2.id_medico=M1.id_medico_chefe),' ') AS chefe
    FROM medicos M1
ORDER BY 1;

--Solução 2
  SELECT M1.nome, NVL(M2.nome,' ') AS chefe
    FROM medicos M1
            LEFT JOIN medicos M2 ON M2.id_medico=M1.id_medico_chefe
ORDER BY 1;
-------------------------------------------------------------------------------------------------------------------------------
-- 2) Mostrar o id e a designação das especialidades, juntamente com as respetivas datas em que tiveram o maior número de 
--    consultas. O resultado deve ser apresentado por ordem alfabética da designação da especialidade e por ordem ascendente 
--    da data. O comando deve usar a cláusula WITH que permite a reutilização de código.
-------------------------------------------------------------------------------------------------------------------------------
    WITH consultas_especialidades AS 
            ( SELECT E.id_especialidade
                     ,E.designacao 
                     ,TO_CHAR(C.data_hora,'yyyy-mm-dd') AS data
                     ,COUNT(*) AS nr_consultas  
                FROM consultas C 
                     INNER JOIN medicos M ON C.id_medico = M.id_medico 
                     INNER JOIN especialidades E ON E.id_especialidade = M.id_especialidade
            GROUP BY E.id_especialidade, E.designacao, TO_CHAR(C.data_hora,'yyyy-mm-dd') )
  SELECT CE1.id_especialidade, 
         CE1.designacao, 
         CE1.data
    FROM consultas_especialidades CE1
   WHERE nr_consultas = ( SELECT MAX(CE2.nr_consultas)
                            FROM consultas_especialidades CE2 
                           WHERE CE2.id_especialidade = CE1.id_especialidade )
ORDER BY 2, 3; 

-------------------------------------------------------------------------------------------------------------------------------
-- 3) Mostrar o nome dos pacientes que foram consultados por todos os médicos do Hospital Pedro Hispano.
-------------------------------------------------------------------------------------------------------------------------------
SELECT P.nome
  FROM pacientes P
 WHERE NOT EXISTS (SELECT id_medico 
                     FROM medicos 
                    WHERE UPPER(hospital) LIKE 'PEDRO HISPANO'
                    MINUS
                   SELECT id_medico 
                     FROM consultas 
                    WHERE id_paciente = P.id_paciente); 
 
-------------------------------------------------------------------------------------------------------------------------------
-- 4) Mostrar o nome, a data de nascimento e a idade dos médicos cuja idade é uma das três mais novas. O resultado deve ser 
--    apresentado por ordem ascendente da idade do médico. O comando deve usar a cláusula FETCH que permite especificar o número 
--    de linhas retornadas por uma query. 
-------------------------------------------------------------------------------------------------------------------------------
SELECT M1.nome
       ,TO_CHAR(M1.data_nascimento,'DD/MON/YYYY') AS data_nascimento
       ,TRUNC(MONTHS_BETWEEN(SYSDATE, M1.data_nascimento)/12) AS idade       
  FROM medicos M1
 WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, M1.data_nascimento)/12) 
        IN (  SELECT DISTINCT TRUNC(MONTHS_BETWEEN(SYSDATE, M2.data_nascimento)/12) 
                FROM medicos M2
            ORDER BY 1  
               FETCH FIRST 3 ROWS ONLY)
ORDER BY idade;

------------------------------------------------------------------------------------------------------------------------------
-- 5) Mostrar o nome dos médicos e o respetivo intervalo de tempo, em dias, decorridos desde a última consulta. No caso 
--    de o médico não ter realizado qualquer consulta, deve ser apresentada a informação "sem consultas", numa coluna 
--    intitulada “OBS.”. O resultado deve ser apresentado por ordem alfabética do nome do médico. O comando deve usar a 
--    função NVL2 que permite aplicar uma lógica semelhante à da estrutura de decisão “IF-THEN-ELSE”. Tal como a função NVL, 
--    a função NVL2 verifica se o valor da expressão é igual a NULL. 
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
  SELECT  M.nome
          ,NVL(TO_CHAR((SELECT MAX(C.data_hora) 
                          FROM consultas C 
                         WHERE C.id_medico = M.id_medico),'DD-MM-YYYY'),' ') AS data_ultima_consulta
          ,NVL(TO_CHAR(TRUNC(SYSDATE - (SELECT MAX(C.data_hora) 
                                          FROM consultas C
                                         WHERE C.id_medico = M.id_medico))),' ') AS nr_dias_sem_consulta
          ,NVL2((SELECT MAX(C.data_hora) 
                   FROM consultas C 
                  WHERE C.id_medico = M.id_medico),' ','sem consultas') AS "OBS."
    FROM medicos M 
ORDER BY 1; 

--Solução 2
  SELECT  M.nome
          ,NVL(TO_CHAR(MAX(C.data_hora),'DD-MM-YYYY'),' ') AS data_ultima_consulta
          ,NVL(TO_CHAR(TRUNC(SYSDATE - MAX(C.data_hora))),' ') AS nr_dias_sem_consulta
          ,NVL2(MAX(C.data_hora),' ','sem consultas') AS "OBS."
    FROM medicos M
            LEFT JOIN consultas C ON C.id_medico = M.id_medico
GROUP BY M.nome 
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- 6) Mostrar a data, a hora e a designação das especialidades com consultas realizadas depois das 12H30, há mais de 2 anos. 
--    A coluna “OBS.” deve indicar as consultas efetuadas ao fim de semana. O resultado deve ser apresentado por 
--    ordem descendente da data e por ordem ascendente da hora. O comando deve usar a expressão CASE que permite aplicar uma 
--    lógica semelhante à da estrutura de decisão “SWITCH” do JAVA.
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
  SELECT   TO_CHAR(C.data_hora,'FMDay, DD Month "de" YYYY') AS data
           ,TO_CHAR(C.data_hora,'HH24:MI') AS hora
           ,E.designacao AS especialidade
           ,CASE TO_CHAR(C.data_hora,'FMDAY') 
                WHEN 'SÁBADO' THEN 'Fim de semana'
                WHEN 'DOMINGO' THEN 'Fim de semana' 
                ELSE ' '
            END AS "OBS."
    FROM   especialidades E 
           INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade 
           INNER JOIN consultas C ON C.id_medico = M.id_medico      
   WHERE   C.data_hora < (SYSDATE - INTERVAL '2' YEAR) 
           AND TO_DATE(TO_CHAR(C.data_hora,'HH24:MI'),'HH24:MI') >= TO_DATE('12:30','HH24:MI')  
ORDER BY   TO_DATE(TO_CHAR(C.data_hora,'DD_MM_YYYY'),'DD-MM-YYYY') DESC, 
           hora ASC; 

--Solução 2    
  SELECT   TO_CHAR(C.data_hora,'FMDay, DD Month "de" YYYY') AS data
           ,TO_CHAR(C.data_hora,'HH24:MI') AS hora
           ,E.designacao AS especialidade
           ,CASE TO_CHAR(C.data_hora,'d') 
                WHEN '7' THEN 'Fim de semana'   
                WHEN '1' THEN 'Fim de semana'   
                ELSE ' '
            END AS "OBS."
    FROM   especialidades E 
           INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade 
           INNER JOIN consultas C ON C.id_medico = M.id_medico      
   WHERE   C.data_hora < (SYSDATE - INTERVAL '2' YEAR) 
           AND TO_DATE(TO_CHAR(C.data_hora,'HH24:MI'),'HH24:MI') >= TO_DATE('12:30','HH24:MI')  
ORDER BY   TO_DATE(TO_CHAR(C.data_hora,'DD_MM_YYYY'),'DD-MM-YYYY') DESC, 
           hora ASC;            
       
-- EXERCÍCIOS COMPLEMENTARES
-------------------------------------------------------------------------------------------------------------------------------
-- C1) Mostrar o nome dos médicos com consultas antes de 04/05/2011. O resultado deve ser apresentado por ordem 
--     alfabética do nome dos médicos.  
-------------------------------------------------------------------------------------------------------------------------------   
SELECT DISTINCT M.nome
  FROM medicos M 
       INNER JOIN consultas C ON M.id_medico = C.id_medico
 WHERE C.data_hora < TO_DATE('04-05-2011', 'DD-MM-YYYY')
 ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C2) Mostrar o nome, a designação da especialidade e a localidade dos médicos do Hospital de São João. O resultado deve 
--     ser apresentado por ordem alfabética do nome dos médicos.
-------------------------------------------------------------------------------------------------------------------------------
SELECT M.nome, E.designacao, CP.localidade 
  FROM medicos M 
       INNER JOIN especialidades E ON M.id_especialidade = E.id_especialidade
       INNER JOIN codigos_postais CP ON M.cod_postal = CP.cod_postal
 WHERE UPPER(M.hospital) LIKE 'SÃO JOÃO'
 ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C3) Mostrar o nome dos médicos que têm mais de 50 anos e que deram consultas a partir das 12H00 a pacientes que têm 
--     menos de 20 anos (Figura 10). O resultado deve ser apresentado por ordem alfabética do nome dos médicos.
-------------------------------------------------------------------------------------------------------------------------------
  SELECT DISTINCT M.nome 
    FROM consultas C
         INNER JOIN medicos M ON C.id_medico = M.id_medico
         INNER JOIN pacientes P ON C.id_paciente = P.id_paciente
   WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,M.data_nascimento)/12) > 50 
         AND EXTRACT(HOUR FROM CAST(C.data_hora AS TIMESTAMP)) >= 12 
         AND TRUNC(MONTHS_BETWEEN(SYSDATE,P.data_nascimento)/12) < 20
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C4) Mostrar o nome dos médicos cujo número total de medicamentos receitados é superior a 5 (Figura 11). O resultado 
--     deve ser apresentado por ordem alfabética do nome dos médicos. 
------------------------------------------------------------------------------------------------------------------------------- 
  SELECT M.nome 
    FROM consultas C
         INNER JOIN medicos M ON C.id_medico=M.id_medico
         INNER JOIN medicamentos_receitados MR ON C.id_consulta=MR.id_consulta 
GROUP BY M.id_medico, M.nome
  HAVING COUNT(*)>5
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C5) Mostrar o nome dos medicamentos mais receitados, ordenados por ordem alfabética. 
------------------------------------------------------------------------------------------------------------------------------- 
  SELECT M.nome
    FROM medicamentos M
         INNER JOIN medicamentos_receitados MCR1 ON M.id_medicamento = MCR1.id_medicamento
GROUP BY M.id_medicamento, M.nome
  HAVING COUNT(*) = (  SELECT MAX(COUNT(*))
                         FROM medicamentos_receitados MCR2
                     GROUP BY MCR2.id_medicamento )
ORDER BY 1; 

-------------------------------------------------------------------------------------------------------------------------------
-- C6) Mostrar o nome e o hospital dos médicos de Pediatria que consultaram pacientes cuja localidade é Matosinhos. O 
--     resultado deve ser apresentado por ordem alfabética do nome dos médicos.
--------------------------------------------------------------------------------------------------------------------------------
  SELECT M.nome, M.hospital
    FROM medicos M 
         INNER JOIN especialidades E ON M.id_especialidade = E.id_especialidade
   WHERE UPPER(E.designacao) LIKE 'PEDIATRIA' 
         AND M.id_medico IN (SELECT DISTINCT C.id_medico
                               FROM pacientes P
                                    INNER JOIN consultas C ON P.id_paciente = C.id_paciente
                                    INNER JOIN codigos_postais CP ON CP.cod_postal = P.cod_postal
                              WHERE UPPER(CP.localidade) LIKE 'MATOSINHOS')
ORDER BY 1;                       
                        
-------------------------------------------------------------------------------------------------------------------------------
-- C7) Mostrar a designação das especialidades cujos médicos nunca deram consultas ao paciente Alfredo Gama. O resultado 
--     deve apresentado por ordem alfabética da designação da especialidade.  
-------------------------------------------------------------------------------------------------------------------------------                                                      
SELECT E.designacao
  FROM especialidades E
 WHERE E.id_especialidade NOT IN ( SELECT E.id_especialidade
                                     FROM consultas C
                                          INNER JOIN medicos M ON C.id_medico = M.id_medico
                                          INNER JOIN pacientes P ON C.id_paciente = P.id_paciente
                                    WHERE UPPER(P.nome) LIKE 'ALFREDO GAMA'
                                          AND M.id_especialidade = E.id_especialidade )
ORDER BY 1;                

-------------------------------------------------------------------------------------------------------------------------------
-- C8) Mostrar o nome dos médicos que receitaram mais de 3 medicamentos em cada uma das suas consultas. O resultado deve 
--     ser apresentado por ordem alfabética do nome dos médicos. 
------------------------------------------------------------------------------------------------------------------------------- 
SELECT DISTINCT nome
  FROM medicos M 
       INNER JOIN consultas C1 ON M.id_medico = C1.id_medico 
 WHERE 3 <= ALL( SELECT ( SELECT COUNT(*) 
                            FROM medicamentos_receitados MCR
                           WHERE MCR.id_consulta = C2.id_consulta )                           
                   FROM consultas C2                        
                  WHERE C2.id_medico = M.id_medico )
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C9) Mostrar o nome e a idade dos pacientes que têm mais de 10 anos de idade e que nunca foram consultados em Oftalmologia. 
--     O resultado deve ser apresentado por ordem alfabética do nome dos pacientes. 
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
SELECT P1.nome, TRUNC(MONTHS_BETWEEN(SYSDATE,P1.data_nascimento)/12) AS idade
  FROM pacientes P1
 WHERE P1.id_paciente IN ( SELECT P2.id_paciente  
                             FROM pacientes P2
                            WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,P2.data_nascimento)/12) > 10
                            MINUS
                           SELECT C.id_paciente 
                             FROM especialidades E 
                                  INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade
                                  INNER JOIN consultas C ON C.id_medico = M.id_medico
                            WHERE UPPER(E.designacao) LIKE 'OFTALMOLOGIA')
ORDER BY nome;

--Solução 2
  SELECT P.nome, TRUNC(MONTHS_BETWEEN(SYSDATE,P.data_nascimento)/12) AS idade
    FROM pacientes P
   WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,P.data_nascimento)/12) > 10 
         AND P.id_paciente NOT IN ( SELECT C.id_paciente 
                                      FROM especialidades E 
                                           INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade
                                           INNER JOIN consultas C ON C.id_medico = M.id_medico
                                     WHERE UPPER(E.designacao) LIKE 'OFTALMOLOGIA')
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C10)	Mostrar o nome e o hospital dos médicos de Cardiologia que não realizaram consultas entre Fevereiro e Maio de 2016. O 
--      resultado deve ser apresentado por ordem alfabética do nome dos médicos.
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
SELECT M.nome, M.hospital
  FROM especialidades E
       INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade
 WHERE UPPER(E.designacao) LIKE 'CARDIOLOGIA' 
       AND M.id_medico NOT IN( SELECT DISTINCT C.id_medico 
                                 FROM consultas C
                                WHERE TO_DATE(TO_CHAR(C.data_hora,'MM-YYYY'),'MM-YYYY') 
                                      BETWEEN TO_DATE('02-2016','MM-YYYY') 
                                      AND TO_DATE('05-2016','MM-YYYY'))
ORDER BY 1;

--Solução 2
SELECT M.nome, M.hospital
FROM medicos M
WHERE M.id_medico IN ( SELECT M.id_medico
                         FROM especialidades E
                              INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade
                        WHERE UPPER(E.designacao) LIKE 'CARDIOLOGIA' 
                        MINUS
                       SELECT DISTINCT C.id_medico 
                         FROM consultas C
                        WHERE TO_DATE(TO_CHAR(C.data_hora,'MM-YYYY'),'MM-YYYY') 
                              BETWEEN TO_DATE('02-2016','MM-YYYY') 
                              AND TO_DATE('05-2016','MM-YYYY'))
ORDER BY 1;

-------------------------------------------------------------------------------------------------------------------------------
-- C11) Mostrar os pacientes que só foram consultados a Pediatria. O resultado deve ser apresentado por ordem alfabética do 
--      nome dos pacientes.
-------------------------------------------------------------------------------------------------------------------------------
--Solução 1
SELECT DISTINCT P.nome
  FROM consultas C
       INNER JOIN pacientes P ON C.id_paciente = P.id_paciente
 WHERE NOT EXISTS ( SELECT C1.id_medico
                      FROM consultas C1
                     WHERE C1.id_paciente = C.id_paciente
                     MINUS
                    SELECT M.id_medico
                      FROM medicos M
                           INNER JOIN especialidades E ON M.id_especialidade = E.id_especialidade
                     WHERE LOWER(E.designacao) LIKE 'pediatria'
                  )
ORDER BY 1;

--Solução 2
SELECT DISTINCT P.id_paciente, P.nome
  FROM especialidades E1
       INNER JOIN medicos M1 ON M1.id_especialidade=E1.id_especialidade
       INNER JOIN consultas C1 ON C1.id_medico=M1.id_medico
       INNER JOIN pacientes P ON P.id_paciente=C1.id_paciente
 WHERE LOWER(E1.designacao) LIKE 'pediatria'
       AND P.id_paciente NOT IN (  SELECT DISTINCT C2.id_paciente
                                     FROM especialidades E2
                                          INNER JOIN medicos M2 ON M2.id_especialidade=E2.id_especialidade
                                          INNER JOIN consultas C2 ON C2.id_medico=M2.id_medico   
                                    WHERE LOWER(E2.designacao) NOT LIKE 'pediatria');   
                                         
-------------------------------------------------------------------------------------------------------------------------------
-- C12) Mostrar o nome dos pacientes e o hospital em que os pacientes foram consultados por todos os médicos desse hospital.
--      O resultado deve ser apresentado por ordem alfabética do nome dos pacientes. 
-------------------------------------------------------------------------------------------------------------------------------
-- Solução 1
WITH consultas_pacientes AS
    ( SELECT DISTINCT P.id_paciente, P.nome, M.hospital, M.id_medico
        FROM pacientes P
             INNER JOIN consultas C ON P.id_paciente = C.id_paciente
             INNER JOIN medicos M ON M.id_medico = C.id_medico )
SELECT DISTINCT CP1.nome, CP1.hospital
  FROM consultas_pacientes CP1
 WHERE NOT EXISTS (SELECT M1.id_medico 
                     FROM medicos M1 
                    WHERE UPPER(M1.hospital) LIKE UPPER(CP1.hospital)
                    MINUS
                   SELECT DISTINCT CP2.id_medico 
                     FROM consultas_pacientes CP2
                    WHERE UPPER(CP2.hospital) LIKE UPPER(CP2.hospital)                             
                          AND CP1.id_paciente=CP2.id_paciente)
ORDER BY 1; 

-- Solução 2
SELECT DISTINCT P1.nome, M.hospital
  FROM pacientes P1
       INNER JOIN consultas C ON P1.id_paciente = C.id_paciente
       INNER JOIN medicos M ON M.id_medico = C.id_medico
 WHERE NOT EXISTS (SELECT M1.id_medico 
                     FROM medicos M1 
                    WHERE UPPER(M1.hospital) LIKE UPPER(M.hospital)
                    MINUS
                   SELECT DISTINCT M2.id_medico 
                     FROM consultas C 
                          INNER JOIN medicos M2 ON C.id_medico=M2.id_medico
                          INNER JOIN pacientes P2 ON C.id_paciente=P1.id_paciente
                    WHERE UPPER(M2.hospital) LIKE UPPER(M.hospital)                             
                          AND P1.id_paciente=p2.id_paciente)
ORDER BY 1; 

-------------------------------------------------------------------------------------------------------------------------------
-- C13)	Mostrar o nome dos médicos, que receitaram sempre o mesmo número de medicamentos em todas as suas consultas, 
--      juntamente com esse número. O resultado deve ser apresentado por ordem alfabética do nome dos médicos. 
------------------------------------------------------------------------------------------------------------------------------- 
    WITH medicamentos_receitados_consulta AS 
        (   SELECT id_consulta
                   ,COUNT(id_medicamento) AS nr_medicamentos_receitados
                   ,( SELECT id_medico
                        FROM consultas C
                       WHERE C.id_consulta = MR.id_consulta ) AS id_medico
              FROM medicamentos_receitados MR
          GROUP BY id_consulta )
  SELECT M.nome, MAX(MRC.nr_medicamentos_receitados) AS nr_medicamentos_receitados
    FROM medicos M
         INNER JOIN medicamentos_receitados_consulta MRC ON M.id_medico = MRC.id_medico
GROUP BY M.nome
  HAVING MAX(MRC.nr_medicamentos_receitados) = MIN(MRC.nr_medicamentos_receitados) AND COUNT(*)>1
ORDER BY 1;
