-- Vanish 24223 owns the script effect; 24228 is its teleport payload.
DELETE FROM spell_scripts WHERE Id=24228 AND ScriptName='spell_arlokk_vanish';
INSERT IGNORE INTO spell_scripts (Id,ScriptName) VALUES (24223,'spell_arlokk_vanish');
