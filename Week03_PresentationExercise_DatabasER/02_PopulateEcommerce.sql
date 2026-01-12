USE EHandel;
GO

-- Lägg in användare
INSERT INTO Anvandare (Namn, Epost) VALUES 
('Klas Olsson', 'klas@test.se'),
('Anna Bok', 'anna@test.se');

-- Lägg in produkter
INSERT INTO Produkter (Produktnamn, Pris) VALUES 
('Gamingmus G-Pro', 899.00),
('Mekaniskt Tangentbord', 1299.00);

-- Lägg in recensioner
-- Klas recenserar musen och tangentbordet
INSERT INTO Recensioner (Betyg, Kommentar, UserId, ProductId) VALUES 
(5, 'Bästa musen jag ägt!', 1, 1),
(4, 'Bra klick, men lite dyr.', 1, 2);

-- Anna recenserar musen
INSERT INTO Recensioner (Betyg, Kommentar, UserId, ProductId) VALUES 
(2, 'För liten för mina händer.', 2, 1);