USING ProjetS3;

INSERT INTO Class(classCode, name)
VALUES	('BAR', 'Barbarian'),
		('WIZ', 'Wizard');

INSERT INTO Attributes(attributeCode, name)
VALUES	('STR', 'Strength'),
		('DEX', 'Dexterity'),
		('CON', 'Constitution'),
		('INT', 'Intelligence');

INSERT INTO Stats(statCode, name)
VALUES	('HEA_PTS', 'Health Points'),
		('MAN_PTS', 'Mana Points'),
		('ATK_SPD', 'Attack Speed'),
		('ATK_RAT', 'Attack Rating'),
		('HIT_REC', 'Hit Recovery'),
		('CAS_SPD', 'Cast Speed'),
		('MOV_SPD', 'Movement Speed'),
		('BAS_DMG', 'Base Damage'),
		('AUG_DMG', 'Flat Damage Modifier'),
		('PCT_DMG', 'Percentage Damage Factor'),
		('WEA_DMG', 'Weapon Damage'),
		('WEA_PCT', 'Weapon Damage Factor'),
		('WEA_AUG', 'Weapon Damage Modifier');
		
INSERT INTO SkillType(skillTypeCode, name)
VALUES 	('PROJ_STAND', 'Projectile'),
		('PROJ_PIERC', 'Piercing Projectile')
		

INSERT INTO Skill(skillCode, name, range_m, castTime_s, baseCooldown_s, perLevelCooldownModifier, perLevelCooldownFactor, baseManaCost, perLvlManaCostModifier, perLvlManaCostFactor)
VALUES	('FIRE_BALL', 'Fireball', 15, 0.33, 0, 0, 0, 5, 0.2, 0);

