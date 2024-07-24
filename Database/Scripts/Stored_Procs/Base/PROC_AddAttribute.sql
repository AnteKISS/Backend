CREATE OR REPLACE PROCEDURE PROC_AddAttribute
(
	attribute_Code VARCHAR(25),
	attribute_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Attribute(attributeCode,  attributeName)
	VALUES			     (attribute_Code, attribute_Name);
END;
$$;