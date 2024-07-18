CREATE OR REPLACE FUNCTION FUNC_GetMonsterModifiers(monster_Id INTEGER)
RETURNS TABLE
(
	modifierCode VARCHAR(25),
	modifierValue NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	monsterMonsterModifier.monsterModifierCode,
			monsterMonsterModifier.modifierValue
    FROM monsterMonsterModifier
    WHERE monsterMonsterModifier.monsterId = monster_Id;
END;
$$;