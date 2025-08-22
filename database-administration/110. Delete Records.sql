USE thriftshop;

SELECT *
FROM inventory;

DELETE FROM inventory
WHERE inventory_id = 7;

DELETE FROM inventory;  -- all records will be deleted (only run when safe mode is off)


-- transaction control concept ( commit, rollback )

SELECT @@autocommit;  -- This checks if autocommit is ON or OFF.

SET autocommit = off;  -- 0/false/off and 1/true/on;

DELETE FROM inventory
WHERE inventory_id = 15;

ROLLBACK;  
COMMIT;

/*
	autocommit = ON → every query is instantly permanent.
	autocommit = OFF → you decide: COMMIT to save or ROLLBACK to cancel.
*/



/*
to remove all records use --> truncate
using 'DELETE FROM' without WHERE clause === using TRUNCATE  
all records will be dropped in both methods but the table schema remains unchanged.
	DELETE --> DML, can be rolled back
    TRUNCATE --> DDL, DDL can't be rolled back, 
*/

/*
	Data Definition Language(DDL): CREATE, ALTER, DROP, TRUNCATE
    Data Manipulation Language(DML): INSERT, UPDATE, DELETE
    Data Query Language(DQL): SELECT, SHOW, HELP
    Data Control Language(DCL): GRANT, REVOKE
    Data Transaction Language(DTL): START TRANSACTION, COMMIT, ROLBACK
*/

SELECT *
FROM customers;

SELECT @@autocommit;
SET autocommit = OFF;

DELETE FROM customers   -- trying to delete all the records.
WHERE customer_id BETWEEN 1 AND 6;  -- error, I think primary key is not set.alter

SHOW CREATE TABLE customers;   -- no primary key

ALTER TABLE CUSTOMERS
ADD PRIMARY KEY(customer_id);

DELETE FROM customers
WHERE customer_id BETWEEN 1 AND 6;

TRUNCATE TABLE customers;   -- TRUNCATE customers;  (TABLE is optional)

ROLLBACK;



