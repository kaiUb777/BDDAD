-- ** inserir dados nas tabelas **

-- ## tabela Codigo_Postais ##
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('2580-631', 'Alenquer');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('2720-465', 'Alverca');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4600-012', 'Amarante');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4750-264', 'Barcelos');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('2750-040', 'Cascais');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4445-622', 'Ermesinde');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4420-584', 'Gondomar');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4420-282', 'Gondomar');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('1500-103', 'Lisboa');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('1099-052', 'Lisboa');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('1070-204', 'Lisboa');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4470-208', 'Maia');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4450-718', 'Matosinhos');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4450-227', 'Matosinhos');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4454-510', 'Matosinhos');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('2781-902', 'Oeiras');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4200-197', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4100-079', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4100-217', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4200-058', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4150-706', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4350-043', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4050-078', 'Porto');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4490-567', 'Póvoa do Varzim');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4460-393', 'Senhora da Hora');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4440-501', 'Valongo');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4481-908', 'Vila do Conde');
INSERT INTO codigos_postais(cod_postal, localidade) VALUES ('4400-356', 'Vila Nova de Gaia');

-- ## tabela Especialidades ##
INSERT INTO especialidades(id_especialidade, designacao) VALUES (1, 'Pediatria');        
INSERT INTO especialidades(id_especialidade, designacao) VALUES (2, 'Cardiologia');      
INSERT INTO especialidades(id_especialidade, designacao) VALUES (3, 'Oftalmologia');     
INSERT INTO especialidades(id_especialidade, designacao) VALUES (4, 'Dermotologia');     

-- ## tabela Pacientes ##
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (1, 'Alfredo Gama',    TO_DATE('12-08-2003','dd-mm-yyyy'), '4454-510');
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (2, 'Cecília Mendes',  TO_DATE('31-10-2007','dd-mm-yyyy'), '4460-393');
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (3, 'Carolina Santos', TO_DATE('26-05-2013','dd-mm-yyyy'), '4460-393');
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (4, 'Daniela Seabra',  TO_DATE('05-06-2013','dd-mm-yyyy'), '4454-510');
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (5, 'Laura Barbosa',   TO_DATE('07-07-2000','dd-mm-yyyy'), '2750-040');
INSERT INTO pacientes(id_paciente, nome, data_nascimento, cod_postal) 
     VALUES (6, 'Paulo Barbosa',   TO_DATE('13-02-1953','dd-mm-yyyy'), '4460-393');

-- ## tabela Medicos ##
-- ** médicos chefe **
-- *** Hospital Pedro Hispano ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (1, 2, NULL, 'Abel Santos',   'Pedro Hispano', TO_DATE('05-09-1973','dd-mm-yyyy'), '4200-197');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (2, 1, NULL, 'Adriana Sousa', 'Pedro Hispano', TO_DATE('23-03-1970','dd-mm-yyyy'), '4481-908');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (3, 4, NULL, 'Adriano Reis',  'Pedro Hispano', TO_DATE('07-07-1963','dd-mm-yyyy'), '4445-622');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (4, 3, NULL, 'Carla Dias',    'Pedro Hispano', TO_DATE('28-02-1960','dd-mm-yyyy'), '4460-393');
-- *** Hospital Santa Maria ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (5, 2, NULL, 'António Coelho',   'Santa Maria', TO_DATE('02-02-1976','dd-mm-yyyy'), '1500-103');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (6, 1, NULL, 'Alvaro Dunas',     'Santa Maria', TO_DATE('15-06-1970','dd-mm-yyyy'), '1099-052');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (7, 4, NULL, 'Manuela Silva',    'Santa Maria', TO_DATE('01-01-1958','dd-mm-yyyy'), '1070-204');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (8, 3, NULL, 'António Oliveira', 'Santa Maria', TO_DATE('16-04-1956','dd-mm-yyyy'), '2580-631');
-- *** Hospital Santo António ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (9,  2, NULL, 'Catarina Dolores',  'Santo António', TO_DATE('09-11-1954','dd-mm-yyyy'), '4100-079');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (10, 1, NULL, 'Benjamim Mateus',   'Santo António', TO_DATE('12-12-1958','dd-mm-yyyy'), '4100-217');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (11, 4, NULL, 'Francisco Cardoso', 'Santo António', TO_DATE('11-09-1958','dd-mm-yyyy'), '4450-718');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (12, 3, NULL, 'Débora Brandão',    'Santo António', TO_DATE('05-06-1961','dd-mm-yyyy'), '4420-584');
-- *** Hospital São João ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (13, 2, NULL, 'Amélia Silva',   'São João', TO_DATE('17-05-1968','dd-mm-yyyy'), '4150-706');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (15, 4, NULL, 'Marcos Marcelo', 'São João', TO_DATE('28-05-1961','dd-mm-yyyy'), '4350-043');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal) 
     VALUES (16, 3, NULL, 'Nicolau Vieira', 'São João', TO_DATE('11-09-1968','dd-mm-yyyy'), '4600-012');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (26, 2, 13, 'Angelo Rodrigo',   'São João', TO_DATE('02-02-1973','dd-mm-yyyy'), '4420-282');

