-- Skapa en ny databas för spelbutiken
CREATE DATABASE GameStore;
GO
USE GameStore;
GO

-- Skapa tabellen Game
CREATE TABLE Game (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Title NVARCHAR(150) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL -- DECIMAL är standard för pengar i .NET/SQL
);

-- Skapa tabellen Sale
CREATE TABLE Sale (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  GameId INT NOT NULL,
  Quantity INT NOT NULL,
  SaleDate DATETIME DEFAULT GETDATE(), -- Bra att ha med när försäljningen skedde
  FOREIGN KEY (GameId) REFERENCES Game(Id)
);

-- Tabell för att logga försäljningar (används i bonus-triggern)
CREATE TABLE SaleLog (
    LogId INT IDENTITY(1,1) PRIMARY KEY,
    Message NVARCHAR(255),
    LogDate DATETIME DEFAULT GETDATE()
);