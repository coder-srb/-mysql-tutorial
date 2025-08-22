/*  Challenge-6:
From: Emily Trapp (Owner, Online School)
Subject: Help Understanding My Tables

Hey!
Would you be able to help me out? I have 3 tables in my ‘onlinelearningschool’ schema and 
would like to understand how they are related. For each table, could you please:
	1. Tell me what the primary key is, and whether there are any foreign keys
	2. Explain how the tables relate to each other and what type of relationship exists 
		(one-to-one, one-to-many, etc.)
        
Thank you!
*/








USE onlinelearningschool;
SHOW TABLES;

SHOW CREATE TABLE courses;
SELECT *
FROM courses;  -- PK: course_id, No foreign key

SHOW CREATE TABLE course_ratings;
SELECT *
FROM course_ratings;  -- PK: rating_id, FK: course_id

SHOW CREATE TABLE course_ratings_summaries;
SELECT *
FROM course_ratings_summaries;   -- FK: course_id, No Primary key


-- using foreign key (course_id) we will find the cardinality
SELECT *
FROM courses
WHERE course_id = 2;   -- ONE

SELECT *
FROM course_ratings_summaries
WHERE course_id = 2;   -- ONE

SELECT *
FROM course_ratings
WHERE course_id = 2;   -- MANY

--  [courses : course_ratings_summaries] :: [ONE : ONE]
--  [courses : course_ratings] :: [ONE : MANY]


/*  as there is no primary key in 'course_ratings_summaries table'(FK: course_id) which is a bad practice,
	because a table must have a primary key. so we will define a primary key for it below  */
    
ALTER TABLE course_ratings_summaries
ADD PRIMARY KEY(course_id);    -- PK: course_id, FK: course_id
-- this is an odd case; here 'course_id' is both primary key & foreign key in this table.



