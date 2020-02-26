--eliminar tabelas (eventualmente) existentes

DROP TABLE cd CASCADE CONSTRAINTS PURGE ;
DROP TABLE musicas CASCADE CONSTRAINTS PURGE ;

--criar tabelas

CREATE TABLE cd (
    cod_cd          INTEGER CONSTRAINT pk_cd_cod PRIMARY KEY,
    titulo          VARCHAR(40) CONSTRAINT nn_cd_nome NOT NULL,
    data_compra     DATE,
    valor_pago      NUMERIC(5,2),
    local_compra    VARCHAR(20)
);

CREATE TABLE musicas (
    nr_musica   INTEGER,
    cod_cd      INTEGER,    
    titulo      VARCHAR(40) CONSTRAINT nn_musicas_nome NOT NULL,
    interprete  VARCHAR(30) CONSTRAINT nn_musicas_interprete NOT NULL,
    duracao     NUMERIC(2,1),
    CONSTRAINT pk_musicas_nr_musica_cod_cd  PRIMARY KEY (cod_cd, nr_musica)
);

ALTER TABLE musicas ADD CONSTRAINT fk_musicas_cod_cd FOREIGN KEY (cod_cd) REFERENCES CD (cod_cd);

--preencher tabelas

INSERT INTO cd VALUES (1, 'Punkzilla', TO_DATE('22/Abril/2011','DD/MON/YY'), 55.00 , 'FNAC');
INSERT INTO cd VALUES (2, 'Classic Duets', TO_DATE('21/Maio/2017','DD/MON/YY'), 30.50, 'Worten');
INSERT INTO cd VALUES (3, 'The Wall', TO_DATE('22/Abril/2011','DD/MON/YY'), 25.80, 'FNAC');
INSERT INTO cd VALUES (4, 'Hits 4', TO_DATE('10/Setembro/2017','DD/MON/YY'), 42.30, 'Worten');
INSERT INTO cd VALUES (5, 'Songs of Experience', TO_DATE('1/Janeiro/2018','DD/MON/YY'), 10.99, NULL);
INSERT INTO cd VALUES (6, 'Giesta 2', TO_DATE('15/Junho/2017','DD/MON/YY'), 9.10, NULL);

INSERT INTO musicas VALUES (1, 1, 'Dream of Waking', 'AFI', 3.05);
INSERT INTO musicas VALUES (2, 1, 'Still', 'Rufio', 3.02);
INSERT INTO musicas VALUES (3, 1, 'Behind the Music', 'The Vandals', 2.41);
INSERT INTO musicas VALUES (4, 1, 'Why Are You Alive', 'The Vandals', 2.34);
INSERT INTO musicas VALUES (5, 1, 'Vandals', 'The Vandals', 4.01);
INSERT INTO musicas VALUES (6, 1, 'Days of the Phoenix', 'AFI', 3.28);
INSERT INTO musicas VALUES (7, 1, 'Wester', 'AFI', 3.02);

INSERT INTO musicas VALUES (1, 2, 'Bizet: Les pécheurs de perles...', 'Orquestra Filarmónica Real', 5.24);
INSERT INTO musicas VALUES (2, 2, 'Verdi: Otello/Act 2', 'Orquestra Sinfónica Chicago', 6.47);
INSERT INTO musicas VALUES (3, 2, 'Verdi: Aida/Act 4', 'Loring Maazel', 4.38);
INSERT INTO musicas VALUES (4, 2, 'Puccini: Turandot', 'Zubin Mehta', 3.08);

INSERT INTO musicas VALUES (1, 3, 'In the Flesh', 'Pink Floyd', 3.20);
INSERT INTO musicas VALUES (2, 3, 'The Thin Lee', 'Pink Floyd', 2.30);
INSERT INTO musicas VALUES (3, 3, 'Mother', 'Pink Floyd', 5.34);
INSERT INTO musicas VALUES (4, 3, 'Don''t Leave Me Now', 'Pink Floyd', 4.17);
INSERT INTO musicas VALUES (5, 3, 'Young Lust', 'Pink Floyd', 3.33);

INSERT INTO musicas VALUES (1, 4, 'It''s Alright(Baby''s Coming Back)', 'Eurythmics', 3.05);
INSERT INTO musicas VALUES (2, 4, 'Hounds of Love' , 'Kate Bush', 3.02);
INSERT INTO musicas VALUES (3, 4, 'Calling America', 'Electric Light Orchestra', 2.41);
INSERT INTO musicas VALUES (4, 4, 'Suspicious Minds', 'Fine Young Cannibals', 2.34);
INSERT INTO musicas VALUES (5, 4, 'I''m Your Man', 'Wham!', 3.28);

INSERT INTO musicas VALUES (1, 5, 'Love is All We Have Left', 'U2', 2.41);
INSERT INTO musicas VALUES (2, 5, 'Lights of Home' , 'U2', 4.16);
INSERT INTO musicas VALUES (3, 5, 'You''re the Best Thing About Me', 'U2', 3.45);
INSERT INTO musicas VALUES (4, 5, 'Get Out of Your Own Way', 'U2', 3.58);
INSERT INTO musicas VALUES (5, 5, 'American Soul', 'U2', 4.21);
INSERT INTO musicas VALUES (6, 5, 'Summer of Love', 'U2', 3.24);
INSERT INTO musicas VALUES (7, 5, 'Red Flag Day', 'U2', 3.19);
INSERT INTO musicas VALUES (8, 5, 'The Showman', 'U2', 3.23);

INSERT INTO musicas VALUES (1, 6, 'Valsa em Espiral', 'Miguel Araújo', 3.34);
INSERT INTO musicas VALUES (2, 6, '1987' , 'Miguel Araújo', 4.12);
INSERT INTO musicas VALUES (3, 6, 'Meio Conto', 'Miguel Araújo', 3.13);
INSERT INTO musicas VALUES (4, 6, 'Via Norte', 'Miguel Araújo', 3.35);
INSERT INTO musicas VALUES (5, 6, 'Sangemil', 'Miguel Araújo', 4.03);
INSERT INTO musicas VALUES (6, 6, 'Lurdes Valsa Lenta', 'Miguel Araújo', 4.41);
INSERT INTO musicas VALUES (7, 6, 'Axl Rose', 'Miguel Araújo', 5.03);
INSERT INTO musicas VALUES (8, 6, '20% Mais', 'Miguel Araújo', 1.20);
INSERT INTO musicas VALUES (9, 6, 'Vândalo', 'Miguel Araújo', 4.45);
INSERT INTO musicas VALUES (10, 6, 'Aqui Dali', 'Miguel Araújo', 4.45);
