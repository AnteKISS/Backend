-- Script : init.sql

/******************************************/
/***        DATABASE STRUCTURE          ***/
/******************************************/
\include Creation/CreateTables.sql;

/******************************************/
/***        STORED PROCEDURES           ***/
/******************************************/

-- Character/Stats
\include Stored_Procs/Base/PROC_AddAttribute.sql
\include Stored_Procs/Base/PROC_AddClass.sql
\include Stored_Procs/Base/PROC_AddClassAttribute.sql
\include Stored_Procs/Base/PROC_AddClassStat.sql
\include Stored_Procs/Base/PROC_AddStat.sql

-- Items
\include Stored_Procs/Item/PROC_AddItem.sql
\include Stored_Procs/Item/PROC_AddItemBaseStats.sql
\include Stored_Procs/Item/PROC_AddItemFunction.sql
\include Stored_Procs/Item/PROC_AddItemModifier_ATTR.sql
\include Stored_Procs/Item/PROC_AddItemModifier_STAT.sql
\include Stored_Procs/Item/PROC_AddItemQuality.sql
\include Stored_Procs/Item/PROC_AddItemRarity.sql
\include Stored_Procs/Item/PROC_AddItemSize.sql
\include Stored_Procs/Item/PROC_AddItemSlot.sql
\include Stored_Procs/Item/PROC_AddItemStat.sql
\include Stored_Procs/Item/PROC_AddItemType.sql
\include Stored_Procs/Item/PROC_LinkItemSlotFunction.sql

-- Monsters
\include Stored_Procs/Monster/PROC_AddMonster.sql
\include Stored_Procs/Monster/PROC_AddBaseMonster.sql
\include Stored_Procs/Monster/PROC_AddMonsterBaseStats.sql
\include Stored_Procs/Monster/PROC_AddModifierToMonster.sql
\include Stored_Procs/Monster/PROC_AddMonsterModifier.sql
\include Stored_Procs/Monster/PROC_AddLinkModifierStat.sql

-- Data Insertion
\include Stored_Procs/PROC_InsertItems.sql

/******************************************/
/***             FUNCTIONS              ***/
/******************************************/

-- Items
\include Functions/FUNC_GetAllItemsCore.sql
\include Functions/FUNC_GetItemCore.sql
\include Functions/FUNC_GetItemModifiers.sql
\include Functions/FUNC_GetItemStats.sql

-- Monsters
\include Functions/FUNC_GetAllMonsters.sql
\include Functions/FUNC_GetMonsterModifiers.sql
\include Functions/FUNC_GetMonsterSkills.sql

/******************************************/
/***           DATA INSERTION           ***/
/******************************************/
\include Creation/InsertData.sql