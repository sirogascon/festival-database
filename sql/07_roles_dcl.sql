USE SGO_FIB;

-- Crear roles
CREATE ROLE IF NOT EXISTS gestor_fib;
CREATE ROLE IF NOT EXISTS consultor_fib;
CREATE ROLE IF NOT EXISTS asistente_web;

-- Permisos
GRANT SELECT, INSERT, UPDATE, DELETE ON SGO_FIB.* TO gestor_fib;
GRANT SELECT ON SGO_FIB.* TO consultor_fib;
GRANT SELECT ON SGO_FIB.vw_vista_saldos TO asistente_web;

-- Usuarios
CREATE USER IF NOT EXISTS 'gestor_test'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'consultor_test'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'web_test'@'localhost' IDENTIFIED BY '1234';

-- Asignar roles
GRANT gestor_fib TO 'gestor_test'@'localhost';
GRANT consultor_fib TO 'consultor_test'@'localhost';
GRANT asistente_web TO 'web_test'@'localhost';
