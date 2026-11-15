USE SGO_FIB;

DELIMITER $$

DROP TRIGGER IF EXISTS tr_log_recarga $$

CREATE TRIGGER tr_log_recarga
AFTER INSERT ON recargas
FOR EACH ROW
BEGIN
    INSERT INTO log_eventos (fecha_evento, tipo_evento, descripcion, id_pulsera)
    VALUES (
        NOW(),
        'RECARGA',
        CONCAT('Recarga de ', NEW.importe, ' EUR (', NEW.metodo_pago, ')'),
        NEW.id_pulsera
    );
END $$

DELIMITER ;


DELIMITER $$

DROP TRIGGER IF EXISTS tr_alerta_gasto_alto $$

CREATE TRIGGER tr_alerta_gasto_alto
AFTER INSERT ON consumiciones
FOR EACH ROW
BEGIN
    IF NEW.importe >= 20.00 THEN
        INSERT INTO alertas_consumo (fecha_alerta, id_pulsera, producto, importe, ubicacion)
        VALUES (NOW(), NEW.id_pulsera, NEW.producto, NEW.importe, NEW.ubicacion);
    END IF;
END $$

DELIMITER ;


DELIMITER $$

DROP TRIGGER IF EXISTS tr_check_saldo $$

CREATE TRIGGER tr_check_saldo
BEFORE INSERT ON consumiciones
FOR EACH ROW
BEGIN
    DECLARE v_saldo DECIMAL(8,2);

    SELECT saldo INTO v_saldo
    FROM pulseras
    WHERE id_pulsera = NEW.id_pulsera;

    IF v_saldo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pulsera no encontrada';
    ELSEIF v_saldo < NEW.importe THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Saldo insuficiente para la consumicion';
    END IF;
END $$

DELIMITER ;
