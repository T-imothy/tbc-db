-- Aggro events provide their attacker before a current victim is guaranteed.
-- Preserve Twilight Thug's 25 percent dialogue chance and text template 14.
UPDATE creature_ai_scripts SET action1_param2=6
WHERE id=233902 AND creature_id=2339 AND event_type=4
AND action1_type=54 AND action1_param1=0 AND action1_param2=1 AND action1_param3=14;
