--PL15

--ex4.1

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirPrecosConsecutivosIguais
BEFORE INSERT OR UPDATE ON Precos_Edicoes_Livros

FOR EACH ROW

DECLARE 
    
    l_preco_new Precos_Edicoes_Livros.preco%TYPE;
    l_preco_old Precos_Edicoes_Livros.preco%TYPE;
    
    v_preco Precos_Edicoes_Livros.preco%TYPE;
    
    ex_exception EXCEPTION;
    
BEGIN
    
    SELECT preco into v_preco
    FROM Precos_Edicoes_Livros
    WHERE(:old.data_inicio < :new.data_inicio) AND isbn like '500-1234567891'
    FETCH FIRST 1 ROW ONLY;
    
    IF :new.preco = v_preco THEN
        
        RAISE ex_exception;
    
    ELSIF INSERTION THEN
    
        v_preco := new.preco;
    
    ELSIF UPDATING THEN
    
        v_preco := new.preco;
        
    END IF;
END;
/

SELECT * 
FROM precos_edicoes_livros
WHERE isbn like '500-1234567891';

--Resolução Aula

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirPrecosConsecutivosIguais
BEFORE INSERT OR UPDATE ON Precos_Edicoes_Livros

    DECLARE
    
    ex_precos_consecutivos_iguais EXCEPTION;

BEGIN 
    SELECT preco INTO v_preco_anterior
    FROM precos_edicoes_livros
    WHERE isbn = :NEW.isbn
        AND data_inicio = (SELECT MAX(data_inicio)
                            from precos_edicoes_livros
                            WHERE isbn = :NEW.isbn AND data_inicio < :NEW.data_inicio);
    IF v_preco_anterior = :NEW.preco THEN
        RAISE ex_precos_consecutivos_iguais;
    END IF;
EXCEPTION
    WHEN ex_precos_consecutivos_iguais THEN
        RAISE_APPLICATION_ERROR(-200007, 'Não são permitidos registos de precos com val consecutivos');
        WHEN NO_DATA_FOUND THEN
            NULL;
END;
/