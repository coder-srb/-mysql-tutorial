USE thriftshop;

SELECT * FROM inventory;
SELECT * FROM customer_purchases;

CREATE TRIGGER purchaseUpdateInventory
AFTER INSERT ON customer_purchases
FOR EACH ROW
	UPDATE inventory
    SET number_in_stock = number_in_stock - 1
    WHERE inventory_id = NEW.inventory_id;
    
INSERT INTO customer_purchases VALUES
(0, 13, NULL, 3, NULL),
(0, 14, NULL, 4, NULL);  

DROP TRIGGER IF EXISTS purchaseUpdateInventory;