--Ex 5.2

CREATE OR REPLACE TRIGGER trgVendasImpedirAlteracoesForaEpediente
BEFORE INSERT OR UPDATE ON Vendas

FOR EACH ROW

DECLARE 
    
    v_new_data  DATE;
    v_old_data  DATE;
    
    ex_fim_semana EXCEPTION;
    ex_fora_horas EXCEPTION;

BEGIN
    IF INSERTION THEN
    
        v_new_data := :NEW.data_hora;
    
    ELSE IF UPDATING THEN
        
        v_new_data := :NEW.data_hora;
        v_old_data := :OLD.data_hora;
        
    END IF;
    
    IF(TO_CHAR(v_old_data, 'd') IN (1,7)) OR (TO_CHAR(v_new_data, 'd') IN (1,7)) THEN
        RAISE ex_fim_semana;
        
        ELSE IF (TO_CHAR(v_old_data, 'HH24') NOT BETWEEN 9 AND 18) OR (TO_CHAR(v_new_data, 'HH24') NOT BETWEEN 9 AND 18) THEN
            RAISE ex_fora_expediente;
    END IF;

EXCEPTION 

    WHEN ex_fim_semana THEN
        RAISE_APPLICATION_ERROR(-20003, 'Horário de fim de semana');
    WHEN ex_fora_expediente
        RAISE_APPLICATION_ERROR(-20003, 'Fora horário de funcionamento');

END trgVendasImpedirAlteracoesForaEpediente;
/