-- MySQL Script generated by MySQL Workbench
-- mer. 17 mai 2023 11:32:58
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema payMyBuddy_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema payMyBuddy_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payMyBuddy_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `payMyBuddy_db` ;

-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`bank_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`bank_account` (
  `bank_account_id` BIGINT NOT NULL AUTO_INCREMENT,
  `account_description` VARCHAR(255) NULL DEFAULT NULL,
  `iban_number` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`bank_account_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`hibernate_sequence` (
  `next_val` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`persistent_logins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`persistent_logins` (
  `series` VARCHAR(64) NOT NULL,
  `username` VARCHAR(64) NOT NULL,
  `last_used` DATETIME NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`series`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `balance` DOUBLE NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `UK_ob8kqyqqgmefl0aco34akdtpe` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`relationship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`relationship` (
  `relationship_id` BIGINT NOT NULL AUTO_INCREMENT,
  `creation_relationship_date` DATETIME NULL DEFAULT NULL,
  `friend_user_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  INDEX `FK4rhmk0nc3ctlnmvpbjr4cc6tn` (`friend_user_id` ASC) VISIBLE,
  INDEX `FKg0sqm6gq1hguelb3onsrbcrpq` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK4rhmk0nc3ctlnmvpbjr4cc6tn`
    FOREIGN KEY (`friend_user_id`)
    REFERENCES `payMyBuddy_db`.`user` (`user_id`),
  CONSTRAINT `FKg0sqm6gq1hguelb3onsrbcrpq`
    FOREIGN KEY (`user_id`)
    REFERENCES `payMyBuddy_db`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`transaction` (
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
  INDEX `FKsjb7r2d4njyh0jvgceliu3vqf` (`debitor_user_id` ASC) VISIBLE,
  CONSTRAINT `FKqsqamp7ofqysv0uanflojnght`
    FOREIGN KEY (`creditor_user_id`)
    REFERENCES `payMyBuddy_db`.`user` (`user_id`),
  CONSTRAINT `FKsjb7r2d4njyh0jvgceliu3vqf`
    FOREIGN KEY (`debitor_user_id`)
    REFERENCES `payMyBuddy_db`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `payMyBuddy_db`.`user_bank_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payMyBuddy_db`.`user_bank_accounts` (
  `user_user_id` BIGINT NOT NULL,
  `bank_accounts_bank_account_id` BIGINT NOT NULL,
  INDEX `FKt2ony5uidj9voggaqlnwwghf5` (`bank_accounts_bank_account_id` ASC) VISIBLE,
  INDEX `FKkl2nju2covt3r1url0rr89bsw` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `FKkl2nju2covt3r1url0rr89bsw`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `payMyBuddy_db`.`user` (`user_id`),
  CONSTRAINT `FKt2ony5uidj9voggaqlnwwghf5`
    FOREIGN KEY (`bank_accounts_bank_account_id`)
    REFERENCES `payMyBuddy_db`.`bank_account` (`bank_account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
