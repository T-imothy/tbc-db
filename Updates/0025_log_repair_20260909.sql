-- Remove only orphaned Cabal EventAI rows, never existing creature behavior.
DELETE a FROM creature_ai_scripts a LEFT JOIN creature c ON c.guid=-a.creature_id
WHERE a.id IN (5550114,5550280,5550283,5550292,5550295,5550332,555011701,555011702,555011801,555011802,555028101,555028102,555028201,555028202,555028401,555028402,555028501,555028502,555029301,555029302,555029401,555029402,555029601,555029602,555029701,555029702) AND a.creature_id<0 AND c.guid IS NULL;

-- These unreachable vendor options belong to non-vendors with no stock/template or script.
-- Preserve any option that acquired a vendor, scripted owner or an incoming menu link.
DELETE g FROM gossip_menu_option g
LEFT JOIN gossip_menu_option inbound ON inbound.action_menu_id=g.menu_id
WHERE ((g.menu_id=4533 AND g.id=0) OR (g.menu_id=9114 AND g.id=3) OR (g.menu_id=10364 AND g.id=1))
AND g.option_id=3 AND g.npc_option_npcflag=128 AND inbound.menu_id IS NULL
AND NOT EXISTS (SELECT 1 FROM creature_template ct WHERE ct.GossipMenuId=g.menu_id
 AND ((ct.NpcFlags & 128)<>0 OR ct.VendorTemplateId<>0 OR ct.ScriptName<>''));
