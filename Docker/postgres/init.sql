-- Script : init.sql

-- USAGE : \i '{PATH_TO_FILE}/init.sql' OR Press button in pgAdmin

/******************************************/
/***        DATABASE STRUCTURE          ***/
/******************************************/
CREATE TABLE Stats(
   statCode VARCHAR(25) ,
   statName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(statCode),
   UNIQUE(statName)
);

CREATE TABLE Class(
   classCode VARCHAR(25) ,
   className VARCHAR(50)  NOT NULL,
   PRIMARY KEY(classCode),
   UNIQUE(className)
);

CREATE TABLE SkillTree(
   skillTreeCode VARCHAR(25) ,
   PRIMARY KEY(skillTreeCode)
);

CREATE TABLE Skill(
   skillCode VARCHAR(25) ,
   skillName VARCHAR(50)  NOT NULL,
   range_m INTEGER NOT NULL,
   castTime_s NUMERIC(15,2)   NOT NULL,
   baseCooldown_s NUMERIC(15,2)   NOT NULL,
   perLevelCooldownModifier NUMERIC(15,2)   NOT NULL,
   baseManaCost NUMERIC(15,2)   NOT NULL,
   perLvlManaCostFactor NUMERIC(15,2)   NOT NULL,
   perLvlManaCostModifier NUMERIC(15,2)   NOT NULL,
   perLevelCooldownFactor NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(skillCode),
   UNIQUE(skillName)
);

CREATE TABLE Attribute(
   attributeCode VARCHAR(25) ,
   attributeName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(attributeCode),
   UNIQUE(attributeName)
);

CREATE TABLE Player(
   playerId SERIAL,
   username VARCHAR(50)  NOT NULL,
   savePath VARCHAR(100)  NOT NULL,
   PRIMARY KEY(playerId),
   UNIQUE(username),
   UNIQUE(savePath)
);

CREATE TABLE ActiveEffect(
   activeEffectCode VARCHAR(25) ,
   baseValue NUMERIC(15,2)   NOT NULL,
   perLvlValueModifier NUMERIC(15,2)   NOT NULL,
   perLvlValueFactor NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(activeEffectCode)
);

CREATE TABLE StatusEffect(
   StatusEffectCode VARCHAR(25) ,
   statusEffectName VARCHAR(50)  NOT NULL,
   intensityScaling_pct NUMERIC(15,2)  ,
   intensityModifier NUMERIC(15,2)  ,
   statCode VARCHAR(25) ,
   attributeCode VARCHAR(25) ,
   PRIMARY KEY(StatusEffectCode),
   UNIQUE(statusEffectName),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(attributeCode) REFERENCES Attribute(attributeCode)
);

CREATE TABLE ItemSlot(
   itemSlotCode VARCHAR(25) ,
   itemSlotName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemSlotCode),
   UNIQUE(itemSlotName)
);

CREATE TABLE ItemQuality(
   itemQualityCode VARCHAR(25) ,
   itemQualityName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemQualityCode),
   UNIQUE(itemQualityName)
);

CREATE TABLE ItemRarity(
   itemRarityCode VARCHAR(25) ,
   itemRarityName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemRarityCode),
   UNIQUE(itemRarityName)
);

CREATE TABLE ItemModifier(
   itemModifierCode VARCHAR(25) ,
   itemModifierName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemModifierCode),
   UNIQUE(itemModifierName)
);

CREATE TABLE ProcType(
   procTypeCode VARCHAR(25) ,
   procTypeName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(procTypeCode),
   UNIQUE(procTypeName)
);

CREATE TABLE BaseMonster(
   baseMonsterCode VARCHAR(25) ,
   baseMonsterName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(baseMonsterCode),
   UNIQUE(baseMonsterName)
);

CREATE TABLE MonsterQuality(
   monsterQualityCode VARCHAR(25) ,
   monsterQualityName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(monsterQualityCode),
   UNIQUE(monsterQualityName)
);

CREATE TABLE MonsterModifier(
   monsterModifierCode VARCHAR(25) ,
   monsterModifierName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(monsterModifierCode),
   UNIQUE(monsterModifierName)
);

CREATE TABLE SkillType(
   SkillTypeCode VARCHAR(25) ,
   skillTypeName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(SkillTypeCode)
);

CREATE TABLE ItemFunction(
   itemFunctionCode VARCHAR(25) ,
   itemFunctionName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemFunctionCode),
   UNIQUE(itemFunctionName)
);

CREATE TABLE ItemSize(
   itemSizeCode VARCHAR(25) ,
   itemSizeName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemSizeCode),
   UNIQUE(itemSizeName)
);

CREATE TABLE ItemStat(
   itemStatCode VARCHAR(25) ,
   itemStatName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemStatCode),
   UNIQUE(itemStatName)
);

CREATE TABLE MonsterBehavior(
   monsterBehaviorCode VARCHAR(25) ,
   monsterBehaviorName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(monsterBehaviorCode)
);

CREATE TABLE DamageType(
   damageTypeCode VARCHAR(25) ,
   damageTypeName VARCHAR(50)  NOT NULL,
   StatusEffectCode VARCHAR(25) ,
   PRIMARY KEY(damageTypeCode),
   UNIQUE(damageTypeName),
   FOREIGN KEY(StatusEffectCode) REFERENCES StatusEffect(StatusEffectCode)
);

CREATE TABLE ItemType(
   ItemTypeCode VARCHAR(25) ,
   itemTypeName VARCHAR(50)  NOT NULL,
   itemSizeCode VARCHAR(25)  NOT NULL,
   itemFunctionCode VARCHAR(25)  NOT NULL,
   PRIMARY KEY(ItemTypeCode),
   UNIQUE(itemTypeName),
   FOREIGN KEY(itemSizeCode) REFERENCES ItemSize(itemSizeCode),
   FOREIGN KEY(itemFunctionCode) REFERENCES ItemFunction(itemFunctionCode)
);

CREATE TABLE Monster(
   monsterCode VARCHAR(25) ,
   monsterName VARCHAR(50)  NOT NULL,
   baseExp INTEGER NOT NULL,
   perLvlExp INTEGER NOT NULL,
   monsterBehaviorCode VARCHAR(25)  NOT NULL,
   baseMonsterCode VARCHAR(25)  NOT NULL,
   monsterQualityCode VARCHAR(25)  NOT NULL,
   PRIMARY KEY(monsterCode),
   UNIQUE(monsterName),
   FOREIGN KEY(monsterBehaviorCode) REFERENCES MonsterBehavior(monsterBehaviorCode),
   FOREIGN KEY(baseMonsterCode) REFERENCES BaseMonster(baseMonsterCode),
   FOREIGN KEY(monsterQualityCode) REFERENCES MonsterQuality(monsterQualityCode)
);

CREATE TABLE SkillDamage(
   skillDamageCode VARCHAR(25) ,
   baseScaling_pct NUMERIC(15,2)   NOT NULL,
   baseDamage NUMERIC(15,2)   NOT NULL,
   perLvlDamageModifier NUMERIC(15,2)   NOT NULL,
   perLvlDamageFactor NUMERIC(15,2)   NOT NULL,
   perLvlScalingModifier NUMERIC(15,2)   NOT NULL,
   perLvlScalingFactor NUMERIC(15,2)   NOT NULL,
   damageTypeCode VARCHAR(25)  NOT NULL,
   PRIMARY KEY(skillDamageCode),
   FOREIGN KEY(damageTypeCode) REFERENCES DamageType(damageTypeCode)
);

