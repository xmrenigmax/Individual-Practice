/*
* File: TypeOfTriangle.sql
* Challenge: Advanced Selection
* Author: Riley Jordan
* Date: February 11, 2025
* Database: Oracle
*/

-- Table Definition
CREATE TABLE TRIANGLES (
    A INT NOT NULL,
    B INT NOT NULL,
    C INT NOT NULL
);

INSERT All
    INTO TRIANGLES (A, B, C) VALUES (20, 20, 23)
    INTO TRIANGLES (A, B, C) VALUES (20, 20, 20)
    INTO TRIANGLES (A, B, C) VALUES (20, 21, 22)
    INTO TRIANGLES (A, B, C) VALUES (13, 14, 30)
SELECT * FROM dual;

SELECT CASE WHEN A + B <= C OR B + C <= A OR A + C <= B THEN 'Not A Triangle'
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN (A = B AND A! = C) OR (B = C AND B! = A) OR (A = C AND A! = B)THEN 'Isosceles'
            WHEN A! = B AND B! = C AND A! = C THEN 'Scalene'
            END
FROM TRIANGLES;


-- Clean Section
COMMIT;
DROP TABLE TRIANGLES;