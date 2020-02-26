--eliminar tabelas (eventualmente) existentes

DROP TABLE experiencias CASCADE CONSTRAINTS PURGE;
DROP TABLE treinadores CASCADE CONSTRAINTS PURGE;
DROP TABLE bolas CASCADE CONSTRAINTS PURGE;
DROP TABLE equipas CASCADE CONSTRAINTS PURGE;

--criar tabelas

CREATE TABLE equipas (
    id_equipa   INTEGER     CONSTRAINT pk_equipas_id_equipa PRIMARY KEY,
    nome        VARCHAR(40) CONSTRAINT nn_equipas_nome NOT NULL,
    cidade      VARCHAR(30) CONSTRAINT nn_equipas_cidade NOT NULL,
    diretor     VARCHAR(40) CONSTRAINT nn_equipas_diretor NOT NULL
);

CREATE TABLE treinadores (
    id_treinador INTEGER     CONSTRAINT pk_treinadores_id_treinador PRIMARY KEY,
    nome         VARCHAR(40) CONSTRAINT nn_treinadores_nome NOT NULL,
    idade        INTEGER,
    telefone     VARCHAR(15) CONSTRAINT nn_treinadores_telefone NOT NULL
);

CREATE TABLE bolas (
    referencia  VARCHAR(10),
    id_equipa   INTEGER,     --CONSTRAINT fk_bolas_id_equipa REFERENCES equipas(id_equipa),
    fabricante  VARCHAR(40) CONSTRAINT nn_bolas_fabricante NOT NULL,
    CONSTRAINT pk_bolas_referencia_id_equipa PRIMARY KEY (id_equipa, referencia)
);

CREATE TABLE experiencias (
    id_equipa       INTEGER,     --CONSTRAINT fk_experiencias_id_equipa REFERENCES equipas(id_equipa),
    id_treinador    INTEGER,     --CONSTRAINT fk_experiencias_id_treinador REFERENCES treinadores(id_treinador),
    escalao         VARCHAR(40),
    anos            NUMBER,
    CONSTRAINT pk_experien_id_equip_trein_tip PRIMARY KEY (id_equipa, id_treinador, escalao)
);

ALTER TABLE bolas           ADD CONSTRAINT fk_bolas_id_equipa           FOREIGN KEY (id_equipa) REFERENCES equipas(id_equipa);
ALTER TABLE experiencias    ADD CONSTRAINT fk_experiencias_id_equipa    FOREIGN KEY (id_equipa) REFERENCES equipas(id_equipa);
ALTER TABLE experiencias    ADD CONSTRAINT fk_experiencias_id_treinador FOREIGN KEY (id_treinador) REFERENCES treinadores(id_treinador);

--preencher tabelas

INSERT INTO treinadores VALUES(1, 'António', 34, 922424561);
INSERT INTO treinadores VALUES(2, 'Barbosa', 45, 965552936);
INSERT INTO treinadores VALUES(3, 'Tavares', 48, 933332267);
INSERT INTO treinadores VALUES(4, 'Joaquim', 57, 918638465);
INSERT INTO treinadores VALUES(5, 'Alberto', 33, 966785309);
INSERT INTO treinadores VALUES(6, 'Duarte', 54, 912773446);

INSERT INTO equipas VALUES(12, 'Académico', 'Porto', 'Mário');
INSERT INTO equipas VALUES(15, 'Universitário', 'Coimbra', 'João');
INSERT INTO equipas VALUES(20, 'Juventude', 'Braga', 'Silva');
INSERT INTO equipas VALUES(24, 'Tigres', 'Espinho', 'Cardoso');

INSERT INTO bolas VALUES(1, 12, 'Adidas');
INSERT INTO bolas VALUES(9, 12, 'Reebok');
INSERT INTO bolas VALUES(13, 12, 'Adidas');
INSERT INTO bolas VALUES(1, 15, 'Adidas');
INSERT INTO bolas VALUES(3, 20, 'Olimpic');
INSERT INTO bolas VALUES(4, 20, 'Nike');
INSERT INTO bolas VALUES(18, 24, 'Reebok');
INSERT INTO bolas VALUES(21, 24, 'Olimpic');

INSERT INTO experiencias VALUES(12, 1, 'juniores', 10);
INSERT INTO experiencias VALUES(12, 1, 'seniores', 5);
INSERT INTO experiencias VALUES(12, 2, 'iniciados', 2);
INSERT INTO experiencias VALUES(12, 2, 'juniores', 3);
INSERT INTO experiencias VALUES(12, 2, 'juvenis', 4);
INSERT INTO experiencias VALUES(15, 3, 'juniores', 15);
INSERT INTO experiencias VALUES(24, 5, 'juvenis', 12);