CREATE TABLE Item(
   ItemId SERIAL,
   itemName VARCHAR(50)  NOT NULL,
   itemQualityCode VARCHAR(25) ,
   itemRarityCode VARCHAR(25)  NOT NULL,
   ItemTypeCode VARCHAR(25)  NOT NULL,
   classCode VARCHAR(25) ,
   PRIMARY KEY(ItemId),
   UNIQUE(itemName),
   FOREIGN KEY(itemQualityCode) REFERENCES ItemQuality(itemQualityCode),
   FOREIGN KEY(itemRarityCode) REFERENCES ItemRarity(itemRarityCode),
   FOREIGN KEY(ItemTypeCode) REFERENCES ItemType(ItemTypeCode),
   FOREIGN KEY(classCode) REFERENCES Class(classCode)
);

CREATE TABLE SkillTreeDependencies(
   skillTreeCode VARCHAR(25) ,
   skillCode VARCHAR(25) ,
   requiredLevel INTEGER NOT NULL,
   parentSkillCode VARCHAR(25) ,
   PRIMARY KEY(skillTreeCode, skillCode),
   FOREIGN KEY(skillTreeCode) REFERENCES SkillTree(skillTreeCode),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode)
);

CREATE TABLE ClassSkillTree(
   classCode VARCHAR(25) ,
   skillTreeCode VARCHAR(25) ,
   PRIMARY KEY(classCode, skillTreeCode),
   FOREIGN KEY(classCode) REFERENCES Class(classCode),
   FOREIGN KEY(skillTreeCode) REFERENCES SkillTree(skillTreeCode)
);

CREATE TABLE ClassAttribute(
   classCode VARCHAR(25) ,
   attributeCode VARCHAR(25) ,
   baseValue INTEGER NOT NULL,
   PRIMARY KEY(classCode, attributeCode),
   FOREIGN KEY(classCode) REFERENCES Class(classCode),
   FOREIGN KEY(attributeCode) REFERENCES Attribute(attributeCode)
);

