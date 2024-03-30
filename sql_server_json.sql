--leer archivo json
DECLARE @JSON  Nvarchar(MAX)
SELECT * FROM 
OPENROWSET (BULK 'C:\tracks.json', SINGLE_CLOB ) import
--single_clob funciona como varchar





DECLARE @JSON NVARCHAR(MAX)
-- Cargar el contenido del archivo JSON en la variable @JSON
SELECT @JSON = BULKCOLUMN
FROM OPENROWSET(BULK 'C:\tracks.json', SINGLE_CLOB) AS j

-- Utilizar OPENJSON para analizar el contenido de la variable @JSON
-- Nota: Ajusta la estructura del SELECT según la estructura de tu JSON
SELECT *
FROM OPENJSON(@JSON)