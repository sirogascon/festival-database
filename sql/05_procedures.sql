USE SGO_FIB;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_realizar_recarga $$

CREATE PROCEDURE sp_realizar_recarga(IN p_id_pulsera INT, IN p_monto DECIMAL(8,2))
BEGIN
    -- 1) Insertar la recarga
    INSERT INTO recargas (fecha_recarga, importe, metodo_pago, id_pulsera)
    VALUES (NOW(), p_monto, 'Tarjeta', p_id_pulsera);

    -- 2) Actualizar saldo de la pulsera
    UPDATE pulseras
    SET saldo = saldo + p_monto
    WHERE id_pulsera = p_id_pulsera;
END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS sp_registrar_consumicion $$

CREATE PROCEDURE sp_registrar_consumicion(
    IN p_id_pulsera INT,
    IN p_producto VARCHAR(60),
    IN p_precio DECIMAL(8,2),
    IN p_ubicacion VARCHAR(60)
)
BEGIN
    DECLARE v_saldo DECIMAL(8,2);

    -- Obtener saldo actual
    SELECT saldo INTO v_saldo
    FROM pulseras
    WHERE id_pulsera = p_id_pulsera;

    -- Validar saldo
    IF v_saldo IS NULL THEN
        SELECT 'Pulsera no encontrada' AS mensaje;
    ELSEIF v_saldo < p_precio THEN
        SELECT 'Saldo insuficiente' AS mensaje;
    ELSE
        -- Insertar consumición
        INSERT INTO consumiciones (fecha_hora, producto, importe, ubicacion, id_pulsera, id_empleado)
        VALUES (NOW(), p_producto, p_precio, p_ubicacion, p_id_pulsera, NULL);

        -- Restar saldo
        UPDATE pulseras
        SET saldo = saldo - p_precio
        WHERE id_pulsera = p_id_pulsera;

        SELECT 'Consumición registrada correctamente' AS mensaje;
    END IF;
END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS sp_listar_conciertos_por_dia $$

CREATE PROCEDURE sp_listar_conciertos_por_dia(IN p_fecha DATE)
BEGIN
    SELECT
        c.fecha_hora_inicio,
        c.duracion_min,
        e.nombre AS escenario,
        a.nombre_artistico AS artista
    FROM conciertos c
    JOIN escenarios e ON c.id_escenario = e.id_escenario
    JOIN artistas a ON c.id_artista = a.id_artista
    WHERE DATE(c.fecha_hora_inicio) = p_fecha
    ORDER BY c.fecha_hora_inicio;
END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS sp_borrar_asistente_y_todo $$

CREATE PROCEDURE sp_borrar_asistente_y_todo(IN p_id_asistente INT)
BEGIN
    DECLARE v_id_pulsera INT;

    -- Buscar la pulsera asociada al asistente
    SELECT id_pulsera INTO v_id_pulsera
    FROM pulseras
    WHERE id_asistente = p_id_asistente;

    IF v_id_pulsera IS NULL THEN
        -- Si no tiene pulsera (o no existe), igualmente intentamos borrar el asistente
        DELETE FROM asistentes WHERE id_asistente = p_id_asistente;
        SELECT 'Asistente borrado (sin pulsera asociada)' AS mensaje;
    ELSE
        -- Borrar dependencias (hijas) primero
        DELETE FROM consumiciones WHERE id_pulsera = v_id_pulsera;
        DELETE FROM recargas WHERE id_pulsera = v_id_pulsera;

        -- Borrar pulsera y luego asistente
        DELETE FROM pulseras WHERE id_pulsera = v_id_pulsera;
        DELETE FROM asistentes WHERE id_asistente = p_id_asistente;

        SELECT 'Asistente y datos asociados borrados correctamente' AS mensaje;
    END IF;
END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS sp_crear_usuario_dinamico $$

CREATE PROCEDURE sp_crear_usuario_dinamico(IN p_nombre VARCHAR(50))
BEGIN
    DECLARE v_sql VARCHAR(255);

    -- Crear usuario dinámicamente (usuario@localhost) con contraseña de práctica
    SET v_sql = CONCAT("CREATE USER IF NOT EXISTS '", p_nombre, "'@'localhost' IDENTIFIED BY '1234'");

    PREPARE stmt FROM v_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SELECT CONCAT("Usuario creado: ", p_nombre, "@localhost (pass=1234)") AS mensaje;
END $$

DELIMITER ;
