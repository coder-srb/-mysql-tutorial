/* Challenge-8:
From: *Emily Trapp (Owner, OnlineLearningSchool)*
Subject: *Help Creating an EER Diagram*

Hey again!
	I would like to have a better visual representation of the database 
	so I can share it with our new employees as we start to scale.
	Could you please 'build an EER diagram of the onlinelearningschool schema'? 
	If you could map the relationships that would be awesome.
Thank you! Emily
*/

USE onlinelearningschool;
SHOW TABLES;

DESC courses;
DESCRIBE course_ratings;
DESC course_ratings_summaries;


/*
	MySQL Workbench UI
	------------------------------------
	Step 1--> Home
	Step 2--> Models --> Create new
	Step 3--> Model Overview --> Add Diagram
	Step 4--> Use templates from Modeling Additions
*/