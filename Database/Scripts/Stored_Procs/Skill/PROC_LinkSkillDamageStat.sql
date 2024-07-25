CREATE OR REPLACE PROCEDURE PROC_LinkSkillDamageStat
(
	stat_Code VARCHAR(25),
	skillDamage_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillDamageBaseStat(statCode, skillDamageCode)
	VALUES			               (stat_Code, skillDamage_Code);
END;
$$;