CREATE OR REPLACE FUNCTION FUNC_GetAllMonsters()
RETURNS TABLE
(
	id INTEGER,
	baseId INTEGER,
	name VARCHAR(50), 
	baseName VARCHAR(50), 
	qualityCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	Monster.monsterId,
			BaseMonster.baseMonsterId,
			Monster.monsterName,
			BaseMonster.baseMonsterName, 
			Monster.monsterQualityCode
    FROM Monster
		INNER JOIN BaseMonster ON BaseMonster.baseMonsterId = Monster.baseMonsterId;
END;
$$;