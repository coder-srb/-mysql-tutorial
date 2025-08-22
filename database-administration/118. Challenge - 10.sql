/* Challenge-10:
From: Joe Tidyman (Owner, SloppyJoes)
Subject: Help Optimizing Database for Scale

Hi there...
We are about to scale up our operations and open up a very large number of restaurants in a short amount of time.
Could you help me set up our database so it can scale with data integrity? I think we’ll need to set up keys, indexes, 
and constraints to make sure the data quality is protected as we ramp up and the data sets get huge.
Can you help?!?!?
-Joe
*/

USE sloppyjoes;
SHOW TABLES;


DESC staff;
SELECT * FROM staff;

ALTER TABLE staff
CHANGE COLUMN first_name first_name varchar(50) NOT NULL,
CHANGE COLUMN last_name last_name varchar(50) NOT NULL,
CHANGE COLUMN orders_served orders_served BIGINT DEFAULT 0 NOT NULL;



DESC menu_items;
SELECT * FROM menu_items;

ALTER TABLE menu_items
ADD PRIMARY KEY(menu_item_id),
ADD UNIQUE(item_name),                    -- ADD CONSTRAINT unique_item_name UNIQUE(item_name);
MODIFY item_name varchar(45) NOT NULL,
MODIFY price decimal(13,2) NOT NULL;



DESC customer_orders;
SELECT * FROM customer_orders;   

ALTER TABLE customer_orders
ADD CONSTRAINT fk_orders_staff 
FOREIGN KEY(staff_id) REFERENCES staff(staff_id);

ALTER TABLE customer_orders
MODIFY order_total DECIMAL(13,2) NOT NULL;    -- ERROR: Invalid use of NULL value
-- As there is already some null value present in order_total field, so we can set it as NOT NULL unless we update/delete those NULL values 

UPDATE customer_orders
SET order_total = 0 
WHERE order_id IN (3, 8, 12, 16, 19);   -- set the NULL values to 0, now we can modify the order_total field to NOT NULL

ALTER TABLE customer_orders
MODIFY order_total DECIMAL(13,2) NOT NULL; 
