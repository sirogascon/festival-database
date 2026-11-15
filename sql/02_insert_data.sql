USE SGO_FIB;

-- 1) TIPOS DE ENTRADA
INSERT INTO entradas (tipo, precio, fecha_inicio, fecha_fin) VALUES
('Abono General', 135.00, '2025-07-04', '2025-07-06'),
('Abono VIP', 280.00, '2025-07-04', '2025-07-06'),
('Entrada Viernes', 60.00, '2025-07-04', '2025-07-04'),
('Entrada Sábado', 65.00, '2025-07-05', '2025-07-05'),
('Entrada Domingo', 60.00, '2025-07-06', '2025-07-06'),
('Abono + Camping', 170.00, '2025-07-04', '2025-07-06'),
('Entrada Infantil', 25.00, '2025-07-04', '2025-07-06'),
('Movilidad Reducida', 110.00, '2025-07-04', '2025-07-06'),
('Entrada Staff', 0.00, '2025-07-04', '2025-07-06'),
('Backstage Pass', 450.00, '2025-07-04', '2025-07-06');

-- 2) ARTISTAS
INSERT INTO artistas (nombre_artistico, pais, genero, n_integrantes, descripcion) VALUES
('Estopa', 'España', 'Rumba Rock', 2, 'Dúo español de rumba y rock.'),
('Vetusta Morla', 'España', 'Indie Rock', 6, 'Banda indie española con gran trayectoria.'),
('Rosalía', 'España', 'Pop', 1, 'Artista pop y urbana de proyección internacional.'),
('Arctic Monkeys', 'Reino Unido', 'Indie Rock', 4, 'Banda británica de rock alternativo.'),
('Coldplay', 'Reino Unido', 'Pop Rock', 4, 'Grupo británico de pop rock mundialmente conocido.'),
('Bad Bunny', 'Puerto Rico', 'Urbano', 1, 'Artista urbano latino de fama internacional.'),
('Dua Lipa', 'Reino Unido', 'Pop', 1, 'Cantante pop internacional.'),
('Maná', 'México', 'Rock', 4, 'Banda mexicana de rock latino.'),
('Imagine Dragons', 'Estados Unidos', 'Pop Rock', 4, 'Banda de pop rock estadounidense.'),
('Quevedo', 'España', 'Urbano', 1, 'Artista urbano español.');

-- 3) ESCENARIOS
INSERT INTO escenarios (nombre, capacidad, ubicacion) VALUES
('Escenario Principal', 40000, 'Recinto central'),
('Escenario Secundario', 20000, 'Zona este'),
('Escenario Electrónico', 15000, 'Zona norte'),
('Escenario Acústico', 5000, 'Zona chill out'),
('Escenario Urbano', 10000, 'Zona food trucks');

-- 4) EMPLEADOS
INSERT INTO empleados (nombre, apellidos, puesto) VALUES
('Juan', 'Pérez', 'Barra'),
('María', 'Gómez', 'Barra'),
('David', 'López', 'Control accesos'),
('Laura', 'Martínez', 'Merchandising'),
('Sergio', 'Fernández', 'Coordinación'),
('Ana', 'Ruiz', 'Barra'),
('Carlos', 'Sánchez', 'Atención al cliente'),
('Marta', 'Jiménez', 'Control accesos'),
('Pablo', 'Moreno', 'Logística'),
('Lucía', 'Torres', 'Barra');

-- 5) ASISTENTES
INSERT INTO asistentes (nombre, apellidos, dni_pasaporte, nacionalidad, email, fecha_nacimiento, id_entrada) VALUES
('Siro', 'Gascón Ogasawara', '00000000A', 'España', 'siro.gascon@gmail.com', '2002-01-31', 1),
('Marc', 'Vidal', '11111111B', 'España', 'marc.vidal@hotmail.com', '1999-11-02', 3),
('Aina', 'Soler', '22222222C', 'España', 'aina.soler@gmail.com', '2001-06-20', 2),
('David', 'Martínez', '33333333D', 'España', 'david.martinez@outlook.com', '1998-09-10', 4),
('Lucía', 'Hernández', '44444444E', 'España', 'lucia.hernandez@gmail.com', '2000-01-28', 1),
('Javier', 'Ruiz', '55555555F', 'España', 'javier.ruiz@hotmail.com', '1997-04-03', 5),
('Claudia', 'Navarro', '66666666G', 'España', 'claudia.navarro@gmail.com', '2003-12-14', 6),
('Sergio', 'López', '77777777H', 'España', 'sergio.lopez@outlook.com', '1996-07-07', 2),
('Marta', 'Gómez', '88888888J', 'España', 'marta.gomez@gmail.com', '2001-02-18', 7),
('Paula', 'Fernández', '99999999K', 'España', 'paula.fernandez@hotmail.com', '1999-08-25', 8);

