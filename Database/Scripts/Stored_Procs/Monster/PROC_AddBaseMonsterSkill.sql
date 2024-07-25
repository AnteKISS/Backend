CREATE OR REPLACE PROCEDURE PROC_AddBaseMonsterSkill
(
	skill_Code VARCHAR(25),
	baseMonster_Id INT,
	skill_Level INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonsterSkill(skillCode, baseMonsterId, level)
	VALUES			            (skill_Code, baseMonster_Id, skill_Level);
END;
$$;