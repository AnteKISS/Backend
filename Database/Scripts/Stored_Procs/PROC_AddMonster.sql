CREATE OR REPLACE PROCEDURE PROC_AddMonster
(
	monster_Name VARCHAR(50),
	baseMonster_Id NUMERIC,
	monsterQuality_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Monster(monsterName,  baseMonsterId,  monsterQualityCode)
	VALUES			   (monster_Name, baseMonster_Id, monsterQuality_Code);
END;
$$;