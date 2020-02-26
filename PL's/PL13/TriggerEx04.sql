--Ex 5.4
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER substituirDatasFimSemana
AFTER UPDATE ON Vendas

FOR EACH ROW

DECLARE

    v_old_data  DATE;
    v_new_data  DATE;
    
BEGIN

    IF UPDATING THEN
        v_old_data := OLD.data_hora;
        
    END IF;
    
    IF(TO_CHAR(v_old_data, 'd') = 1) THEN
        
       v_new_data := TRUNC(v_old_data - 2);
        
        UPDATE v_old_data FROM VENDAS 
        
    ELSE IF (TO_CHAR(v_old_data, 'd' = 7)) THEN
    
        v_old_data := TRUNC(v_old_data - 1);
    
    END IF;    
    
END;
/