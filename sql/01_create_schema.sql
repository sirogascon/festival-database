DROP DATABASE IF EXISTS SGO_FIB;
CREATE DATABASE SGO_FIB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE SGO_FIB;


-- Tabla de tipos de entrada al festival
CREATE TABLE entradas (
    id_entrada INT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(6,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    PRIMARY KEY (id_entrada)
) ENGINE=InnoDB;

-- Tabla de asistentes al festival
CREATE TABLE asistentes (
    id_asistente INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    dni_pasaporte VARCHAR(20) NOT NULL,
    nacionalidad VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_entrada INT NOT NULL,
    PRIMARY KEY (id_asistente),
    UNIQUE (dni_pasaporte),
    UNIQUE (email),
    CONSTRAINT fk_asistentes_entradas
        FOREIGN KEY (id_entrada) REFERENCES entradas(id_entrada)
) ENGINE=InnoDB;

-- Tabla de pulseras (una pulsera por asistente)
CREATE TABLE pulseras (
    id_pulsera INT AUTO_INCREMENT,
    fecha_activacion DATE NOT NULL,
    saldo DECIMAL(8,2) NOT NULL DEFAULT 0,
    id_asistente INT NOT NULL,
    PRIMARY KEY (id_pulsera),
    UNIQUE (id_asistente),
    CONSTRAINT fk_pulseras_asistentes
        FOREIGN KEY (id_asistente) REFERENCES asistentes(id_asistente)
) ENGINE=InnoDB;

-- Tabla de recargas de saldo
CREATE TABLE recargas (
    id_recarga INT AUTO_INCREMENT,
    fecha_recarga DATETIME NOT NULL,
    importe DECIMAL(8,2) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    id_pulsera INT NOT NULL,
    PRIMARY KEY (id_recarga),
    CONSTRAINT fk_recargas_pulseras
        FOREIGN KEY (id_pulsera) REFERENCES pulseras(id_pulsera)
) ENGINE=InnoDB;

-- Tabla de empleados del festival
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_empleado)
) ENGINE=InnoDB;

-- Tabla de consumiciones realizadas con la pulsera
CREATE TABLE consumiciones (
    id_consumicion INT AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    producto VARCHAR(60) NOT NULL,
    importe DECIMAL(8,2) NOT NULL,
    ubicacion VARCHAR(60) NOT NULL,
    id_pulsera INT NOT NULL,
    id_empleado INT NULL,
    PRIMARY KEY (id_consumicion),
    CONSTRAINT fk_consumiciones_pulseras
        FOREIGN KEY (id_pulsera) REFERENCES pulseras(id_pulsera),
    CONSTRAINT fk_consumiciones_empleados
        FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
) ENGINE=InnoDB;

-- Tabla de artistas
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT,
    nombre_artistico VARCHAR(80) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    n_integrantes INT NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (id_artista)
) ENGINE=InnoDB;

-- Tabla de escenarios del festival
CREATE TABLE escenarios (
    id_escenario INT AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    capacidad INT NOT NULL,
    ubicacion VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_escenario)
) ENGINE=InnoDB;

-- Tabla de conciertos programados
CREATE TABLE conciertos (
    id_concierto INT AUTO_INCREMENT,
    fecha_hora_inicio DATETIME NOT NULL,
    duracion_min INT NOT NULL,
    id_escenario INT NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (id_concierto),
    CONSTRAINT fk_conciertos_escenarios
        FOREIGN KEY (id_escenario) REFERENCES escenarios(id_escenario),
    CONSTRAINT fk_conciertos_artistas
        FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) ENGINE=InnoDB;
