

/***CHECK THIS IN A DB****/ 
SELECT 
    name AS DatabaseName,
    state_desc AS State,
    user_access_desc AS Access,
    recovery_model_desc AS RecoveryModel,
    containment_desc AS Containment,
    is_auto_close_on AS AutoClose,
    is_auto_shrink_on AS AutoShrink,
    is_auto_create_stats_on AS AutoCreateStats,
    is_auto_update_stats_on AS AutoUpdateStats,
    is_auto_update_stats_async_on AS AutoUpdateStatsAsync,
    is_read_committed_snapshot_on AS ReadCommittedSnapshot,
    snapshot_isolation_state_desc AS SnapshotIsolation,
    is_trustworthy_on AS Trustworthy,
    is_broker_enabled AS BrokerEnabled,
    is_query_store_on AS QueryStoreEnabled,
    page_verify_option_desc AS PageVerify,
    is_encrypted AS TDE_Enabled,
    is_fulltext_enabled AS FullTextEnabled,
    is_parameterization_forced AS ForcedParameterization,
    default_language_lcid AS DefaultLanguageLCID,
    default_language_name AS DefaultLanguageName,
    is_nested_triggers_on AS NestedTriggers,
    is_db_chaining_on AS DBChaining,
    delayed_durability_desc AS DelayedDurability,
    target_recovery_time_in_seconds AS TargetRecoveryTimeSeconds
FROM sys.databases
ORDER BY name;
