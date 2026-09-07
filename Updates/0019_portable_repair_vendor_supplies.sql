-- Portable Repair Hammer: class supplies and ordinary vendor ammunition.
-- Expansion-specific item IDs verified against item definitions and vendor sources.
-- A dedicated creature is summoned only by the Portable Repair Hammer.
-- Existing stock, purchase restrictions and limited-stock timers are preserved.
-- Reapplying this migration is safe; it only adds missing vendor rows.

CREATE TEMPORARY TABLE `portable_repair_seed` LIKE `creature_template`;
INSERT INTO `portable_repair_seed` SELECT * FROM `creature_template` WHERE `Entry`=24780;
UPDATE `portable_repair_seed` SET `Entry`=65001, `Name`='Portable Supply Bot', `SubName`='Reagents, Ammunition & Repairs', `VendorTemplateId`=0;
INSERT INTO `creature_template` SELECT s.* FROM `portable_repair_seed` s WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `Entry`=65001);
DROP TEMPORARY TABLE `portable_repair_seed`;

-- Copy original Hammer stock into its dedicated inventory; native rows stay unchanged.
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,v.`item`,v.`maxcount`,v.`incrtime`,v.`slot`,v.`ExtendedCost`,v.`condition_id`,v.`comments` FROM `npc_vendor` v WHERE v.`entry`=24780
AND NOT EXISTS (SELECT 1 FROM `npc_vendor` d WHERE d.`entry`=65001 AND d.`item`=v.`item`);

INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17031,0,0,31,0,0,'Rune of Teleportation'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17031)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17031);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17032,0,0,31,0,0,'Rune of Portals'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17032)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17032);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17020,0,0,31,0,0,'Arcane Powder'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17020)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17020);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17028,0,0,31,0,0,'Holy Candle'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17028)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17028);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17029,0,0,31,0,0,'Sacred Candle'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17029)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17029);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17030,0,0,31,0,0,'Ankh'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17030)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17030);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17033,0,0,31,0,0,'Symbol of Divinity'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17033)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17033);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,21177,0,0,31,0,0,'Symbol of Kings'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=21177)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=21177);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17034,0,0,31,0,0,'Maple Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17034)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17034);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17035,0,0,32,0,0,'Stranglethorn Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17035)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17035);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17036,0,0,33,0,0,'Ashwood Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17036)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17036);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17037,0,0,34,0,0,'Hornbeam Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17037)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17037);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17038,0,0,34,0,0,'Ironwood Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17038)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17038);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17021,0,0,34,0,0,'Wild Berries'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17021)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17021);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17026,0,0,34,0,0,'Wild Thornroot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17026)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17026);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,5565,0,0,34,0,0,'Infernal Stone'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5565)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5565);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,16583,0,0,34,0,0,'Demonic Figurine'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=16583)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=16583);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,22147,0,0,34,0,0,'Flintweed Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=22147)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=22147);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,22148,0,0,34,0,0,'Wild Quillvine'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=22148)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=22148);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17056,0,0,34,0,0,'Light Feather'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17056)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17056);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17057,0,0,35,0,0,'Shiny Fish Scales'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17057)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17057);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,17058,0,0,36,0,0,'Fish Oil'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17058)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17058);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,5140,0,0,37,0,0,'Flash Powder'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5140)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5140);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2928,0,0,37,0,0,'Dust of Decay'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2928)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2928);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2930,0,0,38,0,0,'Essence of Pain'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2930)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2930);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,3777,0,0,39,0,0,'Lethargy Root'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3777)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3777);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,5173,0,0,39,0,0,'Deathweed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5173)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5173);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,8923,0,0,39,0,0,'Essence of Agony'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8923)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8923);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,8924,0,0,39,0,0,'Dust of Deterioration'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8924)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8924);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,3371,0,0,39,0,0,'Empty Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3371)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3371);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,3372,0,0,40,0,0,'Leaded Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3372)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3372);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,8925,0,0,41,0,0,'Crystal Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8925)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8925);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,18256,0,0,41,0,0,'Imbued Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=18256)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=18256);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2512,0,0,41,0,0,'Rough Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2512)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2512);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2515,0,0,42,0,0,'Sharp Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2515)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2515);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,3030,0,0,43,0,0,'Razor Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3030)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3030);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,11285,0,0,44,0,0,'Jagged Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=11285)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=11285);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2516,0,0,45,0,0,'Light Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2516)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2516);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,2519,0,0,46,0,0,'Heavy Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2519)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2519);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,3033,0,0,47,0,0,'Solid Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3033)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3033);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,11284,0,0,48,0,0,'Accurate Slugs'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=11284)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=11284);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,28053,0,0,49,0,0,'Wicked Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=28053)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=28053);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,28056,0,0,50,0,0,'Blackflight Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=28056)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=28056);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,28060,0,0,50,0,0,'Impact Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=28060)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=28060);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,28061,0,0,51,0,0,'Ironbite Shell'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=28061)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=28061);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,25861,0,0,51,0,0,'Crude Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=25861)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=25861);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,28979,0,0,52,0,0,'Light Throwing Knife'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=28979)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=28979);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,25872,0,0,53,0,0,'Balanced Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=25872)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=25872);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29007,0,0,54,0,0,'Weighted Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29007)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29007);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,25873,0,0,55,0,0,'Keen Throwing Knife'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=25873)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=25873);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29008,0,0,56,0,0,'Sharp Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29008)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29008);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,25875,0,0,57,0,0,'Deadly Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=25875)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=25875);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29009,0,0,58,0,0,'Heavy Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29009)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29009);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,25876,0,0,59,0,0,'Gleaming Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=25876)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=25876);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29010,0,0,60,0,0,'Wicked Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29010)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29010);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29013,0,0,61,0,0,'Jagged Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29013)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29013);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`ExtendedCost`,`condition_id`,`comments`)
SELECT 65001,29014,0,0,62,0,0,'Blacksteel Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=29014)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=29014);
