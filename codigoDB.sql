-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema comida
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comida
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comida` DEFAULT CHARACTER SET utf8mb4 ;
USE `comida` ;

-- -----------------------------------------------------
-- Table `comida`.`compradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`compradores` (
  `idCompradoresC` INT(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombreC` VARCHAR(45) NOT NULL,
  `SegundoNombreC` VARCHAR(45) NOT NULL,
  `PrimerApellidoC` VARCHAR(45) NOT NULL,
  `SegundoApellidoC` VARCHAR(45) NOT NULL,
  `DireccionC` VARCHAR(45) NOT NULL,
  `Num_TelefonoC` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompradoresC`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comida`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`status` (
  `idstatus` INT(11) NOT NULL AUTO_INCREMENT,
  `Pagado` VARCHAR(45) NULL DEFAULT NULL,
  `NoPagado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `comida`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`proveedores` (
  `idProveedoresP` INT(11) NULL,
  `PrimerNombreP` VARCHAR(45) NULL DEFAULT NULL,
  `SegundoNombreP` VARCHAR(45) NULL DEFAULT NULL,
  `PrimerApellidoP` VARCHAR(45) NULL DEFAULT NULL,
  `SegundoApellidoP` VARCHAR(45) NULL DEFAULT NULL,
  `DireccionP` VARCHAR(45) NOT NULL,
  `ProveedorescolP` VARCHAR(45) NULL DEFAULT NULL,
  `No_TelefonoP` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`DireccionP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `comida`.`platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`platillos` (
  `idPlatillosPL` INT(11) NOT NULL AUTO_INCREMENT,
  `PlatilloPL` VARCHAR(45) NOT NULL,
  `DescripcionPL` VARCHAR(45) NOT NULL,
  `ImagenPL` VARCHAR(45) NOT NULL,
  `HorariosPL` VARCHAR(45) NOT NULL,
  `DireccionPL` VARCHAR(45) NOT NULL,
  `CostosPL` VARCHAR(45) NULL DEFAULT NULL,
  `CalificacionPL` VARCHAR(45) NULL DEFAULT NULL,
  `DireccionP` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPlatillosPL`),
  INDEX `DireccionP` (`DireccionP` ASC) ,
  CONSTRAINT `platillos_ibfk_1`
    FOREIGN KEY (`DireccionP`)
    REFERENCES `comida`.`proveedores` (`DireccionP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `comida`.`tipodepago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`tipodepago` (
  `idTipoDePago` INT(11) NOT NULL AUTO_INCREMENT,
  `efectivo` VARCHAR(45) NOT NULL,
  `Tarjeta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDePago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `comida`.`repartidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`repartidor` (
  `idRepartidorR` INT(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombreR` VARCHAR(45) NOT NULL,
  `SegundoNombreR` VARCHAR(45) NOT NULL,
  `PrimerApellidoR` VARCHAR(45) NOT NULL,
  `SegundoApellidoR` VARCHAR(45) NOT NULL,
  `Num_TelefonoR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRepartidorR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `comida`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comida`.`pedidos` (
  `idPedidos` INT(11) NOT NULL AUTO_INCREMENT,
  `CostoDeEnvio` VARCHAR(45) NOT NULL,
  `DireccionEntrega` VARCHAR(45) NOT NULL,
  `DescripcionDeEnvio` VARCHAR(45) NOT NULL,
  `idCompradoresC` INT(11) NULL DEFAULT NULL,
  `idPlatillosPL` INT(11) NULL DEFAULT NULL,
  `idTipoDePago` INT(11) NULL DEFAULT NULL,
  `idRepartidorR` INT(11) NULL DEFAULT NULL,
  `status_idstatus` INT(11) NOT NULL,
  PRIMARY KEY (`idPedidos`),
  INDEX `idCompradoresC` (`idCompradoresC` ASC) ,
  INDEX `idPlatillosPL` (`idPlatillosPL` ASC) ,
  INDEX `idTipoDePago` (`idTipoDePago` ASC),
  INDEX `idRepartidorR` (`idRepartidorR` ASC),
  INDEX `fk_pedidos_status1_idx` (`status_idstatus` ASC) ,
  CONSTRAINT `fk_pedidos_status1`
    FOREIGN KEY (`status_idstatus`)
    REFERENCES `comida`.`status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pedidos_ibfk_1`
    FOREIGN KEY (`idCompradoresC`)
    REFERENCES `comida`.`compradores` (`idCompradoresC`),
  CONSTRAINT `pedidos_ibfk_2`
    FOREIGN KEY (`idPlatillosPL`)
    REFERENCES `comida`.`platillos` (`idPlatillosPL`),
  CONSTRAINT `pedidos_ibfk_3`
    FOREIGN KEY (`idTipoDePago`)
    REFERENCES `comida`.`tipodepago` (`idTipoDePago`),
  CONSTRAINT `pedidos_ibfk_4`
    FOREIGN KEY (`idRepartidorR`)
    REFERENCES `comida`.`repartidor` (`idRepartidorR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
