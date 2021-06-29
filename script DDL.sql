/* TABELA PROPRIETÁRIO */
CREATE TABLE Proprietario(
nome_proprietario VARCHAR2(100) NOT NULL,
NIF VARCHAR2(14),
email VARCHAR2(100),
telefone VARCHAR2(9) NOT NULL,
CONSTRAINT pk_proprietario PRIMARY KEY(NIF)
)

/* TABELA BLOCO */
CREATE TABLE Bloco(
num_bloco NUMBER(3),
latitude NUMBER(7,3) NOT NULL,
longitude NUMBER(7,3)NOT NULL,
area NUMBER(7,3) NOT NULL,
NIF_coordenador VARCHAR2(14),
FOREIGN KEY(NIF_coordenador) REFERENCES Proprietario(NIF),
CONSTRAINT pk_bloco PRIMARY KEY(num_bloco)
)

/* TABELA QUARTEIRÃO */
CREATE TABLE Quarteirao(
designacao VARCHAR2(5) NOT NULL,
num_bloco NUMBER(3),
FOREIGN KEY(num_bloco) REFERENCES Bloco(num_bloco),
CONSTRAINT pk_quarteirao PRIMARY KEY(designacao)
)


/* TABELA EDIFÍCIO */
CREATE TABLE Edificio(
num_edificio NUMBER(5),
total_andares NUMBER(3) NOT NULL,
modelo VARCHAR2(20) NOT NULL CHECK (modelo = 'lower-class' or modelo = 'working-class' or modelo = 'middle-class' or modelo = 'upper-class'),
utilidade VARCHAR2(20) NOT NULL CHECK (utilidade = 'moradia' or utilidade = 'escritorio'),
is_rampa NUMBER(1) NOT NULL CHECK (is_rampa = 1 or is_rampa = 0),
NIF_coordenador VARCHAR2(14),
num_bloco NUMBER(3),
FOREIGN KEY(num_bloco) REFERENCES Bloco(num_bloco),
FOREIGN KEY(NIF_coordenador) REFERENCES Proprietario(NIF),
CONSTRAINT pk_edificio PRIMARY KEY(num_edificio)
)
/* TABELA FRACÇÃO */
CREATE TABLE Fraccao(
cod_fraccao NUMBER(3),
designacao VARCHAR2(1),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_fraccao PRIMARY KEY(cod_fraccao)
)


/* TABELA RUA */
CREATE TABLE Rua(
cod_rua NUMBER(3),
nome VARCHAR2(30) NOT NULL UNIQUE,
CONSTRAINT pk_rua PRIMARY KEY(cod_rua)
)

/* TABELA TIPO-RUA */
CREATE TABLE Tipo_Rua(
cod_tipo_rua NUMBER(3),
tipo VARCHAR2(15) NOT NULL CHECK (tipo = 'principal' or tipo = 'secundaria'),
CONSTRAINT pk_tipo_rua PRIMARY KEY(cod_tipo_rua)
)

/* TABELA RUA TIPO-RUA */
CREATE TABLE Rua_Tipo_Rua(
cod_rua_tipo_rua NUMBER(3),
cod_rua NUMBER(3),
cod_tipo_rua NUMBER(3),
FOREIGN KEY(cod_rua) REFERENCES Rua(cod_rua),
FOREIGN KEY(cod_tipo_rua) REFERENCES Tipo_Rua(cod_tipo_rua),
CONSTRAINT pk_rua_tipo_rua PRIMARY KEY(cod_rua_tipo_rua)
)

/* TABELA EDIFÍCIO RUA */
CREATE TABLE Edificio_Rua(
cod_edificio_rua NUMBER(3),
cod_rua NUMBER(3),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
FOREIGN KEY(cod_rua) REFERENCES Rua(cod_rua),
CONSTRAINT pk_edificio_rua PRIMARY KEY(cod_edificio_rua)
)


/* TABELA LOWER CLASS */
CREATE TABLE Lower_Class(
cod_lower_class NUMBER(3),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_lower_class PRIMARY KEY(cod_lower_class)
)

