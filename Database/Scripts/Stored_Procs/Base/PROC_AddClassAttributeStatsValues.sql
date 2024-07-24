CREATE OR REPLACE PROCEDURE PROC_AddClassAttributeStatsValues
(
	stat_Code VARCHAR(25),
	class_Code VARCHAR(25),
	attribute_Code VARCHAR(25),
	_scaling NUMERIC(15,2),
	_modifier NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO classAttributeStatsValues(statCode,  classCode,  attributeCode,  scaling,  modifier)
	VALUES			          			 (stat_Code, class_Code, attribute_Code, _scaling, _modifier);
END;
$$;