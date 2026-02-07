--Create a new database
CREATE DATABASE BikerDataAssignment;
GO

--Switch to the new database
USE BikerDataAssignment;
GO

CREATE TABLE dbo.Biker_Trips
(trip_id INT,
subscriber_type VARCHAR(50),
bikeid VARCHAR(50),
start_time DATETIME,
start_station_id INT,
start_station_name VARCHAR(255),
end_station_id INT,
end_station_name VARCHAR(255),
duration_minutes INT
);

SELECT *
FROM dbo.Biker_Trips;

USE BikerDataAssignment;
GO

SELECT TOP 10 *
FROM Biker_Journey;

select count (*) AS Totalrows
from Biker_Journey;


USE BikerDataAssignment;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA. TABLES;

--DATA CLEANING

--Remove missin or Stolen end stations
DELETE FROM Biker_Journey
WHERE start_station_name IN ('Missing','Stolen');

--Remove trips that start and end at the same station
DELETE FROM Biker_Journey
WHERE start_station_name = end_station_name;

--Remove trips with invalid durations
DELETE FROM Biker_Journey
WHERE duration_minutes is NULL or duration_minutes <= 0;

--Confirm remaining rows
SELECT COUNT(*) AS total_cleaned_rows
FROM Biker_Journey;




--PREPROCESSING

SELECT
  trip_id,
  DATENAME(WEEKDAY, start_time) AS day_of_the_week,
  YEAR(start_time) AS trip_year,
  MONTH(start_time) AS trip_month,
  duration_minutes
FROM Biker_Journey;

--ANALYSIS QUERIES
--DAY WITH THE LONGEST AVERAGE TRIP
SELECT TOP 1
   DATENAME(WEEKDAY, start_time) AS day_of_the_week,
     AVG(duration_minutes) AS
     avg_trip_duration
     FROM Biker_Journey
     GROUP BY  DATENAME(WEEKDAY, start_time)
     ORDER BY avg_trip_duration DESC;

--MONTH AND YEAR WITH MOST TRIPS
SELECT
  YEAR(start_time) AS trip_year,
  MONTH(start_time) AS trip_month,
  COUNT(*) AS trip_count
FROM Biker_Journey
GROUP BY YEAR(start_time),
MONTH(start_time)
ORDER BY trip_count DESC;

  

SELECT *, 'longest Trip' AS trip_type
FROM (
     SELECT TOP 1 *
     FROM Biker_Journey
     ORDER BY duration_minutes DESC,
start_time ASC) AS t1
UNION ALL

SELECT *, 'Shortest Trip' AS trip_type
FROM (
     SELECT TOP 1 *
     FROM Biker_Journey
     ORDER BY duration_minutes ASC,
start_time ASC) AS t2;
