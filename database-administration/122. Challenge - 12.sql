
/* Challenge-12:
From: Joe Tidyman (Owner, SloppyJoes)
Subject: Help Creating Triggers

Hi there...
Is there any way we could automatically update the number of orders served in the staff table 
anytime we serve another order and a record is written to the customer_orders table?

Is this even possible?
-Joe
*/

USE SloppyJoes;

SELECT * FROM staff;
SELECT * FROM customer_orders;

CREATE TRIGGER updateOrderServed
AFTER INSERT ON customer_orders
FOR EACH ROW
	UPDATE staff 
    SET orders_served = orders_served + 1
    WHERE staff_id = NEW.staff_id
;
    
INSERT INTO customer_orders VALUES
(21, 2, 10.98),
(22, 2, 5.99),
(23, 2, 7.99),
(24, 2, 12.97);