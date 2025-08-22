-- TABLE Creation using Workbench UI. (myfirstschema/myfirsttable)

-- Without 'USE'
SELECT * FROM myfirstschema.myfirsttable;	-- schema.table

USE myfirstschema;
SELECT * FROM myfirsttable;	   -- works, because default is set


-- TABLE Creation using SQL Command.
USE myfirstcodeschema;  -- or we can directly use; CREATE TABLE myfirstcodeschema.myfirstcodetable(...); while creating the table
CREATE TABLE myfirstcodetable (
	myfirstcodetable_id BIGINT NOT NULL,
    my_character_field VARCHAR(50),
    my_text_field TEXT,
    my_created_at TIMESTAMP,
    PRIMARY KEY (myfirstcodetable_id)
);

SELECT * 
FROM myfirstcodetable;

SELECT
	my_text_field,
    my_created_at
FROM myfirstcodetable;

-- MySQL Data Types: https://www.w3schools.com/mysql/mysql_datatypes.asp