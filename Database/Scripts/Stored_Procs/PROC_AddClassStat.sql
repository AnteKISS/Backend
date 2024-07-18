CREATE OR REPLACE PROCEDURE PROC_AddClassStat
(
	stat_Code VARCHAR(25),
	class_Code VARCHAR(25),
	base_Value INTEGER,
	increase_PerLevel INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO classBaseStat(statCode,  classCode,  baseValue,  increasePerLevel)
	VALUES			         (stat_Code, class_Code, base_Value, increase_PerLevel);
END;
$$;