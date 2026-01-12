USE GameStore;
GO

-- 1. Räknar ut total försäljning (pengar) per spel
SELECT 
    g.Title, 
    SUM(s.Quantity * g.Price) AS TotalOmsättning
FROM Game g
JOIN Sale s ON g.Id = s.GameId
GROUP BY g.Title;


-- 2. Visar spel som sålt för mer än 500 kr totalt
SELECT 
    g.Title, 
    SUM(s.Quantity * g.Price) AS TotalOmsättning
FROM Game g
JOIN Sale s ON g.Id = s.GameId
GROUP BY g.Title
HAVING SUM(s.Quantity * g.Price) > 500;


-- 3. Tar fram spelet som sålt mest (antal enheter)
SELECT TOP 1 
    g.Title, 
    SUM(s.Quantity) AS AntalSålda
FROM Game g
JOIN Sale s ON g.Id = s.GameId
GROUP BY g.Title
ORDER BY AntalSålda DESC;


-- 4. Visar spel som aldrig sålts
-- Här använder vi en subquery (eller en LEFT JOIN med NULL-koll)
SELECT Title 
FROM Game 
WHERE Id NOT IN (SELECT DISTINCT GameId FROM Sale);


-- 5. Räknar ut butikens totala omsättning (allt som sålts)
SELECT SUM(s.Quantity * g.Price) AS ButikensTotalaOmsättning
FROM Sale s
JOIN Game g ON s.GameId = g.Id;