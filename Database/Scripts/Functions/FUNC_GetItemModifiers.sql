CREATE OR REPLACE FUNCTION FUNC_GetItemModifiers(item_Id INTEGER)
RETURNS TABLE
(
	modifierCode VARCHAR(25),
	modifierValue NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	itemItemModifier.itemModifierCode,
			itemItemModifier.modifierValue
    FROM itemItemModifier
    WHERE itemItemModifier.itemId = item_Id;
END;
$$;