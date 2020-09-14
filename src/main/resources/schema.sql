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
    
CREATE TABLE `ams`.`transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_desc` VARCHAR(200) NOT NULL,
  `trans_sub_cat_cd` VARCHAR(4) NOT NULL,
  `credit_debit` VARCHAR(3) NOT NULL,
  `transaction_ref_no` VARCHAR(45) NULL,
  `account_cd` VARCHAR(4) NOT NULL,
  `payment_type` VARCHAR(3) NOT NULL,
  `transaction_doc` BLOB NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `trans_trans_sub_cat_fk_idx` (`trans_sub_cat_cd` ASC) VISIBLE,
  INDEX `trans_account_fk_idx` (`account_cd` ASC) VISIBLE,
  CONSTRAINT `trans_trans_sub_cat_fk`
    FOREIGN KEY (`trans_sub_cat_cd`)
    REFERENCES `ams`.`transaction_sub_category` (`trans_sub_cat_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `trans_account_fk`
    FOREIGN KEY (`account_cd`)
    REFERENCES `ams`.`accounts` (`account_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);    
    
 ALTER TABLE `ams`.`transaction` 
ADD COLUMN `transaction_amount` DECIMAL(10,2) NOT NULL AFTER `transaction_doc`;

ALTER TABLE `ams`.`transaction` 
ADD COLUMN `transaction_date` DATETIME NOT NULL AFTER `transaction_amount`;

ALTER TABLE `ams`.`transaction` 
ADD COLUMN `created` DATETIME NOT NULL AFTER `transaction_date`,
ADD COLUMN `last_updated` DATETIME NOT NULL AFTER `created`,
ADD COLUMN `username` VARCHAR(45) NOT NULL AFTER `last_updated`,
ADD INDEX `trans_user_fk_idx` (`username` ASC) VISIBLE;
;
ALTER TABLE `ams`.`transaction` 
ADD CONSTRAINT `trans_user_fk`
  FOREIGN KEY (`username`)
  REFERENCES `ams`.`users` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `ams`.`transaction` 
ADD COLUMN `voucher_no` VARCHAR(12) NULL AFTER `username`;  

