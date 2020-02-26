-- ex05

CREATE OR REPLACE FUNCTION funcTemLivrosEditora(p_id_editora Edicoes_Livros.id_editora%TYPE)
RETURN BOOLEAN
IS

l_nr_livros INTEGER;

l_id_editora Editoras.id_editora%TYPE;

BEGIN
    SELECT id_editora INTO l_id_editora 
    FROM Edicoes_Livros
        WHERE id_editora = p_id_editora;
    
    SELECT COUNT(*) INTO l_nr_livros
    FROM edicoes_livros
        WHERE id_editora = p_id_editora AND stock > 0;
    
    RETURN l_nr_livros > 0;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
-- TESTES

SET SERVEROUTPUT ON;

DECLARE 
    l_resultado BOOLEAN;
    
    PROCEDURE teste(p_id_editora IN Editoras.id_editora%TYPE)
    IS
    BEGIN
        l_resultado := funcTemLivrosEditora(p_id_editora);
        IF l_resultado IS NULL THEN
            DBMS_OUTPUT.PU_LINE('funcTemLivrosEditora(' || NVL(TO_CHAR(p_id_editora), 'NULL') || ')= ' || 'NULL');
            
        ELSIF l_resultado THEN 
            DBMS_OUTPUT.PUT_LINE('funcTemLivrosEditora(' || NVL(TO_CHAR(p_id_editora), 'NULL') || ')= ' || 'TRUE');
            
        ELSE
            DBMS_OUTPUT.PUT_LINE('funcTemLivrosEditora(' || NVL(TO_CHAR(p_id_editora), 'NULL') || ')= ' || 'FALSE');
            
        END IF;
    END;
BEGIN 
    teste(1500);
END;

DELETE FROM Parks WHERE id_park = p_id_park;
	DELETE FROM ParkCapacity WHERE id_park = p_id_park;
	DELETE FROM Parked_Vehicles WHERE id_park = p_id_park;
	DELETE FROM Trip WHERE id_park = p_id_park;