-- ManTech Arch3: targeted cleanup from TBC dev soak diagnostics.

DELETE FROM `gameobject` WHERE `id` = 0;

-- Ruul the Darkener's spawn cast is not present in the 2.4.3 spell store.
DELETE FROM `creature_ai_scripts` WHERE `id` = 2131507 AND `creature_id` = 21315;

-- This creature was converted to creature_spell_list in update 0004; remove
-- the obsolete ranged-mode EventAI row left by the ACID load.
DELETE FROM `creature_ai_scripts` WHERE `id` = 2371401 AND `creature_id` = 23714;

-- Remove an orphan vendor flag only when neither a direct nor template-backed
-- inventory exists. Trainer and other NPC flags are preserved.
UPDATE `creature_template` AS `ct`
LEFT JOIN `npc_vendor` AS `nv` ON `nv`.`entry` = `ct`.`Entry`
LEFT JOIN `npc_vendor_template` AS `nvt` ON `nvt`.`entry` = `ct`.`VendorTemplateId`
SET `ct`.`NpcFlags` = `ct`.`NpcFlags` & ~128
WHERE `ct`.`Entry` IN (3044,16729,21088)
  AND `nv`.`entry` IS NULL
  AND `nvt`.`entry` IS NULL;

-- Ashtongue Handler spell 38046 is scripted to target its Elekk Demolisher.
DELETE FROM `spell_script_target` WHERE `entry` = 38046 AND `type` = 1;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`,`inverseEffectMask`)
VALUES (38046,1,21802,0);

-- This isolated spawn is configured for waypoint movement but has no path.
UPDATE `creature`
SET `MovementType` = 0
WHERE `guid` = 156139 AND `id` = 3737 AND `MovementType` = 2
  AND NOT EXISTS (SELECT 1 FROM `creature_movement` WHERE `id` = 156139);

-- Upstream converted the Old Hillsbrad barrel pools to gameobject spawn
-- groups. Apply the same conversion safely to an existing database; the
-- full instance seed file is not designed to be replayed over live data.
DELETE FROM `spawn_group_spawn` WHERE `Id` BETWEEN 5601001 AND 5601005;
DELETE FROM `spawn_group` WHERE `Id` BETWEEN 5601001 AND 5601005;
DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN 49601 AND 49605;
DELETE FROM `pool_template` WHERE `entry` BETWEEN 49601 AND 49605;

INSERT INTO `spawn_group`
  (`Id`,`Name`,`Type`,`MaxCount`,`WorldState`,`WorldStateExpression`,`Flags`) VALUES
  (5601001,'Old Hillsbrad Foothills - Orc Hut 1 - Barrel (182589)',1,1,0,0,0),
  (5601002,'Old Hillsbrad Foothills - Orc Hut 2 - Barrel (182589)',1,1,0,0,0),
  (5601003,'Old Hillsbrad Foothills - Orc Hut 3 - Barrel (182589)',1,1,0,0,0),
  (5601004,'Old Hillsbrad Foothills - Orc Hut 4 - Barrel (182589)',1,1,0,0,0),
  (5601005,'Old Hillsbrad Foothills - Orc Hut 5 - Barrel (182589)',1,1,0,0,0);

INSERT INTO `spawn_group_spawn` (`Id`,`Guid`,`SlotId`,`Chance`) VALUES
  (5601001,5600036,-1,0),(5601001,5600047,-1,0),(5601001,5600048,-1,0),
  (5601002,5600038,-1,0),(5601002,5600039,-1,0),(5601002,5600046,-1,0),
  (5601003,5600035,-1,0),(5601003,5600041,-1,0),(5601003,5600045,-1,0),
  (5601004,5600034,-1,0),(5601004,5600043,-1,0),(5601004,5600044,-1,0),
  (5601005,5600037,-1,0),(5601005,5600040,-1,0),(5601005,5600042,-1,0);

CREATE TABLE IF NOT EXISTS `mantech_migration` (
  `id` varchar(64) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantech_migration` (`id`,`details`)
VALUES ('arch3-world-tbc-v1','Targeted data cleanup and runtime-noise corrections')
ON DUPLICATE KEY UPDATE `applied_at`=CURRENT_TIMESTAMP, `details`=VALUES(`details`);
