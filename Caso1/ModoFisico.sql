
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS CASO1 ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS CASO1 DEFAULT CHARACTER SET utf8;
-- -----------------------------------------------------
-- Schema USUARIO
-- -----------------------------------------------------
USE CASO1;

-- -----------------------------------------------------
-- Table Proveedor
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proveedor;

CREATE TABLE IF NOT EXISTS Proveedor (
  ID_Proveedor INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  Correo VARCHAR(45) NULL,
  Nombre_empresa VARCHAR(45) NULL,
  PRIMARY KEY (ID_Proveedor)
);

-- -----------------------------------------------------
-- Table ProductoProveedor
-- -----------------------------------------------------
DROP TABLE IF EXISTS ProductoProveedor;

CREATE TABLE IF NOT EXISTS ProductoProveedor (
  ID_ProductoProveedor INT NOT NULL,
  ID_Proveedor INT NULL,
  Tipo_producto VARCHAR(45) NULL,
  Cantidad INT NULL,
  Precio_unitario DECIMAL(16, 2) NULL,
  Precio_total DECIMAL(32, 2) NULL,
  Fecha_ingreso DATE NULL,
  Categoria VARCHAR(45) NULL,
  Proveedor_ID_Proveedor INT NOT NULL,
  PRIMARY KEY (ID_ProductoProveedor),
  INDEX fk_ProductoProveedor_Proveedor1_idx (Proveedor_ID_Proveedor ASC) VISIBLE,
  CONSTRAINT fk_ProductoProveedor_Proveedor1
    FOREIGN KEY (Proveedor_ID_Proveedor)
    REFERENCES Proveedor (ID_Proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table Tienda
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tienda;

CREATE TABLE IF NOT EXISTS Tienda (
  Numero_de_tienda INT NOT NULL,
  Departamento VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Tipo_de_tienda VARCHAR(45) NULL,
  Descriptores VARCHAR(45) NULL,
  PRIMARY KEY (Numero_de_tienda)
);

-- -----------------------------------------------------
-- Table Reclamo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Reclamo;

CREATE TABLE IF NOT EXISTS Reclamo (
  ID_Reclamo INT NOT NULL,
  ID_de_Pedido INT NULL,
  Tipo_de_reclamo VARCHAR(45) NULL,
  Producto VARCHAR(45) NULL,
  Descriptores VARCHAR(45) NULL,
  PRIMARY KEY (ID_Reclamo)
);

-- -----------------------------------------------------
-- Table Pedido
-- -----------------------------------------------------
DROP TABLE IF EXISTS Pedido;

CREATE TABLE IF NOT EXISTS Pedido (
  ID_de_Pedido INT NOT NULL,
  Fecha_de_entrega DATE NULL,
  Monto_total DECIMAL(16, 2) NULL,
  Muelle_de_carga VARCHAR(45) NULL,
  Tipo_de_pedido VARCHAR(45) NULL,
  Tienda_Numero_de_tienda INT NOT NULL,
  Reclamo_ID_Reclamo INT NOT NULL,
  PRIMARY KEY (ID_de_Pedido),
  FOREIGN KEY (Tienda_Numero_de_tienda)
    REFERENCES Tienda (Numero_de_tienda),
  FOREIGN KEY (Reclamo_ID_Reclamo)
    REFERENCES Reclamo (ID_Reclamo)
);

-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------
DROP TABLE IF EXISTS Producto;

CREATE TABLE IF NOT EXISTS Producto (
  SKU VARCHAR(13) NOT NULL,
  Categoria VARCHAR(45) NULL,
  Fecha_Entrada DATE NULL,
  Linea VARCHAR(45) NULL,
  Asignacion_espacio VARCHAR(45) NULL,
  ProductoProveedor_ID_ProductoProveedor INT NOT NULL,
  Pedido_ID_de_Pedido INT NOT NULL,
  PRIMARY KEY (SKU),
  FOREIGN KEY (ProductoProveedor_ID_ProductoProveedor)
    REFERENCES ProductoProveedor (ID_ProductoProveedor),
  FOREIGN KEY (Pedido_ID_de_Pedido)
    REFERENCES Pedido (ID_de_Pedido)
);

-- -----------------------------------------------------
-- Table Vehiculo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Vehiculo;

CREATE TABLE IF NOT EXISTS Vehiculo (
  ID_de_Vehiculo INT NOT NULL,
  Tipo VARCHAR(45) NULL,
  Placa VARCHAR(45) NULL,
  Marca VARCHAR(45) NULL,
  Modelo INT NULL,
  PRIMARY KEY (ID_de_Vehiculo)
);

-- -----------------------------------------------------
-- Table Ruta
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ruta;

CREATE TABLE IF NOT EXISTS Ruta (
  ID_de_Ruta INT NOT NULL,
  Origen VARCHAR(45) NULL,
  Destino VARCHAR(45) NULL,
  Detalles_del_itinerario VARCHAR(45) NULL,
  Vehiculo_ID_de_Vehiculo INT NOT NULL,
  PRIMARY KEY (ID_de_Ruta),
  FOREIGN KEY (Vehiculo_ID_de_Vehiculo)
    REFERENCES Vehiculo (ID_de_Vehiculo)
);

-- -----------------------------------------------------
-- Table Area_trabajo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Area_trabajo;

CREATE TABLE IF NOT EXISTS Area_trabajo (
  ID_Area INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Tipo_area VARCHAR(45) NULL,
  PRIMARY KEY (ID_Area)
);

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
DROP TABLE IF EXISTS Empleado;

CREATE TABLE IF NOT EXISTS Empleado (
  Numero_de_empleado VARCHAR(7) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Rol VARCHAR(45) NULL,
  Area_de_trabajo VARCHAR(45) NULL,
  Sueldo DECIMAL(16, 2) NULL,
  Edad INT NULL,
  Jornada VARCHAR(45) NULL,
  Equipo_asignado VARCHAR(45) NULL,
  Rendimiento VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  Numero_de_IGSS VARCHAR(45) NULL,
  Correo VARCHAR(45) NULL,
  Area_trabajo_ID_Area INT NOT NULL,
  PRIMARY KEY (Numero_de_empleado),
  FOREIGN KEY (Area_trabajo_ID_Area)
    REFERENCES Area_trabajo (ID_Area)
);

-- -----------------------------------------------------
-- Table Falta
-- -----------------------------------------------------
DROP TABLE IF EXISTS Falta;

CREATE TABLE IF NOT EXISTS Falta (
  ID_de_Falta INT NOT NULL,
  Numero_de_empleado VARCHAR(7) NULL,
  Tipo_de_falta VARCHAR(16) NULL,
  Descripcion VARCHAR(45) NULL,
  Incidencias VARCHAR(45) NULL,
  Empleado_Numero_de_empleado VARCHAR(7) NOT NULL,
  PRIMARY KEY (ID_de_Falta),
  FOREIGN KEY (Empleado_Numero_de_empleado)
    REFERENCES Empleado (Numero_de_empleado)
);

-- -----------------------------------------------------
-- Table Equipo
-- -----------------------------------------------------
DROP TABLE IF NOT EXISTS Equipo;

CREATE TABLE IF NOT EXISTS Equipo (
  ID_Equipo INT NOT NULL,
  Tipo VARCHAR(45) NULL,
  Descripcion VARCHAR(45) NULL,
  Empleado_a_cargo VARCHAR(7) NULL,
  Ultimo_mantenimiento DATE NULL,
  Empleado_Numero_de_empleado VARCHAR(7) NOT NULL,
  PRIMARY KEY (ID_Equipo),
  FOREIGN KEY (Empleado_Numero_de_empleado)
    REFERENCES Empleado (Numero_de_empleado)
);

-- -----------------------------------------------------
-- Table Capacitacion
-- -----------------------------------------------------
DROP TABLE IF EXISTS Capacitacion;

CREATE TABLE IF NOT EXISTS Capacitacion (
  ID_Capacitacion INT NOT NULL,
  Tema VARCHAR(45) NULL,
  Personal_capacitar VARCHAR(7) NULL,
  Fecha_capacitacion DATE NULL,
  Tiempo_estimado TIME NULL,
  Persona_encargada VARCHAR(45) NULL,
  Certificado TINYINT NULL,
  Lugar VARCHAR(45) NULL,
  Empleado_Numero_de_empleado VARCHAR(7) NOT NULL,
  PRIMARY KEY (ID_Capacitacion),
  FOREIGN KEY (Empleado_Numero_de_empleado)
    REFERENCES Empleado (Numero_de_empleado)
);

-- -----------------------------------------------------
-- Ajustes finales
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
