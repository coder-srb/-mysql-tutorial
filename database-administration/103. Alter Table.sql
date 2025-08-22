
USE thriftshop;

SELECT *
FROM customer_purchases;

ALTER TABLE customer_purchases
DROP COLUMN customer_id;

ALTER TABLE customer_purchases
ADD COLUMN customer_id INT NOT NULL
FIRST;

ALTER TABLE customer_purchases
ADD COLUMN purchase_amount DECIMAL(10,2) 
AFTER customer_purchase_id;

ALTER TABLE customer_purchases
ADD COLUMN updated_at DATETIME;

ALTER TABLE customer_purchases
DROP COLUMN updated_at;


/* ALTER TABLE 
	✅ ADD COLUMN 
	- must mention the data type of column 
	- FIRST → add column at start
	- AFTER col_name → add column after specific column
	- (no option) → add column at the end
    
    ✅ DROP COLUMN abc
    - Don't mention data type of column 
*/