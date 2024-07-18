CREATE OR REPLACE PROCEDURE PROC_AddModifier_ATTR
(
	itemModifier_Code VARCHAR(25),
	itemModifier_Name VARCHAR(50),
	attribute_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemModifier(itemModifierCode,  itemModifierName)
	VALUES					(itemModifier_Code, itemModifier_Name);
	
	INSERT INTO itemModifierAttribute(attributeCode,  itemModifierCode)
	VALUES							 (attribute_Code, itemModifier_Code);
END;
$$;