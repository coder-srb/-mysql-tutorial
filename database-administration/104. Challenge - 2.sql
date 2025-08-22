/* Challenge-2:
From: Amy Baker (owns the candy store)
Subject: Help Updating A Database Table

Hi,
I have some basic tables set up in my *candystore* schema, but I need some help 
updating some of the tables before my employees can get access and start using this more widely.
	1. Can you remove the *hourly_wage* column from the employees table? (I need it hidden before I can share out)
	2. Can you add a column to the employees table called *avg_customer_rating*? (decimal to one digit)
Thanks!
*/






USE candystore;

SELECT *
FROM employees;

ALTER TABLE employees
DROP COLUMN hourly_wage;

ALTER TABLE employees
ADD COLUMN avg_customer_rating DECIMAL(2,1)
AFTER last_name;


