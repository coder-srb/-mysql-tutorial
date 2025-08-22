
USE thriftshop;

SELECT *
FROM inventory;

UPDATE inventory
SET number_in_stock = 0
WHERE inventory_id = 1;

UPDATE inventory
SET number_in_stock = 0
WHERE inventory_id IN (1, 9, 10);


UPDATE inventory
SET number_in_stock = 5
WHERE item_name = 'fur coat';	
/* You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.
	because with that item_name there can be multiple records, which is not safe to update at once. */

-- update without disabling the safe update mode. (just limit the number of records to update)
UPDATE inventory
SET number_in_stock = 5
WHERE item_name = 'fur coat'
LIMIT 10;  -- use LIMIT

-- update after disabling the safe update mode.
SET SQL_SAFE_UPDATES = 0;  -- disable Safe Update

UPDATE inventory
SET number_in_stock = 5
WHERE item_name = 'fur coat';

SET SQL_SAFE_UPDATES = 1;  -- always re-enable safe mode afterwards.



/*  'WHERE' clause is optional, but always recommended to use it while updating.
	Otherwise it will update all the records in the table, if Safe Update Mode is disabled*/
UPDATE inventory
SET number_in_stock = 0;   -- avoid updating without 'WHERE' clause
