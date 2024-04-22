/* 3 */
CREATE TABLE Logs (
    ID INT PRIMARY KEY IDENTITY(1,1),
    EventTime DATETIME,
    OperationType CHAR(1),
    TableNameAffected VARCHAR(50),
    RowsAffected INT
);
GO

CREATE OR ALTER TRIGGER KundenTrigger
ON Kunden
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
    DECLARE @OperationType CHAR(1);
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @OperationType = 'U'; 
        ELSE
            SET @OperationType = 'I';
    END
    ELSE
        SET @OperationType = 'D';

    DECLARE @RowsAffected INT;
    
    IF @OperationType = 'I'
        SET @RowsAffected = (SELECT COUNT(*) FROM inserted);
    ELSE IF @OperationType = 'U'
        SET @RowsAffected = (SELECT COUNT(*) FROM deleted);
    ELSE IF @OperationType = 'D'
        SET @RowsAffected = (SELECT COUNT(*) FROM deleted);

    INSERT INTO Logs(EventTime, OperationType, TableNameAffected, RowsAffected)
    VALUES(GETDATE(), @OperationType, 'Kunden', @RowsAffected);
END;

select * from Logs
Select * from kunden 
INSERT INTO Kunden(KundeID, Name, Vorname, Gender, Email, Telefonnummer, Adresse)
VALUES (700,'Muller', 'Mike', 'M', ' mikem@gmail.com', 555234321, 'Berlin nr. 88'),
(710,'Muller', 'Mike', 'M', ' mikem@gmail.com', 555234321, 'Berlin nr. 88');

UPDATE Kunden
SET Name = 'Johannes'



DELETE FROM Kunden WHERE KundeID = 707 OR KundeID = 710;

DELETE FROM Kunden WHERE KundeID = 700;

SELECT * FROM Logs

DROP TABLE Logs

/* 4 */

CREATE PROCEDURE modifyAnerkennung
	@MitarbeiterID INT,
	@SpracheID INT,
	@Spezialität VARCHAR(50)

AS
BEGIN
	DECLARE @Niveau VARCHAR(2)

	SELECT @Niveau = Niveau
	FROM Lizenzen
	WHERE MitarbeiterID = @MitarbeiterID 
		AND SpracheID = @SpracheID 
		AND Spezialität = @Spezialität

	IF @Niveau LIKE 'C_'
	BEGIN
		UPDATE Lizenzen
		SET Anerkennung = 'global'
		WHERE MitarbeiterID = @MitarbeiterID 
			AND SpracheID = @SpracheID 
			AND Spezialität = @Spezialität
		
		PRINT 'Lizenz von Mitarbeiter mit MitarbeiterID ' + CAST(@MitarbeiterID AS NVARCHAR(50)) + ' mit SpracheID ' + CAST(@SpracheID AS NVARCHAR(50)) + ' mit Spezialität ' + CAST(@Spezialität AS NVARCHAR(50)) + ' hat jetzt Anerkennung: global. ' 
	END;
END;
GO

DECLARE @MitarbeiterID INT, @SpracheID INT, @Spezialität VARCHAR(50)

DECLARE LizenzenCursor CURSOR FOR
SELECT MitarbeiterID, SpracheID, Spezialität
FROM Lizenzen

OPEN LizenzenCursor;

FETCH NEXT FROM LizenzenCursor INTO @MitarbeiterID, @SpracheID, @Spezialität

WHILE @@FETCH_STATUS = 0 
BEGIN
	EXEC modifyAnerkennung @MitarbeiterID, @SpracheID, @Spezialität
	FETCH NEXT FROM LizenzenCursor INTO @MitarbeiterID, @SpracheID, @Spezialität
END;

CLOSE LizenzenCursor;
DEALLOCATE LizenzenCursor;

SELECT * FROM Lizenzen;

DROP PROCEDURE modifyAnerkennung
