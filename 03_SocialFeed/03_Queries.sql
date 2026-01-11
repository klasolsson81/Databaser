USE SocialFeed;
GO

-- 1. Visar inlägg med antal likes
-- Vi använder LEFT JOIN för att få med även inlägg med 0 likes
SELECT 
    p.Content, 
    COUNT(pl.UserId) AS AntalLikes
FROM Post p
LEFT JOIN PostLike pl ON p.Id = pl.PostId
GROUP BY p.Id, p.Content;


-- 2. Hittar det mest gillade inlägget
SELECT TOP 1 
    p.Content, 
    COUNT(pl.UserId) AS AntalLikes
FROM Post p
JOIN PostLike pl ON p.Id = pl.PostId
GROUP BY p.Id, p.Content
ORDER BY AntalLikes DESC;


-- 3. Visar användare som inte skrivit något (GhostUser)
SELECT u.Username
FROM UserAccount u
LEFT JOIN Post p ON u.Id = p.UserId
WHERE p.Id IS NULL;


-- 4. Visar användare som gillar sina egna inlägg
-- Vi kopplar ihop likes med inlägg och kollar om UserId är samma på båda
SELECT DISTINCT u.Username
FROM UserAccount u
JOIN Post p ON u.Id = p.UserId
JOIN PostLike pl ON p.Id = pl.PostId
WHERE pl.UserId = u.Id;


-- 5. Visar inlägg som saknar likes
SELECT Content 
FROM Post 
WHERE Id NOT IN (SELECT PostId FROM PostLike);