-- Aggro has an action invoker before a current victim is guaranteed.
UPDATE creature_ai_scripts SET action2_param3=6
WHERE id=1808603 AND creature_id=18086 AND event_type=4
AND action2_type=45 AND action2_param1=5 AND action2_param3=1;

-- Recheck participants when the delayed Elekk action executes.
UPDATE dbscripts_on_creature_movement SET priority=1
WHERE id=2180801 AND priority=0 AND
((delay=2000 AND command=1 AND buddy_entry=21803 AND data_flags=4)
OR (delay=4000 AND command=15 AND datalong=37645 AND buddy_entry=21417 AND data_flags=1));
INSERT INTO dbscripts_on_creature_movement
(id,delay,priority,command,datalong,datalong2,comments)
SELECT a.id,a.delay,0,31,a.buddy_entry,a.search_radius,'ManTech: recheck delayed Elekk participant'
FROM dbscripts_on_creature_movement a
WHERE a.id=2180801 AND a.priority=1 AND a.command IN(1,15) AND a.buddy_entry IN(21803,21417)
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_creature_movement g WHERE g.id=a.id AND g.delay=a.delay
AND g.command=31 AND g.datalong=a.buddy_entry AND g.datalong2=a.search_radius AND g.priority=0);

-- Optional Harold actions use isolated relays. Missing Harold must not terminate
-- the parent scene, which pauses Gankly and later schedules the hunters' response.
INSERT INTO dbscripts_on_relay
(id,delay,priority,command,datalong,datalong2,comments)
SELECT 182970,0,0,31,18218,10,'ManTech: optional Harold facing guard'
WHERE NOT EXISTS(SELECT 1 FROM dbscripts_on_relay WHERE id=182970 AND command=31);
INSERT INTO dbscripts_on_relay
(id,delay,priority,command,datalong,datalong2,comments)
SELECT 182971,0,0,31,18218,10,'ManTech: optional Harold dialogue guard'
WHERE NOT EXISTS(SELECT 1 FROM dbscripts_on_relay WHERE id=182971 AND command=31);
INSERT INTO dbscripts_on_relay
(id,delay,priority,command,datalong,buddy_entry,search_radius,data_flags,dataint,comments)
SELECT IF(a.command=36,182970,182971),0,1,a.command,a.datalong,a.buddy_entry,a.search_radius,a.data_flags,a.dataint,a.comments
FROM dbscripts_on_creature_movement a
WHERE a.id=1829702 AND a.buddy_entry=18218 AND a.search_radius=10
AND ((a.delay=10000 AND a.command=36 AND a.data_flags=1) OR (a.delay=13000 AND a.command=0 AND a.data_flags=0 AND a.dataint=15112))
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_relay g WHERE g.id=IF(a.command=36,182970,182971) AND g.priority=1);
UPDATE dbscripts_on_creature_movement
SET datalong=IF(command=36,182970,182971),command=45,buddy_entry=0,search_radius=0,data_flags=0,dataint=0
WHERE id=1829702 AND buddy_entry=18218 AND search_radius=10
AND ((delay=10000 AND command=36 AND data_flags=1) OR (delay=13000 AND command=0 AND data_flags=0 AND dataint=15112));
