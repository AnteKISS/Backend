CREATE OR REPLACE PROCEDURE PROC_AddItemStat
(
	itemStat_Code VARCHAR(25),
	itemStat_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itemStat(itemStatCode,  itemStatName)
	VALUES			    (itemStat_Code, itemStat_Name);
END;
$$;