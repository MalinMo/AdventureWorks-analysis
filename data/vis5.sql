USE AdventureWorks2025;

SELECT TOP 5 * FROM  Production.Product;
SELECT TOP 5 * FROM  Sales.SalesOrderDetail;

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM Production.Product AS p
JOIN Sales.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC