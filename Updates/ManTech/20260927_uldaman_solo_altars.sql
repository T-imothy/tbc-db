-- WORLD database only. Allow a single player to activate both Uldaman altars.
-- Type 18 data0 is summoningRitual.reqParticipants in all three cores.
-- Preserve each expansion's spells, grouping flags, delay and encounter scripts.
-- Wrath's existing one-player setting is already correct and remains unchanged.
UPDATE gameobject_template
SET data0=1
WHERE type=18 AND data0=3
  AND ((entry=130511 AND data1=11568)
    OR (entry=133234 AND data1=10340));
