CREATE OR REPLACE PROCEDURE PROC_AddItemQuality
(
	itemQuality_Code VARCHAR(25),
	itemQuality_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemQuality(itemQualityCode,  itemQualityName)
	VALUES			       (itemQuality_Code, itemQuality_Name);
END;
$$;