-- load for 2023 survey
BEGIN
  FOR rec IN (SELECT responseId, age, country, edlevel, yearscode, learncode FROM STACKOVERFLOW.SO_2023)
  LOOP
    IF rec.yearscode NOT IN ('Less than 1 year', 'More than 50 years', 'YearsCode', 'NA')
    AND rec.responseId NOT IN ('ResponseId', 'NA') THEN
        BEGIN
            INSERT INTO SOUSER (userId, age, country, edlevel, yearscode)
            VALUES (CONCAT('2023', rec.responseId), rec.age, rec.country, rec.edlevel, rec.yearscode);
            SPLIT_LEARN(rec.learncode, rec.responseId);
        END;
    END IF;
  END LOOP;
END;
/

-- load for 2022 survey
BEGIN
  FOR rec IN (SELECT responseId, age, country, edlevel, yearscode, learncode FROM STACKOVERFLOW.SO_2022)
  LOOP
    IF rec.yearscode NOT IN ('Less than 1 year', 'More than 50 years', 'YearsCode', 'NA')
    AND rec.responseId NOT IN ('ResponseId') THEN
        BEGIN
            INSERT INTO SOUSER (userId, age, country, edlevel, yearscode)
            VALUES (CONCAT('2022', rec.responseId), rec.age, rec.country, rec.edlevel, rec.yearscode);
            SPLIT_LEARN(rec.learncode, rec.responseId);
        END;
    END IF;
  END LOOP;
END;
/