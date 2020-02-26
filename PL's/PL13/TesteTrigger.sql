--Script de testes

INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800101, '4200-197', 'Jose',   TO_DATE('12-12-2016', 'DD-MM-YYYY'), 'Rua Constituição 1350',   '931234561');
     
UPDATE Clientes
    SET data_nascimento = '12-12-2017'
WHERE nif_cliente = 900800101;

SELECT * FROM vendas;

INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 15, 900800100, '500-1234567891', TO_DATE('2017-02-02 15:30','YYYY-MM-DD HH24:MI'),  3);
     
-- Ex 5.4

-- Obter os registos incluindo o dia da semana

SELECT vendas.*, TO_CHAR(data_hora, 'd') dia_da_semana
    FROM vendas
WHERE TO_CHAR(data_hora, 'd') IN (1,7) OR TO_CHAR (data_hora, 'hh24') NOT BETWEEN 9 AND 18;

--Desativar o trigger
ALTER TRIGGER trgVendasImpedirAlteracoesForaExpediente DISABLE;

--Atualizar os registos
UPDATE vendas
    SET data_hora = CASE TO_CHAR(data_hora, 'd')
                        WHEN '7' THEN data_hora-1
                        WHEN '1' THEN data_hora-2
                    END
WHERE TO_CHAR(data_hora, 'd') IN (1,7);

--Ativar trigger
ALTER TRIGGER trgVendasImpedirAlteracoesForaExpediente ENABLE;

--Agora já não existem registos fora do horário de expediente nem ao fim de semana (desnecessário)
SELECT vendas.*, TO_CHAR(data_hora, 'd') dia_da_semana
    FROM vendas
WHERE TO_CHAR (data_hora,'d') IN (1,7) OR TO_CHAR(data_hora, 'hh24') NOT BETWEEN 9 AND 18;

--Ex 5.5

--Necessitamos de um registo de preço, vamos ver os registos existentes.
SELECT * FROM precos_edicoes_livros;

--Não é possível ELIMINAR um registo da tabela precos_edicoes_livros.
DELETE FROM precos_edicoes_livros
    WHERE isbn = '500-1234567891' AND data_incio = TO_DATE('2011-04-02', 'yyyy-mm-dd');
    
--Não é possível alterar preços de datas anteriores à atual
UPDATE precos_edicoes_livros
    SET preco = 30
WHERE isbn = '500-1234567891' AND data_inicio = TO_DATE('2011-04-02', 'yyyy-mm-dd');

-- Este registo é possível poirque a data é posterior à data atual.
INSERT INTO precos_edicoes_livros (isbn, data_inicio, preco)
VALUES ('500-1234567891', TO_DATE('2020-01-01', 'yyyy-mm-dd'), 20);