-- ** médicos não-chefe **
-- *** Hospital Pedro Hispano ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (17, 2, 1, 'Ana Moura',       'Pedro Hispano', TO_DATE('13-08-1985','dd-mm-yyyy'), '4454-510');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (18, 1, 2, 'Artur Rocha',     'Pedro Hispano', TO_DATE('25-01-1978','dd-mm-yyyy'), '4490-567');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (19, 4, 3, 'Cláudia Martins', 'Pedro Hispano', TO_DATE('17-05-1968','dd-mm-yyyy'), '4400-356');
-- *** Hospital Santa Maria ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (20, 2, 5, 'Carina Pinto',      'Santa Maria', TO_DATE('27-08-1980','dd-mm-yyyy'), '2750-040');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (21, 4, 7, 'Nelson Vitória',    'Santa Maria', TO_DATE('03-09-1961','dd-mm-yyyy'), '2781-902');
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (22, 3, 8, 'Patrícia Carvalho', 'Santa Maria', TO_DATE('12-03-1980','dd-mm-yyyy'), '2720-465');
-- *** Hospital Santo António ***
INSERT INTO medicos(id_medico, id_especialidade, id_medico_chefe, nome, hospital, data_nascimento, cod_postal)  
     VALUES (25, 3, 12, 'Mário Nascimento', 'Santo António', TO_DATE('13-03-1968','dd-mm-yyyy'), '4440-501');

