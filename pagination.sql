DECLARE @PageNumber as int,
        @PageSize as int,
		@TotalPages as int 

SET @PageNumber =0;
SET @PageSize =5;
 set @TotalPages = (Select count (*) from [AdventureWorks2016].[Person].[Person])/@PageSize

   --first form
     SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY x.BusinessEntityID) AS RowNum, x.BusinessEntityID,x.FirstName   
                 FROM (select distinct BusinessEntityID,FirstName from [AdventureWorks2016].[Person].[Person]) x ) AS T 
              WHERE T.RowNum >= (@PageSize*@PageNumber +1 ) AND T.RowNum <= @PageSize *(@PageNumber +1)


   --second form 
  SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY x.BusinessEntityID) AS RowNum, x.BusinessEntityID,x.FirstName   
                 FROM (select distinct BusinessEntityID,FirstName from [AdventureWorks2016].[Person].[Person]) x ) AS T 
                 WHERE T.RowNum BETWEEN @PageSize *@PageNumber +1 
				 AND @PageSize *(@PageNumber +1)
