-- Murkblood Brutes guard two separate captives. Missing the other faction's
-- captive is expected. Check each participant in its own relay so one missing
-- captive cannot cancel notification of the other. Recheck at timeout because
-- a player may already have escorted the captive away.
INSERT INTO dbscripts_on_relay
(id,delay,priority,command,datalong,datalong2,buddy_entry,search_radius,data_flags,comments)
SELECT r.id,0,0,31,r.captive,30,0,0,0,'ManTech: stop captive relay if captive is absent'
FROM (SELECT 1821101 id,18210 captive UNION ALL SELECT 1821102,18209
 UNION ALL SELECT 1821103,18210 UNION ALL SELECT 1821104,18209) r
WHERE NOT EXISTS(SELECT 1 FROM dbscripts_on_relay e WHERE e.id=r.id AND e.command=31);

INSERT INTO dbscripts_on_relay
(id,delay,priority,command,datalong,datalong2,buddy_entry,search_radius,data_flags,comments)
SELECT r.id,0,1,35,r.event_type,0,r.captive,30,4,'ManTech: notify nearby captive after presence check'
FROM (SELECT 1821101 id,18210 captive,0 event_type UNION ALL SELECT 1821102,18209,0
 UNION ALL SELECT 1821103,18210,5 UNION ALL SELECT 1821104,18209,5) r
WHERE NOT EXISTS(SELECT 1 FROM dbscripts_on_relay e WHERE e.id=r.id AND e.command=35);

-- Preserve the existing two-second unlock, five-minute reset and brute check.
UPDATE dbscripts_on_creature_death
SET datalong=CASE WHEN delay=2000 THEN CASE buddy_entry WHEN 18210 THEN 1821101 ELSE 1821102 END
 ELSE CASE buddy_entry WHEN 18210 THEN 1821103 ELSE 1821104 END END,
 command=45,buddy_entry=0,search_radius=0,data_flags=0
WHERE id=18211 AND command=35 AND buddy_entry IN(18210,18209)
AND search_radius=30 AND data_flags=4 AND datalong2=0
AND ((delay=2000 AND datalong=0) OR (delay=300000 AND datalong=5));
