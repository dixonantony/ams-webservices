CREATE SCHEMA `ams` ;

drop table ams.users;
drop table ams.financial_year;

CREATE TABLE `ams`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(450) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `mob_no` VARCHAR(45) NULL,
  `created` DATETIME NOT NULL,
  `last_updated` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
  AUTO_INCREMENT=100;
  
DROP TRIGGER IF EXISTS `ams`.`users_BI`;
DROP TRIGGER IF EXISTS `ams`.`users_BU`;

DELIMITER $$
USE `ams`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ams`.`users_BI` BEFORE INSERT ON `users` FOR EACH ROW
BEGIN
	SET NEW.created = SYSDATE();
    SET NEW.last_updated = SYSDATE();
END$$
DELIMITER ;
DELIMITER $$
USE `ams`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ams`.`users_BU` BEFORE UPDATE ON `users` FOR EACH ROW
BEGIN
	SET NEW.last_updated = SYSDATE();
END$$
DELIMITER ; 

INSERT INTO `ams`.`users` (`username`, `password`, `first_name`) VALUES ('admin', '$2a$10$3zHzb.Npv1hfZbLEU5qsdOju/tk2je6W6PnNnY.c1ujWPcZh4PL6e', 'admin');


CREATE TABLE `ams`.`financial_year` (
  `year` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `current_year` CHAR(1) NOT NULL,
  `created` DATETIME NOT NULL,
  `last_updated` DATETIME NOT NULL,
  `active` CHAR(1),
  PRIMARY KEY (`year`));
  
DELIMITER $$
USE `ams`$$
CREATE TRIGGER `ams`.`financial_year_BI` BEFORE INSERT ON `financial_year` FOR EACH ROW
BEGIN
	SET NEW.created = SYSDATE();
    SET NEW.last_updated = SYSDATE();
END$$
DELIMITER ;  

DELIMITER $$
USE `ams`$$
CREATE TRIGGER `ams`.`financial_year_BU` BEFORE UPDATE ON `financial_year` FOR EACH ROW
BEGIN
	SET NEW.last_updated = SYSDATE();
END$$
DELIMITER ; 

INSERT INTO `ams`.`financial_year` (`year`, `start_date`, `end_date`, `current_year`) VALUES ('2019', '2019-04-01', '2020-03-31', 'N');
INSERT INTO `ams`.`financial_year` (`year`, `start_date`, `end_date`, `current_year`) VALUES ('2020', '2020-04-01', '2021-03-31', 'Y');

CREATE TABLE `ams`.`transaction_types` (
  `transaction_type` VARCHAR(10) NOT NULL,
  `transaction_type_cd` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`transaction_type_cd`));
  
INSERT INTO `ams`.`transaction_types` (`transaction_type`, `transaction_type_cd`) VALUES ('Income', 'INC');
INSERT INTO `ams`.`transaction_types` (`transaction_type`, `transaction_type_cd`) VALUES ('Expense', 'EXP');
INSERT INTO `ams`.`transaction_types` (`transaction_type`, `transaction_type_cd`) VALUES ('Asset', 'AST');

CREATE TABLE `accounts` (
  `account_cd` VARCHAR(4) NOT NULL,
  `account_name` varchar(45) NOT NULL,
  `account_no` varchar(45) DEFAULT NULL,
  `account_bank` varchar(45) DEFAULT NULL,
  `desc_txt` varchar(100) DEFAULT NULL,
  `ifsc_cd` varchar(45) DEFAULT NULL,
  `account_balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`account_cd`),
  UNIQUE KEY `account_name_UNIQUE` (`account_name`)
);

ALTER TABLE `ams`.`accounts` 
ADD COLUMN `created` DATETIME NOT NULL AFTER `account_balance`;

ALTER TABLE `ams`.`accounts` 
ADD COLUMN `active` VARCHAR(1) NULL DEFAULT 'Y' AFTER `created`;

CREATE TABLE `ams`.`transaction_category` (
  `category_cd` VARCHAR(4) NOT NULL,
  `category_name` VARCHAR(45) NOT NULL,
  `category_desc` VARCHAR(100) NULL,
  `transaction_type_cd` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`category_cd`),
  INDEX `trans_type_fk_idx` (`transaction_type_cd` ASC) VISIBLE,
  CONSTRAINT `trans_type_fk`
    FOREIGN KEY (`transaction_type_cd`)
    REFERENCES `ams`.`transaction_types` (`transaction_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE `ams`.`transaction_category` 
ADD COLUMN `balance` DECIMAL(10,2) NOT NULL AFTER `transaction_type_cd`;    
    
CREATE TABLE `ams`.`transaction_sub_category` (
  `trans_sub_cat_cd` VARCHAR(4) NOT NULL,
  `trans_sub_cat_name` VARCHAR(45) NOT NULL,
  `trans_sub_cat_desc` VARCHAR(100) NULL,
  `category_cd` VARCHAR(4) NULL,
  `balance` DECIMAL(10,2) NULL,
  PRIMARY KEY (`trans_sub_cat_cd`),
  INDEX `trans_sub_cat_fk_idx` (`category_cd` ASC) VISIBLE,
  CONSTRAINT `trans_sub_cat_fk`
    FOREIGN KEY (`category_cd`)
    REFERENCES `ams`.`transaction_category` (`category_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);    
 