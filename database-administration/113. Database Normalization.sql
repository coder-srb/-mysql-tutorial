USE mavenfuzzyfactorymini;
SHOW TABLES;

SELECT *
FROM website_pageviews_non_normalized;   -- full of redundent data

SELECT *
FROM website_pageviews_non_normalized
WHERE website_session_id = 20;   -- we can clearly see that most fields data is redundent.
-- so what we can do here to remove redundency:- we can deconstruct this table into a bunch of smaller tables.

SELECT 
	website_pageview_id,
    created_at,
    website_session_id,
    pageview_url
FROM website_pageviews_non_normalized;
-- we will create Table 1 using above fields

SELECT 
	website_session_id,
    session_created_at,
    user_id,
    is_repeat_session,
    utm_source,
    utm_campaign,
    utm_content,
    device_type,
    http_referer
FROM website_pageviews_non_normalized  -- all are redundent identical data
WHERE website_session_id = 20;    
-- we will create Table 2 by select distinct records with above fields.



-- Table 1
CREATE TABLE website_pageviews_normalized(
	SELECT 
		website_pageview_id,
		created_at,
		website_session_id,
		pageview_url
	FROM website_pageviews_non_normalized
);
SELECT * FROM website_pageviews_normalized;



-- Table 2
CREATE TABLE website_session_normalized
	SELECT DISTINCT
		website_session_id,
		session_created_at,
		user_id,
		is_repeat_session,
		utm_source,
		utm_campaign,
		utm_content,
		device_type,
		http_referer
	FROM website_pageviews_non_normalized
;
    
SELECT * FROM website_session_normalized;



/*
    Table 1: website_pageviews_normalized  
	Table 2: website_session_normalized
    
    but there is no 'Primary Key' to uniquely identify each row &
    'Foreign key' to establish relationship between them.
*/

ALTER TABLE website_pageviews_normalized	-- Table 1; PK: website_pageview_id
ADD PRIMARY KEY (website_pageview_id);      -- can't set 'website_session_id' as FK bcz it is not yet set as PK in Table 2

ALTER TABLE website_session_normalized
ADD PRIMARY KEY (website_session_id);		-- Table 2; PK: website_session_id

ALTER TABLE website_pageviews_normalized
ADD CONSTRAINT fk_pageviews_session
	FOREIGN KEY (website_session_id)
	REFERENCES website_session_normalized(website_session_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;                    -- Table 1; FK: website_session_id

