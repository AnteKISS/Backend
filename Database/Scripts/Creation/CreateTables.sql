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
   rarityName VARCHAR(50)  NOT NULL,
   PRIMARY KEY(itemRarityCode),
   UNIQUE(rarityName)
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
