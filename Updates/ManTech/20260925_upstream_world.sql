-- ManTech tbc: reviewed upstream world updates, 2026-09-25.
-- Apply ONLY to the matching world database; never a characters database.


-- Source: Updates/0025_c.7846.sql
-- Correct Damage for Teremus the Devourer 7846
-- bestiary: 987-1310; ccsdb: 990-1299, matches well for both classic and tbc
-- Old Data: DamageMultiplier: 9.91, DamageVariance: 0.40, MinDMG: 615.98, MaxDMG: 834.79
-- Formula: ((55.1888 – 55.1888 * x / 2) + (252 / 14)) * y = 987 = ((55.1888 + 55.1888 * x / 2) + (252 / 14)) * y = 1310
-- New Data: DamageMultiplier: 15.69, DamageVariance: 0.37, MinDMG: 986.97, MaxDMG: 1309.97
UPDATE `creature_template` SET `DamageMultiplier` = 15.69229, `DamageVariance` = 0.37296, `MechanicImmuneMask` = `MechanicImmuneMask`|(1+32+33554432), `MechanicImmuneMask` = `MechanicImmuneMask`&~16384 WHERE `entry` = 7846;



-- Source: Updates/0026_20257_list.sql
-- Ethereal Priest 20257 (Heroic)
-- https://github.com/cmangos/tbc-db/commit/13b1403e2984a17c41ca0e9b32634880469f0ef6#diff-1269abbc2169910a02d58aadbfb4ccf3e7ad2c5513f53f9e418d2dda2714a746L137
DELETE FROM `creature_spell_list` WHERE `Id` = 2025701;
INSERT INTO `creature_spell_list` (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`, `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`, `RepeatMin`, `RepeatMax`, `Comments`) VALUES
(2025701, 1, 22883, 0, -1, 206, 0, 100, 0, 2000, 12000, 6000, 18000, 'Ethereal Priest - Heal - Missing 25% including self'),
(2025701, 2, 35944, 0, -1, 5, 0, 100, 0, 6000, 22000, 6000, 22000, 'Ethereal Priest - Power Word: Shield - friendly missing buff'),
(2025701, 3, 37669, 0, -1, 2, 0, 100, 0, 4000, 17000, 11000, 25000, 'Ethereal Priest - Holy Nova - self');



-- Source: Updates/0027_21269_list.sql
-- Devastation 21269 - spell_list
-- https://github.com/cmangos/tbc-db/commit/f65de43a604b1835d9ee3556fb3a82cf4c2c0367#diff-8344129e35190a1fe0366238d7f8994431be263a6cfe54e26376f0479744540bL29442-L29445
-- https://github.com/cmangos/tbc-db/commit/369b5b1acbc712a5c0c3de1d94f17e9b4a9b8db5
UPDATE creature_template SET SpellList = 2126901 WHERE entry=21269;
DELETE FROM creature_spell_list_entry WHERE Id IN(2126901);
INSERT INTO creature_spell_list_entry(Id, Name, ChanceSupportAction, ChanceRangedAttack) VALUES
(2126901, 'TK - Devastation', 0, 0);
DELETE FROM creature_spell_list WHERE Id IN(2126901);
INSERT INTO creature_spell_list(Id, Position, SpellId, Flags, CombatCondition, TargetId, ScriptId, Availability, Probability, InitialMin, InitialMax, RepeatMin, RepeatMax, Comments) VALUES
('2126901', '0', '36981', '0', '101', '0', '0', '100', '1','10000','15000','20000','25000', 'Devastation - Whirlwind'); -- 10-15 repeat prenerf?



-- Source: Updates/0028_18557_list.sql
-- Phasing Cleric 18557
-- https://github.com/cmangos/tbc-db/commit/992b31a3252e7f870a2d5d402eeffcff46142247#diff-45a2ed4fdd1206ad66fcde301b83594b4543eb5a0b0bc05c3b8265104ecee452R23-R296
UPDATE `creature_template` SET `SpellList` = 1855701 WHERE `entry` = 18557;



-- Source: Updates/0029_18614_list.sql
-- Seductress 18614 (Heroic) & Shadowmoon Adept 18615 (Heroic)
-- https://github.com/cmangos/tbc-db/commit/d409d234a7a#diff-2547c6cbee1e2d5b143f05351d8f7a4dc302b5120334ce32d405aaf4101bbc94R13-R103
UPDATE `creature_template` SET `SpellList` = 1861401 WHERE `entry` = 18614; -- 0
UPDATE `creature_template` SET `SpellList` = 1861501 WHERE `entry` = 18615;
DELETE FROM `creature_spell_list` WHERE `Id` = 1861401;
INSERT INTO `creature_spell_list` (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`, `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`, `RepeatMin`, `RepeatMax`, `Comments`) VALUES
(1861401, 1, 32202, 0, -1, 1, 0, 100, 0, 0, 10000, 9000, 20000, 'Seductress - Lash of Pain - on current'),
(1861401, 2, 31865, 0, -1, 101, 0, 100, 0, 4000, 16000, 11000, 23000, 'Seductress - Seduction - on random not tank');



