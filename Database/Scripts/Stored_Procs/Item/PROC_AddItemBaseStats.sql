CREATE OR REPLACE PROCEDURE PROC_AddItemBaseStat
(
	itemType_Code VARCHAR(25),
	itemStat_Code VARCHAR(25),
	stat_Value NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itemBaseStats(itemTypeCode,  itemStatCode,  statValue)
	VALUES					 (itemType_Code, itemStat_Code, stat_Value);
END;
$$;