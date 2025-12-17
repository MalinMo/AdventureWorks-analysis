USE AdventureWorks2025;

SELECT TOP 5 * FROM  Sales.SalesTerritory;
SELECT TOP 5 * FROM  Sales.SalesOrderHeader;
SELECT TOP 5 * FROM  Sales.Customer;

SELECT
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END AS Region,
    COUNT(DISTINCT c.CustomerID) AS UniqueCustomers,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON st.TerritoryID = soh.TerritoryID
LEFT JOIN Sales.Customer AS c
    ON soh.CustomerID = c.CustomerID
GROUP BY
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END
ORDER BY TotalSales DESC;