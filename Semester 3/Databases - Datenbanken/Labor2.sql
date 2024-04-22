
/*OK 1- AGGREGATFUNKTION, 1- GROUP BY, 1- HAVING, 1- ORDER BY */

SELECT Spezialität, COUNT(MitarbeiterID) as AnzahlMitarbeiter 
FROM Lizenzen
GROUP BY Spezialität
HAVING COUNT(MitarbeiterID) > 5	
ORDER BY COUNT(MitarbeiterID) DESC

/*EDITED 1- JOIN, 1-GROUP BY, 2-AGGREGATFUNKTION */

SELECT Kontinente.KontinentID, COUNT(Sprachen.SpracheID) AS AnzahlSprachen , SUM(Sprachen.MillionenMuttersprachler + Sprachen.MillionenZweitsprachigeSprecher) AS MillionenSprecher
FROM Kontinente 
INNER JOIN Sprachfamilien ON Sprachfamilien.KontinentID = Kontinente.KontinentID
INNER JOIN Sprachen ON Sprachen.SprachfamilieID = Sprachfamilien.SprachfamilieID
GROUP BY Kontinente.KontinentID

/*OK 1- JOIN, 1- DISTINCT, 1- WHERE */

SELECT DISTINCT Mitarbeiter.Name, Mitarbeiter.Vorname FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Bestellungen ON Bestellungen.MitarbeiterID = Lizenzen.MitarbeiterID AND Bestellungen.Spezialität = Lizenzen.Spezialität AND Lizenzen.SpracheID = Bestellungen.SpracheID
WHERE Bestellungen.SeitenAnzahl > 40


/*OK 1- JOIN, 1- WHERE, 1- ORDER BY, 1- TOP */

SELECT TOP 2 Mitarbeiter.Name, Mitarbeiter.Vorname,Bestellungen.Endtermin, Bestellungen.SeitenAnzahl, Kunden.Name, Kunden.Vorname FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Bestellungen ON Bestellungen.MitarbeiterID = Lizenzen.MitarbeiterID AND Bestellungen.Spezialität = Lizenzen.Spezialität AND Lizenzen.SpracheID = Bestellungen.SpracheID
INNER JOIN Kunden ON Kunden.KundeID = Bestellungen.KundeID
WHERE Bestellungen.Endtermin = '2023-10-20'
ORDER BY Bestellungen.SeitenAnzahl DESC

/*OK 2- JOIN, 2- WHERE, 1- INTERSECT  */

SELECT Mitarbeiter.Name, Mitarbeiter.Vorname, Sprachen.Name, Sprachen.MillionenMuttersprachler, Sprachen.MillionenZweitsprachigeSprecher FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Sprachen ON Lizenzen.SpracheID = Sprachen.SpracheID
WHERE Sprachen.MillionenMuttersprachler > 100
INTERSECT
SELECT Mitarbeiter.Name, Mitarbeiter.Vorname, Sprachen.Name, Sprachen.MillionenMuttersprachler, Sprachen.MillionenZweitsprachigeSprecher FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Sprachen ON Lizenzen.SpracheID = Sprachen.SpracheID
WHERE Sprachen.MillionenZweitsprachigeSprecher > 200

/*OK 2- JOIN, 3- WHERE, 1-IN, 1- EXCEPT */

SELECT Mitarbeiter.Name, Mitarbeiter.Vorname, Sprachen.Name, Lizenzen.Niveau FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Sprachen ON Lizenzen.SpracheID = Sprachen.SpracheID
WHERE Lizenzen.Niveau LIKE 'C_'
EXCEPT
SELECT Mitarbeiter.Name, Mitarbeiter.Vorname, Sprachen.Name, Lizenzen.Niveau FROM Mitarbeiter
INNER JOIN Lizenzen ON Lizenzen.MitarbeiterID = Mitarbeiter.MitarbeiterID
INNER JOIN Sprachen ON Lizenzen.SpracheID = Sprachen.SpracheID
WHERE Sprachen.SpracheID IN
(SELECT Sprachen.SpracheID FROM Sprachen
INNER JOIN Sprachfamilien ON Sprachfamilien.SprachfamilieID = Sprachen.SprachfamilieID
WHERE Sprachfamilien.Name =  'Indogermanisch')

/*EDITED 1- HAVING, 1-GROUP BY, 1- ANY, 1- WHERE */

SELECT Anerkennung, COUNT(MitarbeiterID) AS AnzahlLizenzen
FROM Lizenzen 
WHERE 'global' = ANY
(SELECT Anerkennung
FROM Lizenzen)
GROUP BY Anerkennung
HAVING COUNT(MitarbeiterID) > 7


/*OK 2- WHERE, 2- ALL, 1- UNION */

SELECT Name, TiefsterPunkt, MinimaleHöhe, HöchsterPunkt, MaximaleHöhe FROM Kontinente
WHERE MinimaleHöhe <= ALL
(SELECT MinimaleHöhe
FROM Kontinente)
UNION
SELECT Name, TiefsterPunkt, MinimaleHöhe, HöchsterPunkt, MaximaleHöhe FROM Kontinente
WHERE MaximaleHöhe >= ALL
(SELECT MaximaleHöhe
FROM Kontinente)

/*OK 1- OUTER JOIN */

SELECT Kunden.Name, Kunden.Vorname, ArtenDerLieferung.Typ, ArtenDerLieferung.Firma, ArtenDerLieferung.Dauer, Kunden.Telefonnummer, Sprachen.Name FROM Bestellungen
INNER JOIN ArtenDerLieferung ON Bestellungen.LieferungID = ArtenDerLieferung.ID
INNER JOIN Sprachen ON Sprachen.SpracheID = Bestellungen.SpracheID 
FULL OUTER JOIN Kunden ON Kunden.KundeID = Bestellungen.KundeID

/*EDITED 1- OR, 1- IN, 1- NOT IN, 3- WHERE */

SELECT Kunden.Name, Kunden.Vorname, Sprachen.Name AS SpracheName, Bestellungen.MitarbeiterID , Bestellungen.Platzierungstag, Bestellungen.Spezialität
FROM Kunden
INNER JOIN Bestellungen ON Bestellungen.KundeID = Kunden.KundeID
INNER JOIN Sprachen ON Sprachen.SpracheID = Bestellungen.SpracheID
WHERE
Bestellungen.SpracheID NOT IN
(SELECT SpracheID 
FROM Sprachen 
INNER JOIN Sprachfamilien ON Sprachfamilien.SprachfamilieID = Sprachen.SprachfamilieID
INNER JOIN Kontinente ON Sprachfamilien.KontinentID = Kontinente.KontinentID
WHERE Kontinente.Name = 'Europa')
OR
Bestellungen.MitarbeiterID IN
(Select MitarbeiterID 
FROM Mitarbeiter
WHERE Gender = 'F')