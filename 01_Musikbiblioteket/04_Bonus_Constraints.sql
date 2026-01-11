USE Musikbiblioteket;
GO

-- Bonus: Lägg in en regel att en låt måste vara minst 10 sekunder
ALTER TABLE Track
ADD CONSTRAINT CHK_Track_Length_Min CHECK (Length >= 10);