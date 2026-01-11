-- 1. Skapa databasen
CREATE DATABASE Musikbiblioteket;
GO

-- Använd den nyskapade databasen
USE Musikbiblioteket;
GO

-- 2. Skapa tabellen Artist
CREATE TABLE Artist (
  Id INT IDENTITY(1,1) PRIMARY KEY, 
  Name NVARCHAR(100) NOT NULL
);

-- 3. Skapa tabellen Album
CREATE TABLE Album (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Title NVARCHAR(150) NOT NULL,
  ArtistId INT,
  FOREIGN KEY (ArtistId) REFERENCES Artist(Id)
);

-- 4. Skapa tabellen Track
CREATE TABLE Track (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Title NVARCHAR(150) NOT NULL,
  Length INT,
  AlbumId INT,
  FOREIGN KEY (AlbumId) REFERENCES Album(Id)
);