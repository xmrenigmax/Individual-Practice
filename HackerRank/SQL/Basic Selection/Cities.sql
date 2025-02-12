/*
* File: Cities.sql
* Challenge: Basic Selection
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE CITY (
    ID NUMBER CONSTRAINT city_pk PRIMARY KEY,
    NAME VARCHAR2(17) NOT NULL,
    COUNTRYCODE VARCHAR2(3) NOT NULL,
    DISTRICT VARCHAR2(20),
    POPULATION NUMBER DEFAULT 0
);

-- Data Insertion
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1, 'Kettering', 'USA', 'Ohio', 2000000);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1661, 'Dayton', 'USA', 'Ohio', 1);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1668, 'Tokyo', 'JPN', 'Tokyo Prefecture', 1299);

-- Query Section 1: REVISING THE SELECT QUERY 1
/* Query 1: Returns cities with population exceeding 1 million */
SELECT * FROM CITY
WHERE POPULATION > 1000000
ORDER BY POPULATION DESC;

/* Query 2: Lists large American cities */
SELECT NAME FROM CITY
WHERE POPULATION > 1200000 AND COUNTRYCODE = 'USA'
ORDER BY POPULATION DESC;

-- Query Section 2: JAPANESE CITIES
/* Query 3: Japanese cities details */
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN'
ORDER BY NAME;

/* Query 4: Japanese city names only */
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'JPN'
ORDER BY NAME;

-- Query Section 3: Specific Lookups
/* Query 5: City lookup by ID */
SELECT * FROM CITY
WHERE ID = 1661;

/* Query 6: Select All */
SELECT * FROM CITY;

-- Cleanup Section
COMMIT; 
DROP TABLE CITY PURGE;


