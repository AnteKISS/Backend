CREATE OR REPLACE PROCEDURE PROC_AddClass
(
	class_Code VARCHAR(25),
	class_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Class(classCode,  className)
	VALUES			 (class_Code, class_Name);
END;
$$;