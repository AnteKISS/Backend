CREATE OR REPLACE PROCEDURE PROC_AddItem
(
	item_Name VARCHAR(50),
	itemQuality_Code VARCHAR(25),
	itemRarity_Code VARCHAR(25),
	itemType_Code VARCHAR(25),
	class_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Item(itemName,  itemQualityCode,  itemRarityCode,  itemTypeCode,  classCode)
	VALUES			(item_Name, itemQuality_Code, itemRarity_Code, itemType_Code, class_Code);
END;
$$;