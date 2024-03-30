IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'usersample')
BEGIN
    CREATE LOGIN usersample WITH PASSWORD = 'trilce';
END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'usersamplelogistica')
BEGIN
    CREATE USER usersampleEduTec FOR LOGIN usersample;
END
GO

--se asigna grant al usuario de bd
grant connect to usersampleEduTec;
 
--query que muestra los usuarios de la base de datos actual
select top 100 * From sysusers
use EduTec

Grant select , update ,insert on Alumno to usersampleEduTec;
 
--en la base de datos que ya teníamos como logística
--crearemos un esquema y se lo asignado al db user 
 create schema EdutecSchema authorization usersampleEduTec;
 --transferimos 
 alter schema EdutecSchema transfer Alumno;
 select * FROM INFORMATION_SCHEMA.TABLES where TABLE_CATALOG = 'Edutec';

 select * from EdutecSchema.Alumno; 