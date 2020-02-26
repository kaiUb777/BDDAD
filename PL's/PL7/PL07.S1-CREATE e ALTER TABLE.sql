-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE codigos_postais          CASCADE CONSTRAINTS PURGE;
DROP TABLE especialidades           CASCADE CONSTRAINTS PURGE;
DROP TABLE medicamentos             CASCADE CONSTRAINTS PURGE;
DROP TABLE medicos                  CASCADE CONSTRAINTS PURGE;
DROP TABLE pacientes                CASCADE CONSTRAINTS PURGE;
DROP TABLE consultas                CASCADE CONSTRAINTS PURGE;
DROP TABLE medicamentos_receitados  CASCADE CONSTRAINTS PURGE;

-- ## tabela Especialidades ##
CREATE TABLE especialidades(
    id_especialidade INTEGER       CONSTRAINT pk_especialidades_id_especialidade PRIMARY KEY,
    designacao       VARCHAR2(20)  CONSTRAINT nn_especialidades_designacao       NOT NULL
);

-- ## tabela Medicos ##
CREATE TABLE medicos(
    id_medico         INTEGER       CONSTRAINT pk_medicos_id_medico         PRIMARY KEY,
    id_especialidade  INTEGER       CONSTRAINT nn_medicos_id_especialidade  NOT NULL,
    id_medico_chefe   INTEGER,       
    nome              VARCHAR2(20)  CONSTRAINT nn_medicos_nome              NOT NULL,
    hospital          VARCHAR2(20),

    data_nascimento   DATE          CONSTRAINT nn_medicos_data_nascimento   NOT NULL,
    cod_postal        VARCHAR(8)
    
);

-- ## tabela Pacientes ##
CREATE TABLE pacientes(
    id_paciente     INTEGER         CONSTRAINT pk_pacientes_id_paciente       PRIMARY KEY,
    nome            VARCHAR2(20)    CONSTRAINT nn_pacientes_nome              NOT NULL,
    data_nascimento DATE            CONSTRAINT nn_pacientes_data_nascimento   NOT NULL,
    cod_postal      VARCHAR(8)
);

-- ## tabela Consultas ## 
CREATE TABLE consultas(
    id_consulta INTEGER  CONSTRAINT pk_consultas_id_consultas  PRIMARY KEY,
    data_hora   DATE     CONSTRAINT nn_consultas_data_hora     NOT NULL,
    id_medico   INTEGER  CONSTRAINT nn_consultas_id_medico     NOT NULL,
    id_paciente INTEGER  CONSTRAINT nn_consultas_id_paciente   NOT NULL,
    CONSTRAINT uk_consultas_data_hora_id_medico UNIQUE (data_hora,id_medico)
);

-- ## tabela Medicamentos ##
CREATE TABLE medicamentos(
    id_medicamento   INTEGER       CONSTRAINT pk_medicamentos_id_medicamento PRIMARY KEY,
    nome             VARCHAR2(20)  CONSTRAINT nn_medicamentos_nome           NOT NULL,
    laboratorio      VARCHAR2(20)  CONSTRAINT nn_medicamentos_laboratorio    NOT NULL
);

-- ## tabela Medicamentos_Receitados ## 
CREATE TABLE medicamentos_receitados(
    id_consulta    INTEGER,
    id_medicamento INTEGER,
    CONSTRAINT pk_medicamentos_receitas_id_consulta_id_medicamento PRIMARY KEY (id_consulta, id_medicamento)
);

-- ## tabela Codigos_Postais ##
CREATE TABLE codigos_postais(
    cod_postal  VARCHAR(8)     CONSTRAINT pk_codigos_postais_cod_postal PRIMARY KEY
                               CONSTRAINT ck_codigos_postais_cod_postal CHECK( REGEXP_LIKE(cod_postal,'\d{4}-\d{3}') ),         
    localidade  VARCHAR2(20)   CONSTRAINT nn_codigos_postais_localidade NOT NULL    
);

-- ** alterar tabelas para definição de chaves estrangeiras **
ALTER TABLE medicos ADD CONSTRAINT fk_medicos_cod_postal       
                            FOREIGN KEY (cod_postal) REFERENCES codigos_postais (cod_postal);
ALTER TABLE medicos ADD CONSTRAINT fk_medicos_id_especialidade 
                            FOREIGN KEY (id_especialidade) REFERENCES especialidades (id_especialidade);
ALTER TABLE medicos ADD CONSTRAINT fk_medicos_id_medico_chefe       
                            FOREIGN KEY (id_medico_chefe) REFERENCES medicos (id_medico);

ALTER TABLE medicamentos_receitados ADD CONSTRAINT fk_medicamentos_receitados_id_consultas   
                                            FOREIGN KEY (id_consulta) REFERENCES consultas (id_consulta);
ALTER TABLE medicamentos_receitados ADD CONSTRAINT fk_medicamentos_receitados_id_medicamento 
                                            FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id_medicamento);

ALTER TABLE pacientes ADD CONSTRAINT fk_pacientes_cod_postal FOREIGN KEY (cod_postal)  REFERENCES codigos_postais (cod_postal);

ALTER TABLE consultas ADD CONSTRAINT fk_consultas_id_medico  FOREIGN KEY (id_medico)   REFERENCES medicos (id_medico);
ALTER TABLE consultas ADD CONSTRAINT fk_consultas_paciente   FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente);

--se necessário por causa de problemas com o  REGEXP_LIKE
--ALTER SESSION SET NLS_SORT=BINARY;