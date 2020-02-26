-- ** inserir dados nas tabelas **

-- ## tabela Marinheiros ##
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(22, 'Dustin',  7, 45);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(29, 'Brutus',  1, 33);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(31, 'Lubber',  8, 55);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(32, 'Andy',    8, 25);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(58, 'Rusty',  10, 35);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(64, 'Horácio', 7, 35);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(71, 'Zorba',  10, 16);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(74, 'Horácio', 9, 35);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(85, 'Art',     3, 25);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(95, 'Bob',     3, 63);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(13, 'Popeye',  3, 22);
INSERT INTO marinheiros(id_marinheiro, nome, classificacao, idade) VALUES(44, 'Haddock', 3, 63);

-- ## tabela Marinheiros ##
INSERT INTO barcos(id_barco, nome, cor) VALUES(101, 'Interlake', 'azul');
INSERT INTO barcos(id_barco, nome, cor) VALUES(102, 'Interlake', 'vermelho');
INSERT INTO barcos(id_barco, nome, cor) VALUES(103, 'Clipper',   'verde');
INSERT INTO barcos(id_barco, nome, cor) VALUES(104, 'Marine',    'vermelho');

-- ## tabela Reservas ##
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(22, 101, TO_DATE('2017/10/10','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(22, 102, TO_DATE('2017/10/10','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(22, 103, TO_DATE('2017/08/10','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(22, 104, TO_DATE('2017/07/10','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(31, 102, TO_DATE('2017/10/11','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(31, 103, TO_DATE('2017/06/11','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(31, 104, TO_DATE('2017/12/11','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(64, 101, TO_DATE('2017/05/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(64, 102, TO_DATE('2017/08/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(64, 102, TO_DATE('2017/09/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(64, 102, TO_DATE('2017/10/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(74, 103, TO_DATE('2017/08/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(44, 101, TO_DATE('2018/05/09','yyyy/mm/dd'));
INSERT INTO reservas(id_marinheiro, id_barco, data) VALUES(44, 101, TO_DATE('2018/09/09','yyyy/mm/dd'));