/*****************************************************************************************************************************/ 
-- PARTE 3 - Transações com Procedimentos PL/SQL

-- EXECUTAR INDIVIDUALMENTE os comandos deste script (i.e. não executar como um script).
/*****************************************************************************************************************************/\

-- desativar opção AUTOCOMMIT
SET AUTOCOMMIT OFF;

-- ativar a SAÍDA para ecrã
SET SERVEROUTPUT ON;

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 3.1  
-- Procedimento PL/SQL participa numa transação e não altera o FIM desta transação. A transação é terminada com ROLLBACK. 
-------------------------------------------------------------------------------------------------------------------------------
-- eliminar registos da tabela t1
DELETE FROM t1;
COMMIT;

-- criar e guardar procedimento compilado na BD 
CREATE OR REPLACE PROCEDURE proc_sem_commit
AS
BEGIN
    UPDATE t1 SET valor = 2;
END;
/

CALL SYS.TRANSACTIONINFO();           -- nenhuma transação em curso.
SELECT * FROM t1;                       -- nenhum registo.
INSERT INTO t1(id, valor) VALUES(1,1);  -- transação INICIADA.
CALL SYS.TRANSACTIONINFO();           -- uma transação em curso.
SELECT * FROM t1;                       -- valor = 1
CALL proc_sem_commit();                 -- procedimento participa na transação e não termina esta transação.
CALL SYS.TRANSACTIONINFO();           -- uma transação em curso.
SELECT * FROM t1;                       -- valor = 2
ROLLBACK;                               -- transação TERMINADA. 
CALL SYS.TRANSACTIONINFO();           -- nenhuma transação em curso.
SELECT * FROM t1;                       -- nenhum registo (tabela inicial).

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 3.2  
-- Procedimento PL/SQL participa numa transação e não altera o FIM desta transação. A transação é terminada com COMMIT. 
-------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM t1;                       -- nenhum registo. 
INSERT INTO t1(id, valor) VALUES(1,1);  -- transação INICIADA.                                
SELECT * FROM t1;                       -- valor = 1
CALL proc_sem_commit();                 -- procedimento participa na transação e não termina esta transação.                
SELECT * FROM t1;                       -- valor = 2
COMMIT;                                 -- transação TERMINADA. 
SELECT * FROM t1;                       -- valor = 2.

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 3.3  
-- Procedimento PL/SQL participa numa transação e altera o FIM desta transação.
--
-- NOTAS:
--   * A responsabilidade de terminar uma transação:
--       * É de quem inicia essa transação;
--       * Não é de um procedimento que participa na transação.

--   * Em GERAL: 
--       * COMMIT/ROLLBACK não deve existir no corpo de Procedimento/Função PL/SQL. 
-------------------------------------------------------------------------------------------------------------------------------
-- criar e guardar procedimento compilado na BD  
CREATE OR REPLACE PROCEDURE proc_com_commit
AS
BEGIN
    UPDATE t1 SET valor = 3;  
    COMMIT;                 -- Em GERAL, é má prática usar COMMIT/ROLLBACK aqui. 
END;
/

SELECT * FROM t1;              -- valor = 2. 
CALL SYS.TRANSACTIONINFO();  -- nenhuma transação em curso.
UPDATE t1 SET valor = 0;       -- transação INICIADA.
CALL SYS.TRANSACTIONINFO();  -- uma transação em curso.
SELECT * FROM t1;              -- valor = 0 
CALL proc_com_commit();        -- transação TERMINADA (com COMMIT). 
CALL SYS.TRANSACTIONINFO();  -- nenhuma transação em curso.
SELECT * FROM t1;              -- valor = 3
ROLLBACK;                                 
SELECT * FROM t1;              -- valor = 3.

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 3.4  
-- Procedimento PL/SQL participa numa transação (PRINCIPAL) como transação AUTÓNOMA (independente).
--
-- NOTAS:
--   * Transação autónoma (TA):
--       * Totalmente independente. 
--       * Não partilha com a transação PRINCIPAL (TP):
--           * LOCKs;
--           * Recursos;
--           * Dependências de commit/rollback (i.e., estes comandos não afetam a transação principal e vice-versa).
--       * Alterações da TA:
--           * Tornam-se visíveis para outras transações, após COMMIT da TA.
--           * Tornam-se visíveis para a TP quando esta retoma o controlo da transação, mas só se for READ COMMITED.  
--   * Interesse:
--       * Log de eventos (salientar que rollback da TP não afeta a TA)
-------------------------------------------------------------------------------------------------------------------------------
-- eliminar registos da tabela t1
DELETE FROM t1;
COMMIT;

-- criar e guardar procedimento compilado na BD  
CREATE OR REPLACE PROCEDURE proc_transacao_autonoma
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO t1(id, valor) VALUES(5,5);  
    COMMIT;                  
END;
/

SELECT * FROM t1;                       -- nenhum registo. 
CALL SYS.TRANSACTIONINFO();           -- nenhuma transação em curso.
INSERT INTO t1(id, valor) VALUES(4,4);  -- transação INICIADA.
CALL SYS.TRANSACTIONINFO();           -- uma transação em curso.
SELECT * FROM t1;                       -- valor = 4 
CALL proc_transacao_autonoma();         -- transação autónoma; o COMMIT não termina transação. 
CALL SYS.TRANSACTIONINFO();           -- uma transação em curso.
SELECT * FROM t1;                       -- valor = 4 e valor 5
ROLLBACK;                               -- TERMINA transação;
                                        -- não desfaz transação autónoma definida pelo procedimento.
SELECT * FROM t1;                       -- valor = 5
