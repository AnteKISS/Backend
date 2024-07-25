CREATE OR REPLACE PROCEDURE PROC_AddSkillDamage
(
	skillDamage_Code VARCHAR(25),
	base_Scaling_pct NUMERIC(15,2),
	base_Damage NUMERIC(15,2),
	perLvlDamage_Modifier NUMERIC(15,2),
	perLvlDamage_Factor NUMERIC(15,2),
	perLvlScaling_Modifier NUMERIC(15,2),
	perLvlScaling_Factor NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillDamage(skillDamageCode, baseScaling_pct, baseDamage, perLvlDamageModifier, perLvlDamageFactor, perLvlScalingModifier, perLvlScalingFactor)
	VALUES			       (skillDamage_Code, base_Scaling_pct, base_Damage, perLvlDamage_Modifier, perLvlDamage_Factor, perLvlScaling_Modifier, perLvlScaling_Factor);
END;
$$;