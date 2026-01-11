USE SocialFeed;
GO

-- Lägg in användare
INSERT INTO UserAccount (Username) VALUES ('Alice'), ('Bob'), ('Charlie'), ('GhostUser');

-- Lägg in inlägg
INSERT INTO Post (UserId, Content) VALUES 
(1, 'Hej världen!'),       -- Id 1 (Alice)
(1, 'Min andra post'),     -- Id 2 (Alice)
(2, 'SQL är kul!'),        -- Id 3 (Bob)
(3, 'Någon som ser detta?'); -- Id 4 (Charlie)

-- Lägg in likes
INSERT INTO PostLike (UserId, PostId) VALUES 
(2, 1), -- Bob gillar Alice inlägg
(3, 1), -- Charlie gillar Alice inlägg
(1, 1), -- Alice gillar sitt eget inlägg (viktigt för Query 4!)
(1, 3); -- Alice gillar Bobs inlägg

-- Notera: Post 2 och 4 har inga likes. GhostUser har inga inlägg.