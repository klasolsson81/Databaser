CREATE DATABASE Normalisering_Exercise;
GO
USE Normalisering_Exercise;
GO

-- 1. Kunder
CREATE TABLE Kunder (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Namn NVARCHAR(100) NOT NULL
);

-- 2. Produkter (Priset sparas här så det inte behöver upprepas i varje order)
CREATE TABLE Produkter (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Produktnamn NVARCHAR(100) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL
);

-- 3. Ordrar (Kopplar kunden till ett köptillfälle)
CREATE TABLE Ordrar (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    KundId INT NOT NULL,
    OrderDatum DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (KundId) REFERENCES Kunder(Id)
);

-- 4. Orderrader (Här sparas vad som köptes i varje order)
CREATE TABLE Orderrader (
    OrderId INT NOT NULL,
    ProduktId INT NOT NULL,
    Antal INT NOT NULL,
    PRIMARY KEY (OrderId, ProduktId),
    FOREIGN KEY (OrderId) REFERENCES Ordrar(Id),
    FOREIGN KEY (ProduktId) REFERENCES Produkter(Id)
);