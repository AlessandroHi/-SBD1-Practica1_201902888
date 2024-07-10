
-- -----------------------------------------------------
-- Schema CASO4
-- -----------------------------------------------------
DROP DATABASE IF EXISTS CASO4 ;

-- -----------------------------------------------------
-- Schema CASO4
-- -----------------------------------------------------
CREATE DATABASE CASO4;
-- -----------------------------------------------------
-- Schema USUARIOS
-- -----------------------------------------------------
USE CASO4 ;

-- -----------------------------------------------------
-- Table CASO4.Avion
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Avion ;

CREATE TABLE CASO4.Avion (
  ID_Avion INT NOT NULL,
  Numero_Vuelo INT NULL,
  Modelo VARCHAR(15) NULL,
  Matricula VARCHAR(15) NULL,
  Asientos_PrimeraClase INT NULL,
  Asientos_ClaseEcono INT NULL,
  Asientos_Ejecutiva INT NULL,
  Fecha_Ultimo_Mante DATE NULL,
  Fecha_Proximo_Mante DATE NULL,
  Fecha_Hora_Despegue_Ultimo_Vuelo DATETIME(15) NULL,
  Fecha_Hora_Aterrizaje_Ultimo_Vuelo DATETIME(15) NULL,
  Galones_Gasolina INT NULL,
  Distancia_Max_Viaje INT NULL,
  Altura_Max_Soporta INT NULL,
  PRIMARY KEY (ID_Avion))
;


-- -----------------------------------------------------
-- Table CASO4.Mantenimiento
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Mantenimiento ;

CREATE TABLE CASO4.Mantenimiento (
  ID_Mantenimiento INT NOT NULL,
  ID_Avion INT NULL,
  Tipo TINYINT NULL,
  Fecha_Hota DATETIME(15) NULL,
  Observaciones VARCHAR(45) NULL,
  Problemas VARCHAR(45) NULL,
  ID_Empleado INT NULL,
  Avion_ID_Avion INT NOT NULL,
  PRIMARY KEY (ID_Mantenimiento),
     FOREIGN KEY (Avion_ID_Avion)
    REFERENCES CASO4.Avion (ID_Avion))
 
;


-- -----------------------------------------------------
-- Table CASO4.Historia_DepositosYRetiros
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Historia_DepositosYRetiros ;

CREATE TABLE CASO4.Historia_DepositosYRetiros (
  ID_Historial INT NOT NULL,
  ID_Empleado INT NULL,
  Fecha_Retiro DATE NULL,
  Razon VARCHAR(45) NULL,
  PRIMARY KEY (ID_Historial))
;


-- -----------------------------------------------------
-- Table CASO4.Control_Asistencia
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Control_Asistencia ;

CREATE TABLE CASO4.Control_Asistencia (
  ID_Asistencia INT NOT NULL,
  ID_Empleado INT NULL,
  Fecha DATE NULL,
  Hora_Salida TIME NULL,
  Hora_Entrada TIME NULL,
  Motivo_Inasistencia VARCHAR(15) NULL,
  PRIMARY KEY (ID_Asistencia))
;


-- -----------------------------------------------------
-- Table CASO4.Empleado
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Empleado ;

CREATE TABLE CASO4.Empleado (
  ID_Empleado INT NOT NULL,
  Nombre VARCHAR(15) NULL,
  Apellido VARCHAR(15) NULL,
  Edad INT NULL,
  CUI VARCHAR(30) NULL,
  Direccion VARCHAR(30) NULL,
  Fecha_Contratacion DATE NULL,
  Fecha_Nacimiento DATE NULL,
  Correo VARCHAR(45) NULL,
  Telefono VARCHAR(15) NULL,
  Idiomas VARCHAR(45) NULL,
  Puesto VARCHAR(30) NULL,
  Jornada_Laboral VARCHAR(45) NULL,
  Hora_Inicio_Turno TIME NULL,
  Hora_Final_Turno TIME NULL,
  Mantenimiento_ID_Mantenimiento INT NOT NULL,
  Historia_DepositosYRetiros_ID_Historial INT NOT NULL,
  Control_Asistencia_ID_Asistencia INT NOT NULL,
  PRIMARY KEY (ID_Empleado),
    FOREIGN KEY (Mantenimiento_ID_Mantenimiento)
    REFERENCES CASO4.Mantenimiento (ID_Mantenimiento),
        FOREIGN KEY (Historia_DepositosYRetiros_ID_Historial)
    REFERENCES CASO4.Historia_DepositosYRetiros (ID_Historial),
 
    FOREIGN KEY (Control_Asistencia_ID_Asistencia)
    REFERENCES CASO4.Control_Asistencia (ID_Asistencia))
    ;


