-- Run against the matching character database. Adds a covering index only.
-- Bounded metadata-lock wait; no row replacement, data migration, or index removal.
SET SESSION lock_wait_timeout=2;
SET @mantech_online_count_ddl = IF(
 EXISTS(SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='characters' AND INDEX_NAME='idx_mantech_online_race'),
 'SELECT 1',
 'ALTER TABLE characters ADD INDEX idx_mantech_online_race (online,race), ALGORITHM=INPLACE, LOCK=NONE');
PREPARE mantech_online_count_stmt FROM @mantech_online_count_ddl;
EXECUTE mantech_online_count_stmt;
DEALLOCATE PREPARE mantech_online_count_stmt;
ANALYZE TABLE characters;
