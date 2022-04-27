
use edutec;
go


select 
	SYSTEM_USER [inicio de sesion],
	SESSION_USER [database user];
go


/*
Cuando un Login ID tiene el rol de servidor sysadmin,
se puede conectar con cualquier base de datos, 
y lo hace con el usuario dbo.
*/



select 
	SYSTEM_USER [inicio de sesion],
	SESSION_USER [database user];
go




select * from dbo.alumno;
go




EXEC sys.sp_setapprole 'admdb', 'sql';  
GO