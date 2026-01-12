CREATE DATABASE EHandel;
GO
USE EHandel;
GO

-- Skapa tabellen Användare
CREATE TABLE Anvandare (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Namn NVARCHAR(100) NOT NULL,
    Epost NVARCHAR(150) NOT NULL UNIQUE
);

-- Skapa tabellen Produkter
CREATE TABLE Produkter (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Produktnamn NVARCHAR(150) NOT NULL,
    Pris DECIMAL(10, 2) NOT NULL
);

-- Skapa tabellen Recensioner (Kopplingstabellen)
CREATE TABLE Recensioner (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Betyg INT CHECK (Betyg BETWEEN 1 AND 5), -- Begränsa betyg 1-5
    Kommentar NVARCHAR(MAX),
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    -- Här skapar vi relationerna (pilar i diagrammet)
    FOREIGN KEY (UserId) REFERENCES Anvandare(Id),
    FOREIGN KEY (ProductId) REFERENCES Produkter(Id)
);