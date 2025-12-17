USE AdventureWorks2025;

SELECT TOP 5 * FROM  Production.ProductCategory;
SELECT TOP 5 * FROM  Production.ProductSubcategory;
SELECT TOP 5 * FROM  Production.Product;
SELECT TOP 5 * FROM  Sales.SalesOrderDetail;

SELECT 
    pc.Name AS Category,
    SUM(sod.LineTotal) AS TotalSales
FROM Production.ProductCategory AS pc
JOIN Production.ProductSubcategory AS psc
    ON pc.ProductCategoryID = psc.ProductCategoryID
JOIN Production.Product AS p
    ON psc.ProductSubcategoryID = p.ProductSubcategoryID
JOIN Sales.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID 
GROUP BY pc.Name
ORDER BY TotalSales DESC;