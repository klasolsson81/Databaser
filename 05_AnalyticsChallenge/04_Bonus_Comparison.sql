USE AnalyticsChallenge;
GO

-- Sätt 1: Med Subquery (Lättast att läsa)
SELECT Customer, AVG(Price) as Snitt
FROM Orders
GROUP BY Customer
HAVING AVG(Price) > (SELECT AVG(Price) FROM Orders);

-- Sätt 2: Med en Window Function i en CTE (Common Table Expression)
-- Detta är ofta mer effektivt i SQL Server
WITH AverageData AS (
    SELECT 
        Customer, 
        Price, 
        AVG(Price) OVER() AS GlobalAverage -- Räknar ut totalen direkt
    FROM Orders
)
SELECT Customer, AVG(Price) as Snitt
FROM AverageData
GROUP BY Customer, GlobalAverage
HAVING AVG(Price) > GlobalAverage;