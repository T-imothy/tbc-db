-- WORLD database only: one player can activate the Blackrock Altar in UBRS.
-- Type 18 data0 is summoningRitual.reqParticipants in all three cores.
-- Preserve the channel, Emberseer activation spell and encounter mechanics.
-- Wrath already requires one participant; this update is a no-op there.
UPDATE gameobject_template
SET data0=1
WHERE entry=175706 AND type=18 AND data0=3
  AND data1=16533 AND data2=16532;
