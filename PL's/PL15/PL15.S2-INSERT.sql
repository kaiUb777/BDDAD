-- ** inserir dados nas tabelas **

-- ## tabela Autores ##
INSERT INTO autores(id_autor, nome) VALUES (100, 'John');
INSERT INTO autores(id_autor, nome) VALUES (101, 'Sofia');
INSERT INTO autores(id_autor, nome) VALUES (102, 'Sócrates');
INSERT INTO autores(id_autor, nome) VALUES (103, 'Gabriel');
INSERT INTO autores(id_autor, nome) VALUES (104, 'Judite');
INSERT INTO autores(id_autor, nome) VALUES (105, 'Steven Feuerstein');
INSERT INTO autores(id_autor, nome) VALUES (106, 'Bill Pribyl');
INSERT INTO autores(id_autor, nome) VALUES (107, 'Luís Damas');
INSERT INTO autores(id_autor, nome) VALUES (108, 'Feliz Gouveia');
INSERT INTO autores(id_autor, nome) VALUES (109, 'Thomas Connolly');
INSERT INTO autores(id_autor, nome) VALUES (110, 'Carolyn Begg');
INSERT INTO autores(id_autor, nome) VALUES (111, 'Deborah Perry Piscione');

-- ## tabela Categorias ##
INSERT INTO categorias(id_categoria, designacao) VALUES (1, 'Economia');
INSERT INTO categorias(id_categoria, designacao) VALUES (2, 'Filosofia');
INSERT INTO categorias(id_categoria, designacao) VALUES (3, 'História');
INSERT INTO categorias(id_categoria, designacao) VALUES (4, 'Informática');

-- ## tabela Codigos_Postais ##
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4200-197', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4460-393', 'Senhora da Hora');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4450-282', 'Matosinhos');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4420-601', 'Gondomar');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4445-273', 'Ermesinde');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4444-909', 'Valongo');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4500-527', 'Espinho');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4400-129', 'Vila Nova de Gaia');

-- ## tabela Clientes ##
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800100, '4200-197', 'Jose',   TO_DATE('12-12-1975', 'DD-MM-YYYY'), 'Rua Constituição 1350',   '931234561');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800200, '4460-393', 'Maria',  TO_DATE('02-07-1980', 'DD-MM-YYYY'), 'Rua Mendonça 137',        '911223347');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800300, '4400-129', 'Rui',    TO_DATE('25-10-1961', 'DD-MM-YYYY'), 'Rua Sá Carneiro 12',      '961238976');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800400, '4444-909', 'Joana',  TO_DATE('31-03-1970', 'DD-MM-YYYY'), 'Rua da Liberdade 328',    '931239229');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800500, '4450-282', 'Ana',    TO_DATE('28-02-1950', 'DD-MM-YYYY'), 'Avenida Serpa Pinto 120', '931239987');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800600, '4420-601', 'Sofia',  TO_DATE('30-04-1955', 'DD-MM-YYYY'), 'Rua Sport Clube 500',     '911239546');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800700, '4445-273', 'João',   TO_DATE('11-05-1990', 'DD-MM-YYYY'), 'Rua Cidade Ermesinde 20', '931277755');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800800, '4444-909', 'Paulo',  TO_DATE('06-06-1978', 'DD-MM-YYYY'), 'Rua da Liberdade 400',    '961239711');
INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel) 
     VALUES (900800900, '4500-527', 'Carlos', TO_DATE('31-03-1982', 'DD-MM-YYYY'), 'Rua de Carvalhelhos 22',  '922267857');

-- ## tabela Cartoes_Clientes ##
INSERT INTO cartoes_clientes(nr_cartao, nif_cliente, data_adesao, saldo_atual, saldo_acumulado) 
     VALUES (1000, 900800100, TO_DATE('04-11-2000', 'DD-MM-YYYY'), 20, 200);
INSERT INTO cartoes_clientes(nr_cartao, nif_cliente, data_adesao, saldo_atual, saldo_acumulado) 
     VALUES (1100, 900800900, TO_DATE('08-04-2010', 'DD-MM-YYYY'), 10, 10);

-- ## tabela Paises ##
INSERT INTO paises(cod_pais, nome) VALUES ('DE','Alemanha');
INSERT INTO paises(cod_pais, nome) VALUES ('BR','Brasil');
INSERT INTO paises(cod_pais, nome) VALUES ('US','Estados Unidos da América');
INSERT INTO paises(cod_pais, nome) VALUES ('ES','Espanha');
INSERT INTO paises(cod_pais, nome) VALUES ('FR','França');
INSERT INTO paises(cod_pais, nome) VALUES ('PT','Portugal');
INSERT INTO paises(cod_pais, nome) VALUES ('GB','Reino Unido');
INSERT INTO paises(cod_pais, nome) VALUES ('GR','Grécia');

