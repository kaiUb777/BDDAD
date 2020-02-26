-- Ex5.5

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirRegisto
AFTER INSERT OR UPDATE OR DELETE ON precos_edicoes_livros

FOR EACH ROW

DECLARE
    ex_delete   EXCEPTION;
    ex_data1    EXCEPTION;
    ex_data2    EXCEPTION;

BEGIN
    IF DELETING THEN
        RAISE ex_delete;
    ELSE
        IF :NEW.data_inicio <= SYSDATE THEN
            RAISE ex_data1;
        ELSIF :OLD.data_inicio <= SYSDATE THEN
            RAISE ex_data2;
        END IF;
    END IF;
    
EXCEPTION

    WHEN ex_delete THEN
        RAISE_APPLICATION_ERROR(-20004, 'Não são permitidas eliminações de preços.');
    WHEN ex_data1 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Não são permitidos registos de preços anteriores à data atual.');
    WHEN ex_data2 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Não são permitidas modificações de registos de preços anterirores à data');

END trgPrecosEdicoesLivrosImpedirRegistos;
/