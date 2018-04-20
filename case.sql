-- DROP DATABASE IF EXISTS Home_Away_db;

-- CREATE DATABASE Home_Away_db;

USE Home_Away_db;

SHOW TABLES;

SELECT * FROM home_away_data;

-- 1.  What is booking conversion and inquiry conversion for each site?  
-- 2. How do they compare year-over-year and to each other? 
-- 3. How does it compare between owner type and supplier type?  
-- 4. What do you think we could do to move travelers from inquiries to bookings?


-- What is booking conversion and inquiry conversion for each site?  
SELECT site, 
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A'
GROUP BY site
UNION
SELECT site,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B') AS inquiries, 
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B'
GROUP BY site;

-- How do they compare year-over-year and to each other?
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2016) AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND year_of_date_id = 2016) AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND year_of_date_id = 2016)*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2017) AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND year_of_date_id = 2017) AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND year_of_date_id = 2017)*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2017
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2016) AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND year_of_date_id = 2016) AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND year_of_date_id = 2016)*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2017) AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND year_of_date_id = 2017) AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND year_of_date_id = 2017)*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2017
GROUP BY site;


-- How does it compare between OWNER TYPE and supplier type?

SELECT * FROM home_away_data;

SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'FRBO') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND person_type = 'FRBO') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND person_type = 'FRBO')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'PM') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND person_type = 'PM') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND person_type = 'PM')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'PM'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'FRBO') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND person_type = 'FRBO') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND person_type = 'FRBO')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'PM') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND person_type = 'PM') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND person_type = 'PM')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'PM'
GROUP BY site;

-- How does it compare between owner type and SUPPLIER type?

SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Platform') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND supplier_type = 'Platform') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND supplier_type = 'Platform')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Integrated') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND supplier_type = 'Integrated') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site A' AND supplier_type = 'Integrated')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Integrated'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Platform') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND supplier_type = 'Platform') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND supplier_type = 'Platform')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Integrated') AS total_net_bookings,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND supplier_type = 'Integrated') AS inquiries,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Inquiries' AND site='Site B' AND supplier_type = 'Integrated')*100,2)) AS percent
FROM home_away_data
WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Integrated'
GROUP BY site;

-- QUESTION 2

-- 1. What is the cancellation rate of each brand and how do they compare? 
-- 2. How did they change year-over-year?
-- 3. How does it compare between owner type and supplier type? 
-- 4. How could we try to decrease the cancellation rate?

SELECT * FROM home_away_data;


-- What is the cancellation rate of each brand and how do they compare? 

SELECT site,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A'
GROUP BY site
UNION
SELECT site,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B'
GROUP BY site;

-- How did they change year-over-year?

SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND year_of_date_id = 2016) AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2016) AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2016)*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND year_of_date_id = 2017) AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2017) AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND year_of_date_id = 2017)*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND year_of_date_id = 2017
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND year_of_date_id = 2016) AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2016) AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2016)*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND year_of_date_id = 2017) AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2017) AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND year_of_date_id = 2017)*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND year_of_date_id = 2017
GROUP BY site;


-- How does it compare between OWNER type and supplier type? 

SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND person_type = 'FRBO') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'FRBO') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'FRBO')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND person_type = 'PM') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'PM') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND person_type = 'PM')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND person_type = 'PM'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND person_type = 'FRBO') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'FRBO') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'FRBO')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type AS owner_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND person_type = 'PM') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'PM') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND person_type = 'PM')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND person_type = 'PM'
GROUP BY site;

-- How does it compare between owner type and SUPPLIER type? 

SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND supplier_type = 'Platform') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Platform') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Platform')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND supplier_type = 'Integrated') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Integrated') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site A' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site A' AND supplier_type = 'Integrated')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site A' AND person_type = 'PM'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND supplier_type = 'Platform') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Platform') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Platform')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND supplier_type = 'Integrated') AS total_cancellations,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Integrated') AS total_net_bookings,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Cancellations' AND site='Site B' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Total Net Bookings' AND site='Site B' AND supplier_type = 'Integrated')*100,2)) AS cancellation_rate
FROM home_away_data
WHERE site ='Site B' AND supplier_type = 'Integrated'
GROUP BY site;


-- 1. What is the take rate for each brand and how does that compare year-over-year? 
-- 2. How does it compare between owner type and supplier type?  
-- 3. How could we go about increasing this percentage along with any potential risks to doing so?

-- Take Rate = (Transactional Sales) / (Gross Booking Value)


SELECT * FROM home_away_data;

-- What is the take rate for EACH BRAND and how does that compare year-over-year? 

SELECT site,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A'
GROUP BY site
UNION
SELECT site,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B'
GROUP BY site;


-- What is the take rate for EACH BRAND and how does that compare YEAR-OVER-YEAR? 

SELECT site, year_of_date_id AS year, 
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND year_of_date_id = 2016) AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND year_of_date_id = 2016) AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND year_of_date_id = 2016)*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND year_of_date_id = 2016) AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND year_of_date_id = 2016) AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND year_of_date_id = 2016)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND year_of_date_id = 2016)*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND year_of_date_id = 2016
GROUP BY site
UNION
SELECT site, year_of_date_id AS year, 
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND year_of_date_id = 2017) AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND year_of_date_id = 2017) AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND year_of_date_id = 2017)*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND year_of_date_id = 2017
GROUP BY site
UNION
SELECT site, year_of_date_id AS year,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND year_of_date_id = 2017) AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND year_of_date_id = 2017) AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND year_of_date_id = 2017)/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND year_of_date_id = 2017)*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND year_of_date_id = 2017
GROUP BY site;


-- How does it compare between OWNER type and supplier type?  

SELECT site, person_type,  
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND person_type = 'FRBO') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND person_type = 'FRBO') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND person_type = 'FRBO')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND person_type = 'FRBO') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND person_type = 'FRBO') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND person_type = 'FRBO')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND person_type = 'FRBO')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND person_type = 'FRBO'
GROUP BY site
UNION
SELECT site, person_type, 
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND person_type = 'PM') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND person_type = 'PM') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND person_type = 'PM')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND person_type = 'PM'
GROUP BY site
UNION
SELECT site, person_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND person_type = 'PM') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND person_type = 'PM') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND person_type = 'PM')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND person_type = 'PM')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND person_type = 'PM'
GROUP BY site;

-- How does it compare between owner type and SUPPLIER type?

SELECT site, supplier_type,  
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND supplier_type = 'Platform') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND supplier_type = 'Platform') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND supplier_type = 'Platform')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND supplier_type = 'Platform') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND supplier_type = 'Platform') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND supplier_type = 'Platform')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND supplier_type = 'Platform')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND supplier_type = 'Platform'
GROUP BY site
UNION
SELECT site, supplier_type, 
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND supplier_type = 'Integrated') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND supplier_type = 'Integrated') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site A' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site A' AND supplier_type = 'Integrated')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site A' AND supplier_type = 'Integrated'
GROUP BY site
UNION
SELECT site, supplier_type,
	(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND supplier_type = 'Integrated') AS transactional_sales,
    (SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND supplier_type = 'Integrated') AS gross_booking_value,
    (ROUND((SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Transactional Sales' AND site='Site B' AND supplier_type = 'Integrated')/
		(SELECT SUM(measure_values) FROM home_away_data WHERE measure_names = 'Gross Booking Value' AND site='Site B' AND supplier_type = 'Integrated')*100,2)) AS take_rate
FROM home_away_data
WHERE site ='Site B' AND supplier_type = 'Integrated'
GROUP BY site;

