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

--BASE DE DATOS DB LOGÍSTICA
use dblogistica
 
--create login usersample with password = 'trilce'; ya existe el login
create user usersamplelogistica for LOGIN usersample; 

--query que muestra los usuarios de la base de datos actual
select top 100 * From sysusers

Grant select , update ,insert on  sede to usersamplelogistica;

--en la base de datos que ya teníamos como logística
--crearemos una base de datos
 create schema Logistica authorization usersamplelogistica;
 --transferimos 
 alter schema Logistica transfer sede;
 select * FROM INFORMATION_SCHEMA.TABLES where TABLE_CATALOG = 'dblogistica';

 select * from Logistica.sede 
 --creacion de sinónimos 
 create synonym sede for Logistica.sede; 
 select * from sede; 

  GRANT SELECT ON  sede TO usersamplelogistica;

  create login usersample2 with password = 'trilce'; -- ya existe el login
  create user usersamplelogistica2 for LOGIN usersample2; 

  GRANT SELECT ON  sede TO usersamplelogistica2;


   alter schema Logistica transfer cotizacion;
   alter schema Logistica transfer pedido;
   alter schema Logistica transfer sucursal;
   alter schema Logistica transfer detalle_pedido;
   

   --crearemos otro schema para el mismo usuario : 

    create schema Compras authorization usersamplelogistica;

	alter schema Compras transfer proveedor;
 
	alter schema Compras transfer orden_compra;

  

  create schema Mantenimiento authorization usersamplelogistica;

  alter schema Mantenimiento transfer alternador;
  alter schema Mantenimiento transfer protocolo;
  alter schema Mantenimiento transfer servicio;
  alter schema Mantenimiento transfer detalleservicio;
  alter schema Mantenimiento transfer motor;
  alter schema Mantenimiento transfer detalle_conforservicio;
 



