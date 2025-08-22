/* Challenge-3:

From: Amy Baker (owns the candy store)
Subject: Need to Delete a Table and a Schema

Hi,
We’re almost ready to share our *candystore* schema for all employees to use. Can you please help me with the following?
	1. Drop the table ‘candy_products’. I don’t want my employees knowing my margins.
	2. Drop the schema ‘candystore_old’. This is an old copy that is now out of date, so we don’t need to maintain it.

Thanks, Amy
*/






USE candystore;

DROP TABLE candy_products;

DROP SCHEMA candystore_old;