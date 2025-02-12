/*
* File: WeatherObservationStation.sql
* Challenge: Basic Selection
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE STATION (
    ID NUMBER CONSTRAINT station_pk PRIMARY KEY,
    CITY VARCHAR2(21) NOT NULL,
    STATE VARCHAR2(2) NOT NULL,
    LAT_N NUMBER NOT NULL,
    LONG_W NUMBER NOT NULL
);

-- Data Insertion
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES (1, 'Kettering', 'OH', 39.6895, 84.168827);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES (2, 'Dayton', 'OH', 39.7589, 84.1916);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES (3, 'Tokyo', 'JP', 35.6895, 139.6917);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES (4, 'Tokyo', 'JP', 35.6895, 139.6917);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES (5, 'osaka', 'JP', 35.6895, 139.6917);

-- Query Section 1: List Properties
/* Query 1: List City and State */
SELECT CITY, STATE FROM STATION;

/* Query 2: list names with even ID */
SELECT CITY FROM STATION
WHERE MOD(ID, 2) = 0;

/* Query 3: Difference between number of city entries and distinct city entries */
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION 
WHERE CITY IS NOT NULL; -- error catcher

-- Query Section 2: shortest and longest city names
/* Query 4: Shortest and Longest City Names */
SELECT * FROM(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC) 
WHERE ROWNUM = 1 UNION
SELECT * FROM(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY DESC) 
WHERE ROWNUM = 1;

-- Query Section 3: City Names with Vowels
/* Query 5: City Names starting with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE REGEXP_LIKE(CITY, '^[aeiou]');

/* Query 6: City Names ending with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE REGEXP_LIKE(CITY, '[aeiou]$');

/* Query 7: City Names starting and ending with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE REGEXP_LIKE(CITY, '^[aeiou].*[aeiou]$');

/* Query 8: City Names that do not start with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]');

/* Query 9: City Names that do not end with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '[aeiou]$');

/* Query 10: City Names that either do not start or end with Vowels */
SELECT DISTINCT CITY FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]') OR NOT REGEXP_LIKE(CITY, '[aeiou]$');

/* Query 11: City Names that have neither a vowel at start nor at end */
SELECT DISTINCT CITY FROM STATION
WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]') AND NOT REGEXP_LIKE(CITY, '[aeiou]$');

-- Cleanup Section
commit;
DROP TABLE STATION PURGE;



