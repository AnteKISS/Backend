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
	CALL PROC_AddItemSlot('NECK', 'Neck');
	CALL PROC_AddItemSlot('CHES', 'Chest');
	CALL PROC_AddItemSlot('HAND', 'Hands');
	CALL PROC_AddItemSlot('FEET', 'Feet');
	CALL PROC_AddItemSlot('MHAN', 'Main Hand');
	CALL PROC_AddItemSlot('OHAN', 'Off Hand');
	CALL PROC_AddItemSlot('WAIS', 'Waist');
	CALL PROC_AddItemSlot('HEAD', 'Head');
	
	-- Tie Item Slots and Functions
	CALL PROC_LinkItemSlotFunction('LFIN', 'RING');
	CALL PROC_LinkItemSlotFunction('RFIN', 'RING');
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
	CALL PROC_AddItemType('DAGGER', 'Dagger', 'VSML', '1HAN');
	CALL PROC_AddITemType('GREAT_STAFF', 'Great Staff', 'XLAR', '2HAN');
	CALL PROC_AddItemType('SML_SHIELD', 'Small Shield', 'SMED', 'SHIE');
	CALL PROC_AddItemType('LEATHER_CHEST', 'Leather Chestplate', 'SLAR', 'CHES');
	CALL PROC_AddItemType('LEATHER_GLOVES', 'Leather Gloves', 'SMED', 'GLOV');
	CALL PROC_AddItemType('HIDE_BOOTS', 'Hide Boots', 'SMED', 'BOOT');
	CALL PROC_AddItemType('HEAVY_BELT', 'Heavy Belt', 'HSML', 'BELT');
	CALL PROC_AddItemType('LONG_BOW', 'Long Bow', 'XLAR', 'BOWS');
	CALL PROC_AddItemType('BODKIN_ARROW', 'Bodkin Arrows', 'VMED', 'ARRO');
	CALL PROC_AddItemType('RING', 'RING', 'XSML', 'RING');
	CALL PROC_AddItemType('NECKLACE', 'Necklace', 'HSML', 'NECK');
	
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
	CALL PROC_AddItemStat('MAX_SOCKETS', 'Maximum Sockets');
	
	-- Items - Normal
	CALL PROC_AddItem('Short Sword', 'NOR', 'NOR', 'SHORT_1H_SWORD', 'NONE');
	CALL PROC_AddItem('Small Shield', 'NOR', 'NOR', 'SML_SHIELD', 'NONE');
	CALL PROC_AddItem('Leather Armor', 'NOR', 'NOR', 'LEATHER_CHEST', 'NONE');
	CALL PROC_AddItem('Dagger', 'NOR', 'NOR', 'DAGGER', 'NONE');
	CALL PROC_AddItem('Long Bow', 'NOR', 'NOR', 'LONG_BOW', 'NONE');
	
	-- Items - Magical
	-- Items - Rare
	-- Items - Set
	-- Items - Unique
	
	-- Assign Stats to Items
	CALL PROC_AddItemBaseStat('SHORT_1H_SWORD', 'ATK_SPEED_MOD', 20.0);
END;
$$;