SELECT 
    userName,
    CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('TEST', userPassword)) AS 'Расшифрованный пароль'
FROM Users;