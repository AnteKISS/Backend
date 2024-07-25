CREATE OR REPLACE PROCEDURE PROC_AddSkill
(
	skill_Code VARCHAR(25),
	skill_Name VARCHAR(50),
	skillRange_m INT,
	cast_Time_s NUMERIC(15,2),
	base_Cooldown_s NUMERIC(15,2),
	perLevel_CooldownModifier NUMERIC(15,2),
	baseMana_Cost NUMERIC(15,2),
	perLvlMana_CostFactor NUMERIC(15,2),
	perLvlMana_CostModifier NUMERIC(15,2),
	perLevel_CooldownFactor NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Skill(skillCode, skillName, range_m, castTime_s, baseCooldown_s, perLevelCooldownModifier, baseManaCost, perLvlManaCostFactor, perLvlManaCostModifier, perLevelCooldownFactor)
	VALUES			 (skill_Code, skill_Name, skillRange_m, cast_Time_s, base_Cooldown_s, perLevel_CooldownModifier, baseMana_Cost, perLvlMana_CostFactor, perLvlMana_CostModifier, perLevel_CooldownFactor);
END;
$$;