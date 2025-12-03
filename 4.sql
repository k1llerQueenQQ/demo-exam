USE BsAll;
GO
OPEN SYMMETRIC KEY UserSymmetricKey
DECRYPTION BY CERTIFICATE UserCertificate;
SELECT 
    userName, 
    CAST(DECRYPTBYKEY(CONVERT(varbinary(max), userPassword)) AS VARCHAR(5)) as userPassword 
FROM Users;