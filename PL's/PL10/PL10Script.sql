-- PL10

--ex4

SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE procQtdEdicoesLivrosEditora (p_id_editora IN Editoras.id_editora%TYPE)

DECLARE

id_editora_inexistente EXCEPTION;

BEGIN

--Exceção
SELECT COUNT(*) INTO dummy 
FROM Editoras 
WHERE id_editora = p_id_editora;
IF dummy = 0 THEN
RAISE id_editora_inexistente;

ELSE

-- Condição
SELECT DISTINCT(COUNT (id_editora)) INTO dummy 
FROM Edicoes_Livros EL1 
WHERE EL1.id_editora = procQtdEdicoesLivrosEditoras

EXCEPTION
    WHEN id_editora_inexistente THEN
        dbms_output.put_line('Não existe nenhuma editora com esse id!');

END IF;

END;

---------------------------- RESOLUÇÃO AULA ex4 -----------------------------------------

--EX4

create or replace procedure procQtdEdicoesLivrosEditora(
p_id_editora editoras.id_editora%type
) as
    l_contador integer;
    l_qtd_livros integer;
begin 
    select count(*) into l_contador
    from editoras where id_editora = p_id_editora;
    
    if(l_contador = 0)then
        select count(*) into l_qtd_livros
        from edicoes_livros where id_editora = p_id_editora;
        dbms_output.put_line('Id_editora: ' || p_id_editora);
        dbms_output.put_line('Quantidade de livros: ' || l_qtd_livros);
    else
        dbms_output.put_line('Editora: ' || nvl(to_char(p_id_editora), 'nao existe'));
    end if;
end;

-- ex 5

CREATE OR REPLACE PROCEDURE procStockEdicaoLivro (p_isbn IN Edicoes_Livros.isbn%TYPE )

DECLARE

id_livro_inexistente EXCEPTION;
l_stock Edicoes_Livros.stock%TYPE;
l_stock_min Edicoes_Livros.stock_min%TYPE 

BEGIN

SELECT stock_min, stock INTO l_stock_min, l_stock
FROM Edicoes_Livros EL1 WHERE EL1.isbn = p_isbn;

EXCEPTION

    WHEN NO_DATA_FOUND THEN;

END;

-- ex 6

CREATE OR REPLACE PROCEDURE procAutores()

DECLARE 

    CURSOR cur_id_nomes IS
    SELECT A1.id_autor, A1.nome
    FROM Autores A1
    ORDER BY A1.nome;
    
    l_autor autores%ROWTYPE;
    l_linha INTEGER;
    
BEGIN

    OPEN cur_id_nomes;
        
        LOOP
            FETCH c_id_nomes INTO l_autor;
            EXIT WHEN cur_id_nomes%NOTFOUND;
            
            l_linha := cur_id_autores%ROWCOUNT;
        
        END LOOP;
        CLOSE cur_id_nomes;
        
END;


-- ex 7 LOOP FOR

CREATE OR REPLACE PROCEDURE procAutores()

DECLARE

    CURSOR cur_id_nomes IS
    SELECT A1.id_autor, A1.nome
    FROM Autores A1
    ORDER BY A1.nome;
    
    --l_autor autores%ROWTYPE;
    --l_linha INTEGER; 

    OPEN cur_id_nomes;
        
       FOR c_index IN cur_id_nomes
        LOOP
            --FETCH c_id_nomes INTO l_autor;
            --EXIT WHEN cur_id_nomes%NOTFOUND;
            --l_linha := cur_id_autores%ROWCOUNT;
            
            DBMS_OUTPUT.PUT_LINE(c_index.id_autor|| ' ' ||c_index.nome);
        END LOOP;
        CLOSE cur_id_nomes;
        
END;

-- ex8 IMPLEMENTAR COUNT NO CICLO FOR

CREATE OR REPLACE PROCEDURE procAutores()

DECLARE

    --CURSOR cur_id_nomes IS
    SELECT A1.id_autor, A1.nome
    FROM Autores A1
    ORDER BY A1.nome;
    
    --l_autor autores%ROWTYPE;
    --l_linha INTEGER;
    
BEGIN

    --OPEN cur_id_nomes;
        
       FOR c_index IN (SELECT A1.id_autor, A1.nome
                        FROM Autores A1
                        ORDER BY A1.nome)
    
        LOOP
            --FETCH c_id_nomes INTO l_autor;
            --EXIT WHEN cur_id_nomes%NOTFOUND;
            --l_linha := cur_id_autores%ROWCOUNT;
            
            DBMS_OUTPUT.PUT_LINE(c_index.id_autor|| ' ' ||c_index.nome);
            
        END LOOP;
        CLOSE cur_id_nomes;
        
END;

-- ex09

CREATE OR REPLACE PROCEDURE procQtdVendasMensaisAnoEditora(p_id_editora Edicoes_Livros.id_editora%TYPE, p_ano INTEGER)

AS 
          
    CURSOR cur_qtd_vendida (c_id_editora edicoes_livros.id_editora%TYPE, c_mes_edicao INTEGER, c_ano_edicao INTEGER) IS
    SELECT SUM (V.quantidade)
    FROM Vendas V
        INNER JOIN edicoes_livros E ON V.isbn=E.isbn
    WHERE E.id_editora = c_id_editora
        AND EXTRACT (MONTH FROM V.data_hora)=c_mes
        AND EXTRACT (YEAR FROM V.data_hora)=c_ano;
        
        l_nome  editoras.nome%TYPE;
        l_qtd_vendida   INTEGER;
        
        l_ano_invalido  EXCEPTION;    
BEGIN
    
    SELECT nome INTO l_nome
    FROM editoras WHERE id_editora=p_id_editora;
    
    IF p_ano >= EXTRACT (YEAR FROM SYSDATE) OR p_ano IS NULL THEN
        RAISE l_ano_invalido
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Editora' || p_id_editora);
    DBMS_OUTPUT.PUT_LINE('Vendas' || p_ano);
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Mês', 5 || 'Qtd');
    DBMS_OUTPUT.PUT_LINE('-',10,'-');
    
    FOR mes IN 1..12
    
    LOOP
        OPEN cur_qtd_vendida(p_id_editora, p_ano, mes);
        FETCH cur_qtd_vendida INTO l_qtd_vendida;
        CLOSE cur_qtd_vendida;
        
        DBMS_OUTPUT.PUT_LINE(RPAD(mes, 5) || NVL(l_qtd_vendida,0));
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Editora' || NVL(TO_CHAR(p_id_editora), 'NULL') || 'não existe');
    WHEN l_ano_invalido THEN
        DBMS_OUTPUT.PUT_LINE('Ano' || NVL(TO_CHAR(p_ano),'NULL') || 'é inválido!');
        
END; 
