-- MySQL Script generated by MySQL Workbench
-- Thu Jun 10 16:56:24 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USERS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`USERS` (
  `USERNAME` VARCHAR(20) NOT NULL,
  `PASSWORD` VARCHAR(20) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `BIRTHDATE` DATE NOT NULL,
  `NATIONATY` VARCHAR(16) NOT NULL,
  `CREATION_DATE` DATE NOT NULL,
  PRIMARY KEY (`USERNAME`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TYPE_ACTIVITIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TYPE_ACTIVITIES` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TYPE_ACTIVITIES` (
  `idTYPE_ACTIVITIES` INT NOT NULL,
  `DESIGNATION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTYPE_ACTIVITIES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ACTIVITIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ACTIVITIES` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ACTIVITIES` (
  `idACTIVITIES` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `START_DATE` DATE NOT NULL,
  `ADDRESS` VARCHAR(125) NOT NULL,
  `CITY` VARCHAR(45) NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `PHONE` INT NOT NULL,
  `CREATION_DATE` DATE NOT NULL,
  `TYPE_ACTIVITIES_idTYPE_ACTIVITIES` INT NOT NULL,
  PRIMARY KEY (`idACTIVITIES`),
  INDEX `fk_ACTIVITIES_TYPE_ACTIVITIES_idx` (`TYPE_ACTIVITIES_idTYPE_ACTIVITIES` ASC) VISIBLE,
  CONSTRAINT `fk_ACTIVITIES_TYPE_ACTIVITIES`
    FOREIGN KEY (`TYPE_ACTIVITIES_idTYPE_ACTIVITIES`)
    REFERENCES `mydb`.`TYPE_ACTIVITIES` (`idTYPE_ACTIVITIES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVENTORY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`INVENTORY` ;

CREATE TABLE IF NOT EXISTS `mydb`.`INVENTORY` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SCOUT_SPECIALITYS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SCOUT_SPECIALITYS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SCOUT_SPECIALITYS` (
  `idSCOUT_SPECIALITYS` INT NOT NULL,
  `SCOUT_SPECIALITYS` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idSCOUT_SPECIALITYS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SCOUT_TYPES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SCOUT_TYPES` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SCOUT_TYPES` (
  `idSCOUT_TYPES` INT NOT NULL,
  `SCOUT_TYPES` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idSCOUT_TYPES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SCOUT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SCOUT` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SCOUT` (
  `idSCOUT` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `BIRTHDATE` DATE NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `PHONE` INT NOT NULL,
  `USERNAME` VARCHAR(45) NOT NULL,
  `CREATION_DATE` DATE NOT NULL,
  `SCOUT_SPECIALITYS_idSCOUT_SPECIALITYS` INT NOT NULL,
  `SCOUT_TYPES_idSCOUT_TYPES` INT NOT NULL,
  PRIMARY KEY (`idSCOUT`),
  INDEX `fk_SCOUT_SCOUT_SPECIALITYS1_idx` (`SCOUT_SPECIALITYS_idSCOUT_SPECIALITYS` ASC) VISIBLE,
  INDEX `fk_SCOUT_SCOUT_TYPES1_idx` (`SCOUT_TYPES_idSCOUT_TYPES` ASC) VISIBLE,
  CONSTRAINT `fk_SCOUT_SCOUT_SPECIALITYS1`
    FOREIGN KEY (`SCOUT_SPECIALITYS_idSCOUT_SPECIALITYS`)
    REFERENCES `mydb`.`SCOUT_SPECIALITYS` (`idSCOUT_SPECIALITYS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SCOUT_SCOUT_TYPES1`
    FOREIGN KEY (`SCOUT_TYPES_idSCOUT_TYPES`)
    REFERENCES `mydb`.`SCOUT_TYPES` (`idSCOUT_TYPES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SCOUTS_GROUPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SCOUTS_GROUPS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SCOUTS_GROUPS` (
  `idSCOUTS_GROUP` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `BIRTHDATE` DATE NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `PHONE` INT NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `CREATION_DATE` DATE NOT NULL,
  `STAFF_idSTAFF` VARCHAR(45) NOT NULL,
  `SCOUT_idSCOUT` INT NOT NULL,
  PRIMARY KEY (`idSCOUTS_GROUP`),
  INDEX `fk_SCOUTS_GROUPS_SCOUT1_idx` (`SCOUT_idSCOUT` ASC) VISIBLE,
  CONSTRAINT `fk_SCOUTS_GROUPS_SCOUT1`
    FOREIGN KEY (`SCOUT_idSCOUT`)
    REFERENCES `mydb`.`SCOUT` (`idSCOUT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GROUPS_ACTIVITIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GROUPS_ACTIVITIES` ;

CREATE TABLE IF NOT EXISTS `mydb`.`GROUPS_ACTIVITIES` (
  `idGROUPS_ACTIVITIES` INT NOT NULL,
  `SCOUTS_GROUPS_idSCOUTS_GROUP` INT NOT NULL,
  `ACTIVITIES_idACTIVITIES` INT NOT NULL,
  PRIMARY KEY (`idGROUPS_ACTIVITIES`),
  INDEX `fk_GROUPS_ACTIVITIES_SCOUTS_GROUPS1_idx` (`SCOUTS_GROUPS_idSCOUTS_GROUP` ASC) VISIBLE,
  INDEX `fk_GROUPS_ACTIVITIES_ACTIVITIES1_idx` (`ACTIVITIES_idACTIVITIES` ASC) VISIBLE,
  CONSTRAINT `fk_GROUPS_ACTIVITIES_SCOUTS_GROUPS1`
    FOREIGN KEY (`SCOUTS_GROUPS_idSCOUTS_GROUP`)
    REFERENCES `mydb`.`SCOUTS_GROUPS` (`idSCOUTS_GROUP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GROUPS_ACTIVITIES_ACTIVITIES1`
    FOREIGN KEY (`ACTIVITIES_idACTIVITIES`)
    REFERENCES `mydb`.`ACTIVITIES` (`idACTIVITIES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STAFF_TYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`STAFF_TYPE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`STAFF_TYPE` (
  `idSTAFF_TYPE` INT NOT NULL,
  `DESIGNATION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSTAFF_TYPE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STAFF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`STAFF` ;

CREATE TABLE IF NOT EXISTS `mydb`.`STAFF` (
  `idSTAFF` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `BIRTHDATE` DATE NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `PHONE` INT NOT NULL,
  `CREATION_DATE` DATE NOT NULL,
  `STAFF_TYPE_idSTAFF_TYPE` INT NOT NULL,
  `SCOUTS_GROUPS_idSCOUTS_GROUP` INT NOT NULL,
  PRIMARY KEY (`idSTAFF`),
  INDEX `fk_STAFF_STAFF_TYPE1_idx` (`STAFF_TYPE_idSTAFF_TYPE` ASC) VISIBLE,
  INDEX `fk_STAFF_SCOUTS_GROUPS1_idx` (`SCOUTS_GROUPS_idSCOUTS_GROUP` ASC) VISIBLE,
  CONSTRAINT `fk_STAFF_STAFF_TYPE1`
    FOREIGN KEY (`STAFF_TYPE_idSTAFF_TYPE`)
    REFERENCES `mydb`.`STAFF_TYPE` (`idSTAFF_TYPE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STAFF_SCOUTS_GROUPS1`
    FOREIGN KEY (`SCOUTS_GROUPS_idSCOUTS_GROUP`)
    REFERENCES `mydb`.`SCOUTS_GROUPS` (`idSCOUTS_GROUP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
