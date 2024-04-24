-- insert data into learncode

INSERT ALL
      INTO LEARN (resourcetype, SOuserId) VALUES (resourcetype, CONCAT('2023', responseId))
      INTO SOUSER (userId, age, country, edlevel, yearscode) VALUES (CONCAT('2023', responseId), age, country, edlevel, yearscode)
SELECT resourceType, responseId, age, country, edlevel, yearscode
FROM (
      SELECT SPLIT_STRING(learncode, ';', LEVEL) AS resourcetype, responseId, age, country, edlevel, yearscode
      FROM STACKOVERFLOW.SO_2023
      CONNECT BY LEVEL <= LENGTH(REGEXP_REPLACE(learncode, '[^;]+')) + 1
)
WHERE resourcetype IN ('Books / Physical media', 
'Coding Bootcamp', 'Other online resources (e.g., videos, blogs, forum)', 
'School (i.e., University, College, etc)')
AND yearscode NOT IN ('Less than 1 year', 'More than 50 years');