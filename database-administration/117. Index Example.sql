USE thriftshop;
SHOW TABLES;

SELECT * FROM inventory;

-- UNIQUE -------------------------------------------------------
ALTER TABLE inventory
-- ADD UNIQUE(item_name);   -- both lines work
ADD CONSTRAINT unique_item_name UNIQUE(item_name);  -- we can also pass multiple columns in the () to make them unique.

INSERT INTO inventory VALUES
(15, 'fur coat', 5);   -- Error: Duplicate entry 'fur coat' for key 'inventory.unique_item_name'

-- NOT NULL (using CHANGE & MODIFY)------------------------------------------------------
ALTER TABLE inventory
CHANGE number_in_stock number_in_stock BIGINT NOT NULL;

ALTER TABLE inventory
MODIFY number_in_stock BIGINT NOT NULL;   -- both the command works

INSERT INTO inventory(inventory_id, item_name) VALUES
(15, 'fur coat');  -- Error: Field 'number_in_stock' doesn't have a default value

-- we cal also use CHANGE & MODIFY to change Data Type of a column

