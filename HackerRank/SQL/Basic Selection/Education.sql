/*
* File: Education.sql
* Challenge: Basic Selection
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE STUDENTS (
    ID NUMBER CONSTRAINT students_pk PRIMARY KEY,
    NAME VARCHAR2(17) NOT NULL,
    MARKS NUMBER NOT NULL
);

-- Data Insertion
INSERT INTO STUDENTS (ID, NAME, MARKS)
VALUES (1, 'Ashley', 100);

INSERT INTO STUDENTS (ID, NAME, MARKS)
VALUES (2, 'Samantha', 75);

INSERT INTO STUDENTS (ID, NAME, MARKS)
VALUES (3, 'Julia', 76);

INSERT INTO STUDENTS (ID, NAME, MARKS)
VALUES (4, 'Belvet', 84);

/* Query 1: Returns students with marks exceeding 75 */
-- returns the names of students with marks greater than 75 and last three characters of the name ascending order
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY SUBSTR(NAME, -3), ID;

