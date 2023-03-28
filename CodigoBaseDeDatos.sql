-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Compradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compradores` (
  `idCompradores` INT NOT NULL,
  `PrimerNombre` VARCHAR(45) NOT NULL,
  `SegundoNombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Num.Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompradores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `idProveedores` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Proveedorescol` VARCHAR(45) NULL,
  `No.Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoDePago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoDePago` (
  `idTipoDePago` INT NOT NULL,
  `efectivo` VARCHAR(45) NOT NULL,
  `Tarjeta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDePago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `idPedidos` INT NOT NULL,
  `CostoDeEnvio` VARCHAR(45) NOT NULL,
  `DireccionEntrega` VARCHAR(45) NOT NULL,
  `DescripcionDeEnvio` VARCHAR(45) NOT NULL,
  `TipoDePago_idTipoDePago` INT NOT NULL,
  PRIMARY KEY (`idPedidos`),
  INDEX `fk_Pedidos_TipoDePago1_idx` (`TipoDePago_idTipoDePago` ASC),
  CONSTRAINT `fk_Pedidos_TipoDePago1`
    FOREIGN KEY (`TipoDePago_idTipoDePago`)
    REFERENCES `mydb`.`TipoDePago` (`idTipoDePago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

Select * from Pedidos;
-- -----------------------------------------------------
-- Table `mydb`.`Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Platillos` (
  `idPlatillos` INT NOT NULL,
  `Platillo` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Imagen` VARCHAR(45) NOT NULL,
  `Horarios` VARCHAR(45) NOT NULL,
  `Direccion` varchar(45) not null,
  `Costos` VARCHAR(45) NULL,
  `Calificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlatillos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Repartidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Repartidor` (
  `idRepartidor` INT NOT NULL,
  `PrimerNombre` VARCHAR(45) NOT NULL,
  `SegundoNombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `Num.Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRepartidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compradores_has_Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compradores_has_Pedidos` (
  `Compradores_idCompradores` INT NOT NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  PRIMARY KEY (`Compradores_idCompradores`, `Pedidos_idPedidos`),
  INDEX `fk_Compradores_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC),
  INDEX `fk_Compradores_has_Pedidos_Compradores1_idx` (`Compradores_idCompradores` ASC),
  CONSTRAINT `fk_Compradores_has_Pedidos_Compradores1`
    FOREIGN KEY (`Compradores_idCompradores`)
    REFERENCES `mydb`.`Compradores` (`idCompradores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compradores_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `mydb`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

select * from Compradores_has_Pedidos;
-- -----------------------------------------------------
-- Table `mydb`.`Repartidor_has_Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Repartidor_has_Pedidos` (
  `Repartidor_idRepartidor` INT NOT NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  PRIMARY KEY (`Repartidor_idRepartidor`, `Pedidos_idPedidos`),
  INDEX `fk_Repartidor_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC),
  INDEX `fk_Repartidor_has_Pedidos_Repartidor1_idx` (`Repartidor_idRepartidor` ASC),
  CONSTRAINT `fk_Repartidor_has_Pedidos_Repartidor1`
    FOREIGN KEY (`Repartidor_idRepartidor`)
    REFERENCES `mydb`.`Repartidor` (`idRepartidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Repartidor_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `mydb`.`Pedidos` (`idPedidos`)
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

select * from Repartidor_has_Pedidos;
-- -----------------------------------------------------
-- Table `mydb`.`Proveedores_has_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores_has_Platillos` (
  `Proveedores_idProveedores` INT NOT NULL,
  `Platillos_idPlatillos` INT NOT NULL,
  PRIMARY KEY (`Proveedores_idProveedores`, `Platillos_idPlatillos`),
  INDEX `fk_Proveedores_has_Platillos_Platillos1_idx` (`Platillos_idPlatillos` ASC),
  INDEX `fk_Proveedores_has_Platillos_Proveedores1_idx` (`Proveedores_idProveedores` ASC),
  CONSTRAINT `fk_Proveedores_has_Platillos_Proveedores1`
    FOREIGN KEY (`Proveedores_idProveedores`)
    REFERENCES `mydb`.`Proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedores_has_Platillos_Platillos1`
    FOREIGN KEY (`Platillos_idPlatillos`)
    REFERENCES `mydb`.`Platillos` (`idPlatillos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
select * from Proveedores_has_Platillos;


-- -----------------------------------------------------
-- Table `mydb`.`Platillos_has_Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Platillos_has_Pedidos` (
  `Platillos_idPlatillos` INT NOT NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  PRIMARY KEY (`Platillos_idPlatillos`, `Pedidos_idPedidos`),
  INDEX `fk_Platillos_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC),
  INDEX `fk_Platillos_has_Pedidos_Platillos1_idx` (`Platillos_idPlatillos` ASC),
  CONSTRAINT `fk_Platillos_has_Pedidos_Platillos1`
    FOREIGN KEY (`Platillos_idPlatillos`)
    REFERENCES `mydb`.`Platillos` (`idPlatillos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Platillos_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `mydb`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
select * from Platillos_has_Pedidos;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
