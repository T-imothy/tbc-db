-- Guard optional Netherstorm scene participants at each delayed action.
-- Parent cleanup, waypoint resume and work/return-home steps remain intact.

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900910','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900910 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900910','0','1','36','0','0','0','18855','5','3','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Magister - facing to Sunfury Astromancer'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900910 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900910',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='1000' AND `priority`='0' AND `command`='36' AND `datalong`='0' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='3' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Magister - facing to Sunfury Astromancer';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900911','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900911 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900911','0','1','36','0','0','0','18855','5','1','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Astromancer - face Sunfury Magister'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900911 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900911',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='1000' AND `priority`='1' AND `command`='36' AND `datalong`='0' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='1' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Astromancer - face Sunfury Magister';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900912','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900912 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900912','0','1','1','3','0','0','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Magister - Emote OneShotWave'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900912 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900912',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='1000' AND `priority`='2' AND `command`='1' AND `datalong`='3' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='0' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Magister - Emote OneShotWave';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900913','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900913 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900913','0','1','1','6','0','0','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Magister - Emote OneShotQuestion'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900913 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900913',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='4000' AND `priority`='0' AND `command`='1' AND `datalong`='6' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='0' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Magister - Emote OneShotQuestion';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900914','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900914 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900914','0','1','36','1','0','0','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Magister - reset facing'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900914 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900914',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='7000' AND `priority`='0' AND `command`='36' AND `datalong`='1' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='0' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Magister - reset facing';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900915','0','0','31','18855','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900915 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900915','0','1','35','6','0','0','18855','5','1','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Astromancer - SendAIEventB to Sunfury Magister'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900915 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900915',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18029' AND `delay`='10000' AND `priority`='0' AND `command`='35' AND `datalong`='6' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='18855' AND `search_radius`='5' AND `data_flags`='1' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Astromancer - SendAIEventB to Sunfury Magister';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900916','0','0','31','19483','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900916 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900916','0','1','36','0','0','0','19483','5','1','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Warp-Master/Warp-Engineer - face Netherstorm Use Standing Target'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900916 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900916',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18038' AND `delay`='1000' AND `priority`='0' AND `command`='36' AND `datalong`='0' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='19483' AND `search_radius`='5' AND `data_flags`='1' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Warp-Master/Warp-Engineer - face Netherstorm Use Standing Target';

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900917','0','0','31','19439','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','ManTech: Netherstorm optional participant guard'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900917 AND priority=0);

INSERT INTO dbscripts_on_relay (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`datafloat`,`x`,`y`,`z`,`o`,`speed`,`condition_id`,`comments`)
SELECT '9900917','0','1','36','0','0','0','19439','5','1','0','0','0','0','0','0','0','0','0','0','0','ManTech: guarded Netherstorm - Sunfury Geologist - face Netherstorm Work Mining Target'
WHERE NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=9900917 AND priority=1);

UPDATE dbscripts_on_relay SET `command`='45',`datalong`='9900917',`datalong2`='0',`datalong3`='0',`buddy_entry`='0',`search_radius`='0',`data_flags`='0',`dataint`='0',`dataint2`='0',`dataint3`='0',`dataint4`='0',`datafloat`='0',`x`='0',`y`='0',`z`='0',`o`='0',`speed`='0',`condition_id`='0'
WHERE `id`='18041' AND `delay`='1000' AND `priority`='0' AND `command`='36' AND `datalong`='0' AND `datalong2`='0' AND `datalong3`='0' AND `buddy_entry`='19439' AND `search_radius`='5' AND `data_flags`='1' AND `dataint`='0' AND `dataint2`='0' AND `dataint3`='0' AND `dataint4`='0' AND `datafloat`='0' AND `x`='0' AND `y`='0' AND `z`='0' AND `o`='0' AND `speed`='0' AND `condition_id`='0' AND `comments`='Netherstorm - Sunfury Geologist - face Netherstorm Work Mining Target';
