-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE marinheiros  CASCADE CONSTRAINTS PURGE;
DROP TABLE barcos       CASCADE CONSTRAINTS PURGE;
DROP TABLE reservas     CASCADE CONSTRAINTS PURGE;

-- ## tabela Marinheiros ##
CREATE TABLE marinheiros(
  id_marinheiro 	INTEGER 	CONSTRAINT pk_marinheiros_id_marinheiro PRIMARY KEY,
  nome 	            VARCHAR(30)	CONSTRAINT nn_marinheiros_nome          NOT NULL,
  classificacao 	INTEGER		CONSTRAINT nn_marinheiros_classificacao NOT NULL,
  idade 		    INTEGER	    CONSTRAINT nn_marinheiros_idade         NOT NULL
);

-- ## tabela Barcos ##
CREATE TABLE barcos(
  id_barco 	INTEGER     CONSTRAINT pk_barcos_id_barcos 	PRIMARY KEY,
  nome      VARCHAR(20) CONSTRAINT nn_barcos_nome       NOT NULL,
  cor       VARCHAR(10) CONSTRAINT nn_barcos_cor        NOT NULL
);

-- ## tabela Reservas ##
CREATE TABLE reservas(
  id_marinheiro INTEGER,
  id_barco 	    INTEGER,
  data 	        DATE        CONSTRAINT nn_reservas_data  NOT NULL, 
  CONSTRAINT pk_reservas_id_marinheiro_id_barco PRIMARY KEY(id_marinheiro, id_barco, data)
);

-- ** alterar tabelas para definição de chaves estrangeiras **
ALTER TABLE reservas ADD CONSTRAINT fk_reservas_id_marinheiro   FOREIGN KEY (id_marinheiro) REFERENCES marinheiros(id_marinheiro);
ALTER TABLE reservas ADD CONSTRAINT fk_reservas_id_barco        FOREIGN KEY (id_barco)      REFERENCES barcos(id_barco);