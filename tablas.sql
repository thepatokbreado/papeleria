-- Tabla clientes
CREATE TABLE IF NOT EXISTS clientes(
    id_client INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    dni VARCHAR(9) UNIQUE NOT NULL,
    movil INT(9) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    fAlta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fBaja TIMESTAMP
)
-- Tabla inventario
CREATE TABLE IF NOT EXISTS stock
(
    id_stock INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('revista', 'material escolar', 'chuches') NOT NULL,
    nombre_producto VARCHAR(15) NOT NULL,
    cantidad INT(3) NOT NULL,
    precio DOUBLE(2, 2) NOT NULL,
    disponibilidad TINYINT(1) NOT NULL
)
-- Tabla proveedores
CREATE TABLE IF NOT EXISTS proveedores
(
    id_empresa INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(20) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    contacto INT(15) NOT NULL,
    CP INT(10) NOT NULL
)
-- Tabla trabajadores
CREATE TABLE IF NOT EXISTS trabajadores
(
    id_trabajador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    movil INT(15) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    fAlta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fBaja TIMESTAMP
)
-- Tabla transacciones, al hacer un FOREIGN KEY, mantener UNSIGNED PLS
CREATE TABLE IF NOT EXISTS transacciones
(
    id_transaccion INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_client INT UNSIGNED,
    FOREIGN KEY(id_client) REFERENCES clientes(id_client),
    id_stock INT UNSIGNED,
    FOREIGN KEY(id_stock) REFERENCES stock(id_stock),
    precio DOUBLE(2, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)