/*
From: Emily Trapp (Owner, OnlineLearningSchool)
Subject: Help Understanding My Tables

Hey!
I could use some help again. I heard about this concept of database “normalization”, but need your expertise.
	Would you be able to look at my three tables and tell me if they are already normalized?
If any table is NOT normalized, 
	could you give me direction on how I could restructure the data to normalize my database?
    
Thank you!
*/








USE OnlineLearningSchool;
SHOW TABLES;

SELECT * FROM course_ratings;   -- redundent fields (course_name, instructor) which are already present in courses table
SELECT * FROM course_ratings_summaries;   -- already normalized
SELECT * FROM courses;    -- already normalized

SELECT @@autocommit;
SET autocommit = OFF;

ALTER TABLE course_ratings
DROP COLUMN course_name,
DROP COLUMN instructor;   
-- course_ratings is now normalized.

ROLLBACK;  -- didn't work as ALTER & DROP are Data Definition Language... 