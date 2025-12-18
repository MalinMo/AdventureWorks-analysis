USE AdventureWorks2025;

SELECT TOP 5 * FROM Sales.SalesTerritory; 
SELECT TOP 5 * FROM Sales.SalesOrderHeader;

SELECT 
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END AS Region,
    YEAR(soh.OrderDate) AS OrderYear,
    MONTH(soh.OrderDate) AS OrderMonth,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON st.TerritoryID = soh.TerritoryID
WHERE soh.OrderDate >= '2023-01-01' AND soh.OrderDate <  '2025-01-01'
GROUP BY 
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END,
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate)
ORDER BY Region, OrderMonth ASC;
