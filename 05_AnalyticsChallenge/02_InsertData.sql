USE AnalyticsChallenge;
GO

INSERT INTO Orders (Customer, Price) VALUES 
('Alice', 500.00), ('Alice', 1500.00), -- Alice snitt: 1000
('Bob', 200.00),                      -- Bob snitt: 200
('Charlie', 3000.00), ('Charlie', 1000.00), -- Charlie snitt: 2000
('David', 50.00), ('David', 100.00), ('David', 150.00), -- David snitt: 100
('Eve', 2500.00), 
('Frank', 800.00);

-- Totalt medelvärde för alla ordrar: ~1080 kr