/* TABELA WORKING CLASS */
CREATE TABLE Working_Class(
cod_working_class NUMBER(3),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_working_class PRIMARY KEY(cod_working_class)
)

/* TABELA MIDDLE CLASS */
CREATE TABLE Middle_Class(
cod_middle_class NUMBER(3),
is_elevador NUMBER(1) NOT NULL  CHECK (is_elevador = 1 or is_elevador = 0),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_middle_class PRIMARY KEY(cod_middle_class)
)

/* TABELA UPPER CLASS */
CREATE TABLE Upper_Class(
cod_upper_class NUMBER(3),
is_elevador NUMBER(1) NOT NULL  CHECK (is_elevador = 1 or is_elevador = 0),
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_upper_class PRIMARY KEY(cod_upper_class)
)
/* TABELA TIPO MORADIA */
CREATE TABLE Tipo_Moradia(
cod_tipo_moradia NUMBER(3),
total_apartamentos NUMBER(3) NOT NULL,
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_tipo_moradia PRIMARY KEY(cod_tipo_moradia)
)
/* TABELA TIPO ESCRITÓRIO */
CREATE TABLE Tipo_Escritorio(
cod_tipo_escritorio NUMBER(3),
total_escritorios NUMBER(3) NOT NULL,
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_tipo_escritorio PRIMARY KEY(cod_tipo_escritorio)
)
/* TABELA TOPOLOGIA */
CREATE TABLE Topologia(
cod_topologia NUMBER(3),
tipo VARCHAR2(5) NOT NULL CHECK (tipo = 'T2' or tipo = 'T3+1' or tipo = 'T4' or tipo = 'T5'),
CONSTRAINT pk_topologia PRIMARY KEY(cod_topologia)
)

/* TABELA TAXA */
CREATE TABLE Taxa(
cod_taxa NUMBER(3),
valor NUMBER(10,2) NOT NULL,
data_pagamento VARCHAR2(6) NOT NULL CHECK (tipo = 'mensal' or tipo = 'anual'),
CONSTRAINT pk_taxa PRIMARY KEY(cod_taxa)
)

/* TABELA APARTAMENTO */
CREATE TABLE Apartamento(
num_apartamento NUMBER(3),
num_andar NUMBER(3) NOT NULL,
cod_taxa NUMBER(3),
cod_topologia NUMBER(3),
cod_tipo_moradia NUMBER(3),
FOREIGN KEY(cod_topologia) REFERENCES Topologia(cod_topologia),
FOREIGN KEY(cod_taxa) REFERENCES Taxa(cod_taxa),
FOREIGN KEY(cod_tipo_moradia) REFERENCES Tipo_Moradia(cod_tipo_moradia),
CONSTRAINT pk_apartamento PRIMARY KEY(num_apartamento, num_andar)
)


/* TABELA PARQUE ESTACIONAMENTO */
CREATE TABLE Parque_Estacionamento(
cod_parque_estacionamento NUMBER(3),
area NUMBER(7,2) NOT NULL,
num_apartamento NUMBER(3) NOT NULL,
num_edificio NUMBER(5),
FOREIGN KEY(num_edificio) REFERENCES Edificio(num_edificio),
CONSTRAINT pk_parque_estacionamento PRIMARY KEY(num_edificio, num_apartamento, cod_parque_estacionamento)
)

/* TABELA PESSOA FÍSICA */
CREATE TABLE Pessoa_Fisica(
cod_pessoa_fisica NUMBER(3),
BI VARCHAR2(14) NOT NULL UNIQUE,
num_apartamento NUMBER(3),
num_andar NUMBER(3),
cod_proprietario VARCHAR2(14),
FOREIGN KEY(cod_proprietario) REFERENCES Proprietario(NIF),
FOREIGN KEY(num_apartamento, num_andar) REFERENCES Apartamento(num_apartamento, num_andar),
CONSTRAINT pk_pessoa_fisica PRIMARY KEY(cod_pessoa_fisica)
)