-- ## tabela Consultas ##
-- ** Paciente Alfredo Gama **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (1, TO_TIMESTAMP('25-09-2009 10:10', 'dd-mm-yyyy hh24:mi'), 2, 1);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (2, TO_TIMESTAMP('03-09-2012 14:30', 'dd-mm-yyyy hh24:mi'), 2, 1);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (3, TO_TIMESTAMP('12-05-2016 15:00', 'dd-mm-yyyy hh24:mi'), 2, 1);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (4, TO_TIMESTAMP('23-09-2019 10:30', 'dd-mm-yyyy hh24:mi'), 2, 1);
-- ** Paciente Cecília Mendes **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (5, TO_TIMESTAMP('08-03-2016 15:30', 'dd-mm-yyyy hh24:mi'), 17, 2);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (6, TO_TIMESTAMP('23-09-2019 15:30', 'dd-mm-yyyy hh24:mi'), 18, 2);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (7, TO_TIMESTAMP('28-09-2019 15:30', 'dd-mm-yyyy hh24:mi'), 19, 2);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (8, TO_TIMESTAMP('25-09-2019 15:30', 'dd-mm-yyyy hh24:mi'),  4, 2);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (9, TO_TIMESTAMP('07-10-2019 10:30', 'dd-mm-yyyy hh24:mi'), 18, 2);
-- ** Paciente Carolina Santos **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (10, TO_TIMESTAMP('15-03-2018 16:30', 'dd-mm-yyyy hh24:mi'),  1, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (11, TO_TIMESTAMP('10-10-2018 09:30', 'dd-mm-yyyy hh24:mi'), 17, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (12, TO_TIMESTAMP('10-10-2018 12:30', 'dd-mm-yyyy hh24:mi'),  2, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (13, TO_TIMESTAMP('10-10-2018 14:00', 'dd-mm-yyyy hh24:mi'),  3, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (14, TO_TIMESTAMP('11-10-2018 10:00', 'dd-mm-yyyy hh24:mi'),  4, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (15, TO_TIMESTAMP('12-10-2018 16:30', 'dd-mm-yyyy hh24:mi'), 19, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (16, TO_TIMESTAMP('07-10-2019 11:30', 'dd-mm-yyyy hh24:mi'), 18, 3);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (17, TO_TIMESTAMP('07-10-2019 14:00', 'dd-mm-yyyy hh24:mi'), 19, 3);
-- ** Paciente Daniela Seabra **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (18, TO_TIMESTAMP('05-05-2018 16:00', 'dd-mm-yyyy hh24:mi'),  1, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (19, TO_TIMESTAMP('09-10-2018 10:30', 'dd-mm-yyyy hh24:mi'),  1, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (20, TO_TIMESTAMP('10-10-2018 14:30', 'dd-mm-yyyy hh24:mi'),  2, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (21, TO_TIMESTAMP('10-10-2018 15:00', 'dd-mm-yyyy hh24:mi'),  3, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (22, TO_TIMESTAMP('11-10-2018 11:00', 'dd-mm-yyyy hh24:mi'),  4, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (23, TO_TIMESTAMP('13-10-2018 15:30', 'dd-mm-yyyy hh24:mi'), 19, 4);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (24, TO_TIMESTAMP('08-10-2019 11:30', 'dd-mm-yyyy hh24:mi'), 18, 4);
-- ** Paciente Laura Barbosa **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (25, TO_TIMESTAMP('15-03-2014 16:30', 'dd-mm-yyyy hh24:mi'),  5, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (26, TO_TIMESTAMP('10-10-2018 09:30', 'dd-mm-yyyy hh24:mi'), 20, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (27, TO_TIMESTAMP('15-09-2019 16:00', 'dd-mm-yyyy hh24:mi'),  5, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (28, TO_TIMESTAMP('05-10-2019 09:00', 'dd-mm-yyyy hh24:mi'), 20, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (29, TO_TIMESTAMP('10-10-2018 12:30', 'dd-mm-yyyy hh24:mi'),  6, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (30, TO_TIMESTAMP('07-10-2019 11:30', 'dd-mm-yyyy hh24:mi'),  6, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (31, TO_TIMESTAMP('01-09-2019 14:00', 'dd-mm-yyyy hh24:mi'),  7, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (32, TO_TIMESTAMP('08-10-2018 16:30', 'dd-mm-yyyy hh24:mi'), 21, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (34, TO_TIMESTAMP('08-08-2019 12:00', 'dd-mm-yyyy hh24:mi'), 21, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (33, TO_TIMESTAMP('11-10-2018 10:00', 'dd-mm-yyyy hh24:mi'),  8, 5);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (35, TO_TIMESTAMP('05-10-2019 14:00', 'dd-mm-yyyy hh24:mi'), 22, 5);
-- ** Paciente Paulo Barbosa **
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (37, TO_TIMESTAMP('11-11-2010 14:30', 'dd-mm-yyyy hh24:mi'), 13, 6);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (38, TO_TIMESTAMP('22-08-2015 09:30', 'dd-mm-yyyy hh24:mi'), 15, 6);
INSERT INTO consultas(id_consulta, data_hora, id_medico, id_paciente) 
     VALUES (39, TO_TIMESTAMP('15-04-2016 14:00', 'dd-mm-yyyy hh24:mi'), 13, 6);

-- ## tabela Medicamentos ##
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (1, 'Aspirina',  'Bayer');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (2, 'Voltaren',  'Novartis');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (3, 'Aspegic',   'Infarmed');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (4, 'Kompensan', 'Infarmed');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (5, 'Benuron',   'Infarmed');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (6, 'Xanax',     'Pfizer');
INSERT INTO medicamentos(id_medicamento, nome, laboratorio) VALUES (7, 'Risidon',   'Infarmed');

-- ## tabela Medicamentos_Receitados ##
-- ** Consulta 1 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (1, 1); 
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (1, 3); 
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (1, 2); 
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (1, 4); 
-- ** Consulta 2 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (2, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (2, 4);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (2, 5); 
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (2, 3);
-- ** Consulta 3 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (3, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (3, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (3, 5);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (3, 4);
-- ** Consulta 4 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (4, 4);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (4, 5);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (4, 7);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (4, 6);
-- ** Consulta 5 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (5, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (5, 2);
-- ** Consulta 6 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (6, 1);
-- ** Consulta 7 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (7, 2);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (7, 3);
-- ** Consulta 9 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (9, 2);
-- ** Consulta 10 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (10, 4);
-- ** Consulta 12 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (12, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (12, 2);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (12, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (12, 4);
-- ** Consulta 16 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (16, 3);
-- ** Consulta 20 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (20, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (20, 2);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (20, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (20, 4);
-- ** Consulta 21 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (21, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (21, 2);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (21, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (21, 4);
-- ** Consulta 22 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (22, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (22, 4);
-- ** Consulta 24 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (24, 2);
-- ** Consulta 25 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (25, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (25, 2);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (25, 3);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (25, 4);
-- ** Consulta 29 **
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (29, 1);
INSERT INTO medicamentos_receitados(id_consulta, id_medicamento) VALUES (29, 2);
