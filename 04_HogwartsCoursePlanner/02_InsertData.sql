USE Hogwarts;
GO

-- Lägg in 5 elever
INSERT INTO Student (Name) VALUES ('Harry Potter'), ('Hermione Granger'), ('Ron Weasley'), ('Draco Malfoy'), ('Neville Longbottom');

-- Lägg in 3 kurser
INSERT INTO Course (Name) VALUES ('Potions'), ('Charms'), ('Defense Against the Dark Arts');

-- Registrera elever på kurser
-- Hermione går på allt
INSERT INTO Enrollment (StudentId, CourseId) VALUES (2, 1), (2, 2), (2, 3);
-- Harry och Ron går på Potions och Defense
INSERT INTO Enrollment (StudentId, CourseId) VALUES (1, 1), (1, 3), (3, 1), (3, 3);
-- Draco går bara på Potions
INSERT INTO Enrollment (StudentId, CourseId) VALUES (4, 1);

-- Notera: Neville (Id 5) har inga kurser. 
-- Inga elever är registrerade på 'Charms' förutom Hermione.