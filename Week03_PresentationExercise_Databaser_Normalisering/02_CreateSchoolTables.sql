USE Normalisering_Exercise;
GO

-- 1. Skapa tabell för Lärare
CREATE TABLE Larare (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Namn NVARCHAR(100) NOT NULL
);

-- 2. Skapa tabell för Klasser (En lärare per klass i detta exempel)
CREATE TABLE Klasser (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Klassnamn NVARCHAR(50) NOT NULL,
    LararId INT NOT NULL,
    FOREIGN KEY (LararId) REFERENCES Larare(Id)
);

-- 3. Skapa tabell för Elever
CREATE TABLE Elever (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Namn NVARCHAR(100) NOT NULL,
    KlassId INT NOT NULL,
    FOREIGN KEY (KlassId) REFERENCES Klasser(Id)
);

-- 4. Skapa tabell för Betyg
CREATE TABLE Betyg (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ElevId INT NOT NULL,
    Kursnamn NVARCHAR(100) NOT NULL,
    Betygsvarde NVARCHAR(2) NOT NULL, -- T.ex. 'A', 'B', 'C'
    FOREIGN KEY (ElevId) REFERENCES Elever(Id)
);