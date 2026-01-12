-- Skapa databasen
CREATE DATABASE Hogwarts;
GO
USE Hogwarts;
GO

-- 1. Tabell för studenter
CREATE TABLE Student (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL
);

-- 2. Tabell för kurser
CREATE TABLE Course (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) UNIQUE NOT NULL -- Namnet måste vara unikt
);

-- 3. Kopplingstabell för inskrivningar (Many-to-Many)
CREATE TABLE Enrollment (
  StudentId INT NOT NULL,
  CourseId INT NOT NULL,
  PRIMARY KEY (StudentId, CourseId), -- Hindrar en student från att gå samma kurs två gånger
  FOREIGN KEY (StudentId) REFERENCES Student(Id),
  FOREIGN KEY (CourseId) REFERENCES Course(Id)
);