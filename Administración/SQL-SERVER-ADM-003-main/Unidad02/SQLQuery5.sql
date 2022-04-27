
sp_who

SELECT CONVERT(char(20), SERVERPROPERTY('productlevel')) ; 
GO


select name "LOGIN", default_database_name "DATABASE", default_language_name "LANGUAGE" 
from sys.sql_logins where name = 'sa'; 
go


use master;

select SYSTEM_USER 'LOGIN', USER_NAME() 'USER';
GO

use educa;
go



USE [master]
GO
CREATE LOGIN [gustavo] 
WITH PASSWORD=N'gustavo', 
DEFAULT_DATABASE=[master], 
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF
GO







