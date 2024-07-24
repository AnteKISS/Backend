CREATE OR REPLACE PROCEDURE PROC_AddMonsterBaseStats
(
	stat_Code VARCHAR(25),
	monster_Id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterBaseStats(statCode, monsterId)
	VALUES			            (stat_Code, monster_Id);
END;
$$;