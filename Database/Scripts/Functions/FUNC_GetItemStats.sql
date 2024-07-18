CREATE OR REPLACE FUNCTION FUNC_GetItemStats(itemType_Code VARCHAR(25))
RETURNS TABLE
(
	statCode VARCHAR(25),
	value NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	itemBaseStats.itemStatCode,
			itemBaseStats.statValue
    FROM itemBaseStats
    WHERE itemBaseStats.itemTypeCode = itemType_Code;
END;
$$;