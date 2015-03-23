-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema a3wasteland
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema a3wasteland
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `a3wasteland` DEFAULT CHARACTER SET latin1 ;
USE `a3wasteland` ;

-- -----------------------------------------------------
-- Table `a3wasteland`.`serverinstance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`serverinstance` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `WarchestMoneyBLUFOR` FLOAT NOT NULL DEFAULT '0',
  `WarchestMoneyOPFOR` FLOAT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`adminlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`adminlog` (
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `Time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` VARCHAR(256) CHARACTER SET 'utf8' NOT NULL,
  `PlayerUID` VARCHAR(32) NOT NULL,
  `BattlEyeGUID` VARCHAR(32) NULL DEFAULT NULL,
  `ActionType` VARCHAR(128) NOT NULL,
  `ActionValue` VARCHAR(1024) NOT NULL,
  INDEX `fk_AdminLog_ServerInstance_idx` (`ServerID` ASC),
  CONSTRAINT `fk_AdminLog_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`antihacklog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`antihacklog` (
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `Time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` VARCHAR(256) CHARACTER SET 'utf8' NOT NULL,
  `PlayerUID` VARCHAR(32) NOT NULL,
  `BattlEyeGUID` VARCHAR(32) NULL DEFAULT NULL,
  `HackType` VARCHAR(128) NOT NULL,
  `HackValue` VARCHAR(1024) NOT NULL,
  `KickOnJoin` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
  `AdminNote` VARCHAR(4096) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  INDEX `fk_AntihackLog_ServerInstance_idx` (`ServerID` ASC),
  INDEX `idx_AntihackLog_kickOnJoin` (`PlayerUID` ASC, `KickOnJoin` ASC),
  CONSTRAINT `fk_AntihackLog_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`banktransferlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`banktransferlog` (
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `Time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SenderName` VARCHAR(256) CHARACTER SET 'utf8' NOT NULL,
  `SenderUID` VARCHAR(32) NOT NULL,
  `SenderSide` VARCHAR(32) NULL DEFAULT NULL,
  `RecipientName` VARCHAR(256) CHARACTER SET 'utf8' NOT NULL,
  `RecipientUID` VARCHAR(32) NOT NULL,
  `RecipientSide` VARCHAR(32) NULL DEFAULT NULL,
  `Amount` FLOAT NOT NULL,
  `Fee` FLOAT NOT NULL,
  INDEX `fk_BankTransfers_ServerInstance_idx` (`ServerID` ASC),
  CONSTRAINT `fk_BankTransfers_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`dbinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`dbinfo` (
  `Name` VARCHAR(128) NOT NULL,
  `Value` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`playerinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`playerinfo` (
  `UID` VARCHAR(32) NOT NULL,
  `CreationDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` VARCHAR(256) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `LastSide` VARCHAR(32) NULL DEFAULT NULL,
  `BankMoney` FLOAT NOT NULL DEFAULT '0',
  `BattlEyeGUID` VARCHAR(32) NULL DEFAULT NULL,
  `DonatorLevel` FLOAT NOT NULL DEFAULT '0',
  `CustomUniform` FLOAT NOT NULL DEFAULT '0',
  `TeamKiller` FLOAT NOT NULL DEFAULT '0',
  `TKCount` FLOAT NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`servermap`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`servermap` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `WorldName` VARCHAR(128) NOT NULL,
  `Environment` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `idx_ServerMap_uniqueWorldEnv` (`WorldName` ASC, `Environment` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`playersave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`playersave` (
  `PlayerUID` VARCHAR(32) NOT NULL,
  `MapID` INT(10) UNSIGNED NOT NULL,
  `CreationDate` TIMESTAMP NULL DEFAULT NULL,
  `LastModified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Position` VARCHAR(256) NOT NULL DEFAULT '[]',
  `Direction` FLOAT NOT NULL DEFAULT '0',
  `Damage` FLOAT NOT NULL DEFAULT '0',
  `HitPoints` VARCHAR(1024) NOT NULL DEFAULT '[]',
  `Hunger` FLOAT NOT NULL DEFAULT '100',
  `Thirst` FLOAT NOT NULL DEFAULT '100',
  `Money` FLOAT NOT NULL DEFAULT '0',
  `CurrentWeapon` VARCHAR(128) NOT NULL DEFAULT '""',
  `Stance` VARCHAR(128) NOT NULL DEFAULT '""',
  `Headgear` VARCHAR(128) NOT NULL DEFAULT '""',
  `Goggles` VARCHAR(128) NOT NULL DEFAULT '""',
  `Uniform` VARCHAR(128) NOT NULL DEFAULT '""',
  `Vest` VARCHAR(128) NOT NULL DEFAULT '""',
  `Backpack` VARCHAR(128) NOT NULL DEFAULT '""',
  `UniformWeapons` VARCHAR(1024) NOT NULL DEFAULT '[]',
  `UniformItems` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `UniformMagazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `VestWeapons` VARCHAR(1024) NOT NULL DEFAULT '[]',
  `VestItems` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `VestMagazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `BackpackWeapons` VARCHAR(2048) NOT NULL DEFAULT '[]',
  `BackpackItems` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `BackpackMagazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `PrimaryWeapon` VARCHAR(128) NOT NULL DEFAULT '""',
  `SecondaryWeapon` VARCHAR(128) NOT NULL DEFAULT '""',
  `HandgunWeapon` VARCHAR(128) NOT NULL DEFAULT '""',
  `PrimaryWeaponItems` VARCHAR(512) NOT NULL DEFAULT '[]',
  `SecondaryWeaponItems` VARCHAR(512) NOT NULL DEFAULT '[]',
  `HandgunItems` VARCHAR(512) NOT NULL DEFAULT '[]',
  `AssignedItems` VARCHAR(512) NOT NULL DEFAULT '[]',
  `LoadedMagazines` VARCHAR(1024) NOT NULL DEFAULT '[]',
  `WastelandItems` VARCHAR(1024) NOT NULL DEFAULT '[]',
  UNIQUE INDEX `idx_PlayerSave_uniquePlayer` (`PlayerUID` ASC, `MapID` ASC),
  INDEX `fk_PlayerSave_ServerMap_idx` (`MapID` ASC),
  CONSTRAINT `fk_PlayerSave_PlayerInfo`
    FOREIGN KEY (`PlayerUID`)
    REFERENCES `a3wasteland`.`playerinfo` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerMap`
    FOREIGN KEY (`MapID`)
    REFERENCES `a3wasteland`.`servermap` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`playerstats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`playerstats` (
  `PlayerUID` VARCHAR(32) NOT NULL,
  `LastModified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `AIKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `TeamKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `DeathCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `ReviveCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `CaptureCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  UNIQUE INDEX `idx_PlayerStats_uniquePlayer` (`PlayerUID` ASC),
  CONSTRAINT `fk_PlayerStats_PlayerInfo`
    FOREIGN KEY (`PlayerUID`)
    REFERENCES `a3wasteland`.`playerinfo` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`playerstatsmap`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`playerstatsmap` (
  `PlayerUID` VARCHAR(32) NOT NULL,
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `MapID` INT(10) UNSIGNED NOT NULL,
  `LastModified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `AIKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `TeamKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `DeathCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `ReviveCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `CaptureCount` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  UNIQUE INDEX `idx_PlayerStatsMap_uniquePlayer` (`PlayerUID` ASC, `ServerID` ASC, `MapID` ASC),
  INDEX `fk_PlayerStatsMap_ServerMap_idx` (`MapID` ASC),
  INDEX `fk_PlayerStatsMap_ServerInstance_idx` (`ServerID` ASC),
  CONSTRAINT `fk_PlayerStatsMap_PlayerStats`
    FOREIGN KEY (`PlayerUID`)
    REFERENCES `a3wasteland`.`playerstats` (`PlayerUID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerMap`
    FOREIGN KEY (`MapID`)
    REFERENCES `a3wasteland`.`servermap` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`serverobjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`serverobjects` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `MapID` INT(10) UNSIGNED NOT NULL,
  `CreationDate` TIMESTAMP NULL DEFAULT NULL,
  `LastInteraction` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Class` VARCHAR(128) NOT NULL DEFAULT 'nil',
  `Position` VARCHAR(256) NOT NULL DEFAULT 'nil',
  `Direction` VARCHAR(256) NOT NULL DEFAULT '[]',
  `Locked` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `Deployable` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `Damage` FLOAT NOT NULL DEFAULT '0',
  `AllowDamage` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
  `Variables` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Weapons` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Magazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Items` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Backpacks` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` FLOAT NOT NULL DEFAULT '0',
  `FuelCargo` FLOAT NOT NULL DEFAULT '0',
  `RepairCargo` FLOAT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `fk_ServerObjects_ServerInstance_idx` (`ServerID` ASC),
  INDEX `fk_ServerObjects_ServerMap_idx` (`MapID` ASC),
  CONSTRAINT `fk_ServerObjects_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerObjects_ServerMap`
    FOREIGN KEY (`MapID`)
    REFERENCES `a3wasteland`.`servermap` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `a3wasteland`.`servervehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a3wasteland`.`servervehicles` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` INT(10) UNSIGNED NOT NULL,
  `MapID` INT(10) UNSIGNED NOT NULL,
  `CreationDate` TIMESTAMP NULL DEFAULT NULL,
  `LastUsed` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Class` VARCHAR(128) NOT NULL DEFAULT 'nil',
  `Position` VARCHAR(256) NOT NULL DEFAULT 'nil',
  `Direction` VARCHAR(256) NOT NULL DEFAULT '[]',
  `Velocity` VARCHAR(256) NOT NULL DEFAULT '[]',
  `Flying` TINYINT(1) NOT NULL DEFAULT '0',
  `Damage` FLOAT NOT NULL DEFAULT '0',
  `Fuel` FLOAT NOT NULL DEFAULT '0',
  `HitPoints` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Variables` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Textures` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Weapons` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Magazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Items` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `Backpacks` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines2` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines3` VARCHAR(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` FLOAT NOT NULL DEFAULT '0',
  `FuelCargo` FLOAT NOT NULL DEFAULT '0',
  `RepairCargo` FLOAT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `fk_ServerVehicles_ServerInstance_idx` (`ServerID` ASC),
  INDEX `fk_ServerVehicles_ServerMap_idx` (`MapID` ASC),
  CONSTRAINT `fk_ServerVehicles_ServerInstance`
    FOREIGN KEY (`ServerID`)
    REFERENCES `a3wasteland`.`serverinstance` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerVehicles_ServerMap`
    FOREIGN KEY (`MapID`)
    REFERENCES `a3wasteland`.`servermap` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
