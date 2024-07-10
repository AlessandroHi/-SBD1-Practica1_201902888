-- -----------------------------------------------------
-- Schema CASO5
-- -----------------------------------------------------
DROP DATABASE IF EXISTS CASO5;

CREATE DATABASE  CASO5;
USE CASO5;

-- -----------------------------------------------------
-- Table CASO5.Puesto
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Puesto;

CREATE TABLE CASO5.Puesto (
  ID_Puesto INT NOT NULL,
  Nombre_Puesto VARCHAR(15) NULL,
  PRIMARY KEY (ID_Puesto)
);

-- -----------------------------------------------------
-- Table CASO5.Cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Cliente;

CREATE TABLE CASO5.Cliente (
  ID_Cliente INT NOT NULL,
  Nombre_Cliente VARCHAR(30) NULL,
  Apellidos VARCHAR(30) NULL,
  CUI VARCHAR(30) NULL,
  Fecha_Nacimiento DATE NULL,
  Telefono VARCHAR(15) NULL,
  Direccion VARCHAR(30) NULL,
  Edad INT NULL,
  Correo VARCHAR(50) NULL,
  PRIMARY KEY (ID_Cliente)
);

-- -----------------------------------------------------
-- Table CASO5.Seguro
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Seguro;

CREATE TABLE CASO5.Seguro (
  ID_Seguro INT NOT NULL,
  Tipo_Seguro VARCHAR(15) NULL,
  PRIMARY KEY (ID_Seguro)
);

-- -----------------------------------------------------
-- Table CASO5.Poliza
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Poliza;

CREATE TABLE CASO5.Poliza (
  ID_Poliza INT NOT NULL,
  ID_Empleado INT NULL,
  ID_Cliente INT NULL,
  ID_Seguro INT NULL,
  Fecha_Inicio DATE NULL,
  Fecha_Final DATE NULL,
  Monto_Poliza DECIMAL(10, 2) NULL,
  Frecuencia_Pago VARCHAR(10) NULL,
  PRIMARY KEY (ID_Poliza),
  FOREIGN KEY (ID_Cliente) REFERENCES CASO5.Cliente(ID_Cliente),
  FOREIGN KEY (ID_Seguro) REFERENCES CASO5.Seguro(ID_Seguro)
);

-- -----------------------------------------------------
-- Table CASO5.Empleado
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Empleado;

CREATE TABLE CASO5.Empleado (
  ID_Empleado INT NOT NULL,
  Nombre VARCHAR(30) NULL,
  Apellido VARCHAR(30) NULL,
  DPI VARCHAR(30) NULL,
  Fecha_Nacimiento DATE NULL,
  Fecha_Inicio_Laboral DATE NULL,
  Edad INT NULL,
  Telefono VARCHAR(15) NULL,
  Direccion VARCHAR(30) NULL,
  Salario DECIMAL(10, 2) NULL,
  ID_Puesto INT NULL,
  ID_Departamento INT NULL,
  PRIMARY KEY (ID_Empleado),
  FOREIGN KEY (ID_Puesto) REFERENCES CASO5.Puesto(ID_Puesto)
);

-- -----------------------------------------------------
-- Table CASO5.Area
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Area;

CREATE TABLE CASO5.Area (
  ID_Area INT NOT NULL,
  Nombre_Area VARCHAR(30) NULL,
  PRIMARY KEY (ID_Area)
);

-- -----------------------------------------------------
-- Table CASO5.Departamento
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Departamento;

CREATE TABLE CASO5.Departamento (
  ID_Departamento INT NOT NULL,
  Nombre_Departamento VARCHAR(45) NULL,
  ID_Area INT NULL,
  PRIMARY KEY (ID_Departamento),
  FOREIGN KEY (ID_Area) REFERENCES CASO5.Area(ID_Area)
);

-- -----------------------------------------------------
-- Table CASO5.Funcion
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Funcion;

CREATE TABLE CASO5.Funcion (
  ID_Funcion INT NOT NULL,
  Descripcion VARCHAR(45) NULL,
  ID_Departamento INT NULL,
  PRIMARY KEY (ID_Funcion),
  FOREIGN KEY (ID_Departamento) REFERENCES CASO5.Departamento(ID_Departamento)
);

-- -----------------------------------------------------
-- Table CASO5.Llamada
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Llamada;

CREATE TABLE CASO5.Llamada (
  ID_Llamada INT NOT NULL,
  ID_Empleado INT NULL,
  Nombre_Cliente VARCHAR(20) NULL,
  Numero_Telefono VARCHAR(15) NULL,
  ID_Seguro INT NULL,
  Fecha_Hora_Llamada DATETIME NULL,
  Duracion_Llamada TIME NULL,
  PRIMARY KEY (ID_Llamada),
  FOREIGN KEY (ID_Empleado) REFERENCES CASO5.Empleado(ID_Empleado),
  FOREIGN KEY (ID_Seguro) REFERENCES CASO5.Seguro(ID_Seguro)
);

-- -----------------------------------------------------
-- Table CASO5.Pago
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO5.Pago;

CREATE TABLE CASO5.Pago (
  ID_Pago INT NOT NULL,
  Tarifa_Pagar DECIMAL(10, 2) NULL,
  Mora DECIMAL(10, 2) NULL,
  Monto DECIMAL(10, 2) NULL,
  Forma_Pago VARCHAR(45) NULL,
  ID_Empleado INT NULL,
  ID_Cliente INT NULL,
  ID_Poliza INT NULL,
  PRIMARY KEY (ID_Pago),
  FOREIGN KEY (ID_Cliente) REFERENCES CASO5.Cliente(ID_Cliente),
  FOREIGN KEY (ID_Empleado) REFERENCES CASO5.Empleado(ID_Empleado),
  FOREIGN KEY (ID_Poliza) REFERENCES CASO5.Poliza(ID_Poliza)
);

