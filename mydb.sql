-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

CREATE UNIQUE INDEX `username_UNIQUE` ON `user` (`username` ASC);


-- -----------------------------------------------------
-- Table `team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `team` ;

CREATE TABLE IF NOT EXISTS `team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Teamcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superhero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `superhero` ;

CREATE TABLE IF NOT EXISTS `superhero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Created` YEAR NULL,
  `Creator` VARCHAR(45) NULL,
  `Team_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Team_id`),
  CONSTRAINT `alias_name`
    FOREIGN KEY (`Team_id`)
    REFERENCES `team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Superhero_Team_idx` ON `superhero` (`Team_id` ASC);


-- -----------------------------------------------------
-- Table `villain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `villain` ;

CREATE TABLE IF NOT EXISTS `villain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Created` YEAR NULL,
  `Creator` VARCHAR(45) NULL,
  `Team_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Team_id`),
  CONSTRAINT `fk_Villain_Team1`
    FOREIGN KEY (`Team_id`)
    REFERENCES `team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Villain_Team1_idx` ON `villain` (`Team_id` ASC);


-- -----------------------------------------------------
-- Table `alias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alias` ;

CREATE TABLE IF NOT EXISTS `alias` (
  `name` VARCHAR(45) NOT NULL,
  `Appearance` VARCHAR(145) NULL,
  `Superhero_id` INT NOT NULL,
  `Villain_id` INT NOT NULL,
  PRIMARY KEY (`name`, `Villain_id`, `Superhero_id`),
  CONSTRAINT `fk_Alias_Superhero1`
    FOREIGN KEY (`Superhero_id`)
    REFERENCES `superhero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alias_Villain1`
    FOREIGN KEY (`Villain_id`)
    REFERENCES `villain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Alias_Superhero1_idx` ON `alias` (`Superhero_id` ASC);

CREATE INDEX `fk_Alias_Villain1_idx` ON `alias` (`Villain_id` ASC);


-- -----------------------------------------------------
-- Table `nemesis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nemesis` ;

CREATE TABLE IF NOT EXISTS `nemesis` (
  `Superhero_id` INT NOT NULL,
  `Villain_id` INT NOT NULL,
  PRIMARY KEY (`Superhero_id`, `Villain_id`),
  CONSTRAINT `fk_Superhero_has_Villain_Superhero1`
    FOREIGN KEY (`Superhero_id`)
    REFERENCES `superhero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Superhero_has_Villain_Villain1`
    FOREIGN KEY (`Villain_id`)
    REFERENCES `villain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Superhero_has_Villain_Villain1_idx` ON `nemesis` (`Villain_id` ASC);

CREATE INDEX `fk_Superhero_has_Villain_Superhero1_idx` ON `nemesis` (`Superhero_id` ASC);


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `message` VARCHAR(145) NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `id_idx` ON `comment` (`user_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
