
/* Challenge-11:
From: Joe Tidyman (Owner, SloppyJoes)
Subject: Help Creating a Stored Procedure

Hi there...
As we scale up, I would like a very quick way to query how many orders each of our staff members has served, all-time.
I am not a database pro, so I need this to be as simple as possible. Something like the following would be ideal...
	```CALL sp_staffOrdersServed; ```
Can you help?
-Joe
*/

USE sloppyjoes;
SELECT * FROM customer_orders;

DELIMITER //
CREATE PROCEDURE sp_staffOrdersServed()
BEGIN
	SELECT 
		staff_id, 
		COUNT(order_id) AS order_served
    FROM customer_orders
    GROUP BY staff_id;
END //
DELIMITER ;

CALL sp_staffOrdersServed();

DROP PROCEDURE IF EXISTS sp_staffOrdersServed;