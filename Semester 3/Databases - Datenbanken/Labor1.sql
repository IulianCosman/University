/* 1a */

CREATE TABLE FeedbackKunden(
	KundeID INT NOT NULL FOREIGN KEY REFERENCES Kunden(KundeID),
	Datum DATE NOT NULL,
	Angaben VARCHAR(50)
	
	CONSTRAINT PK_FeedbackKunden PRIMARY KEY(KundeID, Datum)
);	
CREATE TABLE FeedbackMitarbeiter(
	MitarbeiterID INT NOT NULL FOREIGN KEY REFERENCES Mitarbeiter(MitarbeiterID),
	Datum DATE NOT NULL,
	Angaben VARCHAR(50)
	
	CONSTRAINT PK_FeedbackMitarbeiter PRIMARY KEY(MitarbeiterID, Datum) 
);

/* 1b */

INSERT INTO FeedbackKunden(KundeID, Datum, Angaben) 
VALUES
	(201, '2023-03-03', 'sehr gut'),
	(202, '2023-03-04', 'ganz gut'),
	(201, '2023-04-03', 'gut immer'),
	(208, '2023-05-03', 'billig'),
	(205, '2022-02-09', 'schnell'),
	(205, '2022-08-09', 'wow');

INSERT INTO FeedbackMitarbeiter(MitarbeiterID, Datum, Angaben) 
VALUES
	(118, '2023-03-03', 'gut Gehalt'),
	(101, '2023-04-03', 'immer mit Spaß arbeiten'),
	(118, '2023-04-03', 'viel Freizeit'),
	(108, '2023-05-03', 'sympatische Mitarbeiter'),
	(112, '2022-02-09', 'Teamarbeit ist wichtig');

/* 1c */

INSERT INTO FeedbackMitarbeiter(MitarbeiterID, Datum, Angaben) 
VALUES
	(105, '2022-08-09', 'keine Sorgen'); 

/* 1d zusammengesetzte Bedingung (ÄNDERN)*/

UPDATE ArtenDerLieferung
SET Sicherheit = 'nicht so gut'
WHERE Dauer < 5 AND Preis <10 AND Typ != 'Persönliche Abholung'

/* Putting the original values back */
 
UPDATE ArtenDerLieferung
SET Sicherheit = 'gut'
WHERE Dauer < 5 AND Preis <10 AND Typ != 'Persönliche Abholung'

/* 1d zusammengesetzte Bedingung (LÖSCHEN)*/

DELETE FROM Bestellungen
WHERE SpracheID = 12 AND SeitenAnzahl > 100

/* Putting the original values back */

INSERT INTO Bestellungen(KundeID, MitarbeiterID, SpracheID, Platzierungstag, Spezialität, Endtermin, SeitenAnzahl, LieferungID)
VALUES
	(201, 112, 12, '2023-10-02', 'Übersetzungen', '2023-10-20', 122, 2)

/* 1d IS NULL (ÄNDERN) */

UPDATE Bildung
SET TeilnahmeKonferenzen = 'keine'
WHERE TeilnahmeKonferenzen IS NULL

/* Putting the original values back */

UPDATE Bildung
SET TeilnahmeKonferenzen =  NULL
WHERE TeilnahmeKonferenzen = 'keine'

/* 1d IS NULL (LÖSCHEN) */

DELETE FROM Bestellungen
WHERE Spezialität = 'Äquivalenz'

/* Putting the original values back */

INSERT INTO Bestellungen(KundeID, MitarbeiterID, SpracheID, Platzierungstag, Spezialität, Endtermin, SeitenAnzahl, LieferungID)
VALUES
	(207, 109, 6, '2023-09-24', 'Äquivalenz', '2023-10-02', 2, 8)

/* 1d IN (ÄNDERN) */

UPDATE Kunden
SET Email = 'polizei@gmail.com'
WHERE Telefonnummer IN (911, 112)

/* Putting the original values back */

UPDATE Kunden
SET Email = 'crrrr@gmail.com'
WHERE Email = 'polizei@gmail.com'

/* 1d IN (LÖSCHEN) */

DELETE FROM Kunden
WHERE Telefonnummer IN (911, 112)

/* Putting the original values back */

INSERT INTO Kunden(KundeID, Name, Vorname, Gender, Email, Telefonnummer, Adresse)
VALUES
	(208, 'Craig', 'Mary', 'F', 'crrrr@gmail.com', 911, 'Amsterdam nr. 2')
	
/* 1d BETWEEN (ÄNDERN) */

UPDATE Bestellungen
SET LieferungID = 5
WHERE SeitenAnzahl BETWEEN 20 AND 100

/* Putting the original values back */

UPDATE Bestellungen
SET LieferungID = 2
WHERE SeitenAnzahl BETWEEN 20 AND 100

/* 1d BETWEEN (LÖSCHEN) */

DELETE FROM Bestellungen
WHERE SeitenAnzahl BETWEEN 20 AND 100

/* Putting the original values back */

INSERT INTO Bestellungen(KundeID, MitarbeiterID, SpracheID, Platzierungstag, Spezialität, Endtermin, SeitenAnzahl, LieferungID)
VALUES
	(206, 113, 7, '2023-09-19', 'Interpretation', '2023-10-21', 22, 2),
	(204, 108, 12, '2023-10-11', 'Übersetzungen', '2023-10-28', 44, 2)

/* 1d LIKE (ÄNDERN) */

UPDATE Kunden
SET Email = NULL
WHERE EMAIL LIKE '%@yahoo.com'

/* Putting the original values back */

UPDATE Kunden
SET Email = 'gi..gg@yahoo.com'
WHERE KundeID = 202

UPDATE Kunden
SET Email = 'ow.ow@yahoo.com'
WHERE KundeID = 206

/* 1d LIKE (LÖSCHEN) */

DELETE FROM Bestellungen
WHERE Endtermin LIKE '2024%'

/* Putting the original values back */

INSERT INTO Bestellungen(KundeID, MitarbeiterID, SpracheID, Platzierungstag, Spezialität, Endtermin, SeitenAnzahl, LieferungID)
VALUES
	(202, 113, 3, '2023-10-03', 'Übersetzungen', '2024-10-25', 12, 3),
	(205, 107, 8, '2023-09-22', 'Legalisierung', '2024-10-24', 13, 1)

