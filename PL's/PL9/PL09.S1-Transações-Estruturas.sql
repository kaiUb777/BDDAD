/******************************************************************************************************************************/ 
-- PARTE 1 - Estruturas de Transações
--
-- EXECUTAR INDIVIDUALMENTE os comandos deste script (i.e. não executar como um script).
/******************************************************************************************************************************/

-- desativar opção AUTOCOMMIT
SET AUTOCOMMIT OFF;

-- ativar a SAÍDA para ecrã
SET SERVEROUTPUT ON;

/******************************************************************************************************************************/ 
-- SECÇÃO 1.1 - Transação que consiste num comando SQL-DDL (CREATE, ALTER, DROP, etc.)
/******************************************************************************************************************************/

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.1.1  
-- Transação que consiste num comando CREATE.
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();                       -- nenhuma transação em curso.
CREATE TABLE t1(                                    -- transação INICIADA e TERMINADA, IMPLICITAMENTE.    
    id    INT  CONSTRAINT pk_t1_id    PRIMARY KEY,  
    valor INT  CONSTRAINT nn_t1_valor NOT NULL); 
CALL SYS.TRANSACTIONINFO();                       -- nenhuma transação em curso.
SELECT * FROM t1;                                   -- tabela criada. 

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.1.2  
-- Transação que consiste num comando ALTER.
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();         -- nenhuma transação em curso.
ALTER TABLE t1 ADD nome VARCHAR(25);  -- transação INICIADA e TERMINADA, IMPLICITAMENTE. 
CALL SYS.TRANSACTIONINFO();         -- nenhuma transação em curso.
SELECT * FROM t1;                     -- tabela com coluna adicionada. 

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.1.3  
-- Transação que consiste num comando DROP.
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
DROP TABLE t1 CASCADE CONSTRAINTS PURGE;  -- transação INICIADA e TERMINADA, IMPLICITAMENTE.
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
SELECT * FROM t1;                         -- tabela não existe. 



/******************************************************************************************************************************/ 
-- SECÇÃO 1.2 - Transação que consiste num ou mais comandos SQL-DML (INSERT, UPDATE e/ou DELETE)
--
-- NOTAS:
--   * Transação INICIADA de uma das seguintes formas:
--       * IMPLICITAMENTE:
--           * Com a execução de qualquer comando DDL;
--           * Por um comando DML:
--               * Depois do fim da transação anterior;
--               * ou depois do início de uma sessão (i.e. ligação estabelecida com a BD).
--       * EXPLICITAMENTE:
--           * Com a execução de um comando SET TRANSACTION.
--   * Transação TERMINADA de uma das seguintes formas:  
--       * IMPLICITAMENTE: 
--           * Com um comando DDL (COMMIT implícito).
--       * EXPLICITAMENTE: 
--           * Com um comando COMMIT/ROLLBACK. 
/******************************************************************************************************************************/

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.1
-- Transação que consiste num comando DML (INSERT) e é:
--   * INICIADA IMPLICITAMENTE por comando DDL;
--   * TERMINADA EXPLICITAMENTE por comando COMMIT.
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();                       -- nenhuma transação em curso.
CREATE TABLE t1(                                    -- comando DDL INICIA a transação.    
    id    INT  CONSTRAINT pk_t1_id    PRIMARY KEY,  
    valor INT  CONSTRAINT nn_t1_valor NOT NULL);
CALL SYS.TRANSACTIONINFO();                       -- nenhuma transação em curso.    
INSERT INTO t1(id, valor) VALUES(1, 1);              
CALL SYS.TRANSACTIONINFO();                       -- uma transação em curso.
SELECT * FROM t1;                                   -- valor = 1
                                                    -- registo armazenado TEMPORARIAMENTE; 
                                                    -- registo visível APENAS nesta SESSÃO.
COMMIT;                                             -- comando TERMINA EXPLICITAMENTE a transação; 
                                                    -- torna PERMANENTES todas as alterações da transação;
                                                    -- alterações visíveis em TODAS as SESSÕES da BD.
