-- ** inserir dados inválidos **

--A.	 Tabela Automoveis
--1)	Registos com matrícula com formato inválido;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('AV-23-27', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('24-AV-27', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('23-28-AV', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('23-32-AV', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)   
VALUES('23-45-BB', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)   
VALUES('23-45-AV', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)   
VALUES('23-78-VA', 'Renault', 1100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('23-28-DD', 'Renault', 1100, 2009, 35600);

--2)	Registo com matrícula (chave primária) existente na tabela;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('45-PD-99', 'BMW', 2100, 2014, 35600);

--3)	Registo com matrícula NULL;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('LL-99-89', 'BMW', 2100, 2014, 35600);

--alternativa
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)             
VALUES('KK-99-88','BMW', 2100, 2014, 35600);

--4)	Registo com marca NULL;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-27', 'Mercedes', 2100, 2014, 35600);

--alternativa                                                                   
INSERT INTO automoveis(matricula, marca , cilindrada, ano_fabrico, preco_venda)        
VALUES('93-SC-20', 'BMW' ,2100, 2014, 35600);

--5)	Registos com cilindrada inválida;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-11', 'BMW', 2100, 2014, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-26', 'BMW', 3000, 2014, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-21', 'BMW', 2001, 2014, 35600);

--6)	Registos com ano_fabrico inválidos;
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-44', 'BMW', 2100, 2001, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('93-SC-00', 'BMW', 2100, 2009, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('11-SC-17', 'BMW', 2100, 2003, 35600);

--7)	Registos com preco_venda inválido.
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('00-SC-00', 'BMW', 2100, 2014, 10000.00);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('02-SC-00', 'BMW', 2100, 2014, 34567890.5);

--B.	Tabela Clientes
--1)	Registo com um id_cliente inexistente na tabela; 
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 870598, 105727913, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--2)	Registo com id_cliente (chave primária) NULL;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890140, 107559368, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--3)	Registo com nome NULL;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Bruno Silva', 890146, 107559369, TO_DATE('1995-08-28', 'yyyy-mm-dd'));

--4)	Registo com nr_identificacao_civil existente na tabela. Note que esta situação ocorre 
--      sempre com campos UNIQUE;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 937580, 107559444, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--5)	Registo(s) com nr_identificacao_civil inválido, excluindo o caso da alínea anterior;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890141, 107559366, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890142, 111111111, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--6)	Registo com nif existente na tabela;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 987341, 107559365, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--7)	Registo com nif NULL;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890199, 144444444, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--8)	Registo(s) com nif inválido, excluindo os casos das duas alíneas anteriores;
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890777, 250617307, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 111122, 250617302, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 777777, 107559388, TO_DATE('1954-06-24', 'yyyy-mm-dd'));

--9)	Registo(s) com data_nascimento inválida.
INSERT INTO clientes(nome, nr_identificwacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890146, 1075593692, TO_DATE('1954-16-24', 'yyyy-mm-dd'));

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jorge Jesus', 890146, 1075593692, TO_DATE('1954-02-30', 'yyyy-mm-dd'));     

--C.	Tabela Automoveis_Clientes
--1)	Registo com chave primária existente na tabela;
INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('65-GR-87', 1);

--2)	Registos com campo(s) NULL;
INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES(NULL, 1);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('65-GR-87', NULL);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES(NULL, NULL);

--3)	Registo(s) com id_cliente ou matricula inexistente na tabela Clientes ou Automoveis, respetivamente. 
--      Note que esta situação ocorre sempre com chaves estrangeiras.
INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('65-GR-87', 8);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('75-GR-87', 2);

--D.	Tabela Revisoes
--1)	Registo com chave primária existente na tabela;
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', TO_TIMESTAMP('2018-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'));

--2)	Registos com campo(s) NULL na chave primária;
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES(NULL, TO_TIMESTAMP('2018-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', NULL);

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES(NULL, NULL);

--3)	Registo com matricula inexistente na tabela Automoveis; 
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('28-90-AS', TO_TIMESTAMP('2020-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'));

--4)	Registos com o campo efetuada diferente de S e N, em maiúsculas e minúsculas;
INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('42-90-AS', TO_TIMESTAMP('2007-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'), 'x');

INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('42-90-AS', TO_TIMESTAMP('2007-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'), 'X');

--5)	Registo com o campo efetuada com valor NULL.
INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('42-90-AS', TO_TIMESTAMP('2007-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'), NULL);
