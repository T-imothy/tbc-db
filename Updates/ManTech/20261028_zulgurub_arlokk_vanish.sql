-- Arlokk Vanish script executes effect index 1 of 24223.
-- 24228 is only the triggered teleport and has no effect index 1.
-- Exact old binding plus empty destination and native spell guards.
-- Expected first application: one changed row; replay: zero rows.
UPDATE spell_scripts AS old_binding
LEFT JOIN spell_scripts AS destination ON destination.Id=24223
INNER JOIN spell_template AS vanish ON vanish.Id=24223
  AND vanish.Effect1=6 AND vanish.Effect2=77 AND vanish.Effect3=3
SET old_binding.Id=24223
WHERE old_binding.Id=24228
  AND old_binding.ScriptName='spell_arlokk_vanish'
  AND destination.Id IS NULL;
