CREATE DATABASE HOSPITALITY;

USE HOSPITALITY;

-- Total Revenue
SELECT SUM(revenue_realized) AS Total_Revenue
FROM bookings;

-- Total Bookings
SELECT COUNT(*) AS Total_Bookings
FROM bookings;

--  Total Capacity
SELECT SUM(capacity) AS Total_Capacity
FROM aggregated_bookings;

-- Total Successful Bookings
SELECT SUM(successful_bookings) AS Total_Successful_Bookings
FROM aggregated_bookings;

--  Occupancy %
SELECT ROUND(SUM(successful_bookings) * 100.0 / SUM(capacity), 2) AS Occupancy_Percentage
FROM aggregated_bookings;

--  Average Rating
SELECT ROUND(AVG(ratings_given), 2) AS Average_Rating
FROM bookings
WHERE ratings_given IS NOT NULL;
 
-- No. of Days in Data
SELECT DATEDIFF(MAX(checkout_date), MIN(check_in_date)) + 1 AS Total_Days
FROM bookings;

-- Total Cancelled Bookings
SELECT COUNT(booking_status) AS Total_Cancelled
FROM bookings
WHERE booking_status = 'Cancelled';

--  Cancellation %
SELECT ROUND
(SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Cancellation_Percentage
FROM bookings;

-- Total Checked Out
SELECT COUNT(booking_status) AS Total_Checked_Out
FROM bookings
WHERE booking_status = 'Checked-Out';

-- Total No Show Bookings
SELECT COUNT(booking_status) AS Total_No_Show
FROM bookings
WHERE booking_status = 'No Show';

 -- No Show Rate %
SELECT 
ROUND(SUM(CASE WHEN booking_status = 'No Show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS No_Show_Rate
FROM bookings;

-- Booking % by Platform
SELECT booking_platform,
ROUND(COUNT(*) * 100 / (SELECT COUNT(booking_platform) FROM bookings), 1) AS Booking_Percentage
FROM bookings
GROUP BY booking_platform;

-- Booking % by Room Class



--  ADR (Average Daily Rate)
SELECT ROUND(SUM(revenue_realized) / Count(booking_id), 0) AS ADR
FROM bookings;

-- RevPAR (Revenue Per Available Room)


-- DBRN (Daily Booking Room Nights)
SELECT ROUND(Count(booking_id) / COUNT(DISTINCT check_in_date), 0) AS DBRN
FROM bookings;

--  DSRN (Daily Sold Room Nights)
SELECT ROUND(Sum(capacity) / COUNT(DISTINCT check_in_date), 0) AS DSRN
FROM aggregated_bookings;

-- DURN (Daily Utilized Room Nights)


-- Booking by Status
SELECT booking_status,COUNT(*) AS count
FROM bookings
GROUP BY booking_status;





























