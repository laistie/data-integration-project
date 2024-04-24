-- INITIAL SELECT WITH IMPORTANT DATA FROM 2023 SURVEY
SELECT RESPONSEID, AGE, EDLEVEL, LEARNCODE, YEARSCODE, COUNTRY 
FROM STACKOVERFLOW.SO_2023 
WHERE LEARNCODE IN ('Books / Physical media', 'Coding Bootcamp', 'Other online resources (e.g., videos, blogs, forum)', 'School (i.e., University, College, etc)');

-- IMPORTANT SELECT FILTER FROM SURVEY
SELECT * FROM STACKOVERFLOW.SO_2023 WHERE learncode IN ('Books / Physical media', 
'Coding Bootcamp', 'Other online resources (e.g., videos, blogs, forum)', 
'School (i.e., University, College, etc)');

-- INITIAL SELECT WITH IMPORTANT DATA FROM 2022 SURVEY

DESCRIBE STACKOVERFLOW.SO_2022;

SELECT RESPONSEID, AGE, EDLEVEL, LEARNCODE, YEARSCODE, COUNTRY 
FROM STACKOVERFLOW.SO_2022
WHERE LEARNCODE IN ('Books / Physical media', 'Coding Bootcamp', 'Other online resources (e.g., videos, blogs, forum)', 'School (i.e., University, College, etc)');