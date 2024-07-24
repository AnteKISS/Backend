CREATE OR REPLACE PROCEDURE PROC_AddItemRarity
(
	itemRarity_Code VARCHAR(25),
	itemRarity_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemRarity(itemRarityCode,  itemRarityName)
	VALUES			      (itemRarity_Code, itemRarity_Name);
END;
$$;