-- ## tabela Nacionalidades_Autores ##
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (100, 'US');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (101, 'PT');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (102, 'GR');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (103, 'BR');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (103, 'PT');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (104, 'PT');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (105, 'US');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (106, 'US');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (107, 'PT');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (108, 'PT');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (109, 'GB');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (110, 'GB');
INSERT INTO nacionalidades_autores(id_autor, cod_pais) VALUES (111, 'US');

-- ## tabela Editoras ##
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1400, 'Livros do Brasil', 'BR');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1500, 'Bertrand', 'PT');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1600, 'McGraw-Hill', 'US');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1700, 'Prentice Hall', 'US');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1800, 'O''Reilly', 'US');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (1900, 'FCA', 'PT');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (2000, 'Pearson', 'GB');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (2100, 'Addison-Wesley', 'US');
INSERT INTO editoras(id_editora, nome, cod_pais) VALUES (2200, 'St. Martin''s Griffin', 'US');

-- ## tabela Livros ##
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (200, 2, 'Ética');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (201, 1, 'Secrets of Silicon Valley');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (202, 1, 'Bitcoins');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (203, 4, 'Oracle PL/SQL Programming');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (204, 2, 'Existencialismo');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (205, 4, 'Database Systems');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (206, 2, 'Lógica');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (207, 1, 'Empreendedorismo');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (208, 4, 'Fundamentos de Bases de Dados');
INSERT INTO livros(id_livro, id_categoria, titulo) VALUES (209, 4, 'SQL');

-- ## tabela Idiomas ##
INSERT INTO idiomas(cod_idioma, designacao) VALUES ('PT', 'Português');
INSERT INTO idiomas(cod_idioma, designacao) VALUES ('EN', 'Inglês');
INSERT INTO idiomas(cod_idioma, designacao) VALUES ('FR', 'Francês');
INSERT INTO idiomas(cod_idioma, designacao) VALUES ('ES', 'Espanhol');

-- ## tabela Edicoes_Livros ##
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234567891', 200, 1500,  1, 'PT',  4, 2011,  2,  5);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-1137279170', 201, 2200,  1, 'EN',  8, 2015, 15, 18);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1211111191', 202, 1600,  1, 'EN',  2, 2018, 30, 40);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-1449777452', 203, 1800,  6, 'EN',  2, 2015, 10, 12);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234447891', 204, 1500,  2, 'PT',  2, 2000, 20, 30);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234222891', 205, 2000,  6, 'EN',  1, 2015, 10, 15);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234666891', 206, 1500,  2, 'PT',  2, 2016, 20, 30);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234567991', 207, 1500,  1, 'PT',  2, 2016, 10, 12);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234555891', 200, 1500,  2, 'PT',  2, 2016, 10, 20);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234533891', 207, 1500,  2, 'PT',  9, 2019, 20, 40);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1234522891', 205, 2100,  2, 'EN',  2, 2000, 10, 10);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-0596556464', 203, 1800,  3, 'EN', 10, 2010, 30, 31);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-0596003814', 203, 1800,  4, 'EN', 10, 2003, 10, 12);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('500-1277777891', 207, 1500,  3, 'PT',  2, 2016, 20, 30);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-9727227990', 208, 1900,  1, 'PT',  9, 2015, 10, 15);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-9727228394', 209, 1900, 14, 'PT',  6, 2018, 20, 25);
INSERT INTO edicoes_livros(isbn, id_livro, id_editora, nr_edicao, cod_idioma, mes_edicao, ano_edicao, stock_min, stock) 
     VALUES ('978-9727224432', 209, 1900,  2, 'PT',  6, 2006,  5,  5);

-- ## tabela Autores_Edicoes_Livros ##
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234567891', 102);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234567891', 103);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-1137279170', 111);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1211111191', 101);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-1449777452', 105);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-1449777452', 106);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-0596556464', 105);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-0596003814', 105);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-0596003814', 106);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234447891', 102);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234222891', 109);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234222891', 110);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234522891', 109);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234522891', 110);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234666891', 104);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234567991', 103);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1234533891', 103);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('500-1277777891', 103);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-9727227990', 108);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-9727228394', 107);
INSERT INTO autores_edicoes_livros(isbn, id_autor) VALUES ('978-9727224432', 107);

