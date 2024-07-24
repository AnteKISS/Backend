CREATE OR REPLACE PROCEDURE PROC_AddClassAttribute
(
	class_Code VARCHAR(25),
	attribute_Code VARCHAR(25),
	base_Value INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO classAttribute(classCode,  attributeCode,  baseValue)
	VALUES			          (class_Code, attribute_Code, base_Value);
END;
$$;