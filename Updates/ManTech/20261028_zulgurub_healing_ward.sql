-- Jin'do Powerful Healing Ward14987: native passive24310 periodically triggers heal24311.
-- Exact before-image guards: a changed custom row is left untouched. Check affected rows.
UPDATE creature_spell_list SET SpellId=24310
WHERE `Id`='1498701' AND
    `Position`='0' AND
    `SpellId`='24684' AND
    `Flags`='0' AND
    `CombatCondition`='-1' AND
    `TargetId`='101' AND
    `ScriptId`='0' AND
    `Availability`='100' AND
    `Probability`='1' AND
    `InitialMin`='4000' AND
    `InitialMax`='10000' AND
    `RepeatMin`='8000' AND
    `RepeatMax`='16000' AND
    `Comments`='Powerful Healing Ward - passive spell Powerful Healing Ward'
  AND EXISTS (SELECT 1 FROM creature_template WHERE Entry=14987 AND SpellList=1498701)
  AND EXISTS (SELECT 1 FROM spell_template WHERE Id=24310 AND Effect1=6 AND EffectApplyAuraName1=23 AND EffectTriggerSpell1=24311);
