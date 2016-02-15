-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema superwiki
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `superwiki` ;

-- -----------------------------------------------------
-- Schema superwiki
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `superwiki` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `superwiki` ;

-- -----------------------------------------------------
-- Table `teams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teams` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `superpersons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `superpersons` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `superpersons` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `alias_names` VARCHAR(45) NULL DEFAULT NULL,
  `Created` YEAR NULL DEFAULT NULL,
  `Creator` VARCHAR(45) NULL DEFAULT NULL,
  `Team_id` INT(11) NULL DEFAULT NULL,
  `appearance` VARCHAR(1600) NULL DEFAULT NULL,
  `costume` VARCHAR(1600) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `alias_name`
    FOREIGN KEY (`Team_id`)
    REFERENCES `teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE INDEX `fk_Superhero_Team_idx` ON `superpersons` (`Team_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `superpersons_id` INT(11) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_superpersons1`
    FOREIGN KEY (`superpersons_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE UNIQUE INDEX `username_UNIQUE` ON `user` (`username` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_user_superpersons1_idx` ON `user` (`superpersons_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `message` VARCHAR(145) NULL DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `superpersons_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_superpersons1`
    FOREIGN KEY (`superpersons_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE INDEX `id_idx` ON `comment` (`user_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_comment_superpersons1_idx` ON `comment` (`superpersons_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `nemesis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nemesis` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `nemesis` (
  `superperson_id` INT(11) NOT NULL,
  `nemesis_id` INT(11) NOT NULL,
  CONSTRAINT `fk_Superperson_superperson`
    FOREIGN KEY (`superperson_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nemesis_superperson`
    FOREIGN KEY (`nemesis_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE INDEX `fk_Superhero_has_Villain_Superhero1_idx` ON `nemesis` (`superperson_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_nemesis_superperson_idx` ON `nemesis` (`nemesis_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `superpersontypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `superpersontypes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `superpersontypes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `supertype` VARCHAR(45) NOT NULL,
  `superperson_id` INT(11) NOT NULL,
  `startYear` YEAR NOT NULL,
  `endYear` YEAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_supertype_has_superperson_superperson1`
    FOREIGN KEY (`superperson_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE INDEX `fk_supertype_has_superperson_superperson1_idx` ON `superpersontypes` (`superperson_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_supertype_has_superperson_supertype1_idx` ON `superpersontypes` (`id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `favorite_superpersons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_superpersons` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `favorite_superpersons` (
  `superpersons_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`superpersons_id`, `user_id`),
  CONSTRAINT `fk_superpersons_has_user_superpersons1`
    FOREIGN KEY (`superpersons_id`)
    REFERENCES `superpersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_superpersons_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;
CREATE INDEX `fk_superpersons_has_user_user1_idx` ON `favorite_superpersons` (`user_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_superpersons_has_user_superpersons1_idx` ON `favorite_superpersons` (`superpersons_id` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `teams`
-- -----------------------------------------------------
START TRANSACTION;
USE `superwiki`;
INSERT INTO `teams` (`id`, `name`) VALUES (1, 'Avengers');

COMMIT;


-- -----------------------------------------------------
-- Data for table `superpersons`
-- -----------------------------------------------------
START TRANSACTION;
USE `superwiki`;
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (1, 'Iron Man', 'Tony Stark', 1963, 'Stan Lee', 1, '', '');
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (2, 'Captain America', 'Steve Rogers', 1941, 'Stan Lee', 1, '', '');
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (3, 'Hulk', 'Bruce Banner', 1962, 'Stan Lee', 1, '', '');
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (4, 'Thor', NULL, 1951, 'Stan Lee', 1, '', '');
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (5, 'Black Widow', 'Natasha Romanoff', 1964, 'Stan Lee', 1, '', '');
INSERT INTO `superpersons` (`id`, `name`, `alias_names`, `Created`, `Creator`, `Team_id`, `appearance`, `costume`) VALUES (6, 'Hawkeye', 'Clint Barton', 1964, 'Stan Lee', 1, '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `superwiki`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `superpersons_id`) VALUES (1, 'admin', NULL, 'admin', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `superpersons_id`) VALUES (DEFAULT, DEFAULT, NULL, DEFAULT, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `superpersontypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `superwiki`;
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (1, 'superhero', 1, 1963, NULL);
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (2, 'superhero', 2, 1941, NULL);
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (3, 'superhero', 3, 1962, NULL);
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (4, 'superhero', 4, 1951, NULL);
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (5, 'superhero', 5, 1964, NULL);
INSERT INTO `superpersontypes` (`id`, `supertype`, `superperson_id`, `startYear`, `endYear`) VALUES (6, 'superhero', 6, 1964, NULL);

COMMIT;

