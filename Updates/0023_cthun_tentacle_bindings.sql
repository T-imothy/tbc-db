-- Connect existing native tentacle birth/portal handlers.
INSERT IGNORE INTO spell_scripts (Id,ScriptName) VALUES
(26586,'spell_birth_tentacles'),
(26140,'spell_summon_hook_tentacle'),
(26216,'spell_summon_giant_hook_tentacles'),
(26150,'spell_summon_eye_tentacle'),
(26768,'spell_summon_giant_eye_tentacles');
-- Eye Tentacle accidentally inherited Claw Tentacle's Hamstring list.
-- Mind Flay targets a random player; reference cadence is 0.5s then 10s.
UPDATE creature_spell_list SET SpellId=26143,TargetId=100,InitialMin=500,InitialMax=500,
RepeatMin=10000,RepeatMax=10000,Comments='Eye Tentacle - Mind Flay'
WHERE Id=1572600 AND Position=0 AND SpellId=26141;
