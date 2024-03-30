USE MASTER;
GO


DECLARE @backupNameFull NVARCHAR(255);
DECLARE @backupNameDiff NVARCHAR(255);
DECLARE @timeStamp NVARCHAR(50);

-- Obtener la fecha y hora actuales en formato 'YYYYMMDDHHMMSS'
SET @timeStamp = REPLACE(REPLACE(REPLACE(CONVERT(NVARCHAR, GETDATE(), 120), ':', ''), '-', ''), ' ', '');

-- Construir los nombres de archivo de respaldo con el timestamp
SET @backupNameFull = 'D:\dev\db\backup\sqlserver\EduTec_Full_' + @timeStamp + '.bak';
SET @backupNameDiff = 'D:\dev\db\backup\sqlserver\EduTec_Diff_' + @timeStamp + '.bak';

-- Respaldo completo
BACKUP DATABASE EduTec 
TO DISK = @backupNameFull
WITH NAME = 'EduTec-Full Backup', INIT, SKIP, NOREWIND, NOUNLOAD, STATS = 10;

-- Respaldo diferencial
BACKUP DATABASE EduTec
TO DISK = @backupNameDiff
WITH DIFFERENTIAL, 
     NAME = 'EduTec-Differential Backup', INIT, SKIP, NOREWIND, NOUNLOAD, STATS = 10;

	 ALTER DATABASE EduTec SET RECOVERY FULL;
GO

BACKUP LOG EduTec 
TO  DISK = 'D:\dev\db\backup\sqlserver\EduTecLOG.bak'
WITH NAME = 'EduTec-Log Copia de seguridad'
GO