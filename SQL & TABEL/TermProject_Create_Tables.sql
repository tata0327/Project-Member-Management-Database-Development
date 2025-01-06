-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`STUDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STUDENT` (
  `Student_ID` INT NOT NULL,
  `Student_Name` VARCHAR(45) NOT NULL,
  `Student_Degree` VARCHAR(45) NOT NULL,
  `Student_Major` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Student_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SUBJECT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SUBJECT` (
  `Subject_ID` INT NOT NULL,
  `Subject_Name` VARCHAR(45) NOT NULL,
  `Subject_Major` VARCHAR(45) NULL,
  PRIMARY KEY (`Subject_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SCHEDULE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SCHEDULE` (
  `Day` VARCHAR(45) NOT NULL,
  `Start_Time` VARCHAR(45) NOT NULL,
  `End_Time` VARCHAR(45) NOT NULL,
  `SUBJECT_Subject_ID` INT NOT NULL,
  INDEX `fk_SCHEDULE_SUBJECT_idx` (`SUBJECT_Subject_ID` ASC) VISIBLE,
  PRIMARY KEY (`SUBJECT_Subject_ID`),
  CONSTRAINT `fk_SCHEDULE_SUBJECT`
    FOREIGN KEY (`SUBJECT_Subject_ID`)
    REFERENCES `mydb`.`SUBJECT` (`Subject_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASSIGNMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ASSIGNMENT` (
  `Assignment_ID` INT NOT NULL,
  `Assignment_Name` VARCHAR(45) NOT NULL,
  `Assignment_DueDate` VARCHAR(45) NOT NULL,
  `SUBJECT_Subject_ID` INT NOT NULL,
  PRIMARY KEY (`Assignment_ID`),
  INDEX `fk_ASSIGNMENT_SUBJECT1_idx` (`SUBJECT_Subject_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ASSIGNMENT_SUBJECT1`
    FOREIGN KEY (`SUBJECT_Subject_ID`)
    REFERENCES `mydb`.`SUBJECT` (`Subject_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SUBJECT_has_STUDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SUBJECT_has_STUDENT` (
  `SUBJECT_Subject_ID` INT NOT NULL,
  `STUDENT_Student_ID` INT NOT NULL,
  PRIMARY KEY (`SUBJECT_Subject_ID`, `STUDENT_Student_ID`),
  INDEX `fk_SUBJECT_has_STUDENT_STUDENT1_idx` (`STUDENT_Student_ID` ASC) VISIBLE,
  INDEX `fk_SUBJECT_has_STUDENT_SUBJECT1_idx` (`SUBJECT_Subject_ID` ASC) VISIBLE,
  CONSTRAINT `fk_SUBJECT_has_STUDENT_SUBJECT1`
    FOREIGN KEY (`SUBJECT_Subject_ID`)
    REFERENCES `mydb`.`SUBJECT` (`Subject_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SUBJECT_has_STUDENT_STUDENT1`
    FOREIGN KEY (`STUDENT_Student_ID`)
    REFERENCES `mydb`.`STUDENT` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
