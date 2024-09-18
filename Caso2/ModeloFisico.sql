
-- -----------------------------------------------------
-- Schema que contiene las tablas de la base de datosxxdxd
-- -----------------------------------------------------
DROP DATABASE IF EXISTS CASO2 ;


-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS CASO2 DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema USUARIO
-- -----------------------------------------------------
USE CASO2 ;

-- -----------------------------------------------------
-- Table Proveedor
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proveedor ;

CREATE TABLE IF NOT EXISTS Proveedor (
  ProveedorID INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Direccion VARCHAR(100) NULL,
  Telefono VARCHAR(15) NULL,
  Correo VARCHAR(50) NULL,
  NombreEmpresa VARCHAR(50) NULL,
  PRIMARY KEY (ProveedorID))
;


-- -----------------------------------------------------
-- Table Inventario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Inventario ;

CREATE TABLE IF NOT EXISTS Inventario (
  InventarioID INT NOT NULL,
  VehiculoID INT NULL,
  SucursalID INT NULL,
  CantidadDispo INT NULL,
  PRIMARY KEY (InventarioID))
;


-- -----------------------------------------------------
-- Table Municipio
-- -----------------------------------------------------
DROP TABLE IF EXISTS Municipio ;

CREATE TABLE IF NOT EXISTS Municipio (
  MunicipioID INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  DepartamentoID INT NULL,
  PRIMARY KEY (MunicipioID))
;


-- -----------------------------------------------------
-- Table Sucursal
-- -----------------------------------------------------
DROP TABLE IF EXISTS Sucursal ;

CREATE TABLE IF NOT EXISTS Sucursal (
  SucursalID INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  SitioWeb VARCHAR(45) NULL,
  MunicipioID INT NULL,
  Inventario_InventarioID INT NOT NULL,
  Municipio_MunicipioID INT NOT NULL,
  PRIMARY KEY (SucursalID),
      FOREIGN KEY (Inventario_InventarioID)
    REFERENCES Inventario (InventarioID)
     FOREIGN KEY (Municipio_MunicipioID)
    REFERENCES Municipio (MunicipioID)
    
;


-- -----------------------------------------------------
-- Table Transaccion
-- -----------------------------------------------------
DROP TABLE IF EXISTS Transaccion ;

CREATE TABLE IF NOT EXISTS Transaccion (
  TransaccionID INT NOT NULL,
  TransacciVeniculoIDoncol INT NULL,
  Tipo VARCHAR(10) NULL,
  FormaPago VARCHAR(10) NULL,
  Monto DECIMAL(10,2) NULL,
  Fecha DATE NULL,
  NombreBanco VARCHAR(10) NULL,
  NumeroTarjeta VARCHAR(20) NULL,
  MotivoDescuento VARCHAR(100) NULL,
  SucurslID INT NULL,
  EmpleadoID INT NULL,
  Hora TIME NULL,
  Sucursal_SucursalID INT NOT NULL,
  PRIMARY KEY (TransaccionID),
     FOREIGN KEY (Sucursal_SucursalID)
    REFERENCES Sucursal (SucursalID)
 ;


-- -----------------------------------------------------
-- Table Vehiculo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Vehiculo ;

CREATE TABLE IF NOT EXISTS Vehiculo (
  VehiculoID INT NOT NULL,
  NumeroPlaca VARCHAR(15) NULL,
  Color VARCHAR(45) NULL,
  Marca VARCHAR(45) NULL,
  Modelo VARCHAR(45) NULL,
  Kilometraje INT NULL,
  Año YEAR(4) NULL,
  Transmision VARCHAR(10) NULL,
  NumeroPuertas INT NULL,
  Condicion VARCHAR(45) NULL,
  ProveedorID INT NULL,
  Veniculocol VARCHAR(45) NULL,
  Proveedor_ProveedorID INT NOT NULL,
  Inventario_InventarioID INT NOT NULL,
  Transaccion_TransaccionID INT NOT NULL,
  PRIMARY KEY (VehiculoID, Transaccion_TransaccionID),

   FOREIGN KEY (Proveedor_ProveedorID)
    REFERENCES Proveedor (ProveedorID)
   
    FOREIGN KEY (Inventario_InventarioID)
    REFERENCES Inventario (InventarioID)
    CONSTRAINT fk_Vehiculo_Transaccion1
    FOREIGN KEY (Transaccion_TransaccionID)
    REFERENCES Transaccion (TransaccionID)
   ;


-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Cliente ;

CREATE TABLE IF NOT EXISTS Cliente (
  ClienteID INT NOT NULL,
  NombreCompleto VARCHAR(100) NULL,
  Direccion VARCHAR(100) NULL,
  Telefono VARCHAR(15) NULL,
  TelefonoCasa VARCHAR(15) NULL,
  CorreoElectronico VARCHAR(45) NULL,
  DPI VARCHAR(20) NULL,
  NIT VARCHAR(20) NULL,
  PRIMARY KEY (ClienteID))
;


-- -----------------------------------------------------
-- Table TarjetaCredito
-- -----------------------------------------------------
DROP TABLE IF EXISTS TarjetaCredito ;

CREATE TABLE IF NOT EXISTS TarjetaCredito (
  TarjetaID INT NOT NULL,
  NumeroTarjeta VARCHAR(20) NULL,
  Banco VARCHAR(50) NULL,
  ClienteID INT NULL,
  Cliente_ClienteID INT NOT NULL,
  PRIMARY KEY (TarjetaID),
     FOREIGN KEY (Cliente_ClienteID)
    REFERENCES Cliente (ClienteID)
 
;


-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
DROP TABLE IF EXISTS Empleado ;

CREATE TABLE IF NOT EXISTS Empleado (
  EmpleadoID INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  DPI VARCHAR(45) NULL,
  NIT VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  SueldoInicial VARCHAR(45) NULL,
  Transaccion_TransaccionID INT NOT NULL,
  PRIMARY KEY (EmpleadoID),
     FOREIGN KEY (Transaccion_TransaccionID)
    REFERENCES Transaccion (TransaccionID)
  ;


-- -----------------------------------------------------
-- Table EmpleadoSucursal
-- -----------------------------------------------------
DROP TABLE IF EXISTS EmpleadoSucursal ;

CREATE TABLE IF NOT EXISTS EmpleadoSucursal (
  EmpleadoID INT NOT NULL,
  SucursalID INT NULL,
  FechaInicio DATE NULL,
  FechaFin DATE NULL,
  Sucursal_SucursalID INT NOT NULL,
  Vehiculo_VehiculoID INT NOT NULL,
  Vehiculo_Transaccion_TransaccionID INT NOT NULL,
    FOREIGN KEY (Sucursal_SucursalID)
    REFERENCES Sucursal (SucursalID)
  CONSTRAINT fk_EmpleadoSucursal_Vehiculo1
    FOREIGN KEY (Vehiculo_VehiculoID , Vehiculo_Transaccion_TransaccionID)
    REFERENCES Vehiculo (VehiculoID , Transaccion_TransaccionID)
  ;


-- -----------------------------------------------------
-- Table Departamento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Departamento ;

CREATE TABLE IF NOT EXISTS Departamento (
  DepartamentoID INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Municipio_MunicipioID INT NOT NULL,
  PRIMARY KEY (DepartamentoID),
    FOREIGN KEY (Municipio_MunicipioID)
    REFERENCES Municipio (MunicipioID)
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