/* TABELA PESSOA JURÍDICA */
CREATE TABLE Pessoa_Juridica(
cod_pessoa_juridica NUMBER(3),
cod_proprietario VARCHAR2(14),
FOREIGN KEY(cod_proprietario) REFERENCES Proprietario(NIF),
CONSTRAINT pk_pessoa_juridica PRIMARY KEY(cod_pessoa_juridica)
)

/* TABELA ESCRITÓRIO */
CREATE TABLE Escritorio(
cod_escritorio NUMBER(3),
num_escritorio NUMBER(3) NOT NULL,
andar NUMBER(3) NOT NULL,
area NUMBER(7,5) NOT NULL,
cod_taxa NUMBER(3),
cod_tipo_escritorio NUMBER(3),
FOREIGN KEY(cod_taxa) REFERENCES Taxa(cod_taxa),
cod_proprietario_juridica NUMBER(3),
FOREIGN KEY(cod_tipo_escritorio) REFERENCES Tipo_Escritorio(cod_tipo_escritorio),
FOREIGN KEY(cod_proprietario_juridica) REFERENCES Pessoa_Juridica(cod_pessoa_juridica),
CONSTRAINT pk_escritorio PRIMARY KEY(cod_escritorio)
)

/* TABELA PAGAMENTO */
CREATE TABLE Pagamento(
cod_pagamento NUMBER(3),
tipo VARCHAR2(6) NOT NULL CHECK (tipo = 'mensal' or tipo = 'anual'),
data_pagamento DATE NOT NULL,
cod_proprietario VARCHAR2(14),
FOREIGN KEY(cod_proprietario) REFERENCES Proprietario(NIF),
CONSTRAINT pk_pagamento PRIMARY KEY(cod_pagamento)
)


/* TABELA PAGAMENTO TAXA */
CREATE TABLE Pagamento_Taxa(
cod_pagamento_taxa NUMBER(3),
cod_pagamento NUMBER(3),
cod_taxa NUMBER(3),
FOREIGN KEY(cod_taxa) REFERENCES Taxa(cod_taxa),
FOREIGN KEY(cod_pagamento) REFERENCES Pagamento(cod_pagamento),
CONSTRAINT pk_pagamento_taxa PRIMARY KEY(cod_pagamento_taxa)
)


/* TABELA HISTÓRICO */
CREATE TABLE Historico(
cod_historico NUMBER(3),
motivo VARCHAR2(8) NOT NULL CHECK (motivo = 'venda' or motivo = 'juridico'),
data_mudanca DATE NOT NULL,
cod_novo_proprietario VARCHAR2(14),
cod_antigo_proprietario VARCHAR2(14),
FOREIGN KEY(cod_novo_proprietario) REFERENCES Proprietario(NIF),
FOREIGN KEY(cod_antigo_proprietario) REFERENCES Proprietario(NIF),
CONSTRAINT pk_historico PRIMARY KEY(cod_historico)
)

/* TABELA ESCRITÓRIO HISTÓRICO */
CREATE TABLE Escritorio_Historico(
cod_escritorio_historico NUMBER(3),
cod_historico NUMBER(3),
cod_escritorio NUMBER(3),
FOREIGN KEY(cod_historico) REFERENCES Historico(cod_historico),
FOREIGN KEY(cod_escritorio) REFERENCES Escritorio(cod_escritorio),
CONSTRAINT pk_escritorio_historico PRIMARY KEY(cod_escritorio_historico)
)

/* TABELA APARTAMENTO HISTÓRICO */
CREATE TABLE Apartamento_Historico(
cod_apartamento_historico NUMBER(3),
cod_historico NUMBER(3),
num_apartamento NUMBER(3),
num_andar NUMBER(3),
FOREIGN KEY(cod_historico) REFERENCES Historico(cod_historico),
FOREIGN KEY(num_apartamento, num_andar) REFERENCES Apartamento(num_apartamento, num_andar),
CONSTRAINT pk_apartamento_historico PRIMARY KEY(cod_apartamento_historico)
)
