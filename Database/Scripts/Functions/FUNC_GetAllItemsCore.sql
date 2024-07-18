CREATE OR REPLACE FUNCTION FUNC_GetAllItemsCore()
RETURNS TABLE
(
	id INTEGER, 
	name VARCHAR(50), 
	qualityCode VARCHAR(25), 
	rarityCode VARCHAR(25),
	typeCode VARCHAR(25),
	reservedClassCode VARCHAR(25),
	sizeCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	item.itemid, 
			item.itemname, 
			itemQuality.itemQualityCode, 
			itemRarity.itemRarityCode,
			itemType.itemTypeCode,
			class.classCode AS reservedClassCode,
			itemType.itemSizeCode
    FROM item
		INNER JOIN itemQuality ON itemQuality.itemQualityCode = item.itemQualityCode
		INNER JOIN itemRarity ON itemRarity.itemRarityCode = item.itemRarityCode
		INNER JOIN itemType ON itemType.itemTypeCode = item.itemTypeCode
		LEFT JOIN class ON class.classCode = item.classCode;
END;
$$;