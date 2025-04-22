 


/*1.Optimizar La busqueda A través de indices del campo NOM_PROD de la tabla tblProductos*/
--sp_help 'tblproductos'

SET STATISTICS IO ON

--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD)
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE '%carne%'

SET STATISTICS IO OFF





select top 100 * From 
fn_dblog (null,null) 


SELECT XEventData.event_data.value('(event/data/value)[1]', 'varchar(max)') AS DeadlockGraph
FROM sys.dm_xe_session_targets AS st
JOIN sys.dm_xe_sessions AS s ON s.address = st.event_session_address
JOIN sys.dm_xe_session_event_actions AS ea ON s.address = ea.event_session_address
CROSS APPLY (SELECT CAST(st.target_data AS XML)) AS XEventData
WHERE s.name = 'DeadlockMonitor';


DBCC TRACEON (1222, -1);