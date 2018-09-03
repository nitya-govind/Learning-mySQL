/*********************************************************************************************** Create a database called Sales************************************************************************************************/
/************************************************************************************************************************************************************************************************************************************/
-- CREATE DATABASE IF NOT EXISTS Sales;
/* same as:*/
-- CREATE SCHEMA IF NOT EXISTS TestDatabase; 

/***********************************************************************************************Destroy an exisitng table in a DB**********************************************************************************************************/
/************************************************************************************************************************************************************************************************************************************/

DROP TABLE sales;
DROP TABLE customers;

/***********************************************************************************************Create tables 'sales' and 'customers' in the default 'Sales' DB****************************************************************/
/************************************************************************************************************************************************************************************************************************************/

CREATE TABLE customers                                                 
(
    customer_id INT AUTO_INCREMENT NOT NULL ,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int DEFAULT 0,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);

CREATE TABLE sales
(
 	purchase_number INT AUTO_INCREMENT NOT NULL ,
     date_of_purchase DATE NOT NULL,
     customer_id INT,
     item_code VARCHAR(10) NOT NULL,
     PRIMARY KEY (purchase_number),
     FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
 );

/* Or can be written as
-- CREATE TABLE sales
-- (
-- 		purchase_number INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
--     date_of_purchase DATE NOT NULL,
--     cutomer_id INT,
--     item_code VARCHAR(10) NOT NULL
-- );
*/

/* to add/remove a key later:
ALTER TABLE sales;
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE

ALTER TABLE sales;
DROP FOREIGN KEY ..

ALTER TABLE sales;
ADD UNIQUE KEY (email_address);

ALTER TABLE sales;
DROP INDEX  email_address;

ALTER TABLE customers;
CHANGE customers number_of_complaints number_of_complaints INT DEFAULT 0;

ALTER TABLE COMPANIES
MODIFY compay_name CHAR [10] NULL

ALTER TABLE COMPANIES
CHANGE COLUMN company_name company_name CHAR[10[ NOT NULL;

*/

/***********************************************************************************************Set 'Sales' as default DB*********************************************************************************************************/
/************************************************************************************************************************************************************************************************************************************/
/* You could have created multiple tables, which one do you want to use right now as default?
 * If not setting a default, you have to always address the databaseName with . syntax */
USE Sales;


/***********************************************************************************************Querying the database**********************************************************************************************************/
/************************************************************************************************************************************************************************************************************************************/
SELECT * FROM sales;
/* If we had not set a default, this would have to be queried as SELECT * FROM Sales.sales;*/


INSERT INTO customers (first_name, last_name)
VALUES ('NIkita', 'Govind');

SELECT * FROM customers;
