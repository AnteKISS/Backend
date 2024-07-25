CREATE OR REPLACE PROCEDURE PROC_AddMonsterModifier
(
	monsterModifier_Code VARCHAR(25),
	monsterModifier_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifier(monsterModifierCode, monsterModifierName)
	VALUES			           (monsterModifier_Code, monsterModifier_Name);
END;
$$;