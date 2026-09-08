-- Restore native encounter data to CMaNGOS authority.
-- Core: 368b7ef328fa2a472824df55f2195b49f1aaa747
-- Database: 5078439a44d208732a903bca2d7df51941fb373a
-- Archived experiments: archive/native-encounter-audit-20260908.
-- This migration intentionally removes the archived custom mechanics.

DELETE FROM spell_scripts WHERE Id IN (24223,24228,26140,26150,26216,26586,26768);
INSERT INTO spell_scripts (Id,ScriptName) VALUES
(24228,'spell_arlokk_vanish');

-- Official final Eye Tentacle spell-list row (Classic update 4713; other eras full dump).
DELETE FROM creature_spell_list WHERE Id=1572600 AND Position=0;
INSERT INTO `creature_spell_list` (`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,`Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(1572600,0,26141,0,-1,1,0,100,0,2000,3000,5000,6000,'Claw Tentacle - Hamstring');
