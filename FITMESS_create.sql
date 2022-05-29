-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-29 17:08:53.277

USE [master];
GO

CREATE DATABASE [FITMES];
GO

-- tables
-- Table: CITA
CREATE TABLE CITA (
    CCita int  NOT NULL,
    fecha date  NOT NULL,
    duracion int  NOT NULL,
    usuario_CUsuario int  NOT NULL,
    nutricionista_n_id int  NOT NULL,
    CONSTRAINT CITA_pk PRIMARY KEY  (CCita)
);

-- Table: COMIDA
CREATE TABLE COMIDA (
    c_id int  NOT NULL,
    nombre_comida varchar(256)  NOT NULL,
    tipo_comida varchar(256)  NOT NULL,
    ingredientes varchar(256)  NOT NULL,
    calorias int  NOT NULL,
    costo money  NOT NULL,
    CONSTRAINT COMIDA_pk PRIMARY KEY  (c_id)
);

-- Table: ENFERMEDAD
CREATE TABLE ENFERMEDAD (
    e_id int  NOT NULL,
    e_nombre varchar(256)  NOT NULL,
    gravedad varchar(256)  NOT NULL,
    usuario_CUsuario int  NOT NULL,
    CONSTRAINT ENFERMEDAD_pk PRIMARY KEY  (e_id)
);

-- Table: NUTRICIONISTA
CREATE TABLE NUTRICIONISTA (
    n_id int  NOT NULL,
    n_nombre varchar(256)  NOT NULL,
    n_apellido varchar(256)  NOT NULL,
    n_experiencia int  NOT NULL,
    CONSTRAINT NUTRICIONISTA_pk PRIMARY KEY  (n_id)
);

-- Table: NUTRICIONISTA_CONTACTO
CREATE TABLE NUTRICIONISTA_CONTACTO (
    CContacto int  NOT NULL,
    n_telefono int  NOT NULL,
    n_correo varchar(256)  NOT NULL,
    nutricionista_n_id int  NOT NULL,
    CONSTRAINT NUTRICIONISTA_CONTACTO_pk PRIMARY KEY  (CContacto)
);

-- Table: NUTRICIONISTA_PLATO
CREATE TABLE NUTRICIONISTA_PLATO (
    nutricionista_n_id int  NOT NULL,
    comida_c_id int  NOT NULL,
    CONSTRAINT NUTRICIONISTA_PLATO_pk PRIMARY KEY  (nutricionista_n_id,comida_c_id)
);

-- Table: PLATO_RECOMENDACION
CREATE TABLE PLATO_RECOMENDACION (
    CPlatoRecomendacion int  NOT NULL,
    horario datetime  NOT NULL,
    cantidad int  NOT NULL,
    enfermedad_e_id int  NOT NULL,
    comida_c_id int  NOT NULL,
    usuario_CUsuario int  NOT NULL,
    nutricionista_n_id int  NOT NULL,
    CONSTRAINT PLATO_RECOMENDACION_pk PRIMARY KEY  (CPlatoRecomendacion)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    CUsuario int  NOT NULL,
    UNombre varchar(256)  NOT NULL,
    UApellido varchar(256)  NOT NULL,
    UEdad int  NOT NULL,
    UPeso int  NOT NULL,
    UAltura int  NOT NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY  (CUsuario)
);

-- Table: USUARIO_CONTACTO
CREATE TABLE USUARIO_CONTACTO (
    CContacto int  NOT NULL,
    u_telefono int  NOT NULL,
    u_correo varchar(256)  NOT NULL,
    usuario_CUsuario int  NOT NULL,
    CONSTRAINT USUARIO_CONTACTO_pk PRIMARY KEY  (CContacto)
);

-- foreign keys
-- Reference: cita_nutricionista (table: CITA)
ALTER TABLE CITA ADD CONSTRAINT cita_nutricionista
    FOREIGN KEY (nutricionista_n_id)
    REFERENCES NUTRICIONISTA (n_id);

-- Reference: cita_usuario (table: CITA)
ALTER TABLE CITA ADD CONSTRAINT cita_usuario
    FOREIGN KEY (usuario_CUsuario)
    REFERENCES USUARIO (CUsuario);

-- Reference: enfermedad_usuario (table: ENFERMEDAD)
ALTER TABLE ENFERMEDAD ADD CONSTRAINT enfermedad_usuario
    FOREIGN KEY (usuario_CUsuario)
    REFERENCES USUARIO (CUsuario);

-- Reference: n_contacto_nutricionista (table: NUTRICIONISTA_CONTACTO)
ALTER TABLE NUTRICIONISTA_CONTACTO ADD CONSTRAINT n_contacto_nutricionista
    FOREIGN KEY (nutricionista_n_id)
    REFERENCES NUTRICIONISTA (n_id);

-- Reference: nutricionista_plato_comida (table: NUTRICIONISTA_PLATO)
ALTER TABLE NUTRICIONISTA_PLATO ADD CONSTRAINT nutricionista_plato_comida
    FOREIGN KEY (comida_c_id)
    REFERENCES COMIDA (c_id);

-- Reference: nutricionista_plato_nutricionista (table: NUTRICIONISTA_PLATO)
ALTER TABLE NUTRICIONISTA_PLATO ADD CONSTRAINT nutricionista_plato_nutricionista
    FOREIGN KEY (nutricionista_n_id)
    REFERENCES NUTRICIONISTA (n_id);

-- Reference: plato_recomendacion_comida (table: PLATO_RECOMENDACION)
ALTER TABLE PLATO_RECOMENDACION ADD CONSTRAINT plato_recomendacion_comida
    FOREIGN KEY (comida_c_id)
    REFERENCES COMIDA (c_id);

-- Reference: plato_recomendacion_enfermedad (table: PLATO_RECOMENDACION)
ALTER TABLE PLATO_RECOMENDACION ADD CONSTRAINT plato_recomendacion_enfermedad
    FOREIGN KEY (enfermedad_e_id)
    REFERENCES ENFERMEDAD (e_id);

-- Reference: plato_recomendacion_nutricionista (table: PLATO_RECOMENDACION)
ALTER TABLE PLATO_RECOMENDACION ADD CONSTRAINT plato_recomendacion_nutricionista
    FOREIGN KEY (nutricionista_n_id)
    REFERENCES NUTRICIONISTA (n_id);

-- Reference: plato_recomendacion_usuario (table: PLATO_RECOMENDACION)
ALTER TABLE PLATO_RECOMENDACION ADD CONSTRAINT plato_recomendacion_usuario
    FOREIGN KEY (usuario_CUsuario)
    REFERENCES USUARIO (CUsuario);

-- Reference: u_contacto_usuario (table: USUARIO_CONTACTO)
ALTER TABLE USUARIO_CONTACTO ADD CONSTRAINT u_contacto_usuario
    FOREIGN KEY (usuario_CUsuario)
    REFERENCES USUARIO (CUsuario);

-- End of file.

