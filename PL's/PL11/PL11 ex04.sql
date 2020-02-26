-- Ex 4 
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION funcStockMax(p_edicao INTEGER)
    RETURN INTEGER IS

DECLARE

ex_edicao_inexistente EXCEPTION;

l_maiorStock INTEGER;

BEGIN 

    SELECT MAX(EL.stock) INTO l_maiorStock
    FROM Edicoes_Livros EL
     WHERE EL.edicao = p_edicao;
                        
    RETURN (l_maiorStock);
    
    IF p_edicao IS NULL THEN
        RAISE l_ano_invalido
    END IF;
    
    EXCEPTION
    WHEN ex_edicao_inexistente THEN
        DBMS_OUTPUT.PUT_LINE('Editora' || NVL(TO_CHAR(p_editora), 'NULL') || 'n�o existe');
    
END;