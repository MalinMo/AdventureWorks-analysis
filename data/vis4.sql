USE AdventureWorks2025;

SELECT TOP 5 * FROM  Sales.SalesOrderHeader;

SELECT 
    YEAR(soh.OrderDate) AS OrderYear,
    SUM(soh.TotalDue) AS TotalSales,
    COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader AS soh
GROUP BY YEAR(soh.OrderDate)
ORDER BY OrderYear;