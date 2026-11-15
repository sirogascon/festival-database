USE SGO_FIB;

-- Tabla de log de eventos (recargas)
CREATE TABLE IF NOT EXISTS log_eventos (
    id_log INT AUTO_INCREMENT,
    fecha_evento DATETIME NOT NULL,
    tipo_evento VARCHAR(30) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    id_pulsera INT NOT NULL,
    PRIMARY KEY (id_log),
    CONSTRAINT fk_log_eventos_pulseras
        FOREIGN KEY (id_pulsera) REFERENCES pulseras(id_pulsera)
) ENGINE=InnoDB;

-- Tabla de alertas por consumos altos
CREATE TABLE IF NOT EXISTS alertas_consumo (
    id_alerta INT AUTO_INCREMENT,
    fecha_alerta DATETIME NOT NULL,
    id_pulsera INT NOT NULL,
    producto VARCHAR(60) NOT NULL,
    importe DECIMAL(8,2) NOT NULL,
    ubicacion VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_alerta),
    CONSTRAINT fk_alertas_consumo_pulseras
        FOREIGN KEY (id_pulsera) REFERENCES pulseras(id_pulsera)
) ENGINE=InnoDB;
