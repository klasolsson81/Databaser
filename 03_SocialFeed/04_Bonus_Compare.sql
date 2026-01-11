USE SocialFeed;
GO

-- Alternativ 1: Med JOIN
-- Vi "tittar" på alla kopplingar och filtrerar bort de som hittades
SELECT p.Content
FROM Post p
LEFT JOIN PostLike pl ON p.Id = pl.PostId
WHERE pl.PostId IS NULL;

-- Alternativ 2: Med EXISTS (Ofta mer effektivt i stora databaser)
-- För varje inlägg körs en snabb koll: "Finns det NÅGON like för detta ID?"
SELECT p.Content
FROM Post p
WHERE NOT EXISTS (
    SELECT 1 
    FROM PostLike pl 
    WHERE pl.PostId = p.Id
);