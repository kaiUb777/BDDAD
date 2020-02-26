-- ** alterar tabelas, adicionando campos **

-- ## tabela Revisoes ##

--1)    Eliminar a restrição de chave primária natural da tabela Revisoes; 
ALTER TABLE revisoes DROP CONSTRAINT pk_revisoes_matricula_data_hora_marcacao;

--2)    Adicionar o novo campo id_revisoes para armazenar valores inteiros positivos gerados automaticamente (auto-incrementados); 
ALTER TABLE revisoes ADD id_revisao INTEGER GENERATED AS IDENTITY; 

--3)    Especificar o novo campo id_revisoes como chave primária artificial;
ALTER TABLE revisoes ADD CONSTRAINT pk_revisoes_nr_revisao PRIMARY KEY(id_revisao);

--4)    Adicionar um registo com a mesma matricula e a data_hora_marcacao de outro registo;
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', TO_TIMESTAMP('2018/10/23 10:50:00', 'yyyy/mm/dd hh24:mi:ss'));

--5)    Verificar a presença do novo registo na tabela, violando a referida correspondência unívoca entre as chaves primárias, 
--      natural e artificial;
SELECT *
FROM revisoes
ORDER BY matricula;

--6)    Eliminar o registo adicionado anteriormente.
DELETE FROM revisoes WHERE id_revisao=7;

--7)	Resolver o problema indicado na alínea 5, adicionando uma restrição que garanta combinações únicas dos campos matricula 
--      e data_hora_marcacao;
ALTER TABLE revisoes ADD CONSTRAINT uk_revisoes_matricula_data_hora_marcacao UNIQUE(matricula, data_hora_marcacao);

--8)	Testar a nova restrição imposta, repetindo a alínea 4; --check
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', TO_TIMESTAMP('2018/10/23 10:50:00', 'yyyy/mm/dd hh24:mi:ss'));

--9)	Adicionar dois registos, um com valor NULL no campo matricula e outro com valor NULL no campo data_hora_marcacao;
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES(NULL, TO_TIMESTAMP('2018/10/23 10:50:00', 'yyyy/mm/dd hh24:mi:ss'));

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', NULL);

--10)	Verificar que os dois registos foram adicionados à tabela, violando a chave primária natural;
SELECT *
FROM revisoes
ORDER BY matricula;

--11)	Resolver o problema verificado, começando por eliminar os dois registos adicionados;
DELETE FROM revisoes 
WHERE data_hora_marcacao IS NULL OR matricula IS NULL;

--12)	Alterar novamente a tabela de modo a impedir o valor NULL nos campos matricula e data_hora_marcacao;
ALTER TABLE revisoes MODIFY matricula CONSTRAINT nn_revisoes_matricula NOT NULL; 

ALTER TABLE revisoes MODIFY data_hora_marcacao CONSTRAINT nn_data_hora_marcacao NOT NULL;
--13)	Repetir o passo 9 para verificar a resolução do problema com o NULL na chave primária natural.
INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES(NULL, TO_TIMESTAMP('2018/10/23 10:50:00', 'yyyy/mm/dd hh24:mi:ss'));

INSERT INTO revisoes(matricula, data_hora_marcacao)
VALUES('42-90-AS', NULL);

