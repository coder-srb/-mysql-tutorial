
USE thriftshop;

SELECT * FROM inventory;

-- changing the DELIMITER (; --> //)
DELIMITER //  
CREATE PROCEDURE sp_selectAllInventory()
BEGIN
	SELECT * FROM inventory;
END //
-- changing the DELIMITER back to default (;)
DELIMITER ;

CALL sp_selectAllInventory(); -- calling the procedure 

DROP PROCEDURE IF EXISTS sp_selectAllInventory;