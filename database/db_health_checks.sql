-- db_health_checks.sql
-- SQL queries for database health monitoring

-- === Check for long-running queries ===
SELECT pid, usename, application_name, state, query_start, query
FROM pg_stat_activity
WHERE state = 'active'
  AND now() - query_start > interval '5 minutes';

-- === Check for large tables ===
SELECT relname AS table_name,
       pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC
LIMIT 10;

-- === Check for failed connections ===
SELECT datname, numbackends, deadlocks, conflicts
FROM pg_stat_database;

-- === Check replication lag (if applicable) ===
SELECT client_addr, state, sent_lsn, write_lsn, flush_lsn, replay_lsn,
       write_lag, flush_lag, replay_lag
FROM pg_stat_replication;
