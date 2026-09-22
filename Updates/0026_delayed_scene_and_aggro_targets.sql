-- Delayed ambient scenes must still have their living participant at execution.
-- Priority 0 guard precedes priority 1 action at the same delay (loader orders by priority).
-- Missing participants terminate this scene instance; normal waypoint movement continues.
-- This does not teleport, respawn, or increase the search radius of any NPC.
UPDATE dbscripts_on_creature_movement SET priority=1
WHERE priority=0 AND (
 (id=2180802 AND ((command=15 AND datalong=37645 AND buddy_entry=21417 AND data_flags=1)
                  OR (command=1 AND datalong=36 AND buddy_entry=21803 AND data_flags=4)))
 OR (id=233001 AND command=0 AND buddy_entry IN(2331,3504) AND data_flags=7));

INSERT INTO dbscripts_on_creature_movement
(id,delay,priority,command,datalong,datalong2,comments)
SELECT a.id,a.delay,0,31,a.buddy_entry,a.search_radius,'ManTech: stop delayed scene when required participant is unavailable'
FROM dbscripts_on_creature_movement a
WHERE a.priority=1 AND (
 (a.id=2180802 AND ((a.command=15 AND a.datalong=37645 AND a.buddy_entry=21417 AND a.data_flags=1)
                    OR (a.command=1 AND a.datalong=36 AND a.buddy_entry=21803 AND a.data_flags=4)))
 OR (a.id=233001 AND a.command=0 AND a.buddy_entry IN(2331,3504) AND a.data_flags=7))
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_creature_movement g
 WHERE g.id=a.id AND g.delay=a.delay AND g.priority=0 AND g.command=31
 AND g.datalong=a.buddy_entry AND g.datalong2=a.search_radius
 AND g.data_flags=0 AND g.buddy_entry=0);

-- EnterCombat passes the attacker as action invoker before a current victim is guaranteed.
-- Keep the realm's existing AI-event type and radius.
UPDATE creature_ai_scripts SET action2_param3=6
WHERE id IN(1994601,2008801) AND creature_id IN(19946,20088)
AND event_type=4 AND action2_type=45 AND action2_param1=5 AND action2_param3=1;
