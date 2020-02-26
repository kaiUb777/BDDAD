-- ex4

CREATE OR REPLACE FUNCTION funcMenorIdadeClientes
RETURN INTEGER
IS
    l_menor_idade INTEGER;
    
BEGIN
    SELECT MIN(TRUNC (MONTHS_BETWEEN(SYSDATE, data_nascimento)/12))
        INTO l_menor_idade
    FROM clientes;
    
    RETURN l_menor_idade;
END;

--TESTE

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE(funcMenorIdadeClientes);
END;
CALL funcMenorIdadeClientes;

    /**
     * Method that remove a park
     * @param idPark the id of the park
     * @return true if park is remove | false if not
     */
    public boolean removePark(String idPark){
        ParkDB pDB = oComp.getParkDB();
        Park park = pDB.getPark(idPark);
        return pDB.removePark(park);
    }
}