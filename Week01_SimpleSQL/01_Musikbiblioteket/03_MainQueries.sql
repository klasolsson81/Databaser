USE Musikbiblioteket;
GO

-- A. Visar alla låtar med tillhörande album och artist
-- Här använder vi INNER JOIN för att koppla ihop de tre tabellerna
SELECT 
    t.Title AS Låt, 
    alb.Title AS Album, 
    art.Name AS Artist
FROM Track t
JOIN Album alb ON t.AlbumId = alb.Id
JOIN Artist art ON alb.ArtistId = art.Id;


-- B. Hittar det längsta albumet baserat på total speltid
-- Vi summerar längden, grupperar per album och sorterar fallande
SELECT TOP 1 
    alb.Title, 
    SUM(t.Length) AS TotalSpeltidSekunder
FROM Album alb
JOIN Track t ON alb.Id = t.AlbumId
GROUP BY alb.Title
ORDER BY TotalSpeltidSekunder DESC;


-- C. Visar artister som saknar album
-- Vi använder LEFT JOIN och letar efter där Album.Id är NULL (tomt)
SELECT art.Name
FROM Artist art
LEFT JOIN Album alb ON art.Id = alb.ArtistId
WHERE alb.Id IS NULL;


-- D. Visar album som har fler än 5 låtar
-- Vi använder HAVING eftersom vi filtrerar på resultatet av en mängdfunktion (COUNT)
SELECT 
    alb.Title, 
    COUNT(t.Id) AS AntalLåtar
FROM Album alb
JOIN Track t ON alb.Id = t.AlbumId
GROUP BY alb.Title
HAVING COUNT(t.Id) > 5;