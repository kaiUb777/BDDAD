-- Teste ex04
BEGIN 
    procQtdEdicoesLivrosEditora(1800);
END;

CALL procQtdEdicoesLivrosEditora(1800);

-- Teste ex05

BEGIN
    procStockEdicaoLivro(200);
END;

CALL procStockEdicaoLivro(200);

-- Teste ex07 | FOR LOOP CURSOR

BEGIN
    procAutores();
END;
CALL procAutores();

-- Teste ex08 | FOR LOOP QUERY

BEGIN 
    proAutores();
END;
CALL procAutores();

-- Teste ex09

BEGIN
    procQtdVendasMensaisAnoEditora(1500, 2016);
END;
CALL procQtdVendasMensaisAnoEditora(1500, 2016);