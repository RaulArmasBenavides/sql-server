--BASE DE DATOS DE NEPTUNO
use Neptuno
--query que muestra los login
SELECT * FROM sys.syslogins;

--query que muestra los usuarios de la base de datos actual
select top 100 * From sysusers

SELECT 
    sp.name AS LoginName,
    dp.name AS UserName,
    sp.type_desc AS LoginType,
    dp.type_desc AS UserType
FROM sys.database_principals AS dp
INNER JOIN sys.server_principals AS sp ON dp.sid = sp.sid
WHERE dp.type IN ('S', 'U', 'G') AND sp.type IN ('S', 'U', 'G');