CALL SYS.TRANSACTIONINFO();                       -- nenhuma transação em curso.                                                    
SELECT * FROM t1;                                   -- valor = 1                                  

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.2
-- Transação que consiste num comando DML (INSERT) e é:
--   * INICIADA IMPLICITAMENTE pelo comando INSERT (depois do fim da transação anterior);
--   * TERMINADA EXPLICITAMENTE por comando ROLLBACK.
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();            -- nenhuma transação em curso.
INSERT INTO t1(id, valor) VALUES(2, 2);  -- comando DML INICIA uma nova transação.
CALL SYS.TRANSACTIONINFO();            -- uma transação em curso.
SELECT * FROM t1;                        -- valor = 1 ; valor = 2                               
ROLLBACK;                                -- comando TERMINA EXPLICITAMENTE a transação;
                                         -- desfaz todas as alterações da transação.
CALL SYS.TRANSACTIONINFO();            -- nenhuma transação em curso.                                         
SELECT * FROM t1;                        -- valor = 1

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.3  
-- Transação que consiste num comando DML (INSERT) e é:
--   * INICIADA IMPLICITAMENTE pelo comando INSERT (depois do fim da transação anterior);
--   * TERMINADA IMPLICITAMENTE com COMMIT por comando DDL (com sucesso).
-------------------------------------------------------------------------------------------------------------------------------  
CALL SYS.TRANSACTIONINFO();                        -- nenhuma transação em curso.
INSERT INTO t1(id, valor) VALUES(2, 2);              -- comando DML INICIA uma nova transação.
CALL SYS.TRANSACTIONINFO();                        -- uma transação em curso.
CREATE TABLE t2(                                     -- comando DDL TERMINA IMPLICITAMENTE a transação com COMMIT.
    id    INT   CONSTRAINT pk_t2_id    PRIMARY KEY,                                                        
    valor INT   CONSTRAINT nn_t2_valor NOT NULL); 
CALL SYS.TRANSACTIONINFO();                        -- nenhuma transação em curso.    
SELECT * FROM t1;                                    -- valor = 1 ; valor = 2 
SELECT * FROM t2;                                    -- nova tabela.

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.4  
-- Transação que consiste em dois comandos DML (DELETE e INSERT) e é:
--   * INICIADA IMPLICITAMENTE pelo comando DELETE (depois do fim da transação anterior);
--   * TERMINADA IMPLICITAMENTE com COMMIT por comando DDL (sem sucesso).
-------------------------------------------------------------------------------------------------------------------------------  
CALL SYS.TRANSACTIONINFO();                        -- nenhuma transação em curso.
DELETE FROM t1;                                      -- comando DML INICIA uma nova transação.
CALL SYS.TRANSACTIONINFO();                        -- uma transação em curso.
INSERT INTO t1(id, valor) VALUES(3, 3);
CALL SYS.TRANSACTIONINFO();                        -- uma transação em curso.
CREATE TABLE t1(                                     -- comando DDL TERMINA IMPLICITAMENTE a transação com COMMIT.
    id    INT   CONSTRAINT pk_t1_id    PRIMARY KEY,                                                        
    valor INT   CONSTRAINT nn_t1_valor NOT NULL); 
CALL SYS.TRANSACTIONINFO();                        -- nenhuma transação em curso.    
SELECT * FROM t1;                                    -- valor = 3

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.5  
-- Transação que consiste num comando DML (UPDATE) e é:
--   * INICIADA EXPLICITAMENTE pelo comando SET TRANSACTION;
--   * TERMINADA EXPLICITAMENTE com COMMIT.
--
-- NOTAS:
--   * SET TRANSACTION
--       * Permite especificar o NOME de uma transação.
--   * Nome de transação:
--       * Está disponível durante a execução da transação;
--       * Facilita a monitoração de transações de longa duração.
-------------------------------------------------------------------------------------------------------------------------------  
SELECT * FROM t1;              -- valor = 3
CALL SYS.TRANSACTIONINFO();  -- nenhuma transação em curso.
SET TRANSACTION NAME 'teste';  -- comando INICIA nova transação.
CALL SYS.TRANSACTIONINFO();  -- transação em curso.
UPDATE t1 SET valor = 5;       
CALL SYS.TRANSACTIONINFO();  -- transação em curso.
COMMIT;                        -- TERMINA transação.
CALL SYS.TRANSACTIONINFO();  -- nenhuma transação em curso.
SELECT * FROM t1;              -- valor = 5  

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.2.6   
-- Comando SET TRANSATION só é permitido para iniciar uma transação. 
-------------------------------------------------------------------------------------------------------------------------------
CALL SYS.TRANSACTIONINFO();  -- nenhuma transação em curso.
UPDATE t1 SET valor = 8;       -- comando DML INICIA uma nova transação.
CALL SYS.TRANSACTIONINFO();  -- uma transação em curso.
SELECT * FROM t1;              -- valor = 8 
SET TRANSACTION NAME 'teste';  -- comando FALHA porque não é permitido a meio de uma transação.
ROLLBACK;                      -- TERMINA a transação.
SELECT * FROM t1;              -- valor = 5


