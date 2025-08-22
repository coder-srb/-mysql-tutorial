/* Challenge - 4:

From: Amy Baker (owns the candystore)
Subject: Help Updating Some Data Records

Hi,
Exciting news! I have hired two new employees, who both started on March 15th, 2020. They are both clerks. 
Their names are **Charles Munger** and **William Gates**. Could you add them to the employees table for me?
Could you also update the **avg_customer_rating** column? 
The average ratings for employees 1-6 are **4.8, 4.6, 4.75, 4.9, 4.75, and 4.2**, respectively. 
The two new clerks are both at **5.0**.

Thank you so much!
*/






USE candystore;

SELECT *
FROM employees;

INSERT INTO employees(employee_id, first_name, last_name, hire_date, position) VALUES
(7, 'Charles', 'Munger', '2020-03-15', 'Clerk'),
(8, 'William', 'Gates', '2020-03-15', 'Clerk');

UPDATE employees
SET avg_customer_rating = 5
WHERE employee_id IN (7, 8);

UPDATE employees
SET avg_customer_rating = 4.8
WHERE employee_id = 1;

UPDATE employees
SET avg_customer_rating = 4.6
WHERE employee_id = 2;

UPDATE employees
SET avg_customer_rating = 4.75  -- got a warning | as DECIMAL(2,1) rating can't have 2 precision value after decimal point.
WHERE employee_id IN (3, 5);    -- rating = instead of 4.75 it will be autoincrement to 4.8; which we don't want

-- to update the exact rating, we have to change the column definition.
ALTER TABLE employees
CHANGE COLUMN avg_customer_rating avg_customer_rating DECIMAL(3,2);

UPDATE employees
SET avg_customer_rating = 4.75   -- no waring, as we have changed the column definition.
WHERE employee_id IN (3, 5);

UPDATE employees
SET avg_customer_rating = 4.9
WHERE employee_id = 4;

UPDATE employees
SET avg_customer_rating = 4.2
WHERE employee_id = 6;