INSERT INTO pulseras (fecha_activacion, saldo, id_asistente) VALUES
('2025-07-04', 0.00, 1),
('2025-07-04', 5.00, 2),
('2025-07-04', 10.00, 3),
('2025-07-04', 0.00, 4),
('2025-07-04', 20.00, 5),
('2025-07-04', 0.00, 6),
('2025-07-04', 15.00, 7),
('2025-07-04', 0.00, 8),
('2025-07-04', 8.00, 9),
('2025-07-04', 0.00, 10);

-- 7) CONCIERTOS
INSERT INTO conciertos (fecha_hora_inicio, duracion_min, id_escenario, id_artista) VALUES
('2025-07-04 19:00:00', 75, 2, 10),  -- Quevedo (Secundario)
('2025-07-04 21:30:00', 90, 1, 1),   -- Estopa (Principal)
('2025-07-04 23:30:00', 80, 3, 6),   -- Bad Bunny (Electrónico)

('2025-07-05 18:30:00', 70, 5, 3),   -- Rosalía (Urbano)
('2025-07-05 20:30:00', 90, 1, 5),   -- Coldplay (Principal)
('2025-07-05 23:00:00', 85, 2, 4),   -- Arctic Monkeys (Secundario)

('2025-07-06 18:00:00', 60, 4, 2),   -- Vetusta Morla (Acústico)
('2025-07-06 19:45:00', 75, 5, 8),   -- Maná (Urbano)
('2025-07-06 21:30:00', 90, 1, 9),   -- Imagine Dragons (Principal)
('2025-07-06 23:15:00', 70, 2, 7);   -- Dua Lipa (Secundario)

-- 8) RECARGAS
INSERT INTO recargas (fecha_recarga, importe, metodo_pago, id_pulsera) VALUES
('2025-07-04 16:10:00', 20.00, 'Tarjeta', 1),
('2025-07-04 16:25:00', 30.00, 'Tarjeta', 2),
('2025-07-04 17:05:00', 15.00, 'Efectivo', 3),
('2025-07-04 18:40:00', 25.00, 'Tarjeta', 4),

('2025-07-05 12:15:00', 40.00, 'Tarjeta', 5),
('2025-07-05 13:20:00', 20.00, 'Efectivo', 6),
('2025-07-05 17:50:00', 35.00, 'Tarjeta', 7),
('2025-07-05 19:10:00', 10.00, 'Efectivo', 8),

('2025-07-06 11:30:00', 25.00, 'Tarjeta', 9),
('2025-07-06 12:10:00', 20.00, 'Tarjeta', 10),
('2025-07-06 18:05:00', 15.00, 'Efectivo', 2),
('2025-07-06 20:40:00', 30.00, 'Tarjeta', 5);

-- 9) CONSUMICIONES
INSERT INTO consumiciones (fecha_hora, producto, importe, ubicacion, id_pulsera, id_empleado) VALUES
('2025-07-04 19:20:00', 'Cerveza', 6.00, 'Barra Principal', 1, 1),
('2025-07-04 19:45:00', 'Agua', 3.00, 'Barra Principal', 2, 2),
('2025-07-04 20:10:00', 'Bocadillo', 8.50, 'Food Trucks', 3, NULL),
('2025-07-04 21:05:00', 'Refresco', 4.00, 'Barra Secundaria', 4, 6),
('2025-07-04 23:40:00', 'Cubata', 10.00, 'Barra Principal', 5, 1),

('2025-07-05 13:10:00', 'Café', 2.50, 'Zona Chill', 6, NULL),
('2025-07-05 18:20:00', 'Cerveza', 6.00, 'Barra Urbano', 7, 10),
('2025-07-05 19:05:00', 'Nachos', 7.50, 'Food Trucks', 8, NULL),
('2025-07-05 20:55:00', 'Agua', 3.00, 'Barra Principal', 9, 2),
('2025-07-05 23:15:00', 'Pizza', 9.50, 'Food Trucks', 10, NULL),

('2025-07-06 12:40:00', 'Cerveza', 6.00, 'Barra Principal', 2, 1),
('2025-07-06 18:30:00', 'Hamburguesa', 11.00, 'Food Trucks', 5, NULL),
('2025-07-06 19:50:00', 'Refresco', 4.00, 'Barra Secundaria', 7, 6),
('2025-07-06 22:10:00', 'Cubata', 10.00, 'Barra Principal', 9, 1);
