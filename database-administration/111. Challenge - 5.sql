/* Challenge - 5:

From: **Amy Baker** *(owns the candystore)*
Subject: **Help Deleting Some Data**

Hi,
I have a situation I need your help with. One of my employees, **Margaret Simpson**, 
was recently caught generating fake customer reviews to boost her score. I would like you to...
	1. Delete her record from the employees table
	2. Remove all data from the customer reviews table but preserve the table structure (we want to start fresh)
Thank you! Amy

*/











USE CANDYSTORE;  

SELECT *
FROM EMPLOYEES;

DELETE FROM employees
WHERE employee_id = 4;

SELECT *
FROM customer_reviews;

TRUNCATE customer_reviews;   

SHOW CREATE TABLE customer_reviews;  -- table structure is intact...alter

