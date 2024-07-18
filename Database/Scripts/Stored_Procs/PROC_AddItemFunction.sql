CREATE OR REPLACE PROCEDURE PROC_AddItemFunction
(
	itemFunction_Code VARCHAR(25),
	itemFunction_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemFunction(itemFunctionCode,  itemFunctionName)
	VALUES			        (itemFunction_Code, itemFunction_Name);
END;
$$;