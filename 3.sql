USE BsAll
GO
OPEN SYMMETRIC KEY UserSymmetricKey DECRYPTION BY CERTIFICATE UserCertificate
UPDATE Users 
Set userPassword = ENCRYPTBYKEY(KEY_GUID('UserSymmetricKey'),CONVERT(varbinary(max),userPassword));
CLOSE SYMMETRIC KEY UserSymmetricKey;
GO
SELECT * FROM Users