USE Musikbiblioteket;
GO

-- Lägg in en artist
INSERT INTO Artist (Name) VALUES ('Metallica');

-- Lägg in två album (Metallica har Id 1)
INSERT INTO Album (Title, ArtistId) VALUES ('Master of Puppets', 1);
INSERT INTO Album (Title, ArtistId) VALUES ('Ride the Lightning', 1);

-- Lägg in låtar till album 1 (Master of Puppets)
INSERT INTO Track (Title, Length, AlbumId) VALUES 
('Battery', 312, 1),
('Master of Puppets', 515, 1),
('The Thing That Should Not Be', 396, 1),
('Welcome Home (Sanitarium)', 387, 1),
('Disposable Heroes', 497, 1),
('Leper Messiah', 340, 1); -- Totalt 6 låtar för att testa "fler än 5"

-- Lägg in låtar till album 2 (Ride the Lightning)
INSERT INTO Track (Title, Length, AlbumId) VALUES 
('Fight Fire with Fire', 284, 2),
('Ride the Lightning', 397, 2);

-- Lägg in en artist utan album för att testa Query 3
INSERT INTO Artist (Name) VALUES ('Ghost');