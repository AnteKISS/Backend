-- Script : init.sql

/******************************************/
/***        DATABASE STRUCTURE          ***/
/******************************************/
\include Creation/CreateTables.sql;

/******************************************/
/***        STORED PROCEDURES           ***/
/******************************************/

-- Character/Stats
\include Stored_Procs/PROC_AddAttribute.sql
\include Stored_Procs/PROC_AddClass.sql
\include Stored_Procs/PROC_AddClassAttribute.sql
\include Stored_Procs/PROC_AddClassStat.sql
\include Stored_Procs/PROC_AddStat.sql

-- Items
\include Stored_Procs/PROC_AddItem.sql
\include Stored_Procs/PROC_AddItemBaseStats.sql
\include Stored_Procs/PROC_AddItemFunction.sql
\include Stored_Procs/PROC_AddItemModifier_ATTR.sql
\include Stored_Procs/PROC_AddItemModifier_STAT.sql
\include Stored_Procs/PROC_AddItemQuality.sql
\include Stored_Procs/PROC_AddItemRarity.sql
\include Stored_Procs/PROC_AddItemSize.sql
\include Stored_Procs/PROC_AddItemSlot.sql
\include Stored_Procs/PROC_AddItemStat.sql
\include Stored_Procs/PROC_AddItemType.sql
\include Stored_Procs/PROC_LinkItemSlotFunction.sql

-- Monsters
\include Stored_Procs/PROC_AddMonster.sql
\include Stored_Procs/PROC_AddBaseMonster.sql

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