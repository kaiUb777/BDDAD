/******************************************************************************************************************************/ 
-- PARTE 2 - Níveis de Isolamento de Transações

-- EXECUTAR INDIVIDUALMENTE os comandos deste script (i.e. não executar como um script).
/******************************************************************************************************************************/

-- desativar opção AUTOCOMMIT
SET AUTOCOMMIT OFF;

-- ativar a SAÍDA para ecrã
SET SERVEROUTPUT ON;

DELETE FROM t1;                          -- elimina todos os registos da tabela.
INSERT INTO t1(id, valor) VALUES(1, 0);                
COMMIT;                                                
SELECT * FROM t1;                        -- valor = 0



/******************************************************************************************************************************/ 
-- SECÇÃO 2.1 - Múltiplas sessões concorrentes de uma BD.
--
-- NOTA:
--   * Uma SESSÃO de BD:
--       * Representa uma ligação (CONNECTION) à BD, para interagir com ela, estabelecida como utilizador. 
/******************************************************************************************************************************/

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 2.1.1 
-- Duas SESSÕES concorrentes de uma BD:
--   * SESSÃO 1 - realizada nesta worksheet;
--   * SESSÃO 2 - realizada numa UNSHARED worksheet (worksheet com uma UNSHARED CONNECTION); 
--                criada com Ctrl + Shift + N.  
-- ALTERAÇÕES realizadas por uma transação numa SESSÃO:
--   * VISÍVEIS noutras sessões APENAS quando a transação é COMMITTED.
-------------------------------------------------------------------------------------------------------------------------------

-- SESSÃO 1 (nesta worksheet)
UPDATE t1 SET valor = 1;  -- transação INICIADA.
COMMIT;                   -- transação TERMINADA.
UPDATE t1 SET valor = 2;  -- INICIADA nova transação.
SELECT * FROM t1;         -- valor = 2
                          -- valor TEMPORÁRIO, VISÍVEL apenas nesta sessão. 

-- SESSÃO 2 (numa UNSHARED worksheet)
-- iniciar NOVA SESSÃO, abrindo uma UNSHARED worksheet separada (Ctrl + Shift + N);
-- na UNSHARED worksheet, executar o seguinte comando:   
SELECT * FROM t1;         -- valor = 1 (diferente da SESSÃO 1); 
                          -- porque a transação da SESSÃO 1 não foi COMMITTED;
                          -- é o valor que está gravado PERMANENTEMENTE na BD.

-- SESSÃO 1 (nesta worksheet)
COMMIT;                   -- transação TERMINA;
                          -- alteração da BD passa a PERMANENTE, sendo VISÍVEL em TODAS as SESSÕES da BD. 
SELECT * FROM t1;         -- valor = 2

-- SESSÃO 2 (na UNSHARED worksheet)
SELECT * FROM t1;         -- valor = 2 (igual ao da SESSÃO 1).



/******************************************************************************************************************************/ 
-- SECÇÃO 2.2 - Níveis de Isolamento (ISOLATION LEVEL) de Transações.
--
-- NOTAS:
-- Existem três níveis de isolamento de uma transação:
--   * SERIALIZABLE           
--   * READ COMMITTED (por omissão)
--   * READ ONLY
--
-- Níveis de isolamento são IMPLEMENTADOS com bloqueios (LOCKs):
--   * LOCKs controlam o acesso aos dados:
--       * Para evitar problemas de concorrência.
--   * Permitem a uma transação:
--       * Impedir que outras transações acedam ou atualizem dados.
--   * Uma transação que solicita um LOCK de um recurso:
--       * Só continua quando o LOCK for concedido. 
--   * Um LOCK é libertado:
--       * Por comando COMMIT/ROLLBACK.
/******************************************************************************************************************************/

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 2.2.1
-- Transação SERIALIZABLE
-- 
-- NOTAS:
-- Só vê dois tipos de alterações:
--   * COMMITTED no início da transação;
--   * Feitas pela própria transação.

-- Apropriada para os seguintes ambientes:
--   * Grandes BD e transações curtas que atualizam apenas poucas linhas;
--   * Onde é relativamente pequena a hipótese de duas transações concorrentes modificarem as mesmas linhas;
--   * Onde transações de execução relativamente longa são principalmente READ ONLY.

-- Um comando DML da transação SERIALIZABLE sobre um recurso:
--   * FALHA quando há uma transação de ATUALIZAÇÃO desse recurso da BD, UNCOMMITTED, no início da transação SERIALIZABLE.
-------------------------------------------------------------------------------------------------------------------------------

