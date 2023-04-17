create database comida;
use comida;



DROP TABLE IF EXISTS `Compradores`;
 CREATE TABLE `Compradores`(
 `idCompradoresC` INT NOT NULL PRIMARY KEY, 
  `PrimerNombreC` VARCHAR(45) NOT NULL,
  `SegundoNombreC` VARCHAR(45) NOT NULL,
  `PrimerApellidoC` VARCHAR(45) NOT NULL,
  `SegundoApellidoC` VARCHAR(45) NOT NULL,
  `DireccionC` VARCHAR(45) NOT NULL,
  `Num_TelefonoC` VARCHAR(45) NOT NULL)
   ENGINE = InnoDB DEFAULT CHARSET=utf8;
  
INSERT INTO Compradores (idCompradoresC, PrimerNombreC, SegundoNombreC, PrimerApellidoC, SegundoApellidoC, DireccionC, Num_TelefonoC) VALUES
 (1,"Miguel", "Ernesto", "Zapata","Fernandez","San Antonio","7731231234"),
 (2,"Victor", "Manuel", "Lopez","Granados","Morelos","7737563421"),
 (3,"Maria", "Camila", "Zarco","Morales","La caña","7731231223"),
 (4,"Macaria", "Meliza", "Zapata","Feliz","Guadalupe victoria","7732241232"),
 (5,"Carmen", "Martin", "Plaza","Castillo","La esperanza","7731223233");
 
 select * from Compradores;
 
 CREATE TABLE `Proveedores` (
  `idProveedoresP` INT NULL,
  `PrimerNombreP` VARCHAR(45) NULL,
  `SegundoNombreP` VARCHAR(45) NULL,
  `PrimerApellidoP` VARCHAR(45) NULL,
  `SegundoApellidoP` VARCHAR(45) NULL,
  `DireccionP` VARCHAR(45) NULL,
  `ProveedorescolP` VARCHAR(45) NULL,
  `No_TelefonoP` VARCHAR(45) NULL,
  PRIMARY KEY (`DireccionP`))
ENGINE = InnoDB;
INSERT INTO Proveedores (idProveedoresP, PrimerNombreP, SegundoNombreP, PrimerApellidoP, SegundoApellidoP, DireccionP, ProveedorescolP, No_TelefonoP) 
VALUES (1,"Carina", "Gracia","","","San Antonio","","7714202001"),
	   (2,"Rosario", "Lopez","","","Morelos","qw","5512734990"),
      (3,"Liliana", "Gonzales","Lopez","","La caña","qw","7714278981"),
      (4,"Magdalena", "Martínez","","","Guadalupe victoria","qw","5621931715"),
       (5,"Ana", "Pedraza","","","La esperanza","qw","7732890137");

 SELECT * FROM Proveedores;
 
 
 
 
 CREATE TABLE `Platillos` (
  `idPlatillosPL` INT NOT NULL ,
  `PlatilloPL` VARCHAR(45) NOT NULL,
  `DescripcionPL` VARCHAR(45) NOT NULL,
  `ImagenPL` VARCHAR(45) NOT NULL,
  `HorariosPL` VARCHAR(45) NOT NULL,
  `DireccionPL` varchar(45) not null,
  `CostosPL` VARCHAR(45) NULL,
  `CalificacionPL` VARCHAR(45) NULL,
  `DireccionP` VARCHAR(45) NULL ,
  PRIMARY KEY (`idPlatillosPL`),
  FOREIGN KEY (`DireccionP`) REFERENCES `Proveedores` (`DireccionP`)
  )ENGINE = InnoDB;
INSERT INTO Platillos (idPlatillosPL, PlatilloPL, DescripcionPL, ImagenPL, HorariosPL, DireccionPL, CostosPL, CalificacionPL,DireccionP) VALUES 
(1,"","Mole","","","","","","San Antonio"),    
(2,"","pozole","","","","","","Morelos"),    
(3,"","Carne molida","","","","","","La caña"),    
(4,"","tacos dorados","","","","","","Guadalupe victoria"),    
(5,"","chicharon en salsa","","","","","","La esperanza");

