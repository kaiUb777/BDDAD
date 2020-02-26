-- Ex 4.2

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirPrecosConsecutivosIguais
BEFORE INSERT OR UPDATE ON Precos_Edicoes_Livros

    DECLARE
    v_count INTEGER;
    ex_precos_consecutivos_iguais EXCEPTION;

BEGIN 
    SELECT count (*)
        INTO v_count
    FROM precos_edicoes_livros P1
        WHERE P1.preco = (Select P2.preco --preço de P1.isbn anterior a preço consecutivo P1.preço
                            FROM precos_edicoes_livros P2
                          WHERE P2.isbn = P1.isbn
                            AND P2.data_inicio = (SELECT MAX(P3.data_inicio) --data anterior mais recente de P1.isbn
                                                    FROM precos_edicoes_livros P3
                                                        WHERE P3.isbn = P1.isbn
                                                            And P3.data_inicio < P1.data_inicio));
    IF v_count > 0 THEN
        RAISE ex_precos_consecutivos_iguais;
    END IF;
    
EXCEPTION
    WHEN ex_precos_consecutivos_iguais THEN
        RAISE_APPLICATION_ERROR(-200007, 'Não são permitidos registos de precos com valores iguais para datas consecutivas');
END;
/