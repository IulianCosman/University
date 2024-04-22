/* 1 */
CREATE TABLE Ta (
	idA INT PRIMARY KEY,
	a2 INT UNIQUE,
	a3 INT 
)

CREATE TABLE Tb (
	idB INT PRIMARY KEY,
	b2 INT,
	b3 INT
)

CREATE TABLE Tc (
	idC INT PRIMARY KEY,
	idA INT,
	idB INT

	FOREIGN KEY (idA) REFERENCES Ta(idA),
    FOREIGN KEY (idB) REFERENCES Tb(idB)
)


SELECT COUNT(*) AS Count_A
FROM Ta;

SELECT COUNT(*) AS Count_B
FROM Tb;

SELECT COUNT(*) AS Count_C
FROM Tc;


go

CREATE OR ALTER PROCEDURE populateTables
AS
BEGIN
	DECLARE @cnt INT;
	SET @cnt = 1;

	WHILE @cnt <= 10000
	BEGIN
		INSERT INTO Ta(idA, a2, a3)
		VALUES (@cnt, @cnt * 3, @cnt * 11);
		SET @cnt = @cnt + 1;
	END

	SET @cnt = 1;
	WHILE @cnt <= 3000
	BEGIN
		INSERT INTO Tb(idB, b2, b3)
		VALUES (@cnt, @cnt * 2, @cnt * 5);
		SET @cnt = @cnt + 1;
	END

	SET @cnt = 1;
	DECLARE @id_A INT = 1;
	DECLARE @id_B INT = 1;

	WHILE @cnt <= 30000
	BEGIN

		IF @id_A = 10001
		BEGIN
			SET @id_A = 1;
		END

		IF @id_B = 3001
		BEGIN
			SET @id_B = 1;
		END

		INSERT INTO Tc(idC, idA, idB)
		VALUES (@cnt, @id_A, @id_B);
		SET @cnt = @cnt + 1;
		SET @id_A = @id_A + 1;
		SET @id_B = @id_B + 1;
	END
END

EXEC populateTables

SELECT * FROM Tc
SELECT * FROM Ta
SELECT * FROM Tb

DROP TABLE Tc
DROP TABLE Ta
DROP TABLE Tb

/* 2a */

SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Ta')

SELECT a2 FROM Ta WHERE a2>35

SELECT * FROM Ta WHERE idA = 3

SELECT * FROM Ta WHERE a3<100

SELECT a2 FROM Ta 

/* 2b */

SELECT * FROM Ta WHERE a2<35

/* 2c */

SELECT b2 FROM Tb WHERE b2 = 12

CREATE NONCLUSTERED INDEX INDEX_b2 ON Tb(b2)


DROP INDEX INDEX_b2 ON Tb

SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Tb')

/* 2d */

SELECT idC FROM Tc
INNER JOIN Ta ON Tc.idA = Ta.idA
WHERE Tc.idA = 12

SELECT idC FROM Tc
INNER JOIN Tb ON Tc.idB = Tb.idB
WHERE Tc.idB = 12


CREATE NONCLUSTERED INDEX INDEX_a ON Tc(idA)

CREATE NONCLUSTERED INDEX INDEX_b ON Tc(idB)

DROP INDEX INDEX_a on Tc

DROP INDEX INDEX_b ON Tc
