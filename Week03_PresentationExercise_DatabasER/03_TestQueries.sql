USE EHandel;
GO

-- A. Visa alla recensioner med Användarnamn och Produktnamn
SELECT 
    a.Namn AS Kund, 
    p.Produktnamn AS Produkt, 
    r.Betyg, 
    r.Kommentar
FROM Recensioner r
JOIN Anvandare a ON r.UserId = a.Id
JOIN Produkter p ON r.ProductId = p.Id;


-- B. Räkna ut genomsnittligt betyg för varje produkt
SELECT 
    p.Produktnamn, 
    AVG(CAST(r.Betyg AS DECIMAL)) AS SnittBetyg
FROM Produkter p
JOIN Recensioner r ON p.Id = r.ProductId
GROUP BY p.Produktnamn;


-- C. Hitta alla recensioner som en specifik användare har skrivit (t.ex. Klas)
SELECT p.Produktnamn, r.Betyg, r.Kommentar
FROM Recensioner r
JOIN Produkter p ON r.ProductId = p.Id
WHERE r.UserId = 1; -- Klas har Id 1