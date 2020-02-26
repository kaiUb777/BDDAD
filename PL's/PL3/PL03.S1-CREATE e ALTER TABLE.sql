-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE revisoes             CASCADE CONSTRAINTS PURGE;
DROP TABLE automoveis_clientes  CASCADE CONSTRAINTS PURGE;
DROP TABLE clientes             CASCADE CONSTRAINTS PURGE;
DROP TABLE automoveis           CASCADE CONSTRAINTS PURGE;

-- ** criar tabelas **
-- ## tabela Automoveis ##
CREATE TABLE automoveis (
    matricula       CHAR(8)         CONSTRAINT pk_automoveis_matricula      PRIMARY KEY,                            
    marca           VARCHAR(40)     CONSTRAINT nn_automoveis_marca          NOT NULL,
    cilindrada      INTEGER         CONSTRAINT nn_automoveis_cilindrada     NOT NULL
                                    CONSTRAINT ck_automoveis_cilindrada     CHECK(cilindrada BETWEEN 1000 AND 6000),
    ano_fabrico     INTEGER         CONSTRAINT nn_automoveis_ano_fabrico    NOT NULL 
                                    CONSTRAINT ck_automoveis_ano_fabrico    CHECK (ano_fabrico >= 2000 AND ano_fabrico < 2019),
    preco_venda     NUMERIC(10,2)   CONSTRAINT nn_automoveis_preco_venda    NOT NULL 
                                    CONSTRAINT ck_automoveis_preco_venda    CHECK (preco_venda>0),
                           
    CONSTRAINT ck_automoveis_matricula CHECK (REGEXP_LIKE(matricula, '^\d{2}-[A-Z]{2}-\d{2}$|^\d{2}-\d{2}-[A-Z]{2}$|^[A-Z]{2}-\d{2}-\d{2}$'))
    --alternativa
--    CONSTRAINT ck_automoveis_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}'))
);

-- ## tabela Clientes ##
CREATE TABLE Clientes (
    id_cliente              INTEGER GENERATED AS IDENTITY   CONSTRAINT pk_clientes_id_cliente               PRIMARY KEY,
    nome                    VARCHAR(40)                     CONSTRAINT nn_clientes_nome                     NOT NULL,
    nr_identificacao_civil  INTEGER                         CONSTRAINT ck_clientes_nr_identificacao_civil   CHECK(REGEXP_LIKE(nr_identificacao_civil, '^\d{6,}$'))
                                                            CONSTRAINT uk_clientes_nr_identificacao_civil   UNIQUE,
    nif                     INTEGER                         CONSTRAINT nn_clientes_nif                      NOT NULL
                                                            CONSTRAINT ck_clientes_nif                      CHECK(REGEXP_LIKE(nif, '^\d{9}$'))
                                                            CONSTRAINT uk_clientes_nif                      UNIQUE,
    data_nascimento         DATE                            CONSTRAINT nn_clientes_data_nascimento          NOT NULL
);

-- ## tabela AutomoveisClientes ##
CREATE TABLE automoveis_clientes (
    matricula   CHAR(8),
    id_cliente  INTEGER,
    
    CONSTRAINT pk_automoveis_clientes_matricula_id_cliente   PRIMARY KEY (matricula, id_cliente)
);

-- ## tabela Revisoes ##
CREATE TABLE revisoes (
                     
    matricula           CHAR(8),
    data_hora_marcacao  TIMESTAMP,
    efetuada            CHAR(1)                            DEFAULT 'N'
                                                           CONSTRAINT  ck_efetuada                         CHECK (REGEXP_LIKE(efetuada, 'S|N', 'i')) 
                                                           CONSTRAINT  nn_efetuada                         NOT NULL,  
    
    CONSTRAINT pk_revisoes_matricula_data_hora_marcacao     PRIMARY KEY (matricula, data_hora_marcacao)
                                 
);

-- ** alterar tabelas para definição de chaves estrangeiras **
-- ## tabela AutomoveisClientes ##
ALTER TABLE automoveis_clientes ADD CONSTRAINT fk_automoveis_clientes_matricula   FOREIGN KEY (matricula)  REFERENCES Automoveis (matricula);
ALTER TABLE automoveis_clientes ADD CONSTRAINT fk_automoveis_clientes_id_cliente  FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);
ALTER TABLE revisoes            ADD CONSTRAINT fk_revisoes_matricula              FOREIGN KEY (matricula)  REFERENCES Automoveis (matricula);

--se necessário por causa de problemas com o  REGEXP_LIKE
--ALTER SESSION SET NLS_SORT=BINARY;