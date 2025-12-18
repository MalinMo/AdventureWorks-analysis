USE AdventureWorks2025;

SELECT TOP 5 * FROM  Sales.SalesOrderHeader;

SELECT 
    DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1) AS OrderMonth,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
WHERE soh.OrderDate >= '2023-01-01' AND soh.OrderDate <  '2025-01-01'
GROUP BY DATEFROMPARTS(YEAR(soh.OrderDate), MONTH(soh.OrderDate), 1)
ORDER BY OrderMonth ASC;