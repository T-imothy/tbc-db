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

CREATE TABLE IF NOT EXISTS `mantech_migration` (
  `id` varchar(64) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantech_migration` (`id`,`details`)
VALUES ('arch3-world-tbc-v1','Targeted data cleanup and runtime-noise corrections')
ON DUPLICATE KEY UPDATE `applied_at`=CURRENT_TIMESTAMP, `details`=VALUES(`details`);
