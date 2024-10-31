DROP DATABASE IF EXISTS base_rentacar;
CREATE DATABASE base_rentacar;
USE base_rentacar;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni BIGINT NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono BIGINT
);

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cat VARCHAR(100) NOT NULL UNIQUE,
    desc_cat VARCHAR(200),
    valor_diario_cat DECIMAL(10, 2) NOT NULL,
    cant_pasajeros INT NOT NULL
);

CREATE TABLE Modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    nombre_modelo VARCHAR(100) NOT NULL,
    transmision ENUM('Manual', 'Automático') NOT NULL DEFAULT 'Manual'
);

CREATE TABLE Vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    dominio VARCHAR(20) NOT NULL UNIQUE,
    año_creacion YEAR NOT NULL,
    kilometraje_actual INT NOT NULL DEFAULT 0,
    id_modelo INT NOT NULL,
    id_categoria INT NOT NULL
);

CREATE TABLE Contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    cant_dias INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    fecha_salida DATE NOT NULL,
    fecha_retorno DATE NOT NULL
);


ALTER TABLE Contratos
    ADD CONSTRAINT fk_contratos_clientes FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    ADD CONSTRAINT fk_contratos_vehiculos FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo);

ALTER TABLE Vehiculos
    ADD CONSTRAINT fk_vehiculos_modelo FOREIGN KEY (id_modelo) REFERENCES Modelo(id_modelo),
    ADD CONSTRAINT fk_vehiculos_categoria FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria);
    
    
