/*
* File: Employee.sql
* Challenge: Aggregations
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER CONSTRAINT employee_pk PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL, 
    MONTHS NUMBER NOT NULL,
    SALARY NUMBER(10,2) NOT NULL
);

-- Data Insertion
INSERT ALL
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (12228, 'Rose', 15, 1968.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (33645, 'Angela', 1, 3443.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (45692, 'Frank', 17, 1608.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (56118, 'Patrick', 7, 1345.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (59725, 'Lisa', 11, 2330.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (74197, 'Kimberly', 16, 4372.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (78454, 'Bonnie', 8, 1771.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (83557, 'Michael', 6, 2017.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (96196, 'Todd', 5, 3396.00)
    INTO EMPLOYEE (EMPLOYEE_ID, NAME, MONTHS, SALARY) VALUES (98846, 'Joe', 2, 3573.00)
SELECT * FROM dual;

-- Query Section
/* Calculate maximum total earnings (salary * months) */
SELECT MAX(SALARY * MONTHS) AS EARNINGS, COUNT(EARNINGS) AS COUNT FROM EMPLOYEE;


-- Cleanup Section
COMMIT;
DROP TABLE EMPLOYEE PURGE;