-- Source: Updates/0030_19891_list.sql
-- Reinsert SpellList for Coilfang Technician (Heroic) 19891
-- https://github.com/cmangos/tbc-db/commit/02512e1695e5158449d4201e6b524cec932b6a0c#diff-8001d5d7f0af5be7b7debcc4ab43cb9795dfabc31f059276c080feb42a5a4334R14-R395
DELETE FROM `creature_spell_list` WHERE `Id` = 1989101;
INSERT INTO `creature_spell_list` (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`, `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`, `RepeatMin`, `RepeatMax`, `Comments`) VALUES
(1989101, 2, 39376, 0, -1, 100, 0, 100, 0, 10000, 24000, 21000, 33000, 'Coilfang Technician - Rain of Fire - random');



-- Source: Updates/0031_19904_list.sql
-- Apply Correct SpellList for Wastewalker Worker (Heroic) 19904
-- https://github.com/cmangos/tbc-db/commit/02512e1695e5158449d4201e6b524cec932b6a0c#diff-8001d5d7f0af5be7b7debcc4ab43cb9795dfabc31f059276c080feb42a5a4334R191
UPDATE `creature_template` SET `SpellList` = 1990401 WHERE `entry` = 19904;



-- Source: Updates/0032_s.37422.sql
-- Add spell_script_target for Consume 37422
DELETE FROM `spell_script_target` WHERE `entry` = 37422;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES
(37422, 1, 21805, 0), -- Protectorate Avenger
(37422, 1, 21783, 0), -- Protectorate Regenerator
(37422, 1, 20984, 0); -- Protectorate Defender



-- Source: Updates/0033_c.20039.sql
-- Further Improve Damage for Phoenix-Hawk 20039
-- bestiary: 9149-12938
-- Old Data: DamageMultiplier: 34.40, DamageVariance: 0.40, MinDMG: 8219.16, MaxDMG: 11943.03
-- Formula: ((270.666 – 270.666 * x / 2) + (314 / 14)) * y = 9149 = ((270.666 + 270.666 * x / 2) + (314 / 14)) * y = 12938
-- New Data: DamageMultiplier: 37.68, DamageVariance: 0.37, MinDMG: 9149.14, MaxDMG: 12937.85
UPDATE `creature_template` SET `DamageMultiplier` = 37.679, `DamageVariance` = 0.3715 WHERE `entry` = 20039;



-- Source: Updates/0034_skill_fishing_base_level.sql
-- Port per-zone area fishing requirements to skill_fishing_base_level
-- Part of https://github.com/cmangos/mangos-tbc/pull/873
-- https://github.com/cmangos/mangos-tbc/commit/9b835597000ed49db3c4f4542c0a7d4ca87fcca7

-- https://wowpedia.fandom.com/wiki/Patch_3.1.0 - You can now fish anywhere, regardless of skill. Every catch has the potential for fishing skill gains, but you are likely to catch worthless junk in areas that are too difficult for your skill.

-- https://www.curseforge.com/wow/addons/angler-atlas - Data.lua
-- https://www.curseforge.com/wow/addons/anglers-atlas - DataOutland.lua
-- https://www.warcrafttavern.com/wow-classic/guides/fishing-1-300/ - confirms the dungeons
-- Trinitycore uses "WoWWiki's table once its 95-point grace band comes off" so their values are +95, can be used for junk filtering implementation
-- Some ø values were saved by zone fallback from area value
DELETE FROM `skill_fishing_base_level` WHERE `entry` IN (19,25,718,719,1497,796,16,1477,1583,1584,2717,2557,2279,3487,3557,3479,2366,2367,3606,3521,3655,3659,3607,3715,3716,3717,3905,3518,3805,4075,4131,3703,3653,3656,3720,3519,3679,3621,3680,3690,3691,3692,3693,3975);
INSERT INTO `skill_fishing_base_level` (`entry`, `skill`) VALUES
-- vanilla brackets - 0, 55, 130, 205, 330
(19, 330), -- ZG (Outside)(TC)
(25, 330), -- Blackrock Mountain (Outside)(TC)
(718, -20), -- Wailing Caverns (-20)
(719, -20), -- Blackfathom Deeps (-20)
(1497, -20), -- Undercity (missing in vmangos, fallback 85)
(796, 130), -- Scarlet Monastery (130)(205 too high take guide value)
(16, 205), -- Azshara (old 205)(new 330) - coast is 330 so i think the base level of 205 is correct see wpl 205 too
(1477, 205), -- The Temple of Atal’Hakkar (ø)(TC)
(1583, 330), -- Blackrock Spire (ø)(TC)
(1584, 330), -- Blackrock Depths (ø)(TC)
(2717, 330), -- Molten Core (ø)(TC)
-- confirmed by https://www.reddit.com/r/classicwow/comments/cx6mv6/is_there_a_list_of_the_minimum_fishing_skill/
(2557, 330), -- Dire Maul (ø)(330)
(2279, 330), -- Stratholme (ø)
-- TBC+ - tbc brackets - 305, 355, 380, 430
(3487, -20), -- Silvermoon City (ø)
(3557, -20), -- The Exodar (ø)
(3479, -70), -- The Veiled Sea (ø)(TC)
(2366, 205), -- The Black Morass (ø)(fallback value was 430)
(2367, 205), -- Old Hillsbrad Foothills (ø)(fallback value was 430)
(3606, 330), -- Hyjal Summit (ø)(fallback value was 430)
(3521, 305), -- Zangarmarsh (305)
(3655, 305), -- Umbrafen Lake (ø, fallback was zangarmarsh see above)
(3659, 305), -- The Lagoon (ø, fallback was zangarmarsh see above)
(3607, 305), -- Serpentshrine Cavern (300)(fallback value was 430 - needed to fish lurker, but that is probably set in the fish go)
(3715, 305), -- Steamvault (ø)(fallback value was 430)
(3716, 305), -- The Underbog (ø)(fallback value was 430)
(3717, 305), -- The Slave Pens (ø)(fallback value was 430)
(3905, 305), -- Coilfang Reservoir (ø)(TC)
-- Two outside sources put Nagrand at 355 -- Wowhead's TBC guide directly, and
-- WoWWiki's table once its 95-point grace band comes off -- and the same
-- subtraction lands three other Outland numbers exactly right, so the case
-- against 380 looked strong. It was wrong, and the addon's own journal could
-- not settle it either way: those sessions were fished at an effective 395
-- (the 375 cap plus a +20 pole), which clears 380 and 355 alike.
(3518, 355), -- Nagrand (380)
(3805, 355), -- Zul’Aman (ø)(fallback value was 430)
(4075, 355), -- Sunwell Plateau (ø)(fallback value was 430)
(4131, 355), -- Magisters’ Terrace (ø)(fallback value was 430)
(3703, 355), -- Shattrath City (ø)
(3653, 355), -- Serpent Lake (355)
(3656, 355), -- Marshlight Lake (355)
(3720, 355), -- Twin Spire Ruins (ø)
(3519, 355), -- Terokkar Forest (355)(380) but that's wrong see DataOutland.lua
(3679, 430), -- Skettis (ø)(405) - Setting to 430 as per bracket system
(3621, 430), -- Lake Sunspring (395)
(3680, 430), -- Blackwind Valley (ø)
(3690, 430), -- Blackwind Lake (405)
(3691, 430), -- Lake Ere’Noru (405)
(3692, 430), -- Lake Jorune (405)
(3693, 430), -- Skethyl Mountains (ø)
(3975, 430); -- Terokk’s Rest (ø)
-- WOTLK+ missing
-- (66, 380), -- Zul’Drak (ø)(TC)
-- (4100, 480), -- The Culling of Stratholme (ø)(TC)
-- (4273, 455), -- Ulduar (ø)(TC)
-- (4416, 455), -- Gundrak (ø)(TC)
-- (4493, 455), -- The Obsidian Sanctum (ø)(TC)
-- (4710, 480), -- Isle of Conquest (ø)(TC)
-- (4722, 480), -- Trial of the Crusader (ø)(TC)
-- (4813, 480), -- Pit of Saron (ø)(TC)
-- (4987, 480); -- The Ruby Sanctum (ø)(TC)



-- Targeted ACID changes only; do not reload the entire ACID database.
DELETE FROM creature_ai_scripts WHERE id IN (784601,784602,784603,784604);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('784601','7846','0','0','100','1025','15000','30000','15000','30000','0','0','11','12667','17','0','0','0','0','0','0','0','0','0','Teremus The Decourer - Cast Soul Consumption'),
('784602','7846','0','0','100','1025','10000','20000','20000','40000','0','0','11','11130','17','0','0','0','0','0','0','0','0','0','Teremus The Decourer - Cast Knock Away'),
('784603','7846','0','0','100','1025','0','10000','10000','20000','0','0','11','9573','1','0','0','0','0','0','0','0','0','0','Teremus The Decourer - Cast Flame Breath'),
('784604','7846','0','0','100','1025','8000','11000','8000','12000','0','0','11','40504','1','0','0','0','0','0','0','0','0','0','Teremus The Decourer - Cast Cleave');


-- Mana-Tombs group 5570190: preserve the rest of the instance.
UPDATE spawn_group SET Name='Mana Tombs - Group 034 - Ethereal Sorcerer | Nexus Stalker | Ethereal Theurgist | Ethereal Darkcaster' WHERE Id=5570190;
DELETE FROM spawn_group_entry WHERE Id=5570190 AND Entry IN (18315,18331);
INSERT INTO spawn_group_entry (Id,Entry,MinCount,MaxCount,Chance) VALUES (5570190,18315,0,0,0),(5570190,18331,0,0,0);
