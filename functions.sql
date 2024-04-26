-- Procedure para tratamento dos dados que não estão normalizados.

CREATE OR REPLACE PROCEDURE SPLIT_LEARN(learnresource VARCHAR2, responseId VARCHAR2) IS
  i PLS_INTEGER := 1;
  pos_substring PLS_INTEGER := 1;
  splitted VARCHAR2(255);
BEGIN
  WHILE pos_substring > 0 LOOP
    pos_substring := INSTR(learnresource, ';', i);
    
    -- case if theres no ;
    IF pos_substring = 0 THEN
      pos_substring := LENGTH(learnresource) + 1;
    END IF;
    splitted := SUBSTR(learnresource, i, pos_substring - i);
    i := pos_substring + 1;
    
    -- check if substring is ok before inserting into the LEARN table
    IF splitted IS NOT NULL AND REGEXP_LIKE(responseId, '^[[:digit:]]+$') 
    AND learnresource IN ('Books / Physical media', 'Coding Bootcamp', 
    'Other online resources (e.g., videos, blogs, forum)', 'School (i.e., University, College, etc)') THEN
      INSERT INTO LEARN (resourcetype, SOuserId) VALUES (splitted, CONCAT('2023', responseId)); -- 2022
      COMMIT;
    END IF;
    pos_substring := INSTR(learnresource, ';', i);
  END LOOP;
END;
/