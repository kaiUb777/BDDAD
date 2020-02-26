-- PL7

-- ex1

SELECT m1.nome, (SELECT m2.nome)
                    FROM MEDICOS m2
                 WHERE m1.id_medico = m2.id_medico_chefe)
FROM medicos m1
GROUP BY m1.nome;


-- ex2

WITH consultas_especialidades AS
        (SELECT E.id_especialidade
                ,E.designacao
                ,TO_CHAR(C.data_hora, 'yyyy-mm-dd')
                ,COUNT(*) AS nr_consultas
            FROM consultas C
                INNER JOIN medicos M ON C.id_medico = M.id_medico
                INNER JOIN especialidades E ON E.id_especialidade = M.id_especialidade
GROUP BY E.id_especialidade, E.designacao, TO_CHAR(C.data_hora, 'yyyy-mm-dd'))

SELECT  CE1.id_especialidade,
        CE1.designacao,
        CE1.data
    FROM consultas_especialidades CE1
WHERE nr_consultas = (SELECT MAX(CE2.nr_consultas)
                        FROM consultas_especialidades CE2
                        WHERE CE2.id_especialidade = CE1.id_especialidade)
GROUP BY 2,3;

-- 3

SELECT P1.nome
    FROM pacientes P1
WHERE NOT EXISTS (SELECT M1.id_medico
                    FROM medicos M1 
                    WHERE UPPER(M1.hospital) LIKE 'PEDRO HISPANO'
                    MINUS
                    SELECT M2.id_medico
                        FROM consultas C
                            INNER JOIN medicos M2 ON C.id_medico = M2.id_medico
                        WHERE P1.id_paciente = C.id_paciente);
                        
-- 4

SELECT M1.nome
        ,TO_CHAR(M1.data_nascimento, 'DD/MON/YYYY') AS data_nascimento
        ,TRUNC(MONTHS_BETWEEN(SYSDATE, M1.data_nascimento)/12) AS idade
    FROM medicos M1
    WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, M1.data_nascimento)/12)
        IN (SELECT DISTINCT TRUNC(MONTHS_BETWEEN(SYSDATE,M2.data_nascimento)/12)
            FROM medicos M2
            ORDER BY 1
                FETCH FIRST 3 ROWS ONLY)
ORDER BY idade;

-- 5

SELECT M.nome
        ,NVL(TO_CHAR((SELECT MAX (C.data_hora)
                        FROM consultas C
                            WHERE C.id_medico = M.id_medico), 'dd-mm-yyyy'), ' ') AS data_ultima_consulta
        ,NVL(TO_CHAR(TRUNC(SYSDATE - (SELECT MAX(C.data_hora)
                                        FROM consultas C
                                      WHERE C.id_medico = M.id_medico))), ' ') AS nr_dias_sem_consulta
        ,NVL2((SELECT MAX(C.data_hora)
                FROM consultas C
                WHERE C.id_medico = M.id_medico), ' ', ' sem consultas') AS "OBS."
    FROM medicos M
ORDER BY 1;

-- 6

SELECT TO_CHAR (C.data_hora, 'FMDay, DD Month "de" YYYY') As data
        ,TO_CHAR(C.data_hora, 'HH24:MI') As hora
        ,E.designacao As especialidade
        ,CASE TO_CHAR(C.data_hora, 'FMDAY')
            WHEN 'SABADO' THEN 'FIM DE SEMANA'
            WHEN 'DOMINGO' THEN 'FIM DE SEMANA'
            ELSE ' '
        END AS "OBS."
    FROM especialidades E
        INNER JOIN medicos M ON E.id_especialidade = M.id_especialidade
        INNER JOIN consultas C ON C.id_medico = M.id_medico
    WHERE C.data_hora < (SYSDATE - INTERVAL '2' YEAR)
            AND TO_DATE(TO_CHAR(C.data_hora, 'HH24:MI'), 'HH24:MI') >= TO_DATE('12:30','HH24:MI')
ORDER BY    TO_DATE(TO_CHAR(C.data_hora, 'DD_MM_YYYY'), 'DD-MM-YYYY') DESC,
            hora ASC;