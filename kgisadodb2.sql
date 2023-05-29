-- MySQL Workbench Synchronization
-- Generated: 2023-05-22 12:31
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: marvk

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



CREATE TABLE IF NOT EXISTS `kgisadodb`.`compradores` (
  `idCompradores` INT(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` VARCHAR(45) NOT NULL,
  `SegundoNombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `NumTelefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompradores`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`compradores_has_pedidos` (
  `Compradores_idCompradores` INT(11) NOT NULL,
  `Pedidos_idPedidos` INT(11) NOT NULL,
  PRIMARY KEY (`Compradores_idCompradores`, `Pedidos_idPedidos`),
  INDEX `fk_Compradores_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
  INDEX `fk_Compradores_has_Pedidos_Compradores1_idx` (`Compradores_idCompradores` ASC) VISIBLE,
  CONSTRAINT `fk_Compradores_has_Pedidos_Compradores1`
    FOREIGN KEY (`Compradores_idCompradores`)
    REFERENCES `kgisadodb`.`compradores` (`idCompradores`),
  CONSTRAINT `fk_Compradores_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `kgisadodb`.`pedidos` (`idPedidos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`pedidos` (
  `idPedidos` INT(11) NOT NULL AUTO_INCREMENT,
  `CostoDeEnvio` VARCHAR(45) NOT NULL,
  `DireccionEntrega` VARCHAR(45) NOT NULL,
  `DescripcionDeEnvio` VARCHAR(45) NOT NULL,
  `TipoDePago_idTipoDePago` INT(11) NOT NULL,
  PRIMARY KEY (`idPedidos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`platillos` (
  `idPlatillos` INT(11) NOT NULL AUTO_INCREMENT,
  `Platillo` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Imagen` VARCHAR(45) NOT NULL,
  `Horarios` VARCHAR(45) NOT NULL,
  `Costos` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `Calificacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPlatillos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`platillos_has_pedidos` (
  `Platillos_idPlatillos` INT(11) NOT NULL,
  `Pedidos_idPedidos` INT(11) NOT NULL,
  PRIMARY KEY (`Platillos_idPlatillos`, `Pedidos_idPedidos`),
  INDEX `fk_Platillos_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
  INDEX `fk_Platillos_has_Pedidos_Platillos1_idx` (`Platillos_idPlatillos` ASC) VISIBLE,
  CONSTRAINT `fk_Platillos_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `kgisadodb`.`pedidos` (`idPedidos`),
  CONSTRAINT `fk_Platillos_has_Pedidos_Platillos1`
    FOREIGN KEY (`Platillos_idPlatillos`)
    REFERENCES `kgisadodb`.`platillos` (`idPlatillos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`proveedores` (
  `idProveedores` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `Proveedorescol` VARCHAR(45) NULL DEFAULT NULL,
  `NumTelefono` VARCHAR(45) NULL DEFAULT NULL,
  `NombreUsuario` VARCHAR(8) NULL DEFAULT NULL,
  `Contrasena` CHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`idProveedores`),
  UNIQUE INDEX `NombreUsuario_UNIQUE` (`NombreUsuario` ASC) VISIBLE,
  UNIQUE INDEX `idProveedores_UNIQUE` (`idProveedores` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`proveedores_has_platillos` (
  `Proveedores_idProveedores` INT(11) NOT NULL,
  `Platillos_idPlatillos` INT(11) NOT NULL,
  PRIMARY KEY (`Proveedores_idProveedores`, `Platillos_idPlatillos`),
  INDEX `fk_Proveedores_has_Platillos_Platillos1_idx` (`Platillos_idPlatillos` ASC) VISIBLE,
  INDEX `fk_Proveedores_has_Platillos_Proveedores1_idx` (`Proveedores_idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedores_has_Platillos_Platillos1`
    FOREIGN KEY (`Platillos_idPlatillos`)
    REFERENCES `kgisadodb`.`platillos` (`idPlatillos`),
  CONSTRAINT `fk_Proveedores_has_Platillos_Proveedores1`
    FOREIGN KEY (`Proveedores_idProveedores`)
    REFERENCES `kgisadodb`.`proveedores` (`idProveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`repartidor` (
  `idRepartidor` INT(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` VARCHAR(45) NOT NULL,
  `SegundoNombre` VARCHAR(45) NOT NULL,
  `PrimerApellido` VARCHAR(45) NOT NULL,
  `SegundoApellido` VARCHAR(45) NOT NULL,
  `NumTelefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRepartidor`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `kgisadodb`.`repartidor_has_pedidos` (
  `Repartidor_idRepartidor` INT(11) NOT NULL,
  `Pedidos_idPedidos` INT(11) NOT NULL,
  PRIMARY KEY (`Repartidor_idRepartidor`, `Pedidos_idPedidos`),
  INDEX `fk_Repartidor_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
  INDEX `fk_Repartidor_has_Pedidos_Repartidor1_idx` (`Repartidor_idRepartidor` ASC) VISIBLE,
  CONSTRAINT `fk_Repartidor_has_Pedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `kgisadodb`.`pedidos` (`idPedidos`),
  CONSTRAINT `fk_Repartidor_has_Pedidos_Repartidor1`
    FOREIGN KEY (`Repartidor_idRepartidor`)
    REFERENCES `kgisadodb`.`repartidor` (`idRepartidor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
