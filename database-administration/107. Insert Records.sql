USE thriftshop;

SELECT *
FROM inventory;

INSERT INTO inventory VALUES
(10, 'wolf skin hat', 1);

INSERT INTO inventory VALUES
(11, 'fur fox skin', 2),
(12, 'plade button up shirt', 8),
(13, 'flannel zebra jammies', 6);

INSERT INTO inventory(inventory_id, item_name) VALUES
(14, 'wolf skin sneakers', 5);		-- Error Code: 1136. Column count doesn't match value count at row 1

INSERT INTO inventory(inventory_id, item_name, number_in_stock) VALUES
(14, 'wolf skin sneakers', 5);		-- either this way or we can skip passing any column names, by default it will set all values

INSERT INTO inventory(inventory_id, item_name) VALUES
(15, "item that will not exist");	-- if we don't pass values for any column, then default value will be set automatically.