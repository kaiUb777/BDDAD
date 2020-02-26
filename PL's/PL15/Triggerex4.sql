--Ex 4.4

CREATE OR REPLACE TRIGGER trgVendasAtualizarSaldosCartaoCliente
    BEFORE INSERT OR DELETE ON VENDAS
    FOR EACH ROW WHEN (TO_NUMBER(TO_CHAR(:old.data_hora, 'd')) IN (3, 4) OR TO_NUMBER(TO_CHAR(:new.data_hora, 'd')) IN (3, 4)))
    DECLARE
        l_saldo_acumulado CARTOES_CLIENTES.saldo_acumulado%type;
        l_saldo_atual CARTOES_CLIENTES.saldo_atual%type;
        l_preco_livro NUMBER;
    BEGIN
        IF DELETING THEN
            IF (TO_NUMBER(TO_CHAR(:old.data_hora, 'd')) IN (3, 4)) THEN
                SELECT PEL.PRECO AS "PRECO FINAL" INTO l_preco_livro
                    FROM PRECOS_EDICOES_LIVROS PEL
                WHERE :old.DATA_HORA > PEL.DATA_INICIO AND PEL.ISBN = :old.isbn
                ORDER BY PEL.DATA_INICIO DESC
                FETCH FIRST ROW ONLY;

                SELECT CARTOES_CLIENTES.SALDO_ACUMULADO, CARTOES_CLIENTES.SALDO_ATUAL INTO l_saldo_acumulado, l_saldo_atual
                FROM CARTOES_CLIENTES
                WHERE :old.NIF_CLIENTE = NIF_CLIENTE;
                UPDATE CARTOES_CLIENTES
                SET SALDO_ACUMULADO = l_saldo_acumulado - l_preco_livro * :old.quantidade * 0.05
                WHERE NIF_CLIENTE = :old.NIF_CLIENTE;
                UPDATE CARTOES_CLIENTES
                SET SALDO_ATUAL = l_saldo_ATUAL - l_preco_livro * :old.quantidade * 0.05
                WHERE NIF_CLIENTE = :old.NIF_CLIENTE;
            end if;
        end if;

        IF INSERTING THEN
            IF (TO_NUMBER(TO_CHAR(:new.data_hora, 'd')) IN (3, 4)) THEN
                SELECT PEL.PRECO AS "PRECO FINAL" INTO l_preco_livro
                    FROM PRECOS_EDICOES_LIVROS PEL
                WHERE :new.DATA_HORA > PEL.DATA_INICIO AND PEL.ISBN = :new.isbn
                ORDER BY PEL.DATA_INICIO DESC
                FETCH FIRST ROW ONLY;

                SELECT CARTOES_CLIENTES.SALDO_ACUMULADO, CARTOES_CLIENTES.SALDO_ATUAL INTO l_saldo_acumulado, l_saldo_atual
                FROM CARTOES_CLIENTES
                WHERE :new.NIF_CLIENTE = NIF_CLIENTE;
                UPDATE CARTOES_CLIENTES
                SET SALDO_ACUMULADO = l_saldo_acumulado + l_preco_livro * :new.quantidade * 0.05
                WHERE NIF_CLIENTE = :new.NIF_CLIENTE;
                UPDATE CARTOES_CLIENTES
                SET SALDO_ATUAL = l_saldo_ATUAL + l_preco_livro * :new.quantidade * 0.05
                WHERE NIF_CLIENTE = :new.NIF_CLIENTE;
            end if;
        end if;
    end;


INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade)
     VALUES (18, 900800100, '500-1234666891', TO_DATE('2019-11-26 23:30','YYYY-MM-DD HH24:MI'),  2);

SELECT CARTOES_CLIENTES.*
FROM CARTOES_CLIENTES
WHERE CARTOES_CLIENTES.NIF_CLIENTE = 900800100;

SELECT PEL.PRECO AS "PRECO FINAL"
                    FROM PRECOS_EDICOES_LIVROS PEL
                WHERE TO_DATE('2019-11-12 23:30','YYYY-MM-DD HH24:MI') > PEL.DATA_INICIO AND PEL.ISBN = '500-1234666891'
                ORDER BY PEL.DATA_INICIO DESC
                FETCH FIRST ROW ONLY;

DELETE VENDAS
WHERE NR_VENDA = 18;