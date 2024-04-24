-- function to split string

CREATE OR REPLACE FUNCTION SPLIT_STRING(str VARCHAR2, delim VARCHAR2, pos PLS_INTEGER)
RETURN VARCHAR2 IS
  i PLS_INTEGER;
  pos_temp PLS_INTEGER := pos;
BEGIN
  WHILE pos_temp > 0 LOOP
    pos_temp := INSTR(str, delim, 1, pos_temp);
    i := i + 1;
  END LOOP;
  RETURN SUBSTR(str, INSTR(str, delim, 1, i) + 1,
    INSTR(str, delim, 1, i + 1) - INSTR(str, delim, 1, i) -1);
END;
/