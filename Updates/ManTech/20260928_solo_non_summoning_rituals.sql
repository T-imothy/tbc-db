-- WORLD database. Single-player encounters and utility rituals.
-- Warlock Summoning Portal entries 36727/194108 and Doom Portal 177193 are excluded.
-- Owned rituals additionally need the matching core completion fix before they
-- can finish without another player clicking. No client patch is required.
UPDATE gameobject_template SET data0=1
WHERE type=18 AND data0 IN (2,3,5,10)
  AND ((entry=178465 AND data1=21249)  -- Altar of Summoning (unspawned template)
    OR (entry=178670 AND data1=21648) -- Circle of Calling (unspawned template)
    OR (entry=179944 AND data1=7720)  -- Meeting Stone Summoning Portal
    OR (entry=181622 AND data1=34145) -- Soulwell ritual
    OR (entry=186811 AND data1=43985) -- Refreshment ritual
    OR (entry=187359 AND data1=45217) -- Zul'Aman Strange Gong
    OR (entry=193062 AND data1=58661) -- Wrath refreshment ritual
    OR (entry=193168 AND data1=58888));-- Wrath soulwell ritual
