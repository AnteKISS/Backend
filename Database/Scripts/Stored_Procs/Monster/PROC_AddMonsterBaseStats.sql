CREATE OR REPLACE PROCEDURE PROC_AddMonsterBaseStats
(
	stat_Code VARCHAR(25),
	monster_Id INT,
	stat_Value NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifierBaseStat(statCode, monsterId, statValue)
	VALUES			                   (stat_Code, monster_Id, stat_Value);
END;
$$;