-- ex 4.3

CREATE TABLE excecoes(

    ex_id   INT,
    ex_texto    VARCHAR(500) CONSTRAINT no_excecoes_ex_texto NOT NULL,
    CONSTRAINT pk_excecoes_ex_id PRIMARY KEY (ex_id),
    CONSTRAINT ck_excecoes_ex_id CHECK (ex_id <= -20000)
    );
    
-- Preencher tabela

INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200001, 'Não são permitidos clientes com idade inferior a 18 anos.');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200002, 'Horário de fim de semana');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200003, 'Fora de horário de funcionamento');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200004, 'Não são permitidos eleminações de preços');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200005, 'Não são permitiods registos de preços anteriores à data atual');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200006, 'Não são permitidas modificações de registos de preços anteriores à data');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-200007, 'Não são permitidos registos de preços com valores iguais para datas com valores iguais para datas consecutivas');

