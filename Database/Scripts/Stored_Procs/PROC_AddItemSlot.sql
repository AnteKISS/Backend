CREATE OR REPLACE PROCEDURE PROC_AddItemSlot
(
	itemSlot_Code VARCHAR(25),
	itemSlot_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itemSlot(itemSlotCode,  itemSlotName)
	VALUES				(itemSlot_Code, itemSlot_Name);
END;
$$;