-- Skapa databasen
CREATE DATABASE AnalyticsChallenge;
GO
USE AnalyticsChallenge;
GO

-- Skapa tabellen Orders
CREATE TABLE Orders (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Customer NVARCHAR(100) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL
);