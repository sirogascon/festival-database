USE SGO_FIB;

DROP VIEW IF EXISTS vw_vista_saldos;

CREATE VIEW vw_vista_saldos AS
SELECT
    a.id_asistente,
    a.nombre,
    a.apellidos,
    a.email,
    p.id_pulsera,
    p.saldo
FROM asistentes a
JOIN pulseras p ON p.id_asistente = a.id_asistente;


DROP VIEW IF EXISTS vw_vista_consumo_total;

CREATE VIEW vw_vista_consumo_total AS
SELECT
    c.id_pulsera,
    c.producto,
    SUM(c.importe) AS total_gastado,
    COUNT(*) AS num_consumos
FROM consumiciones c
GROUP BY c.id_pulsera, c.producto;
