-- ManTech reusable portable mailbox and merchant/repair utility.
-- Item IDs are intentionally shared by Classic, TBC, and WotLK.

DELETE FROM `item_template` WHERE `entry` IN (65000, 65001, 90000, 90001);

DROP TEMPORARY TABLE IF EXISTS `mantech_item_seed`;
CREATE TEMPORARY TABLE `mantech_item_seed` LIKE `item_template`;

-- Reusable version of the native TBC Remote Mail Terminal.
INSERT INTO `mantech_item_seed` SELECT * FROM `item_template` WHERE `entry` = 23840;
UPDATE `mantech_item_seed` SET
    `entry` = 65000,
    `name` = 'Portable Mailbox',
    `Quality` = 3,
    `Flags` = 32,
    `BuyCount` = 1,
    `BuyPrice` = 500000,
    `SellPrice` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 1,
    `RequiredLevel` = 1,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `requiredspell` = 0,
    `requiredhonorrank` = 0,
    `RequiredCityRank` = 0,
    `RequiredReputationFaction` = 0,
    `RequiredReputationRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `MaxDurability` = 0,
    `spellcharges_1` = 0,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 1800000,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = 0,
    `bonding` = 1,
    `description` = 'Deploys a mailbox for 5 minutes. Reusable. 30 minute cooldown.',
    `ScriptName` = '',
    `Duration` = 0;
INSERT INTO `item_template` SELECT * FROM `mantech_item_seed`;

TRUNCATE TABLE `mantech_item_seed`;

-- Reusable version of the native TBC Field Repair Bot 110G.
INSERT INTO `mantech_item_seed` SELECT * FROM `item_template` WHERE `entry` = 34113;
UPDATE `mantech_item_seed` SET
    `entry` = 65001,
    `name` = 'Portable Repair Hammer',
    `displayid` = 8568,
    `Quality` = 3,
    `Flags` = 32,
    `BuyCount` = 1,
    `BuyPrice` = 500000,
    `SellPrice` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 1,
    `RequiredLevel` = 1,
    `RequiredSkill` = 0,
    `RequiredSkillRank` = 0,
    `requiredspell` = 0,
    `requiredhonorrank` = 0,
    `RequiredCityRank` = 0,
    `RequiredReputationFaction` = 0,
    `RequiredReputationRank` = 0,
    `maxcount` = 1,
    `stackable` = 1,
    `MaxDurability` = 0,
    `spellcharges_1` = 0,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 1800000,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = 0,
    `bonding` = 1,
    `description` = 'Deploys a merchant that buys unwanted items and repairs equipment. Reusable. 30 minute cooldown.',
    `ScriptName` = '',
    `Duration` = 0;
INSERT INTO `item_template` SELECT * FROM `mantech_item_seed`;

DROP TEMPORARY TABLE `mantech_item_seed`;
