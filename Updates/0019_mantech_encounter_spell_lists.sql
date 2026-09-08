-- Restore native abilities lost by historical spell-list migration mistakes.
-- 0479 (d6b4fe53): the Darkcaster block deleted Priest list 2025701.
-- 0475 (02512e16): the Collaborator block deleted Technician list 1989101.
-- Restore the original rows verbatim; preserve any existing same-key custom row.
-- The Adept's populated list is 1861501, not the Seductress list 1861401.
UPDATE creature_template SET SpellList=1861501
WHERE Entry=18615 AND SpellList=1861401;

INSERT INTO creature_spell_list
(Id,Position,SpellId,Flags,CombatCondition,TargetId,ScriptId,Availability,Probability,InitialMin,InitialMax,RepeatMin,RepeatMax,Comments)
VALUES
(1989101,2,39376,0,-1,100,0,100,0,10000,24000,21000,33000,'Coilfang Technician - Rain of Fire - random'),
(2025701,1,22883,0,-1,206,0,100,0,2000,12000,6000,18000,'Ethereal Priest - Heal - Missing 25% including self'),
(2025701,2,35944,0,-1,5,0,100,0,6000,22000,6000,22000,'Ethereal Priest - Power Word: Shield - friendly missing buff'),
(2025701,3,37669,0,-1,2,0,100,0,4000,17000,11000,25000,'Ethereal Priest - Holy Nova - self')
ON DUPLICATE KEY UPDATE Id=VALUES(Id);
