CREATE OR REPLACE PROCEDURE PROC_AddItemModifier_STAT
(
	itemModifier_Code VARCHAR(25),
	itemModifier_Name VARCHAR(50),
	stat_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemModifier(itemModifierCode,  itemModifierName)
	VALUES					(itemModifier_Code, itemModifier_Name);
	
	INSERT INTO itemModifierStat(statCode,  itemModifierCode)
	VALUES						(stat_Code, itemModifier_Code);
END;
$$;