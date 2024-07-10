-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CASO6
-- -----------------------------------------------------
DROP DATABASE IF EXISTS CASO6 ;

-- -----------------------------------------------------
-- Schema CASO6
-- -----------------------------------------------------
CREATE DATABASE CASO6;
USE CASO6 ;

-- -----------------------------------------------------
-- Table CASO6.Victima
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO6.Victima ;

CREATE TABLE CASO6.Victima (
  idVictima INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  edad INT NULL,
  fecha_nacimiento DATE NULL,
  lugarNacimiento VARCHAR(45) NULL,
  residenciaActual VARCHAR(45) NULL,
  telefono VARCHAR(10) NULL,
  PRIMARY KEY (idVictima));


-- -----------------------------------------------------
-- Table CASO6.ADNregistrado
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO6.ADNregistrado ;

CREATE TABLE CASO6.ADNregistrado (
  idADNregistrado INT NOT NULL,
  muestraADN VARCHAR(45) NULL,
  PRIMARY KEY (idADNregistrado));


-- -----------------------------------------------------
-- Table CASO6.Denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO6.Denuncia ;

CREATE TABLE CASO6.Denuncia (
  idDenuncia INT NOT NULL,
  nombre_denunciante VARCHAR(30) NULL,
  fechaDenuncia DATE NULL,
  fechaDesaparion DATE NULL,
  nombreDesaparecido VARCHAR(45) NULL,
  apellidoDesaparecido VARCHAR(45) NULL,
  profesion VARCHAR(45) NULL,
  edad_desaparecido INT NULL,
  altura_desaparecido INT NULL,
  complexionFisica VARCHAR(45) NULL,
  Victima_idVictima INT NOT NULL,
  ADNregistrado_idADNregistrado INT NOT NULL,
  PRIMARY KEY (idDenuncia),
    FOREIGN KEY (Victima_idVictima)
    REFERENCES CASO6.Victima (idVictima),
    FOREIGN KEY (ADNregistrado_idADNregistrado)
    REFERENCES CASO6.ADNregistrado (idADNregistrado));


-- -----------------------------------------------------
-- Table CASO6.Hallazgo
-- -----------------------------------------------------
DROP TABLE IF EXISTS CASO6.Hallazgo ;

CREATE TABLE CASO6.Hallazgo (
  idHallazgo INT NOT NULL,
  ubicacionHallazgo VARCHAR(20) NULL,
  ADN_hallazgo VARCHAR(45) NULL,
  altura_calculada INT NULL,
  edad_calculada INT NULL,
  objetos_encontrados VARCHAR(45) NULL,
  Denuncia_idDenuncia INT NOT NULL,
  PRIMARY KEY (idHallazgo),
    FOREIGN KEY (Denuncia_idDenuncia)
    REFERENCES CASO6.Denuncia (idDenuncia));
