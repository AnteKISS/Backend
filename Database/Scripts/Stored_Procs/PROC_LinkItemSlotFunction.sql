CREATE OR REPLACE PROCEDURE PROC_LinkItemSlotFunction
(
	itemSlot_Code VARCHAR(25),
	itemFunction_Code VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itemFunctionItemSlot(itemSlotCode,  itemFunctionCode)
	VALUES							(itemSlot_Code, itemFunction_Code);
END;
$$;