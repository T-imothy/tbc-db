START TRANSACTION;

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2131601 AND delay=8000 AND priority=0 AND buddy_entry=20683 AND search_radius=10 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2131601,8000,0,31,20683,10,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=8000 AND priority=1 AND buddy_entry=20683 AND search_radius=10 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=8000 AND priority=0 AND command=31 AND datalong=20683 AND datalong2=10);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2131601 AND delay=17000 AND priority=0 AND buddy_entry=20683 AND search_radius=10 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2131601,17000,0,31,20683,10,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=17000 AND priority=1 AND buddy_entry=20683 AND search_radius=10 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=17000 AND priority=0 AND command=31 AND datalong=20683 AND datalong2=10);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2131601 AND delay=20000 AND priority=0 AND buddy_entry=21348 AND search_radius=15 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2131601,20000,0,31,21348,15,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=20000 AND priority=1 AND buddy_entry=21348 AND search_radius=15 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2131601 AND delay=20000 AND priority=0 AND command=31 AND datalong=21348 AND datalong2=15);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2130203 AND delay=12000 AND priority=0 AND buddy_entry=21316 AND search_radius=10 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2130203,12000,0,31,21316,10,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=12000 AND priority=1 AND buddy_entry=21316 AND search_radius=10 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=12000 AND priority=0 AND command=31 AND datalong=21316 AND datalong2=10);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2130203 AND delay=20000 AND priority=0 AND buddy_entry=21316 AND search_radius=10 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2130203,20000,0,31,21316,10,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=20000 AND priority=1 AND buddy_entry=21316 AND search_radius=10 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=20000 AND priority=0 AND command=31 AND datalong=21316 AND datalong2=10);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_movement SET priority=1 WHERE id=2130203 AND delay=26000 AND priority=0 AND buddy_entry=21348 AND search_radius=20 AND command<>31;
INSERT INTO dbscripts_on_creature_movement(id,delay,priority,command,datalong,datalong2,comments)
SELECT 2130203,26000,0,31,21348,20,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=26000 AND priority=1 AND buddy_entry=21348 AND search_radius=20 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement WHERE id=2130203 AND delay=26000 AND priority=0 AND command=31 AND datalong=21348 AND datalong2=20);

-- Removed upstream group: remove only its orphaned choice rows.
DELETE e FROM spawn_group_entry e WHERE e.Id=5570190 AND e.Entry IN (18315,18331)
AND NOT EXISTS(SELECT 1 FROM spawn_group g WHERE g.Id=e.Id);
-- Death is a one-shot event; repeating is not a supported event flag.
UPDATE creature_ai_scripts SET event_flags=event_flags & ~1 WHERE id=1965705 AND creature_id=19657 AND event_type=6 AND action1_type=56;
-- Restore the AI that executes the existing scripted pause/resume waypoints.
UPDATE creature_template SET AIName='EventAI' WHERE Entry IN (18764,18765) AND AIName='' AND ScriptName=''
AND EXISTS(SELECT 1 FROM creature_ai_scripts s WHERE s.creature_id=creature_template.Entry);
COMMIT;
