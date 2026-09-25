-- Optional Blackrock Spire ambient conversation participants can die/despawn.
-- Check each delayed emote at execution time in a separate relay. Never terminate
-- the parent movement script: its final unpause must still run.
-- WORLD database only; same verified rows exist in Classic, TBC and Wrath.

INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,datalong2,comments)
SELECT 9900901,0,0,31,9045,15,'ManTech: optional ambient emote - require living participant'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900901);
INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,buddy_entry,search_radius,dataint,dataint2,dataint3,dataint4,comments)
SELECT 9900901,0,1,1,1,9045,15,11,1,1,274,'ManTech: optional ambient emote - original random emotes'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900901 AND command=31 AND datalong=9045 AND comments='ManTech: optional ambient emote - require living participant')
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900901 AND priority=1);
UPDATE dbscripts_on_creature_movement
SET command=45,datalong=9900901,buddy_entry=0,search_radius=0,dataint=0,dataint2=0,dataint3=0,dataint4=0
WHERE id=909702 AND delay=21000 AND priority=0 AND command=1 AND datalong=1
AND datalong2=0 AND datalong3=0 AND buddy_entry=9045 AND search_radius=15 AND data_flags=0
AND dataint=11 AND dataint2=1 AND dataint3=1 AND dataint4=274 AND condition_id=0;

INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,datalong2,comments)
SELECT 9900902,0,0,31,9098,15,'ManTech: optional ambient emote - require living participant'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900902);
INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,buddy_entry,search_radius,dataint,dataint2,dataint3,dataint4,comments)
SELECT 9900902,0,1,1,1,9098,15,11,1,1,274,'ManTech: optional ambient emote - original random emotes'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900902 AND command=31 AND datalong=9098 AND comments='ManTech: optional ambient emote - require living participant')
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900902 AND priority=1);
UPDATE dbscripts_on_creature_movement
SET command=45,datalong=9900902,buddy_entry=0,search_radius=0,dataint=0,dataint2=0,dataint3=0,dataint4=0
WHERE id=909702 AND delay=33000 AND priority=0 AND command=1 AND datalong=1
AND datalong2=0 AND datalong3=0 AND buddy_entry=9098 AND search_radius=15 AND data_flags=0
AND dataint=11 AND dataint2=1 AND dataint3=1 AND dataint4=274 AND condition_id=0;

INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,datalong2,comments)
SELECT 9900903,0,0,31,9261,15,'ManTech: optional ambient emote - require living participant'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900903);
INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,buddy_entry,search_radius,dataint,dataint2,dataint3,dataint4,comments)
SELECT 9900903,0,1,1,1,9261,15,11,1,1,274,'ManTech: optional ambient emote - original random emotes'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900903 AND command=31 AND datalong=9261 AND comments='ManTech: optional ambient emote - require living participant')
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900903 AND priority=1);
UPDATE dbscripts_on_creature_movement
SET command=45,datalong=9900903,buddy_entry=0,search_radius=0,dataint=0,dataint2=0,dataint3=0,dataint4=0
WHERE id=925901 AND delay=21000 AND priority=0 AND command=1 AND datalong=1
AND datalong2=0 AND datalong3=0 AND buddy_entry=9261 AND search_radius=15 AND data_flags=0
AND dataint=11 AND dataint2=1 AND dataint3=1 AND dataint4=274 AND condition_id=0;

INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,datalong2,comments)
SELECT 9900904,0,0,31,9262,15,'ManTech: optional ambient emote - require living participant'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900904);
INSERT INTO dbscripts_on_relay (id,delay,priority,command,datalong,buddy_entry,search_radius,dataint,dataint2,dataint3,dataint4,comments)
SELECT 9900904,0,1,1,1,9262,15,11,1,1,274,'ManTech: optional ambient emote - original random emotes'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900904 AND command=31 AND datalong=9262 AND comments='ManTech: optional ambient emote - require living participant')
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900904 AND priority=1);
UPDATE dbscripts_on_creature_movement
SET command=45,datalong=9900904,buddy_entry=0,search_radius=0,dataint=0,dataint2=0,dataint3=0,dataint4=0
WHERE id=925901 AND delay=33000 AND priority=0 AND command=1 AND datalong=1
AND datalong2=0 AND datalong3=0 AND buddy_entry=9262 AND search_radius=15 AND data_flags=0
AND dataint=11 AND dataint2=1 AND dataint3=1 AND dataint4=274 AND condition_id=0;
