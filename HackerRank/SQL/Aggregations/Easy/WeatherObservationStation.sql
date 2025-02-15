/*
* File: WeatherObservationStation.sql
* Challenge: Aggregations
* Author: Riley Jordan
* Date: February 15, 2025
* Database: Oracle
*/

-- Table Definitions
CREATE TABLE STATION (
    ID NUMBER CONSTRAINT station_pk PRIMARY KEY,
    CITY VARCHAR2(21) NOT NULL,
    STATE VARCHAR2(2) NOT NULL,
    LAT_N NUMBER NOT NULL,
    LONG_W NUMBER NOT NULL
);

-- Data Insertion
INSERT ALL
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (1, 'Kettering', 'OH', 39.6895, 84.1688)
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (2, 'Dayton', 'OH', 39.7589, 84.1916)
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (3, 'Tokyo', 'JP', 35.6895, 139.6917)
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (4, 'Kyoto', 'JP', 35.0116, 135.7681)
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (5, 'Malevile', 'CA', 33.6846, 117.8265)
    INTO STATION(ID, CITY, STATE, LAT_N, LONG_W) VALUES (6, 'San Francisco', 'CA', 37.7749, 122.4194)
SELECT * FROM dual;

-- Query Section 1: SUM 
/* sum of lan_n and long_w rounded to 2 dbps */
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2);

-- Query Section 2: Truncate and comparisive
/* SUM of lat_n between 38.788 and 137.234 (trunc 4) */
SELECT SUM(LAT_N) FROM STATION WHERE TRUNC(LAT_N,4) > 38.7880 AND TRUNC(LAT_N,4) <137.2345;

-- Query Section 3: max value and lower than 137.2345
/* MAX of lat_n where lat_n is less than 137.2345 */
SELECT TRUNC(MAX(LAT_N),4) FROM STATION WHERE TRUNC(LAT_N,4) < 137.2345;

/* long_w where the max of lat_n is less than 137.2345 */
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- Query Section 4: Min value and greater than 38.7880
/* MIN of lat_n where lat_n is greater than 38.7880 */
SELECT ROUND(MIN(LAT_N),4) FROM STATION WHERE LAT_N > 38.7880;

/* long_w where the min lat_n is greater than 38.7880 */
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT Min(LAT_N) FROM STATION WHERE LAT_N >38.7780);


-- Cleanup Section
Commit;
DROP TABLE STATION;