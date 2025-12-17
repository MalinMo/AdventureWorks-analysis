USE AdventureWorks2025;

SELECT TOP 5 * FROM  Production.ProductCategory;
SELECT TOP 5 * FROM  Production.ProductSubcategory;
SELECT TOP 5 * FROM  Production.Product;

SELECT
    COALESCE(pc.Name, 'Okänd kategori') AS Category,
    COUNT(DISTINCT p.ProductID) AS ProductCount
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY COALESCE(pc.Name, 'Okänd kategori')
ORDER BY ProductCount DESC;