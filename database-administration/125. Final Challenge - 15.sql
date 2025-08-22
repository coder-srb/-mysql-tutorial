
/* Challenge-15:

---------------- FINAL COURSE PROJECT QUESTIONS --------------------

1. Bubs wants you to track information on 
his customers (first name, last name, email), 
his employees (first name, last name, start date, position held), 
his products, and the purchases customers make (which customer, which product, when it was purchased, for how much money). 
Think about how many tables you should create. Which data goes in which tables? How should the tables relate to one another?

2. Given the database design you came up with, use Workbench to create an EER diagram of the database. 
Include things like primary keys and foreign keys, and anything else you think you should have in the tables. 
Make sure to use reasonable data types for each column.

3.Create a schema called bubsbooties. Within that schema, create the tables that you have diagramed out. 
Make sure they relate to each other, and that they have the same reasonable data types you selected previously.

4.Add any constraints you think your tables’ columns should have. Think through which columns need to be unique, 
which ones are allowed to have NULL values, etc.

5. Insert at least 3 records of data into each table. The exact values do not matter, so feel free to make them up. 
Just make sure that the data you insert makes sense, and that the tables tie together.

6. Create two users and give them access to the database. The first user, TuckerReilly, will be the DBA, and 
should get full database administrator privileges. The second user, EllaBrody, is an Analyst, and only needs read access.

*/


/* 1. Bubs wants you to track information on 
his customers (first name, last name, email), 
his employees (first name, last name, start date, position held), 
his products, and the purchases customers make (which customer, which product, when it was purchased, for how much money). 
Think about how many tables you should create. Which data goes in which tables? How should the tables relate to one another? */

-- 	   table 1: customers (customer_id [PK], first_name, last_name, email)
--     table 2: employees (employee_id [PK], first_name, last_name, start_date, position)
--     table 3: products (product_id [PK], product_name [UNIQUE], price)
--     table 4: customer_purchases (purchase_id [PK], customer_id [FK], product_id [FK], purchased_date)
-- not necessary:     table 5: inventory (inventory_id [PK], employee_id [FK], customer_id [FK], product_id [FK])

-- ------------------------------------------------------------------------------------------------------------------------------



/* 2. Given the database design you came up with, use Workbench to create an EER diagram of the database. 
Include things like primary keys and foreign keys, and anything else you think you should have in the tables. 
Make sure to use reasonable data types for each column. */

--      EER diagram created

-- -------------------------------------------------------------------------------------------------------------------------------



/* 3.Create a schema called bubsbooties. Within that schema, create the tables that you have diagramed out. 
Make sure they relate to each other, and that they have the same reasonable data types you selected previously. */

CREATE SCHEMA bubsbooties DEFAULT CHARSET utf8mb4;
USE bubsbooties;

CREATE TABLE customers (
	customer_id BIGINT PRIMARY KEY, 
    first_name VARCHAR(45), 
	last_name VARCHAR(32), 
    email VARCHAR(45)
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(45), 
	last_name VARCHAR(32),
    start_date DATE,
    position VARCHAR(45)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(13,2)
);

CREATE TABLE customer_purchases (
	purchase_id BIGINT,
    customer_id BIGINT,
    product_id INT,
    purchase_date TIMESTAMP,
    PRIMARY KEY(purchase_id),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

ALTER TABLE customer_purchases
ADD CONSTRAINT fk_purchses_products
FOREIGN KEY(product_id) REFERENCES products(product_id) 
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
;

-- ---------------------------------------------------------------------------------------------------------------------------------



/* 4. Add any constraints you think your tables’ columns should have. Think through which columns need to be unique, 
which ones are allowed to have NULL values, etc. */

DESC customers;
DESC employees;
DESC products;
DESC customer_purchases;

ALTER TABLE customers
CHANGE COLUMN first_name first_name VARCHAR(45) NOT NULL,
CHANGE email email VARCHAR(45) NOT NULL;

ALTER TABLE employees
MODIFY COLUMN first_name VARCHAR(45) NOT NULL,
MODIFY start_date DATE NOT NULL,
MODIFY position VARCHAR(45) NOT NULL;

ALTER TABLE products
ADD CONSTRAINT product_name_UNIQUE UNIQUE(product_name);

-- we can also use below 2 approach to make the column unique
-- ALTER TABLE products
-- CHANGE COLUMN product_name product_name VARCHAR(100) UNIQUE;

-- ALTER TABLE products
-- MODIFY COLUMN product_name VARCHAR(100) UNIQUE;

ALTER TABLE products
DROP INDEX product_name;   -- removed unique index constraint on 'product_name'

ALTER TABLE products
CHANGE COLUMN product_name product_name VARCHAR(100) NOT NULL UNIQUE,   -- applied both unique and not-null
CHANGE COLUMN price price DECIMAL(13,2) NOT NULL DEFAULT 0;  -- not-null and set default value

ALTER TABLE customer_purchases
MODIFY customer_id BIGINT NOT NULL,
MODIFY product_id INT NOT NULL,
MODIFY purchase_date TIMESTAMP NOT NULL;
 
-- ---------------------------------------------------------------------------------------------------------------------------------



/* 5. Insert at least 3 records of data into each table. The exact values do not matter, so feel free to make them up. 
Just make sure that the data you insert makes sense, and that the tables tie together. */

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM customer_purchases;

INSERT INTO customers VALUES
(1, 'Sam', 'Altman', 'sam@outlook.com'),
(2, 'Mark', 'Zukerburg', 'mark@outlook.com'),
(3, 'Sunder', 'Pichai', 'sunder@gmail.com');

INSERT INTO employees VALUES
(1, 'Venu', 'Lambu', '2025-05-28', 'Manager'),
(2, 'Narayan', 'Murti', '2025-06-01', 'Assistant Manager'),
(3, 'Rohan', 'Pradhan', '2025-01-01', 'Helper');

INSERT INTO products VALUES
(1, 'Honda Shine', '90000'),
(2, 'Honda Unicorn', '120000');

INSERT INTO customer_purchases VALUES
(1, 2, 2, '2025-08-22 09:30:00'),
(2, 1, 2, '2025-06-01 06:45:00'),
(3, 3, 1, '2025-12-10 01:21:00'),
(4, 3, 2, '2025-07-25 11:52:00'),
(5, 3, 1, '2025-08-22 09:30:00');

-- ---------------------------------------------------------------------------------------------------------------------------------


/* 6. Create two users and give them access to the database. The first user, TuckerReilly, will be the DBA, and 
should get full database administrator privileges. The second user, EllaBrody, is an Analyst, and only needs read access. */

--  DONE...