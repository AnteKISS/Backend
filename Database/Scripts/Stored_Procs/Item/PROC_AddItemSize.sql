CREATE OR REPLACE PROCEDURE PROC_AddItemSize
(
	itemSize_Code VARCHAR(25),
	itemSize_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemSize(itemSizeCode,  itemSizeName)
	VALUES			    (itemSize_Code, itemSize_Name);
END;
$$;