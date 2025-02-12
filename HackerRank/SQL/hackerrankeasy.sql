--two cities shortest longest city names, and lengths
--if smallest city has multiple names, print first alphabetically
--if largest city has multiple names, print first alphabetically

DROP TABLE STATION;

CREATE TABLE STATION 
(
    ID NUMBER,
    CITY VARCHAR2(21),
    STATE VARCHAR2(2),
    LAT_N NUMBER,
    LONG_W NUMBER
);

CREATE TABLE TRIANGLES
(
    A NUMBER,
    B NUMBER,
    C NUMBER
);

CREATE TABLE STATION
(
    ID NUMBER,
    CITY VARCHAR2(21),
    STATE VARCHAR2(2),
    LAT_N NUMBER,
    LONG_W NUMBER
);

CREATE TABLE OCCUPATIONS
(
    NAME VARCHAR2(21),
    OCCUPATION VARCHAR2(21)
);

-- gets the city with the shortest name
-- does this by getting the city with the smallest length and then getting the city with the smallest name
select * from(select city,length(city) from station order by length(city) asc,city asc) where rownum=1 union
select * from(select city,length(city) from station order by length(city) desc,city desc) where rownum=1;

-- gets information about the ending and starting letters of the city names in the table

-- "%a" means that the city name ends with a
-- "a%" means that the city name starts with a
SELECT DISTINCT city FROM 
(SELECT DISTINCT city FROM station WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%') 
WHERE city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u';

--alternative methods to get the city that starts and ends with a vowel
SELECT DISTINCT CITY
FROM STATION WHERE REGEXP_LIKE(CITY,'^[aeiou].*[aeiou]$');  --regex function is a search function 
-- ^ means start of the string, $ means end of the string, .* means any character 0 or more times
-- ^[^aeiou] means start of the string and not a vowel

-- BOTH doesn't end with a vowel or start with a vowel
SELECT DISTINCT CITY FROM STATION WHERE
REGEXP_LIKE(CITY,'^[^AEIOU]') AND REGEXP_LIKE(CITY,'[^AEIOUaeiou]$');

-- Either doesn't end with a vowel or start with a vowel
SELECT DISTINCT CITY FROM STATION WHERE NOT 
REGEXP_LIKE(CITY, '^[AEIOUaeiou].*[AEIOUaeiou]$');




--ORDERING characters in a string
--SUBSTR = substring function (string, start position, length) ID is the primary key (used to order the table)
SELECT NAME FROM STUDENTS WHERE MARKS > :marks ORDER BY SUBSTR(NAME, -3), ID;

-- ordering using a primary key
SELECT NAME FROM STUDENTS ORDER BY ID ASC;


-- Triangle classification
-- Not a triangle if the sum of two sides is less than or equal to the third side (A+B<=C)
-- Equilateral if all sides are equal
-- Isosceles if two sides are equal (A=B AND A!=C)
-- Scalene if all sides are different (A!=B AND B!=C AND A!=C)s
SELECT CASE WHEN A + B <= C OR B + C <= A OR A + C <= B THEN 'Not A Triangle'
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN (A = B AND A! = C) OR (B = C AND B! = A) OR (A = C AND A! = B)THEN 'Isosceles'
            WHEN A! = B AND B! = C AND A! = C THEN 'Scalene'
            END
FROM TRIANGLES;


DROP TABLE OCCUPATIONS;
DROP TABLE TRIANGLES;
DROP TABLE STATION;