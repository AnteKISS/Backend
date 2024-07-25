CREATE OR REPLACE PROCEDURE PROC_LinkModifierStat
(
	stat_Code VARCHAR(25),
	monsterModifier_Code VARCHAR(25),
	modifier_Intensity NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifierBaseStat(statCode, monsterModifierCode, intensity)
	VALUES			                   (stat_Code, monsterModifier_Code, modifier_Intensity);
END;
$$;