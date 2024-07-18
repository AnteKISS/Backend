CREATE OR REPLACE PROCEDURE PROC_AddStat
(
	stat_Code VARCHAR(25),
	stat_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Stats(statCode,  statName)
	VALUES			 (stat_Code, stat_Name);
END;
$$;