CREATE TABLE `ams`.`payment_type` (
  `code` VARCHAR(3) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code`));
  
  INSERT INTO `ams`.`payment_type` (`code`, `Name`) VALUES ('CSH', 'Cash');
INSERT INTO `ams`.`payment_type` (`code`, `Name`) VALUES ('CHQ', 'Cheque');
INSERT INTO `ams`.`payment_type` (`code`, `Name`) VALUES ('CRD', 'Card');
INSERT INTO `ams`.`payment_type` (`code`, `Name`) VALUES ('NBK', 'Net Banking');

CREATE TABLE `appartment_types` (
  `appart_type_cd` varchar(3) NOT NULL,
  `square_ft` int NOT NULL,
  `no_of_bedroom` int NOT NULL,
  PRIMARY KEY (`appart_type_cd`)
);

INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('A', '100', '3');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('B', '100', '3');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('C', '100', '3');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('D', '100', '2');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('E', '100', '2');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('F', '100', '2');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('G', '100', '2');
INSERT INTO `ams`.`appartment_types` (`appart_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('H', '100', '2');

CREATE TABLE `ams`.`appartments` (
  `appart_cd` VARCHAR(3) NOT NULL,
  `appart_type_cd` VARCHAR(3) NULL,
  `floor` INT NULL,
  PRIMARY KEY (`appart_cd`),
  INDEX `appart_type_fk_idx` (`appart_type_cd` ASC) VISIBLE,
  CONSTRAINT `appart_type_fk`
    FOREIGN KEY (`appart_type_cd`)
    REFERENCES `ams`.`appartment_type` (`appart_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    ALTER TABLE `ams`.`appartments` 
ADD CONSTRAINT `appartment_aptype_fk`
  FOREIGN KEY (`appartment_type_cd`)
  REFERENCES `ams`.`appartment_types` (`appartment_type_cd`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

    
 INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1A', 'A', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1B', 'B', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1C', 'C', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1D', 'D', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1E', 'E', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1F', 'F', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1G', 'G', '1');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('1H', 'H', '1');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2A', 'A', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2B', 'B', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2C', 'C', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2D', 'D', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2E', 'E', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2F', 'F', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2G', 'G', '2');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('2H', 'H', '2');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3A', 'A', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3B', 'B', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3C', 'C', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3D', 'D', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3E', 'E', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3F', 'F', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3G', 'G', '3');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('3H', 'H', '3');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4A', 'A', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4B', 'B', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4C', 'C', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4D', 'D', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4E', 'E', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4F', 'F', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4G', 'G', '4');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('4H', 'H', '4');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5A', 'A', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5B', 'B', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5C', 'C', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5D', 'D', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5E', 'E', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5F', 'F', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5G', 'G', '5');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('5H', 'H', '5');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6A', 'A', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6B', 'B', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6C', 'C', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6D', 'D', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6E', 'E', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6F', 'F', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6G', 'G', '6');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('6H', 'H', '6');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7A', 'A', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7B', 'B', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7C', 'C', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7D', 'D', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7E', 'E', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7F', 'F', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7G', 'G', '7');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('7H', 'H', '7');

INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8A', 'A', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8B', 'B', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8C', 'C', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8D', 'D', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8E', 'E', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8F', 'F', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8G', 'G', '8');
INSERT INTO `ams`.`appartment` (`appart_cd`, `appart_type_cd`, `floor`) VALUES ('8H', 'H', '8');

CREATE TABLE `ams`.`roles` (
  `role_cd` VARCHAR(4) NOT NULL,
  `role_name` VARCHAR(45) NOT NULL,
  `role_desc` VARCHAR(100) NULL,
  PRIMARY KEY (`role_cd`),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC) VISIBLE);
  
INSERT INTO `ams`.`roles` (`role_cd`, `role_name`, `role_desc`) VALUES ('ADMN', 'admin', 'Super User');
INSERT INTO `ams`.`roles` (`role_cd`, `role_name`, `role_desc`) VALUES ('CMBR', 'Commitee Member', 'Management commitee member');
INSERT INTO `ams`.`roles` (`role_cd`, `role_name`, `role_desc`) VALUES ('SCTY', 'Secretary', 'Secretary');

 CREATE TABLE `ams`.`occupants` (
  `occupant_id` INT NOT NULL,
  `occupantcy_type` VARCHAR(10) NOT NULL,
  `appartment_cd` VARCHAR(3) NOT NULL,
  `from_dt` DATE NOT NULL,
  `to_dt` DATE NULL,
  `full_name` VARCHAR(100) NOT NULL,
  `landline_no` VARCHAR(20) NULL,
  `mobile_no` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `alter_email` VARCHAR(100) NULL,
  `whatsapp_enabled` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`occupant_id`),
  INDEX `occupant_appart_fk_idx` (`appartment_cd` ASC) VISIBLE,
  CONSTRAINT `occupant_appart_fk`
    FOREIGN KEY (`appartment_cd`)
    REFERENCES `ams`.`appartments` (`appartment_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO `ams`.`appartment_types` (`appartment_type_cd`, `square_ft`, `no_of_bedroom`) VALUES ('CMN', '1', '1');
INSERT INTO `ams`.`appartments` (`appartment_cd`, `appartment_type_cd`, `floor`) VALUES ('CMN', 'CMN', '0');
INSERT INTO `ams`.`occupants` (`occupant_id`, `occupantcy_type`, `appartment_cd`, `from_dt`, `full_name`, `whatsapp_enabled`) VALUES ('1', 'COMMON', 'CMN', '2019-04-01', 'Common', 'N');
ALTER TABLE `ams`.`users` 
ADD COLUMN `occupant_id` INT NULL AFTER `last_updated`,
ADD COLUMN `role_cd` VARCHAR(4) NULL AFTER `occupant_id`;

ALTER TABLE `ams`.`users` 
ADD INDEX `users_occupant_fk_idx` (`occupant_id` ASC) VISIBLE,
ADD INDEX `users_role_fk_idx` (`role_cd` ASC) VISIBLE;
;
ALTER TABLE `ams`.`users` 
ADD CONSTRAINT `users_occupant_fk`
  FOREIGN KEY (`occupant_id`)
  REFERENCES `ams`.`occupants` (`occupant_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `users_role_fk`
  FOREIGN KEY (`role_cd`)
  REFERENCES `ams`.`roles` (`role_cd`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  CREATE TABLE `ams`.`occupant_details` (
  `occupant_dtl_id` INT NOT NULL,
  `occupant_id` INT NOT NULL,
  `full_name` VARCHAR(100) NOT NULL,
  `relationship` VARCHAR(15) NOT NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`occupant_dtl_id`),
  INDEX `occupant_dtl_occu_fk_idx` (`occupant_id` ASC) VISIBLE,
  CONSTRAINT `occupant_dtl_occu_fk`
    FOREIGN KEY (`occupant_id`)
    REFERENCES `ams`.`occupants` (`occupant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    ALTER TABLE `ams`.`occupants` 
ADD COLUMN `permenant_address` VARCHAR(200) NULL AFTER `whatsapp_enabled`,
ADD COLUMN `present_address` VARCHAR(200) NULL AFTER `permenant_address`;

CREATE TABLE `ams`.`menus` (
  `menu_cd` VARCHAR(4) NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_cd`));
  
  CREATE TABLE `ams`.`sub_menus` (
  `sub_menu_cd` VARCHAR(4) NOT NULL,
  `menu_cd` VARCHAR(4) NOT NULL,
  `sub_menu_name` VARCHAR(45) NOT NULL,
  `menu_url` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`sub_menu_cd`),
  INDEX `submenu_menu_fk_idx` (`menu_cd` ASC) VISIBLE,
  CONSTRAINT `submenu_menu_fk`
    FOREIGN KEY (`menu_cd`)
    REFERENCES `ams`.`menus` (`menu_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE `ams`.`role_menu` (
  `role_cd` VARCHAR(4) NOT NULL,
  `sub_menu_cd` VARCHAR(4) NOT NULL,
  `view` VARCHAR(1) NULL,
  `save` VARCHAR(1) NULL,
  `delete` VARCHAR(1) NULL,
  PRIMARY KEY (`role_cd`, `sub_menu_cd`),
  INDEX `role_menu_smenu_fk_idx` (`sub_menu_cd` ASC) VISIBLE,
  CONSTRAINT `role_menu_role_fk`
    FOREIGN KEY (`role_cd`)
    REFERENCES `ams`.`roles` (`role_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role_menu_smenu_fk`
    FOREIGN KEY (`sub_menu_cd`)
    REFERENCES `ams`.`sub_menus` (`sub_menu_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `ams`.`menus` (`menu_cd`, `menu_name`) VALUES ('ACNT', 'Accounts');
INSERT INTO `ams`.`menus` (`menu_cd`, `menu_name`) VALUES ('STNG', 'Settings');
INSERT INTO `ams`.`menus` (`menu_cd`, `menu_name`) VALUES ('RPTS', 'Reports');

INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('DEXP', 'ACNT', 'Daily Expense', '/daily-expense/-1');
INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('USRS', 'STNG', 'Users', '/list-users');
INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('ACTS', 'STNG', 'Accounts', '/list-accounts');
INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('TCTY', 'STNG', 'Transaction Category', '/list-trans-category');
INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('TSUM', 'RPTS', 'Transactions Summary', 'trans-summary-report');
INSERT INTO `ams`.`sub_menus` (`sub_menu_cd`, `menu_cd`, `sub_menu_name`, `menu_url`) VALUES ('TSMT', 'RPTS', 'Transactions Statement', 'transactions-report');

INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'ACTS', 'Y', 'Y', 'Y');
INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'DEXP', 'Y', 'Y', 'Y');
INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'TCTY', 'Y', 'N', 'N');
INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'TSMT', 'Y', 'N', 'Y');
INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'TSUM', 'N', 'Y', 'Y');
INSERT INTO `ams`.`role_menu` (`role_cd`, `sub_menu_cd`, `view`, `save`, `delete`) VALUES ('ADMN', 'USRS', 'Y', 'Y', 'Y');

CREATE TABLE `ams`.`occupant_appartments` (
  `occupant_id` INT NOT NULL,
  `appartment_cd` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`occupant_id`, `appartment_cd`),
  INDEX `occ_app_app_fk_idx` (`appartment_cd` ASC) VISIBLE,
  CONSTRAINT `occ_app_occ_fk`
    FOREIGN KEY (`occupant_id`)
    REFERENCES `ams`.`occupants` (`occupant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occ_app_app_fk`
    FOREIGN KEY (`appartment_cd`)
    REFERENCES `ams`.`appartments` (`appartment_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO `ams`.`occupant_appartments` (`occupant_id`, `appartment_cd`) VALUES ('1', 'CMN');
INSERT INTO `ams`.`occupant_appartments` (`occupant_id`, `appartment_cd`) VALUES ('2', '4D');

ALTER TABLE `ams`.`occupants` 
DROP FOREIGN KEY `occupant_appart_fk`;
ALTER TABLE `ams`.`occupants` 
DROP COLUMN `appartment_cd`,
DROP INDEX `occupant_appart_fk_idx` ;
;

ALTER TABLE `ams`.`occupants` 
ADD COLUMN `identity_no` VARCHAR(20) NULL AFTER `present_address`,
ADD COLUMN `identity_type` VARCHAR(10) NULL AFTER `identity_no`;

UPDATE `ams`.`sub_menus` SET `menu_url` = 'list-accounts' WHERE (`sub_menu_cd` = 'ACTS');
UPDATE `ams`.`sub_menus` SET `menu_url` = 'daily-expense/:expenseid' WHERE (`sub_menu_cd` = 'DEXP');
UPDATE `ams`.`sub_menus` SET `menu_url` = 'list-trans-category' WHERE (`sub_menu_cd` = 'TCTY');
UPDATE `ams`.`sub_menus` SET `menu_url` = 'list-users' WHERE (`sub_menu_cd` = 'USRS');

ALTER TABLE `ams`.`role_menu` 
CHANGE COLUMN `view` `enable_view` VARCHAR(1) NULL DEFAULT NULL ,
CHANGE COLUMN `save` `enable_save` VARCHAR(1) NULL DEFAULT NULL ,
CHANGE COLUMN `delete` `enable_delete` VARCHAR(1) NULL DEFAULT NULL ;

ALTER TABLE `ams`.`occupants` 
CHANGE COLUMN `occupant_id` `occupant_id` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `ams`.`occupant_details` 
CHANGE COLUMN `occupant_dtl_id` `occupant_dtl_id` INT NOT NULL AUTO_INCREMENT ;
