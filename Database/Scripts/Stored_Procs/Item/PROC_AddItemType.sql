CREATE OR REPLACE PROCEDURE PROC_AddItemType
(
	itemType_Code VARCHAR(25),
	itemType_Name VARCHAR(50),
	itemSize_Code VARCHAR(25),
	itemFunction_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemType(itemTypeCode,  itemTypeName,  itemSizeCode,  itemFunctionCode)
	VALUES			    (itemType_Code, itemType_Name, itemSize_Code, itemFunction_Code);
END;
$$;