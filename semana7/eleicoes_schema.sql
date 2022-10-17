-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema eleicoes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eleicoes` ;

-- -----------------------------------------------------
-- Schema eleicoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eleicoes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `eleicoes` ;

-- -----------------------------------------------------
-- Table `candidato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candidato` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `candidato` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(150) NULL DEFAULT NULL,
  `sigla` VARCHAR(15) NULL DEFAULT NULL,
  `siglaEstado` VARCHAR(2) NULL DEFAULT NULL,
  `vice` TINYINT(1) NULL DEFAULT NULL,
  `vicecpf` INT NULL DEFAULT NULL,
  `sexo` VARCHAR(20) NULL DEFAULT NULL,
  `cargo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_siglaEstado` ON `candidato` (`siglaEstado` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_viceCandidato` ON `candidato` (`vicecpf` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_sigla` ON `candidato` (`sigla` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_cargo` ON `candidato` (`cargo` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cargo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `cargo` (
  `codigo` INT NOT NULL,
  `cargo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `coligacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coligacao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `coligacao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `estado` (
  `sigla_Estado` VARCHAR(2) NOT NULL,
  `nome` VARCHAR(80) NULL DEFAULT NULL,
  `capital` VARCHAR(100) NULL DEFAULT NULL,
  `nomeColigacao` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`sigla_Estado`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_estadoPartido` ON `estado` (`nomeColigacao` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `municipio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `municipio` (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `siglaEstado` VARCHAR(2) NULL DEFAULT NULL,
  `populacao` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_siglaEstadoMunicipio` ON `municipio` (`siglaEstado` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partido` (
  `sigla` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(80) NULL DEFAULT NULL,
  `nomeColigacao` VARCHAR(80) NULL DEFAULT NULL,
  `dt_fundacao` DATE NULL DEFAULT NULL,
  `presidente_nacional` VARCHAR(100) NULL DEFAULT NULL,
  `num_legenda` INT NULL DEFAULT NULL,
  PRIMARY KEY (`sigla`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_nomecoligacao` ON `partido` (`nomeColigacao` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