-- SESSÃO 1 (nesta worksheet)
SELECT * FROM t1;         -- valor = 2
  
UPDATE t1 SET valor = 3;  -- nova transação INICIADA; 
                          -- transação adquire o LOCK da tabela que impede alterações desta, noutras transações;
SELECT * FROM t1;         -- valor = 3          

-- SESSÃO 2 (na UNSHARED worksheet)
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE NAME 'S';  -- transação 'S' INICIADA. 
UPDATE t1 SET valor = 4;                                -- esperar que a transação da SESSÃO 1 liberte o LOCK da tabela.

-- SESSÃO 1 (nesta worksheet)
COMMIT;  -- liberta o LOCK da tabela.

-- SESSÃO 2 (na UNSHARED worksheet)
-- o LOCK foi libertado, mas surge o ERRO ORA-08177: não é possível sequenciar o acesso para esta transação.
ROLLBACK;  -- transação 'S' TERMINADA.

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 2.2.2  
-- Transação READ COMMITTED (por omisssão)
--
-- NOTAS:
-- Todas as queries executadas por uma transação:
--   * Vêm apenas dados COMMITTED antes do início da consulta (não do início da transação como numa transação SERIALIZABLE)
--
-- Apropriada para os ambientes:
--   * Em que provavelmente poucas transações entram em conflito. 
--
-- Comando DML da transação sobre um recurso:
--   * ESPERA pela libertação do LOCK desse recurso quando há uma transação de atualização do recurso, UNCOMMITTED.
-------------------------------------------------------------------------------------------------------------------------------

-- SESSÃO 1 (nesta worksheet)
SELECT * FROM t1;         -- valor = 3
  
UPDATE t1 SET valor = 4;  -- nova transação INICIADA.
                          -- transação adquire o LOCK da tabela; 
                          -- este LOCK impede alterações desta tabela noutras transações.
SELECT * FROM t1;         -- valor = 4 

-- SESSÃO 2 (na UNSHARED worksheet)
SET TRANSACTION ISOLATION LEVEL READ COMMITTED NAME 'RC';  -- transação 'RC' INICIADA.
UPDATE t1 SET valor = 5;                                   -- esperar que a transação da SESSÃO 1 liberte o LOCK da tabela.

-- SESSÃO 1 (nesta worksheet)
COMMIT;  -- transação terminada;  
         -- o LOCK da tabela é libertado.

-- SESSÃO 2 (na UNSHARED worksheet)
SELECT * FROM t1;  -- valor = 5 (atualizado)

-- SESSÃO 1 (nesta worksheet)
SELECT * FROM t1;  -- ainda valor = 4

-- SESSÃO 2 (na UNSHARED worksheet)
COMMIT;  -- transação 'RC' TERMINADA.

-- SESSÃO 1 (nesta worksheet)
SELECT * FROM t1;  -- agora valor = 5

-------------------------------------------------------------------------------------------------------------------------------
-- EXEMPLO 2.2.3  
-- Transação READ ONLY.
--
-- NOTAS:
-- Semelhante a transações SERIALIZABLE:
--   * Só não permite que os dados sejam modificados na transação (excepto para o utilizador SYS).
-- Todas as queries executadas por uma transação:
--   * Vêm apenas dados COMMITTED antes do início da transação.
--
-- Apropriada para:
--   * Gerar relatórios cujo conteúdo seja consistente com o tempo anterior ao início da transação; 
--   * Executar múltiplas queries sobre uma ou mais tabelas enquanto outros utilizadores atualizam essas mesmas tabelas.
-------------------------------------------------------------------------------------------------------------------------------
SET TRANSACTION READ ONLY NAME 'RO';  -- transação INICIADA.
                                      -- transação apenas de leitura (permite SELECT mas sem cláusula FOR UPDATE).
SELECT * FROM t1;                     -- valor 5   
CALL SYS.TRANSACTIONINFO();         -- uma transação em curso.
UPDATE t1 SET valor = 6;              -- comando FALHA porque não é possível alterar a BD.
CALL SYS.TRANSACTIONINFO();         -- uma transação em curso.                                      
COMMIT;                               -- transação TERMINADA. 
CALL SYS.TRANSACTIONINFO();         -- nenhuma transação em curso.
SELECT * FROM t1;                     -- valor 5
