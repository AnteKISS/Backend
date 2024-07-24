CREATE OR REPLACE PROCEDURE PROC_AddBaseMonster
(
	monster_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonster(baseMonsterName)
	VALUES			       (monster_Name);
END;
$$;