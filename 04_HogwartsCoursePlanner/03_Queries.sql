USE Hogwarts;
GO

-- 1. Visar alla studenter och deras kurser
SELECT s.Name AS Student, c.Name AS Kurs
FROM Student s
JOIN Enrollment e ON s.Id = e.StudentId
JOIN Course c ON e.CourseId = c.Id;


-- 2. Hittar kurser som är "fulla" (maxgräns 3 studenter)
SELECT c.Name, COUNT(e.StudentId) AS AntalStudenter
FROM Course c
JOIN Enrollment e ON c.Id = e.CourseId
GROUP BY c.Id, c.Name
HAVING COUNT(e.StudentId) >= 3;


-- 3. Visar studenter utan kursval
SELECT s.Name
FROM Student s
LEFT JOIN Enrollment e ON s.Id = e.StudentId
WHERE e.StudentId IS NULL;


-- 4. Visar kurser som ingen valt (om vi hade lagt till en extra kurs som ingen tog)
SELECT c.Name
FROM Course c
LEFT JOIN Enrollment e ON c.Id = e.CourseId
WHERE e.CourseId IS NULL;


-- 5. Tar fram de tre populäraste kurserna
SELECT TOP 3 c.Name, COUNT(e.StudentId) AS AntalStudenter
FROM Course c
LEFT JOIN Enrollment e ON c.Id = e.CourseId
GROUP BY c.Id, c.Name
ORDER BY AntalStudenter DESC;