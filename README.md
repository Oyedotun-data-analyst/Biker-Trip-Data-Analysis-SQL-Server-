# Biker-Trip-Data-Analysis-SQL-Server-
📌 Project Overview

This project explores and analyzes bike trip data using SQL Server (T-SQL). The goal was to clean raw trip data, perform preprocessing, and answer analytical questions that reveal rider behavior, trip duration patterns, and extreme usage cases.

The project demonstrates practical SQL skills commonly required for Data Analyst roles, including data cleaning, aggregation, and window functions.

🛠 Tools & Technologies

SQL Server
SQL Server Management Studio (SSMS)
T-SQL
CSV Dataset

📂 Dataset

Name: BikerDatav2.csv
Description: Contains bike trip records including start time, stations, trip duration, and subscriber type.

🧹 Data Cleaning

✅ To ensure data quality and reliable analysis, the following cleaning steps were applied:

✅ Removed trips where the start station and end station were the same

✅ Checked and validated trip duration values

✅ Ensured only meaningful and complete trip records were retained

📉 Result:

The dataset was reduced from over 5,000 records to 2,676 clean trips.

Sample Cleaning Query

✍️ DELETE FROM Biker_Journey
WHERE start_station_name = end_station_name;

✍️DELETE FROM Biker_Journey
WHERE duration_minutes IS NULL OR duration_minutes <= 0;

⚙️ Data Preprocessing & Feature Engineering

Time-based features were derived from the trip start time to support trend analysis:

Day of the week
Month
Year
✍️SELECT
    DATENAME(WEEKDAY, start_time) AS day_of_week,
    YEAR(start_time) AS trip_year,
    MONTH(start_time) AS trip_month
FROM Biker_Journey;

📊 Key Analysis & Insights

🔹 Longest Average Trip by Day
Weekend days recorded the longest average trip durations.
Suggests recreational or leisure usage patterns.

🔹 Peak Usage Period
Identified the month and year with the highest number of trips.
Indicates seasonal or demand-driven usage trends.

🔹 Extreme Trip Behavior
Used SQL window functions to identify the longest and shortest trips in the dataset.

📈 Skills Demonstrated

✅ Data cleaning using SQL

✅ Aggregations with GROUP BY and AVG()

✅ Date and time manipulation

✅ Window functions (ROW_NUMBER)

✅ Analytical thinking and documentation

✅ Conclusion

This project showcases the use of SQL Server for end-to-end data analysis — from raw data cleaning to insight generation. The findings provide valuable understanding of rider behavior and trip trends, and the project reflects real-world analytical workflows.
