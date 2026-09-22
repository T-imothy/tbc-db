-- Spawn 160811, stop 21 has no Rock Flayer Target nearby (nearest 87.76 yd
-- in both the original full database and live data). Keep arrival facing there.
-- Preserve its pause, mining emotes, dialogue and 25-second waypoint resume.
-- Its other mining stop still uses 2230406 and faces its existing 3-yard target.
INSERT INTO dbscripts_on_creature_movement
(id,delay,priority,command,datalong,datalong2,datalong3,buddy_entry,search_radius,data_flags,dataint,dataint2,dataint3,dataint4,datafloat,x,y,z,o,speed,condition_id,comments)
SELECT 2230410,delay,priority,command,datalong,datalong2,datalong3,buddy_entry,search_radius,data_flags,dataint,dataint2,dataint3,dataint4,datafloat,x,y,z,o,speed,condition_id,comments
FROM dbscripts_on_creature_movement
WHERE id=2230406 AND NOT(command=36 AND buddy_entry=21203)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_movement existing WHERE existing.id=2230410);

UPDATE creature_movement SET ScriptId=2230410
WHERE Id=160811 AND Point=21 AND ScriptId=2230406
AND ABS(PositionX-2486.1)<0.01 AND ABS(PositionY-7156.59)<0.01;

-- Spawn 160814 stop 17 has a valid target 11.52 yards away.
UPDATE dbscripts_on_creature_movement SET search_radius=15
WHERE id=2230408 AND command=36 AND buddy_entry=21203 AND data_flags=1 AND search_radius=10;
