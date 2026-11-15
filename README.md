# Festival Database

Proyecto de diseño e implementación de bases de datos para la gestión de un festival de música, desarrollado con **MariaDB, SQL y MongoDB**.

Incluye un modelo de datos relacional, operaciones sobre pulseras de pago, procedimientos almacenados, triggers, vistas, gestión de permisos y ejercicios con bases de datos NoSQL.

Proyecto académico del módulo **M02 – Bases de datos**, del CFGS de Desarrollo de Aplicaciones Multiplataforma (DAM).

## Funcionalidades

### Base de datos relacional — MariaDB

- Creación de tablas con claves primarias, claves foráneas y restricciones de integridad.
- Gestión de asistentes, entradas, artistas, pulseras, recargas y consumiciones.
- Inserción de datos de ejemplo para simular la actividad de un festival.
- Vistas SQL para consultar saldos de pulseras y consumos.
- Procedimientos almacenados para realizar recargas y registrar consumiciones.
- Validación de saldo disponible antes de registrar consumos.
- Triggers para registrar recargas, detectar consumos elevados y comprobar saldos.
- Creación de roles y asignación de permisos mediante sentencias DCL.

### Base de datos NoSQL — MongoDB

- Creación de colecciones de artistas y objetos perdidos.
- Inserción y consulta de documentos.
- Consultas con filtros y operadores.
- Operaciones CRUD sobre documentos.

## Tecnologías utilizadas

- **MariaDB:** sistema de gestión de bases de datos relacionales.
- **SQL:** definición, consulta y manipulación de datos.
- **Procedimientos almacenados y triggers:** automatización y validación de operaciones.
- **DCL:** gestión de usuarios, roles y permisos.
- **MongoDB:** almacenamiento y consulta de documentos NoSQL.

## Estructura del proyecto

```text
festival-database/
├── sql/
│   ├── 01_create_schema.sql
│   ├── 02_insert_data.sql
│   ├── 03_views.sql
│   ├── 04_extra_tables.sql
│   ├── 05_procedures.sql
│   ├── 06_triggers.sql
│   └── 07_roles_dcl.sql
└── mongodb/
    ├── M02_0484_PR01_ejercicio1_siro_gascon_ogasawara.mongodb.js
    └── M02_0484_PR01_ejercicio2_siro_gascon_ogasawara.mongodb.js
```

## Ejecución

### MariaDB

Con una instancia de MariaDB disponible, ejecutar los scripts de la carpeta `sql/` siguiendo su numeración, del `01` al `07`.

El primer script crea la base de datos `SGO_FIB` y sus tablas. Los siguientes incorporan datos de ejemplo, vistas, tablas adicionales, procedimientos, triggers y permisos.

**Nota:** el script de roles y usuarios contiene credenciales de demostración. No deben utilizarse en un entorno de producción.

### MongoDB

Abrir los archivos de `mongodb/` en un entorno compatible con MongoDB y ejecutarlos contra una instancia de prueba.

Los ejercicios utilizan la base de datos `SGO_fib2025_nosql`.

## Contexto académico

Proyecto desarrollado durante el CFGS de Desarrollo de Aplicaciones Multiplataforma, centrado en el diseño de bases de datos, integridad referencial, programación SQL, automatización de operaciones y fundamentos NoSQL.

**Autor:** Siro Gascón Ogasawara
