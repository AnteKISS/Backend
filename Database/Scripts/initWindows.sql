-- Script : init.sql
DO $$
DECLARE scriptPath TEXT := 'C:/Users/pitch/OneDrive/Documents/GitHub/Backend/Database/Scripts';
/******************************************/
/***        DATABASE STRUCTURE          ***/
/******************************************/
\i scriptPath || '/Creation/CreateTables.sql'

/******************************************/
/***        STORED PROCEDURES           ***/
/******************************************/

-- Character/Stats
\i scriptPath || 'Stored_Procs/Base/PROC_AddAttribute.sql'
\i scriptPath || 'Stored_Procs/Base/PROC_AddClass.sql'
\i scriptPath || 'Stored_Procs/Base/PROC_AddClassAttribute.sql'
\i scriptPath || 'Stored_Procs/Base/PROC_AddClassStat.sql'
\i scriptPath || 'Stored_Procs/Base/PROC_AddStat.sql'

-- Items
\i scriptPath || 'Stored_Procs/Item/PROC_AddItem.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemBaseStats.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemFunction.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemModifier_ATTR.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemModifier_STAT.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemQuality.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemRarity.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemSize.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemSlot.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemStat.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_AddItemType.sql'
\i scriptPath || 'Stored_Procs/Item/PROC_LinkItemSlotFunction.sql'

-- Monsters
\i scriptPath || 'Stored_Procs/Monster/PROC_AddMonster.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddBaseMonster.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddMonsterBaseStats.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddModifierToMonster.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddMonsterModifier.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddLinkModifierStat.sql'
\i scriptPath || 'Stored_Procs/Monster/PROC_AddBaseMonsterSkill.sql'

-- Skills
\i scriptPath || 'Stored_Procs/Skill/PROC_AddSkill.sql'
\i scriptPath || 'Stored_Procs/Skill/PROC_AddSkillActiveEffect.sql'
\i scriptPath || 'Stored_Procs/Skill/PROC_AddSkillDamage.sql'
\i scriptPath || 'Stored_Procs/Skill/PROC_LinkSkillDamageStat.sql'

-- Data Insertion
\i scriptPath || 'Stored_Procs/PROC_InsertItems.sql'

/******************************************/
/***             FUNCTIONS              ***/
/******************************************/

-- Items
\i scriptPath || 'Functions/FUNC_GetAllItemsCore.sql'
\i scriptPath || 'Functions/FUNC_GetItemCore.sql'
\i scriptPath || 'Functions/FUNC_GetItemModifiers.sql'
\i scriptPath || 'Functions/FUNC_GetItemStats.sql'

-- Monsters
\i scriptPath || 'Functions/FUNC_GetAllMonsters.sql'
\i scriptPath || 'Functions/FUNC_GetMonsterModifiers.sql'
\i scriptPath || 'Functions/FUNC_GetMonsterSkills.sql'

/******************************************/
/***           DATA INSERTION           ***/
/******************************************/
CALL PROC_InsertItems();
END $$;