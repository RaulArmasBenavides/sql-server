IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'US_NEPTUNO')
BEGIN
    CREATE USER US_NEPTUNO FOR LOGIN usersample;
END
GO
CREATE SCHEMA Comercial AUTHORIZATION US_NEPTUNO;
GO
 CREATE SCHEMA Logistica AUTHORIZATION US_NEPTUNO;
GO
 CREATE SCHEMA RH AUTHORIZATION US_NEPTUNO;
GO

 
Grant select , update ,insert on Categorías to US_NEPTUNO;
Grant select , update ,insert on Clientes to US_NEPTUNO;
Grant select , update ,insert on Detalles to US_NEPTUNO;
Grant select , update ,insert on Empleados to US_NEPTUNO;
Grant select , update ,insert on Pedidos to US_NEPTUNO;
Grant select , update ,insert on Productos to US_NEPTUNO;
Grant select , update ,insert on Proveedores to US_NEPTUNO;
--en la base de datos que ya teníamos como logística
--crearemos un esquema y se lo asignado al db user 
 
 
 alter schema Comercial transfer Clientes;
 alter schema Comercial transfer Pedidos;
 alter schema Comercial transfer Detalles;
 
  alter schema Logistica transfer Proveedores;
  alter schema Logistica transfer Productos;
  alter schema Logistica transfer Categorías;

  alter schema RH transfer Empleados;
 
  select * FROM INFORMATION_SCHEMA.TABLES where TABLE_CATALOG = 'Neptuno';