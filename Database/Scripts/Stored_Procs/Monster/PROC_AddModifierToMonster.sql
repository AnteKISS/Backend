CREATE OR REPLACE PROCEDURE PROC_AddModifierToMonster
(
	monster_Id INT,
	monsterModifier_Code VARCHAR(25),
	modifier_Value VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterMonsterModifier(monsterId, monsterModifierCode, modifierValue)
	VALUES			                  (monster_Id, monsterModifier_Code, modifier_Value);
END;
$$;