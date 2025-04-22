/*se pueden tomar los siguientes valores:

Si está fragmentado menos de un 10% no es necesario hacer nada.
Si está fragmentado entre un 10% y un 30% es mejor reoganizar el índice
Si está fragmentado más de un 30% es mejor reconstruir el índice*/

select CURRENT_TIMESTAMP as Fecha,
        DB_NAME(db_id()) as DatabaseName,
	    @@servername Servidor, 
		b.name as IndexName, 
		obj.name as ObjectName,
        a.avg_fragmentation_in_percent as '%Frag', 
	    a.page_count as NumeroPaginas ,
	    a.fragment_count as PromPagFrag,
		a.index_type_desc as TipoIndice,
        a.avg_fragment_size_in_pages,
		a.partition_number
FROM  sys.dm_db_index_physical_stats(db_id(), NULL, NULL, NULL, 'limited') as a
      INNER JOIN sys.indexes as b
      ON a.object_id = b.object_id AND a.index_id = b.index_id
      INNER JOIN sys.objects as Obj
ON  a.object_id = Obj.object_id

--ALTER INDEX PK_Grupos_COD_GRUP ON TBLGRUPOS REBUILD
--ALTER INDEX PK_Clientes_COD_ID ON tblClientes REORGANIZE

SELECT 
  DB_NAME(db_id()) as DatabaseName,
	    @@servername Servidor, 
    s.name AS SchemaName,
    t.name AS TableName,
    i.name AS IndexName,
    ips.index_id,
    ips.avg_fragmentation_in_percent,
    ips.page_count,
	ips.fragment_count as PromPagFrag,
    ips.index_type_desc as TipoIndice,
    ips.avg_fragment_size_in_pages,
    ips.partition_number
FROM 
    sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') AS ips
JOIN 
    sys.tables AS t ON ips.object_id = t.object_id
JOIN 
    sys.schemas AS s ON t.schema_id = s.schema_id
JOIN 
    sys.indexes AS i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
WHERE 
    s.name = 'INTCH'
    AND t.name IN (
	     'MPT_DOCUMENT_FILE',
        'MPT_MDR_DISTRIBUTION',
        'MPT_DOCUMENT_MDR',
        'MPT_CLIENT_GROUP',
        'ACQUIRING_SUMMARY',
        'JURISDICTION',
        'MPT_CLIENT_CHAIN',
        'MPT_CLIENT_MERCHANT'
    )
    AND i.name IS NOT NULL
   -- AND ips.page_count >= 100
ORDER BY 
    ips.avg_fragmentation_in_percent DESC;