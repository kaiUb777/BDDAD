-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE clientes                 CASCADE CONSTRAINTS PURGE;
DROP TABLE codigos_postais          CASCADE CONSTRAINTS PURGE;
DROP TABLE cartoes_clientes         CASCADE CONSTRAINTS PURGE;
DROP TABLE vendas                   CASCADE CONSTRAINTS PURGE;
DROP TABLE livros                   CASCADE CONSTRAINTS PURGE;
DROP TABLE categorias               CASCADE CONSTRAINTS PURGE;
DROP TABLE edicoes_Livros           CASCADE CONSTRAINTS PURGE;
DROP TABLE idiomas                  CASCADE CONSTRAINTS PURGE;
DROP TABLE autores                  CASCADE CONSTRAINTS PURGE;
DROP TABLE autores_edicoes_livros   CASCADE CONSTRAINTS PURGE;
DROP TABLE nacionalidades_autores   CASCADE CONSTRAINTS PURGE;
DROP TABLE paises                   CASCADE CONSTRAINTS PURGE;
DROP TABLE editoras                 CASCADE CONSTRAINTS PURGE;
DROP TABLE precos_edicoes_livros    CASCADE CONSTRAINTS PURGE;

-- ## tabela Clientes ##
CREATE TABLE clientes (
    nif_cliente     NUMERIC(9)  CONSTRAINT pk_clientes_nif_cliente PRIMARY KEY,
    cod_postal      CHAR(8)     CONSTRAINT nn_clientes_cod_postal NOT NULL,    
    nome            VARCHAR(60) CONSTRAINT nn_clientes_nome NOT NULL,
    data_nascimento DATE,
    morada          VARCHAR(50) CONSTRAINT nn_clientes_morada NOT NULL,
    nr_telemovel    NUMERIC(9)  CONSTRAINT ck_clientes_nr_telemovel CHECK(REGEXP_LIKE(nr_telemovel, '^\d{9}$'))
);

-- ## tabela CodigosPostais ##
CREATE TABLE codigos_postais (
    cod_postal CHAR(8)      CONSTRAINT pk_codigos_postais_cod_postal PRIMARY KEY,
    localidade VARCHAR(25)  CONSTRAINT nn_codigos_postais_localidade NOT NULL,
    CONSTRAINT ck_codigos_postais_cod_postal CHECK(REGEXP_LIKE(cod_postal, '^\d{4}-\d{3}$'))
);

-- ## tabela CartoesClientes ##
CREATE TABLE cartoes_clientes (
    nr_cartao       INTEGER         CONSTRAINT pk_cartoes_clientes_nr_cartao PRIMARY KEY,
    nif_cliente     NUMERIC(9)      CONSTRAINT nn_cartoes_clientes_nif NOT NULL
                                    CONSTRAINT ck_cartoes_clientes_nif CHECK(REGEXP_LIKE(nif_cliente, '^\d{9}$'))
                                    CONSTRAINT uk_cartoes_clientes UNIQUE,
    data_adesao     DATE            CONSTRAINT nn_cartoes_clientes_data_adesao NOT NULL,
    saldo_atual     NUMERIC(5,2),
    saldo_acumulado NUMERIC(10,2)
);

-- ## tabela Vendas ##
CREATE TABLE vendas (
    nr_venda    INTEGER     CONSTRAINT pk_vendas_nr_venda PRIMARY KEY,
    nif_cliente INTEGER     CONSTRAINT nn_vendas_nif_cliente NOT NULL,
    isbn        CHAR(14)    CONSTRAINT nn_vendas_isbn NOT NULL,
    data_hora   DATE        CONSTRAINT nn_vendas_data_hora NOT NULL,
    quantidade  INTEGER     CONSTRAINT nn_vendas_quantidade NOT NULL
);

-- ## tabela Livros ##
CREATE TABLE livros (
    id_livro        INTEGER     CONSTRAINT pk_livros_id_livro PRIMARY KEY,
    id_categoria    INTEGER     CONSTRAINT nn_livros_id_categoria NOT NULL,
    titulo          VARCHAR(50) CONSTRAINT nn_livros_titulo NOT NULL
);

-- ## tabela Categorias ##
CREATE TABLE categorias (
    id_categoria    INTEGER     CONSTRAINT pk_categorias_id_categoria PRIMARY KEY,
    designacao      VARCHAR(20) CONSTRAINT nn_categorias_designacao NOT NULL
);

-- ## tabela EdicoesLivros ##
CREATE TABLE edicoes_Livros (
    isbn            CHAR(14)            CONSTRAINT pk_edicoes_livros_isbn PRIMARY KEY,
    id_livro        INTEGER             CONSTRAINT nn_edicoes_livros_id_livro NOT NULL,
    id_editora      INTEGER             CONSTRAINT nn_edicoes_livros_id_editora NOT NULL,
    nr_edicao       INTEGER             CONSTRAINT nn_edicoes_livros_nr_edicao NOT NULL,
    cod_idioma      CHAR(2)             CONSTRAINT nn_edicoes_livros_cod_idioma NOT NULL,
    mes_edicao      NUMERIC(2)          CONSTRAINT nn_edicoes_livros_mes_edicao NOT NULL
                                        CONSTRAINT ck_edicoes_livros_mes_edicao CHECK(mes_edicao BETWEEN 1 AND 12),
    ano_edicao      NUMERIC(4)          CONSTRAINT nn_edicoes_livros_ano_edicao NOT NULL,
    stock_min       INTEGER DEFAULT 10  CONSTRAINT nn_edicoes_livros_stock_min NOT NULL,
    stock           INTEGER             CONSTRAINT nn_edicoes_livros_stock NOT NULL,
    CONSTRAINT ck_edicoes_livros_isbn CHECK(REGEXP_LIKE(isbn, '^\d{3}-\d{10}$'))
);

