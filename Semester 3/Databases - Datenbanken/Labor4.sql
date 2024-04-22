/* 1 */

CREATE FUNCTION ValidateTelefon(@telefon varchar(50))
RETURNS BIT
AS
BEGIN
	DECLARE @valid BIT = 1;
	IF LEN(@telefon) != 10
		SET @valid = 0;
	RETURN @valid;
END
GO
Select * From Kunden

CREATE FUNCTION ValidateGender(@gender varchar(50))
RETURNS BIT
AS
BEGIN
	DECLARE @valid BIT = 1;
	IF @gender != 'F' AND @gender != 'M'
		SET @valid = 0;
	RETURN @valid;
END
GO

CREATE PROCEDURE InsertKunde
	@kundeId INT,
	@name VARCHAR(50),
	@vorname VARCHAR(50),
	@gender VARCHAR(50),
	@email VARCHAR(50),
	@telefonnummer VARCHAR(50),
	@adresse VARCHAR(50)

AS
BEGIN
	IF dbo.ValidateTelefon(@telefonnummer) = 0
	BEGIN
		PRINT 'Invalid Phone number!';
		RETURN;
	END

	IF dbo.ValidateGender(@gender) = 0
	BEGIN
		PRINT 'Invalid Gender!';
		RETURN;
	END


	INSERT INTO Kunden(KundeID, Name, Vorname, Gender, Email, Telefonnummer, Adresse)
	VALUES (@kundeId, @name, @vorname, @gender, @email, @telefonnummer, @adresse)

	PRINT 'Inserted Customer!';
END 
GO

EXEC InsertKunde
	@kundeID =707,
	@name = 'Peter',
	@vorname = 'Muller',
	@gender = 'X',
	@email = 'muller@gmail.com',
	@telefonnummer = '5550909232',
	@adresse = 'Berlin nr. 5'
	Select * From Kunden
	EXEC InsertKunde
	@kundeID =707,
	@name = 'Peter',
	@vorname = 'Muller',
	@gender = 'M',
	@email = 'muller@gmail.com',
	@telefonnummer = '555909232',
	@adresse = 'Berlin nr. 5'

	EXEC InsertKunde
	@kundeID =707,
	@name = 'Peter',
	@vorname = 'Muller',
	@gender = 'M',
	@email = 'muller@gmail.com',
	@telefonnummer = '5550909232',
	@adresse = 'Berlin nr. 5'
	Select * From Kunden

/* 2 */

CREATE OR ALTER FUNCTION BestellungenAusStadt(@stadt VARCHAR(50))
RETURNS TABLE 
AS
RETURN 
(
	SELECT B.KundeID, B.MitarbeiterID, B.SpracheID, B.Platzierungstag, B.Spezialität, K.Adresse
	FROM Bestellungen B JOIN Kunden K ON K.KundeID = B.KundeID
	WHERE K.Adresse LIKE '%' + @stadt +'%'
);
GO 

CREATE OR ALTER VIEW BestellungenMitPersonlicheAbholung AS
SELECT B.KundeID, B.MitarbeiterID, B.SpracheID, B.Platzierungstag, B.Spezialität, L.Typ
FROM  Bestellungen B JOIN ArtenDerLieferung L ON B.LieferungID = L.ID
WHERE L.Typ = 'Persönliche Abholung'

SELECT * FROM BestellungenAusStadt('Berlin')
SELECT * FROM BestellungenMitPersonlicheAbholung

SELECT S.KundeID, S.MitarbeiterID, S.Platzierungstag, S.Spezialität, S.SpracheID, S.Adresse AS KundeAdresse, P.Typ AS LieferungTyp FROM 
BestellungenAusStadt('Berlin') S JOIN BestellungenMitPersonlicheAbholung P ON S.KundeID = P.KundeID AND S.MitarbeiterID = P.MitarbeiterID AND S.SpracheID = P.SpracheID AND S.Platzierungstag = P.Platzierungstag AND S.Spezialität = P.Spezialität
