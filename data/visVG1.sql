USE AdventureWorks2025;

SELECT TOP 5 * FROM Sales.SalesTerritory;
SELECT TOP 5 * FROM Sales.SalesOrderHeader;

SELECT
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END AS Region,
    SUM(soh.TotalDue) AS TotalSales,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(soh.TotalDue) / NULLIF(COUNT(DISTINCT soh.SalesOrderID), 0) AS AvgTotalOrderValue
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON st.TerritoryID = soh.TerritoryID
GROUP BY
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END
ORDER BY AvgTotalOrderValue DESC;