-- -----------------------------------------------------
-- Table CASO4.Cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Cliente ;

CREATE TABLE CASO4.Cliente (
  ID_Cliente INT NOT NULL,
  Nombre VARCHAR(15) NULL,
  Apellido VARCHAR(15) NULL,
  Edad INT NULL,
  CUI VARCHAR(45) NULL,
  Fecha_Nacimiento DATE NULL,
  Correo VARCHAR(15) NULL,
  Telefono VARCHAR(15) NULL,
  Direccion VARCHAR(15) NULL,
  Codigo_Postal VARCHAR(10) NULL,
  Numero_Pasaporte VARCHAR(30) NULL,
  PRIMARY KEY (ID_Cliente))
;


-- -----------------------------------------------------
-- Table CASO4.Pago
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Pago ;

CREATE TABLE CASO4.Pago (
  Numero_Pago INT NOT NULL,
  Numero_Tarjeta VARCHAR(30) NULL,
  Tipo_Tarjeta VARCHAR(20) NULL,
  Monto_Total INT NULL,
  Numero_Boleto INT NULL,
  PRIMARY KEY (Numero_Pago))
;


-- -----------------------------------------------------
-- Table CASO4.Boleto
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Boleto ;

CREATE TABLE CASO4.Boleto (
  Numero_Boleto INT NOT NULL,
  ID_Cliente INT NULL,
  Forma_Pago VARCHAR(30) NULL,
  Lugar_Origen VARCHAR(45) NULL,
  Lugar_Destino VARCHAR(45) NULL,
  Clase_Viaje VARCHAR(45) NULL,
  Fecha_Viaje DATE NULL,
  Fecha_Regreso DATE NULL,
  Paso_Equipaje_Permitido VARCHAR(30) NULL,
  Restricciones_Cambios VARCHAR(30) NULL,
  Fecha_Validez DATE NULL,
  Numero_Vuelo INT NULL,
  Directo_Escala VARCHAR(45) NULL,
  Cliente_ID_Cliente INT NOT NULL,
  Pago_Numero_Pago INT NOT NULL,
  PRIMARY KEY (Numero_Boleto),
     FOREIGN KEY (Cliente_ID_Cliente)
    REFERENCES CASO4.Cliente (ID_Cliente),
    FOREIGN KEY (Pago_Numero_Pago)
    REFERENCES CASO4.Pago (Numero_Pago))
;


-- -----------------------------------------------------
-- Table CASO4.Tripulacion
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Tripulacion ;

CREATE TABLE CASO4.Tripulacion (
  ID_Tripulacion INT NOT NULL,
  ID_Empleado INT NULL,
  Empleado_ID_Empleado INT NOT NULL,
  PRIMARY KEY (ID_Tripulacion),
  
    FOREIGN KEY (Empleado_ID_Empleado)
    REFERENCES CASO4.Empleado (ID_Empleado)
  )
;


-- -----------------------------------------------------
-- Table CASO4.Viaje
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO4.Viaje ;

CREATE TABLE CASO4.Viaje (
  Numero_Viaje INT NOT NULL,
  ID_Avion INT NULL,
  ID_Tripulacion INT NULL,
  Numero_Pasajero INT NULL,
  Fecha_Hora_Despegue DATETIME(15) NULL,
  Ciudad_Despegue VARCHAR(45) NULL,
  Pais_Despegue VARCHAR(45) NULL,
  Fecha_Hora_Aterrizaje DATETIME(15) NULL,
  Ciudad_Aterrzaje VARCHAR(45) NULL,
  Pais_Aterrizaje VARCHAR(45) NULL,
  Empleado_ID_Empleado INT NOT NULL,
  Tripulacion_ID_Tripulacion INT NOT NULL,
  Avion_ID_Avion INT NOT NULL,
  PRIMARY KEY (Numero_Viaje),
    FOREIGN KEY (Empleado_ID_Empleado)
    REFERENCES CASO4.Empleado (ID_Empleado),
    FOREIGN KEY (Tripulacion_ID_Tripulacion)
    REFERENCES CASO4.Tripulacion (ID_Tripulacion),
    FOREIGN KEY (Avion_ID_Avion)
    REFERENCES CASO4.Avion (ID_Avion))
;

