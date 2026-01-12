USE GameStore;
GO

-- Lägg in 5 spel
INSERT INTO Game (Title, Price) VALUES 
('Elden Ring', 599.00),
('Stardew Valley', 149.00),
('Cyberpunk 2077', 499.00),
('Minecraft', 250.00),
('Hollow Knight', 150.00); -- Detta spel lämnar vi utan försäljning

-- Lägg in 10 försäljningar
INSERT INTO Sale (GameId, Quantity) VALUES 
(1, 1), (1, 1), -- Elden Ring
(2, 2), (2, 3), -- Stardew Valley
(3, 1),         -- Cyberpunk
(4, 5), (4, 2), -- Minecraft
(1, 1), (3, 1), (2, 1);