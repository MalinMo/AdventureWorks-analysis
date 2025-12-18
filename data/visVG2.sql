USE AdventureWorks2025;

SELECT TOP 5 * FROM Sales.SalesTerritory; 
SELECT TOP 5 * FROM Sales.SalesOrderHeader;
SELECT TOP 5 * FROM Sales.SalesOrderDetail;
SELECT TOP 5 * FROM Production.Product;
SELECT TOP 5 * FROM Production.ProductSubcategory;
SELECT TOP 5 * FROM Production.ProductCategory;   

SELECT
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END AS Region,
    pc.Name AS Category,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON st.TerritoryID = soh.TerritoryID
LEFT JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
LEFT JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE sod.LineTotal IS NOT NULL
GROUP BY 
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END,
    pc.Name
ORDER BY TotalSales DESC;