-- ## tabela Vendas ##
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 1, 900800100, '500-1234567891', TO_DATE('2017-02-02 15:30','YYYY-MM-DD HH24:MI'),  3);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 2, 900800200, '500-1234567891', TO_DATE('2017-03-02 11:20','YYYY-MM-DD HH24:MI'), 10);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 3, 900800100, '978-1137279170', TO_DATE('2017-12-02 22:45','YYYY-MM-DD HH24:MI'),  5);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 4, 900800300, '500-1234222891', TO_DATE('2019-02-02 21:10','YYYY-MM-DD HH24:MI'),  3);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 5, 900800300, '500-1234666891', TO_DATE('2019-02-12 23:35','YYYY-MM-DD HH24:MI'),  3);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 6, 900800100, '978-1137279170', TO_DATE('2018-02-02 09:12','YYYY-MM-DD HH24:MI'),  2);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 7, 900800100, '500-1277777891', TO_DATE('2018-02-02 12:05','YYYY-MM-DD HH24:MI'),  1);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 8, 900800200, '500-1234567891', TO_DATE('2017-04-02 10:00','YYYY-MM-DD HH24:MI'),  4);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES ( 9, 900800300, '500-1234567891', TO_DATE('2017-05-02 13:00','YYYY-MM-DD HH24:MI'),  5);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES (10, 900800200, '500-1234567891', TO_DATE('2017-10-02 12:00','YYYY-MM-DD HH24:MI'),  3);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES (11, 900800300, '500-1234222891', TO_DATE('2019-09-02 22:15','YYYY-MM-DD HH24:MI'),  2);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES (12, 900800300, '500-1234666891', TO_DATE('2019-07-12 23:30','YYYY-MM-DD HH24:MI'),  1);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES (13, 900800300, '500-1234567891', TO_DATE('2017-09-02 22:15','YYYY-MM-DD HH24:MI'),  2);
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade) 
     VALUES (14, 900800300, '500-1234567891', TO_DATE('2017-07-12 23:30','YYYY-MM-DD HH24:MI'),  1);

-- ## tabela Precos_Edicoes_Livros ##
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234555891', TO_DATE('2016-12-10','YYYY-MM-DD'), 20.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234555891', TO_DATE('2018-04-15','YYYY-MM-DD'), 25.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234567891', TO_DATE('2013-01-01','YYYY-MM-DD'), 15.80);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234567891', TO_DATE('2015-01-01','YYYY-MM-DD'), 12.50);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234567891', TO_DATE('2017-01-01','YYYY-MM-DD'), 10.90);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-1137279170', TO_DATE('2015-10-01','YYYY-MM-DD'), 20.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-1137279170', TO_DATE('2017-12-01','YYYY-MM-DD'), 15.90);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1211111191', TO_DATE('2018-04-01','YYYY-MM-DD'), 15.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-1449777452', TO_DATE('2016-06-10','YYYY-MM-DD'), 60.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-1449777452', TO_DATE('2019-09-01','YYYY-MM-DD'), 70.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-0596556464', TO_DATE('2011-10-01','YYYY-MM-DD'), 60.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('978-0596556464', TO_DATE('2015-10-01','YYYY-MM-DD'), 50.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('978-0596003814', TO_DATE('2003-11-01','YYYY-MM-DD'), 50.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('978-0596003814', TO_DATE('2004-12-11','YYYY-MM-DD'), 40.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('500-1234666891', TO_DATE('2016-04-10','YYYY-MM-DD'), 30.50);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234447891', TO_DATE('2011-12-12','YYYY-MM-DD'), 25.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234222891', TO_DATE('2017-08-12','YYYY-MM-DD'), 25.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234522891', TO_DATE('2001-07-09','YYYY-MM-DD'), 15.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234567991', TO_DATE('2015-03-09','YYYY-MM-DD'), 20.50);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1234533891', TO_DATE('2019-10-09','YYYY-MM-DD'), 25.50);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('500-1277777891', TO_DATE('2017-12-19','YYYY-MM-DD'), 25.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-9727227990', TO_DATE('2016-05-08','YYYY-MM-DD'), 30.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-9727228394', TO_DATE('2018-07-07','YYYY-MM-DD'), 30.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-9727224432', TO_DATE('2006-10-10','YYYY-MM-DD'), 20.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-9727224432', TO_DATE('2011-10-10','YYYY-MM-DD'), 15.00);
INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco) 
     VALUES ('978-9727224432', TO_DATE('2016-10-10','YYYY-MM-DD'), 12.50);
     
-- ** alterações realizadas no exercício anterior
ALTER TABLE precos_edicoes_livros add data_hora DATE;

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco, data_hora) 
     VALUES ('500-1234567891', TO_DATE('2020-02-01','YYYY-MM-DD'), 22, TO_DATE('2019-10-27 14:38:56','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco, data_hora) 
     VALUES ('500-1234567891', TO_DATE('2020-03-01','YYYY-MM-DD'), 25, TO_DATE('2019-10-27 14:40: 39','YYYY-MM-DD HH24:MI:SS'));

-- ** confirmar todas as alterações da BD para as tornar permanentes **
COMMIT;