CREATE OR REPLACE PROCEDURE PROC_AddMonsterQuality
(
	monsterQuality_Code VARCHAR(25),
	monsterQuality_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterQuality(monsterQualityCode, monsterQualityName)
	VALUES			          (monsterQuality_Code, monsterQuality_Name);
END;
$$;