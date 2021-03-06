
/* INSER??O DOS DADOS */

/* PROPRIET?RIO */
INSERT INTO PROPRIETARIO( NOME_PROPRIETARIO, NIF, TELEFONE, EMAIL ) VALUES('Ant?nio Kadiamossiko', '007120555LA045', '938709693', 'antonio-kadiamossiko@gmail.com');

/* BLOCO */
INSERT INTO BLOCO( NUM_BLOCO, LONGITUDE, LATITUDE, AREA, NIF_COORDENADOR ) VALUES( 5, 100.3, 100.4, 24.5, '007120555LA045');

/* QUARTEIR?O */
INSERT INTO QUARTEIRAO( NUM_BLOCO, DESIGNACAO) VALUES( 5, 'F');

/* EDIF?CIO */
INSERT INTO EDIFICIO( NUM_EDIFICIO, NUM_BLOCO, NIF_COORDENADOR, TOTAL_ANDARES, MODELO, UTILIDADE, IS_RAMPA ) VALUES(12, 5, '007120555LA045', 3, 'upper-class', 'moradia', 1 );

/* FRAC??O */
INSERT INTO FRACCAO( COD_FRACCAO, DESIGNACAO, NUM_EDIFICIO ) VALUES( 1, 'A', 12 );

/* RUA */
INSERT INTO RUA( COD_RUA, NOME) VALUES(1, 'rua-01');

/* TIPO_RUA */
INSERT INTO TIPO_RUA( COD_TIPO_RUA, TIPO) VALUES(1, 'principal');
INSERT INTO TIPO_RUA( COD_TIPO_RUA, TIPO) VALUES(2, 'secundaria');

/* RUA TIPO RUA */
INSERT INTO RUA_TIPO_RUA( COD_RUA_TIPO_RUA, COD_RUA, COD_TIPO_RUA ) VALUES(1,1, 1 );

/* EDIF?CIO RUA */
INSERT INTO EDIFICIO_RUA( COD_EDIFICIO_RUA, COD_RUA, NUM_EDIFICIO) VALUES(1,1, 12 );

/* UPPER CLASS */
INSERT INTO UPPER_CLASS( COD_UPPER_CLASS,NUM_EDIFICIO, IS_ELEVADOR) VALUES(1, 12, 1 );

/* TIPO MORADIA */
INSERT INTO TIPO_MORADIA( COD_TIPO_MORADIA, NUM_EDIFICIO, TOTAL_APARTAMENTOS ) VALUES(1, 12, 8 );

/* TOPOLOGIA */
INSERT INTO TOPOLOGIA( COD_TOPOLOGIA, TIPO, NUM_EDIFICIO) VALUES(1, 'T5', 12 );

/* TAXA */
INSERT INTO TAXA( COD_TAXA, VALOR, DATA_PAGAMENTO) VALUES(1, '50000', TO_DATE('21/02/2021','DD/MM/YYYY') );

/* APARTAMENTO */
INSERT INTO APARTAMENTO( NUM_APARTAMENTO,NUM_ANDAR,COD_TIPO_MORADIA,COD_TOPOLOGIA,COD_TAXA) VALUES(101, 1, 1, 1, 1);

/* PARQUE DE ESTACIONAMENTO */
INSERT INTO PARQUE_ESTACIONAMENTO( COD_PARQUE_ESTACIONAMENTO,AREA,APT_CORRESPONDENTE,NUM_EDIFICIO) VALUES(1, 10.2, 101, 12);

/* PESSOA F?SICA */
INSERT INTO PESSOA_FISICA( COD_PESSOA_FISICA, COD_PROPRIETARIO, BI,NUM_ANDAR, NUM_APARTAMENTO ) VALUES(1, '007120555LA045', '007120555LA045', 1, 101 );

/* PAGAMENTO */
INSERT INTO PAGAMENTO( COD_PAGAMENTO, COD_PROPRIETARIO, TIPO, DATA_PAGAMENTO) VALUES(1, '007120555LA045', 'anual', TO_DATE('21/02/2021', 'DD/MM/YYYY') );

/* PAGAMENTO TAXA */
INSERT INTO PAGAMENTO_TAXA( COD_PAGAMENTO_TAXA, COD_PAGAMENTO, COD_TAXA) VALUES(1, 1, 1 );
