USE AdventureWorks2025;

SELECT TOP 5 * FROM  Sales.SalesOrderHeader;

SELECT 
    FORMAT(soh.OrderDate, 'yyyy-MM') AS OrderMonth,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
WHERE OrderDate >= '2023-01-01' AND OrderDate <  '2025-01-01'
GROUP BY FORMAT(soh.OrderDate, 'yyyy-MM')
ORDER BY OrderMonth ASC;