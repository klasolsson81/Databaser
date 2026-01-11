-- Skapa databasen
CREATE DATABASE SocialFeed;
GO
USE SocialFeed;
GO

-- 1. Tabell för användare
CREATE TABLE UserAccount (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Username NVARCHAR(50) NOT NULL UNIQUE -- UNIQUE gör att två inte kan ha samma namn
);

-- 2. Tabell för inlägg
CREATE TABLE Post (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  UserId INT NOT NULL,
  Content NVARCHAR(500) NOT NULL,
  FOREIGN KEY (UserId) REFERENCES UserAccount(Id)
);

-- 3. Tabell för likes (Många-till-många)
CREATE TABLE PostLike (
  UserId INT NOT NULL,
  PostId INT NOT NULL,
  PRIMARY KEY (UserId, PostId), -- En användare kan bara gilla ett inlägg en gång
  FOREIGN KEY (UserId) REFERENCES UserAccount(Id),
  FOREIGN KEY (PostId) REFERENCES Post(Id)
);