-- ex07

CREATE OR REPLACE FUNCTION funcStockAnoEditora(p_id_editora Editoras.id_editora%TYPE, p_ano_edicao Edicoes_Livros.ano_edicao%TYPE) 
RETURN INTEGER
IS