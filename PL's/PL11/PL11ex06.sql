-- ex06

CREATE OR REPLACE FUNCTION funcClienteInfo(p_nif_cliente Clientes.nif_cliente%TYPE)
RETURN Clientes%ROWTYPE
IS
    l_cliente   Clientes%ROWTYPE;
    l_parametro_invalido    EXCEPTION;
    
BEGIN

    SELECT * INTO l_cliente
    FROM Clientes
        WHERE nif_cliente = p_nif_cliente;
        
    RETURN l_cliente;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- TESTES

BEGIN
    DBMS_Output.Put_Line(funcClienteInfo(900800100));
END;