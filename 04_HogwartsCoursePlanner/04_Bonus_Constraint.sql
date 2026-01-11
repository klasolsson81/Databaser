USE Hogwarts;
GO

-- Bonus: Skapa en regel att en student max får läsa 5 kurser
CREATE TRIGGER trg_LimitEnrollment
ON Enrollment
INSTEAD OF INSERT -- Vi "stoppar" insättningen för att kontrollera regeln först
AS
BEGIN
    IF EXISTS (
        SELECT StudentId 
        FROM Enrollment 
        WHERE StudentId IN (SELECT StudentId FROM inserted)
        GROUP BY StudentId 
        HAVING COUNT(*) >= 5
    )
    BEGIN
        RAISERROR ('En student får inte vara registrerad på fler än 5 kurser.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Enrollment (StudentId, CourseId)
        SELECT StudentId, CourseId FROM inserted;
    END
END;