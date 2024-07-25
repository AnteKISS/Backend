-- Script : init.sql

-- USAGE : \i '{PATH_TO_FILE}/init.sql'

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
   baseMonsterId SERIAL,
   baseMonsterName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(baseMonsterId),
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
   monsterId SERIAL,
   monsterName VARCHAR(50)  NOT NULL,
   baseMonsterId INTEGER NOT NULL,
   monsterQualityCode VARCHAR(25)  NOT NULL,
   PRIMARY KEY(monsterId),
   UNIQUE(monsterName),
   FOREIGN KEY(baseMonsterId) REFERENCES BaseMonster(baseMonsterId),
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
   monsterId INTEGER,
   statValue NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(statCode, monsterId),
   FOREIGN KEY(statCode) REFERENCES Stats(statCode),
   FOREIGN KEY(monsterId) REFERENCES Monster(monsterId)
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
   monsterId INTEGER,
   monsterModifierCode VARCHAR(25) ,
   PRIMARY KEY(monsterId, monsterModifierCode),
   FOREIGN KEY(monsterId) REFERENCES Monster(monsterId),
   FOREIGN KEY(monsterModifierCode) REFERENCES MonsterModifier(monsterModifierCode)
);

CREATE TABLE BaseMonsterSkill(
   skillCode VARCHAR(25) ,
   baseMonsterId INTEGER,
   level INTEGER NOT NULL,
   PRIMARY KEY(skillCode, baseMonsterId),
   FOREIGN KEY(skillCode) REFERENCES Skill(skillCode),
   FOREIGN KEY(baseMonsterId) REFERENCES BaseMonster(baseMonsterId)
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
	monster_Name VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonster(baseMonsterName)
	VALUES			       (monster_Name);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddBaseMonsterSkill
(
	skill_Code VARCHAR(25),
	baseMonster_Id INT,
	skill_Level INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO BaseMonsterSkill(skillCode, baseMonsterId, level)
	VALUES			            (skill_Code, baseMonster_Id, skill_Level);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddModifierToMonster
(
	monster_Id INT,
	monsterModifier_Code VARCHAR(25),
	modifier_Value VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterMonsterModifier(monsterId, monsterModifierCode, modifierValue)
	VALUES			                  (monster_Id, monsterModifier_Code, modifier_Value);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonster
(
	monster_Name VARCHAR(50),
	baseMonster_Id NUMERIC,
	monsterQuality_Code VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Monster(monsterName,  baseMonsterId,  monsterQualityCode)
	VALUES			   (monster_Name, baseMonster_Id, monsterQuality_Code);
END;
$$;

CREATE OR REPLACE PROCEDURE PROC_AddMonsterBaseStats
(
	stat_Code VARCHAR(25),
	monster_Id INT,
	stat_Value NUMERIC(15,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO MonsterModifierBaseStat(statCode, monsterId, statValue)
	VALUES			                   (stat_Code, monster_Id, stat_Value);
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

-- Data Insertion
CREATE OR REPLACE PROCEDURE PROC_InsertItems
(
	
)
LANGUAGE plpgsql
AS $$
BEGIN
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
	CALL PROC_AddStat('CRITICAL_RATE', 'Critical Rate');
	CALL PROC_AddStat('DAMAGE', 'Damage');
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
	CALL PROC_AddItemStat('MAX_SOCKETS', 'Maximum Sockets');
  CALL PROC_AddItemStat('DEFENSE', 'Defense');
  CALL PROC_AddItemStat('MOV_SPEED_MOD', 'Movement Speed Modifier');
	
	-- Items - Normal
	CALL PROC_AddItem('Bone Sword', 'NOR', 'NOR', 'SHORT_1H_SWORD', 'NONE');
  CALL PROC_AddItem('Golden Kopis', 'NOR', 'NOR', 'SHORT_1H_SWORD', 'NONE');
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
	-- Items - Rare
	-- Items - Set
	-- Items - Unique
	
	-- Assign Stats to Items
	CALL PROC_AddItemBaseStat('BONE_SWORD', 'ATK_SPEED_MOD', 20.0);
  CALL PROC_AddItemBaseStat('BONE_SWORD', 'DAMAGE', 10.0);

  CALL PROC_AddItemBaseStat('KOPIS', 'ATK_SPEED_MOD', 20.0);
  CALL PROC_AddItemBaseStat('KOPIS', 'DAMAGE', 15.0);

  CALL PROC_AddItemBaseStat('DAGGER', 'ATK_SPEED_MOD', 40.0);
  CALL PROC_AddItemBaseStat('DAGGER', 'DAMAGE', 5.0);

  CALL PROC_AddItemBaseStat('NECKLACE', 'MOV_SPEED_MOD', 40.0);

  CALL PROC_AddItemBaseStat('RING', 'MOV_SPEED_MOD', 20.0);

  CALL PROC_AddItemBaseStat('LEATHER_CHEST', 'DEFENSE', 15.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_CHEST', 'DEFENSE', 40.0);
  
  CALL PROC_AddItemBaseStat('LEATHER_BELT', 'DEFENSE', 5.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_BELT', 'DEFENSE', 10.0);

  CALL PROC_AddItemBaseStat('LEATHER_BOOTS', 'DEFENSE', 8.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_BOOTS', 'DEFENSE', 15.0);

  CALL PROC_AddItemBaseStat('LEATHER_GLOVES', 'DEFENSE', 8.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_GLOVES', 'DEFENSE', 15.0);

  CALL PROC_AddItemBaseStat('LEATHER_HELM', 'DEFENSE', 10.0);
  CALL PROC_AddItemBaseStat('CHAINMAIL_HELM', 'DEFENSE', 20.0);
  CALL PROC_AddItemBaseStat('KNIGHT_HELM', 'DEFENSE', 30.0);

  CALL PROC_AddItemBaseStat('SML_SHIELD', 'DEFENSE', 30.0);
END;
$$;

/******************************************/
/***             FUNCTIONS              ***/
/******************************************/

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
	id INTEGER,
	baseId INTEGER,
	name VARCHAR(50), 
	baseName VARCHAR(50), 
	qualityCode VARCHAR(25)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	Monster.monsterId,
			BaseMonster.baseMonsterId,
			Monster.monsterName,
			BaseMonster.baseMonsterName, 
			Monster.monsterQualityCode
    FROM Monster
		INNER JOIN BaseMonster ON BaseMonster.baseMonsterId = Monster.baseMonsterId;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetMonsterModifiers(monster_Id INTEGER)
RETURNS TABLE
(
	modifierCode VARCHAR(25),
	modifierValue NUMERIC(15,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 	monsterMonsterModifier.monsterModifierCode,
			monsterMonsterModifier.modifierValue
    FROM monsterMonsterModifier
    WHERE monsterMonsterModifier.monsterId = monster_Id;
END;
$$;

CREATE OR REPLACE FUNCTION FUNC_GetMonsterSkills(baseMonster_Id INTEGER)
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
    WHERE baseMonsterSkill.baseMonsterId = baseMonster_Id;
END;
$$;

/******************************************/
/***           DATA INSERTION           ***/
/******************************************/
CALL PROC_InsertItems();