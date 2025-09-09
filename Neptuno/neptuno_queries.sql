use Neptuno
 go
select * from Proveedores; 

-- COMENTARIOS 
--query a la tabla proveedor 
select * from Proveedores

select top 5 * from Proveedores 
--row : registro
--column : columna 

--WHERE ( FILTRO EN SQL ) 
--QUERY A LOS PROVEEDORES DE SUECIA 
select * from Proveedores where País ='Suecia' 
--QUERY A LOS PROVEEDORES DE JAPON 
select * from Proveedores where País ='Japón' 
--QUERY A LOS PROVEEDORES DE japon y TOKYO
select * from Proveedores where País ='Japón' and Ciudad = 'Tokyo'

select * from Proveedores where Fax is not NULL 
select * from Proveedores where Fax is NULL 


--extraer todos los clientes de alemania   y cuyos nombre empiecen con A 

select * from Clientes  where País = 'Alemania' and NombreCompañía like 'A%' --empiezan con A 
select * from Clientes  where País = 'Alemania' and NombreCompañía like '%A' --terminen con A 
select * from Clientes  where País = 'Alemania' and NombreCompañía like '%A%' -- contengan A 


--devuelve el total de registros 
SELECT COUNT(*) from Clientes


--ordenar
select * from Clientes order by NombreCompañía  -- por defecto ascendete 
select * from Clientes order by NombreCompañía desc  -- descendente


SELECT * FROM Pedidos 


--PEDIDOS cuya ciudad de destinatario sean Lyon y cuyos cargos sean menor a 30 
select * from Pedidos where CiudadDestinatario  = 'Lyon' and Cargo < 30 
