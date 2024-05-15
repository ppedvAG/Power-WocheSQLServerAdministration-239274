CREATE EVENT SESSION [Demo] ON SERVER 
ADD EVENT sqlserver.rpc_completed(
    ACTION(SQLSatellite.AppName,sqlserver.sql_text,sqlserver.username)
    WHERE ([sqlserver].[like_i_sql_unicode_string]([sqlserver].[database_name],N'northwind'))),
ADD EVENT sqlserver.sql_batch_completed(
    WHERE ([sqlserver].[like_i_sql_unicode_string]([sqlserver].[database_name],N'northwind'))),
ADD EVENT sqlserver.sql_batch_starting(
    WHERE ([sqlserver].[like_i_sql_unicode_string]([sqlserver].[database_name],N'northwind')))
ADD TARGET package0.event_file(SET filename=N'C:\_SQLBACKUP\NwindDemo.xel'),
ADD TARGET package0.histogram(SET source=N'sqlserver.sql_text')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


CREATE EVENT SESSION [WaitsInSession] ON SERVER 
ADD EVENT sqlos.wait_info(
    ACTION(sqlserver.sql_text,sqlserver.username)
    WHERE ([package0].[equal_uint64]([sqlserver].[session_id],(105))))
ADD TARGET package0.event_file(SET filename=N'C:\_SQLBACKUP\WaitsInSession.xel'),
ADD TARGET package0.ring_buffer(SET max_events_limit=(500),max_memory=(10240))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