CREATE TABLE ClassAttributeStatsValues(
   statCode VARCHAR(25) ,
   classCode VARCHAR(25) ,
   attributeCode VARCHAR(25) ,
   scaling NUMERIC(15,2)   NOT NULL,
   modifier NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(statCode, classCode, attributeCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(classCode) REFERENCES Class(classCode),
   FOREIGN KEY(attributeCode) REFERENCES Attribute(attributeCode)
);

CREATE TABLE ClassBaseStat(
   statCode VARCHAR(25) ,
   classCode VARCHAR(25) ,
   baseValue INTEGER NOT NULL,
   increasePerLevel INTEGER NOT NULL,
   PRIMARY KEY(statCode, classCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(classCode) REFERENCES Class(classCode)
);

CREATE TABLE SkillScalingStats(
   attributeCode VARCHAR(25) ,
   skillDamageCode VARCHAR(25) ,
   PRIMARY KEY(attributeCode, skillDamageCode),
   FOREIGN KEY(attributeCode) REFERENCES Attribute(attributeCode),
   FOREIGN KEY(skillDamageCode) REFERENCES SkillDamage(skillDamageCode)
);

CREATE TABLE SkillDamageBaseStat(
   statCode VARCHAR(25) ,
   skillDamageCode VARCHAR(25) ,
   PRIMARY KEY(statCode, skillDamageCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(skillDamageCode) REFERENCES SkillDamage(skillDamageCode)
);

CREATE TABLE SkillActiveEffect(
   skillCode VARCHAR(25) ,
   activeEffectCode VARCHAR(25) ,
   SkillTypeCode VARCHAR(25) ,
   PRIMARY KEY(skillCode, activeEffectCode, SkillTypeCode),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode),
   FOREIGN KEY(activeEffectCode) REFERENCES ActiveEffect(activeEffectCode),
   FOREIGN KEY(SkillTypeCode) REFERENCES SkillType(SkillTypeCode)
);

CREATE TABLE SkillSkillDamage(
   skillCode VARCHAR(25) ,
   skillDamageCode VARCHAR(25) ,
   SkillTypeCode VARCHAR(25) ,
   PRIMARY KEY(skillCode, skillDamageCode, SkillTypeCode),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode),
   FOREIGN KEY(skillDamageCode) REFERENCES SkillDamage(skillDamageCode),
   FOREIGN KEY(SkillTypeCode) REFERENCES SkillType(SkillTypeCode)
);

CREATE TABLE ActiveEffectBaseStat(
   statCode VARCHAR(25) ,
   activeEffectCode VARCHAR(25) ,
   intensity INTEGER NOT NULL,
   PRIMARY KEY(statCode, activeEffectCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(activeEffectCode) REFERENCES ActiveEffect(activeEffectCode)
);

CREATE TABLE ItemTypeItemSlot(
   itemSlotCode VARCHAR(25) ,
   itemFunctionCode VARCHAR(25) ,
   PRIMARY KEY(itemSlotCode, itemFunctionCode),
   FOREIGN KEY(itemSlotCode) REFERENCES ItemSlot(itemSlotCode),
   FOREIGN KEY(itemFunctionCode) REFERENCES ItemFunction(itemFunctionCode)
);

CREATE TABLE ItemItemModifier(
   ItemId INTEGER,
   itemModifierCode VARCHAR(25) ,
   modifierValue NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(ItemId, itemModifierCode),
   FOREIGN KEY(ItemId) REFERENCES Item(ItemId),
   FOREIGN KEY(itemModifierCode) REFERENCES ItemModifier(itemModifierCode)
);

CREATE TABLE ItemModifierStat(
   statCode VARCHAR(25) ,
   itemModifierCode VARCHAR(25) ,
   PRIMARY KEY(statCode, itemModifierCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(itemModifierCode) REFERENCES ItemModifier(itemModifierCode)
);

CREATE TABLE ItemModifierSkill(
   skillCode VARCHAR(25) ,
   itemModifierCode VARCHAR(25) ,
   procTypeCode VARCHAR(25) ,
   level INTEGER NOT NULL,
   procChance_pct NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(skillCode, itemModifierCode, procTypeCode),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode),
   FOREIGN KEY(itemModifierCode) REFERENCES ItemModifier(itemModifierCode),
   FOREIGN KEY(procTypeCode) REFERENCES ProcType(procTypeCode)
);

CREATE TABLE ItemModifierAttribute(
   attributeCode VARCHAR(25) ,
   itemModifierCode VARCHAR(25) ,
   PRIMARY KEY(attributeCode, itemModifierCode),
   FOREIGN KEY(attributeCode) REFERENCES Attribute(attributeCode),
   FOREIGN KEY(itemModifierCode) REFERENCES ItemModifier(itemModifierCode)
);

CREATE TABLE MonsterBaseStats(
   statCode VARCHAR(25) ,
   monsterCode VARCHAR(25) ,
   baseValue NUMERIC(15,2)   NOT NULL,
   perLvlValue NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(statCode, monsterCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(monsterCode) REFERENCES Monster(monsterCode)
);

CREATE TABLE MonsterModifierBaseStat(
   statCode VARCHAR(25) ,
   monsterModifierCode VARCHAR(25) ,
   intensity NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(statCode, monsterModifierCode),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(monsterModifierCode) REFERENCES MonsterModifier(monsterModifierCode)
);

CREATE TABLE MonsterMonsterModifier(
   monsterCode VARCHAR(25) ,
   monsterModifierCode VARCHAR(25) ,
   PRIMARY KEY(monsterCode, monsterModifierCode),
   FOREIGN KEY(monsterCode) REFERENCES Monster(monsterCode),
   FOREIGN KEY(monsterModifierCode) REFERENCES MonsterModifier(monsterModifierCode)
);

CREATE TABLE BaseMonsterSkill(
   skillCode VARCHAR(25) ,
   baseMonsterCode VARCHAR(25) ,
   level INTEGER NOT NULL,
   PRIMARY KEY(skillCode, baseMonsterCode),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode),
   FOREIGN KEY(baseMonsterCode) REFERENCES BaseMonster(baseMonsterCode)
);

CREATE TABLE ItemBaseStats(
   ItemTypeCode VARCHAR(25) ,
   itemStatCode VARCHAR(25) ,
   statValue NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(ItemTypeCode, itemStatCode),
   FOREIGN KEY(ItemTypeCode) REFERENCES ItemType(ItemTypeCode),
   FOREIGN KEY(itemStatCode) REFERENCES ItemStat(itemStatCode)
);


/******************************************/
/***        STORED PROCEDURES           ***/
/******************************************/

-- Players
CREATE OR REPLACE PROCEDURE PROC_AddPlayer
(
	user_name VARCHAR(50),
	save_path VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Player(username,  savepath)
	VALUES			      (user_name, save_path);
END;
$$;

-- Character/Stats
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

CREATE OR REPLACE PROCEDURE PROC_AddClassStat
(
	stat_Code VARCHAR(25),
	class_Code VARCHAR(25),
	base_Value INTEGER,
	increase_PerLevel INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO classBaseStat(statCode,  classCode,  baseValue,  increasePerLevel)
	VALUES			         (stat_Code, class_Code, base_Value, increase_PerLevel);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddStat
(
	stat_Code VARCHAR(25),
	stat_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Stats(statCode,  statName)
	VALUES			 (stat_Code, stat_Name);
END;
$$;

-- Items
CREATE OR REPLACE PROCEDURE PROC_AddItem
(
	item_Name VARCHAR(50),
	itemQuality_Code VARCHAR(25),
	itemRarity_Code VARCHAR(25),
	itemType_Code VARCHAR(25),
	class_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Item(itemName,  itemQualityCode,  itemRarityCode,  itemTypeCode,  classCode)
	VALUES			(item_Name, itemQuality_Code, itemRarity_Code, itemType_Code, class_Code);
END;
$$;

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

CREATE OR REPLACE PROCEDURE PROC_AddModifier_ATTR
(
	itemModifier_Code VARCHAR(25),
	itemModifier_Name VARCHAR(50),
	attribute_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemModifier(itemModifierCode,  itemModifierName)
	VALUES					(itemModifier_Code, itemModifier_Name);
	
	INSERT INTO itemModifierAttribute(attributeCode,  itemModifierCode)
	VALUES							 (attribute_Code, itemModifier_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddItemModifier_STAT
(
	itemModifier_Code VARCHAR(25),
	itemModifier_Name VARCHAR(50),
	stat_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemModifier(itemModifierCode,  itemModifierName)
	VALUES					(itemModifier_Code, itemModifier_Name);
	
	INSERT INTO itemModifierStat(statCode,  itemModifierCode)
	VALUES						(stat_Code, itemModifier_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddModifierToItem
(
	item_Id INT,
	itemModifier_Code VARCHAR(25),
	modifier_Value NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemItemModifier(itemId,  itemModifierCode, modifierValue)
	VALUES					            (item_Id, itemModifier_Code, modifier_Value);
END;
$$;

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

CREATE OR REPLACE PROCEDURE PROC_AddItemRarity
(
	itemRarity_Code VARCHAR(25),
	itemRarity_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemRarity(itemRarityCode,  itemRarityName)
	VALUES			      (itemRarity_Code, itemRarity_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddItemSize
(
	itemSize_Code VARCHAR(25),
	itemSize_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemSize(itemSizeCode,  itemSizeName)
	VALUES			    (itemSize_Code, itemSize_Name);
END;
$$;

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

CREATE OR REPLACE PROCEDURE PROC_AddItemType
(
	itemType_Code VARCHAR(25),
	itemType_Name VARCHAR(50),
	itemSize_Code VARCHAR(25),
	itemFunction_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ItemType(itemTypeCode,  itemTypeName,  itemSizeCode,  itemFunctionCode)
	VALUES			    (itemType_Code, itemType_Name, itemSize_Code, itemFunction_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_LinkItemSlotFunction
(
	itemSlot_Code VARCHAR(25),
	itemFunction_Code VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itemTypeItemSlot(itemSlotCode,  itemFunctionCode)
	VALUES							(itemSlot_Code, itemFunction_Code);
END;
$$;

-- Monsters
CREATE OR REPLACE PROCEDURE PROC_AddBaseMonster
(
  monster_Code VARCHAR(25),
	monster_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonster(baseMonsterCode, baseMonsterName)
	VALUES			           (monster_Code, monster_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddBaseMonsterSkill
(
	skill_Code VARCHAR(25),
	baseMonster_Code VARCHAR(25),
	skill_Level INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonsterSkill(skillCode, baseMonsterCode, level)
	VALUES			            (skill_Code, baseMonster_Code, skill_Level);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddModifierToMonster
(
	monster_Code VARCHAR(25),
	monsterModifier_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterMonsterModifier(monsterCode, monsterModifierCode)
	VALUES			                  (monster_Code, monsterModifier_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonster
(
  monster_Code VARCHAR(25),
	monster_Name VARCHAR(50),
  base_Exp INTEGER,
  perLvl_Exp INTEGER,
  monsterBehavior_Code VARCHAR(25),
	baseMonster_Code VARCHAR(25),
	monsterQuality_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Monster(monsterCode, monsterName, baseExp, perLvlExp, monsterBehaviorCode,  baseMonsterCode,  monsterQualityCode)
	VALUES			       (monster_Code, monster_Name, base_Exp, perLvl_Exp, monsterBehavior_Code, baseMonster_Code, monsterQuality_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterBaseStats
(
	stat_Code VARCHAR(25),
	monster_Code VARCHAR(25),
	base_Value NUMERIC(15,2),
  perLvl_Value NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterBaseStats(statCode, monsterCode, baseValue, perLvlValue)
	VALUES			                   (stat_Code, monster_Code, base_Value, perLvl_Value);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterModifier
(
	monsterModifier_Code VARCHAR(25),
	monsterModifier_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifier(monsterModifierCode, monsterModifierName)
	VALUES			           (monsterModifier_Code, monsterModifier_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterModifierStats
(
	stat_Code VARCHAR(25),
	monsterModifierCode VARCHAR(25),
	intensity NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifierBaseStat(statCode, monsterId, statValue)
	VALUES			                   (stat_Code, monster_Id, stat_Value);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterQuality
(
	monsterQuality_Code VARCHAR(25),
	monsterQuality_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterQuality(monsterQualityCode, monsterQualityName)
	VALUES			          (monsterQuality_Code, monsterQuality_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterBehavior
(
	monsterBehavior_Code VARCHAR(25),
	monsterBehavior_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterBehavior(monsterBehaviorCode,  monsterBehaviorName)
	VALUES			               (monsterBehavior_Code, monsterBehavior_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_LinkModifierStat
(
	stat_Code VARCHAR(25),
	monsterModifier_Code VARCHAR(25),
	modifier_Intensity NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifierBaseStat(statCode, monsterModifierCode, intensity)
	VALUES			                   (stat_Code, monsterModifier_Code, modifier_Intensity);
END;
$$;

-- Skills
CREATE OR REPLACE PROCEDURE PROC_AddSkill
(
	skill_Code VARCHAR(25),
	skill_Name VARCHAR(50),
	skillRange_m INT,
	cast_Time_s NUMERIC(15,2),
	base_Cooldown_s NUMERIC(15,2),
	perLevel_CooldownModifier NUMERIC(15,2),
	baseMana_Cost NUMERIC(15,2),
	perLvlMana_CostFactor NUMERIC(15,2),
	perLvlMana_CostModifier NUMERIC(15,2),
	perLevel_CooldownFactor NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Skill(skillCode, skillName, range_m, castTime_s, baseCooldown_s, perLevelCooldownModifier, baseManaCost, perLvlManaCostFactor, perLvlManaCostModifier, perLevelCooldownFactor)
	VALUES			 (skill_Code, skill_Name, skillRange_m, cast_Time_s, base_Cooldown_s, perLevel_CooldownModifier, baseMana_Cost, perLvlMana_CostFactor, perLvlMana_CostModifier, perLevel_CooldownFactor);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddSkillActiveEffect
(
	skill_Code VARCHAR(25),
	activeEffect_Code VARCHAR(25),
	skillType_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillActiveEffect(skillCode, activeEffectCode, skillTypeCode)
	VALUES			             (skill_Code, activeEffect_Code, skillType_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddSkillDamage
(
	skillDamage_Code VARCHAR(25),
	base_Scaling_pct NUMERIC(15,2),
	base_Damage NUMERIC(15,2),
	perLvlDamage_Modifier NUMERIC(15,2),
	perLvlDamage_Factor NUMERIC(15,2),
	perLvlScaling_Modifier NUMERIC(15,2),
	perLvlScaling_Factor NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillDamage(skillDamageCode, baseScaling_pct, baseDamage, perLvlDamageModifier, perLvlDamageFactor, perLvlScalingModifier, perLvlScalingFactor)
	VALUES			       (skillDamage_Code, base_Scaling_pct, base_Damage, perLvlDamage_Modifier, perLvlDamage_Factor, perLvlScaling_Modifier, perLvlScaling_Factor);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_LinkSkillDamageStat
(
	stat_Code VARCHAR(25),
	skillDamage_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO SkillDamageBaseStat(statCode, skillDamageCode)
	VALUES			               (stat_Code, skillDamage_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddProctype
(
	procType_Code VARCHAR(25),
	procType_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ProcType(procTypeCode, procTypeName)
	VALUES			        (procType_Code, procType_Name);
END;
$$;

-- Data Insertion
CREATE OR REPLACE PROCEDURE PROC_InsertData
(
	
)
LANGUAGE plpgsql
AS $$
BEGIN
  /*******************************************/
	/***               Players               ***/
	/*******************************************/

  CALL PROC_AddPlayer('sims3007', '../../../../../Save/sims3007');
  CALL PROC_AddPlayer('simw2402', '../../../../../Save/simw2402');
  CALL PROC_AddPlayer('simv2104', '../../../../../Save/simv2104');
  CALL PROC_AddPlayer('befg1702', '../../../../../Save/befg1702');
  CALL PROC_AddPlayer('malm1708', '../../../../../Save/malm1708');

	/*******************************************/
	/***               Classes               ***/
	/*******************************************/
	
	-- Classes
	CALL PROC_AddClass('NONE', 'None'); -- For non class-restricted items
	CALL PROC_AddClass('SLDR', 'Soldier');
	CALL PROC_AddClass('WZRD', 'Wizard');
	CALL PROC_AddClass('RANG', 'Ranger');
	
	/*******************************************/
	/***          STATS/ATTRIBUTES           ***/
	/*******************************************/
	
	-- Stats
	CALL PROC_AddStat('ATTACK_SPEED', 'Attack Speed');
	CALL PROC_AddStat('HEALTH', 'Health');
	CALL PROC_AddStat('MANA', 'Mana');
	CALL PROC_AddStat('MOV_SPEED', 'Movement Speed');
	CALL PROC_AddStat('BLOCK_SPEED', 'Block Speed');
	CALL PROC_AddStat('BLOCK_RATE', 'Block Rate');
	CALL PROC_AddStat('ATTACK_RATING', 'Attack Rating');
  CALL PROC_AddStat('MELEE_RANGE', 'Melee range');
  CALL PROC_AddStat('SIGHT_DISTANCE', 'Sight Distance');
  CALL PROC_AddStat('DEFENSE', 'Defense');
	CALL PROC_AddStat('CRITICAL_RATE', 'Critical Rate');
	CALL PROC_AddStat('DAMAGE', 'Damage');
  CALL PROC_AddStat('DAMAGE_MAGIC', 'Magic Damage');
	CALL PROC_AddStat('ENHANCE_DAMAGE_PCT', 'Enhanced Damage Percent');
	CALL PROC_AddStat('POISE', 'Poise');
	CALL PROC_AddStat('MIN_DAMAGE_FIRE', 'Minimum Fire Damage');
	CALL PROC_AddStat('MAX_DAMAGE_FIRE', 'Maximum Fire Damage');
	CALL PROC_AddStat('MIN_DAMAGE_COLD', 'Minimum Cold Damage');
	CALL PROC_AddStat('MAX_DAMAGE_COLD', 'Maximum Cold Damage');
	CALL PROC_AddStat('MIN_DAMAGE_LIGHT', 'Minimum Lightning Damage');
	CALL PROC_AddStat('MAX_DAMAGE_LIGHT', 'Maximum Lightning Damage');
	
	-- Attributes
	CALL PROC_AddAttribute('STR', 'Strength');
	CALL PROC_AddAttribute('DEX', 'Dexterity');
	CALL PROC_AddAttribute('VIT', 'Vitality');
	CALL PROC_AddAttribute('INT', 'Intelligence');
	
	/*******************************************/
	/***          Class Stats/Attr           ***/
	/*******************************************/
	
	-- Class Stats
	CALL PROC_AddClassStat('HEALTH', 'SLDR', '25', '5');
	
	-- Class Attributes
	CALL PROC_AddClassAttribute('SLDR', 'STR', '20');
	
	-- Class Stats/Attributes
	CALL PROC_AddClassAttributeStatsValues('HEALTH', 'SLDR', 'VIT', 0.0, 3.0);
	
	/*******************************************/
	/***               ITEMS                 ***/
	/*******************************************/
	
	-- Item Functions 
	CALL PROC_AddItemFunction('RING', 'Ring');
	CALL PROC_AddItemFunction('NECK', 'Necklace');
	CALL PROC_AddItemFunction('GLOV', 'Gloves');
	CALL PROC_AddItemFunction('BOOT', 'Boots');
	CALL PROC_AddItemFunction('BELT', 'Belt');
	CALL PROC_AddItemFunction('CHES', 'Chestplate');
	CALL PROC_AddItemFunction('HELM', 'Helmet');
	CALL PROC_AddItemFunction('SHIE', 'Shield');
	CALL PROC_AddItemFunction('1HAN', 'One Handed Weapon');
	CALL PROC_AddItemFunction('2HAN', 'Two Handed Weapon');
	CALL PROC_AddItemFunction('BOWS', 'Bow'); -- Would include crossbows
	CALL PROC_AddItemFunction('ARRO', 'Arrow'); -- Would include bolts
	
	-- Item Slots
	CALL PROC_AddItemSlot('LFIN', 'Left Finger');
	CALL PROC_AddItemSlot('RFIN', 'Right Finger');
  CALL PROC_AddItemSlot('FING', 'Finger');
	CALL PROC_AddItemSlot('NECK', 'Neck');
	CALL PROC_AddItemSlot('CHES', 'Chest');
	CALL PROC_AddItemSlot('HAND', 'Hands');
	CALL PROC_AddItemSlot('FEET', 'Feet');
	CALL PROC_AddItemSlot('MHAN', 'Main Hand');
	CALL PROC_AddItemSlot('OHAN', 'Off Hand');
	CALL PROC_AddItemSlot('WAIS', 'Waist');
	CALL PROC_AddItemSlot('HEAD', 'Head');
	
	-- Tie Item Slots and Functions
	CALL PROC_LinkItemSlotFunction('FING', 'RING');
	CALL PROC_LinkItemSlotFunction('NECK', 'NECK');
	CALL PROC_LinkItemSlotFunction('CHES', 'CHES');
	CALL PROC_LinkItemSlotFunction('HAND', 'GLOV');
	CALL PROC_LinkItemSlotFunction('FEET', 'BOOT');
	CALL PROC_LinkItemSlotFunction('MHAN', '1HAN');
	CALL PROC_LinkItemSlotFunction('MHAN', '2HAN');
	CALL PROC_LinkItemSlotFunction('MHAN', 'BOWS');
	CALL PROC_LinkItemSlotFunction('OHAN', 'SHIE');
	CALL PROC_LinkItemSlotFunction('OHAN', 'ARRO');
	CALL PROC_LinkItemSlotFunction('WAIS', 'BELT');
	CALL PROC_LinkItemSlotFunction('HEAD', 'HELM');
	
	-- Item Sizes
	CALL PROC_AddItemSize('XSML', 'Extra Small'); -- Potions, etc. 1x1 in D2
	CALL PROC_AddItemSize('VSML', 'Vertical Small'); -- Daggers, etc. 1x2 in D2
	CALL PROC_AddItemSize('HSML', 'Horizontal Small'); -- Belts, etc. 2x1 in D2
	CALL PROC_AddItemSize('SMED', 'Standard Medium'); -- Small shields, Helmets, etc. 2x2 in D2
	CALL PROC_AddItemSize('VMED', 'Vertical Medium'); -- 1 Handed weapons, arrows etc. 1x3 in D2
	CALL PROC_AddItemSize('SLAR', 'Standard Large'); -- ChestPlates, Medium shields, etc. 2x3 in D2
	CALL PROC_AddItemSize('VLAR', 'Vertical Large'); -- 2 Handed swords, etc. 1x4 in D2
	CALL PROC_AddItemSize('XLAR', 'Extra Large'); -- 2 Handed weapons (including some swords) and large shields. 2x4 in D2
	
	-- Item Types
	CALL PROC_AddItemType('SHORT_1H_SWORD', 'Short One Handed Sword', 'VMED', '1HAN');
  CALL PROC_AddItemType('BONE_SWORD', 'Bone Sword', 'VMED', '1HAN');
  CALL PROC_AddItemType('KOPIS', 'Kopis', 'VMED', '1HAN');
	CALL PROC_AddItemType('DAGGER', 'Dagger', 'VSML', '1HAN');
	CALL PROC_AddITemType('GREAT_STAFF', 'Great Staff', 'XLAR', '2HAN');

	CALL PROC_AddItemType('SML_SHIELD', 'Small Shield', 'SMED', 'SHIE');

  CALL PROC_AddItemType('CHAINMAIL_HELM', 'Chainmail Helm', 'SMED', 'HELM');
  CALL PROC_AddItemType('KNIGHT_HELM', 'Knight Helmet', 'SMED', 'HELM');
  CALL PROC_AddItemType('LEATHER_HELM', 'Leather Helmet', 'SMED', 'HELM');

	CALL PROC_AddItemType('LEATHER_CHEST', 'Leather Chestplate', 'SLAR', 'CHES');
  CALL PROC_AddItemType('CHAINMAIL_CHEST', 'Chaimmail Chestplate', 'SLAR', 'CHES');

	CALL PROC_AddItemType('LEATHER_GLOVES', 'Leather Gloves', 'SMED', 'GLOV');
  CALL PROC_AddItemType('CHAINMAIL_GLOVES', 'Chainmail Gloves', 'SMED', 'GLOV');

  CALL PROC_AddItemType('LEATHER_BOOTS', 'Leather Boots', 'SMED', 'BOOT');
	CALL PROC_AddItemType('HIDE_BOOTS', 'Hide Boots', 'SMED', 'BOOT');
  CALL PROC_AddItemType('CHAINMAIL_BOOTS', 'Chainmail Boots', 'SMED', 'BOOT');

  CALL PROC_AddItemType('LEATHER_BELT', 'Leather Belt', 'HSML', 'BELT');
	CALL PROC_AddItemType('HEAVY_BELT', 'Heavy Belt', 'HSML', 'BELT');
  CALL PROC_AddItemType('CHAINMAIL_BELT', 'Chainmail Belt', 'HSML', 'BELT');
  
	CALL PROC_AddItemType('LONG_BOW', 'Long Bow', 'XLAR', 'BOWS');
	CALL PROC_AddItemType('BODKIN_ARROW', 'Bodkin Arrows', 'VMED', 'ARRO');

	CALL PROC_AddItemType('RING', 'RING', 'XSML', 'RING');
	CALL PROC_AddItemType('NECKLACE', 'Necklace', 'XSML', 'NECK');
	
	-- Item Rarities
	CALL PROC_AddItemRarity('NOR', 'Normal');
	CALL PROC_AddItemRarity('MAG', 'Magical');
	CALL PROC_AddItemRarity('RAR', 'Rare');
	CALL PROC_AddItemRarity('SET', 'Set');
	CALL PROC_AddItemRarity('UNI', 'Unique');
	
	-- Item Qualities
	CALL PROC_AddItemQuality('NOR', 'Normal');
	CALL PROC_AddItemQuality('INF', 'Inferior');
	CALL PROC_AddItemQuality('SUP', 'Superior');
	
	-- Item Modifiers
	CALL PROC_AddItemModifier_STAT('INC_ATK_SPEED', 'Increased Attack Speed', 'ATTACK_SPEED');
  CALL PROC_AddItemModifier_STAT('INC_MOV_SPEED', 'Increased Movement Speed', 'MOV_SPEED');
  CALL PROC_AddItemModifier_STAT('INC_DAMAGE', 'Increased Damage', 'DAMAGE');
  CALL PROC_AddItemModifier_STAT('INC_DAMAGE_MAGIC', 'Increased magic damage', 'DAMAGE_MAGIC');
	CALL PROC_AddItemModifier_STAT('MIN_FLAT_DAMAGE_FIRE', 'Minimum Fire Damage', 'MIN_DAMAGE_FIRE');
	CALL PROC_AddItemModifier_STAT('MIN_FLAT_DAMAGE_COLD', 'Minimum Cold Damage', 'MIN_DAMAGE_COLD');
	CALL PROC_AddItemModifier_STAT('MIN_FLAT_DAMAGE_LIGHT', 'Minimum LIghtning Damage', 'MIN_DAMAGE_LIGHT');
	CALL PROC_AddItemModifier_STAT('MAX_FLAT_DAMAGE_FIRE', 'Maximum Fire Damage', 'MAX_DAMAGE_FIRE');
	CALL PROC_AddItemModifier_STAT('MAX_FLAT_DAMAGE_COLD', 'Maximum Cold Damage', 'MAX_DAMAGE_COLD');
	CALL PROC_AddItemModifier_STAT('MAX_FLAT_DAMAGE_LIGHT', 'Maximum LIghtning Damage', 'MAX_DAMAGE_LIGHT');
	
	-- Item Stats
	CALL PROC_AddItemStat('ATK_SPEED_MOD', 'Attack Speed Modifier');
	CALL PROC_AddItemStat('MIN_DAMAGE', 'Minimum Damage');
	CALL PROC_AddItemStat('MAX_DAMAGE', 'Maximum Damage');
  CALL PROC_AddItemStat('DAMAGE', 'Damage');
  CALL PROC_AddItemStat('DAMAGE_MAGIC', 'Magic Damage');
	CALL PROC_AddItemStat('MAX_SOCKETS', 'Maximum Sockets');
  CALL PROC_AddItemStat('DEFENSE', 'Defense');
  CALL PROC_AddItemStat('MOV_SPEED_MOD', 'Movement Speed Modifier');
	
	-- Items - Normal
	CALL PROC_AddItem('Bone Sword', 'NOR', 'NOR', 'BONE_SWORD', 'NONE');
  CALL PROC_AddItem('Golden Kopis', 'NOR', 'NOR', 'KOPIS', 'NONE');
  CALL PROC_AddItem('Dagger', 'NOR', 'NOR', 'DAGGER', 'NONE');

  CALL PROC_AddItem('Talisman of Baphomet', 'NOR', 'NOR', 'NECKLACE', 'NONE');
  CALL PROC_AddItem('Temple Amulet', 'NOR', 'NOR', 'NECKLACE', 'NONE');
  CALL PROC_AddItem('Bronze Ring', 'NOR', 'NOR', 'RING', 'NONE');
  CALL PROC_AddItem('Silver Ring', 'NOR', 'NOR', 'RING', 'NONE');
  CALL PROC_AddItem('Gold Ring', 'NOR', 'NOR', 'RING', 'NONE');

  CALL PROC_AddItem('Leather Armor', 'NOR', 'NOR', 'LEATHER_CHEST', 'NONE');
  CALL PROC_AddItem('Chainmail Armor', 'NOR', 'NOR', 'CHAINMAIL_CHEST', 'NONE');

  CALL PROC_AddItem('Chainmail Belt', 'NOR', 'NOR', 'CHAINMAIL_BELT', 'NONE');
  CALL PROC_AddItem('Leather Belt', 'NOR', 'NOR', 'LEATHER_BELT', 'NONE');

  CALL PROC_AddItem('Leather Boots', 'NOR', 'NOR', 'LEATHER_BOOTS', 'NONE');
	CALL PROC_AddItem('Chainmail Boots', 'NOR', 'NOR', 'CHAINMAIL_BOOTS', 'NONE');

  CALL PROC_AddItem('Leather Gloves', 'NOR', 'NOR', 'LEATHER_GLOVES', 'NONE');
  CALL PROC_AddItem('Chainmail Gloves', 'NOR', 'NOR', 'CHAINMAIL_GLOVES', 'NONE');

  CALL PROC_AddItem('Leather Hood', 'NOR', 'NOR', 'LEATHER_HELM', 'NONE');
  CALL PROC_AddItem('Chainmail Hood', 'NOR', 'NOR', 'CHAINMAIL_HELM', 'NONE');
  CALL PROC_AddItem('Knight Helmet', 'NOR', 'NOR', 'KNIGHT_HELM', 'NONE');

  CALL PROC_AddItem('Wooden Shield', 'NOR', 'NOR', 'SML_SHIELD', 'NONE');
	
	CALL PROC_AddItem('Long Bow', 'NOR', 'NOR', 'LONG_BOW', 'NONE');
	
	-- Items - Magical
  CALL PROC_AddItem('Lethal Dagger', 'NOR', 'MAG', 'DAGGER', 'NONE');
	-- Items - Rare
	-- Items - Set
	-- Items - Unique
  CALL PROC_AddItem('The Throngler', 'NOR', 'UNI', 'KOPIS', 'NONE');
	
	-- Assign Stats to Items
	CALL PROC_AddItemBaseStat('BONE_SWORD', 'ATK_SPEED_MOD', 20.0);
  CALL PROC_AddItemBaseStat('BONE_SWORD', 'DAMAGE', 10.0);

  CALL PROC_AddItemBaseStat('KOPIS', 'ATK_SPEED_MOD', 20.0);
  CALL PROC_AddItemBaseStat('KOPIS', 'DAMAGE', 5.0);
  CALL PROC_AddItemBaseStat('KOPIS', 'DAMAGE_MAGIC', 15.0);

  CALL PROC_AddItemBaseStat('DAGGER', 'ATK_SPEED_MOD', 40.0);
  CALL PROC_AddItemBaseStat('DAGGER', 'DAMAGE', 5.0);

  CALL PROC_AddItemBaseStat('NECKLACE', 'DAMAGE', 5.0);

  CALL PROC_AddItemBaseStat('RING', 'DAMAGE_MAGIC', 5.0);

  CALL PROC_AddItemBaseStat('LEATHER_CHEST', 'DEFENSE', 15.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_CHEST', 'DEFENSE', 40.0);
  
  CALL PROC_AddItemBaseStat('LEATHER_BELT', 'DEFENSE', 5.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_BELT', 'DEFENSE', 10.0);

  CALL PROC_AddItemBaseStat('LEATHER_BOOTS', 'DEFENSE', 8.0);
  CALL PROC_AddItemBaseStat('LEATHER_BOOTS', 'MOV_SPEED_MOD', 40.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_BOOTS', 'DEFENSE', 15.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_BOOTS', 'MOV_SPEED_MOD', 30.0);

  CALL PROC_AddItemBaseStat('LEATHER_GLOVES', 'DEFENSE', 8.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_GLOVES', 'DEFENSE', 15.0);

  CALL PROC_AddItemBaseStat('LEATHER_HELM', 'DEFENSE', 10.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_HELM', 'DEFENSE', 20.0);
  CALL PROC_AddItemBaseStat('KNIGHT_HELM', 'DEFENSE', 30.0);

  CALL PROC_AddItemBaseStat('SML_SHIELD', 'DEFENSE', 30.0);

  -- Assign modifiers to Items
  CALL PROC_AddModifierToItem(4, 'INC_DAMAGE', 10.0);
  CALL PROC_AddModifierToItem(22, 'INC_DAMAGE', 5.0);
  CALL PROC_AddModifierToItem(23, 'INC_DAMAGE', 15.0);
  CALL PROC_AddModifierToItem(23, 'INC_MOV_SPEED', 20.0);
  CALL PROC_AddModifierToItem(23, 'INC_DAMAGE_MAGIC', 20.0);

  /*******************************************/
	/***             MONSTERS                ***/
	/*******************************************/

  -- Base Monsters
  CALL PROC_AddBaseMonster('GOBLIN','Goblin');
  CALL PROC_AddBaseMonster('GOBLIN_LUMBERJACK_BLACK','Goblin Lumberjack');
  CALL PROC_AddBaseMonster('WYVERN_COMPOSITE','Wyvern Composite');
  CALL PROC_AddBaseMonster('ZOMBIE','Zombie');
  CALL PROC_AddBaseMonster('SKELETON','Skeleton');
  CALL PROC_AddBaseMonster('MINOTAUR','Minotaur');

  -- Monster Qualities
  CALL PROC_AddMonsterQuality('NOR', 'Normal');
  CALL PROC_AddMonsterQuality('ELI', 'Elite');
  CALL PROC_AddMonsterQuality('RAR', 'Rare');
  CALL PROC_AddMonsterQuality('UNI', 'Unique');
  CALL PROC_AddMonsterQuality('SUN', 'Super Unique');
  CALL PROC_AddMonsterQuality('BOS', 'Boss');

  -- Monster Behaviors
  CALL PROC_AddMonsterBehavior('RUSHER', 'Rusher');
  CALL PROC_AddMonsterBehavior('SKIRMISHER', 'Skirmisher');

  -- Monsters
  CALL PROC_AddMonster('GOBLIN','Goblin', 250, 25, 'SKIRMISHER', 'GOBLIN', 'NOR');
  CALL PROC_AddMonster('GOBLIN_LUMBERJACK_BLACK','Goblin Lumberjack', 500, 50, 'RUSHER',  'GOBLIN_LUMBERJACK_BLACK', 'NOR');
  CALL PROC_AddMonster('WYVERN_COMPOSITE','Wyvern Composite', 2500, 250, 'SKIRMISHER', 'WYVERN_COMPOSITE', 'NOR');
  CALL PROC_AddMonster('ZOMBIE','Zombie', 200, 20, 'RUSHER',  'ZOMBIE', 'NOR');
  CALL PROC_AddMonster('SKELETON','Skeleton', 300, 30, 'RUSHER', 'SKELETON', 'NOR');
  CALL PROC_AddMonster('MINOTAUR','Minotaur', 3000, 300, 'RUSHER', 'MINOTAUR', 'NOR');

  -- Monsters - Super Uniques
  CALL PROC_AddMonster('GAETAN','Gaetan', 1000, 100, 'RUSHER', 'GOBLIN_LUMBERJACK_BLACK', 'SUN');
  CALL PROC_AddMonster('ZACHARY','Zachary', 600, 60, 'RUSHER', 'ZOMBIE', 'SUN');
  CALL PROC_AddMonster('JACKSON','Jackson', 750, 75, 'RUSHER', 'SKELETON', 'SUN');
  CALL PROC_AddMonster('COMPOSITE_BOBBY','Bobby le composite', 6000, 600, 'SKIRMISHER', 'WYVERN_COMPOSITE', 'SUN');
  CALL PROC_AddMonster('TAUROS','Tauros', 7500, 750, 'RUSHER', 'MINOTAUR', 'SUN');

  -- Monster Stats
  CALL PROC_AddMonsterBaseStats('HEALTH', 'GOBLIN', 60, 6);
  CALL PROC_AddMonsterBaseStats('MANA', 'GOBLIN', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'GOBLIN', 125, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'GOBLIN', 8, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'GOBLIN', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'GOBLIN', 10, 1);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'GOBLIN', 10, 1);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'GOBLIN', 500, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'GOBLIN_LUMBERJACK_BLACK', 120, 12);
  CALL PROC_AddMonsterBaseStats('MANA', 'GOBLIN_LUMBERJACK_BLACK', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'GOBLIN_LUMBERJACK_BLACK', 160, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'GOBLIN_LUMBERJACK_BLACK', 24, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'GOBLIN_LUMBERJACK_BLACK', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'GOBLIN_LUMBERJACK_BLACK', 15, 1.5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'GOBLIN_LUMBERJACK_BLACK', 20, 2);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'GOBLIN_LUMBERJACK_BLACK', 700, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'WYVERN_COMPOSITE', 250, 25);
  CALL PROC_AddMonsterBaseStats('MANA', 'WYVERN_COMPOSITE', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'WYVERN_COMPOSITE', 150, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'WYVERN_COMPOSITE', 6, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'WYVERN_COMPOSITE', 125, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'WYVERN_COMPOSITE', 50, 5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'WYVERN_COMPOSITE', 50, 5);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'WYVERN_COMPOSITE', 750, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'ZOMBIE', 150, 15);
  CALL PROC_AddMonsterBaseStats('MANA', 'ZOMBIE', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'ZOMBIE', 75, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'ZOMBIE', 6, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'ZOMBIE', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'ZOMBIE', 10, 1);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'ZOMBIE', 0, 0);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'ZOMBIE', 400, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'SKELETON', 100, 10);
  CALL PROC_AddMonsterBaseStats('MANA', 'SKELETON', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'SKELETON', 100, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'SKELETON', 8, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'SKELETON', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'SKELETON', 15, 1.5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'SKELETON', 20, 2);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'SKELETON', 500, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'MINOTAUR', 400, 40);
  CALL PROC_AddMonsterBaseStats('MANA', 'MINOTAUR', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'MINOTAUR', 150, 1);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'MINOTAUR', 10, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'MINOTAUR', 125, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'MINOTAUR', 35, 3.5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'MINOTAUR', 50, 5);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'MINOTAUR', 800, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'GAETAN', 200, 20);
  CALL PROC_AddMonsterBaseStats('MANA', 'GAETAN', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'GAETAN', 200, 5);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'GAETAN', 32, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'GAETAN', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'GAETAN', 15, 1.5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'GAETAN', 30, 3);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'GAETAN', 1000, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'ZACHARY', 400, 40);
  CALL PROC_AddMonsterBaseStats('MANA', 'ZACHARY', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'ZACHARY', 75, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'ZACHARY', 6, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'ZACHARY', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'ZACHARY', 10, 1);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'ZACHARY', 0, 0);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'ZACHARY', 500, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'JACKSON', 300, 30);
  CALL PROC_AddMonsterBaseStats('MANA', 'JACKSON', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'JACKSON', 120, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'JACKSON', 15, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'JACKSON', 100, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'JACKSON', 35, 3.5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'JACKSON', 40, 4);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'JACKSON', 1000, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'COMPOSITE_BOBBY', 1000, 100);
  CALL PROC_AddMonsterBaseStats('MANA', 'COMPOSITE_BOBBY', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'COMPOSITE_BOBBY', 140, 0);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'COMPOSITE_BOBBY', 8, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'COMPOSITE_BOBBY', 125, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'COMPOSITE_BOBBY', 70, 7);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'COMPOSITE_BOBBY', 100, 10);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'COMPOSITE_BOBBY', 1000, 0);

  CALL PROC_AddMonsterBaseStats('HEALTH', 'TAUROS', 1000, 100);
  CALL PROC_AddMonsterBaseStats('MANA', 'TAUROS', 10000, 10);
  CALL PROC_AddMonsterBaseStats('MOV_SPEED', 'TAUROS', 225, 5);
  CALL PROC_AddMonsterBaseStats('ATTACK_SPEED', 'TAUROS', 16, 0);
  CALL PROC_AddMonsterBaseStats('MELEE_RANGE', 'TAUROS', 125, 0);
  CALL PROC_AddMonsterBaseStats('DAMAGE', 'TAUROS', 50, 5);
  CALL PROC_AddMonsterBaseStats('DEFENSE', 'TAUROS', 80, 8);
  CALL PROC_AddMonsterBaseStats('SIGHT_DISTANCE', 'TAUROS', 1000, 0);

  -- Monster Modifiers
  CALL PROC_AddMonsterModifier('EXTRA_STRONG', 'Extra Strong');
  CALL PROC_AddMonsterModifier('EXTRA_FAST', 'Extra Fast');
  CALL PROC_AddMonsterModifier('EXTRA_DURABLE', 'Extra Durable');

  -- Add Modifiers to Monsters (FOR INFO ONLY)
  CALL PROC_AddModifierToMonster('GAETAN','EXTRA_FAST');
  CALL PROC_AddModifierToMonster('GAETAN','EXTRA_DURABLE');

  CALL PROC_AddModifierToMonster('JACKSON','EXTRA_STRONG');
  CALL PROC_AddModifierToMonster('JACKSON','EXTRA_DURABLE');

  CALL PROC_AddModifierToMonster('ZACHARY','EXTRA_DURABLE');

  CALL PROC_AddModifierToMonster('COMPOSITE_BOBBY','EXTRA_STRONG');
  CALL PROC_AddModifierToMonster('COMPOSITE_BOBBY','EXTRA_DURABLE');

  CALL PROC_AddModifierToMonster('TAUROS','EXTRA_STRONG');
  CALL PROC_AddModifierToMonster('TAUROS','EXTRA_FAST');
  CALL PROC_AddModifierToMonster('TAUROS','EXTRA_DURABLE');
END;
$$;

/******************************************/
/***             FUNCTIONS              ***/
/******************************************/

-- Saves
CREATE OR REPLACE FUNCTION FUNC_GetSavesByUsername(user_name VARCHAR(50))
RETURNS TABLE
(
	savePath VARCHAR(100)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	Player.savePath
    FROM Player
    WHERE Player.username = user_name;
END;
$$;

-- Items
CREATE OR REPLACE FUNCTION FUNC_GetAllItemsCore()
RETURNS TABLE
(
	id INTEGER, 
	name VARCHAR(50), 
	qualityCode VARCHAR(25), 
	rarityCode VARCHAR(25),
	typeCode VARCHAR(25),
  	slotCode VARCHAR(25),
	reservedClassCode VARCHAR(25),
	sizeCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	item.itemid, 
			item.itemname, 
			itemQuality.itemQualityCode, 
			itemRarity.itemRarityCode,
			itemType.itemTypeCode,
      		itemTypeItemSlot.itemSlotcode,
			class.classCode AS reservedClassCode,
			itemType.itemSizeCode
    FROM item
		INNER JOIN itemQuality ON itemQuality.itemQualityCode = item.itemQualityCode
		INNER JOIN itemRarity ON itemRarity.itemRarityCode = item.itemRarityCode
		INNER JOIN itemType ON itemType.itemTypeCode = item.itemTypeCode
		INNER JOIN itemFunction ON itemFunction.itemFunctionCode = itemType.itemFunctionCode
    	INNER JOIN itemTypeItemSlot ON itemTypeItemSlot.itemFunctionCode = itemFunction.itemFunctionCode
		LEFT JOIN class ON class.classCode = item.classCode;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetItemCore(item_Id INTEGER)
RETURNS TABLE
(
	id INTEGER, 
	name VARCHAR(50), 
	qualityCode VARCHAR(25), 
	rarityCode VARCHAR(25),
	typeCode VARCHAR(25),
	reservedClassCode VARCHAR(25),
	sizeCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	item.itemid, 
			item.itemname, 
			itemQuality.itemQualityCode, 
			itemRarity.itemRarityCode,
			itemType.itemTypeCode,
			class.classCode AS reservedClassCode,
			itemType.itemSizeCode
    FROM item
		INNER JOIN itemQuality ON itemQuality.itemQualityCode = item.itemQualityCode
		INNER JOIN itemRarity ON itemRarity.itemRarityCode = item.itemRarityCode
		INNER JOIN itemType ON itemType.itemTypeCode = item.itemTypeCode
		LEFT JOIN class ON class.classCode = item.classCode
    WHERE item.itemId = item_Id;
END;
$$;



CREATE OR REPLACE FUNCTION FUNC_GetItemModifiers(item_Id INTEGER)
RETURNS TABLE
(
	modifierCode VARCHAR(25),
	modifierValue NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	itemItemModifier.itemModifierCode,
			itemItemModifier.modifierValue
    FROM itemItemModifier
    WHERE itemItemModifier.itemId = item_Id;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetItemStats(itemType_Code VARCHAR(25))
RETURNS TABLE
(
	statCode VARCHAR(25),
	value NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	itemBaseStats.itemStatCode,
			itemBaseStats.statValue
    FROM itemBaseStats
    WHERE itemBaseStats.itemTypeCode = itemType_Code;
END;
$$;

-- Monsters
CREATE OR REPLACE FUNCTION FUNC_GetAllMonsters()
RETURNS TABLE
(
	code VARCHAR(25),
	baseCode VARCHAR(25),
	name VARCHAR(50), 
  baseExp INTEGER,
  perLvlExp INTEGER,
	baseName VARCHAR(50),
  behaviorCode VARCHAR(25),
	qualityCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	Monster.monsterCode,
			BaseMonster.baseMonsterCode,
			Monster.monsterName,
      Monster.baseExp,
      Monster.perLvlExp,
			BaseMonster.baseMonsterName, 
      Monster.monsterBehaviorCode,
			Monster.monsterQualityCode
    FROM Monster
		INNER JOIN BaseMonster ON BaseMonster.baseMonsterCode = Monster.baseMonsterCode;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetMonsterModifiers(monster_Code VARCHAR(25))
RETURNS TABLE
(
	modifierCode VARCHAR(25),
	modifierName VARCHAR(50)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	monsterMonsterModifier.monsterModifierCode,
			      MonsterModifier.monsterModifierName
    FROM monsterMonsterModifier
      INNER JOIN MonsterModifier ON MonsterModifier.monsterModifierCode = monsterMonsterModifier.monsterModifierCode
    WHERE monsterMonsterModifier.monsterCode = monster_Code;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetMonsterStats(monster_Code VARCHAR(25))
RETURNS TABLE
(
	statCode VARCHAR(25),
	baseValue NUMERIC(15,2),
  perLvlValue NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	monsterBaseStats.statCode,
			      monsterBaseStats.baseValue,
            monsterBaseStats.perLvlValue
    FROM monsterBaseStats
    WHERE monsterBaseStats.monsterCode = monster_Code;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetMonsterSkills(baseMonster_Code VARCHAR(25))
RETURNS TABLE
(
	skillCode VARCHAR(25),
	level INTEGER
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	baseMonsterSkill.skillCode,
			baseMonsterSkill.level
    FROM baseMonsterSkill
    WHERE baseMonsterSkill.baseMonsterCode = baseMonster_Code;
END;
$$;

-- Skills
CREATE OR REPLACE FUNCTION FUNC_GetAllSkills()
RETURNS TABLE
(
	skillCode VARCHAR(25),
	skillName VARCHAR(50),
  range_m INTEGER,
  castTime_s NUMERIC(15,2),
  baseCooldown_s NUMERIC(15,2),
  perLevelCooldownModifier NUMERIC(15,2),
  baseManaCost NUMERIC(15,2),
  perLvlManaCostFactor NUMERIC(15,2),
  perLvlManaCostModifier NUMERIC(15,2),
  perLevelCooldownFactor NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	Skill.skillCode,
			      Skill.skillName,
            Skill.range_m,
            Skill.castTime_s,
            Skill.baseCooldown_s,
            Skill.perLevelCooldownModifier,
            Skill.baseManaCost,
            Skill.perLvlManaCostFactor,
            Skill.perLvlManaCostModifier,
            Skill.perLevelCooldownFactor
    FROM Skill;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetSkillDamages(skill_Code VARCHAR(25))
RETURNS TABLE
(
	skillDamageCode VARCHAR(25),
	baseScaling_pct NUMERIC(15,2),
  baseDamage NUMERIC(15,2),
  perLvlDamageModifier NUMERIC(15,2),
  perLvlDamageFactor NUMERIC(15,2),
  perLvlScalingModifier NUMERIC(15,2),
  perLvlScalingFactor NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	SkillDamage.skillDamageCode,
			      SkillDamage.baseScaling_pct,
            SkillDamage.baseDamage,
            SkillDamage.perLvlDamageModifier,
            SkillDamage.perLvlDamageFactor,
            SkillDamage.perLvlScalingModifier,
            SkillDamage.perLvlScalingFactor
    FROM SkillSkillDamage
      INNER JOIN SkillDamage ON SkillDamage.skillDamageCode = SkillSkillDamage.skillDamageCode
    WHERE SkillSkillDamage.skillCode = skill_Code;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetSkillActiveEffects(skill_Code VARCHAR(25))
RETURNS TABLE
(
	activeEffect_Code VARCHAR(25),
	baseValue NUMERIC(15,2),
  perLvlValueModifier NUMERIC(15,2),
  perLvlValueFactor NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	ActiveEffect.activeEffect_Code,
			      ActiveEffect.baseValue,
            ActiveEffect.perLvlValueModifier,
            ActiveEffect.perLvlValueFactor
    FROM SkillActiveEffect
      INNER JOIN ActiveEffect ON ActiveEffect.activeEffectCode = SkillActiveEffect.activeEffectCode
    WHERE SkillActiveEffect.skillCode = skill_Code;
END;
$$;

/******************************************/
/***           DATA INSERTION           ***/
/******************************************/
CALL PROC_InsertData();