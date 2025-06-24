--databases with maxsize unlimited 
SELECT 
    db.name AS DatabaseName,
    mf.name AS LogicalFileName,
    mf.type_desc AS FileType,
    mf.physical_name,
    CAST(mf.size * 8.0 / 1024 AS DECIMAL(10,2)) AS CurrentSizeMB,
    CASE 
        WHEN mf.max_size = -1 THEN 'UNLIMITED'
        ELSE CAST(mf.max_size * 8 / 1024 AS VARCHAR) + ' MB'
    END AS MaxSize,
    CASE 
        WHEN mf.type_desc = 'LOG' THEN '2048MB'
        ELSE '10240MB'
    END AS RecommendedMaxSize
FROM sys.master_files mf
JOIN sys.databases db ON db.database_id = mf.database_id
WHERE mf.max_size = -1
  AND db.name NOT IN ('master', 'model', 'msdb', 'tempdb'); 



DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql += '
USE [' + name + '];
ALTER DATABASE [' + name + '] 
MODIFY FILE ( 
    NAME = N''' + mf.name + ''', 
    MAXSIZE = ' + 
    CASE 
        WHEN mf.type_desc = 'LOG' THEN '2048MB'
        ELSE '10240MB'
    END + '
);
'
FROM sys.master_files mf
JOIN sys.databases db ON mf.database_id = db.database_id
WHERE mf.max_size = -1  -- solo los que están como "UNLIMITED"
  AND db.name NOT IN ('master', 'model', 'msdb', 'tempdb'); -- evitar bases del sistema

-- Ejecutar el script generado
PRINT @sql;