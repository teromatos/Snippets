/*============================================================================
Original Blog Link: http://blog.sqlauthority.com/
(C) Pinal Dave http://blog.SQLAuthority.com
Like us on Facebook: http://facebook.com/SQLAuth
Follow us on Twitter: http://twitter.com/pinaldave
============================================================================*/

/* Create Database  */
USE master
GO
CREATE DATABASE EncryptTest
ON PRIMARY ( NAME = N'EncryptTest', FILENAME = N'C:\EncryptTest.mdf')
LOG ON ( NAME = N'EncryptTest_log', FILENAME = N'C:\EncryptTest_log.ldf')
GO

/* Create table and insert data in the table */
USE EncryptTest
GO
CREATE TABLE TestTable (FirstCol INT, SecondCol VARCHAR(50))
GO
INSERT INTO TestTable (FirstCol, SecondCol)
SELECT 1,'First'
UNION ALL
SELECT 2,'Second'
UNION ALL
SELECT 3,'Third'
UNION ALL
SELECT 4,'Fourth'
UNION ALL
SELECT 5,'Fifth'
GO
/* Check the content of the TestTable */
USE EncryptTest
GO
SELECT *
FROM TestTable
GO

/* Create Database Master Key */
USE EncryptTest
GO
CREATE MASTER KEY ENCRYPTION
BY PASSWORD = 'SQLAuthority'
GO

/* Create Encryption Certificate */
USE EncryptTest
GO
CREATE CERTIFICATE EncryptTestCert
WITH SUBJECT = 'SQLAuthority'
GO

/* Create Symmetric Key */
USE EncryptTest
GO
CREATE SYMMETRIC KEY TestTableKey
WITH ALGORITHM = TRIPLE_DES ENCRYPTION
BY CERTIFICATE EncryptTestCert
GO

/*  Encrypt Data using Key and Certificate
Add Columns which will hold the encrypted data in binary */
USE EncryptTest
GO
ALTER TABLE TestTable
ADD EncryptSecondCol VARBINARY(256)
GO

/* Update binary column with encrypted data created by certificate and key */
USE EncryptTest
GO
OPEN SYMMETRIC KEY TestTableKey DECRYPTION
BY CERTIFICATE EncryptTestCert
UPDATE TestTable
SET EncryptSecondCol = ENCRYPTBYKEY(KEY_GUID('TestTableKey'),SecondCol)
GO

/* DROP original column which was encrypted for protect the data */
USE EncryptTest
GO
ALTER TABLE TestTable
DROP COLUMN SecondCol
GO

/* Check the content of the TestTable */
USE EncryptTest
GO
SELECT *
FROM TestTable
GO

/* Decrypt the data of the SecondCol  */
USE EncryptTest
GO
OPEN SYMMETRIC KEY TestTableKey DECRYPTION
BY CERTIFICATE EncryptTestCert
SELECT CONVERT(VARCHAR(50),DECRYPTBYKEY(EncryptSecondCol)) AS DecryptSecondCol
FROM TestTable
GO

/* Clean up database  */
USE EncryptTest
GO
CLOSE SYMMETRIC KEY TestTableKey
GO
DROP SYMMETRIC KEY TestTableKey
GO
DROP CERTIFICATE EncryptTestCert
GO
DROP MASTER KEY
GO
USE [master]
GO
DROP DATABASE [EncryptTest]
GO

