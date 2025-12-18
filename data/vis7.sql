USE AdventureWorks2025;

SELECT TOP 5 * FROM Sales.SalesTerritory;
SELECT TOP 5 * FROM Sales.SalesOrderHeader;
SELECT TOP 5 * FROM Sales.Customer;
SELECT TOP 5 * FROM Sales.Store;

SELECT
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END AS Region,
    SUM(CASE 
            WHEN c.PersonID IS NOT NULL THEN soh.TotalDue 
            ELSE 0 
        END) / NULLIF(COUNT(CASE 
            WHEN c.PersonID IS NOT NULL THEN soh.SalesOrderID 
            ELSE NULL 
        END), 0) AS AvgIndividualOrderValue,
    SUM(CASE 
            WHEN c.StoreID IS NOT NULL THEN soh.TotalDue 
            ELSE 0 
        END) / NULLIF(COUNT(CASE 
            WHEN c.StoreID IS NOT NULL THEN soh.SalesOrderID 
            ELSE NULL 
        END), 0) AS AvgStoreOrderValue,
    SUM(soh.TotalDue) / NULLIF(COUNT(DISTINCT soh.SalesOrderID), 0) AS AvgTotalOrderValue
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON st.TerritoryID = soh.TerritoryID
LEFT JOIN Sales.Customer AS c
    ON soh.CustomerID = c.CustomerID
LEFT JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID
GROUP BY
    CASE
        WHEN st.CountryRegionCode = 'US'
            THEN CONCAT('US ',st.Name)
        ELSE st.Name
    END
ORDER BY AvgTotalOrderValue DESC;