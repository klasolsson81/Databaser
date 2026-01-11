USE AnalyticsChallenge;
GO

-- 1. Hittar kunder med högre snittköp än hela "klassens" (butikens) medel
-- Vi använder en subquery i HAVING för att jämföra gruppens snitt mot totalen
SELECT Customer, AVG(Price) AS KundSnitt
FROM Orders
GROUP BY Customer
HAVING AVG(Price) > (SELECT AVG(Price) FROM Orders);


-- 2. Listar de tre största ordrarna
SELECT TOP 3 Customer, Price
FROM Orders
ORDER BY Price DESC;


-- 3. Visar varje order med rank (Window Function)
-- RANK() ger samma nummer vid oavgjort och hoppar sedan över nästa steg
SELECT 
    Id, 
    Customer, 
    Price,
    RANK() OVER (ORDER BY Price DESC) AS OrderRank
FROM Orders;


-- 4. Hittar kunder som bara gjort en enda order
SELECT Customer
FROM Orders
GROUP BY Customer
HAVING COUNT(Id) = 1;


-- 5. Visar ordrar som är större än just den kundens eget medelvärde
-- Detta är en "Correlated Subquery" - den inre frågan körs för varje rad i den yttre
SELECT o1.Id, o1.Customer, o1.Price
FROM Orders o1
WHERE o1.Price > (
    SELECT AVG(o2.Price) 
    FROM Orders o2 
    WHERE o2.Customer = o1.Customer
);