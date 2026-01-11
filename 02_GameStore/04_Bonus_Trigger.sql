USE GameStore;
GO

-- Skapa triggern
CREATE TRIGGER trg_AfterSaleInsert
ON Sale
AFTER INSERT
AS
BEGIN
    -- 'inserted' är en virtuell tabell som innehåller raden som precis skapades
    INSERT INTO SaleLog (Message)
    SELECT 'En ny försäljning registrerades: Spel-ID ' + CAST(GameId AS NVARCHAR) + ', Antal: ' + CAST(Quantity AS NVARCHAR)
    FROM inserted;
END;
GO

-- TESTA TRIGGERN:
-- Kör denna rad och kolla sedan i SaleLog-tabellen!
-- INSERT INTO Sale (GameId, Quantity) VALUES (1, 1);
-- SELECT * FROM SaleLog;