/*  Challenge-1: Creating your own schema and tables...

Hi there,
We’re hoping that you can help us start tracking our marketing spend better. 
Could you please:
		1. Create a new schema, called *toms_marketing_stuff*
		2. Add a table called *publishers*, with two columns:    -- try using Workbench UI
			   * publisher_id (integer)
			   * publisher_name (up to 65 chars)
		3. Add another table called *publisher_spend* with	  -- try using SQL commands
			   * publisher_id (integer)
			   * month (date)
			   * spend (decimal)
Thanks, Tom

*/








CREATE SCHEMA toms_marketing_stuff DEFAULT CHARACTER SET utf8mb4;
USE toms_marketing_stuff;

CREATE TABLE publishers (
	publisher_id INT,
    publisher_name VARCHAR(65) NOT NULL,
    PRIMARY KEY (publisher_id)
);

CREATE TABLE publisher_spend (
	publisher_spend_id VARCHAR(45),	
	publisher_id INT NOT NULL,	 -- one publisher can can spend multiple times (should not be unique in this table)
    month DATE NOT NULL,
    spend DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (publisher_spend_id)
);

SHOW CREATE TABLE publishers;  -- Table Definition
SHOW CREATE TABLE publisher_spend;


/*	SHOW CREATE TABLE xyz;
It shows the SQL statement that was used to create the table,
including:
	- Column definitions
	- Data types
	- Constraints (PRIMARY KEY, FOREIGN KEY, DEFAULT, etc.)
	- Table options (engine, character set, collation, etc.)
*/




