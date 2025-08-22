
CREATE SCHEMA myfirstcodeschema;

CREATE SCHEMA mysecondcodeschema DEFAULT CHARACTER SET utf8; 	-- database will be created with a warning.

CREATE SCHEMA mysecondcodeschema DEFAULT CHARACTER SET utf8mb4; 	-- error, as database already created

CREATE SCHEMA mythirdcodeschema DEFAULT CHARSET utf8mb4;

CREATE DATABASE mydb;
CREATE SCHEMA mydb;     -- error, already exists.
-- CREATE DATABASE mydb;  ===  CREATE SCHEMA mydb;

/*
	In MySQL → DATABASE = SCHEMA (same thing).
	In SQL Server, Oracle, PostgreSQL → DATABASE ≠ SCHEMA (schema is a namespace inside database).
*/