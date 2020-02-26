-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE cd       CASCADE CONSTRAINTS PURGE;
DROP TABLE musicas  CASCADE CONSTRAINTS PURGE;
DROP TABLE editoras CASCADE CONSTRAINTS PURGE;

-- ## tabela Editores ##
CREATE TABLE editoras (
    id_editora  INTEGER     CONSTRAINT pk_editoras_id_editora PRIMARY KEY,
    nome        VARCHAR(20) CONSTRAINT nn_editoras_nome NOT NULL 
);

-- ## tabela CD ##
CREATE TABLE cd (
    cod_cd          INTEGER     CONSTRAINT pk_cd_cod PRIMARY KEY,
    id_editora      INTEGER,
    titulo          VARCHAR(40) CONSTRAINT nn_cd_titulo NOT NULL,
    data_compra     DATE,
    valor_pago      NUMERIC(5,2),
    local_compra    VARCHAR(20)
);

-- ## tabela Musicas ##
CREATE TABLE musicas (
    nr_musica   INTEGER,
    cod_cd      INTEGER,
    titulo      VARCHAR(40) CONSTRAINT nn_musicas_titulo NOT NULL,
    interprete  VARCHAR(30) CONSTRAINT nn_musicas_interprete NOT NULL,
    duracao     NUMERIC(5,2),                                               

    CONSTRAINT pk_musicas_nr_musica_cod_cd  PRIMARY KEY (cod_cd, nr_musica)
);

-- ** alterar tabelas para definição de chaves estrangeiras **
ALTER TABLE cd        ADD CONSTRAINT fk_cd_id_editora   FOREIGN KEY (cod_cd)  REFERENCES editoras(id_editora);
ALTER TABLE musicas   ADD CONSTRAINT fk_musicas_cod_cd  FOREIGN KEY (cod_cd)  REFERENCES cd(cod_cd);