-- ## tabela Idiomas ##
CREATE TABLE idiomas (
    cod_idioma   CHAR(2)        CONSTRAINT pk_idiomas_cod_idioma PRIMARY KEY,
    designacao   VARCHAR(20)    CONSTRAINT nn_idiomas_designacao NOT NULL
);   

-- ## tabela Autores ##
CREATE TABLE autores (
    id_autor   INTEGER       CONSTRAINT pk_autores_id_autor PRIMARY KEY,
    nome       VARCHAR(35)   CONSTRAINT nn_autores_nome NOT NULL
);

-- ## tabela AutoresEdicoesLivros ##
CREATE TABLE autores_edicoes_livros (
    isbn        CHAR(14),
    id_autor    INTEGER,
    CONSTRAINT pk_autores_edicoes_livros_isbn_id_autor PRIMARY KEY (isbn, id_autor)
);

-- ## tabela NacionalidadesAutores ##
CREATE TABLE nacionalidades_autores (
    id_autor    INTEGER,
    cod_pais    CHAR(2),
    CONSTRAINT pk_nacionalidades_autores_id_autor_cod_pais PRIMARY KEY(id_autor,cod_pais)
);

-- ## tabela Paises ##
CREATE TABLE paises (
    cod_pais    CHAR(2)     CONSTRAINT pk_paises_cod_pais PRIMARY KEY,
    nome        VARCHAR(30) CONSTRAINT nn_paises_nome NOT NULL
);

-- ## tabela Editoras ##
CREATE TABLE editoras ( 
    id_editora  INTEGER     CONSTRAINT pk_editoras_id_editora PRIMARY KEY,
    nome        VARCHAR(35) CONSTRAINT nn_editoras_nome NOT NULL,
    cod_pais    CHAR(2)     CONSTRAINT nn_editoras_cod_pais NOT NULL
);

-- ## tabela PrecosEdicoesLivros ##
CREATE TABLE precos_edicoes_livros (
    isbn        CHAR(14),
    data_inicio DATE            CONSTRAINT nn_precos_edicoes_livros_data_inicio NOT NULL,
    preco       NUMERIC(5,2)    CONSTRAINT nn_precos_edicoes_livros_preco NOT NULL
                                CONSTRAINT ck_precos_edicoes_livros_preco CHECK(preco>0),
    CONSTRAINT pk_precos_edicoes_livros_isbn_data_inicio PRIMARY KEY (isbn, data_inicio)
);

-- ** alterar tabelas para definição de chaves estrangeiras **
ALTER TABLE clientes                ADD CONSTRAINT fk_clientes_cod_postal               FOREIGN KEY (cod_postal)    REFERENCES codigos_postais(cod_postal);
ALTER TABLE cartoes_clientes        ADD CONSTRAINT fk_cartoes_clientes_nif_cliente      FOREIGN KEY (nif_cliente)   REFERENCES clientes(nif_cliente);
ALTER TABLE vendas                  ADD CONSTRAINT fk_vendas_nif_cliente                FOREIGN KEY (nif_cliente)   REFERENCES clientes(nif_cliente);
ALTER TABLE vendas                  ADD CONSTRAINT fk_vendas_isbn                       FOREIGN KEY (isbn)          REFERENCES edicoes_Livros(isbn);
ALTER TABLE livros                  ADD CONSTRAINT fk_livros_id_categoria               FOREIGN KEY (id_categoria)  REFERENCES categorias(id_categoria);
ALTER TABLE edicoes_Livros          ADD CONSTRAINT fk_edicoes_livros_id_livro           FOREIGN KEY (id_livro)      REFERENCES livros(id_livro);
ALTER TABLE edicoes_Livros          ADD CONSTRAINT fk_edicoes_livros_cod_idioma         FOREIGN KEY (cod_idioma)    REFERENCES idiomas(cod_idioma);
ALTER TABLE edicoes_Livros          ADD CONSTRAINT fk_edicoes_livros_id_editora         FOREIGN KEY (id_editora)    REFERENCES editoras(id_editora);
ALTER TABLE autores_edicoes_livros  ADD CONSTRAINT fk_autores_edicoes_livros_isbn       FOREIGN KEY (isbn)          REFERENCES edicoes_Livros(isbn);
ALTER TABLE autores_edicoes_livros  ADD CONSTRAINT fk_autores_edicoes_livros_id_autor   FOREIGN KEY (id_autor)      REFERENCES autores(id_autor);
ALTER TABLE nacionalidades_autores  ADD CONSTRAINT fk_nacionalidades_autores_id_autor   FOREIGN KEY (id_autor)      REFERENCES autores(id_autor);
ALTER TABLE nacionalidades_autores  ADD CONSTRAINT fk_nacionalidades_autores_cod_pais   FOREIGN KEY (cod_pais)      REFERENCES paises(cod_pais);
ALTER TABLE editoras                ADD CONSTRAINT fk_editoras_cod_pais                 FOREIGN KEY (cod_pais)      REFERENCES paises(cod_pais);
ALTER TABLE precos_edicoes_livros   ADD CONSTRAINT fk_precos_edicoes_livros_isbn        FOREIGN KEY (isbn)          REFERENCES edicoes_Livros(isbn);