/******************************************************************************************************************************/ 
-- SECÇÃO 1.3 - Rollback parcial da transação.
/******************************************************************************************************************************/

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.3.1  
-- Transação com SAVEPOINTs para permitir ROLLBACKs parciais;
--
-- NOTAS:
--   * SAVEPOINTs:
--       * São indicadores intermédios dentro do contexto de uma transação;
--       * Dividem uma longa transação em partes mais pequenas;
--       * Permitem, numa transação longa, desfazer (ROLLBACK) parte da transação e não toda a transação. Por exemplo, quando é 
--         cometido um erro.   
-------------------------------------------------------------------------------------------------------------------------------
DELETE FROM t1;                              -- transação INICIADA.
INSERT INTO t1(id, valor) VALUES (1, 0); 
COMMIT;                                      -- transação TERMINADA.                            
SELECT * FROM t1;                            -- valor = 0

CALL SYS.TRANSACTIONINFO();                -- nenhuma transação em curso.
SET TRANSACTION NAME 'teste de savepoints';  -- comando INICIA nova transação.
CALL SYS.TRANSACTIONINFO();                -- uma transação em curso.
SAVEPOINT s1;                                -- comando cria savepoint designado s1.
CALL SYS.TRANSACTIONINFO();                -- uma transação em curso.
UPDATE t1 SET valor = 1;                     -- transação INICIADA.
CALL SYS.TRANSACTIONINFO();                -- uma transação em curso.
SELECT * FROM t1;                            -- valor = 1
SAVEPOINT s2;
UPDATE t1 SET valor = 2;
SELECT * FROM t1;                            -- valor = 2
ROLLBACK TO s2;                              -- rollback PARCIAL da transação até s2.
SELECT * FROM t1;                            -- valor = 1
ROLLBACK;                                    -- TERMINA a transação;
                                             -- Rollback TOTAL da transação.
SELECT * FROM t1;                            -- valor = 0



/******************************************************************************************************************************/ 
-- SECÇÃO 1.4 - Opção Autocommit
/******************************************************************************************************************************/
-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 1.4.1  
-- Efeito da opção AUTOCOMMIT. 
-------------------------------------------------------------------------------------------------------------------------------
-- ativar novamente a opção AUTOCOMMIT
SET AUTOCOMMIT ON;

CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
DELETE FROM t1;                           -- transação INICIADA;
                                          -- transação TERMINADA IMPLICITAMMENTE com COMMIT. 
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
INSERT INTO t1(id, valor) VALUES (1, 1);  -- transação INICIADA;
                                          -- transação TERMINADA IMPLICITAMMENTE com COMMIT.
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.                           
SELECT * FROM t1;                         -- valor = 1
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
UPDATE t1 SET valor = 2;                  -- transação INICIADA;
                                          -- transação TERMINADA IMPLICITAMMENTE com COMMIT. 
CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
SELECT * FROM t1;                         -- valor = 2
ROLLBACK;
SELECT * FROM t1;                         -- valor = 2

-- desativar novamente a opção AUTOCOMMIT
SET AUTOCOMMIT OFF; 

UPDATE t1 SET valor = 0;                  -- transação INICIADA. 
COMMIT;                                   -- transação TERMINADA.
SELECT * FROM t1;                         -- valor = 0 (valor inicial igual ao da transação anterior)

CALL SYS.TRANSACTIONINFO();             -- nenhuma transação em curso.
DELETE FROM t1;                           -- transação INICIADA.
CALL SYS.TRANSACTIONINFO();             -- uma transação em curso.
INSERT INTO t1(id, valor) VALUES (1, 1);
SELECT * FROM t1;                         -- valor = 1
CALL SYS.TRANSACTIONINFO();             -- uma transação em curso.
SELECT * FROM t1;                         -- valor = 1
UPDATE t1 SET valor = 2;                   
CALL SYS.TRANSACTIONINFO();             -- uma transação em curso.
SELECT * FROM t1;                         -- valor = 2
ROLLBACK;                                 -- transação TERMINADA.
SELECT * FROM t1;                         -- valor = 0.
