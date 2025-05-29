SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Table `RamoAtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RamoAtividade` (
  `idRamoAtividade` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRamoAtividade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoAssinante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoAssinante` (
  `idTipoAssinante` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoAssinante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Assinante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Assinante` (
  `idAssinante` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `idTipoAssinante` INT NOT NULL,
  `idRamoAtividade` INT NULL,
  PRIMARY KEY (`idAssinante`, `idTipoAssinante`),
  INDEX `fk_Assinante_RamoAtividade1_idx` (`idRamoAtividade` ASC) VISIBLE,
  INDEX `fk_Assinante_TipoAssinante1_idx` (`idTipoAssinante` ASC) VISIBLE,
  CONSTRAINT `fk_Assinante_RamoAtividade1`
    FOREIGN KEY (`idRamoAtividade`)
    REFERENCES `RamoAtividade` (`idRamoAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assinante_TipoAssinante1`
    FOREIGN KEY (`idTipoAssinante`)
    REFERENCES `TipoAssinante` (`idTipoAssinante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Telefone` (
  `idTelefone` INT NOT NULL,
  `ddd` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  UNIQUE INDEX `ddd_UNIQUE` (`ddd` ASC) VISIBLE,
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Endereco` (
  `idEndereco` INT NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `idAssinante` INT NOT NULL,
  `idTelefone` INT NULL,
  PRIMARY KEY (`idEndereco`, `idAssinante`),
  INDEX `fk_Endereco_Assinante1_idx` (`idAssinante` ASC) VISIBLE,
  INDEX `fk_Endereco_Telefone1_idx` (`idTelefone` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Assinante1`
    FOREIGN KEY (`idAssinante`)
    REFERENCES `Assinante` (`idAssinante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Telefone1`
    FOREIGN KEY (`idTelefone`)
    REFERENCES `Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO TipoAssinante VALUES (1, 'Corporativo');
INSERT INTO TipoAssinante VALUES (2, 'Residencial');

INSERT INTO RamoAtividade VALUES (1, 'Comércio');
INSERT INTO RamoAtividade VALUES (2, 'Saúde');
INSERT INTO RamoAtividade VALUES (3, 'Educação');
INSERT INTO RamoAtividade VALUES (4, 'Serviços');

INSERT INTO Assinante VALUES (1, 'João', 'Silva', 2, NULL);
INSERT INTO Assinante VALUES (2, 'Maria', 'Costa', 2, NULL);
INSERT INTO Assinante VALUES (3, 'Pedro', 'Pantoja', 1, 1);
INSERT INTO Assinante VALUES (4, 'Gabriel', 'Andrade', 2, NULL);
INSERT INTO Assinante VALUES (5, 'Julia', 'Souza', 2, 3);
INSERT INTO Assinante VALUES (6, 'Adriana', 'Amaral', 2, 2);
INSERT INTO Assinante VALUES (7, 'Gustavo', 'Guimarães', 2, 4);
INSERT INTO Assinante VALUES (8, 'Nazaré', 'Soares', 2, 1);

INSERT INTO Telefone VALUES (1, '94', '12345-9876');
INSERT INTO Telefone VALUES (2, '91', '98525-0987');
INSERT INTO Telefone VALUES (3, '99', '93493-2382');

INSERT INTO Endereco VALUES (1, 'Rua Nova', 'Belém', 'PA', '66080-471', 'Cidade Velha', 1, NULL);
INSERT INTO Endereco VALUES (2, 'Avenida dos Ipês', 'Marabá', 'PA', '68505-000', 'Cidade Jardim', 2, NULL);
INSERT INTO Endereco VALUES (3, 'Rodovida do Coqueiro', 'Belém', 'PA', '66080-000', 'Coqueiro', 3, NULL);
INSERT INTO Endereco VALUES (4, 'Avenida Pedro Miranda', 'Belém', 'PA', '66090-045', 'Pedreira', 4, 1);
INSERT INTO Endereco VALUES (5, 'Avenida Paulista', 'São Paulo', 'SP', '011789-123', 'Centro', 5, 3);
INSERT INTO Endereco VALUES (6, 'VP8', 'Marabá', 'PA', '68505-080', 'Nova Marabá', 6, 2);
INSERT INTO Endereco VALUES (7, 'Antonio Maia', 'Marabá', 'PA', '68045-471', 'Marabá Pioneira', 7, NULL);
INSERT INTO Endereco VALUES (8, 'Avenida Presidente Vargas', 'Belém', 'PA', '66080-471', 'Campina', 8, NULL);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;