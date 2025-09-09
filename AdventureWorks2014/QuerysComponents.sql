USE AdventureWorks2014;
GO


select * from  Production.BillOfMaterials Where ProductAssemblyID =800 
--select * from  Production.Product Where ProductID =528 
select * From Production.Product where ProductID = 800
DECLARE @RootProductID int = 800;      -- Cambia por el ID del ensamble raíz
DECLARE @AsOfDate date = '2014-06-01'; -- Fecha de vigencia para el BOM

;WITH cteBOM AS
(
    -- Nivel 1: componentes directos del ensamble raíz
    SELECT
        b.ProductAssemblyID,
        b.ComponentID,
        p.Name AS ComponentName,
        CAST(b.PerAssemblyQty AS decimal(18,5)) AS Qty, -- cantidad directa
        1 AS Lvl
    FROM Production.BillOfMaterials AS b
    JOIN Production.Product AS p
      ON p.ProductID = b.ComponentID
    WHERE b.ProductAssemblyID = @RootProductID
      AND @AsOfDate >= b.StartDate
      AND (@AsOfDate < b.EndDate OR b.EndDate IS NULL)

    UNION ALL

    -- Niveles siguientes: componentes de los componentes (recursión)
    SELECT
        b.ProductAssemblyID,
        b.ComponentID,
        p.Name AS ComponentName,
        CAST(c.Qty * b.PerAssemblyQty AS decimal(18,5)) AS Qty, -- cantidad acumulada
        c.Lvl + 1
    FROM Production.BillOfMaterials AS b
    JOIN cteBOM AS c
      ON b.ProductAssemblyID = c.ComponentID
    JOIN Production.Product AS p
      ON p.ProductID = b.ComponentID
    WHERE @AsOfDate >= b.StartDate
      AND (@AsOfDate < b.EndDate OR b.EndDate IS NULL)
)
SELECT
    Lvl AS Level,
    ComponentID,
    ComponentName,
    Qty
FROM cteBOM
ORDER BY Lvl, ComponentName
OPTION (MAXRECURSION 100);