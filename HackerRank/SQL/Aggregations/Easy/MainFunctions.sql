/*
* File: MainFunctions.sql
* Challenge: Aggregations
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE CITY (
    ID NUMBER CONSTRAINT city_pk PRIMARY KEY,
    NAME VARCHAR2(17) NOT NULL,
    COUNTRYCODE VARCHAR2(3) NOT NULL,
    DISTRICT VARCHAR2(20) NOT NULL,
    POPULATION NUMBER DEFAULT 0
);

-- Data Insertion
INSERT ALL
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (1, 'Kettering', 'USA', 'Ohio', 2000000)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (2, 'Dayton', 'USA', 'Ohio', 1)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (3, 'Tokyo', 'JPN', 'Tokyo Prefecture', 1299000)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (4, 'Kyoto', 'JPN', 'Kyoto Prefecture', 1000)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (5, 'Malevile', 'ISA', 'California', 100000)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (6, 'San Francisco', 'USA', 'California', 1000000)
    INTO CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES (7, 'Los Angeles', 'USA', 'California', 1000000)
SELECT * FROM dual;

-- Query Section 1: COUNT FUNCTION
/* Query 1: Count the number of cities in the table with a population greater than 100,000 */
SELECT COUNT(*) FROM CITY
WHERE POPULATION > 100000;

-- Query Section 2: SUM FUNCTION
/* total population of all cities where district is California */
SELECT SUM(POPULATION) FROM CITY
WHERE DISTRICT = 'California';

-- Query Section 3: AVG FUNCTION
/* average population of all cities where district is California */
SELECT AVG(POPULATION) FROM CITY
WHERE DISTRICT = 'California';

-- Query Section 4: populations 
/* average population of all cities rounded down. */
SELECT FLOOR(AVG(POPULATION)) FROM CITY;

/* Sum population of all japanese cities with country code JPN */
SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE = 'JPN';

/* differnce between maximum and minimum populations of all cities */
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;

-- Cleanup Section
COMMIT;
DROP TABLE CITY PURGE;

