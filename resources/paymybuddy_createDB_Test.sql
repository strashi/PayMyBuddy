-- MySQL Script generated by MySQL Workbench
-- mer. 19 avril 2023 10:11:23
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pmbTest_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pmbTest_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pmbTest_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pmbTest_db` ;

-- -----------------------------------------------------
-- Table `pmbTest_db`.`bank_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pmbTest_db`.`bank_account` ;

CREATE TABLE IF NOT EXISTS `pmbTest_db`.`bank_account` (
  `bank_account_id` BIGINT NOT NULL AUTO_INCREMENT,
  `account_description` VARCHAR(255) NULL DEFAULT NULL,
  `iban_number` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`bank_account_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pmbTest_db`.`relationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pmbTest_db`.`relationship` ;

CREATE TABLE IF NOT EXISTS `pmbTest_db`.`relationship` (
  `relationship_id` BIGINT NOT NULL AUTO_INCREMENT,
  `creation_relationship_date` DATETIME NULL DEFAULT NULL,
  `friend_user_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  INDEX `FK4rhmk0nc3ctlnmvpbjr4cc6tn` (`friend_user_id` ASC) VISIBLE,
  INDEX `FKg0sqm6gq1hguelb3onsrbcrpq` (`user_id` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 85
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pmbTest_db`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pmbTest_db`.`transaction` ;

CREATE TABLE IF NOT EXISTS `pmbTest_db`.`transaction` (
  `transaction_id` BIGINT NOT NULL AUTO_INCREMENT,
  `amount` DOUBLE NOT NULL,
  `bal_cred_after` DOUBLE NULL DEFAULT NULL,
  `bal_cred_before` DOUBLE NULL DEFAULT NULL,
  `bal_deb_after` DOUBLE NULL DEFAULT NULL,
  `bal_deb_before` DOUBLE NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `transaction_date` DATETIME NULL DEFAULT NULL,
  `creditor_user_id` BIGINT NULL DEFAULT NULL,
  `debitor_user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `FKqsqamp7ofqysv0uanflojnght` (`creditor_user_id` ASC) VISIBLE,
  INDEX `FKsjb7r2d4njyh0jvgceliu3vqf` (`debitor_user_id` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pmbTest_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pmbTest_db`.`user` ;

CREATE TABLE IF NOT EXISTS `pmbTest_db`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `balance` DOUBLE NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 259
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pmbTest_db`.`user_bank_accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pmbTest_db`.`user_bank_accounts` ;

CREATE TABLE IF NOT EXISTS `pmbTest_db`.`user_bank_accounts` (
  `user_user_id` BIGINT NOT NULL,
  `bank_accounts_bank_account_id` BIGINT NOT NULL,
  INDEX `FKt2ony5uidj9voggaqlnwwghf5` (`bank_accounts_bank_account_id` ASC) VISIBLE,
  INDEX `FKkl2nju2covt3r1url0rr89bsw` (`user_user_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;