select * from Platillos ;

CREATE TABLE `TipoDePago` (
  `idTipoDePago` INT NOT NULL,
  `efectivo` VARCHAR(45) NOT NULL,
  `Tarjeta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDePago`))
ENGINE = InnoDB;
INSERT INTO TipoDePago (idTipoDePago , efectivo, Tarjeta) VALUES
 (1,"Efectivo", ""),
 (2,"", "Tarjeta"),
 (3,"Efectivo", ""),
 (4,"Tarjeta", ""),
 (5,"Efectivo", "");
select * from TipoDePago;


 CREATE TABLE `Repartidor` (
  `idRepartidorR` INT NOT NULL,
  `PrimerNombreR` VARCHAR(45) NOT NULL,
  `SegundoNombreR` VARCHAR(45) NOT NULL,
  `PrimerApellidoR` VARCHAR(45) NOT NULL,
  `SegundoApellidoR` VARCHAR(45) NOT NULL,
  `Num_TelefonoR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRepartidorR`))
ENGINE = InnoDB;
INSERT INTO Repartidor (idRepartidorR, PrimerNombreR, SegundoNombreR, PrimerApellidoR, SegundoApellidoR, Num_TelefonoR) VALUES 
(1,"Raul","Marin","Salas","Romero","5543546412"), 
(2,"Rita","qw","qw","Morales","2323546578"), 
(3,"Yolanda","qw","isabel","medero","2123232412"), 
(4,"marcia","qw","carolina","mendes","7656784534"), 
(5,"roque","qw","ignacio","mendoza","3234235643");
SELECT * FROM Repartidor;




DROP TABLE IF EXISTS `Pedidos`;
 CREATE TABLE `Pedidos` (
   `idPedidos` INT NOT NULL,
   `CostoDeEnvio` VARCHAR(45) NOT NULL,
   `DireccionEntrega` VARCHAR(45) NOT NULL,
   `DescripcionDeEnvio` VARCHAR(45) NOT NULL,
   `idCompradoresC` INT,
   `idPlatillosPL` INT,
   `idTipoDePago` INT,
   `idRepartidorR` INT,
   PRIMARY KEY (`idPedidos`),
   FOREIGN KEY (`idCompradoresC`) REFERENCES `Compradores` (`idCompradoresC`),
   FOREIGN KEY (`idPlatillosPL`) REFERENCES `Platillos` (`idPlatillosPL`),
   FOREIGN KEY (`idTipoDePago`) REFERENCES `TipoDePago` (`idTipoDePago`),
   FOREIGN KEY (`idRepartidorR`) REFERENCES `Repartidor` (`idRepartidorR`)
) ENGINE=InnoDB;

INSERT INTO Pedidos (idPedidos, CostoDeEnvio, DireccionEntrega, DescripcionDeEnvio,idCompradoresC,idPlatillosPL,idTipoDePago,idRepartidorR) VALUES
(1,"","San Antonio","","1","1","1","1"),    
(2,"","Morelos","","2","2","2","2"),    
(3,"","La caña","","3","3","3","3"),    
(4,"","Guadalupe victoria","","4","4","4","4"),    
(5,"","La esperanza","","5","5","5","5");



select * from Pedidos;



SELECT idPedidos,CostoDeEnvio,DireccionEntrega,DescripcionDeEnvio,PlatilloPL,DescripcionPL,ImagenPL,PrimerNombreR,SegundoNombreR,Num_TelefonoR,PrimerNombreC,Num_TelefonoC FROM `Pedidos`
INNER JOIN `Platillos` ON `Pedidos`.`idPlatillosPL` = `Platillos`.`idPlatillosPL`
INNER JOIN `Repartidor` ON `Pedidos`.`idRepartidorR` = `Repartidor`.`idRepartidorR`
INNER JOIN `TipoDePago` ON `Pedidos`.`idTipoDePago` = `TipoDePago`.`idTipoDePago`
INNER JOIN `Compradores` ON `Pedidos`.`idCompradoresC` = `Compradores`.`idCompradoresC`
;


