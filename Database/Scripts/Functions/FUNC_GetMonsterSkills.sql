CREATE OR REPLACE FUNCTION FUNC_GetMonsterSkills(baseMonster_Id INTEGER)
RETURNS TABLE
(
	skillCode VARCHAR(25),
	level INTEGER
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	baseMonsterSkill.skillCode,
			baseMonsterSkill.level
    FROM baseMonsterSkill
    WHERE baseMonsterSkill.baseMonsterId = baseMonster_Id;
END;
$$;