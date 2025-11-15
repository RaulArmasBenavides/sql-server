-- Declare Student cursor to rename all the tables as old
USE UniversityV3
GO

DECLARE @TableName VARCHAR(50) -- Existing table name
       ,@NewTableName VARCHAR(50) -- New table name

DECLARE Student_Cursor CURSOR FOR SELECT T.TABLE_NAME FROM INFORMATION_SCHEMA.TABLES T;
OPEN Student_Cursor
FETCH NEXT FROM Student_Cursor INTO @TableName
WHILE @@FETCH_STATUS = 0
BEGIN
SET @NewTableName=@TableName+'_OLD' -- Add _OLD to exsiting name of the table
EXEC sp_rename @TableName,@NewTableName -- Rename table as OLD table
FETCH NEXT FROM Student_Cursor -- Get next row data into cursor and store it into variables
INTO @TableName
END
CLOSE Student_Cursor -- Close cursor locks on the rows
DEALLOCATE Student_Cursor -- Release cursor reference