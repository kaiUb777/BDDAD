-- ** inserir dados nas tabelas **

-- ## tabela Automoveis ##
INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda) 
VALUES('45-PD-98', 'Mercedes', 2300, 2000, 34050);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('65-87-GR', 'Nissan', 1700, 2009, 23490.5);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)                  
VALUES('42-90-AS', 'Kia', 1300, 2008, 20870);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('BL-87-23', 'Volkswagen', 1100, 2017, 15600.75);                           

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)
VALUES('83-QD-27', 'BMW', 2100, 2014, 35600);

INSERT INTO automoveis(matricula, marca, cilindrada, ano_fabrico, preco_venda)   
VALUES('XO-65-98', 'Toyota', 2100, 2010, 15940.123456789);

-- ## tabela Clientes ##
INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Sérgio Conceição', 987345, 105098124, TO_DATE('1974-11-15', 'yyyy-mm-dd'));

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('António Oliveira', 937587, 104052455, TO_DATE('1952-10-06', 'yyyy-mm-dd'));  

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Fernando Santos', NULL, 102000906, TO_DATE('1954-10-10'));                

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Artur Jorge', 7098428, 100829087, TO_DATE('1946-12-13','yyyy-mm-dd'));    

INSERT INTO clientes(nome, nr_identificacao_civil, nif, data_nascimento)
VALUES('Jesualdo Ferreira', NULL, 107559969, TO_DATE('1946-05-24','yyyy-mm-dd')); 

-- ## tabela AutomoveisClientes ##
INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('65-87-GR', 1);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('83-QD-27', 5);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('42-90-AS', 2);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('45-PD-98', 1);

INSERT INTO automoveis_clientes(matricula, id_cliente)
VALUES('XO-65-98', 5);                                      

-- ## tabela Revisoes ##
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('65-87-GR', TO_TIMESTAMP('2018-10-04 09:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('83-QD-27', TO_TIMESTAMP('2018-11-04 14:45:00', 'yyyy-mm-dd hh24:mi:ss'));             

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', TO_TIMESTAMP('2018-10-23 10:50:00', 'yyyy-mm-dd hh24:mi:ss'));     

INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('XO-65-98', TO_TIMESTAMP('2018-12-01 18:30:00', 'yyyy-mm-dd hh24:mi:ss'), 'n');  

INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('65-87-GR', TO_TIMESTAMP('2015-06-07 10:50:00', 'yyyy-mm-dd hh24:mi:ss'), 'S');

INSERT INTO revisoes(matricula, data_hora_marcacao, efetuada)
VALUES('XO-65-98', TO_TIMESTAMP('2016-11-22 12:20:00', 'yyyy-mm-dd hh24:mi:ss'), 's');      