
/* Challenge-9:

MID COURSE PROJECT QUESTIONS
---------------------------------------
	1. Take a look at the *mavenmoviesmini* schema. What do you notice about it? How many tables are there?
What does the data represent? What do you think the current schema?

	2. If you wanted to break out the data from the *inventory_non_normalized* table into multiple tables, 
how many tables do you think would be ideal? What would you name those tables?

	3. Based on your answer from question #2, create a new schema with the tables you think will best serve this data set. 
You can use SQL code or Workbench’s UI tools (whichever you feel more comfortable with).

	4. Next, use the data from the original schema to populate the tables in your newly optimized schema.

	5. Make sure your new tables have the proper primary keys defined and that applicable foreign keys are added. 
Add any constraints you think should apply to the data as well (unique, non-NULL, etc.)

	6. Finally, after doing all of this technical work, write a brief summary of what you have done, in a way that 
your non-technical client can understand. Communicate what you did, and why your new schema design is better.
*/

-- QUESTION 1 --------------------------------------------------------------------------------------------------------------------

USE mavenmoviesmini;
SHOW TABLES;

SELECT * FROM inventory_non_normalized;

SELECT *
FROM inventory_non_normalized
WHERE film_id = 1;

-- Table 1: movies
SELECT DISTINCT
	film_id,
    title,
    description,
    release_year,
    rental_rate,
    rating
FROM mavenmoviesmini.inventory_non_normalized;

SELECT *
FROM inventory_non_normalized
WHERE store_id = 1;

-- Table 2: moviestores
SELECT DISTINCT
	store_id,
    store_manager_first_name,
    store_manager_last_name,
    store_address,
    store_city,
    store_district
FROM mavenmoviesmini.inventory_non_normalized;

-- Table 3: inventory
SELECT 
	inventory_id,
    film_id,
    store_id
FROM inventory_non_normalized;

-- QUESTION 2 ---------------------------------------------------------------------------------------------------------------------

/*
 Table 1: inventory (inventory_id, film_id, store_id) 
 Table 2: movies (film_id, title, description, release_year, rental_rate, rating)
 Table 3: moviestores (store_id, store_manager_first_name, store_manager_last_name, store_address, store_city, store_district)
 
 we can also devide moviestores into 2 more tables but as the dataset is small (store_id = 1, 2), that's why we will keep it simple
*/


-- QUESTION 3 ---------------------------------------------------------------------------------------------------------------------

CREATE SCHEMA mymoviedb DEFAULT CHARSET utf8mb4;

USE mymoviedb;

CREATE TABLE movies (
	film_id SMALLINT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year YEAR NOT NULL,
    rental_rate DECIMAL(4,2),
    rating ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') NOT NULL,
    PRIMARY KEY(film_id)
);
DESC movies;

CREATE TABLE moviestores (
	store_id TINYINT,
    store_manager_first_name VARCHAR(45) NOT NULL,
    store_manager_last_name VARCHAR(45),
    store_address VARCHAR(255) NOT NULL,
    store_city VARCHAR(255) NOT NULL,
    store_district VARCHAR(255) NOT NULL,
    PRIMARY KEY(store_id)
);
DESC moviestores;

CREATE TABLE inventory (
	inventory_id BIGINT,
    film_id SMALLINT NOT NULL,
    store_id TINYINT NOT NULL,
    PRIMARY KEY(inventory_id),
    FOREIGN KEY(film_id) REFERENCES movies(film_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY(store_id) REFERENCES moviestores(store_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
DESC inventory;


DROP TABLE movies;  -- as it's PK is FK in inventory table, we can't drop untill unless inventory is dropped.
DROP TABLE inventory;
DROP TABLE movies;
DROP TABLE moviestores;

-- QUESTION 4 & 5 --------------------------------------------------------------------------------------------------------------------

-- populating data from parent schema
INSERT INTO movies (film_id, title, description, release_year, rental_rate, rating)
SELECT DISTINCT film_id, title, description, release_year, rental_rate, rating
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM movies;

INSERT INTO moviestores
SELECT DISTINCT
	store_id,
	store_manager_first_name,
	store_manager_last_name,
	store_address,
	store_city,
	store_district
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM moviestores;

INSERT INTO inventory(inventory_id, film_id, store_id) 
SELECT inventory_id, film_id, store_id   -- no need to mention DISTINCT, as inventory_id is already unique in parent table.
FROM mavenmoviesmini.inventory_non_normalized;
    
SELECT * FROM inventory;

TRUNCATE inventory;
DROP TABLE inventory;   -- without dropping the inventory table we can't truncate other tables bcz of foreign key constraint
TRUNCATE moviestores;  
TRUNCATE movies;


-- QUESTION 6 ---------------------------------------------------------------------------------------------------------------------

-- ...


-- Another Approach for the challenge 9

CREATE TABLE movies (
	SELECT DISTINCT
		film_id,
		title,
		description,
		release_year,
		rental_rate,
		rating
    FROM mavenmoviesmini.inventory_non_normalized
);
DESC movies;

CREATE TABLE moviestores(
	SELECT DISTINCT
		store_id,
		store_manager_first_name,
		store_manager_last_name,
		store_address,
		store_city,
		store_district
    FROM mavenmoviesmini.inventory_non_normalized
);
DESC moviestores;

CREATE TABLE inventory(
	SELECT DISTINCT inventory_id, film_id, store_id     
    FROM mavenmoviesmini.inventory_non_normalized
);
DESC inventory;

ALTER TABLE movies
ADD PRIMARY KEY(film_id);

ALTER TABLE moviestores
ADD PRIMARY KEY(store_id);

ALTER TABLE inventory
ADD PRIMARY KEY(inventory_id),
ADD CONSTRAINT fk_inventory_movies FOREIGN KEY(film_id) REFERENCES movies(film_id),
ADD CONSTRAINT fk_inventory_stores FOREIGN KEY(store_id) REFERENCES moviestores(store_id);



