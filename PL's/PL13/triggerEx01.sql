--Ex5.1

CREATE OR REPLACE TRIGGER trgClientesImpedirMenor18Anos
BEFORE INSERT OR UPDATE ON Clientes 

FOR EACH ROW

DECLARE

    MIN_MESES_MAIOR_IDADE   CONSTANT INTEGER := 18*12;
    ex_menor_idade  EXCEPTION;

BEGIN
    IF (MONTHS_BETWEEN(SYSDATE, :NEW.data_nascimento) < MIN_MESES_MAIOR_IDADE) THEN
        RAISE ex_menor_idade;
    END IF;
    
EXCEPTION

    WHEN ex_menor_idade THEN
        RAISE_APPLICATION_ERROR(-20000, 'Não são permitidos < 18');
END trgClientesImpedirMenor18Anos;
/
