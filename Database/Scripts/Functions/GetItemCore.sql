CREATE FUNCTION GetItemCore(item_Id INTEGER)
RETURNS TABLE
(
	id INTEGER, 
	name VARCHAR(50), 
	qualityCode VARCHAR(25), 
	qualityName VARCHAR(50), 
	rarityCode VARCHAR(25),
	rarityName VARCHAR(50),
	typeCode VARCHAR(25),
	typeName VARCHAR(50),
	reservedClassCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	item.itemid, 
			item.itemname, 
			itemQuality.itemQualityCode, 
			itemQuality.itemQualityName,
			itemRarity.itemRarityCode,
			itemRarity.itemRarityName,
			itemType.itemTypeCode,
			itemType.itemTypeName,
			class.classCode AS reservedClassCode
    FROM item
		INNER JOIN itemQuality ON itemQuality.itemQualityCode = item.itemQualityCode
		INNER JOIN itemRarity ON itemRarity.itemRarityCode = item.itemRarityCode
		INNER JOIN itemType ON itemType.itemTypeCode = item.itemTypeCode
		LEFT JOIN class ON class.classCode = item.classCode
    WHERE item.itemId = item_Id;
END;
$$;