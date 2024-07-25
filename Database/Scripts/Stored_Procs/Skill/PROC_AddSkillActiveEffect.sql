CREATE OR REPLACE PROCEDURE PROC_AddSkillActiveEffect
(
	skill_Code VARCHAR(25),
	activeEffect_Code VARCHAR(25),
	skillType_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillActiveEffect(skillCode, activeEffectCode, skillTypeCode)
	VALUES			             (skill_Code, activeEffect_Code, skillType_Code);
END;
$$;